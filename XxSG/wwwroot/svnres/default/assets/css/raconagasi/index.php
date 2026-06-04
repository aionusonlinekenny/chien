<?php include_once './user/config.php'; ?>
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

/* GM code field at top */
.gm-code-bar{background:#161b22;border-bottom:1px solid #30363d;padding:10px 16px;display:flex;align-items:center;gap:10px}
.gm-code-bar label{font-size:12px;color:#768390;white-space:nowrap}
.gm-code-bar input{flex:1;padding:6px 10px;background:#21262d;border:1px solid #30363d;border-radius:6px;color:#e6edf3;font-size:13px;outline:none}

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
        <label>Mã GM:</label>
        <input type="password" id="checknum" placeholder="raconagasi" autocomplete="off">
    </div>
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
        var lastSeen = p.lastSeen > 0 ? new Date(p.lastSeen * 1000).toLocaleDateString('vi-VN') : '—';
        var vipBadge = p.vip > 0 ? '<span class="pvip">VIP' + p.vip + '</span> ' : '';
        html += '<div class="player-item' + (selectedPlayer && selectedPlayer.name === p.name ? ' selected' : '')
              + '" onclick="selectPlayer(' + JSON.stringify(p).replace(/'/g,"&#39;") + ')">'
              + '<div class="pname">' + esc(p.name) + '</div>'
              + '<div class="pmeta">' + vipBadge + 'Lv.' + p.level + ' &nbsp;·&nbsp; CS: ' + fmtNum(p.fightValue) + ' &nbsp;·&nbsp; ' + lastSeen + '</div>'
              + '</div>';
    });
    document.getElementById('playerList').innerHTML = html || '<div class="no-player">Không tìm thấy nhân vật</div>';
    document.getElementById('playerCount').textContent = 'Hiển thị ' + list.length + ' nhân vật';
}

function filterPlayers() {
    var q = document.getElementById('search').value.toLowerCase();
    if (!q) { renderPlayers(allPlayers); return; }
    renderPlayers(allPlayers.filter(p => p.name.toLowerCase().includes(q)));
}

function selectPlayer(p) {
    selectedPlayer = p;
    document.getElementById('selectedName').textContent = p.name;
    document.getElementById('selectedName').classList.remove('no-selection');
    var lastSeen = p.lastSeen > 0 ? new Date(p.lastSeen * 1000).toLocaleDateString('vi-VN') : '—';
    document.getElementById('selectedMeta').textContent =
        'Lv.' + p.level + '  ·  Chiến sức: ' + fmtNum(p.fightValue) +
        (p.vip > 0 ? '  ·  VIP' + p.vip : '') + '  ·  Online lần cuối: ' + lastSeen;
    // Re-render to show highlight
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

// ── Utils ────────────────────────────────────────────────
function esc(s){ var d=document.createElement('div'); d.textContent=s; return d.innerHTML; }
function fmtNum(n){ return Number(n).toLocaleString('vi-VN'); }

// Auto-load when GM code filled and Enter pressed
document.getElementById('checknum').addEventListener('keydown', function(e){
    if (e.key === 'Enter') loadPlayers();
});
</script>
</body>
</html>
