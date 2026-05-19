/*
Navicat MySQL Data Transfer

Source Server         : zgymw.com
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : sanguo_game2

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-09-30 09:05:23
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
INSERT INTO `tb_achieve` VALUES ('10001000001', '[1093]', '[]', '[]', '0', '{\"1093\":2,\"1094\":2,\"1095\":2,\"1096\":2,\"1097\":2,\"1098\":2,\"1067\":3001,\"1099\":2,\"1068\":3001,\"1100\":2,\"1069\":3001,\"1101\":2,\"1070\":3001,\"1102\":2,\"1071\":3001,\"1103\":2,\"1072\":3001,\"1104\":2,\"1073\":3001,\"1105\":2,\"1106\":2}');

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
INSERT INTO `tb_arena` VALUES ('10001000001', '3001', '0', '[]', '0', '0', '0', '0', '0');

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
INSERT INTO `tb_bag` VALUES ('10001000001', '30000019', '1');

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
INSERT INTO `tb_bagua` VALUES ('10001000001', '{}', '0', '{}', '0', '0');

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
INSERT INTO `tb_bosshome` VALUES ('10001000001', '{}', '{}', '{}', '{}', '[]', '[]', '0', '0', '0', '0', '0');

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
INSERT INTO `tb_cardbook` VALUES ('10001000001', '{}', '{}', '0', '0', '0', '0', '{}', '{}', '0', '0', '0', '{}', '{}', '{}', '0');

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
INSERT INTO `tb_constant` VALUES ('dailyWorldLevel', '0');
INSERT INTO `tb_constant` VALUES ('divine', '{}');
INSERT INTO `tb_constant` VALUES ('groupcharge', '2');
INSERT INTO `tb_constant` VALUES ('growfund', '0');
INSERT INTO `tb_constant` VALUES ('openTime', '2017-09-02 00:00:00');
INSERT INTO `tb_constant` VALUES ('turnplate', '{\"key\":30000,\"value\":1601395200}');
INSERT INTO `tb_constant` VALUES ('turntable', '{}');
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
INSERT INTO `tb_crossrace` VALUES ('10001000001', '0', '0', '0', '0', '0', '{}', '0', '0');

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
INSERT INTO `tb_destiny` VALUES ('10001000001', '[]', '[]', '{}', '6', '0', '0', '[]', '0', '1600020809');

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
INSERT INTO `tb_extend` VALUES ('10001000001', '0', '{\"11\":0}', '100', '1', '{}', '20200914', '0', '0', '{}', '{}', '0', '[38,72,9801,1001,9802,31]', '0', '[]', '[]', '0', '0', '0', '0', '0', '[]', '[]', '{}', '0', '15', '0', '{}', '0', '0', '0', '[]', '', '0', '{}', '0', '[]', '1600012800');

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
INSERT INTO `tb_friend` VALUES ('10001000001', '[]', '{}', '{}', '[]', '[]', '[]', '0', '{}', '[]');

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
INSERT INTO `tb_general` VALUES ('10001000001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0', '0', '[]', '0', '0', '{}', '{}');

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
INSERT INTO `tb_groupmember` VALUES ('10001000001', '0', '0', '[]', '0', '[]', '0', '{}', '0', '{}', '0', '0', '0');

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
INSERT INTO `tb_increment` VALUES ('playerId_10001', '10001000001');

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
INSERT INTO `tb_invitation` VALUES ('10001000001', '0', '[]', '{}', '{}', '[]', '0', '0', '0', '{}', '{}');

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
INSERT INTO `tb_limit` VALUES ('10001000001', '1', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '5', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '6', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '9', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '13', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '17', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '21', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '25', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '29', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '33', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '37', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '41', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '45', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '49', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '53', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '10001', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '10005', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '10009', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '10013', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '10017', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '10021', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');
INSERT INTO `tb_limit` VALUES ('10001000001', '10025', '{}', '{}', '{}', '{}', '0', '0', '0', '0', '0');

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
INSERT INTO `tb_limitexchange` VALUES ('10001000001', '1', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10001000001', '2', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10001000001', '3', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10001000001', '4', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10001000001', '5', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10001000001', '6', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10001000001', '1001', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10001000001', '1002', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10001000001', '1003', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10001000001', '1004', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10001000001', '1005', '{}', '0');
INSERT INTO `tb_limitexchange` VALUES ('10001000001', '1006', '{}', '0');

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
INSERT INTO `tb_mail` VALUES ('10001000001', '1', '1', '0', '系统邮件', '1601388000', '竞技场每日结算奖励', '您在今日的竞技场中排名第3001名，可获得竞技奖励如下，请查收', '[{\"type\":1,\"id\":2,\"num\":80},{\"type\":1,\"id\":5,\"num\":250}]', '0', '0');

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
INSERT INTO `tb_offices` VALUES ('10001000001', '{}', '0', '0', '0', '0', '{}', '0', '0', '{}', '0');

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
INSERT INTO `tb_player` VALUES ('10001000001', '15', '中国源码网', '1', '1', '30101', 'sex:1:', '[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]', '[-1,0,0,0,0,0]', '1600020808', '1', '0', '{}', '0', '[]', '0', '0', '0', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0,\"5\":0,\"6\":0}', '2', '1600020812', '101', '221', '40', '[]', '[0,0,0,0,0,0,0,0,0,0]', '[]', '221', '{}', '0', '0', '3', '[]', '1', '0', '0', '[]', '0', '{}', '[]');

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
INSERT INTO `tb_player_mental` VALUES ('10001000001', '0', '0', '0', '[]', '0', '[]');

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
INSERT INTO `tb_rankact` VALUES ('10001000001', '8', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10001000001', '9', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10001000001', '10', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10001000001', '11', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10001000001', '12', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10001000001', '13', '0', '{}', '0');
INSERT INTO `tb_rankact` VALUES ('10001000001', '14', '0', '{}', '0');

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
INSERT INTO `tb_rebate` VALUES ('10001000001', '18', '0', '0', '0', '{}', '0');

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
INSERT INTO `tb_recruit` VALUES ('10001000001', '1600020809', '3', '0', '0', '0', '0', '0', '[]', '0', '[2]', '[2]', '0', '0', '[{\"key\":212401,\"value\":3,\"valueStr\":\"2\"},{\"key\":214505,\"value\":5,\"valueStr\":\"2\"},{\"key\":214506,\"value\":3,\"valueStr\":\"2\"},{\"key\":211403,\"value\":3,\"valueStr\":\"2\"},{\"key\":211506,\"value\":3,\"valueStr\":\"2\"},{\"key\":213403,\"value\":5,\"valueStr\":\"2\"},{\"key\":211405,\"value\":3,\"valueStr\":\"2\"},{\"key\":212401,\"value\":10,\"valueStr\":\"2\"},{\"key\":213402,\"value\":3,\"valueStr\":\"2\"},{\"key\":4504,\"value\":1,\"valueStr\":\"4\"}]', '0', '{}', '0', '0', '[]', '0', '[]', '[]', '0', '0');

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
INSERT INTO `tb_rune` VALUES ('10001000001', '0', '0', '{}', '0', '0', '0', '0', '0', '3', '[]', '0', '{}', '{}');

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
INSERT INTO `tb_sanguozhi` VALUES ('10001000001', '1', '[]', '[]', '0', '{\"113\":0,\"108\":1}');

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
INSERT INTO `tb_secreti` VALUES ('10001000001', '{\"1\":[]}', '{}', '5', '0', '0');

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
INSERT INTO `tb_shop` VALUES ('10001000001', '1', '0', '{}', '[1001,1002,1003,1004,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '2', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '3', '0', '{}', '[3003,3004,3005,3006,3007,3008,3009,3010,3011,3012]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '4', '0', '{}', '[4001,4002,4003,4004,4005,4006,4007]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '5', '0', '{}', '[5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,5019,5020,5021,5022,5023]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '6', '0', '{}', '[6001,6002,6003,6004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '7', '0', '{}', '[7001,7002,7003,7004,7005,7006,7007,7008,7009,7010,7011,7012,7013,7014,7015,7016,7017,7018,7019]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '8', '0', '{}', '[8001,8002,8003,8004,8005,8006,8007,8008,8009,8010,8011,8012,8013,8014,8015,8016,8017,8018,8019,8020,8021,8022]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '9', '0', '{}', '[9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011,9012,9013,9014,9015,9016,9017]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '10', '0', '{}', '[10001,10002,10003,10004,10005,10006,10007,10008,10009,10010,10011,10012,10013,10014,10015,10016,10017,10018,10019,10020,10021]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '11', '0', '{}', '[11001,11002,11003,11004,11005,11006,11007,11008,11009,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11020,11021,11022,11023,11024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '12', '0', '{}', '[3501,3502,3503,3504,3505,3506,3507,3508,3509,3510,3511,3512,3513,3514,3515,3516,3517,3518,3519,3520,3521]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '13', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '14', '0', '{}', '[3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '15', '0', '{}', '[15001,15002,15003,15004]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '16', '0', '{}', '[16001,16004,16005,16006]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '17', '0', '{}', '[]', '0', '{}', '{}', '0', '{}', '{}');
INSERT INTO `tb_shop` VALUES ('10001000001', '100', '1600027200', '{}', '[5,8,9,48,55,78]', '0', '{}', '{}', '0', '{}', '{}');

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
INSERT INTO `tb_sign` VALUES ('10001000001', '0', '0', '0', '0', '[]', '[]', '{}', '{}', '{}', '90');

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
INSERT INTO `tb_single_ins` VALUES ('10001000001', '{}', '{}', '[]', '0', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');

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
INSERT INTO `tb_skill` VALUES ('10001000001', '100101', '1');

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
INSERT INTO `tb_task` VALUES ('10001000001', '1', '{}', '{}', '0', '0', '{\"24\":1}', '[24]', '[]', '[]', '0', '0', '36', '0', '{}', '0', '0', '{}', '{}', '{}', '{}', '[]', '{}');

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
INSERT INTO `tb_tower` VALUES ('10001000001', '0', '0', '0', '0', '0', '{}', '1', '0', '[]');

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
INSERT INTO `tb_unparalleled` VALUES ('10001000001', '{}', '0', '[]', '[]', '0', '0', '0', '{}', '[]', '0', '[-1,0,0,0,0,0]', '1', '{}', '0', '0', '0', '0', '0', '{}', '{}');

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
INSERT INTO `tb_user` VALUES ('15', '', '1', 'bc1bfb5791b2c837b13b67057c6c4896', '[{\"playerId\":10001000001,\"sex\":1,\"name\":\"中国源码网\"}]', '0', '0', '', '0', '');

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
INSERT INTO `tb_welfare` VALUES ('10001000001', '[]', '1600020810', '79', '{\"1\":0,\"2\":0,\"3\":0,\"4\":0}', '{}', '{}', '0', '{}', '{}', '0', '{}', '[]', '0', '0', '0', '{}', '{}', '0');

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
