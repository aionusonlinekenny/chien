<?php
include 'config.php';
if ($_SESSION['lasttime'] == '') {
    $_SESSION['lasttime'] = time();
} else {
    if (time() - $_SESSION['lasttime'] < 5) {
        exit('刷太快了');
    } else {
        $_SESSION['lasttime'] = time();
    }
}
if ($_POST) {
    $quid = trim(poststr('qu'));
    $qu = $quarr[$quid];
    $uid = trim(poststr('uid'));
    $dbip = $qu['host'];
    $dbname = $qu['dbname'];
    $dbuser = $qu['user'];
    $dbpwd = $qu['pwd'];
    $quname = $qu['name'];
	$signkey = $qu['key'];
    $url = $qu['url'];
    $pwd = trim(poststr('pwd'));
	
    if ($quid >= 1) {
        if ($uid != '') {
            if ($_POST['type']) {
                $type = trim($_POST['type']);
                $pswd = trim($_POST['pswd']);
                if ($pwd == '') {
                    exit('授权密码不能为空0');
                }
                $vipfile = 'Q76891828-' . $quid . '.json';
                $fp = fopen($vipfile, "a+");
                if (filesize($vipfile) > 0) {
                    $str = fread($fp, filesize($vipfile));
                    fclose($fp);
                    $vipjson = json_decode($str, true);
                    if ($vipjson == null) {
                        $vipjson = array();
                    }
                } else {
                    $vipjson = array();
                }
                if (!$vipjson[$uid]) {
                    exit('你没有VIP权限.');
                } elseif ($vipjson[$uid]['pwd'] != $pwd) {
                    exit('用户密码不匹配.');
                }
                if ($vipjson[$uid]['quid'] != $quid) {
                    exit('授权用户与当前选择大区不匹配.');
                }
                $viplevel = intval($vipjson[$uid]['level']);
                switch ($type) {
                    case 'charge':
					$con = @mysql_connect($dbip, $dbuser, $dbpwd) or die(mysql_error());
                            mysql_query("set names 'utf8'");
                            mysql_select_db($dbname, $con);
                            $sql = "SELECT * FROM `tb_player` where  `playerName` = '$uid' limit 1";
                            $result = mysql_query($sql, $con);
                            $row = mysql_fetch_array($result);
                            $playerId = $row['playerId'];
                            $userId = $row['userId'];
							
                            mysql_close($con);
                            if ($playerId == '') {
                                exit("〖" . $quname . "〗中无该角色。");
                            }
                            $chargetype = trim(poststr('chargetype'));
                            $find = false;
                            $file_path = "../charge.json";
                            $str = file_get_contents($file_path);
                            $data = json_decode($str, true);
                            foreach ($data as $key => $val) {
                                if ($key == $chargetype) {
                                    $find = true;
                                    $chargename = $val['name'];
                                    $num = $val['rmb'];
                                    $subject = $val['id'];
                                    break;
                                }
                            }
                            if ($find == false) {
                                exit('充值项不存在');
                            }
							 $chargenum = trim(poststr('chargenum'));
                            if ($chargenum == '' || $chargenum < 0 || $chargenum > 10) {
                                exit('大哥充就充，别太狠。等下机器爆炸了！');
                            }
							file_put_contents('log.txt',$chargenum, FILE_APPEND);
                            $cmd = 5;
                            $orderNum = date('YmdHis') . md5(uniqid(microtime(true) . mt_rand()));
                            $time = time();
                            $sign = md5($playerId . $num . $time . $subject . $signkey);
                            $postdata = array("cmd" => $cmd, "playerId" => $playerId, "num" => $num, "orderNum" => $orderNum, "time" => $time, "sign" => $sign, "subject" => $subject);
							$x=0;
                            for ($i = 0;$i < $chargenum;$i++) {
                                $result=get($url, $postdata);
								if($result=='成功'){
									$x++;
								}
                            }
							if($x<$i){
								exit('注意：给玩家『' . $uid . '』充值【' . $chargename . '】成功'.$x.'次');
							}else{
								exit('成功给玩家『' . $uid . '』充值〖' . $x . '〗次【' . $chargename . '】');
							}
                    break;
                    case 'daoju':
                        if ($viplevel < 1) {
                            exit('VIP权限不足');
                        }
                        $con = @mysql_connect($dbip, $dbuser, $dbpwd) or die(mysql_error());
                            mysql_query("set names 'utf8'");
                            mysql_select_db($dbname, $con);
                            $sql = "SELECT * FROM `tb_player` where  `playerName` = '$uid' limit 1";
                            $result = mysql_query($sql, $con);
                            $row = mysql_fetch_array($result);
                            $playerId = $row['playerId'];
                            $userId = $row['userId'];
                            mysql_close($con);
                            if ($playerId == '') {
                                exit("〖" . $quname . "〗中无该角色。");
                            }
                            $title = trim(poststr('title'));
                            $content = trim(poststr('content'));
                            $mailid = trim(poststr('item'));
                            if ($mailid == '') {
                                exit('物品ID错误');
                            }
                            $find = false;
                            $file = fopen("../item.txt", "r");
                            while (!feof($file)) {
                                $line = fgets($file);
                                $txts = explode(';', $line);
                                if ($txts[0] == $mailid) {
                                    $find = true;
                                    $itemtype = trim($txts[2]);
                                    $itemname = trim($txts[1]);
                                    break;
                                }
                            }
                            fclose($file);
                            if ($find == false) {
                                exit('物品ID不存在');
                            }
                            $mailnum = trim(poststr('num'));
                            if ($mailnum == '' || $mailnum < 0 || $mailnum > 2000000000) {
                                exit('发送数量错误');
                            }
                            $cmd = 3;
                            $time = time();
                            $postdata = array("cmd" => $cmd, "mails" => json_encode(array(array("type" => 1, "sendId" => 0, "sendName" => "系统邮件", "title" => $title, "context" => $content, "rewards" => array(array("type" => $itemtype, "id" => $mailid, "num" => $mailnum)), "rules" => array("4" => (string)$playerId))), 320));
                            $result = get1($url, $postdata);
                            if ($result == '10001') {
                                exit('成功给玩家『' . $uid . '』发送了【' . $itemname . '*' . $mailnum . '】');
                            } else {
                                exit('发送失败');
                            }
                    break;
                    default:
                        exit('系统异常，请重试!');
                    break;
                }
            } else {
                exit('请求类型不存在！');
            }
        } else {
            exit('角色名错误');
        }
    } else {
        exit('区号错误');
    }
} else {
    exit('非法请求!请自重');
}
