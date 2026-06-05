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

---

## Đổi tên vật phẩm trong Cửa Hàng

### Kiến trúc asset (Egret)

Game KHÔNG load `config/cfg.cfg` trực tiếp. Egret dùng hash-based asset manager:

```
gamecfg.json → cfgVersion = "202506042100"
  → svnres/assets/verJson.json?v=202506042100   (map logic name → hash)
  → svnres/assets/a2825a98.cfg?v=202506042100   (file thực sự chứa item data)
```

File `a2825a98.cfg` là ZIP chứa `cfg.json`. Đây là file DUY NHẤT cần sửa.

### Code path hiển thị tên

```
RuleShopItem.dataSource → itemInfo.itemCfg.name
  → ItemInfo.itemCfg getter → JsonTabs.getItem(itemId)
  → data['item'][id]['name']  (từ cfg.json trong a2825a98.cfg)
```

### Cách sửa tên item

**Bước 1 — Tìm id item:**
```python
python3 << 'EOF'
import zipfile, json
with zipfile.ZipFile('XxSG/wwwroot/svnres/assets/a2825a98.cfg', 'r') as z:
    with z.open('cfg.json') as f:
        data = json.load(f)
keyword = 'cường hóa'  # từ khóa tìm kiếm
for id, item in data['item'].items():
    if keyword.lower() in item.get('name', '').lower():
        print(f"id={id}: {item['name']}")
EOF
```

**Bước 2 — Sửa tên:**
```python
python3 << 'EOF'
import zipfile, json, os, subprocess

fname = 'XxSG/wwwroot/svnres/assets/a2825a98.cfg'
tmp = '/tmp/cfg_edit/cfg.json'
os.makedirs('/tmp/cfg_edit', exist_ok=True)

with zipfile.ZipFile(fname, 'r') as z:
    with z.open('cfg.json') as f:
        data = json.load(f)

data['item']['30000801']['name'] = 'Tên mới'  # sửa id + tên

with open(tmp, 'w', encoding='utf-8') as f:
    json.dump(data, f, ensure_ascii=False, separators=(',', ':'))

os.remove(fname)
subprocess.run(['zip', '-9', '-j', fname, tmp])
print("Done:", data['item']['30000801']['name'])
EOF
```

**Bước 3 — Deploy:**
- Commit + push
- Copy `a2825a98.cfg` lên server (không cần đổi cfgVersion — URL `?v=202506042100` đã đủ để bust cache)

### Lưu ý
- `config/cfg.cfg` và `config/cfg1.cfg` là file nguồn — game KHÔNG load trực tiếp
- `verJson.json` là binary (Egret custom format) — KHÔNG sửa tay
- Nếu bump `cfgVersion` trong `gamecfg.json`, phải copy cả `gamecfg.json` lên server

---

## Sign Key
`5Jqxjo10Yl2ElQCwJm` — từ `webgame.properties`, dùng cho `sign = md5(playerId + num + time + subjectId + key)`

## Java HTTP Endpoints
- S1: `http://127.0.0.1:19201/`
- S2: `http://127.0.0.1:19202/`
- cmd=5 params: `playerId, num (=rmb), orderNum, time, sign, subject`
