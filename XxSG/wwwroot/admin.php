<?php
// No output before this line — prevents Quirks Mode
error_reporting(0);
if (session_status() === PHP_SESSION_NONE) session_start();

// GM password — single source of truth from GM config
$gmcode = 'raconagasi';
$gmConfigFile = __DIR__ . '/svnres/default/assets/css/raconagasi/user/config.php';
if (file_exists($gmConfigFile)) {
    // Extract only $gmcode without triggering session_start again
    $raw = file_get_contents($gmConfigFile);
    if (preg_match('/\$gmcode\s*=\s*[\'"]([^\'"]+)[\'"]/', $raw, $m)) {
        $gmcode = $m[1];
    }
}

$error = '';

// Logout
if (isset($_GET['logout'])) {
    unset($_SESSION['gm_authed'], $_SESSION['gm_authed_time']);
    header('Location: /admin.php');
    exit;
}

// Already logged in → redirect to GM Tool
if (!empty($_SESSION['gm_authed'])) {
    header('Location: /svnres/default/assets/css/raconagasi/index.php');
    exit;
}

// Login form submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = isset($_POST['gm_pass']) ? $_POST['gm_pass'] : '';
    if ($input === $gmcode) {
        $_SESSION['gm_authed'] = true;
        $_SESSION['gm_authed_time'] = time();
        header('Location: /svnres/default/assets/css/raconagasi/index.php');
        exit;
    }
    $error = 'Mật khẩu không đúng.';
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
input[type=password]{width:100%;padding:10px 14px;background:#21262d;border:1px solid #30363d;border-radius:6px;color:#e6edf3;font-size:15px;outline:none;letter-spacing:3px}
input[type=password]:focus{border-color:#f78166}
.error{background:#2d1b1b;border:1px solid #f85149;color:#f85149;border-radius:6px;padding:8px 12px;font-size:13px;margin-bottom:16px}
.btn{width:100%;margin-top:20px;padding:11px;background:#b22222;border:none;border-radius:6px;color:#fff;font-size:15px;font-weight:bold;cursor:pointer}
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
