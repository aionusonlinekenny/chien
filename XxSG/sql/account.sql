/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : account

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-09-30 09:04:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `ming` varchar(255) NOT NULL,
  `lastloginip` varchar(255) DEFAULT NULL,
  `lastlogintime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `reg_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `lastserver` int(11) NOT NULL DEFAULT '10000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('qq12300', '98c9df11d119e4d11d32af405f42c78e', 'qq12300', 'localhost', '2020-09-14 02:05:10', '2020-09-14 02:05:10', '15', 'e21495b08f5e49e872622d102427b634', '10000');
INSERT INTO `account` VALUES ('qq123001', '4174baea0337de1539c7f6f63eb50744', 'qq12345', 'localhost', '2020-09-29 09:47:10', '2020-09-29 09:47:10', '16', '6f3c8425a0167ac855ef20b719f100d4', '10000');
INSERT INTO `account` VALUES ('qq123456', 'd0dcbf0d12a6b1e7fbfa2ce5848f3eff', 'qq123456', 'localhost', '2020-09-29 09:50:06', '2020-09-29 09:50:06', '17', '96f45e0c5ce016fcd7b477b66016d4fe', '10000');
INSERT INTO `account` VALUES ('qq1234567', 'd7340d7e38fbcbafc6d76ef5836670a2', 'qq1234567', 'localhost', '2020-09-29 10:03:08', '2020-09-29 10:03:08', '18', 'aefdf170b945cfb351cbe58181182285', '10000');
INSERT INTO `account` VALUES ('qq12345678', '20aadbc0d1c333f7f304103eb6b71352', 'qq12345678', 'localhost', '2020-09-29 10:38:00', '2020-09-29 10:38:00', '19', 'f8e295b7448d48c1d29d265fc7e3430c', '10000');
INSERT INTO `account` VALUES ('qq1230099', '98c9df11d119e4d11d32af405f42c78e', 'qq12300', 'localhost', '2020-09-29 10:52:17', '2020-09-29 10:52:17', '20', 'e21495b08f5e49e872622d102427b634', '10000');
INSERT INTO `account` VALUES ('qq1230088', '98c9df11d119e4d11d32af405f42c78e', 'qq12300', 'localhost', '2020-09-29 10:53:06', '2020-09-29 10:53:06', '21', 'e21495b08f5e49e872622d102427b634', '10000');
INSERT INTO `account` VALUES ('qq12300789', '98c9df11d119e4d11d32af405f42c78e', 'qq12300', 'localhost', '2020-09-29 10:55:09', '2020-09-29 10:55:09', '22', 'e21495b08f5e49e872622d102427b634', '10000');
INSERT INTO `account` VALUES ('qq12345656651', 'd0dcbf0d12a6b1e7fbfa2ce5848f3eff', 'qq123456', 'localhost', '2020-09-29 11:58:11', '2020-09-29 11:58:11', '23', '96f45e0c5ce016fcd7b477b66016d4fe', '10000');
INSERT INTO `account` VALUES ('qq1234568888', 'd0dcbf0d12a6b1e7fbfa2ce5848f3eff', 'qq123456', 'localhost', '2020-09-30 12:27:18', '2020-09-30 12:27:18', '24', '96f45e0c5ce016fcd7b477b66016d4fe', '10000');
