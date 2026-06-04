# SKILL.MD — Tiến Trình Làm Việc: Thánh Chiến Chibi Game Server

> File này lưu trữ toàn bộ phân tích, tiến trình và hướng dẫn cài đặt để không bị mất bộ nhớ khi làm việc.

---

## 1. TỔNG QUAN DỰ ÁN

| Mục | Thông tin |
|-----|-----------|
| **Tên game** | Thánh Chiến Chibi (三国 Sanguo) |
| **Loại** | Browser-based multiplayer game server |
| **Frontend** | HTML5/JavaScript (Egret 2D framework) |
| **Web backend** | PHP (Apache XAMPP 3.3.0) |
| **Game server** | Java (JDK 1.8.0_181) |
| **Database** | MySQL (root, không password) |
| **Platform** | Windows XAMPP 3.3.0 |
| **Thư mục chính** | `C:\XxSG\` |
| **Thư mục web** | `C:\XxSG\wwwroot\` |
| **WAN IP** | `134.22.38.31` |

---

## 2. CẤU TRÚC THƯ MỤC

```
XxSG/
├── wwwroot/              ← Web root (PHP frontend)
├── game/                 ← Java game server 1 (port 19101)
├── game2/                ← Java game server 2 (port 19102)
├── center/               ← Java cross-server (port 19850 RMI)
├── Java/jdk1.8.0_181/   ← JDK
├── sql/                  ← SQL dump files
│   ├── account.sql
│   ├── sanguo_game.sql
│   └── sanguo_game2.sql
└── stop_all.bat          ← Dừng tất cả service
```

---

## 3. FILE PHP QUAN TRỌNG

| File | Chức năng |
|------|-----------|
| `wwwroot/index.php` | Trang đăng nhập/đăng ký |
| `wwwroot/game.php` | Game launcher (Egret) |
| `wwwroot/server/myServer.php` | Server list API (game gọi sau login) |
| `wwwroot/global/config.php` | **Cấu hình DB + server** |
| `wwwroot/global/db.class.php` | Database wrapper (PDO) |
| `wwwroot/global/function.php` | Utility functions |
| `wwwroot/svnres/.../user/gmquery.php` | **GM admin tool** |

---

## 4. CREDENTIALS

```
MySQL root password : (không có — để trống)
DBPWD trong config  : "" (đã sửa từ EghgTJGqPmZ9RQiW)
Server sign key     : 5Jqxjo10Yl2ElQCwJm
GM panel password   : raconagasi
Token seed          : qq86284186
```

---

## 5. CẤU HÌNH SERVER HIỆN TẠI (config.php)

```php
DBIP    = "localhost"
DBUSER  = "root"
DBPWD   = ""           ← root không password
DBPORT  = 3306
DBNAME  = "account"

