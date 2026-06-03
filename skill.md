# SKILL.MD — Tiến Trình Làm Việc: Thánh Chiến Chibi Game Server

> File này lưu trữ toàn bộ phân tích, tiến trình và hướng dẫn cài đặt để không bị mất bộ nhớ khi làm việc.

---

## 1. TỔNG QUAN DỰ ÁN

| Mục | Thông tin |
|-----|-----------|
| **Tên game** | Thánh Chiến Chibi (三国 Sanguo) |
| **Loại** | Browser-based multiplayer game server |
| **Frontend** | HTML5/JavaScript (Egret 2D framework) |
| **Web backend** | PHP (Apache/Nginx + phpstudy) |
| **Game server** | Java (JDK 1.8.0_181, Tomcat 8.5.40) |
| **Database** | MySQL |
| **Platform gốc** | Windows (phpstudy_pro) |
| **Thư mục chính** | `XxSG/` |
| **Thư mục web** | `XxSG/wwwroot/` |

---

## 2. CẤU TRÚC THƯ MỤC

```
XxSG/
├── wwwroot/              ← Web root (PHP frontend)
├── game/                 ← Java game server 1 (port 19101)
├── game2/                ← Java game server 2 (port 19102)
├── center/               ← Java cross-server
├── apache-tomcat-8.5.40/ ← Tomcat (nếu dùng)
├── Java/jdk1.8.0_181/   ← JDK
├── phpstudy_pro/         ← Web server cũ (Windows)
├── sql/                  ← SQL dump files
│   ├── account.sql
│   ├── sanguo_game.sql
│   └── sanguo_game2.sql
├── db/
│   ├── sanguo_game2.sql
│   └── package_charge.sql
└── stop_all.bat          ← Dừng tất cả service
```

---

## 3. FILE PHP QUAN TRỌNG

| File | Chức năng |
|------|-----------|
| `wwwroot/index.php` | Trang đăng nhập/đăng ký |
| `wwwroot/game.php` | Game launcher (Egret) |
| `wwwroot/global/config.php` | **Cấu hình DB + server** |
| `wwwroot/global/db.class.php` | Database wrapper (PDO/mysql) |
| `wwwroot/global/function.php` | Utility functions |
| `wwwroot/server/servers.php` | Danh sách server |
| `wwwroot/svnres/.../user/config.php` | **GM tool config** |
| `wwwroot/svnres/.../user/gmquery.php` | **GM admin tool** |

---

## 4. CREDENTIALS (GIỮ BÍ MẬT - ĐỔI TRƯỚC KHI DEPLOY)

```
MySQL root password : EghgTJGqPmZ9RQiW
Server sign key     : 5Jqxjo10Yl2ElQCwJm
GM panel password   : raconagasi
Token seed          : qq86284186
```

---

## 5. CẤU HÌNH SERVER (config.php)

```php
DBIP    = "localhost"
DBUSER  = "root"
DBPWD   = "EghgTJGqPmZ9RQiW"
DBPORT  = 3306
DBNAME  = "account"

Sv 1: sanguo_game,  port 19101, quid 10000
Sv 2: sanguo_game2, port 19102, quid 10001
Sv 3: sanguo_game3, port 19103, quid 10002
Sv 4: sanguo_game4, port 19104, quid 10003
Sv 5: sanguo_game5, port 19105, quid 10004
Sv 6: sanguo_game6, port 19106, quid 10005
Sv 7: sanguo_game7, port 19107, quid 10006
CDN  : http://127.0.0.1:81/
```

---

## 6. KẾT QUẢ KIỂM TRA BACKDOOR

### ✅ KHÔNG CÓ BACKDOOR THỰC SỰ

Đã scan toàn bộ 22 file PHP tìm các pattern backdoor điển hình:
- `eval()` + `base64_decode()` → **KHÔNG có**
- `system()`, `exec()`, `shell_exec()`, `passthru()` → **KHÔNG có**
- `assert()` với code động → **KHÔNG có**
- `preg_replace` với flag `/e` → **KHÔNG có**
- `create_function()` ẩn → **KHÔNG có**
- File PHP ẩn/mã hóa → **KHÔNG có**
- Webshell → **KHÔNG có**

### ⚠️ CÁC VẤN ĐỀ BẢO MẬT (KHÔNG phải backdoor, nhưng cần fix)

