<?php
// ══════════════════════════════════════════════════════
//  DB helper cho hệ thống thanh toán
// ══════════════════════════════════════════════════════

function pay_get_db() {
    static $pdo = null;
    if ($pdo) return $pdo;
    $pdo = new PDO('mysql:host=localhost;dbname=account;charset=utf8', 'root', '', [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    ]);
    // Tạo bảng nếu chưa có
    $pdo->exec("CREATE TABLE IF NOT EXISTS `pay_orders` (
        `id`            INT AUTO_INCREMENT PRIMARY KEY,
        `orderNum`      VARCHAR(50)  NOT NULL UNIQUE,
        `paypalOrderId` VARCHAR(50)  DEFAULT NULL,
        `username`      VARCHAR(50)  NOT NULL,
        `playerId`      VARCHAR(50)  NOT NULL,
        `serverId`      INT          NOT NULL,
        `subject`       INT          NOT NULL,
        `rmb`           BIGINT       NOT NULL,
        `knb`           INT          NOT NULL,
        `usd`           DECIMAL(10,2) NOT NULL,
        `status`        TINYINT      NOT NULL DEFAULT 0,
        `createTime`    DATETIME     NOT NULL,
        `paidTime`      DATETIME     DEFAULT NULL,
        INDEX(`username`), INDEX(`paypalOrderId`), INDEX(`status`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8");
    return $pdo;
}

// status: 0=pending, 1=paid, 2=failed
function pay_create_order($orderNum, $username, $playerId, $serverId, $subject, $rmb, $knb, $usd) {
    $db = pay_get_db();
    $stmt = $db->prepare("INSERT INTO `pay_orders`
        (orderNum,username,playerId,serverId,subject,rmb,knb,usd,status,createTime)
        VALUES (?,?,?,?,?,?,?,?,0,NOW())");
    $stmt->execute([$orderNum, $username, $playerId, $serverId, $subject, $rmb, $knb, $usd]);
}

function pay_set_paypal_id($orderNum, $paypalOrderId) {
    $db = pay_get_db();
    $db->prepare("UPDATE `pay_orders` SET paypalOrderId=? WHERE orderNum=? AND status=0")
       ->execute([$paypalOrderId, $orderNum]);
}

function pay_get_by_paypal($paypalOrderId) {
    $db = pay_get_db();
    $s  = $db->prepare("SELECT * FROM `pay_orders` WHERE paypalOrderId=? LIMIT 1");
    $s->execute([$paypalOrderId]);
    return $s->fetch(PDO::FETCH_ASSOC);
}

function pay_mark_paid($paypalOrderId) {
    $db = pay_get_db();
    // Dùng UPDATE ... WHERE status=0 để chặn double-credit
    $s = $db->prepare("UPDATE `pay_orders` SET status=1, paidTime=NOW() WHERE paypalOrderId=? AND status=0");
    $s->execute([$paypalOrderId]);
    return $s->rowCount() > 0; // false nếu đã xử lý rồi
}

function pay_mark_failed($paypalOrderId) {
    $db = pay_get_db();
    $db->prepare("UPDATE `pay_orders` SET status=2 WHERE paypalOrderId=? AND status=0")
       ->execute([$paypalOrderId]);
}

function pay_get_player($username) {
    $db = pay_get_db();
    $row = $db->prepare("SELECT id, lastserver FROM `account` WHERE username=? LIMIT 1");
    $row->execute([$username]);
    return $row->fetch(PDO::FETCH_ASSOC);
}

function pay_get_player_id($serverId, $username) {
    global $gameServers;
    // Lấy playerId từ game DB dựa vào userId
    $account  = pay_get_player($username);
    if (!$account) return null;
    $userId   = $account['id'];
    $serverMap = [
        10000 => 'sanguo_game',
        10001 => 'sanguo_game2',
    ];
    $dbname = $serverMap[$serverId] ?? null;
    if (!$dbname) return null;
    $db  = pay_get_db();
    $sql = "SELECT playerId FROM `{$dbname}`.`tb_player` WHERE userId=? LIMIT 1";
    $s   = $db->prepare($sql);
    $s->execute([$userId]);
    $r = $s->fetch(PDO::FETCH_ASSOC);
    return $r ? $r['playerId'] : null;
}
