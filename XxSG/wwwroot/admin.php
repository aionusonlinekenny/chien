<?php
require_once __DIR__ . '/global/db.class.php';

// GM password is read from GM Tool config — single source of truth
$gmConfigFile = __DIR__ . '/svnres/default/assets/css/raconagasi/user/config.php';
require_once $gmConfigFile;
// $gmcode is now available from config.php

if (session_status() === PHP_SESSION_NONE) session_start();

$error = '';

// Handle logout
if (isset($_GET['logout'])) {
    $_SESSION['gm_authed'] = false;
    unset($_SESSION['gm_authed']);
}

// Handle login POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = isset($_POST['gm_pass']) ? $_POST['gm_pass'] : '';
    if ($input === $gmcode) {
        $_SESSION['gm_authed'] = true;
        $_SESSION['gm_authed_time'] = time();
        header('Location: /svnres/default/assets/css/raconagasi/index.php');
        exit;
    } else {
        $error = 'Mật khẩu không đúng.';
    }
}

// Already authed → redirect straight in
if (!empty($_SESSION['gm_authed'])) {
    header('Location: /svnres/default/assets/css/raconagasi/index.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
<title>Admin — Thánh Chiến Chibi</title>
<style>
*{box-sizing:border-box;margin:0;padding:0}
html,body{height:100%;background:#0d1117;font-family:Arial,sans-serif;display:flex;align-items:center;justify-content:center}
.card{background:#161b22;border:1px solid #30363d;border-radius:12px;padding:40px 36px;width:100%;max-width:380px}
.card h1{color:#f78166;font-size:20px;margin-bottom:6px;text-align:center}
.card .sub{color:#768390;font-size:13px;text-align:center;margin-bottom:28px}
label{display:block;font-size:12px;color:#768390;margin-bottom:6px}
input[type=password]{
    width:100%;padding:10px 14px;
    background:#21262d;border:1px solid #30363d;border-radius:6px;
    color:#e6edf3;font-size:15px;outline:none;letter-spacing:3px;
}
input[type=password]:focus{border-color:#f78166}
.error{background:#2d1b1b;border:1px solid #f85149;color:#f85149;
       border-radius:6px;padding:8px 12px;font-size:13px;margin-bottom:16px}
.btn{width:100%;margin-top:20px;padding:11px;background:#b22222;border:none;
     border-radius:6px;color:#fff;font-size:15px;font-weight:bold;cursor:pointer}
.btn:hover{background:#c0392b}
.lock{font-size:36px;text-align:center;margin-bottom:16px}
</style>
</head>
<body>
<div class="card">
    <div class="lock">🔐</div>
    <h1>GM Tool</h1>
    <p class="sub">Thánh Chiến Chibi — Quản trị</p>

    <?php if ($error): ?>
    <div class="error">⚠️ <?= htmlspecialchars($error) ?></div>
    <?php endif; ?>

    <form method="post" action="/admin.php" autocomplete="off">
        <label for="gm_pass">Mật khẩu GM</label>
        <input type="password" id="gm_pass" name="gm_pass"
               placeholder="••••••••" autofocus autocomplete="new-password">
        <button type="submit" class="btn">Đăng nhập</button>
    </form>
</div>
</body>
</html>