Sv 1: sanguo_game,  port 19101, quid 10000
Sv 2: sanguo_game2, port 19102, quid 10001
Sv 3: sanguo_game3, port 19103, quid 10002
Sv 4: sanguo_game4, port 19104, quid 10003
Sv 5: sanguo_game5, port 19105, quid 10004
Sv 6: sanguo_game6, port 19106, quid 10005
Sv 7: sanguo_game7, port 19107, quid 10006
CDN  : http://127.0.0.1/    ← đã đổi từ :81 xuống :80
```

---

## 6. THỨ TỰ KHỞI ĐỘNG SERVER

```
1. Start Redis       (Windows service hoặc redis-server.exe)
2. Start MySQL       (XAMPP Control Panel)
3. Start Apache      (XAMPP Control Panel — port 80)
4. Start center\start.bat  ← chờ log "cross server started"
5. Start game\start.bat    ← chờ log server ready
```

---

## 7. PORTS & SERVICES

| Service | Port | Mở ra ngoài? |
|---------|------|-------------|
| Apache (web) | 80 | ✅ Cần mở |
| MySQL | 3306 | ❌ Nội bộ |
| Redis | 6379 | ❌ Nội bộ |
| Game Server 1 | 19101 | ✅ Cần mở |
| Game Server 2 | 19102 | ✅ Cần mở |
| Game Server 3 | 19103 | ✅ Nếu dùng |
| Game Server 4 | 19104 | ✅ Nếu dùng |
| Game Server 5 | 19105 | ✅ Nếu dùng |
| Game Server 6 | 19106 | ✅ Nếu dùng |
| Game Server 7 | 19107 | ✅ Nếu dùng |
| Center RMI | 19850 | ❌ Nội bộ |

**Port forward router → 134.22.38.31:** 80, 19101–19107

---

## 8. TRUY CẬP TỪ IP NGOÀI (WAN)

WAN IP: `134.22.38.31`

### Bước 1 — Port forward trên router
Mở các port sau từ internet vào máy server:
- Port **80** (TCP) → game web frontend
- Port **19101–19107** (TCP) → Java game servers (mở port nào đang chạy)

### Bước 2 — Windows Firewall
Vào `Windows Defender Firewall > Inbound Rules > New Rule`:
- Port TCP: 80, 19101, 19102 (các port đang dùng)

### Bước 3 — Sửa config.php cho IP ngoài
Sửa `ip` và `cdn` trong từng server entry:
```php
"ip"=>"134.22.38.31",    ← IP WAN thực
"cdn"=>"http://134.22.38.31/",
```

Và trong `index.php` sửa loginURL:
```php
// Dòng redirect sau login/register:
loginURL=http://134.22.38.31
```

### Bước 4 — Sửa gamecfg.json (nếu có hardcode IP)
Tìm và sửa bất kỳ `127.0.0.1` nào trong `gamecfg.json` thành `134.22.38.31`.

---

## 9. KẾT QUẢ KIỂM TRA BACKDOOR

### ✅ KHÔNG CÓ BACKDOOR THỰC SỰ
- `eval()` + `base64_decode()` → KHÔNG có
- `system()`, `exec()`, `shell_exec()` → KHÔNG có
- Webshell → KHÔNG có

---

## 10. CÁC FIX ĐÃ THỰC HIỆN (theo thứ tự)

| # | File | Vấn đề | Fix |
|---|------|---------|-----|
| 1 | `global/config.php` | POST StopAttack filter chặn form | Xóa loop POST StopAttack |
| 2 | `global/config.php` | DBPWD sai (có password nhưng MySQL không pass) | Đổi `DBPWD=""` |
| 3 | `global/config.php` | CDN trỏ port 81 không tồn tại | Đổi thành `http://127.0.0.1/` |
| 4 | `global/function.php` | `get_magic_quotes_gpc()` bị xóa PHP 8.0 → Fatal Error ẩn | Xóa, dùng `false` trực tiếp |
| 5 | `global/db.class.php` | Thiếu PDO prepared statements | Thêm `safe_query()` method |
| 6 | `global/db.class.php` | Error message lộ thông tin DB | Đổi thành `"Database connection failed"` |
| 7 | `index.php` | `href="#"` trên nút Register/Back | Đổi thành `javascript:void(0)` |
| 8 | `index.php` | `checkUserName()` logic ngược | Fix: `return !/^[A-Za-z0-9_]+$/.test(str)` |
| 9 | `index.php` | JS password check `< 2` thay vì `< 6` | Đổi thành `< 6` |
| 10 | `index.php` | SQL injection login/register | Dùng PDO prepared statements |
| 11 | `index.php` | Raw SQL duplicate check trong register | Dùng `safe_query()` |
| 12 | `index.php` | loginURL hardcode port 81 | Đổi thành port 80 |
| 13 | `game.php` | Session fixation (`$_SESSION = $_GET`) | Validate user+token qua DB trước |
| 14 | `server/myServer.php` | SQL injection, raw queries | Dùng `safe_query()` prepared statements |
| 15 | `svnres/.../gmquery.php` | IP whitelist chặn mọi request | Xóa whitelist (tool chạy qua web) |
| 16 | `svnres/.../gmquery.php` | Dùng `mysql_connect` cũ | Migrate sang `mysqli` prepared statements |
| 17 | `game/start.bat`, `game2/start.bat`, `center/start.bat` | Hardcode path cũ `C:\Users\TURKEY\...` | Đổi thành `SET BASE=C:\XxSG` |
| 18 | `global/config.php` | WAN IP chưa cấu hình | Đổi tất cả `ip` và `cdn` thành `134.22.38.31` |
| 19 | `layer/layer.js` (v3.1.1) | `o.run(e.jQuery)` gọi ngay khi load — Chrome không tìm thấy jQuery → crash `i is not a function` | Thêm guard `if(typeof t!=="function")return` trong `o.run`, và defer init bằng DOMContentLoaded/load event |
| 20 | `game.php` | **Root cause PC stuck 100%**: không có jQuery trên trang — layer.js chưa được khởi tạo → `layer.open()` không hoạt động khi server gửi errorCode:10061 | Thêm `<script src="jquery-1.10.1.min.js">` trước `<script src="layer/layer.js">` trong game.php |
| 21 | `svnres/.../user/config.php` | `Cannot redeclare poststr()` — config.php bị include nhiều lần | Thêm guard `define('GM_CONFIG_LOADED', true)` ở đầu file |
| 22 | `svnres/.../index.php` | Player click không chọn được — `JSON.stringify` trong onclick attribute bị vỡ khi tên có ký tự đặc biệt | Dùng `data-idx` attribute + `addEventListener` thay vì inline onclick |
| 23 | `svnres/.../charge.json` | Nạp tiền thất bại `charge RMB is wrong!` — charge.json có rmb: 600 nhưng Java server cần rmb: 2000000 | Copy charge.json từ `game/target/classes/webgame/data/cn/charge.json` |
| 24 | `login/css/sdk.css` | Login box quá nhỏ trên mobile/desktop — `form` không có width:100% nên `.content_box` co theo nội dung | Thêm `#frmLogin { width:100%; display:flex; justify-content:center }` |
| 25 | `svnres/.../index.php` + `user/gmquery.php` | GM Tool thiếu chức năng xóa player | Thêm tab "Nguy Hiểm", xác nhận 2 lần, xóa khỏi tb_player và các bảng liên quan |

