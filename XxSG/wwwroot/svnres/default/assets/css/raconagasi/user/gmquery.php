<?php
include 'config.php';

if (!$_POST) {
    exit('Yêu cầu không hợp lệ!');
}

$checknum = trim(poststr('checknum'));
if ($checknum !== $gmcode) {
    exit('Mã GM không đúng!');
}

$quid = trim(poststr('qu'));
if (!isset($quarr[$quid])) {
    exit('Máy chủ không hợp lệ!');
}
$qu      = $quarr[$quid];
$dbip    = $qu['host'];
$dbname  = $qu['dbname'];
$dbuser  = $qu['user'];
$dbpwd   = $qu['pwd'];
$quname  = $qu['name'];
$signkey = $qu['key'];
$url     = $qu['url'];

$type = isset($_POST['type']) ? trim($_POST['type']) : '';
if ($type === '') {
    exit('Loại yêu cầu không tồn tại!');
}

// ── Pay settings (không cần server) ─────────────────────
if ($type === 'pay_settings') {
    $settings_file = __DIR__ . '/../../../../../../pay/settings.json';
    $current = file_exists($settings_file)
        ? (json_decode(file_get_contents($settings_file), true) ?: [])
        : [];

    $action = trim($_POST['action'] ?? '');

    if ($action === 'get') {
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode($current); exit;
    }

    if ($action === 'save') {
        $enabled  = filter_var($_POST['enabled']  ?? true,  FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE) ?? true;
        $method   = in_array($_POST['method'] ?? '', ['paypal','free']) ? $_POST['method'] : 'paypal';
        $clientId = trim($_POST['paypal_client_id']     ?? $current['paypal_client_id']     ?? '');
        $secret   = trim($_POST['paypal_client_secret'] ?? $current['paypal_client_secret'] ?? '');
        $sandbox  = filter_var($_POST['paypal_sandbox'] ?? true, FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE) ?? true;

        $new = [
            'enabled'              => $enabled,
            'method'               => $method,
            'paypal_client_id'     => $clientId,
            'paypal_client_secret' => $secret,
            'paypal_sandbox'       => $sandbox,
        ];
        file_put_contents($settings_file, json_encode($new, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
        exit('✅ Đã lưu cài đặt thanh toán!');
    }

    exit('action không hợp lệ!');
}

// Helper: get playerId from playerName via DB
function getPlayerId($dbip, $dbuser, $dbpwd, $dbname, $playerName) {
    $con = new mysqli($dbip, $dbuser, $dbpwd, $dbname);
    if ($con->connect_error) {
        return array('error' => 'Không kết nối được DB: ' . $con->connect_error);
    }
    $con->set_charset('utf8');
    $stmt = $con->prepare("SELECT `playerId`,`userId` FROM `tb_player` WHERE `playerName`=? LIMIT 1");
    $stmt->bind_param('s', $playerName);
    $stmt->execute();
    $stmt->bind_result($playerId, $userId);
    $stmt->fetch();
    $stmt->close();
    $con->close();
    if (empty($playerId)) {
        return array('error' => "Không tìm thấy nhân vật «{$playerName}» trong [{$dbname}]");
    }
    return array('playerId' => $playerId, 'userId' => $userId);
}

$uid = trim(poststr('uid'));

switch ($type) {

    // ── Notice (toàn server) ──────────────────────────────────────
    case 'notice':
        $noticemsg = trim(poststr('noticemsg'));
        if ($noticemsg === '') exit('Nội dung thông báo không được trống!');
        $postdata = array("cmd" => 12, "type" => 0, "des" => $noticemsg);
        $result   = gmget1($url, $postdata);
        exit($result === '10001' ? '✅ Gửi thông báo thành công!' : '❌ Gửi thất bại: ' . $result);

    // ── Ban ──────────────────────────────────────────────────────
    case 'ban':
        if ($uid === '') exit('Tên nhân vật không được trống!');
        $r = getPlayerId($dbip, $dbuser, $dbpwd, $dbname, $uid);
        if (isset($r['error'])) exit('❌ ' . $r['error']);
        $postdata = array("cmd" => 6, "playerId" => $r['playerId'], "ed" => time() + 64800 * 30, "flag" => "0");
        $result   = gmget1($url, $postdata);
        exit($result === '10001' ? "✅ Đã cấm «{$uid}» 30 ngày!" : '❌ Cấm thất bại: ' . $result);

    // ── Unban ────────────────────────────────────────────────────
    case 'unban':
        if ($uid === '') exit('Tên nhân vật không được trống!');
        $r = getPlayerId($dbip, $dbuser, $dbpwd, $dbname, $uid);
        if (isset($r['error'])) exit('❌ ' . $r['error']);
        $postdata = array("cmd" => 6, "playerId" => $r['playerId'], "ed" => time(), "flag" => "0");
        $result   = gmget1($url, $postdata);
        exit($result === '10001' ? "✅ Đã bỏ cấm «{$uid}»!" : '❌ Bỏ cấm thất bại: ' . $result);

    // ── Charge (nạp tiền cho người chơi) ────────────────────────
    case 'charge':
        if ($uid === '') exit('Tên nhân vật không được trống!');
        $r = getPlayerId($dbip, $dbuser, $dbpwd, $dbname, $uid);
        if (isset($r['error'])) exit('❌ ' . $r['error']);
        $playerId   = $r['playerId'];

        $chargetype = trim(poststr('chargetype'));
        $chargenum  = intval(trim(poststr('chargenum')));
        if ($chargenum < 1 || $chargenum > 10) exit('Số lần nạp phải từ 1-10!');

        $file_path = "../charge.json";
        $data      = json_decode(file_get_contents($file_path), true);
        if (!isset($data[$chargetype])) exit('Gói nạp không tồn tại!');
        $chargename = $data[$chargetype]['name'];
        $num        = $data[$chargetype]['rmb'];
        $subject    = $data[$chargetype]['id'];

        $success = 0;
        for ($i = 0; $i < $chargenum; $i++) {
            $orderNum = date('YmdHis') . substr(md5(uniqid(microtime(true) . mt_rand())), 0, 8);
            $time     = time();
            $sign     = md5($playerId . $num . $time . $subject . $signkey);
            $postdata = array("cmd" => 5, "playerId" => $playerId, "num" => $num,
                "orderNum" => $orderNum, "time" => $time, "sign" => $sign, "subject" => $subject);
            $raw     = gmget1($url, $postdata);
            $decoded = json_decode($raw, true);
            if ($decoded !== null && isset($decoded["errorCode"]) && $decoded["errorCode"] == 0) {
                $success++;
            }
        }
        exit($success > 0
            ? "✅ Nạp «{$chargename}» × {$success}/{$chargenum} lần cho «{$uid}» thành công!"
            : "❌ Nạp thất bại (0/{$chargenum}). Kiểm tra server Java có đang chạy không?"
        );

    // ── Mail (gửi vật phẩm cho 1 người chơi) ───────────────────
    case 'mail':
        if ($uid === '') exit('Tên nhân vật không được trống!');
        $r = getPlayerId($dbip, $dbuser, $dbpwd, $dbname, $uid);
        if (isset($r['error'])) exit('❌ ' . $r['error']);
        $playerId = $r['playerId'];

        $title   = trim(poststr('title'))   ?: 'Thư GM';
        $content = trim(poststr('content')) ?: 'Chúc mừng!';
        $mailid  = trim(poststr('item'));
        $mailnum = intval(trim(poststr('num')));
        if ($mailid === '') exit('Chưa chọn vật phẩm!');
        if ($mailnum < 1 || $mailnum > 2000000000) exit('Số lượng không hợp lệ!');

        $find = false; $itemtype = ''; $itemname = '';
        $file = fopen("../item.txt", "r");
        while (!feof($file)) {
            $txts = explode(';', fgets($file));
            if (trim($txts[0]) == $mailid) {
                $find = true; $itemtype = trim($txts[2]); $itemname = trim($txts[1]); break;
            }
        }
        fclose($file);
        if (!$find) exit('Vật phẩm ID không tồn tại!');

        $mails    = array(array("type" => 1, "sendId" => 0, "sendName" => "Thư GM",
            "title" => $title, "context" => $content,
            "rewards" => array(array("type" => $itemtype, "id" => $mailid, "num" => $mailnum)),
            "rules"   => array("4" => (string) $playerId)));
        $postdata = array("cmd" => 3, "mails" => json_encode($mails, JSON_UNESCAPED_UNICODE));
        $result   = gmget1($url, $postdata);
        exit($result === '10001'
            ? "✅ Đã gửi [{$itemname} × {$mailnum}] cho «{$uid}»!"
            : '❌ Gửi thất bại: ' . $result);

    // ── Mail toàn server ─────────────────────────────────────────
    case 'allmail':
        $title   = trim(poststr('title'))   ?: 'Thư GM';
        $content = trim(poststr('content')) ?: 'Chúc mừng!';
        $mailid  = trim(poststr('item'));
        $mailnum = intval(trim(poststr('num')));
        if ($mailid === '') exit('Chưa chọn vật phẩm!');
        if ($mailnum < 1 || $mailnum > 2000000000) exit('Số lượng không hợp lệ!');

        $find = false; $itemtype = ''; $itemname = '';
        $file = fopen("../item.txt", "r");
        while (!feof($file)) {
            $txts = explode(';', fgets($file));
            if (trim($txts[0]) == $mailid) {
                $find = true; $itemtype = trim($txts[2]); $itemname = trim($txts[1]); break;
            }
        }
        fclose($file);
        if (!$find) exit('Vật phẩm ID không tồn tại!');

        $mails    = array(array("type" => 1, "sendId" => 0, "sendName" => "Thư GM",
            "title" => $title, "context" => $content,
            "rewards" => array(array("type" => $itemtype, "id" => $mailid, "num" => $mailnum)),
            "rules"   => array("1" => "0")));
        $postdata = array("cmd" => 3, "mails" => json_encode($mails, JSON_UNESCAPED_UNICODE));
        $result   = gmget1($url, $postdata);
        exit($result === '10001'
            ? "✅ Đã gửi [{$itemname} × {$mailnum}] toàn server [{$quname}]!"
            : '❌ Gửi thất bại: ' . $result);

    // ── Delete player ────────────────────────────────────────
    case 'delete':
        if ($uid === '') exit('Tên nhân vật không được trống!');
        $r = getPlayerId($dbip, $dbuser, $dbpwd, $dbname, $uid);
        if (isset($r['error'])) exit('❌ ' . $r['error']);
        $playerId = $r['playerId'];

        $con = new mysqli($dbip, $dbuser, $dbpwd, $dbname);
        if ($con->connect_error) exit('❌ Không kết nối được DB: ' . $con->connect_error);
        $con->set_charset('utf8');

        $tables = array(
            'tb_player', 'tb_bag', 'tb_hero', 'tb_skill', 'tb_building',
            'tb_mission', 'tb_friend', 'tb_mail', 'tb_fight_record',
            'tb_charge_record', 'tb_login_record'
        );
        $deleted = 0;
        foreach ($tables as $tbl) {
            $stmt = $con->prepare("DELETE FROM `{$tbl}` WHERE `playerId`=?");
            if ($stmt) {
                $stmt->bind_param('s', $playerId);
                $stmt->execute();
                if ($tbl === 'tb_player') $deleted = $stmt->affected_rows;
                $stmt->close();
            }
        }
        $con->close();

        if ($deleted < 1) exit('❌ Không tìm thấy nhân vật trong DB để xóa!');
        exit("✅ Đã xóa nhân vật «{$uid}» (ID: {$playerId}) khỏi game!");

    // ── Config Vật Phẩm ──────────────────────────────────
    case 'cfg_item':
    case 'cfg_shop':
    case 'cfg_charge':
        header('Content-Type: application/json; charset=utf-8');
        $cfgFile = realpath(__DIR__ . '/../../../../../../svnres/assets/a2825a98.cfg');
        if (!$cfgFile || !file_exists($cfgFile))
            exit(json_encode(['code'=>-1,'msg'=>'Không tìm thấy a2825a98.cfg']));

        $zip = new ZipArchive();
        if ($zip->open($cfgFile) !== true) exit(json_encode(['code'=>-1,'msg'=>'Không mở được cfg']));
        $cfg = json_decode($zip->getFromName('cfg.json'), true);
        $zip->close();

        $action2 = trim($_POST['action'] ?? '');
        $q       = strtolower(trim($_POST['q'] ?? ''));
        $page    = max(1, intval($_POST['page'] ?? 1));
        $size    = min(100, max(10, intval($_POST['size'] ?? 50)));

        if ($action2 === 'list') {
            if ($type === 'cfg_item') {
                $rows = [];
                foreach ($cfg['item'] as $id => $it) {
                    if ($q && strpos(strtolower($it['name']??''), $q)===false && strpos($id,$q)===false) continue;
                    $rows[] = ['id'=>intval($id),'name'=>$it['name']??'','itemQuality'=>$it['itemQuality']??10];
                }
                usort($rows, function($a,$b){ return $a['id']-$b['id']; });
                $total = count($rows);
                exit(json_encode(['code'=>0,'total'=>$total,'data'=>array_slice($rows,($page-1)*$size,$size)],JSON_UNESCAPED_UNICODE));
            }
            if ($type === 'cfg_shop') {
                $rows = [];
                foreach ($cfg['shopNormal'] as $id => $s) {
                    preg_match('/,(\d+),(\d+)/', $s['reward_cli'][0]??'', $m);
                    $itemId   = intval($m[1]??0);
                    $itemName = $cfg['item'][$itemId]['name'] ?? '';
                    if ($q && strpos(strtolower($itemName),$q)===false && strpos($id,$q)===false) continue;
                    $rows[] = ['goodsId'=>intval($id),'tabName'=>$s['name']??'','itemId'=>$itemId,'itemName'=>$itemName,
                               'rewardNum'=>intval($m[2]??0),'costType'=>$s['costType']??0,'costNum'=>$s['costNum']??0,
                               'sellTimes'=>$s['sellTimes']??0,'limitType'=>$s['limitType']??0];
                }
                usort($rows, function($a,$b){ return $a['goodsId']-$b['goodsId']; });
                $total = count($rows);
                exit(json_encode(['code'=>0,'total'=>$total,'data'=>array_slice($rows,($page-1)*$size,$size)],JSON_UNESCAPED_UNICODE));
            }
            if ($type === 'cfg_charge') {
                $rows = [];
                foreach ($cfg['charge'] as $id => $c) {
                    if (($c['type']??0) > 0) continue;
                    $rows[] = ['id'=>intval($id),'name'=>$c['name']??'','sort'=>$c['sort']??0,'rmb'=>$c['rmb']??0,'money'=>$c['money']??0];
                }
                usort($rows, function($a,$b){ return $a['sort']-$b['sort']; });
                exit(json_encode(['code'=>0,'data'=>$rows],JSON_UNESCAPED_UNICODE));
            }
        }

        if ($action2 === 'save') {
            if ($type === 'cfg_item') {
                $id   = strval(intval($_POST['id']??0));
                $name = trim($_POST['name']??'');
                if (!$id || $name==='') exit(json_encode(['code'=>-1,'msg'=>'Thiếu dữ liệu']));
                if (!isset($cfg['item'][$id])) exit(json_encode(['code'=>-1,'msg'=>'Item không tồn tại']));
                $cfg['item'][$id]['name'] = $name;
            } elseif ($type === 'cfg_shop') {
                $goodsId = strval(intval($_POST['goodsId']??0));
                if (!$goodsId) exit(json_encode(['code'=>-1,'msg'=>'Thiếu goodsId']));
                if (!isset($cfg['shopNormal'][$goodsId])) exit(json_encode(['code'=>-1,'msg'=>'Không tìm thấy shop']));
                if (isset($_POST['costNum']))   $cfg['shopNormal'][$goodsId]['costNum']   = intval($_POST['costNum']);
                if (isset($_POST['sellTimes'])) $cfg['shopNormal'][$goodsId]['sellTimes'] = intval($_POST['sellTimes']);
            } elseif ($type === 'cfg_charge') {
                $id = strval(intval($_POST['id']??0));
                if (!$id) exit(json_encode(['code'=>-1,'msg'=>'Thiếu id']));
                if (!isset($cfg['charge'][$id])) exit(json_encode(['code'=>-1,'msg'=>'Không tìm thấy gói']));
                if (isset($_POST['name']))  $cfg['charge'][$id]['name']  = trim($_POST['name']);
                if (isset($_POST['rmb']))   $cfg['charge'][$id]['rmb']   = intval($_POST['rmb']);
                if (isset($_POST['money'])) $cfg['charge'][$id]['money'] = intval($_POST['money']);
            }
            // Ghi lại file cfg
            $tmpDir  = sys_get_temp_dir() . '/gm_cfg_' . mt_rand();
            mkdir($tmpDir, 0755, true);
            $tmpJson = $tmpDir . '/cfg.json';
            $tmpZip  = $tmpDir . '/new.cfg';
            file_put_contents($tmpJson, json_encode($cfg, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES));
            $zip2 = new ZipArchive();
            $zip2->open($tmpZip, ZipArchive::CREATE | ZipArchive::OVERWRITE);
            $zip2->addFile($tmpJson, 'cfg.json');
            $zip2->close();
            rename($tmpZip, $cfgFile);
            unlink($tmpJson); rmdir($tmpDir);
            exit(json_encode(['code'=>0,'msg'=>'Đã lưu thành công'],JSON_UNESCAPED_UNICODE));
        }
        exit(json_encode(['code'=>-1,'msg'=>'action không hợp lệ']));

    default:
        exit('Loại yêu cầu không hợp lệ!');
}
?>
