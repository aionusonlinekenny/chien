<?php
// ══════════════════════════════════════════════════════
//  PayPal Payment Config — credentials được lưu trong
//  settings.json và quản lý qua GM Tool
// ══════════════════════════════════════════════════════

define('SIGN_KEY',  '5Jqxjo10Yl2ElQCwJm'); // secretKey Java server
define('SITE_URL',  'http://134.22.38.31');

// ── Đọc settings từ file (GM Tool ghi vào) ─────────────
$_pay_settings_file = __DIR__ . '/settings.json';
$_pay_settings = file_exists($_pay_settings_file)
    ? (json_decode(file_get_contents($_pay_settings_file), true) ?: [])
    : [];

$_pay_enabled = (bool)($_pay_settings['enabled'] ?? true);
$_pay_method  = $_pay_settings['method'] ?? 'paypal';  // 'paypal' | 'free'

define('PAY_ENABLED',  $_pay_enabled);
define('PAY_METHOD',   $_pay_method);
define('PAY_FREE',     !$_pay_enabled || $_pay_method === 'free');

define('PAYPAL_CLIENT_ID',     $_pay_settings['paypal_client_id']     ?? '');
define('PAYPAL_CLIENT_SECRET', $_pay_settings['paypal_client_secret'] ?? '');
define('PAYPAL_SANDBOX',       (bool)($_pay_settings['paypal_sandbox'] ?? true));

define('PAYPAL_API', PAYPAL_SANDBOX
    ? 'https://api-m.sandbox.paypal.com'
    : 'https://api-m.paypal.com');

// ── Java game servers ───────────────────────────────
$gameServers = [
    10000 => 'http://127.0.0.1:19201/',
    10001 => 'http://127.0.0.1:19202/',
];

// ── Gói nạp: id => [tên, giá USD, rmb (Java), số KNB] ─
// rmb phải khớp chính xác với charge.json của Java server
$packages = [
    2  => ['name' => '2,000 Kim Cương',   'usd' => '0.99',   'rmb' => 2000000,   'knb' => 2000],
    3  => ['name' => '5,000 Kim Cương',   'usd' => '2.49',   'rmb' => 5000000,   'knb' => 5000],
    4  => ['name' => '10,000 Kim Cương',  'usd' => '4.99',   'rmb' => 10000000,  'knb' => 10000],
    5  => ['name' => '20,000 Kim Cương',  'usd' => '9.99',   'rmb' => 20000000,  'knb' => 20000],
    20 => ['name' => '50,000 Kim Cương',  'usd' => '19.99',  'rmb' => 50000000,  'knb' => 50000],
    6  => ['name' => '100,000 Kim Cương', 'usd' => '39.99',  'rmb' => 100000000, 'knb' => 100000],
    7  => ['name' => '200,000 Kim Cương', 'usd' => '79.99',  'rmb' => 200000000, 'knb' => 200000],
    8  => ['name' => '500,000 Kim Cương', 'usd' => '199.99', 'rmb' => 500000000, 'knb' => 500000],
];
