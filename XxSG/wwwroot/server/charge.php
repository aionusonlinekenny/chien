<?php
// ══════════════════════════════════════════════════════
//  payServer endpoint — được game client gọi khi mua KNB
//  GET: money, openid, serverID, serverName, playerId,
//       roleName, subject (dạng "2_2000 Kim Cương")
// ══════════════════════════════════════════════════════
include_once '../global/db.class.php';

header('Content-Type: application/json; charset=utf-8');
error_reporting(0);

function jsonOut($arr) { exit(json_encode($arr, JSON_UNESCAPED_UNICODE)); }

// ── Đọc payment settings ────────────────────────────
$settings_file = __DIR__ . '/../pay/settings.json';
$settings = file_exists($settings_file)
    ? (json_decode(file_get_contents($settings_file), true) ?: [])
    : [];
$payEnabled = (bool)($settings['enabled'] ?? true);
$payMethod  = $settings['method'] ?? 'paypal';
$isFree     = !$payEnabled || $payMethod === 'free';

// ── Nhận params ─────────────────────────────────────
$openid    = preg_replace('/[^A-Za-z0-9_]/', '', $_GET['openid'] ?? '');
$serverID  = intval($_GET['serverID'] ?? 10000);
$playerId  = preg_replace('/[^0-9]/', '', $_GET['playerId'] ?? '');
$money     = intval($_GET['money'] ?? 0);    // rmb value
$subjectRaw = $_GET['subject'] ?? '';        // "2_2000 Kim Cương"
$subjectId = intval(explode('_', $subjectRaw)[0]);  // lấy số ID

// ── Kiểm tra session / identity ─────────────────────
if (!$openid || !$playerId || !$subjectId) {
    jsonOut(['code' => -1, 'msg' => 'Thiếu thông tin']);
}

// Xác minh user có tồn tại trong DB
$user = $db->safe_query("SELECT id FROM `account` WHERE username=? LIMIT 1", [$openid])->fetch(PDO::FETCH_ASSOC);
if (!$user) {
    jsonOut(['code' => -1, 'msg' => 'Tài khoản không hợp lệ']);
}

// ── Lấy sign key theo server ─────────────────────────
$signkey = $quarr[$serverID]['key'] ?? '5Jqxjo10Yl2ElQCwJm';
$gameUrl = 'http://127.0.0.1:' . ($serverID == 10000 ? 19201 : 19202) . '/';

// ── Load packages config (needed for both modes) ─────
require_once __DIR__ . '/../pay/config.php';
if (!isset($packages[$subjectId])) {
    jsonOut(['code' => -1, 'msg' => 'Gói nạp không tồn tại: ' . $subjectId]);
}
$pkg = $packages[$subjectId];
// Java validates that num == chargeBean.rmb exactly
$rmb = $pkg['rmb'];

// ── FREE MODE — cộng KNB ngay không qua thanh toán ──
if ($isFree) {
    $orderNum = date('YmdHis') . substr(md5(uniqid(microtime(true) . mt_rand()), false), 0, 8);
    $time     = time();
    $sign     = md5($playerId . $rmb . $time . $subjectId . $signkey);

    $params = http_build_query([
        'cmd'      => 5,
        'playerId' => $playerId,
        'num'      => $rmb,
        'orderNum' => $orderNum,
        'time'     => $time,
        'sign'     => $sign,
        'subject'  => $subjectId,
    ]);

    $ch = curl_init($gameUrl . '?' . $params);
    curl_setopt_array($ch, [CURLOPT_RETURNTRANSFER => true, CURLOPT_TIMEOUT => 10]);
    $raw = curl_exec($ch);
    $err = curl_errno($ch);
    curl_close($ch);

    $decoded = json_decode($raw, true);
    if (!$err && $decoded !== null && isset($decoded['errorCode']) && $decoded['errorCode'] == 0) {
        jsonOut(['code' => 0, 'msg' => 'Đã nhận thành công! Kim Cương đang được cộng vào tài khoản.']);
    }

    jsonOut(['code' => -2, 'msg' => 'Server game chưa phản hồi, thử lại sau. (' . ($raw ?: 'timeout') . ')']);
}

// ── PAYPAL MODE — tạo đơn hàng trả về payUrl ────────
require_once __DIR__ . '/../pay/db.php';

$orderNum = date('YmdHis') . substr(md5(uniqid(microtime(true) . mt_rand()), false), 0, 8);
pay_create_order($orderNum, $openid, $playerId, $serverID, $subjectId,
                 $pkg['rmb'], $pkg['knb'], $pkg['usd']);

// Trả về code=1 kèm payUrl để game.php mở iframe PayPal
jsonOut([
    'code'     => 1,
    'orderNo'  => $orderNum,
    'money'    => $pkg['rmb'],
    'payUrl'   => SITE_URL . '/pay/?order=' . $orderNum,
    'serverID' => $serverID,
    'roleName' => htmlspecialchars($_GET['roleName'] ?? ''),
]);
