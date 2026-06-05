<?php
// ══════════════════════════════════════════════════════
//  GM API — đọc/ghi item config từ a2825a98.cfg
//  Chỉ admin (role_id >= 1) mới được truy cập
// ══════════════════════════════════════════════════════
include_once '../../global/db.class.php';
header('Content-Type: application/json; charset=utf-8');
error_reporting(0);

function jsonOut($d) { exit(json_encode($d, JSON_UNESCAPED_UNICODE)); }

// ── Auth ─────────────────────────────────────────────
$u = $_SESSION['playuser'] ?? '';
if (!$u) jsonOut(['code' => -1, 'msg' => 'Chưa đăng nhập']);
$row = $db->safe_query("SELECT role_id FROM `account` WHERE `username`=? LIMIT 1", [$u])->fetch(PDO::FETCH_ASSOC);
if (!$row || intval($row['role_id']) < 1)
    jsonOut(['code' => -1, 'msg' => 'Không có quyền']);

// ── Đường dẫn cfg ────────────────────────────────────
$CFG_FILE = realpath(__DIR__ . '/../../svnres/assets/a2825a98.cfg');
$TMP_DIR  = sys_get_temp_dir() . '/gm_cfg_' . posix_getpid();

function loadCfg($cfgFile) {
    $zip = new ZipArchive();
    if ($zip->open($cfgFile) !== true) return null;
    $json = $zip->getFromName('cfg.json');
    $zip->close();
    return json_decode($json, true);
}

function saveCfg($cfgFile, $data) {
    $tmpDir = sys_get_temp_dir() . '/gm_cfg_' . mt_rand();
    mkdir($tmpDir, 0755, true);
    $tmpJson = $tmpDir . '/cfg.json';
    file_put_contents($tmpJson, json_encode($data, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));

    // Tạo ZIP mới
    $zip = new ZipArchive();
    $tmpZip = $tmpDir . '/new.cfg';
    $zip->open($tmpZip, ZipArchive::CREATE | ZipArchive::OVERWRITE);
    $zip->addFile($tmpJson, 'cfg.json');
    $zip->close();

    // Thay thế file gốc
    rename($tmpZip, $cfgFile);
    unlink($tmpJson);
    rmdir($tmpDir);
    return true;
}

$action = $_GET['action'] ?? $_POST['action'] ?? '';

