<?php
include_once '../global/db.class.php';
$u = $_SESSION['playuser'] ?? '';
if (!$u) { header('Location: ../index.php'); exit; }
$row = $db->safe_query("SELECT role_id FROM `account` WHERE `username`=? LIMIT 1", [$u])->fetch(PDO::FETCH_ASSOC);
if (!$row || intval($row['role_id']) < 1) die('<h3 style="color:red;padding:20px">Không có quyền GM</h3>');
?>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>GM — Quản lý Vật Phẩm</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../layui/css/layui.css">
<style>
body { background:#f0f2f5; }
.layui-tab-title { background:#fff; }
.toolbar { padding:10px 0; display:flex; gap:8px; align-items:center; }
.quality-10{color:#aaa} .quality-20{color:#fff;background:#888;padding:0 3px}
.quality-30{color:#63a} .quality-40{color:#27c} .quality-50{color:#fa0}
</style>
</head>
<body>
<div class="layui-container" style="padding:16px">
  <h2 style="margin-bottom:12px">⚙ GM — Quản lý Config Vật Phẩm</h2>

  <div class="layui-tab layui-tab-brief">
    <ul class="layui-tab-title">
      <li class="layui-this">📦 Vật Phẩm (item)</li>
      <li>🏪 Cửa Hàng (shopNormal)</li>
      <li>💎 Gói Nạp (charge)</li>
    </ul>

    <div class="layui-tab-content">

      <!-- ══ Tab 1: Items ══════════════════════════════ -->
      <div class="layui-tab-item layui-show">
        <div class="toolbar">
          <input id="item-search" class="layui-input" style="width:220px" placeholder="Tìm theo tên hoặc ID...">
          <button class="layui-btn layui-btn-sm" onclick="loadItems()">🔍 Tìm</button>
          <span id="item-total" style="color:#888;font-size:13px"></span>
        </div>
        <table class="layui-table" id="item-table" lay-filter="item-table">
          <colgroup><col width="90"><col><col width="60"><col width="80"></colgroup>
          <thead><tr>
            <th>ID</th><th>Tên</th><th>Chất lượng</th><th>Thao tác</th>
          </tr></thead>
          <tbody id="item-tbody"></tbody>
        </table>
        <div id="item-page" class="layui-box layui-laypage" style="padding:10px 0"></div>
      </div>

      <!-- ══ Tab 2: Shop ═══════════════════════════════ -->
      <div class="layui-tab-item">
        <div class="toolbar">
          <input id="shop-search" class="layui-input" style="width:220px" placeholder="Tìm theo tên vật phẩm...">
          <button class="layui-btn layui-btn-sm" onclick="loadShop()">🔍 Tìm</button>
        </div>
        <table class="layui-table">
          <colgroup><col width="80"><col width="100"><col><col width="100"><col width="100"><col width="90"><col width="80"></colgroup>
          <thead><tr>
            <th>GoodsID</th><th>Tab</th><th>Vật phẩm</th><th>Giá (costNum)</th><th>Loại tiền</th><th>Giới hạn mua</th><th>Thao tác</th>
          </tr></thead>
          <tbody id="shop-tbody"></tbody>
        </table>
      </div>

      <!-- ══ Tab 3: Charge ══════════════════════════════ -->
      <div class="layui-tab-item">
        <p style="color:#888;font-size:13px;padding:8px 0">rmb = đơn vị 1/1000 VNĐ (rmb=2000000 → 2,000 VNĐ). money = số KNB nhận được.</p>
        <table class="layui-table">
          <colgroup><col width="60"><col width="160"><col width="130"><col width="120"><col width="100"></colgroup>
          <thead><tr>
            <th>ID</th><th>Tên gói</th><th>Giá (rmb)</th><th>KNB nhận (money)</th><th>Thao tác</th>
          </tr></thead>
          <tbody id="charge-tbody"></tbody>
        </table>
      </div>

    </div>
  </div>
</div>

<!-- Edit Item Modal -->
<div id="modal-item" style="display:none;padding:20px;min-width:320px">
  <input type="hidden" id="edit-item-id">
  <div class="layui-form-item">
    <label class="layui-form-label">ID</label>
    <div class="layui-input-block"><input id="edit-item-id-show" class="layui-input" readonly></div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">Tên mới</label>
    <div class="layui-input-block"><input id="edit-item-name" class="layui-input" maxlength="40"></div>
  </div>
</div>

<!-- Edit Shop Modal -->
<div id="modal-shop" style="display:none;padding:20px;min-width:320px">
  <input type="hidden" id="edit-shop-id">
  <div class="layui-form-item">
    <label class="layui-form-label">GoodsID</label>
    <div class="layui-input-block"><input id="edit-shop-id-show" class="layui-input" readonly></div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">Vật phẩm</label>
    <div class="layui-input-block"><input id="edit-shop-item" class="layui-input" readonly></div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">Giá (costNum)</label>
    <div class="layui-input-block"><input id="edit-shop-cost" class="layui-input" type="number"></div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">Giới hạn mua</label>
    <div class="layui-input-block"><input id="edit-shop-limit" class="layui-input" type="number"></div>
  </div>
</div>

<!-- Edit Charge Modal -->
<div id="modal-charge" style="display:none;padding:20px;min-width:320px">
  <input type="hidden" id="edit-charge-id">
  <div class="layui-form-item">
    <label class="layui-form-label">ID</label>
    <div class="layui-input-block"><input id="edit-charge-id-show" class="layui-input" readonly></div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">Tên gói</label>
    <div class="layui-input-block"><input id="edit-charge-name" class="layui-input"></div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">Giá (rmb)</label>
    <div class="layui-input-block"><input id="edit-charge-rmb" class="layui-input" type="number"></div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">KNB (money)</label>
    <div class="layui-input-block"><input id="edit-charge-money" class="layui-input" type="number"></div>
  </div>
</div>

<script src="../layui/layui.all.js"></script>
<script>
var layer, $;
layui.use(['layer','jquery','element'], function(){
  layer = layui.layer;
  $ = layui.jquery;
  layui.element.init();

  loadItems();
  loadShop();
  loadCharge();

  $('#item-search').on('keypress', function(e){ if(e.which==13) loadItems(); });
  $('#shop-search').on('keypress', function(e){ if(e.which==13) loadShop(); });
});

var itemPage = 1, itemSize = 50;

function loadItems(page) {
  page = page || 1; itemPage = page;
  var q = $('#item-search').val();
  $.get('api/cfg.php', {action:'items', page:page, size:itemSize, q:q}, function(r){
    if(r.code !== 0) return layer.msg(r.msg);
    $('#item-total').text('Tổng: ' + r.total + ' vật phẩm');
    var html = '';
    r.data.forEach(function(it){
      var qClass = 'quality-' + it.itemQuality;
      html += '<tr>' +
        '<td>' + it.id + '</td>' +
        '<td class="' + qClass + '">' + escHtml(it.name) + '</td>' +
        '<td>' + it.itemQuality + '</td>' +
        '<td><button class="layui-btn layui-btn-xs" onclick="editItem(' + it.id + ',\'' + escJs(it.name) + '\')">Sửa</button></td>' +
        '</tr>';
    });
    $('#item-tbody').html(html);
    renderPager('item-page', r.total, itemSize, page, loadItems);
  });
}

function editItem(id, name) {
  $('#edit-item-id').val(id);
  $('#edit-item-id-show').val(id);
  $('#edit-item-name').val(name);
  layer.open({
    title: 'Sửa tên vật phẩm',
    type: 1,
    content: $('#modal-item'),
    btn: ['💾 Lưu', 'Huỷ'],
    yes: function(idx){
      var newName = $.trim($('#edit-item-name').val());
      if(!newName) return layer.msg('Tên không được rỗng');
      $.ajax({
        url: 'api/cfg.php?action=save_item',
        type: 'POST', contentType: 'application/json',
        data: JSON.stringify({id: id, name: newName}),
        success: function(r){
          layer.close(idx);
          layer.msg(r.code===0 ? '✅ ' + r.msg : '❌ ' + r.msg);
          if(r.code===0) loadItems(itemPage);
        }
      });
    }
  });
}

function loadShop() {
  var q = $('#shop-search').val();
  $.get('api/cfg.php', {action:'shop', q:q}, function(r){
    if(r.code !== 0) return layer.msg(r.msg);
    var costTypes = {1:'Vàng',2:'KNB',3:'Công huân',5:'Linh Hồn',7:'Vô Song',9:'Quân Đoàn'};
    var limitTypes = {0:'Không giới hạn',1:'Mỗi ngày',2:'Tổng cộng',3:'Mỗi tuần'};
    var html = '';
    r.data.forEach(function(s){
      html += '<tr>' +
        '<td>' + s.goodsId + '</td>' +
        '<td>' + escHtml(s.tabName) + '</td>' +
        '<td>' + escHtml(s.itemName) + ' x' + s.rewardNum + '</td>' +
        '<td>' + s.costNum + '</td>' +
        '<td>' + (costTypes[s.costType]||s.costType) + '</td>' +
        '<td>' + (s.sellTimes > 0 ? s.sellTimes + ' (' + (limitTypes[s.limitType]||s.limitType) + ')' : '∞') + '</td>' +
        '<td><button class="layui-btn layui-btn-xs" onclick="editShop(' + JSON.stringify(s) + ')">Sửa</button></td>' +
        '</tr>';
    });
    $('#shop-tbody').html(html);
  });
}

function editShop(s) {
  $('#edit-shop-id').val(s.goodsId);
  $('#edit-shop-id-show').val(s.goodsId);
  $('#edit-shop-item').val(s.itemName + ' x' + s.rewardNum);
  $('#edit-shop-cost').val(s.costNum);
  $('#edit-shop-limit').val(s.sellTimes);
  layer.open({
    title: 'Sửa Cửa Hàng — GoodsID ' + s.goodsId,
    type: 1,
    content: $('#modal-shop'),
    btn: ['💾 Lưu', 'Huỷ'],
    yes: function(idx){
      $.ajax({
        url: 'api/cfg.php?action=save_shop',
        type: 'POST', contentType: 'application/json',
        data: JSON.stringify({
          goodsId: s.goodsId,
          costNum: parseInt($('#edit-shop-cost').val()),
          sellTimes: parseInt($('#edit-shop-limit').val())
        }),
        success: function(r){
          layer.close(idx);
          layer.msg(r.code===0 ? '✅ ' + r.msg : '❌ ' + r.msg);
          if(r.code===0) loadShop();
        }
      });
    }
  });
}

function loadCharge() {
  $.get('api/cfg.php', {action:'charge'}, function(r){
    if(r.code !== 0) return layer.msg(r.msg);
    var html = '';
    r.data.forEach(function(c){
      html += '<tr>' +
        '<td>' + c.id + '</td>' +
        '<td>' + escHtml(c.name) + '</td>' +
        '<td>' + (c.rmb/1000).toLocaleString() + ' VNĐ</td>' +
        '<td>' + c.money.toLocaleString() + ' KNB</td>' +
        '<td><button class="layui-btn layui-btn-xs" onclick="editCharge(' + JSON.stringify(c) + ')">Sửa</button></td>' +
        '</tr>';
    });
    $('#charge-tbody').html(html);
  });
}

function editCharge(c) {
  $('#edit-charge-id').val(c.id);
  $('#edit-charge-id-show').val(c.id);
  $('#edit-charge-name').val(c.name);
  $('#edit-charge-rmb').val(c.rmb);
  $('#edit-charge-money').val(c.money);
  layer.open({
    title: 'Sửa Gói Nạp — ID ' + c.id,
    type: 1,
    content: $('#modal-charge'),
    btn: ['💾 Lưu', 'Huỷ'],
    yes: function(idx){
      $.ajax({
        url: 'api/cfg.php?action=save_charge',
        type: 'POST', contentType: 'application/json',
        data: JSON.stringify({
          id: c.id,
          name: $.trim($('#edit-charge-name').val()),
          rmb: parseInt($('#edit-charge-rmb').val()),
          money: parseInt($('#edit-charge-money').val())
        }),
        success: function(r){
          layer.close(idx);
          layer.msg(r.code===0 ? '✅ ' + r.msg : '❌ ' + r.msg);
          if(r.code===0) loadCharge();
        }
      });
    }
  });
}

function renderPager(elemId, total, size, current, cb) {
  var pages = Math.ceil(total / size);
  if(pages <= 1) { $('#'+elemId).html(''); return; }
  var html = '<div style="display:flex;gap:4px;flex-wrap:wrap">';
  var start = Math.max(1, current-3), end = Math.min(pages, current+3);
  if(start>1) html += btn(1,'«',cb);
  for(var p=start;p<=end;p++) html += btn(p, p, cb, p===current);
  if(end<pages) html += btn(pages,'»',cb);
  html += '</div>';
  $('#'+elemId).html(html);
}
function btn(p, label, cb, active) {
  var s = active ? 'background:#1e9fff;color:#fff;' : '';
  return '<button class="layui-btn layui-btn-sm" style="' + s + '" onclick="('+cb.toString()+')('+p+')">' + label + '</button>';
}
function escHtml(s){ return String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;'); }
function escJs(s){ return String(s).replace(/\\/g,'\\\\').replace(/'/g,"\\'"); }
</script>
</body>
</html>
