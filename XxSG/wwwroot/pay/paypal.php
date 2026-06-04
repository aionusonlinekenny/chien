<?php
// ══════════════════════════════════════════════════════
//  PayPal REST API helper (không cần SDK ngoài)
// ══════════════════════════════════════════════════════

function paypal_get_token() {
    $ch = curl_init(PAYPAL_API . '/v1/oauth2/token');
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST           => true,
        CURLOPT_POSTFIELDS     => 'grant_type=client_credentials',
        CURLOPT_USERPWD        => PAYPAL_CLIENT_ID . ':' . PAYPAL_CLIENT_SECRET,
        CURLOPT_HTTPHEADER     => ['Accept: application/json'],
        CURLOPT_SSL_VERIFYPEER => !PAYPAL_SANDBOX,
        CURLOPT_TIMEOUT        => 15,
    ]);
    $res = json_decode(curl_exec($ch), true);
    curl_close($ch);
    if (empty($res['access_token'])) {
        throw new Exception('PayPal auth failed: ' . json_encode($res));
    }
    return $res['access_token'];
}

function paypal_request($method, $endpoint, $body = null, $token = null) {
    if (!$token) $token = paypal_get_token();
    $ch = curl_init(PAYPAL_API . $endpoint);
    $headers = [
        'Content-Type: application/json',
        'Authorization: Bearer ' . $token,
    ];
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_CUSTOMREQUEST  => $method,
        CURLOPT_HTTPHEADER     => $headers,
        CURLOPT_SSL_VERIFYPEER => !PAYPAL_SANDBOX,
        CURLOPT_TIMEOUT        => 15,
    ]);
    if ($body) curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($body));
    $res  = curl_exec($ch);
    $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    return ['code' => $code, 'body' => json_decode($res, true)];
}

function paypal_create_order($amount_usd, $description, $orderNum) {
    $body = [
        'intent' => 'CAPTURE',
        'purchase_units' => [[
            'reference_id' => $orderNum,
            'description'  => $description,
            'amount' => [
                'currency_code' => 'USD',
                'value'         => $amount_usd,
            ],
        ]],
        'application_context' => [
            'brand_name'          => 'Thánh Chiến Chibi',
            'landing_page'        => 'NO_PREFERENCE',
            'user_action'         => 'PAY_NOW',
            'shipping_preference' => 'NO_SHIPPING',
        ],
    ];
    return paypal_request('POST', '/v2/checkout/orders', $body);
}

function paypal_capture_order($paypalOrderId) {
    return paypal_request('POST', "/v2/checkout/orders/{$paypalOrderId}/capture");
}

function paypal_get_order($paypalOrderId) {
    return paypal_request('GET', "/v2/checkout/orders/{$paypalOrderId}");
}
