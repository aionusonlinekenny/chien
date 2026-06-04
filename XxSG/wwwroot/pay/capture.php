<?php
// ══════════════════════════════════════════════════════
//  Bước 2: Xác minh PayPal + cộng KNB cho player
//  POST: paypalOrderId
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
$sessionUser = $_SESSION['playuser'] ?? '';

$paypalOrderId = trim($_POST['paypalOrderId'] ?? '');
if (!$paypalOrderId) {
    echo json_encode(['error' => 'Thiếu paypalOrderId']); exit;
}

try {
    // Lấy đơn hàng nội bộ
    $order = pay_get_by_paypal($paypalOrderId);
    if (!$order) {
        throw new Exception('Không tìm thấy đơn hàng');
    }

    // Bảo mật: chỉ cho phép user của session xử lý
    if ($sessionUser && $order['username'] !== $sessionUser) {
        throw new Exception('Không có quyền xử lý đơn này');
    }

    // Nếu đã xử lý rồi thì trả kết quả luôn
    if ($order['status'] == 1) {
        echo json_encode(['success' => true, 'knb' => $order['knb'], 'note' => 'already_paid']); exit;
    }

    // 1. Capture thanh toán với PayPal
    $res = paypal_capture_order($paypalOrderId);
    if ($res['code'] !== 201) {
        pay_mark_failed($paypalOrderId);
        throw new Exception('PayPal capture thất bại: ' . json_encode($res['body']));
    }

    $captureStatus = $res['body']['status'] ?? '';
    if ($captureStatus !== 'COMPLETED') {
        pay_mark_failed($paypalOrderId);
        throw new Exception('Trạng thái PayPal không hợp lệ: ' . $captureStatus);
    }

    // Xác minh số tiền khớp
    $capturedAmount = $res['body']['purchase_units'][0]['payments']['captures'][0]['amount']['value'] ?? '0';
    $pkg = $packages[$order['subject']] ?? null;
    if (!$pkg || $capturedAmount != $pkg['usd']) {
        pay_mark_failed($paypalOrderId);
        throw new Exception("Số tiền không khớp: capture={$capturedAmount} expected={$pkg['usd']}");
    }

    // 2. Dùng atomic update để chặn double-credit
    $updated = pay_mark_paid($paypalOrderId);
    if (!$updated) {
        // Đã được xử lý bởi request khác rồi
        echo json_encode(['success' => true, 'knb' => $order['knb'], 'note' => 'already_paid']); exit;
    }

    // 3. Gọi Java server cmd=5 để cộng KNB
    $result = credit_knb_to_player($order, $gameServers);
    if (!$result['ok']) {
        // Thanh toán đã thành công nhưng cộng KNB thất bại → log để xử lý thủ công
        error_log("[PAY ERROR] credit_fail paypalOrderId={$paypalOrderId} player={$order['playerId']} err={$result['msg']}");
        echo json_encode([
            'success' => true,
            'knb'     => $order['knb'],
            'note'    => 'paid_but_credit_delayed',
            'msg'     => 'Thanh toán thành công! Kim Cương sẽ được cộng trong vài phút. Nếu chờ quá lâu hãy liên hệ hỗ trợ với mã: ' . $paypalOrderId
        ]); exit;
    }

    echo json_encode(['success' => true, 'knb' => $order['knb']]);

} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}

// ── Gọi Java cmd=5 ────────────────────────────────────
function credit_knb_to_player($order, $gameServers) {
    $url      = $gameServers[$order['serverId']] ?? null;
    if (!$url) return ['ok' => false, 'msg' => 'Server không tìm thấy'];

    $playerId = $order['playerId'];
    $num      = $order['rmb'];
    $subject  = $order['subject'];
    $time     = time();
    $orderNum = $order['orderNum'];
    $sign     = md5($playerId . $num . $time . $subject . SIGN_KEY);

    $params = http_build_query([
        'cmd'      => 5,
        'playerId' => $playerId,
        'num'      => $num,
        'orderNum' => $orderNum,
        'time'     => $time,
        'sign'     => $sign,
        'subject'  => $subject,
    ]);

    $ch = curl_init($url . '?' . $params);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT        => 15,
    ]);
    $raw  = curl_exec($ch);
    $err  = curl_errno($ch);
    curl_close($ch);

    if ($err) return ['ok' => false, 'msg' => 'CURL_ERROR:' . $err];

    $decoded = json_decode($raw, true);
    if ($decoded !== null && isset($decoded['errorCode']) && $decoded['errorCode'] == 0) {
        return ['ok' => true];
    }
    return ['ok' => false, 'msg' => 'Java response: ' . $raw];
}
