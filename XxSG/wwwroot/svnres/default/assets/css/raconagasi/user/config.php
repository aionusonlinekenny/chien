<?php
error_reporting(0);
session_start();
date_default_timezone_set('Asia/Ho_Chi_Minh');
$gmcode = 'raconagasi';
$quarr = array(
    "1" => array(
        "host"   => "localhost",
        "dbname" => "sanguo_game",
        "user"   => "root",
        "pwd"    => "",
        "name"   => "S1",
        "key"    => "5Jqxjo10Yl2ElQCwJm",
        "url"    => "http://127.0.0.1:19201/",
        "hidde"  => false,
    ),
    "2" => array(
        "host"   => "localhost",
        "dbname" => "sanguo_game2",
        "user"   => "root",
        "pwd"    => "",
        "name"   => "S2",
        "key"    => "5Jqxjo10Yl2ElQCwJm",
        "url"    => "http://127.0.0.1:19202/",
        "hidde"  => false,
    ),
);

function poststr($str) {
    if (isset($_POST[$str])) {
        return $_POST[$str];
    }
    die("Tham số không hợp lệ!");
}

function gmget($url, $postdata) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url . '?' . http_build_query($postdata));
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    $output    = curl_exec($ch);
    $errorCode = curl_errno($ch);
    curl_close($ch);
    if ($errorCode !== 0) {
        return 'CURL_ERROR:' . $errorCode;
    }
    $return = json_decode($output, true);
    if (isset($return["errorCode"]) && $return["errorCode"] == 0) {
        return 'OK';
    }
    return 'FAIL:' . ($return["errorCode"] ?? $output);
}

function gmget1($url, $postdata) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url . '?' . http_build_query($postdata));
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 15);
    $output    = curl_exec($ch);
    $errorCode = curl_errno($ch);
    curl_close($ch);
    if ($errorCode !== 0) {
        return 'CURL_ERROR:' . $errorCode;
    }
    return trim($output);
}
?>
