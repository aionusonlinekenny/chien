<?php
include 'config.php';

if (!$_POST) {
    exit('Yêu cầu không hợp lệ!');
}

$checknum = trim(poststr('checknum'));
if ($checknum !== $gmcode) {
    exit('Mã GM không đúng!');
}

$quid = trim(poststr('qu'));
if (!isset($quarr[$quid])) {
    exit('Máy chủ không hợp lệ!');
}
$qu      = $quarr[$quid];
$dbip    = $qu['host'];
$dbname  = $qu['dbname'];
$dbuser  = $qu['user'];
$dbpwd   = $qu['pwd'];
$quname  = $qu['name'];
$signkey = $qu['key'];
$url     = $qu['url'];

$type = isset($_POST['type']) ? trim($_POST['type']) : '';
if ($type === '') {
    exit('Loại yêu cầu không tồn tại!');
}

// Helper: get playerId from playerName via DB
function getPlayerId($dbip, $dbuser, $dbpwd, $dbname, $playerName) {
    $con = new mysqli($dbip, $dbuser, $dbpwd, $dbname);
    if ($con->connect_error) {
        return array('error' => 'Không kết nối được DB: ' . $con->connect_error);
    }
    $con->set_charset('utf8');
    $stmt = $con->prepare("SELECT `playerId`,`userId` FROM `tb_player` WHERE `playerName`=? LIMIT 1");
    $stmt->bind_param('s', $playerName);
    $stmt->execute();
    $stmt->bind_result($playerId, $userId);
    $stmt->fetch();
    $stmt->close();
    $con->close();
    if (empty($playerId)) {
        return array('error' => "Không tìm thấy nhân vật «{$playerName}» trong [{$dbname}]");
    }
    return array('playerId' => $playerId, 'userId' => $userId);
}

$uid = trim(poststr('uid'));

