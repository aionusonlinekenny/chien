/*
Navicat MySQL Data Transfer

Source Server         : zgymw.com
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : sanguo_game

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-09-30 09:04:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for db_version
-- ----------------------------
DROP TABLE IF EXISTS `db_version`;
CREATE TABLE `db_version` (
  `number` int(10) NOT NULL DEFAULT '0' COMMENT '版本号'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='当前数据库版本，更新数据库时使用';

-- ----------------------------
-- Records of db_version
-- ----------------------------

-- ----------------------------
-- Table structure for tb_achieve
-- ----------------------------
DROP TABLE IF EXISTS `tb_achieve`;
CREATE TABLE `tb_achieve` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `fameDone` text NOT NULL,
  `fameReward` text NOT NULL,
  `processReward` text NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_achieve
-- ----------------------------
INSERT INTO `tb_achieve` VALUES ('10000000001', '[1089,1093,1094,1095,1096,1097,1001,1098,1002,1003,1004,1005,1006,1082,1054,1007]', '[]', '[]', '0', '{\"1024\":12,\"1025\":12,\"1026\":12,\"1027\":12,\"1028\":12,\"1029\":12,\"1030\":12,\"1037\":150,\"1038\":150,\"1039\":150,\"1040\":150,\"1041\":150,\"1042\":150,\"1043\":150,\"1044\":150,\"1045\":150,\"1046\":150,\"1054\":20000,\"1055\":30442,\"1056\":30442,\"1057\":30442,\"1058\":30442,\"1059\":30442,\"1060\":30442,\"1061\":30442,\"1062\":30442,\"1063\":30442,\"1064\":30442,\"3112\":80,\"1065\":30442,\"3113\":80,\"1066\":30442,\"3114\":80,\"1067\":3001,\"3115\":80,\"1068\":3001,\"3116\":80,\"1069\":3001,\"3117\":80,\"1070\":3001,\"3118\":80,\"1071\":3001,\"3119\":80,\"1072\":3001,\"3120\":80,\"1073\":3001,\"3121\":80,\"3122\":80,\"1074\":1,\"3123\":80,\"1075\":1,\"3124\":80,\"1076\":1,\"3125\":80,\"1077\":1,\"3126\":80,\"1078\":1,\"1079\":1,\"1080\":1,\"1081\":1,\"1082\":10,\"1083\":10,\"1084\":10,\"1085\":10,\"1086\":10,\"1087\":10,\"1088\":10,\"1089\":1,\"1090\":0,\"1091\":0,\"1092\":0,\"1093\":2,\"1094\":3,\"1095\":4,\"1096\":5,\"1097\":6,\"1098\":7,\"1099\":7,\"1100\":7,\"1101\":7,\"1102\":7,\"1103\":7,\"1104\":7,\"1105\":7,\"1106\":7,\"3411\":12,\"3412\":12,\"3413\":12,\"3414\":12,\"3415\":12,\"3416\":12,\"3417\":12,\"3418\":12,\"3419\":12,\"3420\":12,\"4201\":3,\"4202\":3,\"4203\":3,\"4204\":3,\"4205\":3,\"4206\":3,\"4207\":3,\"3714\":30442,\"3715\":30442,\"3204\":0,\"3716\":30442,\"3205\":0,\"3717\":30442,\"3206\":0,\"3718\":30442,\"2000\":0,\"2002\":0,\"2003\":0,\"2004\":0,\"2005\":0,\"2006\":0,\"2007\":0,\"2011\":0,\"2012\":0,\"2013\":0,\"2014\":0,\"2015\":0,\"2016\":0,\"2017\":0,\"1001\":20,\"1002\":30,\"3307\":0,\"1003\":40,\"3308\":0,\"1004\":50,\"3309\":0,\"1005\":60,\"3310\":0,\"1006\":70,\"3311\":0,\"1007\":80,\"1008\":80,\"1009\":80,\"1010\":80,\"1011\":80,\"1012\":2,\"1013\":1,\"1014\":0,\"1015\":0,\"1016\":0,\"1017\":0,\"1018\":0,\"1019\":0,\"1020\":0,\"1021\":12,\"1022\":12,\"1023\":12,\"4301\":0,\"4302\":0,\"4303\":0,\"4304\":0,\"4305\":0,\"4306\":0,\"4307\":0,\"4308\":0,\"4309\":0,\"4310\":0,\"4311\":0,\"4401\":0,\"4402\":0,\"4403\":0,\"4404\":0,\"4501\":0,\"4502\":0,\"4503\":0,\"4504\":0,\"4505\":0,\"4506\":0,\"4507\":0,\"4508\":0,\"4509\":0,\"4510\":0,\"4511\":0,\"4608\":0,\"4601\":0,\"4602\":0,\"4603\":0,\"4604\":0,\"4605\":0,\"4606\":0,\"4607\":0,\"4101\":0,\"4102\":0,\"4103\":0,\"4104\":0,\"4105\":0,\"4106\":0,\"4107\":0,\"4108\":0,\"4109\":0,\"4110\":0,\"4111\":0,\"4112\":0,\"4113\":0,\"4114\":0,\"4115\":0,\"4116\":0,\"4117\":0,\"4118\":0,\"4119\":0,\"4120\":0,\"1107\":0,\"1108\":0,\"1109\":0,\"1110\":0,\"1111\":0,\"1112\":0,\"1113\":0,\"1114\":0,\"1115\":0,\"1116\":0,\"1117\":0,\"3901\":0,\"3902\":0,\"3903\":0,\"3904\":0,\"3801\":0,\"3802\":0,\"3803\":0,\"3804\":0,\"3805\":0,\"3806\":0,\"3807\":0,\"3808\":0,\"3809\":0,\"3810\":0,\"3811\":0,\"4001\":0,\"4002\":0,\"4003\":0,\"4004\":0,\"4005\":0,\"1031\":0,\"1032\":0,\"1033\":0,\"1034\":0,\"1035\":0,\"1036\":0,\"3507\":0,\"3508\":0,\"3509\":0,\"3510\":0,\"3511\":0,\"3512\":0,\"3513\":0,\"3514\":0,\"3515\":0,\"3516\":0,\"3517\":0,\"3518\":0,\"3519\":0,\"3520\":0,\"2001\":0,\"2008\":0,\"2009\":0,\"2010\":0,\"2018\":0,\"2019\":0,\"1000\":2}');
INSERT INTO `tb_achieve` VALUES ('10000000002', '[1093,1082,2011,2012]', '[]', '[]', '0', '{\"3714\":844,\"3715\":844,\"3716\":844,\"3204\":0,\"3717\":844,\"3205\":0,\"3718\":844,\"3206\":0,\"1054\":844,\"1055\":844,\"1056\":844,\"1057\":844,\"1058\":844,\"1059\":844,\"1060\":844,\"1061\":844,\"1062\":844,\"1063\":844,\"1064\":844,\"3112\":3,\"1065\":844,\"3113\":3,\"1066\":844,\"3114\":3,\"1067\":3001,\"3115\":3,\"1068\":3001,\"3116\":3,\"1069\":3001,\"3117\":3,\"1070\":3001,\"3118\":3,\"1071\":3001,\"3119\":3,\"1072\":3001,\"3120\":3,\"1073\":3001,\"3121\":3,\"3122\":3,\"3123\":3,\"3124\":3,\"3125\":3,\"3126\":3,\"1082\":10,\"1083\":10,\"1084\":10,\"1085\":10,\"1086\":10,\"1087\":10,\"1088\":10,\"1093\":2,\"1094\":2,\"1095\":2,\"1096\":2,\"1097\":2,\"1098\":2,\"1099\":2,\"1100\":2,\"1101\":2,\"1102\":2,\"1103\":2,\"1104\":2,\"1105\":2,\"1106\":2,\"2011\":1,\"2012\":10,\"2013\":10,\"1001\":3,\"1002\":3,\"1003\":3,\"3307\":0,\"1004\":3,\"3308\":0,\"1005\":3,\"3309\":0,\"1006\":3,\"3310\":0,\"1007\":3,\"3311\":0,\"1008\":3,\"1009\":3,\"1010\":3,\"1011\":3,\"1012\":1,\"1013\":1,\"1014\":0,\"1015\":0,\"1016\":0,\"1017\":0,\"1018\":0,\"1019\":0,\"1020\":0}');
INSERT INTO `tb_achieve` VALUES ('10000000003', '[1089,1093,1082,2011,2012]', '[]', '[]', '0', '{\"1024\":64,\"1025\":64,\"1026\":64,\"1027\":64,\"1028\":64,\"1029\":64,\"1030\":64,\"1054\":8324,\"1055\":8324,\"1056\":8324,\"1057\":8324,\"1058\":8324,\"1059\":8324,\"1060\":8324,\"1061\":8324,\"1062\":8324,\"1063\":8324,\"1064\":8324,\"3112\":11,\"1065\":8324,\"3113\":11,\"1066\":8324,\"3114\":11,\"1067\":3001,\"3115\":11,\"1068\":3001,\"3116\":11,\"1069\":3001,\"3117\":11,\"1070\":3001,\"3118\":11,\"1071\":3001,\"3119\":11,\"1072\":3001,\"3120\":11,\"1073\":3001,\"3121\":11,\"3122\":11,\"3123\":11,\"3124\":11,\"3125\":11,\"3126\":11,\"1082\":10,\"1083\":10,\"1084\":10,\"1085\":10,\"1086\":10,\"1087\":10,\"1088\":10,\"1089\":1,\"1090\":0,\"1091\":0,\"1092\":0,\"1093\":2,\"1094\":2,\"1095\":2,\"1096\":2,\"1097\":2,\"1098\":2,\"1099\":2,\"1100\":2,\"1101\":2,\"1102\":2,\"1103\":2,\"1104\":2,\"1105\":2,\"1106\":2,\"3411\":64,\"3412\":64,\"3413\":64,\"3414\":64,\"3415\":64,\"3416\":64,\"3417\":64,\"3418\":64,\"3419\":64,\"3420\":64,\"4201\":2,\"4202\":2,\"4203\":2,\"4204\":2,\"4205\":2,\"4206\":2,\"4207\":2,\"3714\":8324,\"3715\":8324,\"3204\":0,\"3716\":8324,\"3205\":0,\"3717\":8324,\"3206\":0,\"3718\":8324,\"2011\":1,\"2012\":10,\"2013\":10,\"1001\":11,\"1002\":11,\"3307\":0,\"1003\":11,\"3308\":0,\"1004\":11,\"3309\":0,\"1005\":11,\"3310\":0,\"1006\":11,\"3311\":0,\"1007\":11,\"1008\":11,\"1009\":11,\"1010\":11,\"1011\":11,\"1012\":2,\"1013\":1,\"1014\":0,\"1015\":0,\"1016\":0,\"1017\":0,\"1018\":0,\"1019\":0,\"1020\":0,\"1021\":64,\"1022\":64,\"1023\":64}');
INSERT INTO `tb_achieve` VALUES ('10000000004', '[1093,1082,2011,2012]', '[]', '[]', '0', '{\"3714\":563,\"3715\":563,\"3204\":0,\"3716\":563,\"3205\":0,\"3717\":563,\"3206\":0,\"3718\":563,\"1054\":563,\"1055\":563,\"1056\":563,\"1057\":563,\"1058\":563,\"1059\":563,\"1060\":563,\"1061\":563,\"1062\":563,\"1063\":563,\"1064\":563,\"3112\":2,\"1065\":563,\"3113\":2,\"1066\":563,\"3114\":2,\"1067\":3001,\"3115\":2,\"1068\":3001,\"3116\":2,\"1069\":3001,\"3117\":2,\"1070\":3001,\"3118\":2,\"1071\":3001,\"3119\":2,\"1072\":3001,\"3120\":2,\"1073\":3001,\"3121\":2,\"3122\":2,\"3123\":2,\"3124\":2,\"3125\":2,\"3126\":2,\"1082\":10,\"1083\":10,\"1084\":10,\"1085\":10,\"1086\":10,\"1087\":10,\"1088\":10,\"1093\":2,\"1094\":2,\"1095\":2,\"1096\":2,\"1097\":2,\"1098\":2,\"1099\":2,\"1100\":2,\"1101\":2,\"1102\":2,\"1103\":2,\"1104\":2,\"1105\":2,\"1106\":2,\"2011\":1,\"2012\":10,\"2013\":10,\"1001\":2,\"1002\":2,\"3307\":0,\"1003\":2,\"3308\":0,\"1004\":2,\"3309\":0,\"1005\":2,\"3310\":0,\"1006\":2,\"3311\":0,\"1007\":2,\"1008\":2,\"1009\":2,\"1010\":2,\"1011\":2,\"1012\":1,\"1013\":1,\"1014\":0,\"1015\":0,\"1016\":0,\"1017\":0,\"1018\":0,\"1019\":0,\"1020\":0}');
INSERT INTO `tb_achieve` VALUES ('10000000005', '[1093]', '[]', '[]', '0', '{\"1093\":2,\"1094\":2,\"1095\":2,\"1096\":2,\"1097\":2,\"1098\":2,\"1067\":3001,\"1099\":2,\"1068\":3001,\"1100\":2,\"1069\":3001,\"1101\":2,\"1070\":3001,\"1102\":2,\"1071\":3001,\"1103\":2,\"1072\":3001,\"1104\":2,\"1073\":3001,\"1105\":2,\"1106\":2}');
INSERT INTO `tb_achieve` VALUES ('10000000006', '[1093]', '[]', '[]', '0', '{\"3714\":563,\"3715\":563,\"3716\":563,\"3717\":563,\"3718\":563,\"1054\":563,\"1055\":563,\"1056\":563,\"1057\":563,\"1058\":563,\"1059\":563,\"1060\":563,\"1061\":563,\"1062\":563,\"1063\":563,\"1064\":563,\"3112\":2,\"1065\":563,\"3113\":2,\"1066\":563,\"3114\":2,\"1067\":3001,\"3115\":2,\"1068\":3001,\"3116\":2,\"1069\":3001,\"3117\":2,\"1070\":3001,\"3118\":2,\"1071\":3001,\"3119\":2,\"1072\":3001,\"3120\":2,\"1073\":3001,\"3121\":2,\"3122\":2,\"3123\":2,\"3124\":2,\"3125\":2,\"3126\":2,\"1093\":2,\"1094\":2,\"1095\":2,\"1096\":2,\"1097\":2,\"1098\":2,\"1099\":2,\"1100\":2,\"1101\":2,\"1102\":2,\"1103\":2,\"1104\":2,\"1105\":2,\"1106\":2,\"1001\":2,\"1002\":2,\"1003\":2,\"1004\":2,\"1005\":2,\"1006\":2,\"1007\":2,\"1008\":2,\"1009\":2,\"1010\":2,\"1011\":2}');
INSERT INTO `tb_achieve` VALUES ('10000000007', '[1089,1090,1093,1082,2011,2012]', '[]', '[]', '0', '{\"1024\":54,\"1025\":54,\"1026\":54,\"1027\":54,\"1028\":54,\"1029\":54,\"1030\":54,\"1054\":19837,\"1055\":19837,\"1056\":19837,\"1057\":19837,\"1058\":19837,\"1059\":19837,\"1060\":19837,\"1061\":19837,\"1062\":19837,\"1063\":19837,\"1064\":19837,\"3112\":12,\"1065\":19837,\"3113\":12,\"1066\":19837,\"3114\":12,\"1067\":3001,\"3115\":12,\"1068\":3001,\"3116\":12,\"1069\":3001,\"3117\":12,\"1070\":3001,\"3118\":12,\"1071\":3001,\"3119\":12,\"1072\":3001,\"3120\":12,\"1073\":3001,\"3121\":12,\"3122\":12,\"1074\":1,\"3123\":12,\"1075\":1,\"3124\":12,\"1076\":1,\"3125\":12,\"1077\":1,\"3126\":12,\"1078\":1,\"1079\":1,\"1080\":1,\"1081\":1,\"1082\":10,\"1083\":10,\"1084\":10,\"1085\":10,\"1086\":10,\"1087\":10,\"1088\":10,\"1089\":1,\"1090\":1,\"1091\":0,\"1092\":0,\"1093\":2,\"1094\":2,\"1095\":2,\"1096\":2,\"1097\":2,\"1098\":2,\"1099\":2,\"1100\":2,\"1101\":2,\"1102\":2,\"1103\":2,\"1104\":2,\"1105\":2,\"1106\":2,\"3411\":54,\"3412\":54,\"3413\":54,\"3414\":54,\"3415\":54,\"3416\":54,\"3417\":54,\"3418\":54,\"3419\":54,\"3420\":54,\"4201\":3,\"4202\":3,\"4203\":3,\"4204\":3,\"4205\":3,\"4206\":3,\"4207\":3,\"3714\":19837,\"3715\":19837,\"3204\":0,\"3716\":19837,\"3205\":0,\"3717\":19837,\"3206\":0,\"3718\":19837,\"2011\":1,\"2012\":10,\"2013\":10,\"1000\":3,\"1001\":12,\"1002\":12,\"3307\":0,\"1003\":12,\"3308\":0,\"1004\":12,\"3309\":0,\"1005\":12,\"3310\":0,\"1006\":12,\"3311\":0,\"1007\":12,\"1008\":12,\"1009\":12,\"1010\":12,\"1011\":12,\"1012\":2,\"1013\":1,\"1014\":0,\"1015\":0,\"1016\":0,\"1017\":0,\"1018\":0,\"1019\":0,\"1020\":0,\"1021\":54,\"1022\":54,\"1023\":54}');
INSERT INTO `tb_achieve` VALUES ('10000000008', '[1093,1082]', '[]', '[]', '0', '{\"1054\":2122,\"1055\":2122,\"1056\":2122,\"1057\":2122,\"1058\":2122,\"1059\":2122,\"1060\":2122,\"1061\":2122,\"1062\":2122,\"1063\":2122,\"1064\":2122,\"3112\":4,\"1065\":2122,\"3113\":4,\"1066\":2122,\"3114\":4,\"1067\":3001,\"3115\":4,\"1068\":3001,\"3116\":4,\"1069\":3001,\"3117\":4,\"1070\":3001,\"3118\":4,\"1071\":3001,\"3119\":4,\"1072\":3001,\"3120\":4,\"1073\":3001,\"3121\":4,\"3122\":4,\"3123\":4,\"3124\":4,\"3125\":4,\"3126\":4,\"1082\":10,\"1083\":10,\"1084\":10,\"1085\":10,\"1086\":10,\"1087\":10,\"1088\":10,\"1093\":2,\"1094\":2,\"1095\":2,\"1096\":2,\"1097\":2,\"1098\":2,\"1099\":2,\"1100\":2,\"1101\":2,\"1102\":2,\"1103\":2,\"1104\":2,\"1105\":2,\"1106\":2,\"3714\":2122,\"3715\":2122,\"3204\":0,\"3716\":2122,\"3205\":0,\"3717\":2122,\"3206\":0,\"3718\":2122,\"2000\":0,\"2001\":0,\"2002\":0,\"2003\":0,\"2004\":0,\"2005\":0,\"2006\":0,\"2007\":0,\"2008\":0,\"2009\":0,\"2010\":0,\"2011\":0,\"2012\":0,\"2013\":0,\"2014\":0,\"2015\":0,\"2016\":0,\"2017\":0,\"2018\":0,\"2019\":0,\"1001\":4,\"1002\":4,\"3307\":0,\"1003\":4,\"3308\":0,\"1004\":4,\"3309\":0,\"1005\":4,\"3310\":0,\"1006\":4,\"3311\":0,\"1007\":4,\"1008\":4,\"1009\":4,\"1010\":4,\"1011\":4,\"1012\":1,\"1013\":1,\"1014\":0,\"1015\":0,\"1016\":0,\"1017\":0,\"1018\":0,\"1019\":0,\"1020\":0}');

-- ----------------------------
-- Table structure for tb_activitybag
-- ----------------------------
DROP TABLE IF EXISTS `tb_activitybag`;
CREATE TABLE `tb_activitybag` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `itemId` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `end` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_activitybag
-- ----------------------------

-- ----------------------------
-- Table structure for tb_appointment
-- ----------------------------
DROP TABLE IF EXISTS `tb_appointment`;
CREATE TABLE `tb_appointment` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `tasks` text NOT NULL,
  `fighterTask` text NOT NULL,
  `refreshCount` int(11) NOT NULL DEFAULT '0',
  `refreshTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_appointment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_arena
-- ----------------------------
DROP TABLE IF EXISTS `tb_arena`;
CREATE TABLE `tb_arena` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `maxRank` int(11) NOT NULL DEFAULT '0',
  `reports` text NOT NULL,
  `fightTimes` int(11) NOT NULL DEFAULT '0',
  `lastTime` int(11) NOT NULL DEFAULT '0',
  `buyTimes` int(11) NOT NULL DEFAULT '0',
  `eliminateTimes` int(11) NOT NULL DEFAULT '0',
  `totalFightTimes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_arena
-- ----------------------------
INSERT INTO `tb_arena` VALUES ('10000000001', '3001', '0', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_arena` VALUES ('10000000002', '3001', '0', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_arena` VALUES ('10000000003', '3001', '0', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_arena` VALUES ('10000000004', '3001', '0', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_arena` VALUES ('10000000005', '3001', '0', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_arena` VALUES ('10000000006', '3001', '0', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_arena` VALUES ('10000000007', '3001', '0', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_arena` VALUES ('10000000008', '3001', '0', '[]', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tb_artifact
-- ----------------------------
DROP TABLE IF EXISTS `tb_artifact`;
CREATE TABLE `tb_artifact` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `attrs` text NOT NULL,
  `trainDataMap` text NOT NULL,
  `trianType` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_artifact
-- ----------------------------

-- ----------------------------
-- Table structure for tb_assistant
-- ----------------------------
DROP TABLE IF EXISTS `tb_assistant`;
CREATE TABLE `tb_assistant` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `configs` text NOT NULL,
  `logs` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_assistant
-- ----------------------------

-- ----------------------------
-- Table structure for tb_bag
-- ----------------------------
DROP TABLE IF EXISTS `tb_bag`;
CREATE TABLE `tb_bag` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `itemId` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bag
-- ----------------------------
INSERT INTO `tb_bag` VALUES ('10000000001', '211404', '3');
INSERT INTO `tb_bag` VALUES ('10000000001', '211502', '3');
INSERT INTO `tb_bag` VALUES ('10000000001', '212402', '3');
INSERT INTO `tb_bag` VALUES ('10000000001', '212506', '10');
INSERT INTO `tb_bag` VALUES ('10000000001', '213502', '5');
INSERT INTO `tb_bag` VALUES ('10000000001', '214403', '5');
INSERT INTO `tb_bag` VALUES ('10000000001', '214404', '3');
INSERT INTO `tb_bag` VALUES ('10000000001', '214501', '3');
INSERT INTO `tb_bag` VALUES ('10000000001', '214506', '3');
INSERT INTO `tb_bag` VALUES ('10000000001', '501027', '1');
INSERT INTO `tb_bag` VALUES ('10000000001', '602402', '1');
INSERT INTO `tb_bag` VALUES ('10000000001', '603504', '1');
INSERT INTO `tb_bag` VALUES ('10000000001', '30000003', '4');
INSERT INTO `tb_bag` VALUES ('10000000001', '30000014', '3');
INSERT INTO `tb_bag` VALUES ('10000000001', '30000015', '1000');
INSERT INTO `tb_bag` VALUES ('10000000001', '30000019', '1');
INSERT INTO `tb_bag` VALUES ('10000000001', '30000100', '64');
INSERT INTO `tb_bag` VALUES ('10000000001', '30000101', '16');
INSERT INTO `tb_bag` VALUES ('10000000001', '30000301', '150');
INSERT INTO `tb_bag` VALUES ('10000000002', '211402', '3');
INSERT INTO `tb_bag` VALUES ('10000000002', '211504', '3');
INSERT INTO `tb_bag` VALUES ('10000000002', '212503', '3');
INSERT INTO `tb_bag` VALUES ('10000000002', '213502', '10');
INSERT INTO `tb_bag` VALUES ('10000000002', '213505', '12');
INSERT INTO `tb_bag` VALUES ('10000000002', '214505', '3');
INSERT INTO `tb_bag` VALUES ('10000000002', '602502', '1');
INSERT INTO `tb_bag` VALUES ('10000000002', '30000015', '1000');
INSERT INTO `tb_bag` VALUES ('10000000002', '30000019', '1');
INSERT INTO `tb_bag` VALUES ('10000000003', '212402', '0');
INSERT INTO `tb_bag` VALUES ('10000000003', '212502', '3');
INSERT INTO `tb_bag` VALUES ('10000000003', '212505', '3');
INSERT INTO `tb_bag` VALUES ('10000000003', '212506', '3');
INSERT INTO `tb_bag` VALUES ('10000000003', '213403', '3');
INSERT INTO `tb_bag` VALUES ('10000000003', '213502', '5');
INSERT INTO `tb_bag` VALUES ('10000000003', '213504', '6');
INSERT INTO `tb_bag` VALUES ('10000000003', '214405', '5');
INSERT INTO `tb_bag` VALUES ('10000000003', '214504', '3');
INSERT INTO `tb_bag` VALUES ('10000000003', '501001', '1');
INSERT INTO `tb_bag` VALUES ('10000000003', '602402', '1');
INSERT INTO `tb_bag` VALUES ('10000000003', '603504', '1');
INSERT INTO `tb_bag` VALUES ('10000000003', '30000003', '2');
INSERT INTO `tb_bag` VALUES ('10000000003', '30000014', '2');
INSERT INTO `tb_bag` VALUES ('10000000003', '30000015', '1000');
INSERT INTO `tb_bag` VALUES ('10000000003', '30000019', '1');
INSERT INTO `tb_bag` VALUES ('10000000003', '30000100', '78');
INSERT INTO `tb_bag` VALUES ('10000000003', '30000101', '10');
INSERT INTO `tb_bag` VALUES ('10000000003', '30000301', '70');
INSERT INTO `tb_bag` VALUES ('10000000004', '211405', '6');
INSERT INTO `tb_bag` VALUES ('10000000004', '211501', '5');
INSERT INTO `tb_bag` VALUES ('10000000004', '212402', '10');
INSERT INTO `tb_bag` VALUES ('10000000004', '214402', '8');
INSERT INTO `tb_bag` VALUES ('10000000004', '214501', '3');
INSERT INTO `tb_bag` VALUES ('10000000004', '214504', '6');
INSERT INTO `tb_bag` VALUES ('10000000004', '602502', '1');
INSERT INTO `tb_bag` VALUES ('10000000004', '30000015', '1000');
INSERT INTO `tb_bag` VALUES ('10000000004', '30000019', '1');
INSERT INTO `tb_bag` VALUES ('10000000005', '30000019', '1');
INSERT INTO `tb_bag` VALUES ('10000000006', '30000019', '1');
INSERT INTO `tb_bag` VALUES ('10000000007', '211405', '10');
INSERT INTO `tb_bag` VALUES ('10000000007', '211506', '10');
INSERT INTO `tb_bag` VALUES ('10000000007', '212402', '0');
INSERT INTO `tb_bag` VALUES ('10000000007', '213401', '5');
INSERT INTO `tb_bag` VALUES ('10000000007', '213405', '10');
INSERT INTO `tb_bag` VALUES ('10000000007', '213502', '3');
INSERT INTO `tb_bag` VALUES ('10000000007', '213505', '3');
INSERT INTO `tb_bag` VALUES ('10000000007', '214403', '3');
INSERT INTO `tb_bag` VALUES ('10000000007', '214505', '8');
INSERT INTO `tb_bag` VALUES ('10000000007', '501027', '1');
INSERT INTO `tb_bag` VALUES ('10000000007', '602402', '1');
INSERT INTO `tb_bag` VALUES ('10000000007', '602502', '1');
INSERT INTO `tb_bag` VALUES ('10000000007', '30000003', '2');
INSERT INTO `tb_bag` VALUES ('10000000007', '30000014', '3');
INSERT INTO `tb_bag` VALUES ('10000000007', '30000015', '1000');
INSERT INTO `tb_bag` VALUES ('10000000007', '30000019', '1');
INSERT INTO `tb_bag` VALUES ('10000000007', '30000100', '85');
INSERT INTO `tb_bag` VALUES ('10000000007', '30000101', '10');
INSERT INTO `tb_bag` VALUES ('10000000007', '30000301', '150');
INSERT INTO `tb_bag` VALUES ('10000000008', '211403', '5');
INSERT INTO `tb_bag` VALUES ('10000000008', '211405', '5');
INSERT INTO `tb_bag` VALUES ('10000000008', '211504', '3');
INSERT INTO `tb_bag` VALUES ('10000000008', '212401', '5');
INSERT INTO `tb_bag` VALUES ('10000000008', '212504', '3');
INSERT INTO `tb_bag` VALUES ('10000000008', '213502', '3');
INSERT INTO `tb_bag` VALUES ('10000000008', '213504', '3');
INSERT INTO `tb_bag` VALUES ('10000000008', '213505', '3');
INSERT INTO `tb_bag` VALUES ('10000000008', '214503', '3');
INSERT INTO `tb_bag` VALUES ('10000000008', '601506', '1');
INSERT INTO `tb_bag` VALUES ('10000000008', '30000015', '1000');
INSERT INTO `tb_bag` VALUES ('10000000008', '30000019', '1');
INSERT INTO `tb_bag` VALUES ('10000000008', '30000100', '20');

-- ----------------------------
-- Table structure for tb_bagua
-- ----------------------------
DROP TABLE IF EXISTS `tb_bagua`;
CREATE TABLE `tb_bagua` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `chapterMap` text NOT NULL,
  `curInsId` int(11) NOT NULL DEFAULT '0',
  `insIdMap` text NOT NULL,
  `asistTime` int(11) NOT NULL DEFAULT '0',
  `sweep` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bagua
-- ----------------------------
INSERT INTO `tb_bagua` VALUES ('10000000001', '{\"1\":[]}', '101', '{}', '0', '0');
INSERT INTO `tb_bagua` VALUES ('10000000002', '{}', '0', '{}', '0', '0');
INSERT INTO `tb_bagua` VALUES ('10000000003', '{}', '0', '{}', '0', '0');
INSERT INTO `tb_bagua` VALUES ('10000000004', '{}', '0', '{}', '0', '0');
INSERT INTO `tb_bagua` VALUES ('10000000005', '{}', '0', '{}', '0', '0');
INSERT INTO `tb_bagua` VALUES ('10000000006', '{}', '0', '{}', '0', '0');
INSERT INTO `tb_bagua` VALUES ('10000000007', '{}', '0', '{}', '0', '0');
INSERT INTO `tb_bagua` VALUES ('10000000008', '{}', '0', '{}', '0', '0');

-- ----------------------------
-- Table structure for tb_baguarecord
-- ----------------------------
DROP TABLE IF EXISTS `tb_baguarecord`;
CREATE TABLE `tb_baguarecord` (
  `chapterId` int(11) NOT NULL DEFAULT '0',
  `insId` int(11) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `playerList` text NOT NULL,
  PRIMARY KEY (`chapterId`,`insId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_baguarecord
-- ----------------------------

-- ----------------------------
-- Table structure for tb_beast
-- ----------------------------
DROP TABLE IF EXISTS `tb_beast`;
CREATE TABLE `tb_beast` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `bsHandBook` text NOT NULL,
  `lowFreeTime` int(11) NOT NULL DEFAULT '0',
  `higtFreeTime` int(11) NOT NULL DEFAULT '0',
  `lowCallTimes` int(11) NOT NULL DEFAULT '0',
  `highCallTimes` int(11) NOT NULL DEFAULT '0',
  `lowDailyCall` int(11) NOT NULL DEFAULT '0',
  `highDailyCall` int(11) NOT NULL DEFAULT '0',
  `lowLastCall` bigint(20) NOT NULL DEFAULT '0',
  `highLastCall` bigint(20) NOT NULL DEFAULT '0',
  `chapterMap` text NOT NULL,
  `chapterReward` text NOT NULL,
  `formationMap` text NOT NULL,
  `sweepIns` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_beast
-- ----------------------------

-- ----------------------------
-- Table structure for tb_beastsoul
-- ----------------------------
DROP TABLE IF EXISTS `tb_beastsoul`;
CREATE TABLE `tb_beastsoul` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `beastId` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `wear` bigint(20) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `fightValue` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`beastId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_beastsoul
-- ----------------------------

-- ----------------------------
-- Table structure for tb_betting
-- ----------------------------
DROP TABLE IF EXISTS `tb_betting`;
CREATE TABLE `tb_betting` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `charge` bigint(20) NOT NULL DEFAULT '0',
  `refCharge` bigint(20) NOT NULL DEFAULT '0',
  `times` int(11) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_betting
-- ----------------------------

-- ----------------------------
-- Table structure for tb_bosshome
-- ----------------------------
DROP TABLE IF EXISTS `tb_bosshome`;
CREATE TABLE `tb_bosshome` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `counts` text NOT NULL,
  `times` text NOT NULL,
  `restores` text NOT NULL,
  `buys` text NOT NULL,
  `worldRewards` text NOT NULL,
  `bossNeedNotice` text NOT NULL,
  `teamFightTimes` int(11) NOT NULL DEFAULT '0',
  `totalFightTimes` int(11) NOT NULL DEFAULT '0',
  `alienCount` int(11) NOT NULL DEFAULT '0',
  `buyAlienCount` int(11) NOT NULL DEFAULT '0',
  `totalNeutralBoss` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_bosshome
-- ----------------------------
INSERT INTO `tb_bosshome` VALUES ('10000000001', '{\"1\":0}', '{\"1\":0}', '{\"1\":0}', '{}', '[]', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_bosshome` VALUES ('10000000002', '{}', '{}', '{}', '{}', '[]', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_bosshome` VALUES ('10000000003', '{}', '{}', '{}', '{}', '[]', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_bosshome` VALUES ('10000000004', '{}', '{}', '{}', '{}', '[]', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_bosshome` VALUES ('10000000005', '{}', '{}', '{}', '{}', '[]', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_bosshome` VALUES ('10000000006', '{}', '{}', '{}', '{}', '[]', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_bosshome` VALUES ('10000000007', '{}', '{}', '{}', '{}', '[]', '[]', '0', '0', '0', '0', '0');
INSERT INTO `tb_bosshome` VALUES ('10000000008', '{\"1\":0}', '{\"1\":0}', '{\"1\":0}', '{}', '[]', '[]', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tb_business
-- ----------------------------
DROP TABLE IF EXISTS `tb_business`;
CREATE TABLE `tb_business` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `sells` text NOT NULL,
  `buyTimes` text NOT NULL,
  `refreshTimes` int(11) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_business
-- ----------------------------

-- ----------------------------
-- Table structure for tb_cardbag
-- ----------------------------
DROP TABLE IF EXISTS `tb_cardbag`;
CREATE TABLE `tb_cardbag` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `mid` bigint(20) NOT NULL DEFAULT '0',
  `cardId` int(11) NOT NULL DEFAULT '0',
  `quality` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0',
  `stars` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_cardbag
-- ----------------------------

-- ----------------------------
-- Table structure for tb_cardbook
-- ----------------------------
DROP TABLE IF EXISTS `tb_cardbook`;
CREATE TABLE `tb_cardbook` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `cardColor` text NOT NULL,
  `lastCardColor` text NOT NULL,
  `bottomCardAsk` int(11) NOT NULL DEFAULT '0',
  `colorDanAsk` int(11) NOT NULL DEFAULT '0',
  `lastToColor` int(11) NOT NULL DEFAULT '0',
  `refToColor` int(11) NOT NULL DEFAULT '0',
  `cardPair` text NOT NULL,
  `processMap` text NOT NULL,
  `giveTimes` int(11) NOT NULL DEFAULT '0',
  `nextAskTime` int(11) NOT NULL DEFAULT '0',
  `infoId` bigint(20) NOT NULL DEFAULT '0',
  `endTime` text NOT NULL,
  `getGive` text NOT NULL,
  `itemAsk` text NOT NULL,
  `colorTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_cardbook
-- ----------------------------
INSERT INTO `tb_cardbook` VALUES ('10000000001', '{}', '{}', '0', '0', '0', '0', '{}', '{}', '0', '0', '0', '{}', '{}', '{}', '0');
INSERT INTO `tb_cardbook` VALUES ('10000000002', '{}', '{}', '0', '0', '0', '0', '{}', '{}', '0', '0', '0', '{}', '{}', '{}', '0');
INSERT INTO `tb_cardbook` VALUES ('10000000003', '{}', '{}', '0', '0', '0', '0', '{}', '{}', '0', '0', '0', '{}', '{}', '{}', '0');
INSERT INTO `tb_cardbook` VALUES ('10000000004', '{}', '{}', '0', '0', '0', '0', '{}', '{}', '0', '0', '0', '{}', '{}', '{}', '0');
INSERT INTO `tb_cardbook` VALUES ('10000000005', '{}', '{}', '0', '0', '0', '0', '{}', '{}', '0', '0', '0', '{}', '{}', '{}', '0');
INSERT INTO `tb_cardbook` VALUES ('10000000006', '{}', '{}', '0', '0', '0', '0', '{}', '{}', '0', '0', '0', '{}', '{}', '{}', '0');
INSERT INTO `tb_cardbook` VALUES ('10000000007', '{}', '{}', '0', '0', '0', '0', '{}', '{}', '0', '0', '0', '{}', '{}', '{}', '0');
INSERT INTO `tb_cardbook` VALUES ('10000000008', '{}', '{}', '0', '0', '0', '0', '{}', '{}', '0', '0', '0', '{}', '{}', '{}', '0');

-- ----------------------------
-- Table structure for tb_cat
-- ----------------------------
DROP TABLE IF EXISTS `tb_cat`;
CREATE TABLE `tb_cat` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  `maxCCY` int(11) NOT NULL DEFAULT '0',
  `minCCY` int(11) NOT NULL DEFAULT '0',
  `actCharge` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_cat
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ceremony
-- ----------------------------
DROP TABLE IF EXISTS `tb_ceremony`;
CREATE TABLE `tb_ceremony` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `actId` int(11) NOT NULL DEFAULT '0',
  `accumulateCharge` bigint(20) NOT NULL DEFAULT '0',
  `task` text NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `shop` text NOT NULL,
  `reward` text NOT NULL,
  PRIMARY KEY (`playerId`,`actId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ceremony
-- ----------------------------

-- ----------------------------
-- Table structure for tb_charge_welfare
-- ----------------------------
DROP TABLE IF EXISTS `tb_charge_welfare`;
CREATE TABLE `tb_charge_welfare` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `welfareIds` text NOT NULL,
  `welfare` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `lastTime` int(11) NOT NULL DEFAULT '0',
  `endTime` int(11) NOT NULL DEFAULT '0',
  `refresh` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_charge_welfare
-- ----------------------------

-- ----------------------------
-- Table structure for tb_chat
-- ----------------------------
DROP TABLE IF EXISTS `tb_chat`;
CREATE TABLE `tb_chat` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `toId` bigint(20) NOT NULL DEFAULT '0',
  `toName` varchar(255) NOT NULL DEFAULT '',
  `privateList` text NOT NULL,
  PRIMARY KEY (`playerId`,`toId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_chat
-- ----------------------------

-- ----------------------------
-- Table structure for tb_constant
-- ----------------------------
DROP TABLE IF EXISTS `tb_constant`;
CREATE TABLE `tb_constant` (
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '键',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT '值',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_constant
-- ----------------------------
INSERT INTO `tb_constant` VALUES ('crossRankVersion2', '{\"1\":{},\"2\":{}}');
INSERT INTO `tb_constant` VALUES ('dailyWorldLevel', '2');
INSERT INTO `tb_constant` VALUES ('divine', '{}');
INSERT INTO `tb_constant` VALUES ('groupcharge', '2');
INSERT INTO `tb_constant` VALUES ('growfund', '0');
INSERT INTO `tb_constant` VALUES ('openTime', '2017-09-02 00:00:00');
INSERT INTO `tb_constant` VALUES ('turnplate', '{\"key\":30000,\"value\":1601395201}');
INSERT INTO `tb_constant` VALUES ('turntable', '{\"119\":1,\"201\":1}');
INSERT INTO `tb_constant` VALUES ('weekWorldLevel', '0');

-- ----------------------------
-- Table structure for tb_construction
-- ----------------------------
DROP TABLE IF EXISTS `tb_construction`;
CREATE TABLE `tb_construction` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `cid` int(11) NOT NULL DEFAULT '0',
  `alreadyGet` text NOT NULL,
  PRIMARY KEY (`playerId`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_construction
-- ----------------------------

-- ----------------------------
-- Table structure for tb_consume
-- ----------------------------
DROP TABLE IF EXISTS `tb_consume`;
CREATE TABLE `tb_consume` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `takeConsume` bigint(20) NOT NULL DEFAULT '0',
  `takeReward` text NOT NULL,
  `postureConsume` bigint(20) NOT NULL DEFAULT '0',
  `postureReward` text NOT NULL,
  `open` tinyint(1) NOT NULL DEFAULT '0',
  `zhenFaConsume` bigint(20) NOT NULL DEFAULT '0',
  `zhenFaReward` text NOT NULL,
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_consume
-- ----------------------------

-- ----------------------------
-- Table structure for tb_continuity
-- ----------------------------
DROP TABLE IF EXISTS `tb_continuity`;
CREATE TABLE `tb_continuity` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `states` text NOT NULL,
  `dateCharges` text NOT NULL,
  `open` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_continuity
-- ----------------------------
INSERT INTO `tb_continuity` VALUES ('10000000001', '1', '{}', '{}', '0');
INSERT INTO `tb_continuity` VALUES ('10000000001', '2', '{}', '{}', '0');
INSERT INTO `tb_continuity` VALUES ('10000000001', '3', '{}', '{}', '0');
INSERT INTO `tb_continuity` VALUES ('10000000008', '1', '{}', '{}', '0');
INSERT INTO `tb_continuity` VALUES ('10000000008', '2', '{}', '{}', '0');
INSERT INTO `tb_continuity` VALUES ('10000000008', '3', '{}', '{}', '0');

-- ----------------------------
-- Table structure for tb_crossrace
-- ----------------------------
DROP TABLE IF EXISTS `tb_crossrace`;
CREATE TABLE `tb_crossrace` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `raceId` int(11) NOT NULL DEFAULT '0',
  `point` int(11) NOT NULL DEFAULT '0',
  `times` int(11) NOT NULL DEFAULT '0',
  `winTimes` int(11) NOT NULL DEFAULT '0',
  `fightTimes` int(11) NOT NULL DEFAULT '0',
  `joinReward` text NOT NULL,
  `balance` tinyint(4) NOT NULL DEFAULT '0',
  `totalTimes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_crossrace
-- ----------------------------
INSERT INTO `tb_crossrace` VALUES ('10000000001', '0', '0', '0', '0', '10', '{}', '0', '0');
INSERT INTO `tb_crossrace` VALUES ('10000000002', '0', '0', '0', '0', '0', '{}', '0', '0');
INSERT INTO `tb_crossrace` VALUES ('10000000003', '0', '0', '0', '0', '0', '{}', '0', '0');
INSERT INTO `tb_crossrace` VALUES ('10000000004', '0', '0', '0', '0', '0', '{}', '0', '0');
INSERT INTO `tb_crossrace` VALUES ('10000000005', '0', '0', '0', '0', '0', '{}', '0', '0');
INSERT INTO `tb_crossrace` VALUES ('10000000006', '0', '0', '0', '0', '0', '{}', '0', '0');
INSERT INTO `tb_crossrace` VALUES ('10000000007', '0', '0', '0', '0', '0', '{}', '0', '0');
INSERT INTO `tb_crossrace` VALUES ('10000000008', '0', '0', '0', '0', '10', '{}', '0', '0');

-- ----------------------------
-- Table structure for tb_crossrankact
-- ----------------------------
DROP TABLE IF EXISTS `tb_crossrankact`;
CREATE TABLE `tb_crossrankact` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) NOT NULL DEFAULT '0',
  `states` text NOT NULL,
  `open` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_crossrankact
-- ----------------------------

-- ----------------------------
-- Table structure for tb_destiny
-- ----------------------------
DROP TABLE IF EXISTS `tb_destiny`;
CREATE TABLE `tb_destiny` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `attacks` text NOT NULL,
  `defenses` text NOT NULL,
  `battles` text NOT NULL,
  `robTimes` int(11) NOT NULL DEFAULT '0',
  `totalRobTimes` int(11) NOT NULL DEFAULT '0',
  `refreshTimes` int(11) NOT NULL DEFAULT '0',
  `tasks` text NOT NULL,
  `destinyStone` int(11) NOT NULL DEFAULT '0',
  `lastResetTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_destiny
-- ----------------------------
INSERT INTO `tb_destiny` VALUES ('10000000001', '[]', '[]', '{\"10000000008\":0}', '6', '0', '0', '[]', '0', '1601396935');
INSERT INTO `tb_destiny` VALUES ('10000000002', '[]', '[]', '{}', '6', '0', '0', '[]', '0', '1601387889');
INSERT INTO `tb_destiny` VALUES ('10000000003', '[]', '[]', '{}', '6', '0', '0', '[]', '0', '1601388209');
INSERT INTO `tb_destiny` VALUES ('10000000004', '[]', '[]', '{}', '6', '0', '0', '[]', '0', '1601390291');
INSERT INTO `tb_destiny` VALUES ('10000000005', '[]', '[]', '{}', '6', '0', '0', '[]', '0', '1601391170');
INSERT INTO `tb_destiny` VALUES ('10000000006', '[]', '[]', '{}', '6', '0', '0', '[]', '0', '1601391220');
INSERT INTO `tb_destiny` VALUES ('10000000007', '[]', '[]', '{}', '6', '0', '0', '[]', '0', '1601391340');
INSERT INTO `tb_destiny` VALUES ('10000000008', '[]', '[]', '{}', '6', '0', '0', '[]', '0', '1601395260');

-- ----------------------------
-- Table structure for tb_divine
-- ----------------------------
DROP TABLE IF EXISTS `tb_divine`;
CREATE TABLE `tb_divine` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `actId` int(11) NOT NULL DEFAULT '0',
  `times` int(11) NOT NULL DEFAULT '0',
  `yuanbao` int(11) NOT NULL DEFAULT '0',
  `maxDivineNum` int(11) NOT NULL DEFAULT '0',
  `recordList` text NOT NULL,
  PRIMARY KEY (`playerId`,`actId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_divine
-- ----------------------------

-- ----------------------------
-- Table structure for tb_draw
-- ----------------------------
DROP TABLE IF EXISTS `tb_draw`;
CREATE TABLE `tb_draw` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `round` int(11) NOT NULL DEFAULT '0',
  `freeTime` int(11) NOT NULL DEFAULT '0',
  `totalPlay` int(11) NOT NULL DEFAULT '0',
  `refreshCount` int(11) NOT NULL DEFAULT '0',
  `openCards` text NOT NULL,
  `counts` text NOT NULL,
  `times` text NOT NULL,
  `awards` text NOT NULL,
  `numSet` text NOT NULL,
  `actTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_draw
-- ----------------------------

-- ----------------------------
-- Table structure for tb_dress
-- ----------------------------
DROP TABLE IF EXISTS `tb_dress`;
CREATE TABLE `tb_dress` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `bubble` int(11) NOT NULL DEFAULT '0',
  `activeIds` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_dress
-- ----------------------------

-- ----------------------------
-- Table structure for tb_equip
-- ----------------------------
DROP TABLE IF EXISTS `tb_equip`;
CREATE TABLE `tb_equip` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `mid` bigint(20) NOT NULL DEFAULT '0',
  `itemId` int(11) NOT NULL DEFAULT '0',
  `strengthLv` int(11) NOT NULL DEFAULT '0',
  `quaity` int(11) NOT NULL DEFAULT '0',
  `refineLv` int(11) NOT NULL DEFAULT '0',
  `stones` text NOT NULL,
  `isWear` tinyint(4) NOT NULL DEFAULT '0',
  `zhuLv` int(11) NOT NULL DEFAULT '0',
  `fightValue` bigint(20) NOT NULL DEFAULT '0',
  `artificeProcess` int(11) NOT NULL DEFAULT '0',
  `artificeLevel` int(11) NOT NULL DEFAULT '0',
  `artificeLucky` int(11) NOT NULL DEFAULT '0',
  `talismanRank` int(11) NOT NULL DEFAULT '0',
  `belondTo` bigint(20) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_equip
-- ----------------------------
INSERT INTO `tb_equip` VALUES ('10000000001', '1', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '2', '40100102', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '3', '40100102', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '4', '40100104', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '5', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '6', '40100101', '12', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '108', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '7', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '8', '40100104', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '9', '40100102', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '10', '40100104', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '11', '40100101', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '12', '40100102', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '13', '40100101', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '14', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '15', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '16', '40100101', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '17', '40100104', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '18', '40200101', '0', '20', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '120', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '19', '40200102', '0', '20', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '120', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '20', '40200103', '0', '20', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '120', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000001', '21', '40200104', '0', '20', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '120', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '1', '40100103', '16', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '124', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '2', '40100104', '16', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '124', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '3', '40100102', '16', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '124', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '4', '40100104', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '5', '40100101', '16', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '124', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '6', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '7', '40100101', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '8', '40100102', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '9', '40100104', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '10', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '11', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '12', '40100102', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '13', '40100101', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000003', '14', '40100104', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '1', '40100101', '18', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '132', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '2', '40100103', '18', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '132', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '3', '40100102', '18', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '132', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '4', '40100102', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '5', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '6', '40100101', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '7', '40100101', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '8', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '9', '40100102', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '10', '40100104', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '11', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '12', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '13', '40100102', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '14', '40100104', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '15', '40100104', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '16', '40100102', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '17', '40100103', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '18', '40200101', '0', '20', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '120', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '19', '40200102', '0', '20', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '120', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '20', '40200103', '0', '20', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '120', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000007', '21', '40200104', '0', '20', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '1', '0', '120', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000008', '1', '40100102', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000008', '2', '40100101', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');
INSERT INTO `tb_equip` VALUES ('10000000008', '3', '40100104', '0', '10', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '0', '0', '60', '0', '0', '0', '1', '0', '0');

-- ----------------------------
-- Table structure for tb_exam
-- ----------------------------
DROP TABLE IF EXISTS `tb_exam`;
CREATE TABLE `tb_exam` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `point` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `answerCount` int(11) NOT NULL DEFAULT '0',
  `correctCount` int(11) NOT NULL DEFAULT '0',
  `refreshTime` int(11) NOT NULL DEFAULT '0',
  `joinExam` tinyint(1) NOT NULL DEFAULT '0',
  `totalJoinTimes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_exam
-- ----------------------------

-- ----------------------------
-- Table structure for tb_extend
-- ----------------------------
DROP TABLE IF EXISTS `tb_extend`;
CREATE TABLE `tb_extend` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `battleMaxCount` int(11) NOT NULL DEFAULT '0',
  `totalCurrency` text NOT NULL,
  `bagSize` int(11) NOT NULL DEFAULT '0',
  `offlineSec` int(11) NOT NULL DEFAULT '0',
  `handbookMap` text NOT NULL,
  `zeroResetDate` int(11) NOT NULL DEFAULT '0',
  `combatTimes` int(11) NOT NULL DEFAULT '0',
  `combatCostTimes` int(11) NOT NULL DEFAULT '0',
  `consumeCurrency` text NOT NULL,
  `wpHandbook` text NOT NULL,
  `equipId` bigint(20) NOT NULL DEFAULT '0',
  `functionIds` text NOT NULL,
  `partnerId` bigint(20) NOT NULL DEFAULT '0',
  `firstReChargeSet` text NOT NULL,
  `firstReward` text NOT NULL,
  `todayRecharge` bigint(20) NOT NULL DEFAULT '0',
  `speedRadio` int(11) NOT NULL DEFAULT '0',
  `totalChangeBoss` bigint(20) NOT NULL DEFAULT '0',
  `totalChargeCCB` bigint(20) NOT NULL DEFAULT '0',
  `totalComPartner` bigint(20) NOT NULL DEFAULT '0',
  `newFirstReward` text NOT NULL,
  `newFirstCharge` text NOT NULL,
  `groupReward` text NOT NULL,
  `choose` tinyint(1) NOT NULL DEFAULT '0',
  `skipTimes` int(11) NOT NULL DEFAULT '0',
  `todayFirstCharge` bigint(20) NOT NULL DEFAULT '0',
  `todayFirstReward` text NOT NULL,
  `dailyConsume` bigint(20) NOT NULL DEFAULT '0',
  `buyGoldTimes` int(11) NOT NULL DEFAULT '0',
  `buyGoldCost` int(11) NOT NULL DEFAULT '0',
  `questionnaire` text NOT NULL,
  `clientSets` varchar(255) NOT NULL DEFAULT '',
  `shortCut` int(11) NOT NULL DEFAULT '0',
  `wanderReward` text NOT NULL,
  `wanderEndtime` bigint(20) NOT NULL DEFAULT '0',
  `lastWanderReward` text NOT NULL,
  `weekResetTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_extend
-- ----------------------------
INSERT INTO `tb_extend` VALUES ('10000000001', '6', '{\"1\":1599997,\"2\":194500,\"8\":10000,\"10\":18,\"11\":648,\"12\":100}', '100', '0', '{}', '20200930', '0', '0', '{\"1\":28025,\"2\":150}', '{}', '21', '[6401,9601,6402,6403,131,6404,6405,7,8,10,11,12,13,16,3601,17,3602,18,3603,3604,1301,1302,22,1303,1304,24,1305,1306,6301,3102,30,31,3103,32,801,33,802,35,803,36,804,37,38,40,41,42,43,300,301,45,46,302,50,52,53,54,6201,6203,59,6204,6205,61,62,6208,6209,6210,66,67,68,69,70,71,72,9801,9802,74,9803,75,9804,77,9805,80,81,82,83,6501,1001,1002,1003,1004,1005,1006,57,58]', '2', '[8]', '[]', '0', '1', '0', '64800', '1', '[]', '[]', '{}', '0', '15', '0', '{}', '0', '0', '0', '[]', '', '0', '{}', '1601398676', '[107080,207080,307080]', '1601222400');
INSERT INTO `tb_extend` VALUES ('10000000002', '0', '{\"1\":225,\"11\":0}', '100', '24', '{}', '20200929', '0', '0', '{}', '{}', '0', '[38,72,9801,1001,9802,46,31]', '1', '[]', '[]', '0', '0', '0', '0', '0', '[]', '[]', '{}', '0', '15', '0', '{}', '0', '0', '0', '[]', '', '0', '{}', '0', '[]', '1601222400');
INSERT INTO `tb_extend` VALUES ('10000000003', '6', '{\"1\":36630469,\"2\":628000,\"10\":12,\"11\":200000}', '100', '12', '{}', '20200929', '0', '0', '{\"1\":1244}', '{}', '14', '[6401,9601,6402,6404,6405,10,13,16,3601,17,3602,3603,3604,1301,1302,1303,1304,6301,3102,31,801,802,36,38,300,46,6203,6204,6205,61,62,6208,6209,6210,66,68,70,71,72,9801,9802,9803,75,77,82,1001,1002,1003,1004,1005,1006]', '2', '[]', '[]', '0', '0', '0', '0', '1', '[]', '[]', '{}', '0', '15', '0', '{}', '0', '0', '0', '[]', '', '0', '{}', '0', '[]', '1601222400');
INSERT INTO `tb_extend` VALUES ('10000000004', '0', '{\"1\":85,\"11\":0}', '100', '0', '{}', '20200929', '0', '0', '{}', '{}', '0', '[38,72,9801,1001,9802,31]', '1', '[]', '[]', '0', '0', '0', '0', '0', '[]', '[]', '{}', '0', '15', '0', '{}', '0', '0', '0', '[]', '', '0', '{}', '0', '[]', '1601222400');
INSERT INTO `tb_extend` VALUES ('10000000005', '0', '{\"11\":0}', '100', '0', '{}', '20200929', '0', '0', '{}', '{}', '0', '[38,72,9801,1001,9802,31]', '0', '[]', '[]', '0', '0', '0', '0', '0', '[]', '[]', '{}', '0', '15', '0', '{}', '0', '0', '0', '[]', '', '0', '{}', '0', '[]', '1601222400');
INSERT INTO `tb_extend` VALUES ('10000000006', '0', '{\"1\":40,\"11\":0}', '100', '1', '{}', '20200929', '0', '0', '{}', '{}', '0', '[38,72,9801,1001,9802,31]', '0', '[]', '[]', '0', '1', '0', '0', '0', '[]', '[]', '{}', '0', '15', '0', '{}', '0', '0', '0', '[]', '', '0', '{}', '0', '[]', '1601222400');
INSERT INTO `tb_extend` VALUES ('10000000007', '6', '{\"1\":161882,\"2\":100,\"10\":18,\"11\":0,\"12\":100}', '100', '26', '{}', '20200929', '0', '0', '{\"1\":17770}', '{}', '21', '[6401,9601,6402,6404,6405,10,12,13,16,3601,17,3602,3603,3604,1301,1302,1303,1304,6301,3102,31,801,802,36,38,300,301,46,6203,6204,6205,61,62,6208,6209,6210,66,68,70,71,72,9801,9802,9803,75,9804,77,82,1001,1002,1003,1004,1005,1006]', '2', '[]', '[]', '0', '1', '0', '0', '1', '[]', '[]', '{}', '0', '15', '0', '{}', '0', '0', '0', '[]', '', '0', '{}', '1601394282', '[102040,202040,302040]', '1601222400');
INSERT INTO `tb_extend` VALUES ('10000000008', '6', '{\"1\":1300,\"10\":3,\"11\":0}', '100', '0', '{}', '20200930', '0', '0', '{}', '{}', '3', '[6208,6209,6210,6404,36,6405,38,70,72,9801,1001,9802,1002,1004,77,46,6203,6204,6205,6301,31]', '1', '[]', '[]', '0', '0', '0', '0', '0', '[]', '[]', '{}', '0', '15', '0', '{}', '0', '0', '0', '[]', '', '0', '{}', '0', '[]', '1601222400');

-- ----------------------------
-- Table structure for tb_extendex
-- ----------------------------
DROP TABLE IF EXISTS `tb_extendex`;
CREATE TABLE `tb_extendex` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_extendex
-- ----------------------------

-- ----------------------------
-- Table structure for tb_fashion
-- ----------------------------
DROP TABLE IF EXISTS `tb_fashion`;
CREATE TABLE `tb_fashion` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `fashionId` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `expired` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`fashionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_fashion
-- ----------------------------

-- ----------------------------
-- Table structure for tb_foundry
-- ----------------------------
DROP TABLE IF EXISTS `tb_foundry`;
CREATE TABLE `tb_foundry` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `actId` int(11) NOT NULL DEFAULT '0',
  `storeVal` int(11) NOT NULL DEFAULT '0',
  `storeTotal` int(11) NOT NULL DEFAULT '0',
  `tasks` text NOT NULL,
  `finishTask` text NOT NULL,
  `rewards` text NOT NULL,
  `rewardQueue` text NOT NULL,
  PRIMARY KEY (`playerId`,`actId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_foundry
-- ----------------------------

-- ----------------------------
-- Table structure for tb_friend
-- ----------------------------
DROP TABLE IF EXISTS `tb_friend`;
CREATE TABLE `tb_friend` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `ids` text NOT NULL,
  `applyMap` text NOT NULL,
  `chatMap` text NOT NULL,
  `sendIds` text NOT NULL,
  `needReceiveIds` text NOT NULL,
  `receivedIds` text NOT NULL,
  `totalSendCount` int(11) NOT NULL DEFAULT '0',
  `favors` text NOT NULL,
  `offlineReceiveIds` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_friend
-- ----------------------------
INSERT INTO `tb_friend` VALUES ('10000000001', '[]', '{}', '{}', '[]', '[]', '[]', '0', '{}', '[]');
INSERT INTO `tb_friend` VALUES ('10000000002', '[]', '{}', '{}', '[]', '[]', '[]', '0', '{}', '[]');
INSERT INTO `tb_friend` VALUES ('10000000003', '[]', '{}', '{}', '[]', '[]', '[]', '0', '{}', '[]');
INSERT INTO `tb_friend` VALUES ('10000000004', '[]', '{}', '{}', '[]', '[]', '[]', '0', '{}', '[]');
INSERT INTO `tb_friend` VALUES ('10000000005', '[]', '{}', '{}', '[]', '[]', '[]', '0', '{}', '[]');
INSERT INTO `tb_friend` VALUES ('10000000006', '[]', '{}', '{}', '[]', '[]', '[]', '0', '{}', '[]');
INSERT INTO `tb_friend` VALUES ('10000000007', '[]', '{}', '{}', '[]', '[]', '[]', '0', '{}', '[]');
INSERT INTO `tb_friend` VALUES ('10000000008', '[]', '{}', '{}', '[]', '[]', '[]', '0', '{}', '[]');

-- ----------------------------
-- Table structure for tb_furnance
-- ----------------------------
DROP TABLE IF EXISTS `tb_furnance`;
CREATE TABLE `tb_furnance` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `exp` bigint(20) NOT NULL DEFAULT '0',
  `lv` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_furnance
-- ----------------------------

-- ----------------------------
-- Table structure for tb_general
-- ----------------------------
DROP TABLE IF EXISTS `tb_general`;
CREATE TABLE `tb_general` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `challenges` text NOT NULL,
  `resetTimes` text NOT NULL,
  `stars` text NOT NULL,
  `boxReward` text NOT NULL,
  `costOrder` int(11) NOT NULL DEFAULT '0',
  `restore` int(11) NOT NULL DEFAULT '0',
  `nextTime` int(11) NOT NULL DEFAULT '0',
  `buyTime` int(11) NOT NULL DEFAULT '0',
  `allStar` int(11) NOT NULL DEFAULT '0',
  `totalNum` int(11) NOT NULL DEFAULT '0',
  `assistInBattle` text NOT NULL,
  `difficultyStar` int(11) NOT NULL DEFAULT '0',
  `nightmareStar` int(11) NOT NULL DEFAULT '0',
  `diffboxReward` text NOT NULL,
  `nightboxReward` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_general
-- ----------------------------
INSERT INTO `tb_general` VALUES ('10000000001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0', '0', '[0,0,0,0,0,0,0,0,0,0]', '0', '0', '{}', '{}');
INSERT INTO `tb_general` VALUES ('10000000002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0', '0', '[]', '0', '0', '{}', '{}');
INSERT INTO `tb_general` VALUES ('10000000003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0', '0', '[]', '0', '0', '{}', '{}');
INSERT INTO `tb_general` VALUES ('10000000004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0', '0', '[]', '0', '0', '{}', '{}');
INSERT INTO `tb_general` VALUES ('10000000005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0', '0', '[]', '0', '0', '{}', '{}');
INSERT INTO `tb_general` VALUES ('10000000006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0', '0', '[]', '0', '0', '{}', '{}');
INSERT INTO `tb_general` VALUES ('10000000007', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0', '0', '[]', '0', '0', '{}', '{}');
INSERT INTO `tb_general` VALUES ('10000000008', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0', '0', '[]', '0', '0', '{}', '{}');

-- ----------------------------
-- Table structure for tb_group
-- ----------------------------
DROP TABLE IF EXISTS `tb_group`;
CREATE TABLE `tb_group` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `groupName` varchar(255) NOT NULL DEFAULT '',
  `leader` bigint(20) NOT NULL DEFAULT '0',
  `leaderName` varchar(255) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `notice` varchar(255) NOT NULL DEFAULT '',
  `applyList` text NOT NULL,
  `memberList` text NOT NULL,
  `vices` text NOT NULL,
  `sacrificePoint` int(11) NOT NULL DEFAULT '0',
  `sacrificeNum` int(11) NOT NULL DEFAULT '0',
  `exp` bigint(20) NOT NULL DEFAULT '0',
  `dayExp` bigint(20) NOT NULL DEFAULT '0',
  `officeList` text NOT NULL,
  `insId` int(11) NOT NULL DEFAULT '0',
  `bossHp` text NOT NULL,
  `reset` tinyint(4) NOT NULL DEFAULT '0',
  `damageRecords` text NOT NULL,
  `autoAdd` int(11) NOT NULL DEFAULT '0',
  `nextRecruitTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_group
-- ----------------------------

-- ----------------------------
-- Table structure for tb_groupmember
-- ----------------------------
DROP TABLE IF EXISTS `tb_groupmember`;
CREATE TABLE `tb_groupmember` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` bigint(20) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `applySet` text NOT NULL,
  `totalOffer` bigint(20) NOT NULL DEFAULT '0',
  `sacrificeBox` text NOT NULL,
  `sacrificeType` int(11) NOT NULL DEFAULT '0',
  `skills` text NOT NULL,
  `listOpen` tinyint(1) NOT NULL DEFAULT '0',
  `playerRewards` text NOT NULL,
  `fightTimes` int(11) NOT NULL DEFAULT '0',
  `lastResettime` int(11) NOT NULL DEFAULT '0',
  `totalTimes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_groupmember
-- ----------------------------
INSERT INTO `tb_groupmember` VALUES ('10000000001', '0', '0', '[]', '0', '[]', '0', '{}', '0', '{}', '0', '1601396935', '0');
INSERT INTO `tb_groupmember` VALUES ('10000000002', '0', '0', '[]', '0', '[]', '0', '{}', '0', '{}', '0', '0', '0');
INSERT INTO `tb_groupmember` VALUES ('10000000003', '0', '0', '[]', '0', '[]', '0', '{}', '0', '{}', '0', '0', '0');
INSERT INTO `tb_groupmember` VALUES ('10000000004', '0', '0', '[]', '0', '[]', '0', '{}', '0', '{}', '0', '0', '0');
INSERT INTO `tb_groupmember` VALUES ('10000000005', '0', '0', '[]', '0', '[]', '0', '{}', '0', '{}', '0', '0', '0');
INSERT INTO `tb_groupmember` VALUES ('10000000006', '0', '0', '[]', '0', '[]', '0', '{}', '0', '{}', '0', '0', '0');
INSERT INTO `tb_groupmember` VALUES ('10000000007', '0', '0', '[]', '0', '[]', '0', '{}', '0', '{}', '0', '0', '0');
INSERT INTO `tb_groupmember` VALUES ('10000000008', '0', '0', '[]', '0', '[]', '0', '{}', '0', '{}', '0', '1601395260', '0');

-- ----------------------------
-- Table structure for tb_groupwar
-- ----------------------------
DROP TABLE IF EXISTS `tb_groupwar`;
CREATE TABLE `tb_groupwar` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `times` int(11) NOT NULL DEFAULT '0',
  `lastRecoverTime` int(11) NOT NULL DEFAULT '0',
  `buyTimes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_groupwar
-- ----------------------------

-- ----------------------------
-- Table structure for tb_hero
-- ----------------------------
DROP TABLE IF EXISTS `tb_hero`;
CREATE TABLE `tb_hero` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `heroId` int(11) NOT NULL DEFAULT '0',
  `matchTeam` text NOT NULL,
  `rankFightTimes` int(11) NOT NULL DEFAULT '0',
  `heroFightTimes` int(11) NOT NULL DEFAULT '0',
  `buyTimes` int(11) NOT NULL DEFAULT '0',
  `oauthMembers` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_hero
-- ----------------------------

-- ----------------------------
-- Table structure for tb_increment
-- ----------------------------
DROP TABLE IF EXISTS `tb_increment`;
CREATE TABLE `tb_increment` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `increment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_increment
-- ----------------------------
INSERT INTO `tb_increment` VALUES ('arena_worships', '2');
INSERT INTO `tb_increment` VALUES ('playerId_10000', '10000000008');
INSERT INTO `tb_increment` VALUES ('pubMail', '2');

-- ----------------------------
-- Table structure for tb_invitation
-- ----------------------------
DROP TABLE IF EXISTS `tb_invitation`;
CREATE TABLE `tb_invitation` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `recruitInvitation` tinyint(1) NOT NULL DEFAULT '0',
  `wxInfo` text NOT NULL,
  `levelRewards` text NOT NULL,
  `chargeRewards` text NOT NULL,
  `normalRewards` text NOT NULL,
  `invitationNum` int(11) NOT NULL DEFAULT '0',
  `invitationTotal` int(11) NOT NULL DEFAULT '0',
  `nextTime` int(11) NOT NULL DEFAULT '0',
  `levelNumMap` text NOT NULL,
  `numMap` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_invitation
-- ----------------------------
INSERT INTO `tb_invitation` VALUES ('10000000001', '0', '[]', '{}', '{}', '[]', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_invitation` VALUES ('10000000002', '0', '[]', '{}', '{}', '[]', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_invitation` VALUES ('10000000003', '0', '[]', '{}', '{}', '[]', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_invitation` VALUES ('10000000004', '0', '[]', '{}', '{}', '[]', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_invitation` VALUES ('10000000005', '0', '[]', '{}', '{}', '[]', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_invitation` VALUES ('10000000006', '0', '[]', '{}', '{}', '[]', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_invitation` VALUES ('10000000007', '0', '[]', '{}', '{}', '[]', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_invitation` VALUES ('10000000008', '0', '[]', '{}', '{}', '[]', '0', '0', '0', '{}', '{}');

-- ----------------------------
-- Table structure for tb_kungfu
-- ----------------------------
DROP TABLE IF EXISTS `tb_kungfu`;
CREATE TABLE `tb_kungfu` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `kungFuId` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `battle` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `fightValue` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`kungFuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_kungfu
-- ----------------------------

-- ----------------------------
-- Table structure for tb_limit
-- ----------------------------
DROP TABLE IF EXISTS `tb_limit`;
CREATE TABLE `tb_limit` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `rewardCounts` text NOT NULL,
  `values` text NOT NULL,
  `states` text NOT NULL,
  `dateCharges` text NOT NULL,
  `consumeValue` bigint(20) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  `chargeValue` bigint(20) NOT NULL DEFAULT '0',
  `loginDay` int(11) NOT NULL DEFAULT '0',
  `loginTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_limit
-- ----------------------------
INSERT INTO `tb_limit` VALUES ('10000000001', '1', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '2', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '3', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '4', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '5', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '6', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '7', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '8', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '9', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '11', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '12', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '13', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '14', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '15', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '16', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '17', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '18', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '19', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '20', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '21', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '22', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '23', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '24', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '25', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '26', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '27', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '28', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '29', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '30', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '31', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '32', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '33', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '34', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '35', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '36', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '37', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '38', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '39', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '40', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '41', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '42', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '43', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '44', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '45', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '46', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '47', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '48', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '49', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '50', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '51', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '52', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '53', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '54', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '55', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '56', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '57', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '58', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '59', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '60', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '61', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '62', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '63', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '64', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '65', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '66', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '67', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '69', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '70', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '71', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '72', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '73', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '74', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '75', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '99', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '1001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '1002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '1003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '1004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '1005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '1006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '2001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '2002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '2003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '2004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '2005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '2006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '3001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '3002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '3003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '3004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '3005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '3006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '4001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '4002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '4003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '4004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '4005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '4006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10007', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10008', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10010', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10011', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10012', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10013', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10014', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10015', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10016', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10017', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10018', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10019', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10020', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10021', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10022', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10023', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10024', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10025', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10026', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10027', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '10028', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200007', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200008', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200010', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200011', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200012', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200013', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200014', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200015', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200016', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200017', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200018', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200101', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200102', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200103', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200104', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200105', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200106', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200107', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200108', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200109', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200110', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200111', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200112', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200113', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200114', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200115', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200116', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200117', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200118', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200201', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200202', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200203', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200204', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200205', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200206', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200207', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200208', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200209', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200210', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200211', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200212', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200213', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200214', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200215', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200216', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200217', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '200218', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300007', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300008', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300010', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300011', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300012', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300101', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300102', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300103', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300104', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300105', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300106', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300107', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300108', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300109', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300110', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300111', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '300112', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '310001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '310002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '310003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '310004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '310005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '310006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '310101', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '310102', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '310103', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '310104', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '310105', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '310106', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '320001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '320002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '320003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '320004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '320005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '320006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '320101', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '320102', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '320103', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '320104', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '320105', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000001', '320106', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '1', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '5', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '6', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '9', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '13', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '17', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '18', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '21', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '25', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '27', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '29', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '33', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '37', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '41', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '45', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '49', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '53', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '1002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '3002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '10001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '10005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '10009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '10013', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '10017', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '10021', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000002', '10025', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '1', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '2', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '5', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '6', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '9', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '13', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '17', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '18', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '21', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '25', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '27', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '29', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '30', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '33', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '37', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '41', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '45', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '46', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '49', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '53', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '1002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '3002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '10001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '10005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '10009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '10013', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '10017', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '10021', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000003', '10025', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '1', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '5', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '6', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '9', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '13', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '17', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '18', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '21', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '25', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '27', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '29', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '33', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '37', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '41', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '45', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '49', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '53', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '1002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '3002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '10001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '10005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '10009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '10013', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '10017', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '10021', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000004', '10025', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '1', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '5', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '6', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '9', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '13', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '17', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '21', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '25', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '29', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '33', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '37', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '41', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '45', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '49', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '53', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '10001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '10005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '10009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '10013', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '10017', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '10021', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000005', '10025', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '1', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '5', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '6', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '9', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '13', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '17', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '21', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '25', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '29', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '33', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '37', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '41', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '45', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '49', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '53', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '10001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '10005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '10009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '10013', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '10017', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '10021', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000006', '10025', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '1', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '2', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '5', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '6', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '9', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '10', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '13', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '17', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '18', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '21', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '25', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '27', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '29', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '30', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '33', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '37', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '38', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '41', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '45', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '46', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '49', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '53', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '1002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '1003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '2003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '3002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '10001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '10005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '10009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '10013', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '10017', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '10021', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '10025', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '200003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '200011', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '200103', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '200111', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '200203', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '200211', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '300003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '300009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '300103', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '300109', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '310003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '310103', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '320003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000007', '320103', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '1', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '2', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '3', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '4', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '5', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '6', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '7', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '8', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '9', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '11', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '12', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '13', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '14', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '15', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '16', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '17', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '18', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '19', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '20', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '21', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '22', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '23', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '24', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '25', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '26', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '27', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '28', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '29', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '30', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '31', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '32', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '33', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '34', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '35', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '36', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '37', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '38', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '39', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '40', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '41', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '42', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '43', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '44', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '45', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '46', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '47', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '48', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '49', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '50', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '51', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '52', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '53', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '54', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '55', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '56', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '57', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '58', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '59', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '60', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '61', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '62', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '63', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '64', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '65', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '66', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '67', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '69', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '70', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '71', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '72', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '73', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '74', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '75', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '99', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '1001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '1002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '1003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '1004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '1005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '1006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '2001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '2002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '2003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '2004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '2005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '2006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '3001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '3002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '3003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '3004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '3005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '3006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '4001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '4002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '4003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '4004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '4005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '4006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10007', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10008', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10010', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10011', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10012', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10013', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10014', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10015', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10016', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10017', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10018', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10019', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10020', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10021', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10022', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10023', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10024', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10025', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10026', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10027', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '10028', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200007', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200008', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200010', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200011', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200012', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200013', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200014', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200015', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200016', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200017', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200018', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200101', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200102', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200103', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200104', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200105', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200106', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200107', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200108', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200109', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200110', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200111', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200112', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200113', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200114', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200115', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200116', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200117', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200118', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200201', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200202', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200203', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200204', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200205', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200206', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200207', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200208', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200209', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200210', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200211', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200212', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200213', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200214', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200215', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200216', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200217', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '200218', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300007', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300008', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300010', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300011', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300012', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300101', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300102', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300103', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300104', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300105', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300106', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300107', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300108', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300109', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300110', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300111', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '300112', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '310001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '310002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '310003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '310004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '310005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '310006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '310101', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '310102', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '310103', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '310104', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '310105', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '310106', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '320001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '320002', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '320003', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '320004', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '320005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '320006', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '320101', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '320102', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '320103', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '320104', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '320105', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10000000008', '320106', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tb_limitbuy
-- ----------------------------
DROP TABLE IF EXISTS `tb_limitbuy`;
CREATE TABLE `tb_limitbuy` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `limitBuyGoods` text NOT NULL,
  `open` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_limitbuy
-- ----------------------------

-- ----------------------------
-- Table structure for tb_limitexchange
-- ----------------------------
DROP TABLE IF EXISTS `tb_limitexchange`;
CREATE TABLE `tb_limitexchange` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `limitExchangeGoods` text NOT NULL,
  `open` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_limitexchange
-- ----------------------------
INSERT INTO `tb_limitexchange` VALUES ('10000000001', '1', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000001', '2', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000001', '3', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000001', '4', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000001', '5', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000001', '6', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000001', '1001', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000001', '1002', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000001', '1003', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000001', '1004', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000001', '1005', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000001', '1006', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000002', '1', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000002', '2', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000002', '3', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000002', '4', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000002', '5', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000002', '6', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000002', '1001', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000002', '1002', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000002', '1003', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000002', '1004', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000002', '1005', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000002', '1006', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000003', '1', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000003', '2', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000003', '3', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000003', '4', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000003', '5', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000003', '6', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000003', '1001', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000003', '1002', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000003', '1003', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000003', '1004', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000003', '1005', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000003', '1006', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000004', '1', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000004', '2', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000004', '3', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000004', '4', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000004', '5', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000004', '6', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000004', '1001', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000004', '1002', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000004', '1003', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000004', '1004', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000004', '1005', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000004', '1006', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000005', '1', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000005', '2', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000005', '3', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000005', '4', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000005', '5', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000005', '6', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000005', '1001', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000005', '1002', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000005', '1003', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000005', '1004', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000005', '1005', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000005', '1006', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000006', '1', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000006', '2', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000006', '3', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000006', '4', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000006', '5', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000006', '6', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000006', '1001', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000006', '1002', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000006', '1003', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000006', '1004', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000006', '1005', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000006', '1006', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000007', '1', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000007', '2', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000007', '3', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000007', '4', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000007', '5', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000007', '6', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000007', '1001', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000007', '1002', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000007', '1003', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000007', '1004', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000007', '1005', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000007', '1006', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000008', '1', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000008', '2', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000008', '3', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000008', '4', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000008', '5', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000008', '6', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000008', '1001', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000008', '1002', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000008', '1003', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000008', '1004', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000008', '1005', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10000000008', '1006', '{}', '0');

-- ----------------------------
-- Table structure for tb_luckymoney
-- ----------------------------
DROP TABLE IF EXISTS `tb_luckymoney`;
CREATE TABLE `tb_luckymoney` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `goldMoney` bigint(20) NOT NULL DEFAULT '0',
  `silverMoney` bigint(20) NOT NULL DEFAULT '0',
  `goldMoneySum` bigint(20) NOT NULL DEFAULT '0',
  `silverMoneySum` bigint(20) NOT NULL DEFAULT '0',
  `taskPoint` bigint(20) NOT NULL DEFAULT '0',
  `battle` int(11) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_luckymoney
-- ----------------------------
INSERT INTO `tb_luckymoney` VALUES ('10000000001', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tb_luckymoney` VALUES ('10000000001', '2', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tb_luckymoney` VALUES ('10000000008', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tb_luckymoney` VALUES ('10000000008', '2', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tb_luckyturntable
-- ----------------------------
DROP TABLE IF EXISTS `tb_luckyturntable`;
CREATE TABLE `tb_luckyturntable` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `actId` int(11) NOT NULL DEFAULT '0',
  `luckyPoint` int(11) NOT NULL DEFAULT '0',
  `isFirstDraw` tinyint(4) NOT NULL DEFAULT '0',
  `drawTimes` int(11) NOT NULL DEFAULT '0',
  `freeTimes` int(11) NOT NULL DEFAULT '0',
  `tenDrawCount` int(11) NOT NULL DEFAULT '0',
  `totalPoint` int(11) NOT NULL DEFAULT '0',
  `lasttime` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`actId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_luckyturntable
-- ----------------------------
INSERT INTO `tb_luckyturntable` VALUES ('10000000001', '119', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tb_luckyturntable` VALUES ('10000000001', '201', '0', '0', '0', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for tb_mail
-- ----------------------------
DROP TABLE IF EXISTS `tb_mail`;
CREATE TABLE `tb_mail` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `sendId` bigint(20) NOT NULL DEFAULT '0',
  `sendName` varchar(255) NOT NULL DEFAULT '',
  `sendTime` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `context` varchar(255) NOT NULL DEFAULT '',
  `rewards` text NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT '0',
  `isExtract` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mail
-- ----------------------------
INSERT INTO `tb_mail` VALUES ('10000000002', '1', '1', '0', '系统邮件', '1601388000', '竞技场每日结算奖励', '您在今日的竞技场中排名第3001名，可获得竞技奖励如下，请查收', '[{\"type\":1,\"id\":2,\"num\":80},{\"type\":1,\"id\":5,\"num\":250}]', '0', '0');
INSERT INTO `tb_mail` VALUES ('10000000007', '1', '1', '0', '系统邮件', '1601391423', '欢迎邮件', '三国霸业，自此揭幕！', '[{\"type\":1,\"id\":11,\"num\":200000},{\"type\":2,\"id\":501001,\"num\":1},{\"type\":1,\"id\":2,\"num\":500000},{\"type\":1,\"id\":1,\"num\":30000000},{\"type\":5,\"id\":40100101,\"num\":1},{\"type\":5,\"id\":40100102,\"num\":1},{\"type\":5,\"id\":40100103,\"num\":1},{\"type\":5,\"id\":40100104,\"num\":1}]', '0', '0');
INSERT INTO `tb_mail` VALUES ('10000000008', '1', '1', '0', '系统邮件', '1601395155', '欢迎邮件', '三国霸业，自此揭幕！', '[{\"type\":1,\"id\":11,\"num\":200000},{\"type\":2,\"id\":501001,\"num\":1},{\"type\":1,\"id\":2,\"num\":500000},{\"type\":1,\"id\":1,\"num\":30000000},{\"type\":5,\"id\":40100101,\"num\":1},{\"type\":5,\"id\":40100102,\"num\":1},{\"type\":5,\"id\":40100103,\"num\":1},{\"type\":5,\"id\":40100104,\"num\":1}]', '0', '0');

-- ----------------------------
-- Table structure for tb_mental_rank
-- ----------------------------
DROP TABLE IF EXISTS `tb_mental_rank`;
CREATE TABLE `tb_mental_rank` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `showList` text NOT NULL,
  `rankList` text NOT NULL,
  `levelMap` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mental_rank
-- ----------------------------
INSERT INTO `tb_mental_rank` VALUES ('1', '[]', '[]', '{}');

-- ----------------------------
-- Table structure for tb_mini_game
-- ----------------------------
DROP TABLE IF EXISTS `tb_mini_game`;
CREATE TABLE `tb_mini_game` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `wamTimes` int(11) NOT NULL DEFAULT '0',
  `wamBuyTimes` int(11) NOT NULL DEFAULT '0',
  `wamGame` text NOT NULL,
  `refreshTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mini_game
-- ----------------------------

-- ----------------------------
-- Table structure for tb_mosaic
-- ----------------------------
DROP TABLE IF EXISTS `tb_mosaic`;
CREATE TABLE `tb_mosaic` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `actId` int(11) NOT NULL DEFAULT '0',
  `point` int(11) NOT NULL DEFAULT '0',
  `puzzle` text NOT NULL,
  `shop` text NOT NULL,
  `openTreasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`actId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mosaic
-- ----------------------------

-- ----------------------------
-- Table structure for tb_mounts
-- ----------------------------
DROP TABLE IF EXISTS `tb_mounts`;
CREATE TABLE `tb_mounts` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `mountsId` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `battle` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `breaksLevel` text NOT NULL,
  `fightValue` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`mountsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_mounts
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ninedays
-- ----------------------------
DROP TABLE IF EXISTS `tb_ninedays`;
CREATE TABLE `tb_ninedays` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `actId` int(11) NOT NULL DEFAULT '0',
  `point` int(11) NOT NULL DEFAULT '0',
  `totalPoint` int(11) NOT NULL DEFAULT '0',
  `tasks` text NOT NULL,
  `rewards` text NOT NULL,
  `open` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`actId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ninedays
-- ----------------------------

-- ----------------------------
-- Table structure for tb_offices
-- ----------------------------
DROP TABLE IF EXISTS `tb_offices`;
CREATE TABLE `tb_offices` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `officeList` text NOT NULL,
  `currJobId` int(11) NOT NULL DEFAULT '0',
  `endTime` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `officeHelpTimes` int(11) NOT NULL DEFAULT '0',
  `helpList` text NOT NULL,
  `helpTimeAdd` int(11) NOT NULL DEFAULT '0',
  `generalRecovery` int(11) NOT NULL DEFAULT '0',
  `typeMap` text NOT NULL,
  `currJobHelped` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_offices
-- ----------------------------
INSERT INTO `tb_offices` VALUES ('10000000001', '{}', '0', '0', '0', '0', '{}', '0', '0', '{}', '0');
INSERT INTO `tb_offices` VALUES ('10000000002', '{}', '0', '0', '0', '0', '{}', '0', '0', '{}', '0');
INSERT INTO `tb_offices` VALUES ('10000000003', '{}', '0', '0', '0', '0', '{}', '0', '0', '{}', '0');
INSERT INTO `tb_offices` VALUES ('10000000004', '{}', '0', '0', '0', '0', '{}', '0', '0', '{}', '0');
INSERT INTO `tb_offices` VALUES ('10000000005', '{}', '0', '0', '0', '0', '{}', '0', '0', '{}', '0');
INSERT INTO `tb_offices` VALUES ('10000000006', '{}', '0', '0', '0', '0', '{}', '0', '0', '{}', '0');
INSERT INTO `tb_offices` VALUES ('10000000007', '{}', '0', '0', '0', '0', '{}', '0', '0', '{}', '0');
INSERT INTO `tb_offices` VALUES ('10000000008', '{}', '0', '0', '0', '0', '{}', '0', '0', '{}', '0');

-- ----------------------------
-- Table structure for tb_partner
-- ----------------------------
DROP TABLE IF EXISTS `tb_partner`;
CREATE TABLE `tb_partner` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `tableId` int(11) NOT NULL DEFAULT '0',
  `stars` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `exp` bigint(20) NOT NULL DEFAULT '0',
  `wearSkin` int(11) NOT NULL DEFAULT '0',
  `activeSkins` text NOT NULL,
  `desLv` int(11) NOT NULL DEFAULT '0',
  `progress` int(11) NOT NULL DEFAULT '0',
  `primLv` int(11) NOT NULL DEFAULT '0',
  `breakthroughs` int(11) NOT NULL DEFAULT '0',
  `equips` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `fightValue` bigint(20) NOT NULL DEFAULT '0',
  `soulLevel` int(11) NOT NULL DEFAULT '0',
  `talisman` bigint(20) NOT NULL DEFAULT '0',
  `runeMap` text NOT NULL,
  `reincarnationMap` text NOT NULL,
  `reincarnationIds` text NOT NULL,
  PRIMARY KEY (`playerId`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_partner
-- ----------------------------
INSERT INTO `tb_partner` VALUES ('10000000001', '1', '3504', '0', '2', '0', '0', '[]', '0', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '1', '1509', '0', '0', '{}', '{}', '[]');
INSERT INTO `tb_partner` VALUES ('10000000001', '2', '2402', '0', '10', '0', '0', '[]', '0', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '1', '4077', '0', '0', '{}', '{}', '[]');
INSERT INTO `tb_partner` VALUES ('10000000002', '1', '2502', '0', '1', '0', '0', '[]', '0', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '0', '996', '0', '0', '{}', '{}', '[]');
INSERT INTO `tb_partner` VALUES ('10000000003', '1', '3504', '0', '2', '0', '0', '[]', '0', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '1', '1509', '0', '0', '{}', '{}', '[]');
INSERT INTO `tb_partner` VALUES ('10000000003', '2', '2402', '0', '1', '0', '0', '[]', '0', '0', '0', '0', '{\"1\":7,\"2\":0,\"3\":6,\"4\":4,\"5\":0,\"6\":0}', '1', '1175', '0', '0', '{}', '{}', '[]');
INSERT INTO `tb_partner` VALUES ('10000000004', '1', '2502', '0', '1', '0', '0', '[]', '0', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '0', '996', '0', '0', '{}', '{}', '[]');
INSERT INTO `tb_partner` VALUES ('10000000007', '1', '2502', '0', '8', '0', '0', '[]', '0', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '1', '6936', '0', '0', '{}', '{}', '[]');
INSERT INTO `tb_partner` VALUES ('10000000007', '2', '2402', '0', '1', '0', '0', '[]', '0', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '1', '3947', '0', '0', '{}', '{}', '[]');
INSERT INTO `tb_partner` VALUES ('10000000008', '1', '1506', '0', '1', '0', '0', '[]', '0', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '1', '996', '0', '0', '{}', '{}', '[]');

-- ----------------------------
-- Table structure for tb_player
-- ----------------------------
DROP TABLE IF EXISTS `tb_player`;
CREATE TABLE `tb_player` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `userId` bigint(20) NOT NULL DEFAULT '0',
  `playerName` varchar(255) NOT NULL DEFAULT '',
  `level` smallint(6) NOT NULL DEFAULT '0',
  `sex` tinyint(4) NOT NULL DEFAULT '0',
  `sceneId` int(11) NOT NULL DEFAULT '0',
  `head` varchar(255) NOT NULL DEFAULT '',
  `currencies` text NOT NULL,
  `fighters` text NOT NULL,
  `createTime` int(11) NOT NULL DEFAULT '0',
  `mailIdCount` int(11) NOT NULL DEFAULT '0',
  `pubIdCount` int(11) NOT NULL DEFAULT '0',
  `status` text NOT NULL,
  `breakthroughs` int(11) NOT NULL DEFAULT '0',
  `talents` text NOT NULL,
  `desLv` int(11) NOT NULL DEFAULT '0',
  `desProgress` int(11) NOT NULL DEFAULT '0',
  `stars` int(11) NOT NULL DEFAULT '0',
  `equips` text NOT NULL,
  `vip` tinyint(4) NOT NULL DEFAULT '0',
  `loginOutTime` int(11) NOT NULL DEFAULT '0',
  `leaderId` int(11) NOT NULL DEFAULT '0',
  `fightValue` bigint(20) NOT NULL DEFAULT '0',
  `quality` int(11) NOT NULL DEFAULT '0',
  `worships` text NOT NULL,
  `isWorship` text NOT NULL,
  `vipReward` text NOT NULL,
  `totalValue` bigint(20) NOT NULL DEFAULT '0',
  `activeTitles` text NOT NULL,
  `wearTitle` int(11) NOT NULL DEFAULT '0',
  `wearFashion` int(11) NOT NULL DEFAULT '0',
  `onlineTime` int(11) NOT NULL DEFAULT '0',
  `onlineReward` text NOT NULL,
  `todayLevel` int(11) NOT NULL DEFAULT '0',
  `firstHand` bigint(20) NOT NULL DEFAULT '0',
  `soulLevel` int(11) NOT NULL DEFAULT '0',
  `soulsFighter` text NOT NULL,
  `talisman` bigint(20) NOT NULL DEFAULT '0',
  `reincarnationMap` text NOT NULL,
  `reincarnationIds` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_player
-- ----------------------------
INSERT INTO `tb_player` VALUES ('10000000001', '15', '菜鸟阁', '80', '2', '30401', 'sex:2:', '[0,1571972,194350,0,6900346,0,0,0,10000,0,18,648,100,0,0,0,0,0,0]', '[-1,1,2,0,0,0]', '1600020360', '3', '2', '{}', '0', '[]', '0', '0', '0', '{\"1\":6,\"2\":2,\"3\":1,\"4\":4,\"5\":0,\"6\":0}', '7', '1601396914', '102', '24856', '40', '[0,0,0,0,0,0,0,0,0,0]', '[0,0,0,0,0,0,0,0,0,0]', '[]', '30442', '{}', '0', '0', '39', '[0,0,0]', '1', '0', '0', '[]', '0', '{}', '[]');
INSERT INTO `tb_player` VALUES ('10000000002', '17', '徐霜晶', '3', '2', '30101', 'sex:2:', '[0,225,0,0,550,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', '[-1,0,0,0,0,0]', '1601387888', '1', '2', '{}', '0', '[]', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '2', '1601388142', '102', '844', '40', '[]', '[0,0,0,0,0,0,0,0,0,0]', '[]', '844', '{}', '0', '0', '230', '[2,0,0]', '1', '0', '0', '[]', '0', '{}', '[]');
INSERT INTO `tb_player` VALUES ('10000000003', '18', '波风吏宗', '11', '1', '30301', 'sex:1:', '[0,36629225,628000,0,38758,0,0,0,0,0,12,200000,0,0,0,0,0,0,0]', '[-1,1,2,0,0,0]', '1601388209', '1', '2', '{}', '0', '[]', '0', '0', '0', '{\"1\":5,\"2\":3,\"3\":1,\"4\":2,\"5\":0,\"6\":0}', '20', '1601392143', '101', '5640', '40', '[]', '[0,0,0,0,0,0,0,0,0,0]', '[]', '8324', '{}', '0', '0', '3922', '[2,0,0]', '1', '0', '0', '[]', '0', '{}', '[]');
INSERT INTO `tb_player` VALUES ('10000000004', '19', '姜仲南', '2', '1', '30101', 'sex:1:', '[0,85,0,0,550,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', '[-1,0,0,0,0,0]', '1601390291', '0', '2', '{}', '0', '[]', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '2', '1601391103', '101', '563', '40', '[]', '[0,0,0,0,0,0,0,0,0,0]', '[]', '563', '{}', '0', '0', '812', '[0,0,0]', '1', '0', '0', '[]', '0', '{}', '[]');
INSERT INTO `tb_player` VALUES ('10000000005', '20', '秋道真名', '1', '2', '30101', 'sex:2:', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', '[-1,0,0,0,0,0]', '1601391170', '0', '2', '{}', '0', '[]', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '2', '1601391364', '102', '221', '40', '[]', '[0,0,0,0,0,0,0,0,0,0]', '[]', '221', '{}', '0', '0', '194', '[]', '1', '0', '0', '[]', '0', '{}', '[]');
INSERT INTO `tb_player` VALUES ('10000000006', '21', '亲测源码网', '2', '2', '30101', 'sex:2:', '[0,40,0,0,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', '[-1,0,0,0,0,0]', '1601391220', '0', '2', '{}', '0', '[]', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '2', '1601391364', '102', '563', '40', '[]', '[0,0,0,0,0,0,0,0,0,0]', '[]', '563', '{}', '0', '0', '98', '[]', '1', '0', '0', '[]', '0', '{}', '[]');
INSERT INTO `tb_player` VALUES ('10000000007', '22', 'QCYMWCOM', '12', '1', '30401', 'sex:1:', '[0,144112,100,0,16742,0,0,0,0,0,18,0,100,0,0,0,0,0,0]', '[-1,1,2,0,0,0]', '1601391340', '1', '2', '{}', '0', '[]', '0', '0', '0', '{\"1\":18,\"2\":19,\"3\":20,\"4\":21,\"5\":0,\"6\":0}', '2', '1601395011', '101', '8954', '40', '[]', '[0,0,0,0,0,0,0,0,0,0]', '[]', '19837', '{}', '0', '0', '3646', '[2,0,0]', '1', '0', '0', '[]', '0', '{}', '[]');
INSERT INTO `tb_player` VALUES ('10000000008', '23', '马玄元', '4', '1', '30101', 'sex:1:', '[0,1300,0,0,5210,0,0,0,0,0,3,0,0,0,0,0,0,0,0]', '[-1,1,0,0,0,0]', '1601395105', '1', '2', '{}', '0', '[]', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '2', '1601396825', '101', '1126', '40', '[]', '[0,0,0,0,0,0,0,0,0,0]', '[]', '2122', '{}', '0', '0', '1625', '[0,0,0]', '1', '0', '0', '[]', '0', '{}', '[]');

-- ----------------------------
-- Table structure for tb_player_mental
-- ----------------------------
DROP TABLE IF EXISTS `tb_player_mental`;
CREATE TABLE `tb_player_mental` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `times` int(11) NOT NULL DEFAULT '0',
  `totalTimes` int(11) NOT NULL DEFAULT '0',
  `freeTime` int(11) NOT NULL DEFAULT '0',
  `rewardIds` text NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `records` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_player_mental
-- ----------------------------
INSERT INTO `tb_player_mental` VALUES ('10000000001', '0', '0', '0', '[]', '0', '[]');
INSERT INTO `tb_player_mental` VALUES ('10000000002', '0', '0', '0', '[]', '0', '[]');
INSERT INTO `tb_player_mental` VALUES ('10000000003', '0', '0', '0', '[]', '0', '[]');
INSERT INTO `tb_player_mental` VALUES ('10000000004', '0', '0', '0', '[]', '0', '[]');
INSERT INTO `tb_player_mental` VALUES ('10000000005', '0', '0', '0', '[]', '0', '[]');
INSERT INTO `tb_player_mental` VALUES ('10000000006', '0', '0', '0', '[]', '0', '[]');
INSERT INTO `tb_player_mental` VALUES ('10000000007', '0', '0', '0', '[]', '0', '[]');
INSERT INTO `tb_player_mental` VALUES ('10000000008', '0', '0', '0', '[]', '0', '[]');

-- ----------------------------
-- Table structure for tb_pubmail
-- ----------------------------
DROP TABLE IF EXISTS `tb_pubmail`;
CREATE TABLE `tb_pubmail` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `sendId` bigint(20) NOT NULL DEFAULT '0',
  `sendName` varchar(255) NOT NULL DEFAULT '',
  `sendTime` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `context` varchar(255) NOT NULL DEFAULT '',
  `rewards` text NOT NULL,
  `rules` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pubmail
-- ----------------------------
INSERT INTO `tb_pubmail` VALUES ('1', '1', '0', '系统邮件', '1600020498', '1', '1', '[{\"type\":1,\"id\":4,\"num\":9999999}]', '{\"4\":\"10000000001\"}');
INSERT INTO `tb_pubmail` VALUES ('2', '1', '0', '系统邮件', '1600020513', '1', '1', '[{\"type\":1,\"id\":4,\"num\":999999999}]', '{\"4\":\"10000000001\"}');

-- ----------------------------
-- Table structure for tb_rankact
-- ----------------------------
DROP TABLE IF EXISTS `tb_rankact`;
CREATE TABLE `tb_rankact` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `value` bigint(20) NOT NULL DEFAULT '0',
  `states` text NOT NULL,
  `open` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_rankact
-- ----------------------------
INSERT INTO `tb_rankact` VALUES ('10000000001', '8', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000001', '9', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000001', '10', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000001', '11', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000001', '12', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000001', '13', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000001', '14', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000002', '8', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000002', '9', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000002', '10', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000002', '11', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000002', '12', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000002', '13', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000002', '14', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000003', '8', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000003', '9', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000003', '10', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000003', '11', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000003', '12', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000003', '13', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000003', '14', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000004', '8', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000004', '9', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000004', '10', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000004', '11', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000004', '12', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000004', '13', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000004', '14', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000005', '8', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000005', '9', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000005', '10', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000005', '11', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000005', '12', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000005', '13', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000005', '14', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000006', '8', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000006', '9', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000006', '10', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000006', '11', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000006', '12', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000006', '13', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000006', '14', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000007', '8', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000007', '9', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000007', '10', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000007', '11', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000007', '12', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000007', '13', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000007', '14', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000008', '8', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000008', '9', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000008', '10', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000008', '11', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000008', '12', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000008', '13', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10000000008', '14', '0', '{}', '0');

-- ----------------------------
-- Table structure for tb_rebate
-- ----------------------------
DROP TABLE IF EXISTS `tb_rebate`;
CREATE TABLE `tb_rebate` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `charge` bigint(20) NOT NULL DEFAULT '0',
  `refChare` bigint(20) NOT NULL DEFAULT '0',
  `score` int(11) NOT NULL DEFAULT '0',
  `reward` text NOT NULL,
  `times` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_rebate
-- ----------------------------
INSERT INTO `tb_rebate` VALUES ('10000000001', '18', '64800', '64800', '0', '{}', '0');
INSERT INTO `tb_rebate` VALUES ('10000000002', '18', '0', '0', '0', '{}', '0');
INSERT INTO `tb_rebate` VALUES ('10000000003', '18', '0', '0', '0', '{}', '0');
INSERT INTO `tb_rebate` VALUES ('10000000004', '18', '0', '0', '0', '{}', '0');
INSERT INTO `tb_rebate` VALUES ('10000000005', '18', '0', '0', '0', '{}', '0');
INSERT INTO `tb_rebate` VALUES ('10000000006', '18', '0', '0', '0', '{}', '0');
INSERT INTO `tb_rebate` VALUES ('10000000007', '18', '0', '0', '0', '{}', '0');
INSERT INTO `tb_rebate` VALUES ('10000000008', '18', '0', '0', '0', '{}', '0');

-- ----------------------------
-- Table structure for tb_rechargeactivity
-- ----------------------------
DROP TABLE IF EXISTS `tb_rechargeactivity`;
CREATE TABLE `tb_rechargeactivity` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `recharge` bigint(20) NOT NULL DEFAULT '0',
  `states` text NOT NULL,
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_rechargeactivity
-- ----------------------------

-- ----------------------------
-- Table structure for tb_recruit
-- ----------------------------
DROP TABLE IF EXISTS `tb_recruit`;
CREATE TABLE `tb_recruit` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `nextFreeTime` int(11) NOT NULL DEFAULT '0',
  `currFreeCount` int(11) NOT NULL DEFAULT '0',
  `recruitTimes` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `ccyRecruitTimes` int(11) NOT NULL DEFAULT '0',
  `totalRecruitTimes` int(11) NOT NULL DEFAULT '0',
  `score` int(11) NOT NULL DEFAULT '0',
  `boxList` text NOT NULL,
  `free` int(11) NOT NULL DEFAULT '0',
  `today` text NOT NULL,
  `tommorow` text NOT NULL,
  `refreshNum` int(11) NOT NULL DEFAULT '0',
  `tenCCYRecruit` int(11) NOT NULL DEFAULT '0',
  `firstGetList` text NOT NULL,
  `rebateScore` bigint(20) NOT NULL DEFAULT '0',
  `rebateReward` text NOT NULL,
  `endTime` int(11) NOT NULL DEFAULT '0',
  `goldScore` int(11) NOT NULL DEFAULT '0',
  `goldBoxList` text NOT NULL,
  `goldFree` int(11) NOT NULL DEFAULT '0',
  `goldToday` text NOT NULL,
  `goldTommorow` text NOT NULL,
  `goldRefreshNum` int(11) NOT NULL DEFAULT '0',
  `goldRecruitTimes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_recruit
-- ----------------------------
INSERT INTO `tb_recruit` VALUES ('10000000001', '1600020361', '3', '0', '0', '0', '10', '0', '[]', '0', '[4]', '[2]', '0', '1', '[{\"key\":214506,\"value\":3,\"valueStr\":\"2\"},{\"key\":211502,\"value\":3,\"valueStr\":\"2\"},{\"key\":214404,\"value\":3,\"valueStr\":\"2\"},{\"key\":214501,\"value\":3,\"valueStr\":\"2\"},{\"key\":212506,\"value\":10,\"valueStr\":\"2\"},{\"key\":213502,\"value\":5,\"valueStr\":\"2\"},{\"key\":211404,\"value\":3,\"valueStr\":\"2\"},{\"key\":214403,\"value\":5,\"valueStr\":\"2\"},{\"key\":212402,\"value\":3,\"valueStr\":\"2\"},{\"key\":3504,\"value\":1,\"valueStr\":\"4\"}]', '0', '{}', '0', '0', '[]', '0', '[6]', '[6]', '0', '0');
INSERT INTO `tb_recruit` VALUES ('10000000002', '1601387889', '3', '0', '0', '0', '10', '0', '[]', '0', '[1]', '[3]', '0', '1', '[{\"key\":211402,\"value\":3,\"valueStr\":\"2\"},{\"key\":213505,\"value\":3,\"valueStr\":\"2\"},{\"key\":211504,\"value\":3,\"valueStr\":\"2\"},{\"key\":214505,\"value\":3,\"valueStr\":\"2\"},{\"key\":212503,\"value\":3,\"valueStr\":\"2\"},{\"key\":213505,\"value\":3,\"valueStr\":\"2\"},{\"key\":213505,\"value\":3,\"valueStr\":\"2\"},{\"key\":213502,\"value\":10,\"valueStr\":\"2\"},{\"key\":213505,\"value\":3,\"valueStr\":\"2\"},{\"key\":2502,\"value\":1,\"valueStr\":\"4\"}]', '0', '{}', '0', '0', '[]', '0', '[]', '[]', '0', '0');
INSERT INTO `tb_recruit` VALUES ('10000000003', '1601388209', '3', '0', '0', '0', '10', '0', '[]', '0', '[1]', '[3]', '0', '1', '[{\"key\":213403,\"value\":3,\"valueStr\":\"2\"},{\"key\":214504,\"value\":3,\"valueStr\":\"2\"},{\"key\":213502,\"value\":5,\"valueStr\":\"2\"},{\"key\":212506,\"value\":3,\"valueStr\":\"2\"},{\"key\":212505,\"value\":3,\"valueStr\":\"2\"},{\"key\":213504,\"value\":3,\"valueStr\":\"2\"},{\"key\":214405,\"value\":5,\"valueStr\":\"2\"},{\"key\":213504,\"value\":3,\"valueStr\":\"2\"},{\"key\":212502,\"value\":3,\"valueStr\":\"2\"},{\"key\":3504,\"value\":1,\"valueStr\":\"4\"}]', '0', '{}', '0', '0', '[]', '0', '[6]', '[6]', '0', '0');
INSERT INTO `tb_recruit` VALUES ('10000000004', '1601390291', '3', '0', '0', '0', '10', '0', '[]', '0', '[3]', '[4]', '0', '1', '[{\"key\":211501,\"value\":5,\"valueStr\":\"2\"},{\"key\":214504,\"value\":3,\"valueStr\":\"2\"},{\"key\":214402,\"value\":3,\"valueStr\":\"2\"},{\"key\":214504,\"value\":3,\"valueStr\":\"2\"},{\"key\":211405,\"value\":3,\"valueStr\":\"2\"},{\"key\":211405,\"value\":3,\"valueStr\":\"2\"},{\"key\":214501,\"value\":3,\"valueStr\":\"2\"},{\"key\":214402,\"value\":5,\"valueStr\":\"2\"},{\"key\":212402,\"value\":10,\"valueStr\":\"2\"},{\"key\":2502,\"value\":1,\"valueStr\":\"4\"}]', '0', '{}', '0', '0', '[]', '0', '[6]', '[6]', '0', '0');
INSERT INTO `tb_recruit` VALUES ('10000000005', '1601391170', '3', '0', '0', '0', '0', '0', '[]', '0', '[1]', '[4]', '0', '0', '[{\"key\":211506,\"value\":5,\"valueStr\":\"2\"},{\"key\":214501,\"value\":5,\"valueStr\":\"2\"},{\"key\":213503,\"value\":10,\"valueStr\":\"2\"},{\"key\":214402,\"value\":5,\"valueStr\":\"2\"},{\"key\":213404,\"value\":10,\"valueStr\":\"2\"},{\"key\":214401,\"value\":5,\"valueStr\":\"2\"},{\"key\":211405,\"value\":3,\"valueStr\":\"2\"},{\"key\":214401,\"value\":5,\"valueStr\":\"2\"},{\"key\":214404,\"value\":5,\"valueStr\":\"2\"},{\"key\":1506,\"value\":1,\"valueStr\":\"4\"}]', '0', '{}', '0', '0', '[]', '0', '[]', '[]', '0', '0');
INSERT INTO `tb_recruit` VALUES ('10000000006', '1601391220', '3', '0', '0', '0', '0', '0', '[]', '0', '[2]', '[2]', '0', '0', '[{\"key\":213501,\"value\":3,\"valueStr\":\"2\"},{\"key\":212502,\"value\":3,\"valueStr\":\"2\"},{\"key\":214503,\"value\":10,\"valueStr\":\"2\"},{\"key\":214505,\"value\":3,\"valueStr\":\"2\"},{\"key\":213404,\"value\":5,\"valueStr\":\"2\"},{\"key\":214503,\"value\":3,\"valueStr\":\"2\"},{\"key\":213501,\"value\":3,\"valueStr\":\"2\"},{\"key\":212506,\"value\":3,\"valueStr\":\"2\"},{\"key\":213501,\"value\":3,\"valueStr\":\"2\"},{\"key\":2502,\"value\":1,\"valueStr\":\"4\"}]', '0', '{}', '0', '0', '[]', '0', '[]', '[]', '0', '0');
INSERT INTO `tb_recruit` VALUES ('10000000007', '1601391340', '3', '0', '0', '0', '10', '0', '[]', '0', '[4]', '[3]', '0', '1', '[{\"key\":214505,\"value\":5,\"valueStr\":\"2\"},{\"key\":213502,\"value\":3,\"valueStr\":\"2\"},{\"key\":211405,\"value\":10,\"valueStr\":\"2\"},{\"key\":214505,\"value\":3,\"valueStr\":\"2\"},{\"key\":213401,\"value\":5,\"valueStr\":\"2\"},{\"key\":213405,\"value\":10,\"valueStr\":\"2\"},{\"key\":211506,\"value\":10,\"valueStr\":\"2\"},{\"key\":214403,\"value\":3,\"valueStr\":\"2\"},{\"key\":213505,\"value\":3,\"valueStr\":\"2\"},{\"key\":2502,\"value\":1,\"valueStr\":\"4\"}]', '0', '{}', '0', '0', '[]', '0', '[6]', '[6]', '0', '0');
INSERT INTO `tb_recruit` VALUES ('10000000008', '1601395105', '3', '0', '0', '0', '10', '0', '[]', '0', '[4]', '[2]', '0', '1', '[{\"key\":213504,\"value\":3,\"valueStr\":\"2\"},{\"key\":211405,\"value\":5,\"valueStr\":\"2\"},{\"key\":213502,\"value\":3,\"valueStr\":\"2\"},{\"key\":214503,\"value\":3,\"valueStr\":\"2\"},{\"key\":211403,\"value\":5,\"valueStr\":\"2\"},{\"key\":212401,\"value\":5,\"valueStr\":\"2\"},{\"key\":212504,\"value\":3,\"valueStr\":\"2\"},{\"key\":213505,\"value\":3,\"valueStr\":\"2\"},{\"key\":211504,\"value\":3,\"valueStr\":\"2\"},{\"key\":1506,\"value\":1,\"valueStr\":\"4\"}]', '0', '{}', '0', '0', '[]', '0', '[6]', '[6]', '0', '0');

-- ----------------------------
-- Table structure for tb_regression
-- ----------------------------
DROP TABLE IF EXISTS `tb_regression`;
CREATE TABLE `tb_regression` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `actId` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `offlineDay` int(11) NOT NULL DEFAULT '0',
  `maxRecharge` int(11) NOT NULL DEFAULT '0',
  `accRecharge` int(11) NOT NULL DEFAULT '0',
  `reward` text NOT NULL,
  `buy` text NOT NULL,
  `chargeIds` text NOT NULL,
  PRIMARY KEY (`playerId`,`actId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_regression
-- ----------------------------

-- ----------------------------
-- Table structure for tb_rune
-- ----------------------------
DROP TABLE IF EXISTS `tb_rune`;
CREATE TABLE `tb_rune` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `runeMidInit` bigint(20) NOT NULL DEFAULT '0',
  `goldEndTime` int(11) NOT NULL DEFAULT '0',
  `runeMap` text NOT NULL,
  `totalZhuHun` int(11) NOT NULL DEFAULT '0',
  `talismanTurn` int(11) NOT NULL DEFAULT '0',
  `tatalArtificeTimes` bigint(20) NOT NULL DEFAULT '0',
  `point` int(11) NOT NULL DEFAULT '0',
  `times` int(11) NOT NULL DEFAULT '0',
  `hp` int(11) NOT NULL DEFAULT '0',
  `records` text NOT NULL,
  `lastRecoverTime` int(11) NOT NULL DEFAULT '0',
  `dailyReward` text NOT NULL,
  `stageReward` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_rune
-- ----------------------------
INSERT INTO `tb_rune` VALUES ('10000000001', '0', '0', '{}', '0', '0', '0', '0', '0', '3', '[]', '0', '{}', '{}');
INSERT INTO `tb_rune` VALUES ('10000000002', '0', '0', '{}', '0', '0', '0', '0', '0', '3', '[]', '0', '{}', '{}');
INSERT INTO `tb_rune` VALUES ('10000000003', '0', '0', '{}', '0', '0', '0', '0', '0', '3', '[]', '0', '{}', '{}');
INSERT INTO `tb_rune` VALUES ('10000000004', '0', '0', '{}', '0', '0', '0', '0', '0', '3', '[]', '0', '{}', '{}');
INSERT INTO `tb_rune` VALUES ('10000000005', '0', '0', '{}', '0', '0', '0', '0', '0', '3', '[]', '0', '{}', '{}');
INSERT INTO `tb_rune` VALUES ('10000000006', '0', '0', '{}', '0', '0', '0', '0', '0', '3', '[]', '0', '{}', '{}');
INSERT INTO `tb_rune` VALUES ('10000000007', '0', '0', '{}', '0', '0', '0', '0', '0', '3', '[]', '0', '{}', '{}');
INSERT INTO `tb_rune` VALUES ('10000000008', '0', '0', '{}', '0', '0', '0', '0', '0', '3', '[]', '0', '{}', '{}');

-- ----------------------------
-- Table structure for tb_rune_bag
-- ----------------------------
DROP TABLE IF EXISTS `tb_rune_bag`;
CREATE TABLE `tb_rune_bag` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `mid` bigint(20) NOT NULL DEFAULT '0',
  `itemId` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `hole` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_rune_bag
-- ----------------------------

-- ----------------------------
-- Table structure for tb_sanguozhi
-- ----------------------------
DROP TABLE IF EXISTS `tb_sanguozhi`;
CREATE TABLE `tb_sanguozhi` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `recordStarId` int(11) NOT NULL DEFAULT '0',
  `rewarded` text NOT NULL,
  `finishes` text NOT NULL,
  `activity` tinyint(1) NOT NULL DEFAULT '0',
  `values` text NOT NULL,
  PRIMARY KEY (`playerId`,`recordStarId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sanguozhi
-- ----------------------------
INSERT INTO `tb_sanguozhi` VALUES ('10000000001', '1', '[113,108]', '[113,108]', '1', '{\"113\":10,\"108\":6}');
INSERT INTO `tb_sanguozhi` VALUES ('10000000001', '2', '[]', '[175]', '0', '{\"113\":12,\"175\":1}');
INSERT INTO `tb_sanguozhi` VALUES ('10000000002', '1', '[]', '[]', '0', '{\"113\":0,\"108\":3}');
INSERT INTO `tb_sanguozhi` VALUES ('10000000003', '1', '[113,108]', '[113,108]', '1', '{\"113\":64,\"108\":6}');
INSERT INTO `tb_sanguozhi` VALUES ('10000000003', '2', '[]', '[113]', '0', '{\"113\":64,\"175\":0}');
INSERT INTO `tb_sanguozhi` VALUES ('10000000004', '1', '[]', '[]', '0', '{\"113\":0,\"108\":2}');
INSERT INTO `tb_sanguozhi` VALUES ('10000000005', '1', '[]', '[]', '0', '{\"113\":0,\"108\":1}');
INSERT INTO `tb_sanguozhi` VALUES ('10000000006', '1', '[]', '[]', '0', '{\"113\":0,\"108\":2}');
INSERT INTO `tb_sanguozhi` VALUES ('10000000007', '1', '[113,108]', '[113,108]', '1', '{\"113\":54,\"108\":6}');
INSERT INTO `tb_sanguozhi` VALUES ('10000000007', '2', '[113,175]', '[113,175]', '1', '{\"113\":54,\"175\":1}');
INSERT INTO `tb_sanguozhi` VALUES ('10000000007', '3', '[]', '[108]', '0', '{\"129\":0,\"114\":0,\"108\":11,\"175\":0}');
INSERT INTO `tb_sanguozhi` VALUES ('10000000008', '1', '[]', '[]', '0', '{\"113\":0,\"108\":4}');

-- ----------------------------
-- Table structure for tb_secreti
-- ----------------------------
DROP TABLE IF EXISTS `tb_secreti`;
CREATE TABLE `tb_secreti` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `insMap` text NOT NULL,
  `rewards` text NOT NULL,
  `rewardTimes` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `totalTimes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_secreti
-- ----------------------------
INSERT INTO `tb_secreti` VALUES ('10000000001', '{\"1\":[]}', '{}', '5', '0', '0');
INSERT INTO `tb_secreti` VALUES ('10000000002', '{\"1\":[]}', '{}', '5', '0', '0');
INSERT INTO `tb_secreti` VALUES ('10000000003', '{\"1\":[]}', '{}', '5', '0', '0');
INSERT INTO `tb_secreti` VALUES ('10000000004', '{\"1\":[]}', '{}', '5', '0', '0');
INSERT INTO `tb_secreti` VALUES ('10000000005', '{\"1\":[]}', '{}', '5', '0', '0');
INSERT INTO `tb_secreti` VALUES ('10000000006', '{\"1\":[]}', '{}', '5', '0', '0');
INSERT INTO `tb_secreti` VALUES ('10000000007', '{\"1\":[]}', '{}', '5', '0', '0');
INSERT INTO `tb_secreti` VALUES ('10000000008', '{\"1\":[]}', '{}', '5', '0', '0');

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `goodsType` int(11) NOT NULL DEFAULT '0',
  `refreshTime` int(11) NOT NULL DEFAULT '0',
  `sells` text NOT NULL,
  `ids` text NOT NULL,
  `refreshNum` int(11) NOT NULL DEFAULT '0',
  `totalSells` text NOT NULL,
  `weekSells` text NOT NULL,
  `actId` int(11) NOT NULL DEFAULT '0',
  `activitySells` text NOT NULL,
  `currStock` text NOT NULL,
  PRIMARY KEY (`playerId`,`goodsType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES ('10000000001', '1', '0', '{}', '[1001,1002,1003,1004,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '2', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '3', '0', '{}', '[3101,3001,3002,3003,3004,3005,3006,3007,3008,3009,3010,3011,3012]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '4', '0', '{}', '[4001,4002,4003,4004,4005,4006,4007,4021,4022,4023,4024,4025,4026,4027,4028,4029,4030,4031,4032,4033]', '0', '{}', '{}', '0', '{}', '{\"4021\":500,\"4022\":500,\"4024\":5,\"4025\":250,\"4026\":125,\"4027\":25,\"4028\":5,\"4029\":50,\"4030\":50,\"4031\":25,\"4032\":15,\"4033\":5,\"4023\":1}');
INSERT INTO `tb_shop` VALUES ('10000000001', '5', '0', '{}', '[5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,5019,5020,5021,5022,5023]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '6', '0', '{}', '[6001,6002,6003,6004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '7', '0', '{}', '[7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7019]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '8', '0', '{}', '[8001,8002,8003,8004,8005,8006,8007,8008,8009,8010,8011,8012,8013,8014,8015,8016,8017,8018,8019,8020,8021,8022]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '9', '0', '{}', '[9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9012,9013,9014,9015,9016,9017]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '10', '0', '{}', '[10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10020,10021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '11', '0', '{}', '[11001,11002,11003,11004,11005,11006,11007,11008,11009,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11021,11022,11023,11024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '12', '0', '{}', '[3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '13', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '14', '0', '{}', '[3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '15', '0', '{}', '[15001,15002,15003,15004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '16', '0', '{}', '[16001,16002,16003,16004,16005,16006]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '17', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{\"1701\":2000,\"1702\":10,\"1703\":20,\"1704\":20,\"1705\":10,\"1706\":10}');
INSERT INTO `tb_shop` VALUES ('10000000001', '97', '1601402400', '{}', '[203,207,210,218,220,225]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000001', '100', '1601402400', '{}', '[114,120,128,213,241,244]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '1', '0', '{}', '[1001,1002,1003,1004,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '2', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '3', '0', '{}', '[3003,3004,3005,3006,3007,3008,3009,3010,3011,3012]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '4', '0', '{}', '[4001,4002,4003,4004,4005,4006,4007]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '5', '0', '{}', '[5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,5019,5020,5021,5022,5023]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '6', '0', '{}', '[6001,6002,6003,6004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '7', '0', '{}', '[7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7019]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '8', '0', '{}', '[8001,8002,8003,8004,8005,8006,8007,8008,8009,8010,8011,8012,8013,8014,8015,8016,8017,8018,8019,8020,8021,8022]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '9', '0', '{}', '[9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9012,9013,9014,9015,9016,9017]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '10', '0', '{}', '[10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10020,10021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '11', '0', '{}', '[11001,11002,11003,11004,11005,11006,11007,11008,11009,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11021,11022,11023,11024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '12', '0', '{}', '[3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '13', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '14', '0', '{}', '[3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '15', '0', '{}', '[15001,15002,15003,15004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '16', '0', '{}', '[16001,16004,16005,16006]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '17', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000002', '100', '1601395200', '{}', '[17,59,76,85,87,93]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '1', '0', '{}', '[1001,1002,1003,1004,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '2', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '3', '0', '{}', '[3003,3004,3005,3006,3007,3008,3009,3010,3011,3012]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '4', '0', '{}', '[4001,4002,4003,4004,4005,4006,4007]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '5', '0', '{}', '[5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,5019,5020,5021,5022,5023]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '6', '0', '{}', '[6001,6002,6003,6004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '7', '0', '{}', '[7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7019]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '8', '0', '{}', '[8001,8002,8003,8004,8005,8006,8007,8008,8009,8010,8011,8012,8013,8014,8015,8016,8017,8018,8019,8020,8021,8022]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '9', '0', '{}', '[9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9012,9013,9014,9015,9016,9017]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '10', '0', '{}', '[10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10020,10021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '11', '0', '{}', '[11001,11002,11003,11004,11005,11006,11007,11008,11009,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11021,11022,11023,11024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '12', '0', '{}', '[3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '13', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '14', '0', '{}', '[3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '15', '0', '{}', '[15001,15002,15003,15004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '16', '0', '{}', '[16001,16004,16005,16006]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '17', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '97', '1601395200', '{}', '[101,102,103,106,108,111]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000003', '100', '1601395200', '{}', '[12,14,47,54,72,91]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '1', '0', '{}', '[1001,1002,1003,1004,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '2', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '3', '0', '{}', '[3003,3004,3005,3006,3007,3008,3009,3010,3011,3012]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '4', '0', '{}', '[4001,4002,4003,4004,4005,4006,4007]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '5', '0', '{}', '[5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,5019,5020,5021,5022,5023]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '6', '0', '{}', '[6001,6002,6003,6004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '7', '0', '{}', '[7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7019]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '8', '0', '{}', '[8001,8002,8003,8004,8005,8006,8007,8008,8009,8010,8011,8012,8013,8014,8015,8016,8017,8018,8019,8020,8021,8022]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '9', '0', '{}', '[9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9012,9013,9014,9015,9016,9017]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '10', '0', '{}', '[10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10020,10021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '11', '0', '{}', '[11001,11002,11003,11004,11005,11006,11007,11008,11009,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11021,11022,11023,11024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '12', '0', '{}', '[3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '13', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '14', '0', '{}', '[3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '15', '0', '{}', '[15001,15002,15003,15004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '16', '0', '{}', '[16001,16004,16005,16006]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '17', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000004', '100', '1601395200', '{}', '[13,18,62,99,102,106]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '1', '0', '{}', '[1001,1002,1003,1004,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '2', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '3', '0', '{}', '[3003,3004,3005,3006,3007,3008,3009,3010,3011,3012]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '4', '0', '{}', '[4001,4002,4003,4004,4005,4006,4007]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '5', '0', '{}', '[5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,5019,5020,5021,5022,5023]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '6', '0', '{}', '[6001,6002,6003,6004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '7', '0', '{}', '[7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7019]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '8', '0', '{}', '[8001,8002,8003,8004,8005,8006,8007,8008,8009,8010,8011,8012,8013,8014,8015,8016,8017,8018,8019,8020,8021,8022]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '9', '0', '{}', '[9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9012,9013,9014,9015,9016,9017]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '10', '0', '{}', '[10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10020,10021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '11', '0', '{}', '[11001,11002,11003,11004,11005,11006,11007,11008,11009,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11021,11022,11023,11024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '12', '0', '{}', '[3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '13', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '14', '0', '{}', '[3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '15', '0', '{}', '[15001,15002,15003,15004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '16', '0', '{}', '[16001,16004,16005,16006]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '17', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000005', '100', '1601395200', '{}', '[8,15,84,90,92,104]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '1', '0', '{}', '[1001,1002,1003,1004,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '2', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '3', '0', '{}', '[3003,3004,3005,3006,3007,3008,3009,3010,3011,3012]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '4', '0', '{}', '[4001,4002,4003,4004,4005,4006,4007]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '5', '0', '{}', '[5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,5019,5020,5021,5022,5023]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '6', '0', '{}', '[6001,6002,6003,6004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '7', '0', '{}', '[7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7019]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '8', '0', '{}', '[8001,8002,8003,8004,8005,8006,8007,8008,8009,8010,8011,8012,8013,8014,8015,8016,8017,8018,8019,8020,8021,8022]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '9', '0', '{}', '[9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9012,9013,9014,9015,9016,9017]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '10', '0', '{}', '[10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10020,10021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '11', '0', '{}', '[11001,11002,11003,11004,11005,11006,11007,11008,11009,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11021,11022,11023,11024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '12', '0', '{}', '[3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '13', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '14', '0', '{}', '[3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '15', '0', '{}', '[15001,15002,15003,15004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '16', '0', '{}', '[16001,16004,16005,16006]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '17', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000006', '100', '1601395200', '{}', '[59,75,88,94,99,102]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '1', '0', '{}', '[1001,1002,1003,1004,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '2', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '3', '0', '{}', '[3003,3004,3005,3006,3007,3008,3009,3010,3011,3012]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '4', '0', '{}', '[4001,4002,4003,4004,4005,4006,4007]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '5', '0', '{}', '[5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,5019,5020,5021,5022,5023]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '6', '0', '{}', '[6001,6002,6003,6004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '7', '0', '{}', '[7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7019]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '8', '0', '{}', '[8001,8002,8003,8004,8005,8006,8007,8008,8009,8010,8011,8012,8013,8014,8015,8016,8017,8018,8019,8020,8021,8022]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '9', '0', '{}', '[9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9012,9013,9014,9015,9016,9017]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '10', '0', '{}', '[10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10020,10021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '11', '0', '{}', '[11001,11002,11003,11004,11005,11006,11007,11008,11009,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11021,11022,11023,11024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '12', '0', '{}', '[3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '13', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '14', '0', '{}', '[3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '15', '0', '{}', '[15001,15002,15003,15004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '16', '0', '{}', '[16001,16004,16005,16006]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '17', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000007', '100', '1601395200', '{}', '[50,68,74,76,91,96]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '1', '0', '{}', '[1001,1002,1003,1004,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '2', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '3', '0', '{}', '[3003,3004,3005,3006,3007,3008,3009,3010,3011,3012]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '4', '0', '{}', '[4001,4002,4003,4004,4005,4006,4007]', '0', '{}', '{}', '0', '{}', '{\"4032\":3,\"4033\":1,\"4021\":100,\"4022\":100,\"4023\":1,\"4024\":1,\"4025\":50,\"4026\":25,\"4027\":5,\"4028\":1,\"4029\":10,\"4030\":10,\"4031\":5}');
INSERT INTO `tb_shop` VALUES ('10000000008', '5', '0', '{}', '[5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,5019,5020,5021,5022,5023]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '6', '0', '{}', '[6001,6002,6003,6004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '7', '0', '{}', '[7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7019]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '8', '0', '{}', '[8001,8002,8003,8004,8005,8006,8007,8008,8009,8010,8011,8012,8013,8014,8015,8016,8017,8018,8019,8020,8021,8022]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '9', '0', '{}', '[9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9012,9013,9014,9015,9016,9017]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '10', '0', '{}', '[10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10020,10021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '11', '0', '{}', '[11001,11002,11003,11004,11005,11006,11007,11008,11009,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11021,11022,11023,11024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '12', '0', '{}', '[3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '13', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '14', '0', '{}', '[3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '15', '0', '{}', '[15001,15002,15003,15004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '16', '0', '{}', '[16001,16004,16005,16006]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10000000008', '17', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{\"1701\":2000,\"1702\":10,\"1703\":20,\"1704\":20,\"1705\":10,\"1706\":10}');
INSERT INTO `tb_shop` VALUES ('10000000008', '100', '1601395200', '{}', '[12,47,69,87,98,100]', '0', '{}', '{}', '0', '{}', '{}');

-- ----------------------------
-- Table structure for tb_sign
-- ----------------------------
DROP TABLE IF EXISTS `tb_sign`;
CREATE TABLE `tb_sign` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `signToday` tinyint(1) NOT NULL DEFAULT '0',
  `signCount` int(11) NOT NULL DEFAULT '0',
  `weekCharge` bigint(20) NOT NULL DEFAULT '0',
  `dayCharge` bigint(20) NOT NULL DEFAULT '0',
  `todayReward` text NOT NULL,
  `weekReward` text NOT NULL,
  `signReward` text NOT NULL,
  `levelMap` text NOT NULL,
  `timeMap` text NOT NULL,
  `showLevel` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sign
-- ----------------------------
INSERT INTO `tb_sign` VALUES ('10000000001', '0', '0', '0', '0', '[]', '[]', '{}', '{\"15\":1600106904,\"30\":1600106918,\"75\":1600106919,\"40\":1600106918,\"55\":1600106919,\"50\":1600106919,\"35\":1600106918,\"45\":1600106919,\"65\":1600106919,\"70\":1600106919,\"60\":1600106919,\"20\":1600106904,\"25\":1600106904,\"10\":1600106904,\"5\":1600106797,\"80\":1601483280}', '{}', '90');
INSERT INTO `tb_sign` VALUES ('10000000002', '0', '0', '0', '0', '[]', '[]', '{}', '{}', '{}', '90');
INSERT INTO `tb_sign` VALUES ('10000000003', '1', '1', '0', '0', '[]', '[]', '{\"1\":1601391045}', '{\"10\":1601476285,\"5\":1601474651}', '{}', '90');
INSERT INTO `tb_sign` VALUES ('10000000004', '0', '0', '0', '0', '[]', '[]', '{}', '{}', '{}', '90');
INSERT INTO `tb_sign` VALUES ('10000000005', '0', '0', '0', '0', '[]', '[]', '{}', '{}', '{}', '90');
INSERT INTO `tb_sign` VALUES ('10000000006', '0', '0', '0', '0', '[]', '[]', '{}', '{}', '{}', '90');
INSERT INTO `tb_sign` VALUES ('10000000007', '0', '0', '0', '0', '[]', '[]', '{}', '{\"10\":1601478882,\"5\":1601478786}', '{}', '90');
INSERT INTO `tb_sign` VALUES ('10000000008', '0', '0', '0', '0', '[]', '[]', '{}', '{}', '{}', '90');

-- ----------------------------
-- Table structure for tb_single_ins
-- ----------------------------
DROP TABLE IF EXISTS `tb_single_ins`;
CREATE TABLE `tb_single_ins` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `times` text NOT NULL,
  `maxPoints` text NOT NULL,
  `clears` text NOT NULL,
  `totalTime` int(11) NOT NULL DEFAULT '0',
  `bossMap` text NOT NULL,
  `timesMap` text NOT NULL,
  `buyTimeMap` text NOT NULL,
  `totalChallengeMap` text NOT NULL,
  `vipSweepTimes` text NOT NULL,
  `kfHandbook` text NOT NULL,
  `stageHandbook` text NOT NULL,
  `zfHandbook` text NOT NULL,
  `actPlayTime` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_single_ins
-- ----------------------------
INSERT INTO `tb_single_ins` VALUES ('10000000001', '{}', '{\"1\":1}', '[1101]', '1', '{\"3001\":1600020557}', '{}', '{}', '{\"1\":1}', '{}', '{}', '{}', '{}', '{\"1\":{},\"13\":{},\"2\":{},\"3\":{},\"4\":{},\"5\":{},\"6\":{},\"7\":{},\"8\":{},\"9\":{},\"10\":{},\"11\":{},\"12\":{}}');
INSERT INTO `tb_single_ins` VALUES ('10000000002', '{}', '{}', '[]', '0', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');
INSERT INTO `tb_single_ins` VALUES ('10000000003', '{}', '{}', '[]', '0', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');
INSERT INTO `tb_single_ins` VALUES ('10000000004', '{}', '{}', '[]', '0', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');
INSERT INTO `tb_single_ins` VALUES ('10000000005', '{}', '{}', '[]', '0', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');
INSERT INTO `tb_single_ins` VALUES ('10000000006', '{}', '{}', '[]', '0', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');
INSERT INTO `tb_single_ins` VALUES ('10000000007', '{\"1\":1}', '{\"1\":1}', '[1101]', '1', '{}', '{}', '{}', '{\"1\":1}', '{}', '{}', '{}', '{}', '{\"1\":{\"20200928\":4,\"20200929\":1,\"20200927\":4}}');
INSERT INTO `tb_single_ins` VALUES ('10000000008', '{}', '{}', '[]', '0', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{\"1\":{},\"2\":{},\"3\":{},\"4\":{},\"5\":{},\"6\":{},\"7\":{},\"8\":{},\"9\":{},\"10\":{},\"11\":{\"20200928\":10,\"20200929\":0},\"12\":{},\"13\":{}}');

-- ----------------------------
-- Table structure for tb_skill
-- ----------------------------
DROP TABLE IF EXISTS `tb_skill`;
CREATE TABLE `tb_skill` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `skillId` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`skillId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_skill
-- ----------------------------
INSERT INTO `tb_skill` VALUES ('10000000001', '100201', '1');
INSERT INTO `tb_skill` VALUES ('10000000001', '100202', '1');
INSERT INTO `tb_skill` VALUES ('10000000002', '100201', '1');
INSERT INTO `tb_skill` VALUES ('10000000003', '100101', '1');
INSERT INTO `tb_skill` VALUES ('10000000003', '100102', '1');
INSERT INTO `tb_skill` VALUES ('10000000004', '100101', '1');
INSERT INTO `tb_skill` VALUES ('10000000005', '100201', '1');
INSERT INTO `tb_skill` VALUES ('10000000006', '100201', '1');
INSERT INTO `tb_skill` VALUES ('10000000007', '100101', '1');
INSERT INTO `tb_skill` VALUES ('10000000007', '100102', '1');
INSERT INTO `tb_skill` VALUES ('10000000008', '100101', '1');

-- ----------------------------
-- Table structure for tb_souls
-- ----------------------------
DROP TABLE IF EXISTS `tb_souls`;
CREATE TABLE `tb_souls` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `fightValue` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_souls
-- ----------------------------

-- ----------------------------
-- Table structure for tb_sprouting
-- ----------------------------
DROP TABLE IF EXISTS `tb_sprouting`;
CREATE TABLE `tb_sprouting` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `actId` int(11) NOT NULL DEFAULT '0',
  `get` tinyint(1) NOT NULL DEFAULT '0',
  `canGet` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`actId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_sprouting
-- ----------------------------

-- ----------------------------
-- Table structure for tb_stage
-- ----------------------------
DROP TABLE IF EXISTS `tb_stage`;
CREATE TABLE `tb_stage` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `battle` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `fightValue` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_stage
-- ----------------------------

-- ----------------------------
-- Table structure for tb_talisman
-- ----------------------------
DROP TABLE IF EXISTS `tb_talisman`;
CREATE TABLE `tb_talisman` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `freeTimes` int(11) NOT NULL DEFAULT '0',
  `refreshTimes` int(11) NOT NULL DEFAULT '0',
  `freeRefresh` int(11) NOT NULL DEFAULT '0',
  `totalTimes` int(11) NOT NULL DEFAULT '0',
  `hitTimes` int(11) NOT NULL DEFAULT '0',
  `items` text NOT NULL,
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_talisman
-- ----------------------------

-- ----------------------------
-- Table structure for tb_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_task`;
CREATE TABLE `tb_task` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `chapterReward` text NOT NULL,
  `insMap` text NOT NULL,
  `chapter` int(11) NOT NULL DEFAULT '0',
  `point` int(11) NOT NULL DEFAULT '0',
  `dailyProcess` text NOT NULL,
  `dailyDone` text NOT NULL,
  `dailyReward` text NOT NULL,
  `pointReward` text NOT NULL,
  `guideId` int(11) NOT NULL DEFAULT '0',
  `schedule` bigint(20) NOT NULL DEFAULT '0',
  `fixedStatus` int(11) NOT NULL DEFAULT '0',
  `firstFail` int(11) NOT NULL DEFAULT '0',
  `askReward` text NOT NULL,
  `follow` int(11) NOT NULL DEFAULT '0',
  `realName` tinyint(1) NOT NULL DEFAULT '0',
  `channelGift` text NOT NULL,
  `channelTime` text NOT NULL,
  `platformReward` text NOT NULL,
  `previewValue` text NOT NULL,
  `previewReward` text NOT NULL,
  `findRewardMax` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_task
-- ----------------------------
INSERT INTO `tb_task` VALUES ('10000000001', '240', '{\"1\":1600020451,\"2\":1600020415,\"3\":1600020635}', '{\"1\":30102,\"2\":30202,\"3\":30302}', '30302', '0', '{\"32\":0,\"34\":1,\"39\":0,\"24\":1,\"26\":1}', '[34,24,26]', '[]', '[]', '0', '0', '36', '0', '{\"1\":1600020638}', '0', '0', '{}', '{}', '{\"6\":0,\"7\":0,\"8\":0}', '{\"28\":0}', '[]', '{\"1\":8,\"2\":8,\"3\":8,\"4\":8,\"5\":8,\"6\":8,\"7\":40,\"8\":2,\"9\":2,\"10\":24,\"11\":20,\"13\":2}');
INSERT INTO `tb_task` VALUES ('10000000002', '1', '{}', '{}', '0', '0', '{\"34\":1,\"24\":1}', '[34,24]', '[]', '[]', '4', '0', '36', '0', '{}', '0', '0', '{}', '{}', '{}', '{}', '[]', '{}');
INSERT INTO `tb_task` VALUES ('10000000003', '180', '{\"1\":1601388115,\"2\":1601388250}', '{\"1\":30102,\"2\":30202}', '30202', '0', '{\"33\":1,\"34\":1,\"24\":1,\"25\":1}', '[33,34,24,25]', '[]', '[]', '6', '1', '36', '0', '{}', '0', '0', '{}', '{}', '{}', '{}', '[]', '{}');
INSERT INTO `tb_task` VALUES ('10000000004', '1', '{}', '{}', '0', '0', '{\"34\":1,\"24\":1}', '[34,24]', '[]', '[]', '4', '0', '36', '0', '{}', '0', '0', '{}', '{}', '{}', '{}', '[]', '{}');
INSERT INTO `tb_task` VALUES ('10000000005', '1', '{}', '{}', '0', '0', '{\"24\":1}', '[24]', '[]', '[]', '0', '0', '36', '0', '{}', '0', '0', '{}', '{}', '{}', '{}', '[]', '{}');
INSERT INTO `tb_task` VALUES ('10000000006', '1', '{}', '{}', '0', '0', '{\"24\":1}', '[24]', '[]', '[]', '0', '0', '36', '0', '{}', '0', '0', '{}', '{}', '{}', '{}', '[]', '{}');
INSERT INTO `tb_task` VALUES ('10000000007', '260', '{\"1\":1601392395,\"2\":1601392437,\"3\":1601392513}', '{\"1\":30102,\"2\":30202,\"3\":30302}', '30302', '0', '{\"33\":1,\"34\":1,\"24\":1,\"25\":1,\"26\":1,\"27\":1}', '[33,34,24,25,26]', '[]', '[]', '0', '0', '36', '0', '{\"1\":1601392515}', '0', '0', '{}', '{}', '{}', '{}', '[]', '{}');
INSERT INTO `tb_task` VALUES ('10000000008', '10', '{}', '{}', '30101', '0', '{}', '[]', '[]', '[]', '0', '0', '36', '0', '{}', '0', '0', '{}', '{}', '{\"6\":0,\"7\":0,\"8\":0}', '{}', '[]', '{}');

-- ----------------------------
-- Table structure for tb_teammatch
-- ----------------------------
DROP TABLE IF EXISTS `tb_teammatch`;
CREATE TABLE `tb_teammatch` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `fightTimes` int(11) NOT NULL DEFAULT '0',
  `buyTimes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_teammatch
-- ----------------------------

-- ----------------------------
-- Table structure for tb_tower
-- ----------------------------
DROP TABLE IF EXISTS `tb_tower`;
CREATE TABLE `tb_tower` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `curLayers` int(11) NOT NULL DEFAULT '0',
  `preLayers` int(11) NOT NULL DEFAULT '0',
  `todayNormalReward` int(11) NOT NULL DEFAULT '0',
  `todayCCYReward` int(11) NOT NULL DEFAULT '0',
  `passTime` int(11) NOT NULL DEFAULT '0',
  `actPlayTime` text NOT NULL,
  `mobai` int(11) NOT NULL DEFAULT '0',
  `needSend` tinyint(4) NOT NULL DEFAULT '0',
  `records` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_tower
-- ----------------------------
INSERT INTO `tb_tower` VALUES ('10000000001', '0', '0', '0', '0', '0', '{}', '1', '0', '[]');
INSERT INTO `tb_tower` VALUES ('10000000002', '0', '0', '0', '0', '0', '{}', '1', '0', '[]');
INSERT INTO `tb_tower` VALUES ('10000000003', '0', '0', '0', '0', '0', '{}', '1', '0', '[]');
INSERT INTO `tb_tower` VALUES ('10000000004', '0', '0', '0', '0', '0', '{}', '1', '0', '[]');
INSERT INTO `tb_tower` VALUES ('10000000005', '0', '0', '0', '0', '0', '{}', '1', '0', '[]');
INSERT INTO `tb_tower` VALUES ('10000000006', '0', '0', '0', '0', '0', '{}', '1', '0', '[]');
INSERT INTO `tb_tower` VALUES ('10000000007', '0', '0', '0', '0', '0', '{}', '1', '0', '[]');
INSERT INTO `tb_tower` VALUES ('10000000008', '0', '0', '0', '0', '0', '{}', '1', '0', '[]');

-- ----------------------------
-- Table structure for tb_trial
-- ----------------------------
DROP TABLE IF EXISTS `tb_trial`;
CREATE TABLE `tb_trial` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `trialId` int(11) NOT NULL DEFAULT '0',
  `trialPoint` int(11) NOT NULL DEFAULT '0',
  `trialProcess` bigint(20) NOT NULL DEFAULT '0',
  `trialBox` text NOT NULL,
  `dailyTrail` text NOT NULL,
  `trialTimes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_trial
-- ----------------------------

-- ----------------------------
-- Table structure for tb_turnplate
-- ----------------------------
DROP TABLE IF EXISTS `tb_turnplate`;
CREATE TABLE `tb_turnplate` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `actId` int(11) NOT NULL DEFAULT '0',
  `itemDrawCount` text NOT NULL,
  `drawCount` int(11) NOT NULL DEFAULT '0',
  `point` int(11) NOT NULL DEFAULT '0',
  `tenDrawCount` int(11) NOT NULL DEFAULT '0',
  `rareCount` int(11) NOT NULL DEFAULT '0',
  `rareRecord` text NOT NULL,
  PRIMARY KEY (`playerId`,`actId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_turnplate
-- ----------------------------
INSERT INTO `tb_turnplate` VALUES ('10000000001', '1', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '2', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '3', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '4', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '5', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '6', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '7', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '8', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '9', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '10', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '11', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '12', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '13', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '14', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '15', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '16', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '17', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '18', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '19', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '20', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '21', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '22', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '23', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '24', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '25', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '26', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000001', '27', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '1', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '2', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '3', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '4', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '5', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '6', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '7', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '8', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '9', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '10', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '11', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '12', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '13', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '14', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '15', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '16', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '17', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '18', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '19', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '20', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '21', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '22', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '23', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '24', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '25', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '26', '{}', '0', '0', '0', '0', '{}');
INSERT INTO `tb_turnplate` VALUES ('10000000008', '27', '{}', '0', '0', '0', '0', '{}');

-- ----------------------------
-- Table structure for tb_unparalleled
-- ----------------------------
DROP TABLE IF EXISTS `tb_unparalleled`;
CREATE TABLE `tb_unparalleled` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `partneredHpMap` text NOT NULL,
  `resetTimes` int(11) NOT NULL DEFAULT '0',
  `buffs` text NOT NULL,
  `layerAddition` text NOT NULL,
  `curPoint` int(11) NOT NULL DEFAULT '0',
  `currMaxStar` int(11) NOT NULL DEFAULT '0',
  `surpStar` int(11) NOT NULL DEFAULT '0',
  `playedPoints` text NOT NULL,
  `layerBox` text NOT NULL,
  `lastMaxStar` int(11) NOT NULL DEFAULT '0',
  `battlePartner` text NOT NULL,
  `sweep` tinyint(1) NOT NULL DEFAULT '0',
  `insMap` text NOT NULL,
  `lastPassTime` bigint(20) NOT NULL DEFAULT '0',
  `lastMaxRank` int(11) NOT NULL DEFAULT '0',
  `maxPoint` int(11) NOT NULL DEFAULT '0',
  `challengeNum` int(11) NOT NULL DEFAULT '0',
  `totalResetTimes` int(11) NOT NULL DEFAULT '0',
  `attrsList` text NOT NULL,
  `levelMap` text NOT NULL,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_unparalleled
-- ----------------------------
INSERT INTO `tb_unparalleled` VALUES ('10000000001', '{}', '0', '[]', '[]', '0', '0', '0', '{}', '[]', '0', '[-1,0,0,0,0,0]', '1', '{}', '0', '0', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_unparalleled` VALUES ('10000000002', '{}', '0', '[]', '[]', '0', '0', '0', '{}', '[]', '0', '[-1,0,0,0,0,0]', '1', '{}', '0', '0', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_unparalleled` VALUES ('10000000003', '{}', '0', '[]', '[]', '0', '0', '0', '{}', '[]', '0', '[-1,0,0,0,0,0]', '1', '{}', '0', '0', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_unparalleled` VALUES ('10000000004', '{}', '0', '[]', '[]', '0', '0', '0', '{}', '[]', '0', '[-1,0,0,0,0,0]', '1', '{}', '0', '0', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_unparalleled` VALUES ('10000000005', '{}', '0', '[]', '[]', '0', '0', '0', '{}', '[]', '0', '[-1,0,0,0,0,0]', '1', '{}', '0', '0', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_unparalleled` VALUES ('10000000006', '{}', '0', '[]', '[]', '0', '0', '0', '{}', '[]', '0', '[-1,0,0,0,0,0]', '1', '{}', '0', '0', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_unparalleled` VALUES ('10000000007', '{}', '0', '[]', '[]', '0', '0', '0', '{}', '[]', '0', '[-1,0,0,0,0,0]', '1', '{}', '0', '0', '0', '0', '0', '{}', '{}');
INSERT INTO `tb_unparalleled` VALUES ('10000000008', '{}', '0', '[]', '[]', '0', '0', '0', '{}', '[]', '0', '[-1,0,0,0,0,0]', '1', '{}', '0', '0', '0', '0', '0', '{}', '{}');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `userId` bigint(20) NOT NULL DEFAULT '0',
  `userName` varchar(255) NOT NULL DEFAULT '',
  `channel` int(11) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL DEFAULT '',
  `players` text NOT NULL,
  `lastLoginTime` int(11) NOT NULL DEFAULT '0',
  `accountId` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `orderByPlayerId` bigint(20) NOT NULL DEFAULT '0',
  `uid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('15', '', '1', '9e43572aeea998ccf42515c55781fc50', '[{\"playerId\":10000000001,\"sex\":2,\"name\":\"菜鸟阁\"}]', '0', '0', '', '0', '');
INSERT INTO `tb_user` VALUES ('17', '', '1', 'a96c7a0cf74fbf6893388515aaffce13', '[{\"playerId\":10000000002,\"sex\":2,\"name\":\"徐霜晶\"}]', '0', '0', '', '0', '');
INSERT INTO `tb_user` VALUES ('18', '', '1', '4e84bcb9b6e346af3d378aa43056d1c4', '[{\"playerId\":10000000003,\"sex\":1,\"name\":\"波风吏宗\"}]', '0', '0', '', '0', '');
INSERT INTO `tb_user` VALUES ('19', '', '1', 'ea7b405636300e8dbde3ebbd5932de1f', '[{\"playerId\":10000000004,\"sex\":1,\"name\":\"姜仲南\"}]', '0', '0', '', '0', '');
INSERT INTO `tb_user` VALUES ('20', '', '1', 'fd4339df351b081c698ed5bce3d6e6fa', '[{\"playerId\":10000000005,\"sex\":2,\"name\":\"秋道真名\"}]', '0', '0', '', '0', '');
INSERT INTO `tb_user` VALUES ('21', '', '1', 'da8c7422155bc671a08232a5812b6346', '[{\"playerId\":10000000006,\"sex\":2,\"name\":\"亲测源码网\"}]', '0', '0', '', '0', '');
INSERT INTO `tb_user` VALUES ('22', '', '1', 'd267ddb747f92386dac1f1fe081fc2f2', '[{\"playerId\":10000000007,\"sex\":1,\"name\":\"QCYMWCOM\"}]', '0', '0', '', '0', '');
INSERT INTO `tb_user` VALUES ('23', '', '1', '6849e7778a0eaf439d72265553fc0213', '[{\"playerId\":10000000008,\"sex\":1,\"name\":\"马玄元\"}]', '0', '0', '', '0', '');

-- ----------------------------
-- Table structure for tb_wander
-- ----------------------------
DROP TABLE IF EXISTS `tb_wander`;
CREATE TABLE `tb_wander` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `alreadyGet` text NOT NULL,
  `commodity` text NOT NULL,
  `lastAppearTime` int(11) NOT NULL DEFAULT '0',
  `lastVip` tinyint(4) NOT NULL DEFAULT '0',
  `lastLevel` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wander
-- ----------------------------

-- ----------------------------
-- Table structure for tb_warlineup
-- ----------------------------
DROP TABLE IF EXISTS `tb_warlineup`;
CREATE TABLE `tb_warlineup` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `warLineupId` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `battle` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `fightValue` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`warLineupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_warlineup
-- ----------------------------

-- ----------------------------
-- Table structure for tb_warpet
-- ----------------------------
DROP TABLE IF EXISTS `tb_warpet`;
CREATE TABLE `tb_warpet` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `warPetId` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `battle` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `fightValue` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`warPetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_warpet
-- ----------------------------

-- ----------------------------
-- Table structure for tb_welfare
-- ----------------------------
DROP TABLE IF EXISTS `tb_welfare`;
CREATE TABLE `tb_welfare` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `vipDailySet` text NOT NULL,
  `vipWeekTime` int(11) NOT NULL DEFAULT '0',
  `vipWeekLevel` int(11) NOT NULL DEFAULT '0',
  `vipWeekGoods` text NOT NULL,
  `monthEndTime` text NOT NULL,
  `monthGetTime` text NOT NULL,
  `buyFund` tinyint(1) NOT NULL DEFAULT '0',
  `fundReward` text NOT NULL,
  `dailyBuyReward` text NOT NULL,
  `oneBuyCharge` bigint(20) NOT NULL DEFAULT '0',
  `oneBuyReward` text NOT NULL,
  `gerenalGift` text NOT NULL,
  `oneState` int(11) NOT NULL DEFAULT '0',
  `times` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `dailyHaoLi` text NOT NULL,
  `vipGiftGoods` text NOT NULL,
  `backGiftId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_welfare
-- ----------------------------
INSERT INTO `tb_welfare` VALUES ('10000000001', '[]', '1601396877', '79', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '{}', '{}', '0', '{}', '{}', '64800', '{}', '[]', '0', '0', '0', '{\"101\":0,\"102\":0,\"103\":0,\"104\":0,\"105\":0,\"106\":0,\"107\":0,\"108\":0,\"109\":0,\"110\":0,\"111\":0,\"112\":0,\"113\":0,\"114\":0,\"115\":0,\"116\":0,\"117\":0,\"118\":0,\"119\":0,\"120\":0,\"121\":0,\"122\":0,\"123\":0,\"124\":0,\"125\":0,\"126\":0,\"127\":0,\"128\":0,\"129\":0,\"130\":0}', '{}', '2');
INSERT INTO `tb_welfare` VALUES ('10000000002', '[]', '1601387890', '79', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '{}', '{}', '0', '{}', '{}', '0', '{}', '[]', '0', '0', '0', '{}', '{}', '0');
INSERT INTO `tb_welfare` VALUES ('10000000003', '[]', '1601388209', '79', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '{}', '{}', '0', '{}', '{}', '0', '{}', '[]', '0', '0', '0', '{}', '{}', '0');
INSERT INTO `tb_welfare` VALUES ('10000000004', '[]', '1601390291', '79', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '{}', '{}', '0', '{}', '{}', '0', '{}', '[]', '0', '0', '0', '{}', '{}', '0');
INSERT INTO `tb_welfare` VALUES ('10000000005', '[]', '1601391170', '79', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '{}', '{}', '0', '{}', '{}', '0', '{}', '[]', '0', '0', '0', '{}', '{}', '0');
INSERT INTO `tb_welfare` VALUES ('10000000006', '[]', '1601391221', '79', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '{}', '{}', '0', '{}', '{}', '0', '{}', '[]', '0', '0', '0', '{}', '{}', '0');
INSERT INTO `tb_welfare` VALUES ('10000000007', '[]', '1601391341', '79', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '{}', '{}', '0', '{}', '{}', '0', '{}', '[]', '0', '0', '0', '{}', '{}', '0');
INSERT INTO `tb_welfare` VALUES ('10000000008', '[]', '1601395105', '79', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '{}', '{}', '0', '{}', '{}', '0', '{}', '[]', '0', '0', '0', '{\"128\":0,\"129\":0,\"130\":0,\"101\":0,\"102\":0,\"103\":0,\"104\":0,\"105\":0,\"106\":0,\"107\":0,\"108\":0,\"109\":0,\"110\":0,\"111\":0,\"112\":0,\"113\":0,\"114\":0,\"115\":0,\"116\":0,\"117\":0,\"118\":0,\"119\":0,\"120\":0,\"121\":0,\"122\":0,\"123\":0,\"124\":0,\"125\":0,\"126\":0,\"127\":0}', '{}', '0');

-- ----------------------------
-- Table structure for tb_wing
-- ----------------------------
DROP TABLE IF EXISTS `tb_wing`;
CREATE TABLE `tb_wing` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `wingId` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0',
  `battle` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `fightValue` bigint(20) NOT NULL DEFAULT '0',
  `wingRuneMap` text NOT NULL,
  PRIMARY KEY (`playerId`,`wingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wing
-- ----------------------------

-- ----------------------------
-- Table structure for tb_wing_bag
-- ----------------------------
DROP TABLE IF EXISTS `tb_wing_bag`;
CREATE TABLE `tb_wing_bag` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `mid` bigint(20) NOT NULL DEFAULT '0',
  `itemId` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `hole` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wing_bag
-- ----------------------------

-- ----------------------------
-- Table structure for tb_worldboss
-- ----------------------------
DROP TABLE IF EXISTS `tb_worldboss`;
CREATE TABLE `tb_worldboss` (
  `timeKey` int(11) NOT NULL DEFAULT '0',
  `insId` int(11) NOT NULL DEFAULT '0',
  `curHp` text,
  `maxHp` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `killNum` int(11) NOT NULL DEFAULT '0',
  `nextTime` int(11) NOT NULL DEFAULT '0',
  `openTime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`timeKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_worldboss
-- ----------------------------

-- ----------------------------
-- Table structure for tb_worldbossrank
-- ----------------------------
DROP TABLE IF EXISTS `tb_worldbossrank`;
CREATE TABLE `tb_worldbossrank` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `playerName` varchar(20) DEFAULT NULL,
  `damage` bigint(20) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_worldbossrank
-- ----------------------------

-- ----------------------------
-- Table structure for tb_yearbeast
-- ----------------------------
DROP TABLE IF EXISTS `tb_yearbeast`;
CREATE TABLE `tb_yearbeast` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `currBossId` int(11) NOT NULL DEFAULT '0',
  `buyTimes` int(11) NOT NULL DEFAULT '0',
  `yearBeastTimes` int(11) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  `deathList` text NOT NULL,
  `currHp` text NOT NULL,
  `maxHp` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_yearbeast
-- ----------------------------
INSERT INTO `tb_yearbeast` VALUES ('10000000001', '1', '0', '0', '0', '0', '[]', '{}', '23722800');
INSERT INTO `tb_yearbeast` VALUES ('10000000001', '2', '0', '0', '0', '0', '[]', '{}', '0');
INSERT INTO `tb_yearbeast` VALUES ('10000000001', '999', '0', '0', '0', '0', '[]', '{}', '0');
INSERT INTO `tb_yearbeast` VALUES ('10000000008', '1', '0', '0', '0', '0', '[]', '{}', '23722800');
INSERT INTO `tb_yearbeast` VALUES ('10000000008', '2', '0', '0', '0', '0', '[]', '{}', '0');
INSERT INTO `tb_yearbeast` VALUES ('10000000008', '999', '0', '0', '0', '0', '[]', '{}', '0');

-- ----------------------------
-- Table structure for tb_zodiac
-- ----------------------------
DROP TABLE IF EXISTS `tb_zodiac`;
CREATE TABLE `tb_zodiac` (
  `playerId` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `zodiacGoods` text NOT NULL,
  `zodiacShop` text NOT NULL,
  `zodiaTasks` text NOT NULL,
  `zodiaState` text NOT NULL,
  `FirstLever` int(11) NOT NULL DEFAULT '0',
  `open` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`playerId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_zodiac
-- ----------------------------
INSERT INTO `tb_zodiac` VALUES ('10000000001', '2', '{}', '{}', '{}', '{}', '79', '0');
INSERT INTO `tb_zodiac` VALUES ('10000000001', '3', '{}', '{}', '{}', '{}', '79', '0');
INSERT INTO `tb_zodiac` VALUES ('10000000008', '2', '{}', '{}', '{}', '{}', '4', '0');
INSERT INTO `tb_zodiac` VALUES ('10000000008', '3', '{}', '{}', '{}', '{}', '4', '0');
