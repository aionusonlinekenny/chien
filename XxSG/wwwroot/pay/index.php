<?php
// ══════════════════════════════════════════════════════
//  Trang nạp Kim Cương — mở trong iframe từ game
//  URL: http://134.22.38.31/pay/?subject=2
// ══════════════════════════════════════════════════════
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/db.php';

// Kiểm tra session (người chơi phải đã đăng nhập)
if (session_status() === PHP_SESSION_NONE) session_start();
$username = $_SESSION['playuser'] ?? '';
if (!$username) {
    die('<div style="padding:30px;font-family:Arial;color:#c00;text-align:center">
        <p>⚠ Phiên đăng nhập đã hết hạn.</p>
        <p>Vui lòng đăng nhập lại và thử nạp tiếp.</p>
    </div>');
}

// Xác định gói nạp
$subject = intval($_GET['subject'] ?? 0);
if (!isset($packages[$subject])) {
    die('<div style="padding:30px;font-family:Arial;color:#c00;text-align:center">❌ Gói nạp không hợp lệ.</div>');
}
$pkg = $packages[$subject];

// Lấy thông tin server & player
$account = pay_get_player($username);
if (!$account) {
    die('<div style="padding:30px;font-family:Arial;color:#c00;text-align:center">❌ Không tìm thấy tài khoản.</div>');
}
$serverId = $account['lastserver'] ?: 10000;
$playerId = pay_get_player_id($serverId, $username);
if (!$playerId) {
    die('<div style="padding:30px;font-family:Arial;color:#c00;text-align:center">❌ Không tìm thấy nhân vật trong game. Hãy vào game một lần trước khi nạp.</div>');
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Nạp Kim Cương</title>
<style>
*{box-sizing:border-box;margin:0;padding:0}
body{background:linear-gradient(135deg,#1a0533,#2d1b69);min-height:100vh;display:flex;align-items:center;justify-content:center;font-family:Arial,sans-serif;padding:20px}
.card{background:rgba(255,255,255,0.07);border:1px solid rgba(255,255,255,0.15);border-radius:16px;padding:28px 24px;max-width:380px;width:100%;text-align:center;box-shadow:0 8px 40px rgba(0,0,0,0.5)}
.title{color:#f5c842;font-size:20px;font-weight:bold;margin-bottom:20px;text-shadow:0 0 12px rgba(245,200,66,0.5)}
.pkg-box{background:rgba(0,0,0,0.3);border-radius:12px;padding:16px;margin-bottom:20px}
.pkg-name{color:#fff;font-size:18px;font-weight:bold;margin-bottom:6px}
.pkg-knb{color:#f5c842;font-size:28px;font-weight:bold;margin-bottom:4px}
.pkg-knb small{font-size:14px;color:#ccc}
.pkg-price{color:#7affb2;font-size:16px;font-weight:bold}
.player-info{color:rgba(255,255,255,0.55);font-size:12px;margin-bottom:20px}
.player-info strong{color:rgba(255,255,255,0.8)}
#paypal-button-container{margin-top:4px}
.note{color:rgba(255,255,255,0.35);font-size:11px;margin-top:14px;line-height:1.5}
#msg{display:none;margin-top:14px;padding:12px;border-radius:8px;font-size:14px;font-weight:bold}
#msg.ok{background:rgba(0,180,80,0.2);border:1px solid #00b450;color:#7affb2}
#msg.err{background:rgba(200,0,0,0.2);border:1px solid #c00;color:#ff8080}
</style>
</head>
<body>
<div class="card">
    <div class="title">💎 Nạp Kim Cương</div>

    <div class="pkg-box">
        <div class="pkg-name"><?= htmlspecialchars($pkg['name']) ?></div>
        <div class="pkg-knb"><?= number_format($pkg['knb']) ?> <small>KNB</small></div>
        <div class="pkg-price">$<?= $pkg['usd'] ?> USD</div>
    </div>

    <div class="player-info">
        Tài khoản: <strong><?= htmlspecialchars($username) ?></strong><br>
        Máy chủ: <strong>S<?= $serverId == 10000 ? '1' : '2' ?></strong>
    </div>

    <div id="paypal-button-container"></div>
    <div id="msg"></div>

    <div class="note">
        Sau khi thanh toán thành công, Kim Cương sẽ được cộng vào tài khoản trong vòng 1 phút.<br>
        Hỗ trợ: Thánh Chiến Chibi
    </div>
</div>

<script src="https://www.paypal.com/sdk/js?client-id=<?= PAYPAL_CLIENT_ID ?>&currency=USD"></script>
<script>
var subject  = <?= $subject ?>;
var username = <?= json_encode($username) ?>;
var serverId = <?= $serverId ?>;

function showMsg(text, type) {
    var el = document.getElementById('msg');
    el.textContent = text;
    el.className = 'ok' === type ? 'ok' : 'err';
    el.style.display = 'block';
}

paypal.Buttons({
    style: { layout:'vertical', color:'gold', shape:'pill', label:'pay' },

    createOrder: function(data, actions) {
        return fetch('create.php', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: 'subject=' + subject + '&username=' + encodeURIComponent(username) + '&serverId=' + serverId
        })
        .then(r => r.json())
        .then(res => {
            if (res.error) throw new Error(res.error);
            return res.paypalOrderId;
        });
    },

    onApprove: function(data, actions) {
        showMsg('⏳ Đang xử lý thanh toán...', 'ok');
        return fetch('capture.php', {
            method: 'POST',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body: 'paypalOrderId=' + data.orderID
        })
        .then(r => r.json())
        .then(res => {
            if (res.success) {
                showMsg('✅ Nạp thành công! ' + res.knb + ' Kim Cương đã được cộng vào tài khoản.', 'ok');
                document.getElementById('paypal-button-container').style.display = 'none';
            } else {
                showMsg('❌ ' + (res.error || 'Có lỗi xảy ra. Liên hệ hỗ trợ với mã: ' + data.orderID), 'err');
            }
        });
    },

    onError: function(err) {
        showMsg('❌ Lỗi PayPal: ' + err, 'err');
    },

    onCancel: function() {
        showMsg('⚠ Bạn đã hủy thanh toán.', 'err');
    }
}).render('#paypal-button-container');
</script>
</body>
</html>