#### NGHIÊM TRỌNG
1. **GM Tool lộ công khai** — `gmquery.php` ẩn trong đường dẫn CSS nhưng vẫn accessible qua web. Không có IP whitelist.
2. **SQL Injection** — `index.php:22`, `gmquery.php:40,63,86,139` dùng string concatenation trực tiếp.
3. **Credentials hardcode** — Mật khẩu MySQL và GM code viết thẳng vào code.
4. **Session Fixation** — `game.php` dòng 3-6: `$_SESSION['playuser'] = $_GET['user']` (GET ghi đè session).

#### TRUNG BÌNH
5. **Deprecated MySQL functions** — Dùng `mysql_*` (đã bị xóa từ PHP 7.0), cần PHP 5.x.
6. **Mật khẩu lưu plaintext trong session** — `$_SESSION['playpasswd'] = $password`.
7. **Cookie lưu password** — `SetCookie('cookie_password', lvPWD)` trong JavaScript.
8. **Không có HTTPS** — Toàn bộ giao tiếp qua HTTP.

#### THẤP
9. **`open_basedir` sai đường dẫn** — `.user.ini` trỏ về `C:/Users/TURKEY/...` (Windows path cũ).
10. **Information disclosure** — `.user.ini` lộ dev path gốc.

---

## 7. HƯỚNG DẪN CÀI ĐẶT VỚI XAMPP (WINDOWS)

### 7.1 Yêu cầu phần mềm

| Phần mềm | Phiên bản | Lý do |
|----------|-----------|-------|
| XAMPP | 5.6.x hoặc 7.x | PHP 5.x cần cho `mysql_*` functions |
| PHP | **5.6.x** (bắt buộc) | Dùng `mysql_*` functions (xóa ở PHP 7.0+) |
| MySQL | 5.7.x | Tương thích với SQL dump |
| Java JDK | 1.8.0_181 (bundled) | Java game server |

> **QUAN TRỌNG:** Repo dùng `mysql_*` functions cũ, **PHP 7.0+ sẽ không chạy được** `db.class.php`. Dùng XAMPP 5.6.x hoặc phải migrate code sang PDO.

### 7.2 Cài đặt XAMPP

```
1. Download XAMPP 5.6.x từ apachefriends.org
2. Cài vào C:\xampp
3. Mở XAMPP Control Panel
4. Start Apache + MySQL
```

### 7.3 Cấu hình đường dẫn web

**Cách 1: Dùng htdocs của XAMPP**
```
Copy toàn bộ nội dung XxSG\wwwroot\ vào:
  C:\xampp\htdocs\
```

**Cách 2: Virtual Host (khuyên dùng)**

Sửa `C:\xampp\apache\conf\extra\httpd-vhosts.conf`:
```apache
<VirtualHost *:80>
    DocumentRoot "C:/path/to/XxSG/wwwroot"
    ServerName localhost
    <Directory "C:/path/to/XxSG/wwwroot">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

### 7.4 Cấu hình PHP (php.ini)

Mở `C:\xampp\php\php.ini`, thêm/sửa:
```ini
; Cho phép mysql_* functions (PHP 5.6)
extension=php_mysql.dll
extension=php_mysqli.dll
extension=php_pdo_mysql.dll

; Timezone
date.timezone = Asia/Ho_Chi_Minh

; Session path
session.save_path = "C:/xampp/tmp"

; Sửa open_basedir (hoặc bỏ trống để tắt)
open_basedir =
```

### 7.5 Sửa file .user.ini

Sửa `wwwroot/.user.ini` thành đường dẫn XAMPP thực tế:
```ini
open_basedir="C:/xampp/htdocs/;C:/Windows/Temp/;C:/Temp/;C:/xampp/tmp/"
```

### 7.6 Import Database

Mở phpMyAdmin (`http://localhost/phpmyadmin`):

```sql
-- Bước 1: Tạo databases
CREATE DATABASE account;
CREATE DATABASE sanguo_game;
CREATE DATABASE sanguo_game2;
-- (tạo thêm sanguo_game3 ... sanguo_game7 nếu cần)

-- Bước 2: Import từng file SQL
-- account    <- sql/account.sql
-- sanguo_game <- sql/sanguo_game.sql
-- sanguo_game2 <- sql/sanguo_game2.sql
```

Hoặc dùng command line:
```cmd
C:\xampp\mysql\bin\mysql -u root -pEghgTJGqPmZ9RQiW account < sql/account.sql
C:\xampp\mysql\bin\mysql -u root -pEghgTJGqPmZ9RQiW sanguo_game < sql/sanguo_game.sql
C:\xampp\mysql\bin\mysql -u root -pEghgTJGqPmZ9RQiW sanguo_game2 < sql/sanguo_game2.sql
```

