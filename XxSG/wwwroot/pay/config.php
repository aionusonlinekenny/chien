<?php
// ══════════════════════════════════════════════════════
//  PayPal Payment Config
//  Đổi CLIENT_ID và CLIENT_SECRET sau khi tạo app PayPal
//  https://developer.paypal.com/dashboard/applications
// ══════════════════════════════════════════════════════

define('PAYPAL_CLIENT_ID',     'YOUR_PAYPAL_CLIENT_ID');
define('PAYPAL_CLIENT_SECRET', 'YOUR_PAYPAL_CLIENT_SECRET');
define('PAYPAL_SANDBOX', true);   // true = test, false = thật

define('PAYPAL_API',  PAYPAL_SANDBOX
    ? 'https://api-m.sandbox.paypal.com'
    : 'https://api-m.paypal.com');

define('SITE_URL',  'http://134.22.38.31'); // URL server của bạn
define('SIGN_KEY',  '5Jqxjo10Yl2ElQCwJm'); // secretKey Java server

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
