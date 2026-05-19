/*
Navicat MySQL Data Transfer

Source Server         : EghgTJGqPmZ9RQiW
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : account

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-12-31 00:39:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for package_charge
-- ----------------------------
DROP TABLE IF EXISTS `package_charge`;
CREATE TABLE `package_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `expression` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `is_show` int(11) NOT NULL DEFAULT '0',
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `rmb` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of package_charge
-- ----------------------------
INSERT INTO `package_charge` VALUES ('2', '100000 KNB', '100000 KNB', '', '10000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '10000');
INSERT INTO `package_charge` VALUES ('3', '200000 KNB', '200000 KNB', '', '20000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '20000');
INSERT INTO `package_charge` VALUES ('4', '500000 KNB', '500000 KNB', '', '50000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '50000');
INSERT INTO `package_charge` VALUES ('5', '1000000 KNB', '1000000 KNB', '', '100000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '100000');
INSERT INTO `package_charge` VALUES ('6', '2000000 KNB', '2000000 KNB', '', '200000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '200000');
INSERT INTO `package_charge` VALUES ('7', '5000000 KNB', '5000000 KNB', '', '500000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '500000');
INSERT INTO `package_charge` VALUES ('8', '10000000 KNB', '10000000 KNB', '', '1000000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '1000000');
INSERT INTO `package_charge` VALUES ('9', 'Thẻ tháng', 'Thẻ tháng', '', '50000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '50000');
INSERT INTO `package_charge` VALUES ('10', 'Thẻ chí tôn', 'Thẻ chí tôn', '', '100000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '200000');
INSERT INTO `package_charge` VALUES ('17', 'Thẻ tuần', 'Thẻ tuần', '', '20000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '20000');
INSERT INTO `package_charge` VALUES ('23', 'Nạp trực tiếp 200 KNB', 'Nạp trực tiếp 200 KNB', '', '5000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '5000');
INSERT INTO `package_charge` VALUES ('24', 'Nạp trực tiếp 500 KNB', 'Nạp trực tiếp 500 KNB', '', '10000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '10000');
INSERT INTO `package_charge` VALUES ('25', 'Nạp trực tiếp 1000 KNB', 'Nạp trực tiếp 1000 KNB', '', '20000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '20000');
INSERT INTO `package_charge` VALUES ('26', 'Nạp trực tiếp 5000 KNB', 'Nạp trực tiếp 5000 KNB', '', '50000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '50000');
INSERT INTO `package_charge` VALUES ('27', 'Nạp trực tiếp 10000 KNB', 'Nạp trực tiếp 10000 KNB', '', '100000', '1', null, '2020-12-28 23:57:59', null, '2020-12-28 23:57:59', '100000');