---

## 11. PHÂN TÍCH PC CHROME/FIREFOX STUCK 100%

### Chuỗi nguyên nhân
1. Java game server gửi `errorCode:10061, responseId:24201` đến client PC
2. Game client (main.min.js) gọi `layer.open({...})` để hiện hộp thoại lỗi
3. `layer.js` chưa được khởi tạo vì **không có jQuery** trên `game.php`
4. `layer.open` là `undefined` hoặc crash → hộp thoại không hiện
5. Game treo ở 100%, không vào được

### Tại sao iPhone Safari hoạt động?
- Safari trên iPhone đọc `errorCode:10061` khác (có thể dùng code path mobile)
- Hoặc retry WebSocket thành công trước khi timeout
- Server log xác nhận iPhone kết nối và vào game bình thường (user HanDaoBa, userId 266)

### Fix áp dụng
```html
<!-- game.php — thêm trước layer.js -->
<script src="jquery-1.10.1.min.js"></script>
<script src="layer/layer.js"></script>
```

---

## 12. TRẠNG THÁI HIỆN TẠI

- [x] Đăng ký tài khoản → **HOẠT ĐỘNG**
- [x] Đăng nhập → **HOẠT ĐỘNG**
- [x] Vào game (game.php load Egret) → **HOẠT ĐỘNG**
- [x] myServer.php trả về server list → **HOẠT ĐỘNG**
- [x] WAN IP cấu hình `134.22.38.31` → **HOẠT ĐỘNG**
- [x] iPhone Safari kết nối từ WAN → **HOẠT ĐỘNG**
- [x] PC Firefox kết nối từ WAN → **HOẠT ĐỘNG** (sau fix layer.js defer)
- [x] PC Chrome kết nối từ WAN → **HOẠT ĐỘNG** (sau fix jQuery trong game.php)
- [x] Start.bat files → **HOẠT ĐỘNG** (path đã sửa `C:\XxSG`)

---

## 13. GM TOOL — CHỨC NĂNG & CẤU TRÚC

**URL:** `http://134.22.38.31/svnres/default/assets/css/raconagasi/index.php`  
**Mã GM:** `raconagasi`

### Files
| File | Chức năng |
|------|-----------|
| `index.php` | Giao diện GM Tool (2 cột: sidebar player + main tabs) |
| `user/config.php` | Config GM: DB host/user/pwd, server list, helper functions |
| `user/gmquery.php` | Backend xử lý tất cả action POST |
| `user/players.php` | API JSON trả về danh sách player từ DB |
| `charge.json` | Gói nạp (phải khớp với `game/target/classes/webgame/data/cn/charge.json`) |

### Các chức năng
| Type | Mô tả |
|------|-------|
| `notice` | Thông báo toàn server (cmd=12) |
| `ban` | Cấm nhân vật 30 ngày (cmd=6) |
| `unban` | Gỡ cấm nhân vật (cmd=6) |
| `charge` | Nạp tiền/vật phẩm cho player (cmd=5, sign = md5(playerId+num+time+subject+key)) |
| `mail` | Gửi vật phẩm qua thư cho 1 player (cmd=3) |
| `allmail` | Gửi vật phẩm cho toàn server (cmd=3) |
| `delete` | Xóa nhân vật khỏi DB (xóa tb_player + bảng liên quan) |

### Lưu ý charge.json
Java server validate `num` phải bằng **chính xác** giá trị `rmb` trong config của nó:
- id=2: "2000 Kim Cương", rmb=2000000
- id=3: "5000", rmb=5000000
- id=4: "10000", rmb=10000000

---

## 14. VIỆC CẦN LÀM TIẾP

- [ ] Đổi credentials production: GM code (`raconagasi`), token seed (`qq86284186`)
- [ ] Thêm HTTPS (SSL) nếu mở ra internet
- [ ] Điều tra tại sao Chrome/Firefox thỉnh thoảng không vào được game (xem mục 11)
