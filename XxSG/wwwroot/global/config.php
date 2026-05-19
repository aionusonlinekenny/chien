<?php
error_reporting(0);
session_start();
ini_set('date.timezone','Asia/Shanghai');
header("Content-type: text/html; charset=utf8");

define("DBIP","localhost");
define("DBUSER","root");
define("DBPWD","EghgTJGqPmZ9RQiW");
define("DBPPORT","3306");
define("DBNAME","account");
define("WEBNAME","Thánh Chiến Chibi");//站点名称
$quarr=array(
"10000"=>array(
"dbname"=>"sanguo_game",
"dbip"=>DBIP,
"dbuser"=>DBUSER,
"dbport"=>DBPPORT,
"name"=>"Sv 1",
"ip"=>"127.0.0.1",
"port"=>19101,
"quid"=>10000,
"key"=>"5Jqxjo10Yl2ElQCwJm",
"cdn"=>"http://127.0.0.1:81/",
"hide"=>false,
"opentime"=>1685577600
),
"10001"=>array(
"dbname"=>"sanguo_game2",
"dbip"=>DBIP,
"dbuser"=>DBUSER,
"dbport"=>DBPPORT,
"name"=>"Sv 2",
"ip"=>"127.0.0.1",
"port"=>19102,
"quid"=>10001,
"key"=>"5Jqxjo10Yl2ElQCwJm",
"cdn"=>"http://127.0.0.1:81/",
"hide"=>false,
"opentime"=>1685577600
),
"10002"=>array(
"dbname"=>"sanguo_game3",
"dbip"=>DBIP,
"dbuser"=>DBUSER,
"dbport"=>DBPPORT,
"name"=>"Sv 3",
"ip"=>"127.0.0.1",
"port"=>19103,
"quid"=>10002,
"key"=>"5Jqxjo10Yl2ElQCwJm",
"cdn"=>"http://127.0.0.1:81/",
"hide"=>false,
"opentime"=>1685577600
),
"10003"=>array(
"dbname"=>"sanguo_game4",
"dbip"=>DBIP,
"dbuser"=>DBUSER,
"dbport"=>DBPPORT,
"name"=>"Sv 4",
"ip"=>"127.0.0.1",
"port"=>19104,
"quid"=>10003,
"key"=>"5Jqxjo10Yl2ElQCwJm",
"cdn"=>"http://127.0.0.1:81/",
"hide"=>false,
"opentime"=>1685577600
),
"10004"=>array(
"dbname"=>"sanguo_game5",
"dbip"=>DBIP,
"dbuser"=>DBUSER,
"dbport"=>DBPPORT,
"name"=>"Sv 5",
"ip"=>"127.0.0.1",
"port"=>19105,
"quid"=>10004,
"key"=>"5Jqxjo10Yl2ElQCwJm",
"cdn"=>"http://127.0.0.1:81/",
"hide"=>false,
"opentime"=>1593160806
),
"10005"=>array(
"dbname"=>"sanguo_game6",
"dbip"=>DBIP,
"dbuser"=>DBUSER,
"dbport"=>DBPPORT,
"name"=>"Sv 6",
"ip"=>"127.0.0.1",
"port"=>19106,
"quid"=>10005,
"key"=>"5Jqxjo10Yl2ElQCwJm",
"cdn"=>"http://127.0.0.1:81/",
"hide"=>false,
"opentime"=>1593160806
),
"10006"=>array(
"dbname"=>"sanguo_game7",
"dbip"=>DBIP,
"dbuser"=>DBUSER,
"dbport"=>DBPPORT,
"name"=>"Sv 7 (New)",
"ip"=>"127.0.0.1",
"port"=>19107,
"quid"=>10006,
"key"=>"5Jqxjo10Yl2ElQCwJm",
"cdn"=>"http://127.0.0.1:81/",
"hide"=>false,
"opentime"=>1593160806
)

);
$getfilter="'|(and|or)\\b.+?(>|<|=|in|like)|\\/\\*.+?\\*\\/|<\\s*script\\b|\\bEXEC\\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\\s+(TABLE|DATABASE)";
$postfilter="\\b(and|or)\\b.{1,6}?(=|>|<|\\bin\\b|\\blike\\b)|\\/\\*.+?\\*\\/|<\\s*script\\b|\\bEXEC\\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\\s+(TABLE|DATABASE)";
$cookiefilter="\\b(and|or)\\b.{1,6}?(=|>|<|\\bin\\b|\\blike\\b)|\\/\\*.+?\\*\\/|<\\s*script\\b|\\bEXEC\\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\\s+(TABLE|DATABASE)";
function StopAttack($StrFiltKey,$StrFiltValue,$ArrFiltReq){
	if(is_array($StrFiltValue)){
		$StrFiltValue=implode($StrFiltValue);
	}
	if (preg_match("/".$ArrFiltReq."/is",$StrFiltValue)==1){
		print "非法操作!";
		exit();
	}
}
foreach($_GET as $key=>$value){
	StopAttack($key,$value,$getfilter);
}
foreach($_POST as $key=>$value){
	StopAttack($key,$value,$postfilter);
}
foreach($_COOKIE as $key=>$value){
	StopAttack($key,$value,$cookiefilter);
}
include_once dirname(__FILE__).'/function.php';
?>