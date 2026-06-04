# Payment System Fix — Thánh Chiến Chibi

## Vấn đề ban đầu
Click nút mua KNB trong game không có phản hồi gì.

## Root Cause (theo thứ tự phát hiện)

1. **`payServer` URL sai** — `main.min.js` build URL từ `loginURL + control + "/charge"`. Vì `control` không có trong URL params → `"http://134.22.38.31undefined/charge"` (invalid).

2. **`channelUID` undefined** — Điều kiện trong game: `this.channelUID && ... && this.sdk.reCharge(t)`. Nếu `channelUID` falsy → reCharge không bao giờ được gọi.

3. **`isPlatform: false`** — Root `gamecfg.json` có `isPlatform: false` → payment flow bị tắt.

4. **`linlongSDK` không tồn tại** — Game gọi `linlongSDK.reCharge()` và `linlongSDK.payFunc()` nhưng object không được define.

5. **`openid: 0`** — `myServer.php` không trả `openid` trong response → game giữ giá trị default `0`. PHP coi `"0"` là falsy → charge.php trả "Thiếu thông tin".

6. **`num` không khớp `rmb`** — Java's `ChargeEvent` check `chargeBean.rmb == num` exactly. Phải dùng `rmb` từ config, không dùng `money` từ game GET param.

---

## Các file đã sửa

### `wwwroot/game.php`
```javascript
// Inject defaults vào gameURLParams TRƯỚC khi URL params parse
gameURLParams['control'] = '/server';   // → payServer = loginURL + /server + /charge
gameURLParams['channelUID'] = '1';      // → reCharge condition passes

// linlongSDK stub
window.linlongSDK = {
    loginData: { app_id: '', cch_id: '', access_token: '' },
    payFunc: function(o) { console.log('[PAY] linlongSDK.payFunc:', JSON.stringify(o)); }
};

// XHR interceptor: rewrite URL + handle response
XMLHttpRequest.prototype.open = function(method, url) {
    if (url && url.indexOf('/server/charge') !== -1 && url.indexOf('.php') === -1) {
        url = url.replace('/server/charge', '/server/charge.php');
    }
    this._url = url;
    return _origOpen.apply(this, arguments);
};
// On response: code=0 → toast success, code=1+payUrl → iframe, code<0 → toast error
```

### `wwwroot/gamecfg.json`
```json
"isPlatform": true   // phải là true để payment flow hoạt động
```

### `wwwroot/server/myServer.php`
```php
$data = array(
    "openid"     => $username,   // thêm: game đọc để set platform.openid
    "channelUID" => 1,           // thêm: backup nếu URL param không có
    ...
);
```

### `wwwroot/server/charge.php`
- Load `pay/config.php` sớm (cả free lẫn PayPal mode) để lấy `$packages[$subjectId]['rmb']`
- Dùng `$rmb = $pkg['rmb']` cho `num` và sign (Java check `chargeBean.rmb == num`)
- Fallback `openid` về `$_SESSION['playuser']` nếu game gửi `openid=0`
- Fix PHP falsy bug: `if ($openid === '' || $openid === '0')` thay vì `if (!$openid)`

### `wwwroot/server/.htaccess`
```
RewriteEngine On
RewriteRule ^charge$ charge.php [L]
```
(Backup cho URL không có `.php` extension)

---

## Flow hoàn chỉnh (Free Mode)

```
Player click buy
  → game check channelUID (truthy ✓)
  → game build params: money=rmb, openid=username, playerId=xxx, subject=ID_name
  → egret.HttpRequest GET /server/charge (rewritten → /server/charge.php)
  → charge.php: validate openid via session, lookup packages[subjectId].rmb
  → charge.php: sign = md5(playerId + rmb + time + subjectId + SIGN_KEY)
  → curl Java :19201/?cmd=5&playerId=x&num=rmb&sign=x&subject=x
  → Java: validate sign, check num==chargeBean.rmb, credit KNB
  → charge.php: return {"code":0,"msg":"..."}
  → XHR interceptor: layer.msg('✅ Nhận Kim Cương thành công!')
  → linlongSDK.payFunc: no-op log
```

## Flow hoàn chỉnh (PayPal Mode)

```
charge.php return {"code":1,"orderNo":"...","payUrl":"http://134.22.38.31/pay/?order=xxx"}
  → XHR interceptor: window.showpay(payUrl) → layer.open iframe
  → Player thanh toán PayPal trong iframe
  → pay/capture.php: verify PayPal, atomic mark_paid, call Java cmd=5
```

---

## Sign Key
`5Jqxjo10Yl2ElQCwJm` — từ `webgame.properties`, dùng cho `sign = md5(playerId + num + time + subjectId + key)`

## Java HTTP Endpoints
- S1: `http://127.0.0.1:19201/`
- S2: `http://127.0.0.1:19202/`
- cmd=5 params: `playerId, num (=rmb), orderNum, time, sign, subject`
