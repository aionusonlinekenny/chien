<?php
// ══════════════════════════════════════════════════════
//  Bước 1: Tạo PayPal order — trả về paypalOrderId
//  POST: subject, username, serverId
// ══════════════════════════════════════════════════════
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/paypal.php';
require_once __DIR__ . '/db.php';

header('Content-Type: application/json; charset=utf-8');
error_reporting(0);

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['error' => 'Invalid request']); exit;
}

if (session_status() === PHP_SESSION_NONE) session_start();

$username = trim($_POST['username'] ?? '');
$subject  = intval($_POST['subject']  ?? 0);
$serverId = intval($_POST['serverId'] ?? 10000);

// Xác minh session khớp với username (bảo mật)
$sessionUser = $_SESSION['playuser'] ?? '';
if (!$sessionUser || $sessionUser !== $username) {
    echo json_encode(['error' => 'Session không hợp lệ']); exit;
}

if (!isset($packages[$subject])) {
    echo json_encode(['error' => 'Gói nạp không tồn tại']); exit;
}
$pkg = $packages[$subject];

// Lấy playerId
$playerId = pay_get_player_id($serverId, $username);
if (!$playerId) {
    echo json_encode(['error' => 'Không tìm thấy nhân vật']); exit;
}

// Tạo orderNum nội bộ
$orderNum = date('YmdHis') . substr(md5(uniqid(microtime(true) . mt_rand()), false), 0, 8);

try {
    // Tạo PayPal order
    $res = paypal_create_order(
        $pkg['usd'],
        $pkg['name'] . ' — Thánh Chiến Chibi',
        $orderNum
    );

    if ($res['code'] !== 201 || empty($res['body']['id'])) {
        throw new Exception('PayPal tạo đơn thất bại: ' . json_encode($res['body']));
    }

    $paypalOrderId = $res['body']['id'];

    // Lưu vào DB
    pay_create_order($orderNum, $username, $playerId, $serverId, $subject,
                     $pkg['rmb'], $pkg['knb'], $pkg['usd']);
    pay_set_paypal_id($orderNum, $paypalOrderId);

    echo json_encode(['paypalOrderId' => $paypalOrderId]);

} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
