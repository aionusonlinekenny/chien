<?php
$file_path = "item.json";
$str = file_get_contents($file_path);
$data=json_decode($str,true);
foreach($data as $key=>$val){
	echo $val['id'].';'.$val['name'].';'.$val['itemType'].'<br/>';
}
?>