### 7.7 Cấu hình MySQL password

Nếu XAMPP MySQL mặc định không có password, cần set:
```sql
ALTER USER 'root'@'localhost' IDENTIFIED BY 'EghgTJGqPmZ9RQiW';
FLUSH PRIVILEGES;
```

Hoặc sửa `config.php` đổi `DBPWD` thành password XAMPP thực tế.

### 7.8 Cài đặt Java Game Servers

```cmd
REM Cài Java JDK (có sẵn trong XxSG\Java\jdk1.8.0_181)
REM Hoặc cài Java 8 từ oracle.com

REM Sửa start.bat của game server để trỏ đúng đường dẫn mới:
REM Ví dụ trong game\start.bat thay:
REM  C:\Users\TURKEY\Desktop\agatests\chien\XxSG\...
REM Thành:
REM  C:\xampp\htdocs\XxSG\... (hoặc đường dẫn thực)

REM Chạy game server 1:
cd XxSG\game
start.bat

REM Chạy center server (cross-server):
cd XxSG\center
start.bat
```

### 7.9 Sửa start.bat (bắt buộc)

Mỗi file `start.bat` có hardcode đường dẫn `C:\Users\TURKEY\Desktop\...`.  
Phải sửa thành đường dẫn thực trên máy server mới.

**game/start.bat** — sửa thành:
```bat
@echo off
SET BASE=C:\XAMPP\HTDOCS\XxSG
%BASE%\Java\jdk1.8.0_181\bin\java -Duser.language=en -Duser.country=US -Dfile.encoding=utf-8 -cp %BASE%\game\lib\*;%BASE%\game\target\classes com.linlongyx.sanguo.webgame.startup.GameServer
pause
```

**center/start.bat** — sửa thành:
```bat
@echo off
SET BASE=C:\XAMPP\HTDOCS\XxSG
%BASE%\Java\jdk1.8.0_181\bin\java -Duser.language=en -Duser.country=US -Dfile.encoding=utf-8 -cp %BASE%\center\lib\*;%BASE%\center\target\classes com.linlongyx.startup.CrossServer
pause
```

### 7.10 Cấu hình game config.php

Sửa `wwwroot/global/config.php` phần `cdn`:
```php
"cdn"=>"http://localhost/",   // hoặc IP server thực
```

Và `url` trong gmquery config (`svnres/.../user/config.php`):
```php
"url"=>"http://localhost",
```

### 7.11 Apache Port cho game assets

Trong `config.php` CDN trỏ về `http://127.0.0.1:81/`.  
Cần cấu hình Apache lắng nghe port 81 cho static files, hoặc sửa về port 80:

Sửa `C:\xampp\apache\conf\httpd.conf`:
```apache
Listen 80
Listen 81
```

Hoặc sửa `config.php` về `http://127.0.0.1/`.

### 7.12 Kiểm tra hoạt động

```
1. http://localhost/         → Trang đăng nhập game
2. http://localhost/server/servers.php → Danh sách server (JSON)
3. http://localhost/svnres/default/assets/css/raconagasi/ → GM Panel
   - GM code: raconagasi
```

---

## 8. HƯỚNG DẪN CÀI ĐẶT TRÊN LINUX (VPS/Server)

### 8.1 Yêu cầu

```bash
# PHP 5.6 (cho mysql_* functions) HOẶC PHP 7+ sau khi migrate code
sudo apt install php5.6 php5.6-mysql php5.6-curl php5.6-gd

# MySQL
sudo apt install mysql-server-5.7

# Java 8
sudo apt install openjdk-8-jdk

# Apache
sudo apt install apache2
```

### 8.2 Cấu hình Apache

```apache
# /etc/apache2/sites-available/game.conf
<VirtualHost *:80>
    DocumentRoot /var/www/html/wwwroot
    ServerName yourdomain.com
    <Directory /var/www/html/wwwroot>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

```bash
sudo a2enmod rewrite
sudo a2ensite game.conf
sudo systemctl restart apache2
```

### 8.3 Sửa .user.ini cho Linux

```ini
open_basedir="/var/www/html/wwwroot/;/tmp/"
```

### 8.4 Chạy Java servers trên Linux

```bash
# game server 1
cd /opt/XxSG/game
java -Duser.language=en -Dfile.encoding=utf-8 \
  -cp "lib/*:target/classes" \
  com.linlongyx.sanguo.webgame.startup.GameServer &