switch ($type) {

    // ── Notice (toàn server) ──────────────────────────────────────
    case 'notice':
        $noticemsg = trim(poststr('noticemsg'));
        if ($noticemsg === '') exit('Nội dung thông báo không được trống!');
        $postdata = array("cmd" => 12, "type" => 0, "des" => $noticemsg);
        $result   = gmget1($url, $postdata);
        exit($result === '10001' ? '✅ Gửi thông báo thành công!' : '❌ Gửi thất bại: ' . $result);

    // ── Ban ──────────────────────────────────────────────────────
    case 'ban':
        if ($uid === '') exit('Tên nhân vật không được trống!');
        $r = getPlayerId($dbip, $dbuser, $dbpwd, $dbname, $uid);
        if (isset($r['error'])) exit('❌ ' . $r['error']);
        $postdata = array("cmd" => 6, "playerId" => $r['playerId'], "ed" => time() + 64800 * 30, "flag" => "0");
        $result   = gmget1($url, $postdata);
        exit($result === '10001' ? "✅ Đã cấm «{$uid}» 30 ngày!" : '❌ Cấm thất bại: ' . $result);

    // ── Unban ────────────────────────────────────────────────────
    case 'unban':
        if ($uid === '') exit('Tên nhân vật không được trống!');
        $r = getPlayerId($dbip, $dbuser, $dbpwd, $dbname, $uid);
        if (isset($r['error'])) exit('❌ ' . $r['error']);
        $postdata = array("cmd" => 6, "playerId" => $r['playerId'], "ed" => time(), "flag" => "0");
        $result   = gmget1($url, $postdata);
        exit($result === '10001' ? "✅ Đã bỏ cấm «{$uid}»!" : '❌ Bỏ cấm thất bại: ' . $result);

    // ── Charge (nạp tiền cho người chơi) ────────────────────────
    case 'charge':
        if ($uid === '') exit('Tên nhân vật không được trống!');
        $r = getPlayerId($dbip, $dbuser, $dbpwd, $dbname, $uid);
        if (isset($r['error'])) exit('❌ ' . $r['error']);
        $playerId   = $r['playerId'];

        $chargetype = trim(poststr('chargetype'));
        $chargenum  = intval(trim(poststr('chargenum')));
        if ($chargenum < 1 || $chargenum > 10) exit('Số lần nạp phải từ 1-10!');

        $file_path = "../charge.json";
        $data      = json_decode(file_get_contents($file_path), true);
        if (!isset($data[$chargetype])) exit('Gói nạp không tồn tại!');
        $chargename = $data[$chargetype]['name'];
        $num        = $data[$chargetype]['rmb'];
        $subject    = $data[$chargetype]['id'];

        $success = 0;
        for ($i = 0; $i < $chargenum; $i++) {
            $orderNum = date('YmdHis') . substr(md5(uniqid(microtime(true) . mt_rand())), 0, 8);
            $time     = time();
            $sign     = md5($playerId . $num . $time . $subject . $signkey);
            $postdata = array("cmd" => 5, "playerId" => $playerId, "num" => $num,
                "orderNum" => $orderNum, "time" => $time, "sign" => $sign, "subject" => $subject);
            $result = gmget($url, $postdata);
            if ($result === 'OK') $success++;
        }
        exit($success > 0
            ? "✅ Nạp «{$chargename}» × {$success}/{$chargenum} lần cho «{$uid}» thành công!"
            : "❌ Nạp thất bại (0/{$chargenum}). Kiểm tra server Java có đang chạy không?"
        );

    // ── Mail (gửi vật phẩm cho 1 người chơi) ───────────────────
    case 'mail':
        if ($uid === '') exit('Tên nhân vật không được trống!');
        $r = getPlayerId($dbip, $dbuser, $dbpwd, $dbname, $uid);
        if (isset($r['error'])) exit('❌ ' . $r['error']);
        $playerId = $r['playerId'];

        $title   = trim(poststr('title'))   ?: 'Thư GM';
        $content = trim(poststr('content')) ?: 'Chúc mừng!';
        $mailid  = trim(poststr('item'));
        $mailnum = intval(trim(poststr('num')));
        if ($mailid === '') exit('Chưa chọn vật phẩm!');
        if ($mailnum < 1 || $mailnum > 2000000000) exit('Số lượng không hợp lệ!');

        $find = false; $itemtype = ''; $itemname = '';
        $file = fopen("../item.txt", "r");
        while (!feof($file)) {
            $txts = explode(';', fgets($file));
            if (trim($txts[0]) == $mailid) {
                $find = true; $itemtype = trim($txts[2]); $itemname = trim($txts[1]); break;
            }
        }
        fclose($file);
        if (!$find) exit('Vật phẩm ID không tồn tại!');

        $mails    = array(array("type" => 1, "sendId" => 0, "sendName" => "Thư GM",
            "title" => $title, "context" => $content,
            "rewards" => array(array("type" => $itemtype, "id" => $mailid, "num" => $mailnum)),
            "rules"   => array("4" => (string) $playerId)));
        $postdata = array("cmd" => 3, "mails" => json_encode($mails, JSON_UNESCAPED_UNICODE));
        $result   = gmget1($url, $postdata);
        exit($result === '10001'
            ? "✅ Đã gửi [{$itemname} × {$mailnum}] cho «{$uid}»!"
            : '❌ Gửi thất bại: ' . $result);

    // ── Mail toàn server ─────────────────────────────────────────
    case 'allmail':
        $title   = trim(poststr('title'))   ?: 'Thư GM';
        $content = trim(poststr('content')) ?: 'Chúc mừng!';
        $mailid  = trim(poststr('item'));
        $mailnum = intval(trim(poststr('num')));
        if ($mailid === '') exit('Chưa chọn vật phẩm!');
        if ($mailnum < 1 || $mailnum > 2000000000) exit('Số lượng không hợp lệ!');

        $find = false; $itemtype = ''; $itemname = '';
        $file = fopen("../item.txt", "r");
        while (!feof($file)) {
            $txts = explode(';', fgets($file));
            if (trim($txts[0]) == $mailid) {
                $find = true; $itemtype = trim($txts[2]); $itemname = trim($txts[1]); break;
            }
        }
        fclose($file);
        if (!$find) exit('Vật phẩm ID không tồn tại!');

        $mails    = array(array("type" => 1, "sendId" => 0, "sendName" => "Thư GM",
            "title" => $title, "context" => $content,
            "rewards" => array(array("type" => $itemtype, "id" => $mailid, "num" => $mailnum)),
            "rules"   => array("1" => "0")));
        $postdata = array("cmd" => 3, "mails" => json_encode($mails, JSON_UNESCAPED_UNICODE));
        $result   = gmget1($url, $postdata);
        exit($result === '10001'
            ? "✅ Đã gửi [{$itemname} × {$mailnum}] toàn server [{$quname}]!"
            : '❌ Gửi thất bại: ' . $result);

    default:
        exit('Loại yêu cầu không hợp lệ!');
}
?>
