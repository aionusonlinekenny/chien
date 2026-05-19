<?php
error_reporting(0);
session_start();
date_default_timezone_set('PRC');
$gmcode='raconagasi';
$quarr = array (
 "1" => array (
  "host"=>"localhost",
  "dbname"=>"sanguo_game",
  "user"=>"root",
  "pwd"=>"EghgTJGqPmZ9RQiW",
  "name"=>"S1",
  "key"=>"5Jqxjo10Yl2ElQCwJm",
  "url"=>"http://localhost",
  "hidde"=>false,
  ),
 "2" => array (
  "host"=>"localhost",
  "dbname"=>"sanguo_game2",
  "user"=>"root",
  "pwd"=>"EghgTJGqPmZ9RQiW",
  "name"=>"S2",
  "key"=>"5Jqxjo10Yl2ElQCwJm",
  "url"=>"http://localhost",
  "hidde"=>true,
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
		print "Illegal Activity!";
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
function poststr($str){
 if(isset($_POST[$str])){
  return $_POST[$str];
 }
die("The parameters you sent are illegal!");
}
function get($url,$postdata){
		$ch = curl_init(); 
		curl_setopt($ch, CURLOPT_URL, $url.'?'.http_build_query($postdata)); 
		curl_setopt($ch, CURLOPT_HEADER, 0); 
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE); 
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE); 
		curl_setopt($ch, CURLOPT_TIMEOUT, 10);
		$output = curl_exec($ch);
		$errorCode = curl_errno($ch);
		curl_close($ch);
		if(0 !== $errorCode){
			return 'Failure';
		}
		$return=json_decode($output,true);
		if($return["errorCode"]=='0'){
			return 'Success';
		}else{
			return 'Failure:'.$return["errorCode"];
		}
	}
function get1($url,$postdata){
		$ch = curl_init(); 
		curl_setopt($ch, CURLOPT_URL, $url.'?'.http_build_query($postdata)); 
		curl_setopt($ch, CURLOPT_HEADER, 0); 
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE); 
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE); 
		curl_setopt($ch, CURLOPT_TIMEOUT, 10);
		$output = curl_exec($ch);
		$errorCode = curl_errno($ch);
		curl_close($ch);
		return $output;
	}//更多手游下载 w ww.z gym w.com
?>