# center server
cd /opt/XxSG/center
java -Dfile.encoding=utf-8 \
  -cp "lib/*:target/classes" \
  com.linlongyx.startup.CrossServer &
```

---

## 9. VẤN ĐỀ TƯƠNG THÍCH PHP CẦN LƯU Ý

### Nếu dùng PHP 7.0+ (XAMPP 7.x)

`db.class.php` dùng `mysql_*` functions đã bị **xóa hoàn toàn** ở PHP 7.0.  
Cần sửa lại `db.class.php` để chỉ dùng class `db_pdo` (đã có sẵn trong code).

**Sửa dòng cuối của `db.class.php`:**
```php
// Dòng gốc:
$db = extension_loaded('pdo_mysql') ? new db_pdo(...) : new db_mysql(...);

// Sửa thành (PHP 7+):
$db = new db_pdo($newdbip, $newdbuser, $newdbpwd, $newdbname);
```

Và xóa/comment class `db_mysql` hoặc bỏ qua nó.

Ngoài ra, các file dùng `@mysql_connect()` trực tiếp (`gmquery.php`) cũng cần migrate sang PDO/mysqli.

---

## 10. PORTS & SERVICES TỔNG KẾT

| Service | Port | Giao thức |
|---------|------|-----------|
| Apache (web) | 80 | HTTP |
| Apache (CDN assets) | 81 | HTTP |
| MySQL | 3306 | TCP |
| Game Server 1 | 19101 | TCP |
| Game Server 2 | 19102 | TCP |
| Game Server 3 | 19103 | TCP |
| Game Server 4 | 19104 | TCP |
| Game Server 5 | 19105 | TCP |
| Game Server 6 | 19106 | TCP |
| Game Server 7 | 19107 | TCP |

---

## 11. TIẾN TRÌNH CÔNG VIỆC

### Đã hoàn thành
- [x] Phân tích toàn bộ cấu trúc repo
- [x] Scan backdoor tất cả 22 file PHP → **KHÔNG có backdoor**
- [x] Xác định các lỗ hổng bảo mật
- [x] Phân tích yêu cầu cài đặt XAMPP
- [x] Tạo hướng dẫn cài đặt chi tiết
- [x] **Fix SQL Injection** — `index.php` login/register dùng PDO prepared statements
- [x] **Fix SQL Injection** — `gmquery.php` tất cả 4 query dùng mysqli prepared statements
- [x] **Fix Session Fixation** — `game.php` validate user+token qua DB trước khi ghi session
- [x] **Fix Password in Session** — xóa `$_SESSION['playpasswd']` khỏi `index.php`
- [x] **Fix Password in Cookie** — xóa `SetCookie('cookie_password')` và autofill password
- [x] **Fix GM Tool exposure** — thêm IP whitelist trong `gmquery.php`
- [x] **Fix .user.ini** — xóa hardcode Windows path, thêm hướng dẫn cấu hình
- [x] **Fix db.class.php** — thêm `safe_query()` method cho PDO, ẩn error message DB

### Việc cần làm tiếp theo
- [ ] Sửa `start.bat` với đường dẫn mới (còn hardcode `C:\Users\TURKEY\...`)
- [ ] Cấu hình `.user.ini` với đường dẫn XAMPP thực tế của server
- [ ] Import SQL databases vào MySQL
- [ ] Đổi credentials production: MySQL password, GM code (`raconagasi`), token seed (`qq86284186`)
- [ ] Thêm IP thực của admin vào whitelist trong `gmquery.php` dòng 5
- [ ] Test chạy web (PHP)
- [ ] Test chạy Java game servers

---

## 12. GHI CHÚ QUAN TRỌNG

1. **PHP version**: Phải dùng PHP 5.6.x hoặc chỉnh sửa thêm — `gmquery.php` dùng `mysqli`, `db.class.php` dùng PDO, nhưng `db_mysql` class vẫn còn `mysql_*`. Để chạy PHP 7+ cần xóa class `db_mysql`.
2. **Đổi credentials** trước khi đưa lên production: MySQL password, GM code, token seed.
3. **GM Tool IP whitelist** ở `gmquery.php` dòng 5 — thêm IP thực của máy admin.
4. **Tất cả .bat files** có hardcode path `C:\Users\TURKEY\Desktop\...` — phải sửa trước khi chạy.