switch ($action) {

    // ── List items ──────────────────────────────────
    case 'items':
        $cfg  = loadCfg($CFG_FILE);
        $page = max(1, intval($_GET['page'] ?? 1));
        $size = min(100, max(10, intval($_GET['size'] ?? 50)));
        $q    = strtolower(trim($_GET['q'] ?? ''));

        $items = [];
        foreach ($cfg['item'] as $id => $item) {
            if ($q && strpos(strtolower($item['name'] ?? ''), $q) === false
                   && strpos($id, $q) === false) continue;
            $items[] = [
                'id'          => intval($id),
                'name'        => $item['name'] ?? '',
                'itemQuality' => $item['itemQuality'] ?? 10,
                'icon'        => $item['icon'] ?? '',
                'des'         => $item['des'] ?? '',
            ];
        }

        usort($items, fn($a, $b) => $a['id'] - $b['id']);
        $total  = count($items);
        $sliced = array_slice($items, ($page - 1) * $size, $size);
        jsonOut(['code' => 0, 'total' => $total, 'data' => $sliced]);

    // ── List shopNormal ─────────────────────────────
    case 'shop':
        $cfg   = loadCfg($CFG_FILE);
        $q     = strtolower(trim($_GET['q'] ?? ''));
        $rows  = [];
        foreach ($cfg['shopNormal'] as $id => $s) {
            $reward = $s['reward_cli'][0] ?? '';
            preg_match('/,(\d+),(\d+)/', $reward, $m);
            $itemId   = intval($m[1] ?? 0);
            $itemName = $cfg['item'][$itemId]['name'] ?? '';
            if ($q && strpos(strtolower($itemName), $q) === false
                   && strpos($id, $q) === false) continue;
            $rows[] = [
                'goodsId'   => intval($id),
                'tabName'   => $s['name'] ?? '',
                'goodsType' => $s['goodsType'] ?? 0,
                'itemId'    => $itemId,
                'itemName'  => $itemName,
                'rewardNum' => intval($m[2] ?? 0),
                'costType'  => $s['costType'] ?? 0,
                'costNum'   => $s['costNum'] ?? 0,
                'sellTimes' => $s['sellTimes'] ?? 0,
                'limitType' => $s['limitType'] ?? 0,
            ];
        }
        usort($rows, fn($a, $b) => $a['goodsId'] - $b['goodsId']);
        jsonOut(['code' => 0, 'total' => count($rows), 'data' => $rows]);

    // ── List charge packages ────────────────────────
    case 'charge':
        $cfg  = loadCfg($CFG_FILE);
        $rows = [];
        foreach ($cfg['charge'] as $id => $c) {
            if (($c['type'] ?? 0) > 0) continue; // bỏ loại phúc lợi
            $rows[] = [
                'id'            => intval($id),
                'name'          => $c['name'] ?? '',
                'sort'          => $c['sort'] ?? 0,
                'rmb'           => $c['rmb'] ?? 0,
                'money'         => $c['money'] ?? 0,
                'firstReward'   => $c['firstReward'] ?? 0,
                'generalReward' => $c['generalReward'] ?? 0,
            ];
        }
        usort($rows, fn($a, $b) => $a['sort'] - $b['sort']);
        jsonOut(['code' => 0, 'data' => $rows]);

    // ── Save item name ──────────────────────────────
    case 'save_item':
        $body  = json_decode(file_get_contents('php://input'), true) ?? [];
        $id    = strval(intval($body['id'] ?? 0));
        $name  = trim($body['name'] ?? '');
        if (!$id || $name === '') jsonOut(['code' => -1, 'msg' => 'Thiếu dữ liệu']);

        $cfg = loadCfg($CFG_FILE);
        if (!isset($cfg['item'][$id])) jsonOut(['code' => -1, 'msg' => 'Item không tồn tại']);
        $cfg['item'][$id]['name'] = $name;
        saveCfg($CFG_FILE, $cfg);
        jsonOut(['code' => 0, 'msg' => 'Đã lưu']);

    // ── Save shop entry ─────────────────────────────
    case 'save_shop':
        $body    = json_decode(file_get_contents('php://input'), true) ?? [];
        $goodsId = strval(intval($body['goodsId'] ?? 0));
        if (!$goodsId) jsonOut(['code' => -1, 'msg' => 'Thiếu goodsId']);

        $cfg = loadCfg($CFG_FILE);
        if (!isset($cfg['shopNormal'][$goodsId])) jsonOut(['code' => -1, 'msg' => 'Không tìm thấy']);

        if (isset($body['costNum']))   $cfg['shopNormal'][$goodsId]['costNum']   = intval($body['costNum']);
        if (isset($body['sellTimes'])) $cfg['shopNormal'][$goodsId]['sellTimes'] = intval($body['sellTimes']);
        saveCfg($CFG_FILE, $cfg);
        jsonOut(['code' => 0, 'msg' => 'Đã lưu']);

    // ── Save charge package ─────────────────────────
    case 'save_charge':
        $body = json_decode(file_get_contents('php://input'), true) ?? [];
        $id   = strval(intval($body['id'] ?? 0));
        if (!$id) jsonOut(['code' => -1, 'msg' => 'Thiếu id']);

        $cfg = loadCfg($CFG_FILE);
        if (!isset($cfg['charge'][$id])) jsonOut(['code' => -1, 'msg' => 'Không tìm thấy']);

        if (isset($body['name']))  $cfg['charge'][$id]['name']  = trim($body['name']);
        if (isset($body['rmb']))   $cfg['charge'][$id]['rmb']   = intval($body['rmb']);
        if (isset($body['money'])) $cfg['charge'][$id]['money'] = intval($body['money']);
        saveCfg($CFG_FILE, $cfg);
        jsonOut(['code' => 0, 'msg' => 'Đã lưu']);

    default:
        jsonOut(['code' => -1, 'msg' => 'Action không hợp lệ']);
}
