<?php
include_once '../global/db.class.php';
$severs=array();
foreach($quarr as $key=>$val){
	if($val['hide']==false){
		if($val['opentime']<=time()){
			$sever=array(
			"serverId"=>$val["quid"],
			"serverName"=>$val['name'],
			"serverIp"=>$val['ip'],
			"serverPort"=>$val['port'],
			"sslPort"=>0,
			"hostName"=>"",
			"serverStatus"=>1,
			"serverState"=>"open",
			"showId"=>$val["quid"],
			"limitCreate"=>0);
	    array_push($severs,$sever);
		}
	}	
}
$data=array("msg"=>"ok","code"=>1,"servers"=>$severs);
exit(json_encode($data,320));//更-多-资-源-下-载-w-w-w-.-zg-y-m-w-.-c-o-m
 
?>