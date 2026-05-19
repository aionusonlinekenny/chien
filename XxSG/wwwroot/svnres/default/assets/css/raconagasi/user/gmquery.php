<?php
include 'config.php';
if ($_POST) {
    $checknum = trim(poststr('checknum'));
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
    if ($checknum == $gmcode) {
        if ($quid >= 1 || $quid != '') {
            if ($uid != '') {
                if ($_POST['type']) {
                    $type = trim($_POST['type']);
                    switch ($type) {
						case 'notice':
						    $noticemsg = trim(poststr('noticemsg'));
                            if ($noticemsg== '') {
                                exit('Đại ca, anh vẫn chưa nói gì đâu!');
                            }
						    $cmd = 12;
                            $time = time();
                            $postdata = array("cmd" => $cmd, "type" => 0,"des"=>$noticemsg);
                            $result = get1($url, $postdata);
                            if ($result == '10001') {
                                exit('Đại ca nói chuyện thành công');
                            } else {
                                exit('Đại ca nói thất bại');
                            }
						break;
						case 'ban':
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
                                exit("〖" . $quname . "〗Không có nhân vật này.");
                            }
							$cmd = 6;
                            $time = time();
                            $postdata = array("cmd" => $cmd, "playerId" => $playerId,"ed"=>time()+64800*30,"flag"=>"0");
                            $result = get1($url, $postdata);
                            if ($result == '10001') {
                                exit('Thành công trong việc đưa người chơi『' . $uid . '』封号30天');
                            } else {
                                exit('封号失败');
                            }
						break;
						case 'unban':
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
                                exit("〖" . $quname . "〗Không có nhân vật này.");
                            }
							$cmd = 6;
                            $time = time();
                            $postdata = array("cmd" => $cmd, "playerId" => $playerId,"ed"=>time(),"flag"=>"0");
                            $result = get1($url, $postdata);
                            if ($result == '10001') {
                                exit('Thành công将玩家『' . $uid . '』解封');
                            } else {
                                exit('封号失败');
                            }
						break;
                        case 'charge':
                            $con = @mysql_connect($dbip, $dbuser, $dbpwd) or die(mysql_error());
                            mysql_query("set names 'utf8'");
                            mysql_select_db($dbname, $con);
                            $sql = "SELECT * FROM `tb_player` where `playerName` = '$uid' limit 1";
                            $result = mysql_query($sql, $con);
                            $row = mysql_fetch_array($result);
                            $playerId = $row['playerId'];
                            $userId = $row['userId'];
                            mysql_close($con);
                            if ($playerId == '') {
                                exit("〖" . $quname . "〗Không có nhân vật này.");
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
                                exit('Mục nạp tiền không tồn tại');
                            }
                            $chargenum = trim(poststr('chargenum'));
                            if ($chargenum == '' || $chargenum < 0 || $chargenum > 10) {
                                exit('Đại ca nạp thì nạp, đừng quá độc ác. Chờ máy phát nổ!');
                            }
                            $cmd = 5;
                            $orderNum = date('YmdHis') . md5(uniqid(microtime(true) . mt_rand()));
                            $time = time();
                            $sign = md5($playerId . $num . $time . $subject . $signkey);
                            $postdata = array("cmd" => $cmd, "playerId" => $playerId, "num" => $num, "orderNum" => $orderNum, "time" => $time, "sign" => $sign, "subject" => $subject);
							$x=0;
                            for ($i = 0;$i < $chargenum;$i++) {
                                $result=get($url, $postdata);
								if($result=='Thành công'){
									$x++;
								}
                            }
							if($x<$i){
								exit('Lưu ý: Cung cấp cho người chơi『' . $uid . '』Nạp tiền【' . $chargename . '】Thành công'.$x.' Lần');
							}else{
								exit('Thành công cho người chơi『' . $uid . '』Nạp tiền〖' . $x . '〗 Lần【' . $chargename . '】');
							}
                            
                        break;
                        case 'mail':
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
                                exit("〖" . $quname . "〗Không có nhân vật này.");
                            }
                            $title = trim(poststr('title'));
                            $content = trim(poststr('content'));
                            $mailid = trim(poststr('item'));
                            if ($mailid == '') {
                                exit('Vật phẩm ID sai lầm');
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
                                exit('Vật phẩm ID không tồn tại');
                            }
                            $mailnum = trim(poststr('num'));
                            if ($mailnum == '' || $mailnum < 0 || $mailnum > 2000000000) {
                                exit('Gửi đi số lượng sai lầm');
                            }
                            $cmd = 3;
                            $time = time();
                            $postdata = array("cmd" => $cmd, "mails" => json_encode(array(array("type" => 1, "sendId" => 0, "sendName" => "Thư GM", "title" => $title, "context" => $content, "rewards" => array(array("type" => $itemtype, "id" => $mailid, "num" => $mailnum)), "rules" => array("4" => (string)$playerId))), 320));
                            $result = get1($url, $postdata);
                            if ($result == '10001') {
                                exit('Thành công cho người chơi『' . $uid . '』Gửi đi【' . $itemname . '*' . $mailnum . '】');
                            } else {
                                exit('Gửi đi thất bại');
                            }
                        break;
                        case 'allmail':
                            $title = trim(poststr('title'));
                            $content = trim(poststr('content'));
                            $mailid = trim(poststr('item'));
                            if ($mailid == '') {
                                exit('Vật phẩm ID sai lầm');
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
                                exit('Vật phẩm ID không tồn tại');
                            }
                            $mailnum = trim(poststr('num'));
                            if ($mailnum == '' || $mailnum < 0 || $mailnum > 2000000000) {
                                exit('Gửi đi số lượng sai lầm');
                            }
                            $cmd = 3;
                            $time = time();
                            $postdata = array("cmd" => $cmd, "mails" => json_encode(array(array("type" => 1, "sendId" => 0, "sendName" => "Thư GM", "title" => $title, "context" => $content, "rewards" => array(array("type" => $itemtype, "id" => $mailid, "num" => $mailnum)), "rules" => array("1" => "0"))), 320));
                            $result = get1($url, $postdata);
                            if ($result == '10001') {
                                exit('Thành công gửi thư『Toàn Máy Chủ』【' . $itemname . '*' . $mailnum . '】');
                            } else {
                                exit('Gửi đi thất bại');
                            }
                        break;
                        case 'addczvip':
                            $pwd = trim(poststr('pwd'));
                            if ($pwd == '') {
                                exit('Mật khẩu được ủy quyền trong nền người chơi không thể trống');
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
                                $vipjson[$uid] = array('pwd' => $pwd, 'level' => 0, 'quid' => $quid);
                                file_put_contents($vipfile, json_encode($vipjson, 320));
                                exit('加入VIPThành công.');
                            } else {
                                exit('该角色名已经是VIP了.');
                            }
                        break;
                        case 'addvip':
                            $pwd = trim(poststr('pwd'));
                            if ($pwd == '') {
                                exit('玩家后台的授权密码不能为空');
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
                            if (!$vipjson[$uid] || intval($vipjson[$uid]['level'] == 0)) {
                                $vipjson[$uid] = array('pwd' => $pwd, 'level' => 1, 'quid' => $quid);
                                file_put_contents($vipfile, json_encode($vipjson, 320));
                                exit('加入或升级VIPThành công.');
                            } else {
                                exit('该角色名已经是VIP了.');
                            }
                        break;
                        case 'quxiaovip':
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
                            if ($vipjson[$uid]) {
                                unset($vipjson[$uid]);
                                file_put_contents($vipfile, json_encode($vipjson, 320));
                                exit('取消Thành công.');
                            } else {
                                exit('该角色名并未授权.');
                            }
                        break;
                        case 'editpwd':
                            $data = array("key" => $token, "time" => $time, "type" => 'queryrole', "roleid" => $uid, "port" => $port, "ip" => $ip);
                            $rest = get($url, $data);
                            if (strstr($rest, 'success') == false) {
                                exit('校验失败');
                            }
                            $pwd = trim(poststr('pwd'));
                            if ($pwd == '') {
                                exit('玩家后台的授权密码不能为空');
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
                            if ($vipjson[$uid]) {
                                $vipjson[$uid] = array('pwd' => $pwd, 'level' => $vipjson[$uid]['level'], 'quid' => $quid);
                                file_put_contents($vipfile, json_encode($vipjson, 320));
                                exit('修改Thành công.');
                            } else {
                                exit('Tên vai trò không được ủy quyền.');
                            }
                        break;
                        default:
                            exit('Hệ thống là bất thường, xin vui lòng thử lại!');
                        break;
                    }
                } else {
                    exit('Loại yêu cầu không tồn tại！');
                }
            } else {
                exit('Tên vai trò không chính xác');
            }
        } else {
            exit('Máy chủ không chính xác');
        }
    } else {
        exit('Mã GM không chính xác');
    }
} else {
    exit('Yêu cầu bất hợp pháp! Xin hãy tự trọng');
}
