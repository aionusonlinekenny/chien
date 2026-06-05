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

// ── Config Vật Phẩm (không cần uid/server DB) ────────────────
if ($type === 'cfg_item' || $type === 'cfg_shop' || $type === 'cfg_charge') {
    header('Content-Type: application/json; charset=utf-8');
    $cfgFile = __DIR__ . '/../../../../../../svnres/assets/a2825a98.cfg';
    $cfgFile = realpath($cfgFile) ?: $cfgFile;
    if (!file_exists($cfgFile))
        exit(json_encode(array('code'=>-1,'msg'=>'Không tìm thấy a2825a98.cfg: '.$cfgFile)));

    // Đọc cfg.json từ ZIP — dùng ZipArchive nếu có, fallback zip:// wrapper
    $jsonRaw = false;
    if (class_exists('ZipArchive')) {
        $zip = new ZipArchive();
        if ($zip->open($cfgFile) === true) {
            $jsonRaw = $zip->getFromName('cfg.json');
            $zip->close();
        }
    }
    if ($jsonRaw === false) {
        $jsonRaw = file_get_contents('zip://' . $cfgFile . '#cfg.json');
    }
    if ($jsonRaw === false || $jsonRaw === '')
        exit(json_encode(array('code'=>-1,'msg'=>'Không đọc được cfg.json từ ZIP')));
    $cfg = json_decode($jsonRaw, true);
    if (!$cfg)
        exit(json_encode(array('code'=>-1,'msg'=>'JSON parse lỗi')));

    $action2 = trim(isset($_POST['action']) ? $_POST['action'] : '');
    $q       = strtolower(trim(isset($_POST['q']) ? $_POST['q'] : ''));
    $page    = max(1, intval(isset($_POST['page']) ? $_POST['page'] : 1));
    $size    = min(100, max(10, intval(isset($_POST['size']) ? $_POST['size'] : 50)));

    if ($action2 === 'list') {
        if ($type === 'cfg_item') {
            $rows = array();
            foreach ($cfg['item'] as $id => $it) {
                $name = isset($it['name']) ? $it['name'] : '';
                if ($q && strpos(strtolower($name), $q)===false && strpos($id,$q)===false) continue;
                $rows[] = array('id'=>intval($id),'name'=>$name,'itemQuality'=>isset($it['itemQuality'])?$it['itemQuality']:10);
            }
            usort($rows, function($a,$b){ return $a['id']-$b['id']; });
            $total = count($rows);
            exit(json_encode(array('code'=>0,'total'=>$total,'data'=>array_slice($rows,($page-1)*$size,$size)),JSON_UNESCAPED_UNICODE));
        }
        if ($type === 'cfg_shop') {
            $rows = array();
            foreach ($cfg['shopNormal'] as $id => $s) {
                $reward = isset($s['reward_cli'][0]) ? $s['reward_cli'][0] : '';
                preg_match('/,(\d+),(\d+)/', $reward, $m);
                $itemId   = intval(isset($m[1]) ? $m[1] : 0);
                $itemName = isset($cfg['item'][$itemId]['name']) ? $cfg['item'][$itemId]['name'] : '';
                if ($q && strpos(strtolower($itemName),$q)===false && strpos($id,$q)===false) continue;
                $rows[] = array(
                    'goodsId'=>intval($id), 'tabName'=>isset($s['name'])?$s['name']:'',
                    'itemId'=>$itemId, 'itemName'=>$itemName,
                    'rewardNum'=>intval(isset($m[2])?$m[2]:0),
                    'costType'=>isset($s['costType'])?$s['costType']:0,
                    'costNum'=>isset($s['costNum'])?$s['costNum']:0,
                    'sellTimes'=>isset($s['sellTimes'])?$s['sellTimes']:0,
                    'limitType'=>isset($s['limitType'])?$s['limitType']:0,
                );
            }
            usort($rows, function($a,$b){ return $a['goodsId']-$b['goodsId']; });
            $total = count($rows);
            exit(json_encode(array('code'=>0,'total'=>$total,'data'=>array_slice($rows,($page-1)*$size,$size)),JSON_UNESCAPED_UNICODE));
        }
        if ($type === 'cfg_charge') {
            $rows = array();
            foreach ($cfg['charge'] as $id => $c) {
                if (isset($c['type']) && $c['type'] > 0) continue;
                $rows[] = array('id'=>intval($id),'name'=>isset($c['name'])?$c['name']:'',
                                'sort'=>isset($c['sort'])?$c['sort']:0,
                                'rmb'=>isset($c['rmb'])?$c['rmb']:0,
                                'money'=>isset($c['money'])?$c['money']:0);
            }
            usort($rows, function($a,$b){ return $a['sort']-$b['sort']; });
            exit(json_encode(array('code'=>0,'data'=>$rows),JSON_UNESCAPED_UNICODE));
        }
    }

    if ($action2 === 'save') {
        if ($type === 'cfg_item') {
            $id   = strval(intval(isset($_POST['id'])?$_POST['id']:0));
            $name = trim(isset($_POST['name'])?$_POST['name']:'');
            if (!$id || $name==='') exit(json_encode(array('code'=>-1,'msg'=>'Thiếu dữ liệu')));
            if (!isset($cfg['item'][$id])) exit(json_encode(array('code'=>-1,'msg'=>'Item không tồn tại')));
            $cfg['item'][$id]['name'] = $name;
        } elseif ($type === 'cfg_shop') {
            $goodsId = strval(intval(isset($_POST['goodsId'])?$_POST['goodsId']:0));
            if (!$goodsId) exit(json_encode(array('code'=>-1,'msg'=>'Thiếu goodsId')));
            if (!isset($cfg['shopNormal'][$goodsId])) exit(json_encode(array('code'=>-1,'msg'=>'Không tìm thấy shop')));
            if (isset($_POST['costNum']))   $cfg['shopNormal'][$goodsId]['costNum']   = intval($_POST['costNum']);
            if (isset($_POST['sellTimes'])) $cfg['shopNormal'][$goodsId]['sellTimes'] = intval($_POST['sellTimes']);
        } elseif ($type === 'cfg_charge') {
            $id = strval(intval(isset($_POST['id'])?$_POST['id']:0));
            if (!$id) exit(json_encode(array('code'=>-1,'msg'=>'Thiếu id')));
            if (!isset($cfg['charge'][$id])) exit(json_encode(array('code'=>-1,'msg'=>'Không tìm thấy gói')));
            if (isset($_POST['name']))  $cfg['charge'][$id]['name']  = trim($_POST['name']);
            if (isset($_POST['rmb']))   $cfg['charge'][$id]['rmb']   = intval($_POST['rmb']);
            if (isset($_POST['money'])) $cfg['charge'][$id]['money'] = intval($_POST['money']);
        }
        // Ghi lại ZIP — dùng ZipArchive nếu có, fallback Python
        $jsonOut = json_encode($cfg, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        $saved = false;
        if (class_exists('ZipArchive')) {
            $tmpBase = sys_get_temp_dir() . DIRECTORY_SEPARATOR . 'gmcfg_' . mt_rand();
            $tmpZip  = $tmpBase . '.cfg';
            $tmpJson = $tmpBase . '.json';
            file_put_contents($tmpJson, $jsonOut);
            $zip2 = new ZipArchive();
            if ($zip2->open($tmpZip, ZipArchive::CREATE | ZipArchive::OVERWRITE) === true) {
                $zip2->addFile($tmpJson, 'cfg.json');
                $zip2->close();
                // Ghi đè file gốc
                if (@copy($tmpZip, $cfgFile)) $saved = true;
            }
            @unlink($tmpZip); @unlink($tmpJson);
        }
        if (!$saved) {
            // Fallback: Python script
            $tmpBase  = sys_get_temp_dir() . DIRECTORY_SEPARATOR . 'gmcfg_' . mt_rand();
            $tmpJson  = $tmpBase . '.json';
            $tmpZip   = $tmpBase . '.cfg';
            $pyScript = $tmpBase . '.py';
            file_put_contents($tmpJson, $jsonOut);
            $pyCode = "import zipfile, os\n"
                    . "z = zipfile.ZipFile(" . var_export($tmpZip, true) . ", 'w', zipfile.ZIP_DEFLATED)\n"
                    . "z.write(" . var_export($tmpJson, true) . ", 'cfg.json')\n"
                    . "z.close()\n"
                    . "dst = " . var_export($cfgFile, true) . "\n"
                    . "if os.path.exists(dst): os.remove(dst)\n"
                    . "os.rename(" . var_export($tmpZip, true) . ", dst)\n";
            file_put_contents($pyScript, $pyCode);
            exec('python3 ' . escapeshellarg($pyScript) . ' 2>&1', $out, $ret);
            if ($ret !== 0) exec('python ' . escapeshellarg($pyScript) . ' 2>&1', $out, $ret);
            @unlink($tmpJson); @unlink($pyScript); @unlink($tmpZip);
            if ($ret !== 0)
                exit(json_encode(array('code'=>-1,'msg'=>'Lỗi ghi file: '.implode("\n",$out)),JSON_UNESCAPED_UNICODE));
            $saved = true;
        }
        exit(json_encode(array('code'=>0,'msg'=>'Đã lưu thành công'),JSON_UNESCAPED_UNICODE));
    }
    exit(json_encode(array('code'=>-1,'msg'=>'action không hợp lệ')));
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


    default:
        exit('Loại yêu cầu không hợp lệ!');
}
?>
