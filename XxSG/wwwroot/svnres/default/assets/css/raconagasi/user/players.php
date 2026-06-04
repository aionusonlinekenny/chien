<?php
include 'config.php';
header('Content-Type: application/json; charset=utf-8');

$checknum = isset($_GET['checknum']) ? trim($_GET['checknum']) : '';
$quid     = isset($_GET['qu'])       ? trim($_GET['qu'])       : '';
$search   = isset($_GET['search'])   ? trim($_GET['search'])   : '';

if ($checknum !== $gmcode) {
    echo json_encode(['error' => 'Mã GM không đúng!']); exit;
}
if (!isset($quarr[$quid])) {
    echo json_encode(['error' => 'Máy chủ không hợp lệ!']); exit;
}

$qu     = $quarr[$quid];
$con    = new mysqli($qu['host'], $qu['user'], $qu['pwd'], $qu['dbname']);
if ($con->connect_error) {
    echo json_encode(['error' => 'DB lỗi: ' . $con->connect_error]); exit;
}
$con->set_charset('utf8');

if ($search !== '') {
    $like  = '%' . $search . '%';
    $stmt  = $con->prepare(
        "SELECT playerId, playerName, level, fightValue, vip, loginOutTime
         FROM tb_player WHERE playerName LIKE ? ORDER BY level DESC LIMIT 50"
    );
    $stmt->bind_param('s', $like);
} else {
    $stmt = $con->prepare(
        "SELECT playerId, playerName, level, fightValue, vip, loginOutTime
         FROM tb_player ORDER BY loginOutTime DESC LIMIT 100"
    );
}
$stmt->execute();
$result = $stmt->get_result();

$players = [];
while ($row = $result->fetch_assoc()) {
    $players[] = [
        'id'         => $row['playerId'],
        'name'       => $row['playerName'],
        'level'      => $row['level'],
        'fightValue' => $row['fightValue'],
        'vip'        => $row['vip'],
        'lastSeen'   => $row['loginOutTime'],
    ];
}
$stmt->close();
$con->close();

echo json_encode(['players' => $players]);
?>
