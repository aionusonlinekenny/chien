<?php
include_once '../global/db.class.php';
$username=$_GET['openid'];
$token=$_GET['sign'];
if ($username != '' && $token != '') {
    $_SESSION['playuser'] = $username;
    $_SESSION['token'] = $token;
}
if($_SESSION['playuser']<>$username){
	$data=array("code"=>4,"msg"=>"error,校验错误1");
	exit(json_encode($data,320));
}
if($_SESSION['token']<>$token){
	$data=array("code"=>4,"msg"=>"error,校验错误2");
	exit(json_encode($data,320));
}
$row=$db->safe_query("SELECT * FROM `account` WHERE `username`=? AND `token`=? LIMIT 1", array($username,$token))->fetch(PDO::FETCH_ASSOC);
if($row['id']==''){
	$data=array("code"=>4,"msg"=>"error,请返回首页登陆");
}else{
if($row['lastserver']!='' && $row['lastserver'] != 0 && isset($quarr[$row['lastserver']])){
	$serverid=$row['lastserver'];
} elseif(isset($_GET['serverId']) && isset($quarr[$_GET['serverId']])){
	$serverid=$_GET['serverId'];
} else {
	$serverid=10000;
}
$time=time();
$userid=$row['id'];
$qu=$quarr[$serverid];
$data=array(
"msg"=>"Hoạt động thành công",
"openid"=>$username,
"channelUID"=>1,
"server"=>array(
"serverId"=>$qu['quid'],
"serverName"=>$qu['name'],
"serverIp"=>$qu['ip'],
"serverPort"=>$qu['port'],
"serverStatus"=>1,
"serverState"=>"open",
"showId"=>1,
"limitCreate"=>1
),
"code"=>1,
"loginTime"=>$time,
"white"=>0,
"sign"=>md5($row['id'].$time."0".$qu['key']),
"history"=>0,
"cdn"=>$qu['cdn'],
"needCreate"=>0,
"userId"=>$userid,
);	
$dbname=$qu['dbname'];
$row2=$db->safe_query("SELECT `userName` FROM `$dbname`.`tb_user` WHERE `userName`=? LIMIT 1", array($username))->fetch(PDO::FETCH_ASSOC);
$datetime = date('Y-m-d h:i:s');
if(!$row2 || $row2['userName']==""){
	$db->safe_query("INSERT INTO `$dbname`.`tb_user` (`userId`,`userName`,`token`,`channel`,`lastLoginTime`) VALUES (?,?,?,1,?)", array($userid,$username,$token,$datetime));
}else{
	$db->safe_query("UPDATE `$dbname`.`tb_user` SET `lastLoginTime`=? WHERE `userName`=? AND `token`=?", array($datetime,$username,$token));
}
}
exit(json_encode($data,320));
?>