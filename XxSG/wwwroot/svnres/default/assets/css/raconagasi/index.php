<?php include_once './user/config.php'; ?>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GM Tool — Thánh Chiến Chibi</title>
<link rel="stylesheet" href="layui/css/layui.css">
<style>
* { box-sizing: border-box; }
body { background: #1a1a2e; color: #eee; font-family: Arial, sans-serif; margin: 0; padding: 16px; min-height: 100vh; }
.gm-wrap { max-width: 680px; margin: 0 auto; }
h1 { text-align: center; color: #e94560; margin-bottom: 4px; font-size: 22px; }
.subtitle { text-align: center; color: #888; font-size: 13px; margin-bottom: 20px; }

.card { background: #16213e; border-radius: 10px; padding: 18px 20px; margin-bottom: 16px; border: 1px solid #0f3460; }
.card h3 { margin: 0 0 14px; font-size: 15px; color: #e94560; border-bottom: 1px solid #0f3460; padding-bottom: 8px; }

.field { margin-bottom: 12px; }
.field label { display: block; font-size: 12px; color: #aaa; margin-bottom: 4px; }
.field input, .field select, .field textarea {
    width: 100%; padding: 9px 12px; border-radius: 6px;
    border: 1px solid #0f3460; background: #0f3460; color: #eee;
    font-size: 14px; outline: none;
}
.field input:focus, .field select:focus, .field textarea:focus { border-color: #e94560; }
.field textarea { resize: vertical; min-height: 60px; }

.row2 { display: flex; gap: 10px; }
.row2 .field { flex: 1; }

.btn { display: inline-block; padding: 9px 20px; border-radius: 6px; border: none;
    cursor: pointer; font-size: 14px; font-weight: bold; transition: opacity .2s; }
.btn:hover { opacity: .85; }
.btn-red    { background: #e94560; color: #fff; }
.btn-green  { background: #27ae60; color: #fff; }
.btn-blue   { background: #2980b9; color: #fff; }
.btn-orange { background: #e67e22; color: #fff; }
.btn-gray   { background: #555; color: #fff; }
.btn-full   { width: 100%; text-align: center; display: block; }

.result-box { margin-top: 10px; padding: 10px 14px; border-radius: 6px;
    background: #0a192f; font-size: 14px; display: none; }
.result-ok  { border-left: 4px solid #27ae60; color: #2ecc71; }
.result-err { border-left: 4px solid #e94560; color: #e74c3c; }

.tabs { display: flex; gap: 8px; margin-bottom: 16px; flex-wrap: wrap; }
.tab-btn { padding: 7px 16px; border-radius: 20px; border: 1px solid #0f3460;
    background: transparent; color: #aaa; cursor: pointer; font-size: 13px; }
.tab-btn.active { background: #e94560; border-color: #e94560; color: #fff; }
.tab-panel { display: none; }
.tab-panel.active { display: block; }

select option { background: #0f3460; }
</style>
</head>
<body>
<div class="gm-wrap">

<h1>⚔ GM Tool</h1>
<p class="subtitle">Thánh Chiến Chibi — Quản trị máy chủ</p>

<!-- Thông tin chung -->
<div class="card">
    <h3>🔐 Xác thực & Máy chủ</h3>
    <div class="row2">
        <div class="field">
            <label>Mã GM</label>
            <input type="password" id="checknum" placeholder="Nhập mã GM">
        </div>
        <div class="field">
            <label>Máy chủ</label>
            <select id="qu">
                <?php foreach ($quarr as $key => $val): if ($val['hidde']) continue; ?>
                <option value="<?= $key ?>"><?= htmlspecialchars($val['name']) ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <div class="field">
        <label>Tên nhân vật (ingame)</label>
        <input type="text" id="uid" placeholder="Nhập tên nhân vật chính xác">
    </div>
</div>

<!-- Tabs -->
<div class="tabs">
    <button class="tab-btn active" onclick="showTab('mail')">📬 Gửi Vật Phẩm</button>
    <button class="tab-btn" onclick="showTab('charge')">💰 Nạp Tiền</button>
    <button class="tab-btn" onclick="showTab('notice')">📢 Thông Báo</button>
    <button class="tab-btn" onclick="showTab('ban')">🔨 Ban / Unban</button>
</div>

<!-- Tab: Mail -->
<div id="tab-mail" class="tab-panel active">
    <div class="card">
        <h3>📬 Gửi Vật Phẩm Qua Thư</h3>
        <div class="row2">
            <div class="field">
                <label>Tiêu đề thư</label>
                <input type="text" id="mail_title" value="Quà từ GM" placeholder="Tiêu đề">
            </div>
            <div class="field">
                <label>Nội dung thư</label>
                <input type="text" id="mail_content" value="Chúc mừng!" placeholder="Nội dung">
            </div>
        </div>
        <div class="row2">
            <div class="field">
                <label>Vật phẩm</label>
                <select id="mailid">
                    <?php
                    $file = @fopen("item.txt", "r");
                    if ($file) {
                        while (!feof($file)) {
                            $line = fgets($file);
                            $txts = explode(';', $line);
                            if (trim($txts[0]) !== '') {
                                echo '<option value="' . htmlspecialchars(trim($txts[0])) . '">'
                                    . htmlspecialchars(trim($txts[1] ?? '')) . '</option>';
                            }
                        }
                        fclose($file);
                    }
                    ?>
                </select>
            </div>
            <div class="field">
                <label>Số lượng</label>
                <input type="number" id="mailnum" value="1" min="1" max="999999999">
            </div>
        </div>
        <div id="res-mail" class="result-box"></div>
        <div style="display:flex;gap:10px;margin-top:12px;">
            <button class="btn btn-blue" style="flex:1" onclick="sendMail()">📨 Gửi cho nhân vật</button>
            <button class="btn btn-red" style="flex:1" onclick="sendAllMail()">📣 Gửi toàn server</button>
        </div>
    </div>
</div>

<!-- Tab: Charge -->
<div id="tab-charge" class="tab-panel">
    <div class="card">
        <h3>💰 Nạp Tiền / Vật Phẩm Nạp</h3>
        <div class="row2">
            <div class="field">
                <label>Gói nạp</label>
                <select id="chargetype">
                    <?php
                    $chargeData = json_decode(file_get_contents("charge.json"), true);
                    foreach ($chargeData as $key => $val) {
                        echo '<option value="' . htmlspecialchars($key) . '">'
                            . htmlspecialchars($val['name']) . '</option>';
                    }
                    ?>
                </select>
            </div>
            <div class="field">
                <label>Số lần nạp (1-10)</label>
                <input type="number" id="chargenum" value="1" min="1" max="10">
            </div>
        </div>
        <div id="res-charge" class="result-box"></div>
        <button class="btn btn-green btn-full" style="margin-top:12px" onclick="doCharge()">💳 Nạp ngay</button>
    </div>
</div>

<!-- Tab: Notice -->
<div id="tab-notice" class="tab-panel">
    <div class="card">
        <h3>📢 Thông Báo Toàn Server</h3>
        <div class="field">
            <label>Nội dung thông báo</label>
            <textarea id="noticemsg" placeholder="Nhập nội dung thông báo sẽ hiện cho tất cả người chơi..."></textarea>
        </div>
        <div id="res-notice" class="result-box"></div>
        <button class="btn btn-orange btn-full" style="margin-top:12px" onclick="sendNotice()">📢 Gửi thông báo</button>
    </div>
</div>

<!-- Tab: Ban -->
<div id="tab-ban" class="tab-panel">
    <div class="card">
        <h3>🔨 Ban / Unban Nhân Vật</h3>
        <p style="color:#888;font-size:13px;margin-bottom:14px;">Nhập tên nhân vật ở ô bên trên rồi bấm:</p>
        <div id="res-ban" class="result-box"></div>
        <div style="display:flex;gap:10px;margin-top:12px;">
            <button class="btn btn-red" style="flex:1" onclick="doBan()">🔨 Ban 30 ngày</button>
            <button class="btn btn-green" style="flex:1" onclick="doUnban()">✅ Unban</button>
        </div>
    </div>
</div>

</div><!-- end gm-wrap -->

<script src="layui/layui.all.js"></script>
<script>
function get(id) { return document.getElementById(id); }
function val(id) { return get(id).value.trim(); }

function showTab(name) {
    document.querySelectorAll('.tab-panel').forEach(el => el.classList.remove('active'));
    document.querySelectorAll('.tab-btn').forEach(el => el.classList.remove('active'));
    get('tab-' + name).classList.add('active');
    event.target.classList.add('active');
}

function showResult(id, msg) {
    var el = get(id);
    var isOk = msg.indexOf('✅') === 0;
    el.className = 'result-box ' + (isOk ? 'result-ok' : 'result-err');
    el.textContent = msg;
    el.style.display = 'block';
}

function baseData() {
    return { checknum: val('checknum'), qu: val('qu'), uid: val('uid') };
}

function post(data, resId) {
    if (!data.checknum) { showResult(resId, '❌ Vui lòng nhập mã GM!'); return; }
    if (!data.uid && data.uid !== undefined) { showResult(resId, '❌ Vui lòng nhập tên nhân vật!'); return; }
    showResult(resId, '⏳ Đang xử lý...');
    get(resId).className = 'result-box result-err';
    get(resId).style.display = 'block';
    var form = new URLSearchParams(data).toString();
    fetch('user/gmquery.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8' },
        body: form
    }).then(r => r.text()).then(txt => showResult(resId, txt))
      .catch(e => showResult(resId, '❌ Lỗi kết nối: ' + e));
}

function sendMail() {
    if (!val('mailid')) { showResult('res-mail', '❌ Vui lòng chọn vật phẩm!'); return; }
    post(Object.assign(baseData(), {
        type: 'mail', item: val('mailid'), num: val('mailnum'),
        title: val('mail_title'), content: val('mail_content')
    }), 'res-mail');
}

function sendAllMail() {
    if (!val('mailid')) { showResult('res-mail', '❌ Vui lòng chọn vật phẩm!'); return; }
    if (!confirm('Xác nhận gửi cho TOÀN BỘ server ' + val('qu') + '?')) return;
    var d = { checknum: val('checknum'), qu: val('qu'), uid: '86284186',
        type: 'allmail', item: val('mailid'), num: val('mailnum'),
        title: val('mail_title'), content: val('mail_content') };
    showResult('res-mail', '⏳ Đang gửi toàn server...');
    var form = new URLSearchParams(d).toString();
    fetch('user/gmquery.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8' },
        body: form
    }).then(r => r.text()).then(txt => showResult('res-mail', txt))
      .catch(e => showResult('res-mail', '❌ Lỗi kết nối: ' + e));
}

function doCharge() {
    var num = parseInt(val('chargenum'));
    if (num < 1 || num > 10) { showResult('res-charge', '❌ Số lần nạp phải từ 1 đến 10!'); return; }
    post(Object.assign(baseData(), {
        type: 'charge', chargetype: val('chargetype'), chargenum: num
    }), 'res-charge');
}

function sendNotice() {
    if (!val('noticemsg')) { showResult('res-notice', '❌ Nội dung thông báo không được trống!'); return; }
    var d = { checknum: val('checknum'), qu: val('qu'), uid: 'null',
        type: 'notice', noticemsg: val('noticemsg') };
    showResult('res-notice', '⏳ Đang gửi...');
    var form = new URLSearchParams(d).toString();
    fetch('user/gmquery.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8' },
        body: form
    }).then(r => r.text()).then(txt => showResult('res-notice', txt))
      .catch(e => showResult('res-notice', '❌ Lỗi: ' + e));
}

function doBan() {
    if (!val('uid')) { showResult('res-ban', '❌ Nhập tên nhân vật ở ô bên trên!'); return; }
    if (!confirm('Ban «' + val('uid') + '» 30 ngày?')) return;
    post(Object.assign(baseData(), { type: 'ban' }), 'res-ban');
}

function doUnban() {
    if (!val('uid')) { showResult('res-ban', '❌ Nhập tên nhân vật ở ô bên trên!'); return; }
    post(Object.assign(baseData(), { type: 'unban' }), 'res-ban');
}
</script>
</body>
</html>
