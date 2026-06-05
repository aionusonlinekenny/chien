<?php
include_once './user/config.php';
// Auth gate — must come through admin.php login
if (empty($_SESSION['gm_authed'])) {
    header('Location: /admin.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GM Tool — Thánh Chiến Chibi</title>
<style>
*{box-sizing:border-box;margin:0;padding:0}
body{background:#0d1117;color:#e6edf3;font-family:Arial,sans-serif;min-height:100vh;display:flex}

/* ── Sidebar ── */
.sidebar{width:300px;min-width:260px;background:#161b22;border-right:1px solid #30363d;display:flex;flex-direction:column;height:100vh;position:sticky;top:0}
.sidebar-header{padding:16px;border-bottom:1px solid #30363d}
.sidebar-header h2{color:#f78166;font-size:16px;margin-bottom:12px}
.server-row{display:flex;gap:8px;margin-bottom:10px}
.server-row select,.gm-input{width:100%;padding:8px 10px;background:#21262d;border:1px solid #30363d;border-radius:6px;color:#e6edf3;font-size:13px;outline:none}
.server-row select{flex:1}
.search-row{display:flex;gap:6px}
.search-row input{flex:1;padding:7px 10px;background:#21262d;border:1px solid #30363d;border-radius:6px;color:#e6edf3;font-size:13px;outline:none}
.search-row input:focus{border-color:#f78166}
.btn-load{padding:7px 12px;background:#238636;border:none;border-radius:6px;color:#fff;cursor:pointer;font-size:13px;white-space:nowrap}
.btn-load:hover{background:#2ea043}

/* ── Player list ── */
.player-list{flex:1;overflow-y:auto;padding:6px 0}
.player-item{padding:10px 16px;cursor:pointer;border-left:3px solid transparent;transition:.15s}
.player-item:hover{background:#21262d;border-left-color:#388bfd}
.player-item.selected{background:#1c2128;border-left-color:#f78166}
.player-item .pname{font-size:14px;font-weight:bold;color:#e6edf3}
.player-item .pmeta{font-size:12px;color:#768390;margin-top:2px}
.player-item .pvip{color:#e3b341;font-size:11px}
.player-count{padding:8px 16px;font-size:12px;color:#768390;border-top:1px solid #30363d}
.no-player{padding:30px 16px;text-align:center;color:#768390;font-size:13px}

/* ── Main panel ── */
.main{flex:1;padding:24px;overflow-y:auto;max-width:800px}
.main h1{font-size:20px;color:#f78166;margin-bottom:4px}
.main .subtitle{color:#768390;font-size:13px;margin-bottom:24px}

/* Selected player banner */
.selected-banner{background:#161b22;border:1px solid #30363d;border-radius:8px;padding:14px 18px;margin-bottom:20px;display:flex;align-items:center;gap:14px}
.selected-banner .avatar{width:44px;height:44px;border-radius:50%;background:#21262d;display:flex;align-items:center;justify-content:center;font-size:20px;flex-shrink:0}
.selected-banner .info .name{font-size:16px;font-weight:bold;color:#e6edf3}
.selected-banner .info .meta{font-size:12px;color:#768390;margin-top:3px}
.no-selection{color:#768390;font-style:italic;font-size:14px}

/* Tabs */
.tabs{display:flex;gap:4px;margin-bottom:20px;border-bottom:1px solid #30363d;padding-bottom:0}
.tab-btn{padding:8px 18px;background:transparent;border:none;border-bottom:2px solid transparent;color:#768390;cursor:pointer;font-size:14px;margin-bottom:-1px}
.tab-btn.active{color:#f78166;border-bottom-color:#f78166}
.tab-panel{display:none}.tab-panel.active{display:block}

/* Cards */
.card{background:#161b22;border:1px solid #30363d;border-radius:8px;padding:18px;margin-bottom:16px}
.card h3{font-size:14px;color:#768390;margin-bottom:14px;font-weight:normal;text-transform:uppercase;letter-spacing:.5px}
.field{margin-bottom:12px}
.field label{display:block;font-size:12px;color:#768390;margin-bottom:5px}
.field input,.field select,.field textarea{width:100%;padding:8px 12px;background:#21262d;border:1px solid #30363d;border-radius:6px;color:#e6edf3;font-size:14px;outline:none}
.field input:focus,.field select:focus,.field textarea:focus{border-color:#388bfd}
.field textarea{resize:vertical;min-height:70px}
.row2{display:flex;gap:12px}.row2 .field{flex:1}

/* Buttons */
.btn{padding:9px 20px;border:none;border-radius:6px;cursor:pointer;font-size:14px;font-weight:bold;transition:opacity .15s}
.btn:hover{opacity:.85}
.btn-green{background:#238636;color:#fff}
.btn-blue{background:#1f6feb;color:#fff}
.btn-orange{background:#9e6a03;color:#fff}
.btn-red{background:#b91c1c;color:#fff}
.btn-gray{background:#373e47;color:#e6edf3}
.btn-full{width:100%;display:block;text-align:center}
.btn-row{display:flex;gap:10px;margin-top:14px}
.btn-row .btn{flex:1}

/* Result */
.result{margin-top:12px;padding:10px 14px;border-radius:6px;font-size:14px;display:none}
.result.ok{background:#0d2119;border:1px solid #238636;color:#3fb950}
.result.err{background:#2d1212;border:1px solid #b91c1c;color:#f85149}
.result.loading{background:#162032;border:1px solid #1f6feb;color:#79c0ff}

/* GM session bar at top */
.gm-code-bar{background:#161b22;border-bottom:1px solid #30363d;padding:10px 16px;display:flex;align-items:center;gap:10px}
.gm-code-bar .gm-badge{flex:1;font-size:12px;color:#3fb950}
.gm-code-bar a.logout-btn{font-size:12px;color:#f85149;text-decoration:none;padding:4px 10px;border:1px solid #f85149;border-radius:4px;white-space:nowrap}
.gm-code-bar a.logout-btn:hover{background:#2d1b1b}

/* Scrollbar */
::-webkit-scrollbar{width:6px}::-webkit-scrollbar-track{background:#0d1117}::-webkit-scrollbar-thumb{background:#30363d;border-radius:3px}

/* Mobile */
@media(max-width:640px){
    body{flex-direction:column}
    .sidebar{width:100%;height:auto;position:relative;max-height:55vh}
    .player-list{max-height:200px}
    .main{padding:16px}
}
</style>
</head>
<body>

<!-- ══ SIDEBAR ══ -->
<div class="sidebar">
    <div class="gm-code-bar">
        <span class="gm-badge">✅ GM đã đăng nhập</span>
        <a href="/admin.php?logout=1" class="logout-btn">Đăng xuất</a>
    </div>
    <!-- Password injected from session — never visible in UI -->
    <input type="hidden" id="checknum" value="<?= htmlspecialchars($gmcode) ?>">
    <div class="sidebar-header">
        <h2>⚔ Danh sách nhân vật</h2>
        <div class="server-row">
            <select id="qu" onchange="loadPlayers()">
                <?php foreach ($quarr as $key => $val): if ($val['hidde']) continue; ?>
                <option value="<?= $key ?>"><?= htmlspecialchars($val['name']) ?></option>
                <?php endforeach; ?>
            </select>
            <button class="btn-load" onclick="loadPlayers()">↻ Tải</button>
        </div>
        <div class="search-row">
            <input type="text" id="search" placeholder="Tìm tên nhân vật..." oninput="filterPlayers()" onkeydown="if(event.key==='Enter')loadPlayers()">
        </div>
    </div>
    <div class="player-list" id="playerList">
        <div class="no-player">Nhập mã GM và bấm Tải</div>
    </div>
    <div class="player-count" id="playerCount"></div>
</div>

<!-- ══ MAIN ══ -->
<div class="main">
    <h1>GM Tool</h1>
    <p class="subtitle">Thánh Chiến Chibi — Chọn nhân vật bên trái để thao tác</p>

    <!-- Selected player -->
    <div class="selected-banner" id="selectedBanner">
        <div class="avatar">👤</div>
        <div class="info">
            <div class="name no-selection" id="selectedName">Chưa chọn nhân vật</div>
            <div class="meta" id="selectedMeta"></div>
        </div>
    </div>

    <!-- Tabs -->
    <div class="tabs">
        <button class="tab-btn active" onclick="showTab('mail',this)">📬 Gửi Vật Phẩm</button>
        <button class="tab-btn" onclick="showTab('charge',this)">💰 Nạp Tiền</button>
        <button class="tab-btn" onclick="showTab('notice',this)">📢 Thông Báo</button>
        <button class="tab-btn" onclick="showTab('ban',this)">🔨 Ban/Unban</button>
        <button class="tab-btn" onclick="showTab('paysettings',this)">⚙ Thanh Toán</button>
        <button class="tab-btn" onclick="showTab('cfgitems',this);initCfgTab()">📦 Vật Phẩm</button>
        <button class="tab-btn" onclick="showTab('danger',this)" style="color:#f85149">⚠ Nguy Hiểm</button>
    </div>

    <!-- Tab: Mail -->
    <div id="tab-mail" class="tab-panel active">
        <div class="card">
            <h3>Gửi vật phẩm qua thư nội bộ</h3>
            <div class="row2">
                <div class="field">
                    <label>Tiêu đề thư</label>
                    <input type="text" id="mail_title" value="Quà từ GM">
                </div>
                <div class="field">
                    <label>Nội dung thư</label>
                    <input type="text" id="mail_content" value="Chúc mừng!">
                </div>
            </div>
            <div class="row2">
                <div class="field">
                    <label>Vật phẩm</label>
                    <select id="mailid">
                        <?php
                        $f = @fopen("item.txt","r");
                        if($f){ while(!feof($f)){ $t=explode(';',fgets($f));
                            if(trim($t[0])!=='') echo '<option value="'.htmlspecialchars(trim($t[0])).'">'.htmlspecialchars(trim($t[1]??'')).'</option>';
                        } fclose($f); } ?>
                    </select>
                </div>
                <div class="field">
                    <label>Số lượng</label>
                    <input type="number" id="mailnum" value="1" min="1" max="999999999">
                </div>
            </div>
            <div id="res-mail" class="result"></div>
            <div class="btn-row">
                <button class="btn btn-blue" onclick="sendMail()">📨 Gửi cho nhân vật</button>
                <button class="btn btn-red" onclick="sendAllMail()">📣 Gửi toàn server</button>
            </div>
        </div>
    </div>

    <!-- Tab: Charge -->
    <div id="tab-charge" class="tab-panel">
        <div class="card">
            <h3>Nạp tiền / vật phẩm đặc biệt</h3>
            <div class="row2">
                <div class="field">
                    <label>Gói nạp</label>
                    <select id="chargetype">
                        <?php
                        $cd = json_decode(file_get_contents("charge.json"),true);
                        foreach($cd as $k=>$v) echo '<option value="'.htmlspecialchars($k).'">'.htmlspecialchars($v['name']).'</option>';
                        ?>
                    </select>
                </div>
                <div class="field">
                    <label>Số lần nạp (1–10)</label>
                    <input type="number" id="chargenum" value="1" min="1" max="10">
                </div>
            </div>
            <div id="res-charge" class="result"></div>
            <button class="btn btn-green btn-full" style="margin-top:14px" onclick="doCharge()">💳 Nạp ngay</button>
        </div>
    </div>

    <!-- Tab: Notice -->
    <div id="tab-notice" class="tab-panel">
        <div class="card">
            <h3>Thông báo toàn server (hiện cho tất cả người chơi)</h3>
            <div class="field">
                <label>Nội dung thông báo</label>
                <textarea id="noticemsg" placeholder="Nhập nội dung thông báo..."></textarea>
            </div>
            <div id="res-notice" class="result"></div>
            <button class="btn btn-orange btn-full" style="margin-top:14px" onclick="sendNotice()">📢 Gửi thông báo</button>
        </div>
    </div>

    <!-- Tab: Ban -->
    <div id="tab-ban" class="tab-panel">
        <div class="card">
            <h3>Cấm / Gỡ cấm nhân vật đang chọn</h3>
            <div id="res-ban" class="result"></div>
            <div class="btn-row" style="margin-top:0">
                <button class="btn btn-red" onclick="doBan()">🔨 Ban 30 ngày</button>
                <button class="btn btn-green" onclick="doUnban()">✅ Gỡ cấm</button>
            </div>
        </div>
    </div>

    <!-- Tab: Pay Settings -->
    <div id="tab-paysettings" class="tab-panel">
        <div class="card">
            <h3>Trạng thái thanh toán</h3>
            <div style="display:flex;align-items:center;gap:14px;padding:10px 0">
                <label class="toggle-wrap" style="display:flex;align-items:center;gap:10px;cursor:pointer">
                    <div style="position:relative;width:50px;height:26px">
                        <input type="checkbox" id="pay-enabled" style="opacity:0;width:0;height:0;position:absolute">
                        <span id="toggle-track" onclick="togglePayEnabled()" style="position:absolute;inset:0;border-radius:13px;background:#373e47;cursor:pointer;transition:.2s"></span>
                        <span id="toggle-thumb" style="position:absolute;left:3px;top:3px;width:20px;height:20px;border-radius:50%;background:#fff;transition:.2s;pointer-events:none"></span>
                    </div>
                    <span id="pay-status-label" style="font-size:14px;font-weight:bold;color:#768390">Đang tải...</span>
                </label>
            </div>
            <p style="font-size:12px;color:#768390;margin-top:4px">
                <b>ON</b> = thanh toán qua cổng đã cấu hình &nbsp;|&nbsp; <b>OFF</b> = free-to-buy (player nhận KNB miễn phí)
            </p>
        </div>

        <div class="card" id="pay-method-card">
            <h3>Phương thức thanh toán</h3>
            <div class="field">
                <label>Chọn cổng thanh toán</label>
                <select id="pay-method" onchange="onMethodChange()">
                    <option value="paypal">PayPal</option>
                    <option value="free">Free (không cần cổng)</option>
                </select>
            </div>
        </div>

        <div class="card" id="paypal-cred-card">
            <h3>Thông tin PayPal</h3>
            <div class="field">
                <label>Client ID</label>
                <input type="text" id="paypal-client-id" placeholder="AXXX...">
            </div>
            <div class="field">
                <label>Client Secret</label>
                <input type="password" id="paypal-client-secret" placeholder="EXXX...">
            </div>
            <div style="display:flex;align-items:center;gap:10px;margin-bottom:8px">
                <input type="checkbox" id="paypal-sandbox" style="width:auto">
                <label for="paypal-sandbox" style="font-size:13px;color:#e6edf3;cursor:pointer">Chế độ Sandbox (test)</label>
            </div>
            <p style="font-size:11px;color:#768390">
                Lấy credentials tại <span style="color:#79c0ff">developer.paypal.com</span> → My Apps &amp; Credentials
            </p>
        </div>

        <div id="res-paysettings" class="result"></div>
        <div class="btn-row">
            <button class="btn btn-blue" onclick="loadPaySettings()">🔄 Tải lại</button>
            <button class="btn btn-green" onclick="savePaySettings()">💾 Lưu cài đặt</button>
        </div>
    </div>

    <!-- Tab: Config Vật Phẩm -->
    <div id="tab-cfgitems" class="tab-panel">
      <div class="card">
        <div style="display:flex;gap:8px;align-items:center;margin-bottom:12px;flex-wrap:wrap">
          <div style="display:flex;gap:6px">
            <button id="cfg-tab-item"   class="btn btn-blue"  onclick="setCfgSection('item')"   style="font-size:12px;padding:5px 12px">📦 Item</button>
            <button id="cfg-tab-shop"   class="btn"           onclick="setCfgSection('shop')"   style="font-size:12px;padding:5px 12px;background:#21262d">🏪 Shop</button>
            <button id="cfg-tab-charge" class="btn"           onclick="setCfgSection('charge')" style="font-size:12px;padding:5px 12px;background:#21262d">💎 Gói Nạp</button>
          </div>
          <input id="cfg-search" style="flex:1;min-width:160px;padding:6px 10px;background:#21262d;border:1px solid #30363d;border-radius:6px;color:#e6edf3;font-size:13px;outline:none" placeholder="Tìm tên / ID...">
          <button class="btn btn-blue" onclick="loadCfgData()" style="font-size:12px;padding:5px 12px">🔍 Tìm</button>
          <span id="cfg-total" style="color:#768390;font-size:12px"></span>
        </div>
        <div id="cfg-result" style="color:#768390;font-size:13px;min-height:40px"></div>
        <table style="width:100%;border-collapse:collapse;font-size:13px;margin-top:8px">
          <thead id="cfg-thead"></thead>
          <tbody id="cfg-tbody"></tbody>
        </table>
        <div id="cfg-pager" style="display:flex;gap:4px;flex-wrap:wrap;margin-top:10px"></div>
      </div>
      <!-- Modal sửa item/shop/charge -->
      <div id="cfg-modal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,.6);z-index:9999;align-items:center;justify-content:center">
        <div style="background:#161b22;border:1px solid #30363d;border-radius:10px;padding:24px;min-width:340px;max-width:480px;width:90%">
          <h3 id="cfg-modal-title" style="margin-bottom:16px;color:#f78166"></h3>
          <div id="cfg-modal-body"></div>
          <div style="display:flex;gap:8px;margin-top:16px;justify-content:flex-end">
            <button class="btn btn-blue" onclick="saveCfgModal()">💾 Lưu</button>
            <button class="btn" style="background:#21262d" onclick="document.getElementById('cfg-modal').style.display='none'">Huỷ</button>
          </div>
          <div id="cfg-modal-res" style="margin-top:8px;font-size:13px"></div>
        </div>
      </div>
    </div>

    <!-- Tab: Danger -->
    <div id="tab-danger" class="tab-panel">
        <div class="card" style="border-color:#b91c1c">
            <h3 style="color:#f85149">⚠ Khu vực nguy hiểm — Không thể hoàn tác!</h3>
            <p style="font-size:13px;color:#768390;margin-bottom:16px">
                Các thao tác dưới đây sẽ xóa dữ liệu vĩnh viễn. Hãy chắc chắn trước khi thực hiện.
            </p>
            <div style="background:#2d1212;border:1px solid #b91c1c;border-radius:6px;padding:14px;margin-bottom:0">
                <div style="font-size:14px;font-weight:bold;color:#f85149;margin-bottom:8px">🗑 Xóa nhân vật</div>
                <div style="font-size:13px;color:#e6edf3;margin-bottom:12px">
                    Xóa toàn bộ dữ liệu nhân vật <strong id="delete-target-name" style="color:#f78166">«chưa chọn»</strong> khỏi database.
                    Tài khoản đăng nhập vẫn còn, chỉ mất nhân vật trong game.
                </div>
                <div id="res-delete" class="result"></div>
                <button class="btn btn-red btn-full" style="margin-top:10px" onclick="doDeletePlayer()">🗑 Xóa nhân vật vĩnh viễn</button>
            </div>
        </div>
    </div>
</div>

<script>
// ── State ────────────────────────────────────────────────
var allPlayers = [];
var selectedPlayer = null;

// ── Player list ──────────────────────────────────────────
function loadPlayers() {
    var checknum = document.getElementById('checknum').value.trim();
    var qu       = document.getElementById('qu').value;
    var search   = document.getElementById('search').value.trim();
    if (!checknum) { alert('Vui lòng nhập mã GM trước!'); return; }
    document.getElementById('playerList').innerHTML = '<div class="no-player">⏳ Đang tải...</div>';
    var url = 'user/players.php?checknum=' + encodeURIComponent(checknum)
            + '&qu=' + encodeURIComponent(qu)
            + '&search=' + encodeURIComponent(search);
    fetch(url).then(r => r.json()).then(data => {
        if (data.error) {
            document.getElementById('playerList').innerHTML = '<div class="no-player">❌ ' + data.error + '</div>';
            return;
        }
        allPlayers = data.players;
        renderPlayers(allPlayers);
    }).catch(e => {
        document.getElementById('playerList').innerHTML = '<div class="no-player">❌ Lỗi kết nối</div>';
    });
}

function renderPlayers(list) {
    var html = '';
    list.forEach(function(p) {
        var idx = allPlayers.indexOf(p);
        var lastSeen = p.lastSeen > 0 ? new Date(p.lastSeen * 1000).toLocaleDateString('vi-VN') : '—';
        var vipBadge = p.vip > 0 ? '<span class="pvip">VIP' + p.vip + '</span> ' : '';
        var sel = selectedPlayer && selectedPlayer.name === p.name ? ' selected' : '';
        html += '<div class="player-item' + sel + '" data-idx="' + idx + '">'
              + '<div class="pname">' + esc(p.name) + '</div>'
              + '<div class="pmeta">' + vipBadge + 'Lv.' + p.level + ' &nbsp;·&nbsp; CS: ' + fmtNum(p.fightValue) + ' &nbsp;·&nbsp; ' + lastSeen + '</div>'
              + '</div>';
    });
    document.getElementById('playerList').innerHTML = html || '<div class="no-player">Không tìm thấy nhân vật</div>';
    document.getElementById('playerCount').textContent = 'Hiển thị ' + list.length + ' nhân vật';
    document.querySelectorAll('#playerList .player-item').forEach(function(el) {
        el.addEventListener('click', function() { selectPlayer(parseInt(this.getAttribute('data-idx'))); });
    });
}
function filterPlayers() {
    var q = document.getElementById('search').value.toLowerCase();
    if (!q) { renderPlayers(allPlayers); return; }
    renderPlayers(allPlayers.filter(p => p.name.toLowerCase().includes(q)));
}

function selectPlayer(idx) {
    var p = allPlayers[idx];
    if (!p) return;
    selectedPlayer = p;
    document.getElementById('selectedName').textContent = p.name;
    document.getElementById('selectedName').classList.remove('no-selection');
    var lastSeen = p.lastSeen > 0 ? new Date(p.lastSeen * 1000).toLocaleDateString('vi-VN') : '—';
    document.getElementById('selectedMeta').textContent =
        'Lv.' + p.level + '  ·  Chiến sức: ' + fmtNum(p.fightValue) +
        (p.vip > 0 ? '  ·  VIP' + p.vip : '') + '  ·  Online lần cuối: ' + lastSeen;
    document.getElementById('delete-target-name').textContent = '«' + p.name + '»';
    renderPlayers(allPlayers.filter(function(x){
        var q = document.getElementById('search').value.toLowerCase();
        return !q || x.name.toLowerCase().includes(q);
    }));
}

// ── Tabs ─────────────────────────────────────────────────
function showTab(name, btn) {
    document.querySelectorAll('.tab-panel').forEach(function(el){ el.classList.remove('active'); });
    document.querySelectorAll('.tab-btn').forEach(function(el){ el.classList.remove('active'); });
    document.getElementById('tab-' + name).classList.add('active');
    btn.classList.add('active');
}

// ── API helper ───────────────────────────────────────────
function checkSelected(resId) {
    if (!selectedPlayer) { showResult(resId, '❌ Hãy chọn nhân vật từ danh sách bên trái!', 'err'); return false; }
    return true;
}
function checkGM(resId) {
    if (!document.getElementById('checknum').value.trim()) { showResult(resId, '❌ Vui lòng nhập mã GM!', 'err'); return false; }
    return true;
}

function showResult(id, msg, cls) {
    var el = document.getElementById(id);
    var c  = cls || (msg.startsWith('✅') ? 'ok' : msg.startsWith('⏳') ? 'loading' : 'err');
    el.className = 'result ' + c;
    el.textContent = msg;
    el.style.display = 'block';
}

function postGM(data, resId) {
    showResult(resId, '⏳ Đang xử lý...', 'loading');
    data.checknum = document.getElementById('checknum').value.trim();
    data.qu       = document.getElementById('qu').value;
    fetch('user/gmquery.php', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'},
        body: new URLSearchParams(data).toString()
    }).then(r => r.text()).then(txt => showResult(resId, txt))
      .catch(e => showResult(resId, '❌ Lỗi kết nối: ' + e, 'err'));
}

// ── Actions ──────────────────────────────────────────────
function sendMail() {
    if (!checkGM('res-mail') || !checkSelected('res-mail')) return;
    postGM({ type:'mail', uid: selectedPlayer.name,
        item: document.getElementById('mailid').value,
        num:  document.getElementById('mailnum').value,
        title:   document.getElementById('mail_title').value || 'Quà từ GM',
        content: document.getElementById('mail_content').value || 'Chúc mừng!'
    }, 'res-mail');
}

function sendAllMail() {
    if (!checkGM('res-mail')) return;
    if (!confirm('Xác nhận gửi toàn bộ nhân vật trên server?')) return;
    postGM({ type:'allmail', uid:'86284186',
        item: document.getElementById('mailid').value,
        num:  document.getElementById('mailnum').value,
        title:   document.getElementById('mail_title').value || 'Quà từ GM',
        content: document.getElementById('mail_content').value || 'Chúc mừng!'
    }, 'res-mail');
}

function doCharge() {
    if (!checkGM('res-charge') || !checkSelected('res-charge')) return;
    var num = parseInt(document.getElementById('chargenum').value);
    if (num < 1 || num > 10) { showResult('res-charge','❌ Số lần nạp từ 1-10!','err'); return; }
    postGM({ type:'charge', uid: selectedPlayer.name,
        chargetype: document.getElementById('chargetype').value,
        chargenum:  num
    }, 'res-charge');
}

function sendNotice() {
    if (!checkGM('res-notice')) return;
    var msg = document.getElementById('noticemsg').value.trim();
    if (!msg) { showResult('res-notice','❌ Nội dung không được trống!','err'); return; }
    postGM({ type:'notice', uid:'null', noticemsg: msg }, 'res-notice');
}

function doBan() {
    if (!checkGM('res-ban') || !checkSelected('res-ban')) return;
    if (!confirm('Ban «' + selectedPlayer.name + '» 30 ngày?')) return;
    postGM({ type:'ban', uid: selectedPlayer.name }, 'res-ban');
}

function doUnban() {
    if (!checkGM('res-ban') || !checkSelected('res-ban')) return;
    postGM({ type:'unban', uid: selectedPlayer.name }, 'res-ban');
}

function doDeletePlayer() {
    if (!checkGM('res-delete') || !checkSelected('res-delete')) return;
    var name = selectedPlayer.name;
    var confirm1 = confirm('⚠ Xóa nhân vật «' + name + '»?\nThao tác này KHÔNG THỂ HOÀN TÁC!');
    if (!confirm1) return;
    var confirm2 = prompt('Nhập lại tên nhân vật để xác nhận xóa:');
    if (confirm2 === null) return;
    if (confirm2.trim() !== name) { showResult('res-delete', '❌ Tên nhân vật không khớp, hủy xóa.', 'err'); return; }
    postGM({ type:'delete', uid: name }, 'res-delete');
    // Remove from local list after delete
    var el = document.querySelector('#res-delete');
    var origThen = el._observer;
    var check = setInterval(function(){
        if (el.classList.contains('ok')) {
            clearInterval(check);
            allPlayers = allPlayers.filter(function(p){ return p.name !== name; });
            selectedPlayer = null;
            document.getElementById('selectedName').textContent = 'Chưa chọn nhân vật';
            document.getElementById('selectedName').classList.add('no-selection');
            document.getElementById('selectedMeta').textContent = '';
            document.getElementById('delete-target-name').textContent = '«chưa chọn»';
            renderPlayers(allPlayers);
        }
    }, 300);
}

// ── Utils ────────────────────────────────────────────────
function esc(s){ var d=document.createElement('div'); d.textContent=s; return d.innerHTML; }
function fmtNum(n){ return Number(n).toLocaleString('vi-VN'); }

// Auto-load when GM code filled and Enter pressed
document.getElementById('checknum').addEventListener('keydown', function(e){
    if (e.key === 'Enter') loadPlayers();
});

// ── Pay Settings ─────────────────────────────────────────
var _payEnabled = true;

function loadPaySettings() {
    var checknum = document.getElementById('checknum').value.trim();
    if (!checknum) { showResult('res-paysettings', '❌ Vui lòng nhập mã GM trước!', 'err'); return; }
    fetch('user/gmquery.php', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'},
        body: new URLSearchParams({ type:'pay_settings', action:'get', checknum: checknum, qu: document.getElementById('qu').value }).toString()
    }).then(r => r.json()).then(cfg => {
        _payEnabled = cfg.enabled !== false;
        document.getElementById('pay-method').value      = cfg.method || 'paypal';
        document.getElementById('paypal-client-id').value     = cfg.paypal_client_id || '';
        document.getElementById('paypal-client-secret').value = cfg.paypal_client_secret || '';
        document.getElementById('paypal-sandbox').checked     = cfg.paypal_sandbox !== false;
        setToggle(_payEnabled);
        onMethodChange();
    }).catch(e => showResult('res-paysettings', '❌ Lỗi: ' + e, 'err'));
}

function setToggle(on) {
    _payEnabled = on;
    var track = document.getElementById('toggle-track');
    var thumb = document.getElementById('toggle-thumb');
    var label = document.getElementById('pay-status-label');
    if (on) {
        track.style.background = '#238636';
        thumb.style.left = '27px';
        label.style.color = '#3fb950';
        label.textContent = '✅ BẬT — Thanh toán đang hoạt động';
    } else {
        track.style.background = '#373e47';
        thumb.style.left = '3px';
        label.style.color = '#f85149';
        label.textContent = '🎁 TẮT — Chế độ Free-to-Buy';
    }
}

function togglePayEnabled() { setToggle(!_payEnabled); }

function onMethodChange() {
    var method = document.getElementById('pay-method').value;
    document.getElementById('paypal-cred-card').style.display = method === 'paypal' ? 'block' : 'none';
}

function savePaySettings() {
    var checknum = document.getElementById('checknum').value.trim();
    if (!checknum) { showResult('res-paysettings', '❌ Vui lòng nhập mã GM trước!', 'err'); return; }
    showResult('res-paysettings', '⏳ Đang lưu...', 'loading');
    fetch('user/gmquery.php', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8'},
        body: new URLSearchParams({
            type:                  'pay_settings',
            action:                'save',
            checknum:              checknum,
            qu:                    document.getElementById('qu').value,
            enabled:               _payEnabled ? '1' : '0',
            method:                document.getElementById('pay-method').value,
            paypal_client_id:      document.getElementById('paypal-client-id').value,
            paypal_client_secret:  document.getElementById('paypal-client-secret').value,
            paypal_sandbox:        document.getElementById('paypal-sandbox').checked ? '1' : '0',
        }).toString()
    }).then(r => r.text()).then(txt => showResult('res-paysettings', txt))
      .catch(e => showResult('res-paysettings', '❌ Lỗi kết nối: ' + e, 'err'));
}

// Load pay settings when tab opened
document.querySelector('[onclick="showTab(\'paysettings\',this)"]').addEventListener('click', function(){
    setTimeout(loadPaySettings, 100);
});

// ── Config Vật Phẩm ──────────────────────────────────────
var cfgSection = 'item', cfgPage = 1, cfgSize = 50, cfgInited = false;
var cfgModalData = {};

function initCfgTab() { if (!cfgInited) { cfgInited = true; loadCfgData(); } }

function setCfgSection(s) {
    cfgSection = s; cfgPage = 1;
    ['item','shop','charge'].forEach(function(x){
        var el = document.getElementById('cfg-tab-'+x);
        if (el) el.style.background = x === s ? '#1f6feb' : '#21262d';
    });
    loadCfgData();
}

function loadCfgData(page) {
    cfgPage = page || 1;
    var checknum = document.getElementById('checknum').value.trim();
    if (!checknum) { document.getElementById('cfg-result').textContent = '❌ Nhập mã GM trước'; return; }
    var q = document.getElementById('cfg-search').value.trim();
    document.getElementById('cfg-result').textContent = '⏳ Đang tải...';
    document.getElementById('cfg-tbody').innerHTML = '';

    fetch('user/gmquery.php', {
        method: 'POST',
        headers: {'Content-Type':'application/x-www-form-urlencoded'},
        body: new URLSearchParams({
            type: 'cfg_' + cfgSection,
            action: 'list',
            checknum: checknum,
            qu: document.getElementById('qu').value,
            q: q,
            page: cfgPage,
            size: cfgSize
        }).toString()
    }).then(function(r){ return r.text(); }).then(function(txt){
        var d;
        try { d = JSON.parse(txt); } catch(e) {
            document.getElementById('cfg-result').textContent = '❌ Server trả: ' + txt.substring(0,200);
            return;
        }
        if (d.code !== 0) { document.getElementById('cfg-result').textContent = '❌ ' + d.msg; return; }
        document.getElementById('cfg-result').textContent = '';
        document.getElementById('cfg-total').textContent = 'Tổng: ' + (d.total || d.data.length);
        renderCfgTable(d.data);
        if (d.total) renderCfgPager(d.total);
    }).catch(function(e){ document.getElementById('cfg-result').textContent = '❌ Lỗi kết nối: ' + e; });
}

var TH_ITEM   = '<tr><th style="width:44px;border-bottom:1px solid #30363d"></th><th style="text-align:left;padding:6px;border-bottom:1px solid #30363d;color:#768390">ID</th><th style="text-align:left;padding:6px;border-bottom:1px solid #30363d;color:#768390">Tên</th><th style="text-align:left;padding:6px;border-bottom:1px solid #30363d;color:#768390">Chất lượng</th><th style="padding:6px;border-bottom:1px solid #30363d"></th></tr>';
var ICON_BASE = '/svnres/default/assets/icon/item/big/';
var TH_SHOP   = '<tr><th style="text-align:left;padding:6px;border-bottom:1px solid #30363d;color:#768390">GoodsID</th><th style="text-align:left;padding:6px;border-bottom:1px solid #30363d;color:#768390">Vật phẩm</th><th style="text-align:left;padding:6px;border-bottom:1px solid #30363d;color:#768390">Giá</th><th style="text-align:left;padding:6px;border-bottom:1px solid #30363d;color:#768390">Loại tiền</th><th style="text-align:left;padding:6px;border-bottom:1px solid #30363d;color:#768390">Giới hạn</th><th style="padding:6px;border-bottom:1px solid #30363d"></th></tr>';
var TH_CHARGE = '<tr><th style="text-align:left;padding:6px;border-bottom:1px solid #30363d;color:#768390">ID</th><th style="text-align:left;padding:6px;border-bottom:1px solid #30363d;color:#768390">Tên gói</th><th style="text-align:left;padding:6px;border-bottom:1px solid #30363d;color:#768390">Giá (rmb)</th><th style="text-align:left;padding:6px;border-bottom:1px solid #30363d;color:#768390">KNB</th><th style="padding:6px;border-bottom:1px solid #30363d"></th></tr>';
var COST_TYPES = {1:'Vàng',2:'KNB',3:'Công Huân',5:'Linh Hồn',7:'Vô Song',9:'Quân Đoàn'};
var LIMIT_TYPES = {0:'∞',1:'Ngày',2:'Tổng',3:'Tuần'};

var _cfgRows = [];
function renderCfgTable(data) {
    _cfgRows = data;
    var thead = document.getElementById('cfg-thead');
    var tbody = document.getElementById('cfg-tbody');
    var td = 'style="padding:6px 8px;border-bottom:1px solid #21262d;vertical-align:middle"';
    var html = '';
    if (cfgSection === 'item') {
        thead.innerHTML = TH_ITEM;
        data.forEach(function(it, i){
            var iconHtml = it.icon
                ? '<img src="'+ICON_BASE+it.icon+'.png" style="width:36px;height:36px;object-fit:contain;display:block;margin:auto" onerror="this.style.display=\'none\'">'
                : '';
            html += '<tr>'
                +'<td style="padding:4px 6px;border-bottom:1px solid #21262d;text-align:center;width:44px">'+iconHtml+'</td>'
                +'<td '+td+'>'+it.id+'</td>'
                +'<td '+td+'>'+esc(it.name)+'</td>'
                +'<td '+td+'>'+it.itemQuality+'</td>'
                +'<td '+td+'><button class="btn btn-blue" style="font-size:11px;padding:3px 10px" onclick="openCfgModal('+i+')">Sửa</button></td></tr>';
        });
    } else if (cfgSection === 'shop') {
        thead.innerHTML = TH_SHOP;
        data.forEach(function(s, i){
            html += '<tr><td '+td+'>'+s.goodsId+'</td>'
                +'<td '+td+'>'+esc(s.itemName)+' x'+s.rewardNum+'</td>'
                +'<td '+td+'>'+s.costNum+'</td>'
                +'<td '+td+'>'+(COST_TYPES[s.costType]||s.costType)+'</td>'
                +'<td '+td+'>'+(s.sellTimes > 0 ? s.sellTimes+' ('+LIMIT_TYPES[s.limitType||0]+')' : '∞')+'</td>'
                +'<td '+td+'><button class="btn btn-blue" style="font-size:11px;padding:3px 10px" onclick="openCfgModal('+i+')">Sửa</button></td></tr>';
        });
    } else {
        thead.innerHTML = TH_CHARGE;
        data.forEach(function(c, i){
            html += '<tr><td '+td+'>'+c.id+'</td>'
                +'<td '+td+'>'+esc(c.name)+'</td>'
                +'<td '+td+'>'+(c.rmb/1000).toLocaleString()+' VNĐ</td>'
                +'<td '+td+'>'+c.money.toLocaleString()+'</td>'
                +'<td '+td+'><button class="btn btn-blue" style="font-size:11px;padding:3px 10px" onclick="openCfgModal('+i+')">Sửa</button></td></tr>';
        });
    }
    tbody.innerHTML = html;
}

function renderCfgPager(total) {
    var pages = Math.ceil(total / cfgSize);
    var el = document.getElementById('cfg-pager');
    if (pages <= 1) { el.innerHTML = ''; return; }
    var html = '';
    var s = Math.max(1, cfgPage-3), e = Math.min(pages, cfgPage+3);
    if (s > 1) html += '<button class="btn" style="font-size:11px;padding:3px 8px;background:#21262d" onclick="loadCfgData(1)">«</button>';
    for (var p = s; p <= e; p++) {
        var active = p === cfgPage ? 'background:#1f6feb' : 'background:#21262d';
        html += '<button class="btn" style="font-size:11px;padding:3px 8px;'+active+'" onclick="loadCfgData('+p+')">'+p+'</button>';
    }
    if (e < pages) html += '<button class="btn" style="font-size:11px;padding:3px 8px;background:#21262d" onclick="loadCfgData('+pages+')">»</button>';
    el.innerHTML = html;
}

function openCfgModal(idx) {
    var data = _cfgRows[idx];
    cfgModalData = data;
    var modal = document.getElementById('cfg-modal');
    var title = document.getElementById('cfg-modal-title');
    var body  = document.getElementById('cfg-modal-body');
    document.getElementById('cfg-modal-res').textContent = '';
    var field = function(label, id, val, type) {
        return '<div style="margin-bottom:12px"><label style="display:block;color:#768390;font-size:12px;margin-bottom:4px">'+label+'</label>'
             + '<input id="cfm-'+id+'" value="'+esc(String(val))+'" type="'+(type||'text')+'" style="width:100%;padding:7px 10px;background:#21262d;border:1px solid #30363d;border-radius:6px;color:#e6edf3;font-size:13px;outline:none"></div>';
    };
    var ro = function(label, val) {
        return '<div style="margin-bottom:12px"><label style="display:block;color:#768390;font-size:12px;margin-bottom:4px">'+label+'</label>'
             + '<div style="padding:7px 10px;background:#0d1117;border:1px solid #30363d;border-radius:6px;color:#768390;font-size:13px">'+esc(String(val))+'</div></div>';
    };
    if (cfgSection === 'item') {
        title.textContent = 'Sửa Item #' + data.id;
        body.innerHTML = ro('ID', data.id) + field('Tên', 'name', data.name);
    } else if (cfgSection === 'shop') {
        title.textContent = 'Sửa Shop GoodsID #' + data.goodsId;
        body.innerHTML = ro('GoodsID', data.goodsId)
            + ro('Vật phẩm', data.itemName + ' x' + data.rewardNum)
            + field('Giá (costNum)', 'costNum', data.costNum, 'number')
            + field('Giới hạn mua (0=∞)', 'sellTimes', data.sellTimes, 'number');
    } else {
        title.textContent = 'Sửa Gói Nạp #' + data.id;
        body.innerHTML = ro('ID', data.id)
            + field('Tên gói', 'name', data.name)
            + field('Giá (rmb, đơn vị 1/1000 VNĐ)', 'rmb', data.rmb, 'number')
            + field('KNB nhận (money)', 'money', data.money, 'number');
    }
    modal.style.display = 'flex';
}

function saveCfgModal() {
    var checknum = document.getElementById('checknum').value.trim();
    var payload = { checknum: checknum, qu: document.getElementById('qu').value };
    if (cfgSection === 'item') {
        payload.type = 'cfg_item'; payload.action = 'save';
        payload.id   = cfgModalData.id;
        payload.name = document.getElementById('cfm-name').value.trim();
    } else if (cfgSection === 'shop') {
        payload.type     = 'cfg_shop'; payload.action = 'save';
        payload.goodsId  = cfgModalData.goodsId;
        payload.costNum  = document.getElementById('cfm-costNum').value;
        payload.sellTimes= document.getElementById('cfm-sellTimes').value;
    } else {
        payload.type  = 'cfg_charge'; payload.action = 'save';
        payload.id    = cfgModalData.id;
        payload.name  = document.getElementById('cfm-name').value.trim();
        payload.rmb   = document.getElementById('cfm-rmb').value;
        payload.money = document.getElementById('cfm-money').value;
    }
    var res = document.getElementById('cfg-modal-res');
    res.textContent = '⏳ Đang lưu...';
    fetch('user/gmquery.php', {
        method: 'POST',
        headers: {'Content-Type':'application/x-www-form-urlencoded'},
        body: new URLSearchParams(payload).toString()
    }).then(r=>r.json()).then(function(d){
        res.style.color = d.code === 0 ? '#3fb950' : '#f85149';
        res.textContent = d.code === 0 ? '✅ ' + d.msg : '❌ ' + d.msg;
        if (d.code === 0) { loadCfgData(cfgPage); setTimeout(function(){ document.getElementById('cfg-modal').style.display='none'; }, 800); }
    }).catch(function(){ res.style.color='#f85149'; res.textContent='❌ Lỗi kết nối'; });
}

document.getElementById('cfg-search').addEventListener('keypress', function(e){ if(e.key==='Enter') loadCfgData(); });
document.getElementById('cfg-modal').addEventListener('click', function(e){ if(e.target===this) this.style.display='none'; });
</script>
</body>
</html>
