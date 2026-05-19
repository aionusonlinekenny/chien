/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : account

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-12-30 09:16:35
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
  `last_transfer` datetime DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT '1',
  `point` int(11) NOT NULL DEFAULT '0',
  `total_charge` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('qq12300', '98c9df11d119e4d11d32af405f42c78e', 'qq12300', 'localhost', '2020-09-14 02:05:10', '2020-09-14 02:05:10', '15', 'e21495b08f5e49e872622d102427b634', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('qq123001', '4174baea0337de1539c7f6f63eb50744', 'qq12345', 'localhost', '2020-09-29 09:47:10', '2020-09-29 09:47:10', '16', '6f3c8425a0167ac855ef20b719f100d4', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('qq123456', 'd0dcbf0d12a6b1e7fbfa2ce5848f3eff', 'qq123456', 'localhost', '2020-09-29 09:50:06', '2020-09-29 09:50:06', '17', '96f45e0c5ce016fcd7b477b66016d4fe', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('qq1234567', 'd7340d7e38fbcbafc6d76ef5836670a2', 'qq1234567', 'localhost', '2020-09-29 10:03:08', '2020-09-29 10:03:08', '18', 'aefdf170b945cfb351cbe58181182285', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('qq12345678', '20aadbc0d1c333f7f304103eb6b71352', 'qq12345678', 'localhost', '2020-09-29 10:38:00', '2020-09-29 10:38:00', '19', 'f8e295b7448d48c1d29d265fc7e3430c', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('qq1230099', '98c9df11d119e4d11d32af405f42c78e', 'qq12300', 'localhost', '2020-09-29 10:52:17', '2020-09-29 10:52:17', '20', 'e21495b08f5e49e872622d102427b634', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('qq1230088', '98c9df11d119e4d11d32af405f42c78e', 'qq12300', 'localhost', '2020-09-29 10:53:06', '2020-09-29 10:53:06', '21', 'e21495b08f5e49e872622d102427b634', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('qq12300789', '98c9df11d119e4d11d32af405f42c78e', 'qq12300', 'localhost', '2020-09-29 10:55:09', '2020-09-29 10:55:09', '22', 'e21495b08f5e49e872622d102427b634', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('qq12345656651', 'd0dcbf0d12a6b1e7fbfa2ce5848f3eff', 'qq123456', 'localhost', '2020-09-29 11:58:11', '2020-09-29 11:58:11', '23', '96f45e0c5ce016fcd7b477b66016d4fe', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('qq1234568888', 'd0dcbf0d12a6b1e7fbfa2ce5848f3eff', 'qq123456', 'localhost', '2020-09-30 12:27:18', '2020-09-30 12:27:18', '24', '96f45e0c5ce016fcd7b477b66016d4fe', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('zgymwcom', '910a7cca96b1040b0a98a717a1b3eff6', 'zgymwcom', 'localhost', '2020-09-30 09:09:02', '2020-09-30 09:09:02', '25', '671be436f5b6a919456e7d8cd1ae1b4b', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('a456456', 'b51e8dbebd4ba8a8f342190a4b9f08d7', '456456', 'localhost', '2020-09-30 06:39:09', '2020-09-30 06:39:09', '26', '2f3b4c9b3a7e28fa9d1d4c05191910ea', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('nhokkokhoc', 'a15a1583112f583397c2718b96e19ef5', 'haiyen', 'localhost', '2020-12-28 09:11:26', '2020-12-28 09:15:37', '27', '212631e125108f6d81fe59f144075170', '10000', '2020-12-29 00:15:37', null, '1', '9994999', '0');
INSERT INTO `account` VALUES ('Cuty96', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 04:27:56', '2020-12-25 04:27:56', '28', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('abnbnn1', 'e0fe2ae4c073345d7789df500f4192c4', 'abnbnn', 'localhost', '2020-12-25 04:28:00', '2020-12-25 04:28:00', '29', '2829c273cb1d1cbd2cdf1963c5c800a1', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('bakra123', '4297f44b13955235245b2497399d7a93', '123123', 'localhost', '2020-12-25 04:28:32', '2020-12-25 04:28:32', '30', '000558b65f43010a597597349a2e1955', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Tam1101', '96365cba33a18ee1d576530133ed5749', 'tamyeudiu123', 'localhost', '2020-12-25 04:30:20', '2020-12-29 03:59:48', '31', '055f7a3a8929437ffe4d58aa680b2ef3', '10000', '2020-12-29 18:59:49', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Nhutho8', '633bdfa9c50700af92b14425500280bc', '19001560', 'localhost', '2020-12-25 04:31:07', '2020-12-25 04:31:07', '32', 'efba96e6b0c825400e3d22a8d1484b43', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('linhpk', '343b1c4a3ea721b2d640fc8700db0f36', 'qqqqqq', 'localhost', '2020-12-25 04:31:10', '2020-12-25 04:31:10', '33', '79ca92f2a3a406b20b21024c7c148c15', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Luyen1308', '0eecfb9c681178eef9131b36da4291ac', 'luyen1', 'localhost', '2020-12-25 04:31:40', '2020-12-25 04:31:40', '34', '757991f5320e48b703d75d562b7dbb0e', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('nhannguquen', '99493e9418b0aca859b07fcab66271f1', 'nhanma', 'localhost', '2020-12-25 04:32:02', '2020-12-25 04:32:02', '35', '08c0aa8b0bedc2007cedd60fa6f1ed52', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Nhutho1', '633bdfa9c50700af92b14425500280bc', '19001560', 'localhost', '2020-12-25 05:01:56', '2020-12-25 05:01:56', '36', 'efba96e6b0c825400e3d22a8d1484b43', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Taolahung', '278a5677d8665d81cac492b1b97ef1a6', 'hungbn', 'localhost', '2020-12-25 05:15:59', '2020-12-25 05:15:59', '37', 'e35f9c9002bbe5dc77b7a5a6068e64da', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('nghiapgo2', 'a5a119fe896cef91ede750b9d6ace6a1', '159258789', 'localhost', '2020-12-25 05:37:46', '2020-12-25 05:37:46', '38', '37783b5e4a82b14502fb96ff11e8a92a', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('cin147', 'f6b35223287664320313a0bc8cff0de1', '067648147', 'localhost', '2020-12-25 05:40:42', '2020-12-25 05:40:42', '39', '875b6d496247b01a835172228926f058', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Kidvp966', 'c33a18cc0039bf8eab62a574e76ea43c', '123466a', 'localhost', '2020-12-25 05:44:12', '2020-12-25 05:44:12', '40', 'ff6d86082be936c942596f0705a69d8b', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('ogo001', '7be6d9a59cc6c39728ae78dc2e8217b6', '01291317', 'localhost', '2020-12-25 05:44:30', '2020-12-25 05:44:30', '41', 'cede4cbefe974a7feda04d8894154067', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('xhau303', '4297f44b13955235245b2497399d7a93', '123123', 'localhost', '2020-12-25 05:53:13', '2020-12-28 09:34:55', '42', '000558b65f43010a597597349a2e1955', '10000', '2020-12-29 00:34:56', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Nhutho2', '633bdfa9c50700af92b14425500280bc', '19001560', 'localhost', '2020-12-25 05:57:13', '2020-12-25 05:57:13', '43', 'efba96e6b0c825400e3d22a8d1484b43', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Rozas999', 'e36a688e4838c0f47f7eca369706d43b', 'hieu123', 'localhost', '2020-12-25 06:07:06', '2020-12-25 06:07:06', '44', '1d35c4624de2edd368d28a4cf9b07440', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('vssassoon', '0cecacf99398b75b47c383385e4db3a5', 'vannhuthe', 'localhost', '2020-12-25 06:10:59', '2020-12-25 06:10:59', '45', 'b0de5b1e787df5c218cffcbb1d5f3c0f', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('anhsinhvien', 'b710b378de7ef5133b97bd2c9464ffe3', 'anh123', 'localhost', '2020-12-25 06:15:40', '2020-12-25 06:15:40', '46', '07340bcfc2ceb92f9b76a11b0df9454c', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Yuang123', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 06:17:09', '2020-12-25 06:17:09', '47', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('anhsinhvien1', 'b710b378de7ef5133b97bd2c9464ffe3', 'anh123', 'localhost', '2020-12-25 06:17:31', '2020-12-25 06:17:31', '48', '07340bcfc2ceb92f9b76a11b0df9454c', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Abc124', 'b71a4cd635e0ea3e43adcc1e0c755416', 'abc124', 'localhost', '2020-12-25 06:20:15', '2020-12-25 06:20:15', '49', '75c974754dc9b898c7d9cd8a9d76a941', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('abc123', 'd6b0ab7f1c8ab8f514db9a6d85de160a', 'abc12345', 'localhost', '2020-12-25 06:22:02', '2020-12-25 06:22:02', '50', '2eabebe58c4e65337cb8065a47ae6625', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('bodauto', '4297f44b13955235245b2497399d7a93', '123123', 'localhost', '2020-12-25 06:23:22', '2020-12-25 06:23:22', '51', '000558b65f43010a597597349a2e1955', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('theanhisme', '96e79218965eb72c92a549dd5a330112', '111111', 'localhost', '2020-12-25 06:23:50', '2020-12-25 06:23:50', '52', '9d9048fac7dd3f5875b7e6e694035fed', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('huytanpk01', '445e679f1682ac1c3cca128dd3f59eb7', 'huytan1', 'localhost', '2020-12-25 06:24:33', '2020-12-25 06:24:33', '53', '6932e0231aaef4f86a3a9d4344d0c4ab', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('aopro098', 'd36cdc0e66fb092222c44bc2f43d2099', '0987345892', 'localhost', '2020-12-25 06:27:42', '2020-12-28 22:10:37', '54', 'c40517e0079c49fab90971454c1917f5', '10000', '2020-12-29 13:10:38', null, '1', '0', '0');
INSERT INTO `account` VALUES ('khaba9x', '7adef9bd4398ee5d447784cb287dadc8', 'sup3rkill3r', 'localhost', '2020-12-25 06:30:20', '2020-12-25 06:30:20', '55', 'f23e992dd770846514fd615602499620', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Khangvipcm', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 06:31:48', '2020-12-25 06:31:48', '56', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('saintmark', '25d55ad283aa400af464c76d713c07ad', '12345678', 'localhost', '2020-12-25 06:32:12', '2020-12-25 06:32:12', '57', 'ca4ecf680daadf942cc131cc5d45304e', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Kids2hn', '5c97d8ae41a6df1f09431cfe12993968', 'sanc201091', 'localhost', '2020-12-25 06:32:53', '2020-12-25 06:32:53', '58', '662c2cc276149fad3552817145610682', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('1234567', 'fcea920f7412b5da7be0cf42b8c93759', '1234567', 'localhost', '2020-12-25 06:36:10', '2020-12-25 06:36:10', '59', '94bf5b2a9f7a823c558af2557e95a782', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('nanashi', '19b6d4a977f1e9d8797c61bf1e7b5651', 'baby123', 'localhost', '2020-12-25 06:36:26', '2020-12-25 06:36:26', '60', 'a88feec2317c21fd39de3f10f7699de5', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Anhgjang98', '3477f5c54cabed292d74671e9dbc2cec', 'anhgjang98', 'localhost', '2020-12-25 06:37:57', '2020-12-25 06:37:57', '61', '06481e87d0d500104957e1c54cb74050', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Din0s4urs', '93279e3308bdbbeed946fc965017f67a', '121212', 'localhost', '2020-12-25 06:38:26', '2020-12-25 06:38:26', '62', '3053371fda6b31ee81793fb16c4890f2', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Thanhphuong99', '8a4314041927d40834397d46f0837647', '03081999', 'localhost', '2020-12-25 06:42:16', '2020-12-25 06:42:16', '63', 'cc5685d75aede05cbc40818ddeede457', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Phanvi25', '8a4314041927d40834397d46f0837647', '03081999', 'localhost', '2020-12-25 06:45:13', '2020-12-25 06:45:13', '64', 'cc5685d75aede05cbc40818ddeede457', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Phuc10', '46aa65302e83e9ceb95192f7a209476e', '6400129', 'localhost', '2020-12-25 06:45:24', '2020-12-25 06:45:24', '65', 'd48f6cb03d56850ec2823063fae7a9c7', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Phanvi2503', '8a4314041927d40834397d46f0837647', '03081999', 'localhost', '2020-12-25 06:46:26', '2020-12-25 06:46:26', '66', 'cc5685d75aede05cbc40818ddeede457', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('test97', '343b1c4a3ea721b2d640fc8700db0f36', 'qqqqqq', 'localhost', '2020-12-25 06:46:32', '2020-12-25 06:46:32', '67', '79ca92f2a3a406b20b21024c7c148c15', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('gautrouble', '6e9aca4d193246cfe1d89f40ff917dfb', '140495', 'localhost', '2020-12-25 06:46:46', '2020-12-25 06:46:46', '68', '1da8c709086edb40cb57dcf047ae3c0e', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Phanvi250', '8a4314041927d40834397d46f0837647', '03081999', 'localhost', '2020-12-25 06:47:39', '2020-12-25 06:47:39', '69', 'cc5685d75aede05cbc40818ddeede457', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('paklong', '409b35274803d73b0697509cb9871f04', '615620', 'localhost', '2020-12-25 06:47:51', '2020-12-25 06:47:51', '70', 'b85cf46d9ddbe8376ea68f0cf38173a6', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Dpthanh', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 06:47:52', '2020-12-28 16:36:56', '71', '030b666836c7daa76edb20737a5cd725', '10000', '2020-12-29 07:36:57', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Nhicacnho', '563644b17aedd00dd96bbd07888e63ff', 'phongdz123', 'localhost', '2020-12-25 06:48:23', '2020-12-25 06:48:23', '72', '9f5dff8bf5c32e25eefacdc1d82060b3', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Thanhphuong999', '8a4314041927d40834397d46f0837647', '03081999', 'localhost', '2020-12-25 06:48:52', '2020-12-25 06:48:52', '73', 'cc5685d75aede05cbc40818ddeede457', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('rambo113', '5ad33ee663db4fb709de89e0d7a3d409', '014789', 'localhost', '2020-12-25 06:49:45', '2020-12-25 06:49:45', '74', '67ed2401519d8b2888bfbd9a7b27d114', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Thanhphuong9999', '8a4314041927d40834397d46f0837647', '03081999', 'localhost', '2020-12-25 06:50:28', '2020-12-25 06:50:28', '75', 'cc5685d75aede05cbc40818ddeede457', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('whoiam', '0f0ec98fafe9e2770e2251321f62a7d3', 'chi123456', 'localhost', '2020-12-25 06:51:22', '2020-12-25 06:51:22', '76', '927178665444689909e2cad93afa0236', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Thanhphuong9', '8a4314041927d40834397d46f0837647', '03081999', 'localhost', '2020-12-25 06:52:51', '2020-12-25 06:52:51', '77', 'cc5685d75aede05cbc40818ddeede457', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Thanhphuong', '8a4314041927d40834397d46f0837647', '03081999', 'localhost', '2020-12-25 06:54:58', '2020-12-25 06:54:58', '78', 'cc5685d75aede05cbc40818ddeede457', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Ltn121001', '4640895bf3164d49d29b518a3237695f', 'ltn2001', 'localhost', '2020-12-25 06:56:02', '2020-12-28 09:48:44', '79', 'cc470d33eaec77a4a4754a0e3eaf974e', '10000', '2020-12-29 00:48:45', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Thanhphuong25', '8a4314041927d40834397d46f0837647', '03081999', 'localhost', '2020-12-25 06:56:12', '2020-12-25 06:56:12', '80', 'cc5685d75aede05cbc40818ddeede457', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('thancongvt', '3e8c74b1ece0a49cb17bdc7d19cbe913', '180694', 'localhost', '2020-12-25 06:56:24', '2020-12-25 06:56:24', '81', '9cb2c41cf4f0b93d039aa6e46bed58c7', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Lamhoangphuc', '12c04742ed86742a53e2d08420d4c1fb', 'hoang1phuc', 'localhost', '2020-12-25 06:58:23', '2020-12-25 06:58:23', '82', 'f5576554baa71ea5c5c841516710b257', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('thancongvt1', '0f5001729465b10f15873e2e0797496e', 'Cici10393', 'localhost', '2020-12-25 06:59:23', '2020-12-25 06:59:23', '83', '5af42fb56b46a88da3e554040521fa88', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('ogo002', '7be6d9a59cc6c39728ae78dc2e8217b6', '01291317', 'localhost', '2020-12-25 07:02:01', '2020-12-28 13:28:08', '84', 'cede4cbefe974a7feda04d8894154067', '10000', '2020-12-29 04:28:08', null, '1', '0', '0');
INSERT INTO `account` VALUES ('socktow', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 07:03:09', '2020-12-25 07:03:09', '85', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Kason003', '9cd59f521420c1c6cf92f5d14c69f752', 'kason123', 'localhost', '2020-12-25 07:03:45', '2020-12-28 16:36:20', '86', 'd786628183de3de8b4e33d7739c46ace', '10000', '2020-12-29 07:36:20', null, '1', '0', '0');
INSERT INTO `account` VALUES ('luklak', '343b1c4a3ea721b2d640fc8700db0f36', 'qqqqqq', 'localhost', '2020-12-25 07:04:27', '2020-12-28 22:59:22', '87', '79ca92f2a3a406b20b21024c7c148c15', '10000', '2020-12-29 13:59:22', null, '1', '0', '0');
INSERT INTO `account` VALUES ('pupaia1', 'd4e78d65132e7417ed670a78930e5f38', '123456z', 'localhost', '2020-12-25 07:09:51', '2020-12-25 07:09:51', '88', '309e08aacee9d29460a03dfc061a23b7', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Hieunghiakl123', '4297f44b13955235245b2497399d7a93', '123123', 'localhost', '2020-12-25 07:13:47', '2020-12-25 07:13:47', '89', '000558b65f43010a597597349a2e1955', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('noaway', '96e79218965eb72c92a549dd5a330112', '111111', 'localhost', '2020-12-25 07:22:33', '2020-12-25 07:22:33', '90', '9d9048fac7dd3f5875b7e6e694035fed', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('buiminhtri', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 07:31:09', '2020-12-25 07:31:09', '91', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Yanken', 'cdccf26328d9225013de04bf71c73d90', '3112003', 'localhost', '2020-12-25 07:36:23', '2020-12-25 07:36:23', '92', '7b6ef517ecf45a23bd3999581cf126ac', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('pupaia2', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 07:36:51', '2020-12-25 07:36:51', '93', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('kienhoang99125', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 07:41:09', '2020-12-25 07:41:09', '94', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('pupaia3', 'd4e78d65132e7417ed670a78930e5f38', '123456z', 'localhost', '2020-12-25 07:42:41', '2020-12-25 07:42:41', '95', '309e08aacee9d29460a03dfc061a23b7', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('leloi304', '7634b4f23920ef15bed266fe6eacd0bd', 'leloi3042001', 'localhost', '2020-12-25 07:43:49', '2020-12-25 07:43:49', '96', 'a7d14150b6e510dec389ef1cd38fa400', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('0569116897', '53a75c48fadd3a19ac976c836e5cf770', 'leloi304', 'localhost', '2020-12-25 07:46:24', '2020-12-25 07:46:24', '97', '903a693ef89cc2d21802ee935a912abb', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Dangok52', '6d071901727aec1ba6d8e2497ef5b709', '101010', 'localhost', '2020-12-25 07:50:13', '2020-12-25 07:50:13', '98', '3971b85635d8196dd76702ee5237b53e', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('killfil00', '4297f44b13955235245b2497399d7a93', '123123', 'localhost', '2020-12-25 07:52:29', '2020-12-25 07:52:29', '99', '000558b65f43010a597597349a2e1955', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('dacvuocbu', 'de6022eabdb3d018507b43b6aacf97e0', 'dghsaghdgh', 'localhost', '2020-12-25 07:53:59', '2020-12-25 07:53:59', '100', '2983edbb50a4f822417044c981bd25cd', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Kimngan', '3e79065f51b7861e95f3801290e6635e', 'kimngan1', 'localhost', '2020-12-25 08:01:50', '2020-12-25 08:01:50', '101', '70812275772fe170fae84ecb6619cf81', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('nganhanhtu', '79318428f7178112b6a8256ef3f2e04a', '281992', 'localhost', '2020-12-25 08:01:54', '2020-12-25 08:01:54', '102', 'ef14592fb1d1051d6a0948ba2834c9d6', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('quocai', '713bbd6f028eba1e36ac10e842d1072e', '27032005', 'localhost', '2020-12-25 08:04:16', '2020-12-25 08:04:16', '103', '01a660fbfb1421995690a2f48531e0ba', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('kienpk21', '0aa1095feb9e6ffc477231de2836f074', 'kienpk21', 'localhost', '2020-12-25 08:07:02', '2020-12-25 08:07:02', '104', '5ebfaa189e7c8bf46a1f85092725f08a', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('bablabla', 'c8837b23ff8aaa8a2dde915473ce0991', '123321', 'localhost', '2020-12-25 08:11:27', '2020-12-25 08:11:27', '105', 'e7ca259f11d6491b0784aa559cb12866', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('luclv2000', 'a906449d5769fa7361d7ecc6aa3f6d28', '123abc', 'localhost', '2020-12-25 08:15:46', '2020-12-25 08:15:46', '106', '1f41c29ef488b00043424aa478c57c3e', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Thotrang', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 08:16:34', '2020-12-25 08:16:34', '107', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Langlas', 'feea72e8b875cbcfbb7dfdfe6b8f0049', '123331', 'localhost', '2020-12-25 08:19:25', '2020-12-25 08:19:25', '108', '01b47722d5b097c6bfaba7be6dce2481', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Luclv20000', 'a906449d5769fa7361d7ecc6aa3f6d28', '123abc', 'localhost', '2020-12-25 08:19:43', '2020-12-25 08:19:43', '109', '1f41c29ef488b00043424aa478c57c3e', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('anhday12yb', '5dc2e1d40565a588ac22b6c507d622f2', 'anhdayyb', 'localhost', '2020-12-25 08:24:25', '2020-12-28 19:43:36', '110', '926fafd956f796d5080048080ba34215', '10000', '2020-12-29 10:43:36', null, '1', '0', '0');
INSERT INTO `account` VALUES ('nhocquy122', '2455bee66d34f9650fcd21325be462fb', 'anhpro', 'localhost', '2020-12-25 08:39:58', '2020-12-25 08:39:58', '111', 'b1dc68acd34abb5488a03c57457384b6', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('duyminhhbu', '9507898a4f0347d697a63026d15ddbdf', 'duyminh', 'localhost', '2020-12-25 08:41:57', '2020-12-28 13:57:29', '112', '619a7584ddb7f0bbf627f888b5c0374a', '10000', '2020-12-29 04:57:30', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Phuoc29', '0b6973f7b672c508828291dcc98ff8d8', 'phuoc29', 'localhost', '2020-12-25 08:50:55', '2020-12-25 08:50:55', '113', 'e069a26e17e13e9a506829967a00f36a', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Nguyentruonghan', '8887e36756eec0b46946a9beeaee6bfa', 'hanhan', 'localhost', '2020-12-25 09:00:01', '2020-12-25 09:00:01', '114', '1c3debc02551a9ae9a0b780599c494f6', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('trjeul0ng', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 09:16:20', '2020-12-25 09:16:20', '115', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Thuyan977', '035742414c8a13ea3e6f1b3dd48dc6d0', '11121997', 'localhost', '2020-12-25 09:17:36', '2020-12-25 09:17:36', '116', 'f7daed63abb36b545f6ade78f9e9e9d7', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('luanpro777', 'c341ad29adeaa4be7040be4b34c11aad', 'trongnhan1999', 'localhost', '2020-12-25 09:24:10', '2020-12-25 09:24:10', '117', '1df24af40f2b28eba2e99a8c830754f3', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('covenam113', '1c763ed57e05fa05f03346ede74288a8', '10031992', 'localhost', '2020-12-25 09:28:19', '2020-12-25 09:28:19', '118', '01e9795d88d1ffc49b22f3c3a54fccc2', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Yucheung908', 'ce74ce1b6c57a2c0cd3f878c1c1ed337', 'Yeuemmai01', 'localhost', '2020-12-25 09:32:39', '2020-12-25 09:32:39', '119', '333fddfac6429294cf6d31fba58eea53', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('M3j42009', '14e7593e7101b934b13675ba2bbbddd2', '131324', 'localhost', '2020-12-25 09:46:49', '2020-12-28 21:59:11', '120', '2c022d2aaabf31eba3c1f70134b5e871', '10000', '2020-12-29 12:59:11', null, '1', '0', '0');
INSERT INTO `account` VALUES ('m3j42010', '14e7593e7101b934b13675ba2bbbddd2', '131324', 'localhost', '2020-12-25 09:49:25', '2020-12-25 09:49:25', '121', '2c022d2aaabf31eba3c1f70134b5e871', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('kidvp01', '025cc5b3caed317e194dc9804dda7efb', 'manh12', 'localhost', '2020-12-25 09:53:29', '2020-12-25 09:53:29', '122', '972106678db12f83a78e816f315408c7', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('dat1808', 'ded2b2e92cd0cd0e0ef49976063ecd24', '18082003', 'localhost', '2020-12-25 09:58:25', '2020-12-25 09:58:25', '123', '2658e5232a976528ce5666002f959f88', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Goitalasang', '32dadf5dce28e6153938afdb3a438012', 'sang1992', 'localhost', '2020-12-25 09:59:28', '2020-12-25 09:59:28', '124', '10519f62a06335e02bba932519baaf90', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('denysusanto', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 10:01:19', '2020-12-28 09:27:30', '125', '030b666836c7daa76edb20737a5cd725', '10000', '2020-12-29 00:27:30', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Tinkuku', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 10:02:14', '2020-12-25 10:02:14', '126', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('bemiuhpp', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 10:05:20', '2020-12-25 10:05:20', '127', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Taolahunga', '278a5677d8665d81cac492b1b97ef1a6', 'hungbn', 'localhost', '2020-12-25 10:15:23', '2020-12-28 19:23:42', '128', 'e35f9c9002bbe5dc77b7a5a6068e64da', '10000', '2020-12-29 10:23:43', null, '1', '0', '0');
INSERT INTO `account` VALUES ('hongson', 'a1173145bf75f07577970280a76232a2', '814709', 'localhost', '2020-12-25 10:17:53', '2020-12-25 10:17:53', '129', 'b5153827798f6c0b8f20f59dd1f5ddc5', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('navan18', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-25 10:18:09', '2020-12-25 10:18:09', '130', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Lapnguyending', 'ef85ad84cc1ce9884d4c02a411532345', '01663503370', 'localhost', '2020-12-25 10:33:51', '2020-12-25 10:33:51', '131', '6beede69c48f97411de15b3164feb411', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Hiep351', '17bc47a0acf910bd12a7bc1c035c0a3e', 'hiepbu', 'localhost', '2020-12-25 10:38:42', '2020-12-25 10:38:42', '132', 'fa58c0b7c6a67893e1a088c3b4addcfe', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Rainyy', '4297f44b13955235245b2497399d7a93', '123123', 'localhost', '2020-12-25 10:39:08', '2020-12-25 10:39:08', '133', '000558b65f43010a597597349a2e1955', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('kawatokiro', '0d033b42741823c0729a37ce5234f57e', 'nhan123', 'localhost', '2020-12-25 10:45:31', '2020-12-25 10:45:31', '134', '635ff289fb859d51594ad92019f5e684', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Vumanhduchd', 'a54b605c977b1bc1286e2b6c943b7bdc', 'banbe123', 'localhost', '2020-12-25 10:50:35', '2020-12-25 10:50:35', '135', '3f21d5ca2fea2daa87263551eebf15ae', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('long0312', '380bd4a9976c84c2088c095a0371bb75', 'Trondoifa3', 'localhost', '2020-12-25 10:57:07', '2020-12-25 10:57:07', '136', '2cd398a864ac03dd00b2e92755892647', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('nebula9', '10e14ac8a812b6b15c05d977b438f999', 'tinh0989', 'localhost', '2020-12-25 10:58:58', '2020-12-25 10:58:58', '137', 'b09392729f0664f37be3ad27318782f1', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Shocknghia', 'ebc1dc84f33d6f7077a43b346b6a12b9', 'Shocknghia', 'localhost', '2020-12-25 11:01:18', '2020-12-25 11:01:18', '138', 'bdb96418adb9aea1f6a3301b80a3c5d2', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Minhfire', 'f26b695c4dc929738c281168fa4ec4ac', '060220033sss', 'localhost', '2020-12-25 11:06:13', '2020-12-25 11:06:13', '139', '4020bd614314ab6c164907715a663056', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('khiemken', '89ce7d619b63f61ad308e134ddecc277', 'khiemken', 'localhost', '2020-12-25 11:08:32', '2020-12-25 11:08:32', '140', '7f9897d3a9bd493eb1ebaa17ae8f3bf7', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Zerols', '06ea66745cb7c00873794e9d2f30ed4c', 'manhls', 'localhost', '2020-12-25 11:12:24', '2020-12-25 11:12:24', '141', 'fdad4ed03e27713238455d89e15abd07', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Gemman9x', '49a2d0519ee547c4862bbd686a599282', '000000Ff', 'localhost', '2020-12-25 11:30:01', '2020-12-28 16:26:54', '142', '21cc4bbe7cca7cda7cfc8ca6ca6346d8', '10000', '2020-12-29 07:26:54', null, '1', '0', '0');
INSERT INTO `account` VALUES ('nhiendz', '6139d2537eeabee6ecc7b7236bda0aa4', 'nhiendz2001', 'localhost', '2020-12-25 11:31:21', '2020-12-28 20:35:21', '143', '7ad87a182a340454153e1462890e359f', '10000', '2020-12-29 11:35:21', null, '1', '0', '0');
INSERT INTO `account` VALUES ('kietvn301', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-26 12:19:59', '2020-12-26 12:19:59', '144', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('khidacam3', '49e8a8154990e1bb2bd7865d83dc95d1', 'linhnhi', 'localhost', '2020-12-26 12:21:42', '2020-12-26 12:21:42', '145', '27f92ae4711cf04963cbc7a80165a7d6', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Trunghieutw98', '322af37ea0f5b21e79c657e7f91bfd0e', 'hoangkim1998', 'localhost', '2020-12-26 12:29:29', '2020-12-26 12:29:29', '146', 'b8cb288a27c7e021917c8c8c2b0d6a2a', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('giahy124', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-26 12:48:16', '2020-12-29 18:57:14', '147', '030b666836c7daa76edb20737a5cd725', '10000', '2020-12-30 09:57:14', null, '1', '0', '0');
INSERT INTO `account` VALUES ('anhvipmo4', '39daa82ce087ae61aab9a1e1104acacb', 'anhvipmo4', 'localhost', '2020-12-26 12:49:29', '2020-12-26 12:49:29', '148', '76e4d1caa467b4ff8b4fa31b70b90675', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('dajihaha0001', 'b466a1e6dee2abfb88fc9d8ebda089ee', 'yeuemmuondoi1', 'localhost', '2020-12-26 01:10:37', '2020-12-26 01:10:37', '149', '2bfc314bd4a53c259cb73203905e58d5', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Thanh95', '4297f44b13955235245b2497399d7a93', '123123', 'localhost', '2020-12-26 01:54:43', '2020-12-26 01:54:43', '150', '000558b65f43010a597597349a2e1955', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Morvine', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-26 02:38:09', '2020-12-26 02:38:09', '151', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('sllangtu1', 'fad6621aab2a1f10eab6c1e3ab27505d', 'anh1234', 'localhost', '2020-12-26 02:47:10', '2020-12-26 02:47:10', '152', '5cf301dadd3358e93f01c8a51dca465e', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Hoang95', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-26 03:03:06', '2020-12-29 02:55:20', '153', '030b666836c7daa76edb20737a5cd725', '10000', '2020-12-29 17:55:21', null, '1', '0', '0');
INSERT INTO `account` VALUES ('didaahay13', '561634866edc146ac669711a3fe9af5b', 'didaahay13', 'localhost', '2020-12-26 04:13:04', '2020-12-29 06:39:32', '154', '90b82386c4571f354e97390d53d9db03', '10000', '2020-12-29 21:39:33', null, '1', '0', '0');
INSERT INTO `account` VALUES ('nghibt1900', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-26 06:56:00', '2020-12-26 06:56:00', '155', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Min1212', 'f5dac6f6f922e6022e802738a5824c4e', 'min1212', 'localhost', '2020-12-26 07:42:38', '2020-12-26 07:42:38', '156', '919b6faf436e614bd7d3490c9d2ab12c', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('123123123', 'f5bb0c8de146c67b44babbf4e6584cc0', '123123123', 'localhost', '2020-12-26 07:54:53', '2020-12-26 07:54:53', '157', '4618d51f14e666a3a91d640cab860f78', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('noctuananh', 'a8e1560b56e0284a54727be2fe3c8853', 'tinh123', 'localhost', '2020-12-26 08:54:30', '2020-12-26 08:54:30', '158', 'a2027bb28c5e68de4ab41b797facaa44', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('rapelady50', '28e92f7d84c52400437e43817fc88f5a', '14051989h', 'localhost', '2020-12-26 08:59:07', '2020-12-26 08:59:07', '159', '003baa01029b6ebe02a6216663914d0e', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Thaichau', '5a0dfa8602cfd6325ffd875cced1e98e', 'thaihoa', 'localhost', '2020-12-26 09:04:23', '2020-12-26 09:04:23', '160', '009da87f7b84ab6d4a8fda7082bec5a3', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('phuong32', '4297f44b13955235245b2497399d7a93', '123123', 'localhost', '2020-12-26 09:28:15', '2020-12-26 09:28:15', '161', '000558b65f43010a597597349a2e1955', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('duy6a9', 'b24ec32fb6f781bd54a846f9f7c7edde', 'ankeda', 'localhost', '2020-12-26 09:33:22', '2020-12-26 09:33:22', '162', '47be67dfd4adbc2f8a89ceac1de340af', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Nhacay1', 'ed5fe23b6d0d61e5c367c16d898d69ba', 'nhavip41', 'localhost', '2020-12-26 09:35:19', '2020-12-26 09:35:19', '163', '48d291976fd901d2337039e1598255a4', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Nhocbi1323', '8482836c74e27435cdbab79c33bf97a5', '13231323', 'localhost', '2020-12-26 09:38:43', '2020-12-26 09:38:43', '164', '7decf7b4f8cd7b59c9c4941ff8030a83', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('maxdaddysmile', 'fb9ecfd113889d6b84cb74368e8cb219', 'chi081098', 'localhost', '2020-12-26 09:39:44', '2020-12-26 09:39:44', '165', '0a1b179e313a2713ea129af17878ace8', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('tuan42707', 'd211289204e72b4d0b780de922d8e5a3', 'dumitu7994', 'localhost', '2020-12-26 09:44:14', '2020-12-26 09:44:14', '166', '6c91129f92963240e5d0c9e02cc1003d', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Tatalong0101', '4297f44b13955235245b2497399d7a93', '123123', 'localhost', '2020-12-26 09:54:10', '2020-12-26 09:54:10', '167', '000558b65f43010a597597349a2e1955', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('canh1230', '4e079cb871ed2d9562cfc4d7f3b156c3', 'canh1230', 'localhost', '2020-12-26 10:05:16', '2020-12-26 10:05:16', '168', 'b00aed732e9c4b1f47a43b9dea7562a9', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Talataty', '29b21cfd4396dd7fc7c8797315074ff4', 'trongdz1', 'localhost', '2020-12-26 10:10:01', '2020-12-26 10:10:01', '169', '9569c2e61669ed8257eb460d883327c5', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Khanhne', '54b034b2db4f7d933d1fba6139948a88', 'khanhne', 'localhost', '2020-12-26 10:21:19', '2020-12-26 10:21:19', '170', '8dee88e194009fa5f4839a0f8b58fccf', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Toto93', 'f379eaf3c831b04de153469d1bec345e', '666666', 'localhost', '2020-12-26 10:22:39', '2020-12-26 10:22:39', '171', 'e8acf02474b662dd8e38b900a9da82ab', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Waters', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-26 11:03:21', '2020-12-26 11:03:21', '172', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('meomu91vn', '94cdd1ee0fd6e9662947d14d63a2fd02', 'novakaka123', 'localhost', '2020-12-26 11:03:50', '2020-12-26 11:03:50', '173', '6b337fec6c85e1223d0619a98e6beb8f', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Camdoia12', '64c34d5e78cf7ebb38a7f3d896683722', '110987', 'localhost', '2020-12-26 11:19:05', '2020-12-26 11:19:05', '174', 'b9251ff0e068f186f89100841b91abef', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('hoquocai', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-26 11:23:43', '2020-12-26 11:23:43', '175', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Gemman91', '49a2d0519ee547c4862bbd686a599282', '000000Ff', 'localhost', '2020-12-26 11:53:57', '2020-12-26 11:53:57', '176', '21cc4bbe7cca7cda7cfc8ca6ca6346d8', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('huyjax11', '1e55dbf412cb74d5e2c21fb6452408c7', 'asd123456', 'localhost', '2020-12-26 12:32:38', '2020-12-26 12:32:38', '177', 'bfce70603ca1b494134d20d2f2bd1085', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Gaoden446', 'f20da799054abae41ad850f3870b560b', 'asd1231', 'localhost', '2020-12-26 01:17:24', '2020-12-26 01:17:24', '178', '7eb827f852da057be1910eb8aa2fe254', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Khocnha1', '3f11033a03483c101f3fb9988f3c4f81', 'anhloe1', 'localhost', '2020-12-26 01:28:32', '2020-12-26 01:28:32', '179', '6130f29b8cb94244ac6cd0430cbf45e8', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('phamhai123', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-26 01:40:38', '2020-12-26 01:40:38', '180', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('diepcon97', '845e1ead0e65522060fd4e68c9537604', 'diepcon97', 'localhost', '2020-12-26 01:46:55', '2020-12-26 01:46:55', '181', '1a04b9c93498fda35091fb756f400e60', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Vagabond', 'e807f1fcf82d132f9bb018ca6738a19f', '1234567890', 'localhost', '2020-12-26 01:53:42', '2020-12-26 01:53:42', '182', '5e6650361eae0e6e0d76f63fd40bfd1c', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('trangtrang94', '888e931d6360ee143df0d552f955299a', '090909', 'localhost', '2020-12-26 02:52:38', '2020-12-26 02:52:38', '183', '4d49f54f1799bd39e466b80c082c3849', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('anhday12', '2495ab266a454c45eee0d5ef8815fd97', 'hoangquan94', 'localhost', '2020-12-26 02:56:20', '2020-12-26 02:56:20', '184', '4273ee4aa58488ce6b238c0fc94bf151', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('punny1', '4297f44b13955235245b2497399d7a93', '123123', 'localhost', '2020-12-26 03:17:33', '2020-12-26 03:17:33', '185', '000558b65f43010a597597349a2e1955', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('minzzz', 'de588c2f46407fa4a9b0b3ff4967d087', '0978766080', 'localhost', '2020-12-26 03:21:44', '2020-12-26 03:21:44', '186', '181a864c217c8b94d17c3d520a345108', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('ndchuyen', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-26 04:46:42', '2020-12-26 04:46:42', '187', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('anhgjang0909', '3477f5c54cabed292d74671e9dbc2cec', 'anhgjang98', 'localhost', '2020-12-26 05:09:39', '2020-12-26 05:09:39', '188', '06481e87d0d500104957e1c54cb74050', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('daicalta123', '16d51e5d15336430553d06e83a2d8c52', 'daicalata123', 'localhost', '2020-12-26 05:14:55', '2020-12-26 05:14:55', '189', 'e12d8ed99a6af114bcddbc903167ae61', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('tiger2106', 'ffb9284084f3a313e97195861240bdf3', '210698', 'localhost', '2020-12-26 05:43:12', '2020-12-26 05:43:12', '190', '4e68982170d16e24d3961c5b54d75ee8', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Thanhmom', '25f9e794323b453885f5181f1b624d0b', '123456789', 'localhost', '2020-12-26 05:43:56', '2020-12-26 05:43:56', '191', 'd31bfb87e852224e024f8d73083d3b4e', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('kyanh45600', 'f17659856d8707c11a3ea4655934cef6', 'nguyenkyanh1', 'localhost', '2020-12-26 05:55:09', '2020-12-26 05:55:09', '192', 'f4c61b0bcab7e95b77199417dea6e4a9', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('diamond2012', '953a48eac41fe2a9f22125ad43bd0c4a', 'rainoverme201295', 'localhost', '2020-12-26 06:07:44', '2020-12-26 06:07:44', '193', 'f28799f36673faa3a3272568931a887e', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Bennyquy', 'a4ea8e5fe7dc0e4706619f1c50021930', 'nguoiyeu', 'localhost', '2020-12-26 06:17:04', '2020-12-29 08:47:27', '194', '26ae8b0bf7fb4c02bec8ea3f021f199a', '10000', '2020-12-29 23:47:28', null, '1', '0', '0');
INSERT INTO `account` VALUES ('yeuyeulsnl', '789477e754089981270bfee3c71aa943', '123anh', 'localhost', '2020-12-26 06:19:30', '2020-12-26 06:19:30', '195', '76ee86f070b9561ed76dea3525d9c592', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Dangvinh1', '8287a9c4907cdcb2e65d1cac05381e62', '123vinh', 'localhost', '2020-12-26 06:24:50', '2020-12-26 06:24:50', '196', 'a3b6e7d2e420a2f13ae988ac32fdce8f', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('chiendeptrai', '38a8c6c301f65a64a68f148e8a97aa7c', 'chieb123', 'localhost', '2020-12-26 06:28:17', '2020-12-26 06:28:17', '197', 'fe6ac2740802a1c984fd2f10a3fd38f5', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Djvipprodk1', 'adb7e69006f34b1597eda55dc2c22dc9', '03122001', 'localhost', '2020-12-26 07:10:27', '2020-12-28 09:58:28', '198', '939a645097e9f8a306ca5c2a0d5d8dcb', '10000', '2020-12-29 00:58:29', null, '1', '0', '0');
INSERT INTO `account` VALUES ('251297', 'aea680420fb7d7db689e57ca92fd77c2', 'khangpro', 'localhost', '2020-12-26 07:29:53', '2020-12-26 07:29:53', '199', 'c01894401d7a13ceea6943394cf54a12', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Tuyenbenh', '537d9868d4051d30d1cd35e836ff924d', '15092002', 'localhost', '2020-12-26 08:16:04', '2020-12-26 08:16:04', '200', '198bbc4fe6686b6151b1eeb6cbc054d8', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('tus2mi', '86b7cadde2d8f1b8b5df86f92d086f24', 'doipassroi', 'localhost', '2020-12-26 08:29:02', '2020-12-26 08:29:02', '201', 'f8fb0d9a8688af3a3f79c01477a25a6f', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('gonkonoi', 'd6083e851016d6579558be3cd08e50b6', 'lovered02', 'localhost', '2020-12-26 08:41:58', '2020-12-26 08:41:58', '202', 'e31bc3598f2feea257ded9ed84c7ae9f', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('haibatri12', '5915a210d89ccbf4c214049d845a8225', 'vanhai123', 'localhost', '2020-12-26 08:47:46', '2020-12-26 08:47:46', '203', '50f205f65fb02c977a1ce0879dd67c84', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Bactinh', '7085e6b4fb5bf71436221f6ccd1af40c', 'anhyeuem', 'localhost', '2020-12-26 09:12:34', '2020-12-28 16:02:52', '204', '7935528244b10594405e4288fd6eb54e', '10000', '2020-12-29 07:02:53', null, '1', '0', '0');
INSERT INTO `account` VALUES ('piahoang', 'f9c81dd99f5aec80fd33bb7964fb7267', '183461', 'localhost', '2020-12-26 09:22:19', '2020-12-26 09:22:19', '205', '171d8169e803999579a887bd48238eae', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Vungocthien3', 'b56632001e68e991f72a647f4b31916e', '121290', 'localhost', '2020-12-26 09:37:48', '2020-12-26 09:37:48', '206', '0ebcbfdbff09b4db68dea8a7d506a01f', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Sompro', 'c7931bc7e26b0f242de7414b86f9ffcc', 'anhvip', 'localhost', '2020-12-26 09:54:32', '2020-12-26 09:54:32', '207', '343aa4f20e4820eea9efbbabbfee683f', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Drojanvjp', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-26 10:01:44', '2020-12-26 10:01:44', '208', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Drojanvjp12', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-26 10:11:02', '2020-12-26 10:11:02', '209', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('chien123', 'b64f0c45c1f42ecb0677d81983e6eb0b', 'chien123', 'localhost', '2020-12-26 11:12:20', '2020-12-29 04:14:48', '210', '4a1cd5595f779370b54e6bb0fd6a1e61', '10000', '2020-12-29 19:14:49', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Quochoi', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-26 11:51:45', '2020-12-26 11:51:45', '211', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('phamhai', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-27 12:10:11', '2020-12-27 12:10:11', '212', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('kunlly', 'cacfa744da88e413c475d9968b024320', 'lovelu', 'localhost', '2020-12-27 12:30:26', '2020-12-27 12:30:26', '213', '15de37918b8191ad21a72918bf6585a9', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('kunlly95', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-27 12:35:28', '2020-12-27 12:35:28', '214', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Mmfluv', '267ccdcccad39d9fdb620f0b748db137', '260102', 'localhost', '2020-12-27 01:34:57', '2020-12-28 09:42:26', '215', '88919ca92a8011f4c16c15b517254301', '10000', '2020-12-29 00:42:27', null, '1', '0', '0');
INSERT INTO `account` VALUES ('mmfluv1', '267ccdcccad39d9fdb620f0b748db137', '260102', 'localhost', '2020-12-27 01:40:34', '2020-12-28 09:44:27', '216', '88919ca92a8011f4c16c15b517254301', '10000', '2020-12-29 00:44:27', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Vagabond1', 'df7d6778bf72262c33fe391e1299d4a5', 'Phong112233', 'localhost', '2020-12-27 02:44:55', '2020-12-27 02:44:55', '217', '00702aa2b12f355a8332ccea51fd7461', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('daicabi123', '36ed58c5c14dc2f58eef099585d2a939', 'long123', 'localhost', '2020-12-27 05:35:44', '2020-12-27 05:35:44', '218', 'b01ad2d01d3e23951e85616e17528f51', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Tanglanh', '090d01b6fcba65a7fd058c76ed41598b', 'tanglanh', 'localhost', '2020-12-27 08:00:38', '2020-12-29 06:22:06', '219', 'd1224be38486e53f15292495c6637073', '10000', '2020-12-29 21:22:06', null, '1', '0', '0');
INSERT INTO `account` VALUES ('v97k10', 'ba1a55183627ffad6348c5192a03b8fc', '0hatprokv123', 'localhost', '2020-12-27 08:21:57', '2020-12-27 08:21:57', '220', 'c955789123a09eb0a87f8da32ca31f43', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('v97k101', 'cd15900c7957dbec5cf1b2bdc67987a4', 'Phatprokv123', 'localhost', '2020-12-27 08:45:05', '2020-12-27 08:45:05', '221', 'ae6f762101b98d71877ecdb256c9e808', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Sompro1', 'c7931bc7e26b0f242de7414b86f9ffcc', 'anhvip', 'localhost', '2020-12-27 09:41:17', '2020-12-27 09:41:17', '222', '343aa4f20e4820eea9efbbabbfee683f', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Sompro123', 'c7931bc7e26b0f242de7414b86f9ffcc', 'anhvip', 'localhost', '2020-12-27 09:42:42', '2020-12-27 09:42:42', '223', '343aa4f20e4820eea9efbbabbfee683f', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Prokhang456', 'b43624b526a12930e6492b05acaf7482', '568883', 'localhost', '2020-12-27 11:26:51', '2020-12-27 11:26:51', '224', '26043195e694ce23392dfee4012f1eb5', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('lathang96nb', '882b1ab6774d57a42ea818fa9390ca96', 'lathang96nb', 'localhost', '2020-12-27 12:08:04', '2020-12-27 12:08:04', '225', '63babe967d0419a0b32fd7b5674a7d38', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('tranvu73', 'b6c254922f2d811f3302c6a70b6f74bf', 'vulaboy73', 'localhost', '2020-12-27 12:27:04', '2020-12-27 12:27:04', '226', '9c5fb91d379475dbea95662a700261cf', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('huytanpk02', '445e679f1682ac1c3cca128dd3f59eb7', 'huytan1', 'localhost', '2020-12-27 12:43:37', '2020-12-27 12:43:37', '227', '6932e0231aaef4f86a3a9d4344d0c4ab', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('zz252513', '19ede66f218015fd9df85ac886488926', 'zz123456', 'localhost', '2020-12-27 01:59:32', '2020-12-27 01:59:32', '228', '8b9f166fdfd74117ca93c98c6833053e', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Ltn1210', '4640895bf3164d49d29b518a3237695f', 'ltn2001', 'localhost', '2020-12-27 02:58:46', '2020-12-27 02:58:46', '229', 'cc470d33eaec77a4a4754a0e3eaf974e', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Vn1206', '2818c3b91d777c28cfb7472d0d0a0731', 'vuong1206', 'localhost', '2020-12-27 03:38:02', '2020-12-27 03:38:02', '230', 'f5613b787f5e38643a160d9d5f540ef7', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('emcuilam', '77c358909a4e04c6711d64b84e773654', 'minhtan', 'localhost', '2020-12-27 10:22:34', '2020-12-27 10:22:34', '231', 'b5c37a81080f86988494656319779e63', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('hungdume', '15f8182445bac21b05802649a8a698e7', 'anhtuan', 'localhost', '2020-12-28 02:25:39', '2020-12-28 02:25:39', '232', 'cbbba31558f1bd2c6a0a014ba933e381', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('dangtu92', 'f30c2690012ee3fafbb20547da96e748', 'anhtubnmm', 'localhost', '2020-12-28 02:41:47', '2020-12-28 14:24:43', '233', '5689ada2cc6d995cdeb9569c03607e89', '10000', '2020-12-29 05:24:43', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Minhthat1997', 'ee83570cf7cf60d5dc6638fbf40bc999', 'minhthat', 'localhost', '2020-12-28 07:22:25', '2020-12-28 07:22:25', '234', 'e4c1bc4471121765a532db7ddd51b11f', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('cuongh1', 'afa0a150d949ee8e9c2f2b71273050a3', 'cuongdaica', 'localhost', '2020-12-28 02:54:10', '2020-12-28 02:54:10', '235', 'ca5860b56262a2c6cd51ec4d9acb2ed2', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('333266362', '5abd06d6f6ef0e022e11b8a41f57ebda', 'qqq111', 'localhost', '2020-12-28 03:11:58', '2020-12-28 03:11:58', '236', '45de572025ede743a71b6873db7226a8', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('congproqn', '66207e82c85a5050ff71c4665b6c7709', '100463', 'localhost', '2020-12-28 05:05:08', '2020-12-28 05:05:08', '237', '8dfdca7c075a2855cd73f81da6ab0946', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('chienquoc1', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-28 05:19:28', '2020-12-28 05:19:28', '238', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('khanhqpz9', 'c4480e84d510ed273fa1b99fa0581b67', '01228170594', 'localhost', '2020-12-28 06:18:05', '2020-12-28 21:37:54', '239', 'b9e9cd6d723dfa3484a62e84110bc8b9', '10000', '2020-12-29 12:37:54', null, '1', '0', '0');
INSERT INTO `account` VALUES ('PoorSin', '0c5e9869fe6fb87699f92a0767f9712a', 'qeadzc', 'localhost', '2020-12-28 07:26:01', '2020-12-29 14:48:16', '240', '23abaea32523429b6ac631a84f5a2ec1', '10000', '2020-12-30 05:48:16', null, '1', '0', '0');
INSERT INTO `account` VALUES ('odd333666', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-28 07:41:03', '2020-12-28 07:41:03', '241', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Acestop', '875f26fdb1cecf20ceb4ca028263dec6', 'bbbbbb', 'localhost', '2020-12-28 07:59:56', '2020-12-28 07:59:56', '242', '8cc490f02e512655e96f62159ea835cf', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('sangmlml', '02c75fb22c75b23dc963c7eb91a062cc', 'zxcvbnm', 'localhost', '2020-12-28 08:55:06', '2020-12-28 08:55:06', '243', 'd221358fbc772e81d87f0a5e60057e59', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('shizuka', '884febd8d9c6636d92a0d12669fe4e03', '7614825', 'localhost', '2020-12-28 10:23:44', '2020-12-28 16:23:54', '244', 'dfe81ea096544b0303e46bbe4ac292a0', '10000', '2020-12-29 07:23:54', null, '1', '0', '0');
INSERT INTO `account` VALUES ('147289', '6c100265d3c1b160ac4808b884fdefda', '147289', 'localhost', '2020-12-29 12:46:56', '2020-12-29 12:46:56', '245', 'b4e2359a20ffa1dd41d87e2f93a4a2ec', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('admin', '9047415e11d3e935fed6c3d0bbbcaa10', '123Qaz!@#,./', null, null, null, '246', '123Qaz!@#,./', '0', null, 'admin@gmail.com', '2', '0', '0');
INSERT INTO `account` VALUES ('testgame123', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-29 01:18:37', '2020-12-29 01:18:37', '247', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('kenzolak99', '2cdeddc8d73c51ad0f48765fafa68129', '301199', 'localhost', '2020-12-29 02:26:57', '2020-12-28 10:33:36', '248', 'bf76e3e46b82776068aac1db1272bb85', '10000', '2020-12-29 01:33:36', null, '1', '0', '0');
INSERT INTO `account` VALUES ('dat2708', 'ded2b2e92cd0cd0e0ef49976063ecd24', '18082003', 'localhost', '2020-12-29 05:00:28', '2020-12-28 13:03:36', '249', '2658e5232a976528ce5666002f959f88', '10000', '2020-12-29 04:03:36', null, '1', '0', '0');
INSERT INTO `account` VALUES ('sonduong2709', '312514840805d450533970f489f59285', 'sonduong2005', 'localhost', '2020-12-29 05:48:33', '2020-12-28 13:51:23', '250', 'ca8139cf380c80db94f582c3b99ca198', '10000', '2020-12-29 04:51:23', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Rozas111', 'e36a688e4838c0f47f7eca369706d43b', 'hieu123', 'localhost', '2020-12-29 08:59:30', '2020-12-28 17:04:00', '251', '1d35c4624de2edd368d28a4cf9b07440', '10000', '2020-12-29 08:04:01', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Shozoendo', '96e79218965eb72c92a549dd5a330112', '111111', 'localhost', '2020-12-29 12:27:57', '2020-12-29 00:05:55', '252', '9d9048fac7dd3f5875b7e6e694035fed', '10000', '2020-12-29 15:05:56', null, '1', '0', '0');
INSERT INTO `account` VALUES ('dnan19871', '203e6cf2f8d7e427b03a0bee71e53220', 'dnan123', 'localhost', '2020-12-29 01:48:51', '2020-12-28 22:00:07', '253', '9ddf3654b6019f28e18f21b63cade021', '10000', '2020-12-29 13:00:08', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Mitdoc', 'd8d252f676c00c5ebddc3b9143fe11dc', 'mitdoc', 'localhost', '2020-12-29 02:19:25', '2020-12-28 22:25:18', '254', '49dda8f9b0a6c4ddd516293366f017c8', '10000', '2020-12-29 13:25:19', null, '1', '0', '0');
INSERT INTO `account` VALUES ('188772', 'bf6f45be5016aa1b2054dd603d7005d8', '188837', 'localhost', '2020-12-29 02:40:31', '2020-12-29 02:40:31', '255', '671938d41d30165d79f5fabdf346ba20', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('123456', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-29 02:40:50', '2020-12-29 02:40:50', '256', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Shozoendo1', '96e79218965eb72c92a549dd5a330112', '111111', 'localhost', '2020-12-29 04:06:06', '2020-12-29 02:35:56', '257', '9d9048fac7dd3f5875b7e6e694035fed', '10000', '2020-12-29 17:35:56', null, '1', '0', '0');
INSERT INTO `account` VALUES ('quaanhla', '124bd1296bec0d9d93c7b52a71ad8d5b', '0123456', 'localhost', '2020-12-29 11:39:40', '2020-12-29 07:56:56', '258', 'e2684ca728c13fa36dfbd5705cd1fcea', '10000', '2020-12-29 22:56:57', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Huadungne', '2edaaea87c979e577779e6554dea8f1c', '01326363', 'localhost', '2020-12-30 12:46:48', '2020-12-30 12:46:48', '259', 'd29fa643796b213997de941af4a0e513', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('Huadungne022', '785844c29d18619d006f0f39c119283c', '01226363', 'localhost', '2020-12-30 12:50:38', '2020-12-30 12:50:38', '260', 'b27f9c11d52c8c96fdf577ed6b118b53', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('harusayoyo', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-30 09:58:27', '2020-12-29 18:00:54', '261', '030b666836c7daa76edb20737a5cd725', '10000', '2020-12-30 09:00:55', null, '1', '0', '0');
INSERT INTO `account` VALUES ('Kids2hnx1', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'localhost', '2020-12-30 02:09:09', '2020-12-30 02:09:09', '262', '030b666836c7daa76edb20737a5cd725', '10000', null, null, '1', '0', '0');
INSERT INTO `account` VALUES ('0981894831', '1cda821bc81e90543dc3ea53f345f9ac', 'mimonsa0', 'localhost', '2020-12-30 05:01:08', '2020-12-30 05:01:08', '263', 'f5aa9adf45dd4aea5c32647228b37d11', '10000', null, null, '1', '0', '0');

-- ----------------------------
-- Table structure for app_properties
-- ----------------------------
DROP TABLE IF EXISTS `app_properties`;
CREATE TABLE `app_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_app` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value_app` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of app_properties
-- ----------------------------
INSERT INTO `app_properties` VALUES ('1', 'CHARGE_CARD', '1', 'Rate charge card', null, '2020-12-28 23:57:16', null, '2020-12-28 23:57:16');
INSERT INTO `app_properties` VALUES ('2', 'CHARGE_MOMO', '1.5', 'Rate charge momo', null, '2020-12-28 23:57:16', null, '2020-12-28 23:57:16');

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------
INSERT INTO `databasechangelog` VALUES ('20201227112500-1', 'DoKD', 'db/changelog/20190323134000_add_entity_user.xml', '2020-12-28 08:57:00', '1', 'EXECUTED', '8:69fc9ea9991cc859474acd2971b88a0f', 'addColumn tableName=account', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20190323135000-1', 'dokd', 'db/changelog/20190323135000_add_entity_role.xml', '2020-12-28 08:57:00', '2', 'EXECUTED', '8:409d7652dcb56a9a62dcb2b9b6908d21', 'createTable tableName=roles', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20190323140000-1', 'dokd', 'db/changelog/20190323140000_add_entity_token.xml', '2020-12-28 08:57:00', '3', 'EXECUTED', '8:29019f4f365b67c74c660fda5c2b8ede', 'createTable tableName=token', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20190323134000-1', 'dokd', 'db/changelog/20190524115500_add_entity_wallet_user.xml', '2020-12-28 08:57:00', '4', 'EXECUTED', '8:1460b5a748b23f2f7a81728358ae2671', 'createTable tableName=wallet_user', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20190525000000-1', 'dokd', 'db/changelog/20190525000000_add_entity_point_history.xml', '2020-12-28 08:57:00', '5', 'EXECUTED', '8:643fc785139d80f73c3403cd7fffe37e', 'createTable tableName=point_history', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20201018222000-1', 'DoKD', 'db/changelog/20190525000000_add_entity_point_history.xml', '2020-12-28 08:57:00', '6', 'EXECUTED', '8:1930b1303fd4c34b07b702bc4449ec13', 'addColumn tableName=point_history', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20190526000000-1', 'dokd', 'db/changelog/20190526000000_add_entity_app_properties.xml', '2020-12-28 08:57:00', '7', 'EXECUTED', '8:39e1fedfac13309fae95da5cd07de131', 'createTable tableName=app_properties', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20190526113000-1', 'dokd', 'db/changelog/20190526113000_add_entity_server.xml', '2020-12-28 08:57:00', '8', 'EXECUTED', '8:c1c480a4ab7e290023c7ad4e15717930', 'createTable tableName=server', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20200806010700-1', 'dokd', 'db/changelog/20190526113000_add_entity_server.xml', '2020-12-28 08:57:00', '9', 'EXECUTED', '8:e84bdcfeb455aad4c0d7afd0f0ed3df0', 'addColumn tableName=server', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20200806010700-2', 'dokd', 'db/changelog/20190526113000_add_entity_server.xml', '2020-12-28 08:57:01', '10', 'EXECUTED', '8:667aae4dce7bb17c5b67995db6d14f99', 'addColumn tableName=server', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20191109112000-1', 'dokd', 'db/changelog/20191109112000_add_entity_gift_code.xml', '2020-12-28 08:57:01', '11', 'EXECUTED', '8:6e6595d61c6651c4332f3af5786e9e94', 'createTable tableName=gift_code', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20201228114000-1', 'DoKD', 'db/changelog/20191109112000_add_entity_gift_code.xml', '2020-12-28 08:57:01', '12', 'EXECUTED', '8:0febfee338bfea85e6c1b17759405cf6', 'addColumn tableName=gift_code', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20191116122000-1', 'dokd', 'db/changelog/20191109112000_add_entity_gift_code_log.xml', '2020-12-28 08:57:01', '13', 'EXECUTED', '8:54b7ff1706a7e1f50ca0ac344a6e69fa', 'createTable tableName=gift_code_log', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20191109112000-1', 'dokd', 'db/changelog/20200806161500_add_entity_package_charge.xml', '2020-12-28 08:57:01', '14', 'EXECUTED', '8:5a6c3ecf3f69c1c6fe6870653e0ee23d', 'createTable tableName=package_charge', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20201228121500-1', 'DoKD', 'db/changelog/20200806161500_add_entity_package_charge.xml', '2020-12-28 08:57:01', '15', 'EXECUTED', '8:0c8533efa28a83f515aa9b0ae457fae2', 'addColumn tableName=package_charge', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20191109112000-1', 'dokd', 'db/changelog/20200806161500_add_entity_package_charge_history.xml', '2020-12-28 08:57:01', '16', 'EXECUTED', '8:f87ad2ab8005cac64ac6f90007614fed', 'createTable tableName=package_charge_history', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20201016003000-1', 'DoKD', 'db/changelog/20200806161500_add_entity_package_charge_history.xml', '2020-12-28 08:57:01', '17', 'EXECUTED', '8:71d4282e6f510c0991a429881cbce942', 'addColumn tableName=package_charge_history', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20201016003000-2', 'DoKD', 'db/changelog/20200806161500_add_entity_package_charge_history.xml', '2020-12-28 08:57:01', '18', 'EXECUTED', '8:7a1fe799830b84af86904af4cb3d3bf6', 'addColumn tableName=package_charge_history', '', null, '3.8.9', null, null, '9174620197');
INSERT INTO `databasechangelog` VALUES ('20201015223500-1', 'dokd', 'db/changelog/20201015223500_add_entity_notification.xml', '2020-12-28 08:57:01', '19', 'EXECUTED', '8:ea41d5301e5edf74b1eaff3089396a09', 'createTable tableName=notification', '', null, '3.8.9', null, null, '9174620197');

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES ('1', '\0', null, null);

-- ----------------------------
-- Table structure for gift_code
-- ----------------------------
DROP TABLE IF EXISTS `gift_code`;
CREATE TABLE `gift_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `expression` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `server_id` int(11) DEFAULT NULL,
  `code_type` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT '10000',
  `user_ids` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hidden` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of gift_code
-- ----------------------------
INSERT INTO `gift_code` VALUES ('1', 'CODE_TANTHU', '10 triệu đồng, 5 triệu KNB', '1_1_100000000|1_2_1000000000|1_4_1000000000', '1', '2020-12-28 23:22:35', '2021-12-31 23:22:36', '1', '1', '10000', '', '0');
INSERT INTO `gift_code` VALUES ('2', 'CODE_TEST', '10 triệu đồng, 5 triệu KNB', '1_1_50000|1_2_50000', '1', '2020-12-28 23:22:35', '2021-12-31 23:22:36', '1', '1', '10000', '', '1');

-- ----------------------------
-- Table structure for gift_code_log
-- ----------------------------
DROP TABLE IF EXISTS `gift_code_log`;
CREATE TABLE `gift_code_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_id` int(11) NOT NULL,
  `member_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `server_id` int(11) NOT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `code_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of gift_code_log
-- ----------------------------
INSERT INTO `gift_code_log` VALUES ('3', '1', '10000000011', '1', 'System', '2020-12-29 00:15:37', 'System', '2020-12-29 00:15:37', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('4', '1', '10000000104', '1', 'System', '2020-12-29 00:26:47', 'System', '2020-12-29 00:26:47', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('5', '1', '10000000025', '1', 'System', '2020-12-29 00:34:56', 'System', '2020-12-29 00:34:56', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('6', '1', '10000000186', '1', 'System', '2020-12-29 00:42:27', 'System', '2020-12-29 00:42:27', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('7', '1', '10000000060', '1', 'System', '2020-12-29 00:48:45', 'System', '2020-12-29 00:48:45', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('8', '1', '10000000171', '1', 'System', '2020-12-29 00:58:29', 'System', '2020-12-29 00:58:29', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('9', '1', '10000000131', '1', 'System', '2020-12-29 01:35:55', 'System', '2020-12-29 01:35:55', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('10', '1', '10000000212', '1', 'System', '2020-12-29 04:03:36', 'System', '2020-12-29 04:03:36', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('11', '1', '10000000063', '1', 'System', '2020-12-29 04:28:08', 'System', '2020-12-29 04:28:08', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('12', '1', '10000000213', '1', 'System', '2020-12-29 04:51:23', 'System', '2020-12-29 04:51:23', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('13', '1', '10000000089', '1', 'System', '2020-12-29 04:57:30', 'System', '2020-12-29 04:57:30', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('14', '1', '10000000177', '1', 'System', '2020-12-29 07:02:53', 'System', '2020-12-29 07:02:53', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('15', '1', '10000000208', '1', 'System', '2020-12-29 07:23:29', 'System', '2020-12-29 07:23:29', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('16', '1', '10000000120', '1', 'System', '2020-12-29 07:26:31', 'System', '2020-12-29 07:26:31', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('17', '1', '10000000065', '1', 'System', '2020-12-29 07:36:20', 'System', '2020-12-29 07:36:20', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('18', '1', '10000000051', '1', 'System', '2020-12-29 07:36:57', 'System', '2020-12-29 07:36:57', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('19', '1', '10000000214', '1', 'System', '2020-12-29 08:04:01', 'System', '2020-12-29 08:04:01', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('20', '1', '10000000106', '1', 'System', '2020-12-29 10:23:43', 'System', '2020-12-29 10:23:43', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('21', '1', '10000000087', '1', 'System', '2020-12-29 10:43:23', 'System', '2020-12-29 10:43:23', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('22', '1', '10000000121', '1', 'System', '2020-12-29 11:35:21', 'System', '2020-12-29 11:35:21', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('23', '1', '10000000205', '1', 'System', '2020-12-29 12:37:54', 'System', '2020-12-29 12:37:54', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('24', '1', '10000000098', '1', 'System', '2020-12-29 12:59:11', 'System', '2020-12-29 12:59:11', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('25', '1', '10000000215', '1', 'System', '2020-12-29 13:00:08', 'System', '2020-12-29 13:00:08', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('26', '1', '10000000036', '1', 'System', '2020-12-29 13:10:38', 'System', '2020-12-29 13:10:38', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('27', '1', '10000000216', '1', 'System', '2020-12-29 13:25:19', 'System', '2020-12-29 13:25:19', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('28', '1', '10000000066', '1', 'System', '2020-12-29 13:59:22', 'System', '2020-12-29 13:59:22', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('29', '1', '10000000218', '1', 'System', '2020-12-29 14:46:30', 'System', '2020-12-29 14:46:30', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('30', '1', '10000000219', '1', 'System', '2020-12-29 15:07:13', 'System', '2020-12-29 15:07:13', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('31', '1', '10000000015', '1', 'System', '2020-12-29 16:50:22', 'System', '2020-12-29 16:50:22', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('32', '1', '10000000183', '1', 'System', '2020-12-29 19:14:49', 'System', '2020-12-29 19:14:49', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('33', '1', '10000000189', '1', 'System', '2020-12-29 21:22:06', 'System', '2020-12-29 21:22:06', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('34', '1', '10000000220', '1', 'System', '2020-12-29 22:40:57', 'System', '2020-12-29 22:40:57', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('35', '1', '10000000169', '1', 'System', '2020-12-29 23:47:28', 'System', '2020-12-29 23:47:28', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('36', '1', '10000000206', '1', 'System', '2020-12-30 05:46:58', 'System', '2020-12-30 05:46:58', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('37', '1', '10000000223', '1', 'System', '2020-12-30 09:00:55', 'System', '2020-12-30 09:00:55', 'CODE_TANTHU');
INSERT INTO `gift_code_log` VALUES ('38', '1', '10000000125', '1', 'System', '2020-12-30 09:57:03', 'System', '2020-12-30 09:57:03', 'CODE_TANTHU');

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(3000) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of notification
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of package_charge
-- ----------------------------
INSERT INTO `package_charge` VALUES ('2', 'Gói nạp 600KNB', '0', '1_1_10|1_2_100', '5000', '1', '', '2020-12-28 23:57:59', '', '2020-12-28 23:57:59', '600');
INSERT INTO `package_charge` VALUES ('3', 'Gói nạp 1200KNB', '0', '0', '10000', '1', '', '2020-12-28 23:57:59', '', '2020-12-28 23:57:59', '1200');
INSERT INTO `package_charge` VALUES ('4', 'Gói nạp 3000 KNB', '0', '0', '20000', '1', '', '2020-12-28 23:57:59', '', '2020-12-28 23:57:59', '3000');
INSERT INTO `package_charge` VALUES ('5', 'Gói nạp 6800 KNB', '0', '0', '30000', '1', '', '2020-12-28 23:57:59', '', '2020-12-28 23:57:59', '6800');
INSERT INTO `package_charge` VALUES ('6', 'Gói nạp 19800 KNB', '0', '0', '50000', '1', '', '2020-12-28 23:57:59', '', '2020-12-28 23:57:59', '19800');
INSERT INTO `package_charge` VALUES ('7', 'Gói nạp 32800 KNb', '0', '0', '100000', '1', '', '2020-12-28 23:57:59', '', '2020-12-28 23:57:59', '32800');
INSERT INTO `package_charge` VALUES ('8', 'Gói nạp 64800 KNB', '0', '0', '150000', '1', '', '2020-12-28 23:57:59', '', '2020-12-28 23:57:59', '64800');
INSERT INTO `package_charge` VALUES ('9', 'Thẻ tháng', '0', '0', '20000', '1', '', '2020-12-28 23:57:59', '', '2020-12-28 23:57:59', '3000');
INSERT INTO `package_charge` VALUES ('10', 'Thẻ trọn đời', '0', '0', '50000', '0', '', '2020-12-28 23:57:59', '', '2020-12-28 23:57:59', '8800');

-- ----------------------------
-- Table structure for package_charge_history
-- ----------------------------
DROP TABLE IF EXISTS `package_charge_history`;
CREATE TABLE `package_charge_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_charge_id` int(11) NOT NULL,
  `package_charge_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `player_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `player_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msg_resp_charge` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msg_resp_mail` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of package_charge_history
-- ----------------------------
INSERT INTO `package_charge_history` VALUES ('1', '2', 'Gói nạp 600KNB', '27', '5000', 'nhokkokhoc', '2020-12-29 00:11:42', 'nhokkokhoc', '2020-12-29 00:11:42', '10000000011', 'KillVn', 'ShineIOT 1', '{\"gold\":\"600\",\"isFirst\":\"1\",\"errorCode\":\"0\",\"orderNum\":\"16091755005485935117612764e3e860140237132f035\"}', '10001');

-- ----------------------------
-- Table structure for point_history
-- ----------------------------
DROP TABLE IF EXISTS `point_history`;
CREATE TABLE `point_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `transaction_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `wallet_user_id` int(11) NOT NULL,
  `old_point` int(11) DEFAULT NULL,
  `new_point` int(11) NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `notes` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `rate_charge` double DEFAULT '1',
  `package_id` int(11) DEFAULT '0',
  `package_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_price` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of point_history
-- ----------------------------
INSERT INTO `point_history` VALUES ('1', '27', 'BUY_GOLD', '0', '9999999', '9994999', '5000', null, 'nhokkokhoc', '2020-12-29 00:11:42', 'nhokkokhoc', '2020-12-29 00:11:42', null, '2', 'Gói nạp 600KNB', '5000');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'USER', null, '2020-12-28 23:57:16', null, '2020-12-28 23:57:16');
INSERT INTO `roles` VALUES ('2', 'ADMIN', null, '2020-12-28 23:57:16', null, '2020-12-28 23:57:16');

-- ----------------------------
-- Table structure for server
-- ----------------------------
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_server` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `server_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `active_charge` int(11) DEFAULT '0',
  `db_host` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_user` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `db_password` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_api` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of server
-- ----------------------------
INSERT INTO `server` VALUES ('1', 'ShineIOT 1', '1', 'DoKD', '2020-12-28 00:02:52', 'DoKD', '2020-12-28 00:02:57', '1', 'jdbc:mysql://localhost:3306/sanguo_game', 'root', 'EghgTJGqPmZ9RQiW', 'http://localhost:19201/');
INSERT INTO `server` VALUES ('2', 'ShineIOT 2', '2', 'DoKD', '2020-12-28 00:02:52', 'DoKD', '2020-12-28 00:02:57', '0', 'jdbc:mysql://localhost:3306/sanguo_game2', 'root', 'EghgTJGqPmZ9RQiW', 'http://localhost:19202/');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `exp_date` datetime NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('1', 'nhokkokhoc', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuaG9ra29raG9jIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxNzQ3NTgsImV4cCI6MTYwOTYwNjc1OH0._x6ZEmUrVGKICxeNf5HLgJ2qXtJCBlwp4pnWGoFZPAE', '2021-01-02 23:59:19', '1', 'nhokkokhoc', '2020-12-28 23:59:19', 'nhokkokhoc', '2020-12-28 23:59:19');
INSERT INTO `token` VALUES ('2', 'nhokkokhoc', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuaG9ra29raG9jIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxNzU0NDQsImV4cCI6MTYwOTYwNzQ0NH0.-1kTxvHAfbFwzpSrxkJYdnZliuwNGw7nbrsBvCROa4I', '2021-01-03 00:10:45', '1', 'nhokkokhoc', '2020-12-29 00:10:45', 'nhokkokhoc', '2020-12-29 00:10:45');
INSERT INTO `token` VALUES ('3', 'denysusanto', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkZW55c3VzYW50byIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MTc2MjM3LCJleHAiOjE2MDk2MDgyMzd9.9GhM2yjaaXSRC7mFpqo8U23iCaKOxOWwxYZ8U6RWSOQ', '2021-01-03 00:23:58', '1', 'denysusanto', '2020-12-29 00:23:58', 'denysusanto', '2020-12-29 00:23:58');
INSERT INTO `token` VALUES ('4', 'Langlas', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJMYW5nbGFzIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxNzYyODYsImV4cCI6MTYwOTYwODI4Nn0.xbZG1lExTMT-h17udY_u6HZpAYETye0Fd9lqqLK30z0', '2021-01-03 00:24:46', '1', 'Langlas', '2020-12-29 00:24:46', 'Langlas', '2020-12-29 00:24:46');
INSERT INTO `token` VALUES ('5', 'denysusanto', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkZW55c3VzYW50byIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MTc2Mjg4LCJleHAiOjE2MDk2MDgyODh9.6ESEOlyILOQBq3ovb4nnWoPMWFLzRxH1b7oe4MX0oE8', '2021-01-03 00:24:49', '1', 'denysusanto', '2020-12-29 00:24:49', 'denysusanto', '2020-12-29 00:24:49');
INSERT INTO `token` VALUES ('6', 'denysusanto', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkZW55c3VzYW50byIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MTc2MzY0LCJleHAiOjE2MDk2MDgzNjR9.z7iP2ZWr12HmE0aR5Qc0unUGbYmEvehFObn4d_GdHkY', '2021-01-03 00:26:05', '1', 'denysusanto', '2020-12-29 00:26:05', 'denysusanto', '2020-12-29 00:26:05');
INSERT INTO `token` VALUES ('7', 'xhau303', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ4aGF1MzAzIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxNzY4MzYsImV4cCI6MTYwOTYwODgzNn0.PotzOrlJsWNQAJ0kYTIEkBjnYJ55PFoTQRSCzPEaWnc', '2021-01-03 00:33:56', '1', 'xhau303', '2020-12-29 00:33:56', 'xhau303', '2020-12-29 00:33:56');
INSERT INTO `token` VALUES ('8', 'mmfluv', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtbWZsdXYiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTE3NzIzNCwiZXhwIjoxNjA5NjA5MjM0fQ.NJAa5temF0IfyIDZhv-R-owa2JXgmw2rEL2Qdo6a-tA', '2021-01-03 00:40:35', '1', 'mmfluv', '2020-12-29 00:40:35', 'mmfluv', '2020-12-29 00:40:35');
INSERT INTO `token` VALUES ('9', 'mmfluv1', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtbWZsdXYxIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxNzc0MzUsImV4cCI6MTYwOTYwOTQzNX0.HapS54fnH6PydnZBa8dsImg6bedrjws7pSrL5VY4sTw', '2021-01-03 00:43:55', '1', 'mmfluv1', '2020-12-29 00:43:55', 'mmfluv1', '2020-12-29 00:43:55');
INSERT INTO `token` VALUES ('10', 'Ltn121001', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJMdG4xMjEwMDEiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTE3NzY2MywiZXhwIjoxNjA5NjA5NjYzfQ.L86QSoTpvizwA99rMy6DGkJuxU8sX548H7sJSShwGCk', '2021-01-03 00:47:43', '1', 'Ltn121001', '2020-12-29 00:47:43', 'Ltn121001', '2020-12-29 00:47:43');
INSERT INTO `token` VALUES ('11', 'Djvipprodk1', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJEanZpcHByb2RrMSIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MTc4MjczLCJleHAiOjE2MDk2MTAyNzN9.e1sLPKAnId2aAZP452l3-O8Me2ztlI48d6kmOBWW2z0', '2021-01-03 00:57:54', '1', 'Djvipprodk1', '2020-12-29 00:57:54', 'Djvipprodk1', '2020-12-29 00:57:54');
INSERT INTO `token` VALUES ('12', 'Hoang95', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIb2FuZzk1Iiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxODAxNTcsImV4cCI6MTYwOTYxMjE1N30.ylBUbyXbOaWgKe1i3ps1f8Pv6OmK3c9MSO2Zo8Vy8b4', '2021-01-03 01:29:18', '1', 'Hoang95', '2020-12-29 01:29:18', 'Hoang95', '2020-12-29 01:29:18');
INSERT INTO `token` VALUES ('13', 'kenzolak99', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJrZW56b2xhazk5Iiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxODAyMzUsImV4cCI6MTYwOTYxMjIzNX0._qCUtLvpgWO6unbzvaE6W-OspeDWneXsofYj-dY5k1k', '2021-01-03 01:30:35', '1', 'kenzolak99', '2020-12-29 01:30:35', 'kenzolak99', '2020-12-29 01:30:35');
INSERT INTO `token` VALUES ('14', 'Hoang95', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIb2FuZzk1Iiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxODA0OTMsImV4cCI6MTYwOTYxMjQ5M30.ozkX8xqZhMMd9zoShQXf2MR7u3ufEHoD7qhE-FfxmIY', '2021-01-03 01:34:53', '1', 'Hoang95', '2020-12-29 01:34:53', 'Hoang95', '2020-12-29 01:34:53');
INSERT INTO `token` VALUES ('15', 'saintmark', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWludG1hcmsiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTE4MTU5NiwiZXhwIjoxNjA5NjEzNTk2fQ.0UQAP-WQvgrXvrc4qXfsg3LJhFSLUHXcxMhFF9amXO0', '2021-01-03 01:53:16', '1', 'saintmark', '2020-12-29 01:53:16', 'saintmark', '2020-12-29 01:53:16');
INSERT INTO `token` VALUES ('16', 'vssassoon', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ2c3Nhc3Nvb24iLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTE4MTYyMSwiZXhwIjoxNjA5NjEzNjIxfQ.60pN6cFAzd1AbrcfjRSzZDwGKfuUhqxQGuLo80klf1g', '2021-01-03 01:53:41', '1', 'vssassoon', '2020-12-29 01:53:41', 'vssassoon', '2020-12-29 01:53:41');
INSERT INTO `token` VALUES ('17', 'saintmark', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWludG1hcmsiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTE4MTYyNywiZXhwIjoxNjA5NjEzNjI3fQ.AMFXXldZey5PLQ3u0TBElUD4fRT0WZaorENVKP8gGc0', '2021-01-03 01:53:48', '1', 'saintmark', '2020-12-29 01:53:48', 'saintmark', '2020-12-29 01:53:48');
INSERT INTO `token` VALUES ('18', 'saintmark', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWludG1hcmsiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTE4MTg2NSwiZXhwIjoxNjA5NjEzODY1fQ.5mDAvN8CiqA-2qZoGKJjOLMNtJUE0vKh2mdc6COkfG4', '2021-01-03 01:57:46', '1', 'saintmark', '2020-12-29 01:57:46', 'saintmark', '2020-12-29 01:57:46');
INSERT INTO `token` VALUES ('19', 'saintmark', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWludG1hcmsiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTE4MTg4MiwiZXhwIjoxNjA5NjEzODgyfQ.oAUK9lzj1iDtfr3fN2MXFsB_rIFFfOE-K3EOwfoejek', '2021-01-03 01:58:03', '1', 'saintmark', '2020-12-29 01:58:03', 'saintmark', '2020-12-29 01:58:03');
INSERT INTO `token` VALUES ('20', 'dat2708', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkYXQyNzA4Iiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxODkzNTIsImV4cCI6MTYwOTYyMTM1Mn0.mjw-unjIweFtaSnPLjhZDmPcRBiGNPZjeLguk-nbRgE', '2021-01-03 04:02:33', '1', 'dat2708', '2020-12-29 04:02:33', 'dat2708', '2020-12-29 04:02:33');
INSERT INTO `token` VALUES ('21', 'ogo002', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJvZ28wMDIiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTE5MDgzMCwiZXhwIjoxNjA5NjIyODMwfQ.KvyQyDqO5YFsQUW5qyBYP4JI3v8NRV_4ho4uGGp7KUE', '2021-01-03 04:27:11', '1', 'ogo002', '2020-12-29 04:27:11', 'ogo002', '2020-12-29 04:27:11');
INSERT INTO `token` VALUES ('22', 'Duyminhhbu', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJEdXltaW5oaGJ1Iiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxOTE5MDEsImV4cCI6MTYwOTYyMzkwMX0.bEw_qEqFryNmvs6mRU21zJz9axaFabH6onoyhqRSgnQ', '2021-01-03 04:45:01', '1', 'Duyminhhbu', '2020-12-29 04:45:01', 'Duyminhhbu', '2020-12-29 04:45:01');
INSERT INTO `token` VALUES ('23', 'sonduong2709', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzb25kdW9uZzI3MDkiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTE5MjI0NCwiZXhwIjoxNjA5NjI0MjQ0fQ.iYuoftnSiF0cnBTElNPGdVbIXNbiSu2ej9CUHK-vt0Y', '2021-01-03 04:50:44', '1', 'sonduong2709', '2020-12-29 04:50:44', 'sonduong2709', '2020-12-29 04:50:44');
INSERT INTO `token` VALUES ('24', 'duyminhhbu', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkdXltaW5oaGJ1Iiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxOTI2MTYsImV4cCI6MTYwOTYyNDYxNn0.hDURu1hFeXHeFgxkYiD9R5YxMD0fkMXQxk5oyZPgOyM', '2021-01-03 04:56:56', '1', 'duyminhhbu', '2020-12-29 04:56:56', 'duyminhhbu', '2020-12-29 04:56:56');
INSERT INTO `token` VALUES ('25', 'dangtu92', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkYW5ndHU5MiIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MTk0MjEyLCJleHAiOjE2MDk2MjYyMTJ9.rmjO_Eu0aYuRl3HJvJ8eE_CRwQltgWbkdLABN3-e9jU', '2021-01-03 05:23:33', '1', 'dangtu92', '2020-12-29 05:23:33', 'dangtu92', '2020-12-29 05:23:33');
INSERT INTO `token` VALUES ('26', 'Hoang95', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIb2FuZzk1Iiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxOTQ4MDUsImV4cCI6MTYwOTYyNjgwNX0.F4TdAenUP1MgIUQ5D0SV7zbZ97MmG8HA-wdAHbgPnH8', '2021-01-03 05:33:25', '1', 'Hoang95', '2020-12-29 05:33:25', 'Hoang95', '2020-12-29 05:33:25');
INSERT INTO `token` VALUES ('27', 'sonduong2709', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzb25kdW9uZzI3MDkiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTE5NTE1MiwiZXhwIjoxNjA5NjI3MTUyfQ.-JjSVkkLCy_xNLXyXWL7qOYuMjPOYqoNMi1vCC9HspY', '2021-01-03 05:39:13', '1', 'sonduong2709', '2020-12-29 05:39:13', 'sonduong2709', '2020-12-29 05:39:13');
INSERT INTO `token` VALUES ('28', 'Poorsin', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQb29yc2luIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxOTU4MDksImV4cCI6MTYwOTYyNzgwOX0.9LGDsLSSB5CPvOQabKbiy4gUt2c_cPdp51jZkQazs8Q', '2021-01-03 05:50:10', '1', 'Poorsin', '2020-12-29 05:50:10', 'Poorsin', '2020-12-29 05:50:10');
INSERT INTO `token` VALUES ('29', 'nhannguquen', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuaGFubmd1cXVlbiIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MTk2Mjg1LCJleHAiOjE2MDk2MjgyODV9.WKHpFiSAbyIQtzOcqXSQiFxdyvI0MQF9itwUJIfpZWs', '2021-01-03 05:58:06', '1', 'nhannguquen', '2020-12-29 05:58:06', 'nhannguquen', '2020-12-29 05:58:06');
INSERT INTO `token` VALUES ('30', 'Poorsin', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQb29yc2luIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkxOTc3NzIsImV4cCI6MTYwOTYyOTc3Mn0.Bfup9nDZrSiR9yRK0Z1266Qr_CpZA2nrO2TeSR0qJEg', '2021-01-03 06:22:53', '1', 'Poorsin', '2020-12-29 06:22:53', 'Poorsin', '2020-12-29 06:22:53');
INSERT INTO `token` VALUES ('31', 'Gemman9x', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJHZW1tYW45eCIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MTk4Mjc4LCJleHAiOjE2MDk2MzAyNzh9.jKuZCChDIHDkmtYKM5b0S6PtbQpHhjfizJZO5gMNyrg', '2021-01-03 06:31:19', '1', 'Gemman9x', '2020-12-29 06:31:19', 'Gemman9x', '2020-12-29 06:31:19');
INSERT INTO `token` VALUES ('32', 'Bactinh', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCYWN0aW5oIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMDAxNDAsImV4cCI6MTYwOTYzMjE0MH0.3HBRRUi4SZK4vGuSDeoYcghxF6VRjk3K-4af5-l_sLE', '2021-01-03 07:02:21', '1', 'Bactinh', '2020-12-29 07:02:21', 'Bactinh', '2020-12-29 07:02:21');
INSERT INTO `token` VALUES ('33', 'Shizuka', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTaGl6dWthIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMDEzNjgsImV4cCI6MTYwOTYzMzM2OH0.ZTL4s_UX98fLnh5Kpja5ArFbEyfYl7NqcFx2AdxwXag', '2021-01-03 07:22:49', '1', 'Shizuka', '2020-12-29 07:22:49', 'Shizuka', '2020-12-29 07:22:49');
INSERT INTO `token` VALUES ('34', 'Gemman9x', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJHZW1tYW45eCIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjAxNTY1LCJleHAiOjE2MDk2MzM1NjV9.JeOPhHNQ8JfWPbVg_cJhjkJqTG5hJF31mVduvb64Rk8', '2021-01-03 07:26:05', '1', 'Gemman9x', '2020-12-29 07:26:05', 'Gemman9x', '2020-12-29 07:26:05');
INSERT INTO `token` VALUES ('35', 'Dpthanh', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJEcHRoYW5oIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMDE4MjksImV4cCI6MTYwOTYzMzgyOX0.2Gcdd9sKPXC1PFliKRc4itlJRZWv0qYbtBjCRas6vHI', '2021-01-03 07:30:30', '1', 'Dpthanh', '2020-12-29 07:30:30', 'Dpthanh', '2020-12-29 07:30:30');
INSERT INTO `token` VALUES ('36', 'Dpthanh', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJEcHRoYW5oIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMDE4NjYsImV4cCI6MTYwOTYzMzg2Nn0.UyzhMEkHQRKddSEWmZzgj4znEWUjPBEcIMfmU-PHtsM', '2021-01-03 07:31:06', '1', 'Dpthanh', '2020-12-29 07:31:06', 'Dpthanh', '2020-12-29 07:31:06');
INSERT INTO `token` VALUES ('37', 'Kason003', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJLYXNvbjAwMyIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjAyMDgzLCJleHAiOjE2MDk2MzQwODN9.Z4B5m5_JJvW40PUpxp7_fuhchxzIJf1i85_NUYuQu-o', '2021-01-03 07:34:43', '1', 'Kason003', '2020-12-29 07:34:43', 'Kason003', '2020-12-29 07:34:43');
INSERT INTO `token` VALUES ('38', 'Dpthanh', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJEcHRoYW5oIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMDIxNzYsImV4cCI6MTYwOTYzNDE3Nn0.8lS4k7j7_FR9yoVuI6zpCMm4cPeU1euM7ihmhcbPi-4', '2021-01-03 07:36:17', '1', 'Dpthanh', '2020-12-29 07:36:17', 'Dpthanh', '2020-12-29 07:36:17');
INSERT INTO `token` VALUES ('39', 'Rozas999', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJSb3phczk5OSIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjAzNTI4LCJleHAiOjE2MDk2MzU1Mjh9.086chcCP2uhmIXY6FRuBGUrCoT_Ncj5Dc0qew8YJ2Ek', '2021-01-03 07:58:48', '1', 'Rozas999', '2020-12-29 07:58:48', 'Rozas999', '2020-12-29 07:58:48');
INSERT INTO `token` VALUES ('40', 'Rozas999', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJSb3phczk5OSIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjAzNjA0LCJleHAiOjE2MDk2MzU2MDR9.Jmybo3PFs0r-Ds_5KT0NL4B3ZceOleKE3ec-LbaznxA', '2021-01-03 08:00:05', '1', 'Rozas999', '2020-12-29 08:00:05', 'Rozas999', '2020-12-29 08:00:05');
INSERT INTO `token` VALUES ('41', 'Rozas111', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJSb3phczExMSIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjAzNjM2LCJleHAiOjE2MDk2MzU2MzZ9.-fobBFBZ6_6WV2tALuVZreUCsqwsIopxR9JMplGyjEs', '2021-01-03 08:00:36', '1', 'Rozas111', '2020-12-29 08:00:36', 'Rozas111', '2020-12-29 08:00:36');
INSERT INTO `token` VALUES ('42', 'giahy124', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJnaWFoeTEyNCIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjA3Njg5LCJleHAiOjE2MDk2Mzk2ODl9.Oz3x4zZIm8eEKsaVHa8tLIthqoYaZETeCfhJY4f6oSU', '2021-01-03 09:08:10', '1', 'giahy124', '2020-12-29 09:08:10', 'giahy124', '2020-12-29 09:08:10');
INSERT INTO `token` VALUES ('43', 'Taolahunga', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUYW9sYWh1bmdhIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMTIyMDQsImV4cCI6MTYwOTY0NDIwNH0.vp4T2IBLutXSVmelbuLO12tYnSYsi70jziJtn8bZ07w', '2021-01-03 10:23:24', '1', 'Taolahunga', '2020-12-29 10:23:24', 'Taolahunga', '2020-12-29 10:23:24');
INSERT INTO `token` VALUES ('44', 'anhday12yb', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhbmhkYXkxMnliIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMTMzNjAsImV4cCI6MTYwOTY0NTM2MH0.zBE9Wi8SkTBNX2kUb4mv6OVi-NxvqcX22wSUH-jkgfY', '2021-01-03 10:42:40', '1', 'anhday12yb', '2020-12-29 10:42:40', 'anhday12yb', '2020-12-29 10:42:40');
INSERT INTO `token` VALUES ('45', 'Shozoendo', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTaG96b2VuZG8iLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTIxNjE3MywiZXhwIjoxNjA5NjQ4MTczfQ.048V9CgoBnqZQdk_2zmsy5QzEpBqS78B0VLnETIhAoU', '2021-01-03 11:29:34', '1', 'Shozoendo', '2020-12-29 11:29:34', 'Shozoendo', '2020-12-29 11:29:34');
INSERT INTO `token` VALUES ('46', 'nhiendz', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuaGllbmR6Iiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMTY0MzQsImV4cCI6MTYwOTY0ODQzNH0.uvF8GYsDeQv1pGPuBqwJjh7EBgyAK27IFH2miTVqhGI', '2021-01-03 11:33:55', '1', 'nhiendz', '2020-12-29 11:33:55', 'nhiendz', '2020-12-29 11:33:55');
INSERT INTO `token` VALUES ('47', 'nhiendz', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuaGllbmR6Iiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMTY0NzcsImV4cCI6MTYwOTY0ODQ3N30.P4I35W6j68Ya4GjdhLtRJQo7kewzLpBWdsV8Y92WBvQ', '2021-01-03 11:34:38', '1', 'nhiendz', '2020-12-29 11:34:38', 'nhiendz', '2020-12-29 11:34:38');
INSERT INTO `token` VALUES ('48', 'khanhqpz9', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJraGFuaHFwejkiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTIyMDIwOSwiZXhwIjoxNjA5NjUyMjA5fQ.MLk1TsHRvJZ88TlC2xxUjG6Wkln0R3vgBH75crsRUo8', '2021-01-03 12:36:49', '1', 'khanhqpz9', '2020-12-29 12:36:49', 'khanhqpz9', '2020-12-29 12:36:49');
INSERT INTO `token` VALUES ('49', 'M3j42009', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJNM2o0MjAwOSIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjIxNDE4LCJleHAiOjE2MDk2NTM0MTh9.BWSqlGK0xOKTjV9ZJMdG5B75TRYHmDDfh2BKAWWadkQ', '2021-01-03 12:56:59', '1', 'M3j42009', '2020-12-29 12:56:59', 'M3j42009', '2020-12-29 12:56:59');
INSERT INTO `token` VALUES ('50', 'dnan19871', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkbmFuMTk4NzEiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTIyMTU0MSwiZXhwIjoxNjA5NjUzNTQxfQ.WnDKJUYN-bzCRyZjCwg3wiUvIbW6uy00yrUXNnngt2c', '2021-01-03 12:59:02', '1', 'dnan19871', '2020-12-29 12:59:02', 'dnan19871', '2020-12-29 12:59:02');
INSERT INTO `token` VALUES ('51', 'aopro098', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhb3BybzA5OCIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjIyMTM1LCJleHAiOjE2MDk2NTQxMzV9.b3HnnNSdZGdnXwWv9einFkFrgvCTp7Qx-C7l1BiDRT4', '2021-01-03 13:08:55', '1', 'aopro098', '2020-12-29 13:08:55', 'aopro098', '2020-12-29 13:08:55');
INSERT INTO `token` VALUES ('52', 'aopro098', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhb3BybzA5OCIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjIyMTk5LCJleHAiOjE2MDk2NTQxOTl9.gruOZ5P8G7hVF-ExZ8fv-3IlyLOhs4WsiX-dnHLQIOU', '2021-01-03 13:10:00', '1', 'aopro098', '2020-12-29 13:10:00', 'aopro098', '2020-12-29 13:10:00');
INSERT INTO `token` VALUES ('53', 'Mitdoc', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJNaXRkb2MiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTIyMjkwMSwiZXhwIjoxNjA5NjU0OTAxfQ.JwBeIrrOddAbtwcD5Zx6tlqz1b6fgXeC3_H2p5o5g6s', '2021-01-03 13:21:41', '1', 'Mitdoc', '2020-12-29 13:21:41', 'Mitdoc', '2020-12-29 13:21:41');
INSERT INTO `token` VALUES ('54', 'Mitdoc', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJNaXRkb2MiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTIyMzA4NSwiZXhwIjoxNjA5NjU1MDg1fQ.CKpE-xLQW1luUudTUJVqtU-vCYgllw3jAh0GoYx5LvE', '2021-01-03 13:24:46', '1', 'Mitdoc', '2020-12-29 13:24:46', 'Mitdoc', '2020-12-29 13:24:46');
INSERT INTO `token` VALUES ('55', 'luklak', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJsdWtsYWsiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTIyNTA3MCwiZXhwIjoxNjA5NjU3MDcwfQ.e1T0oJQi7To_dFl6lBkC2KLwCUE3dD7hQUrxPsliRqU', '2021-01-03 13:57:50', '1', 'luklak', '2020-12-29 13:57:50', 'luklak', '2020-12-29 13:57:50');
INSERT INTO `token` VALUES ('56', 'Langlas', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJMYW5nbGFzIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMjY5MjIsImV4cCI6MTYwOTY1ODkyMn0.pqFBmYJlI6VgT8EMavRVYkR3WBG5zPz5AgXmKlqJ5A0', '2021-01-03 14:28:43', '1', 'Langlas', '2020-12-29 14:28:43', 'Langlas', '2020-12-29 14:28:43');
INSERT INTO `token` VALUES ('57', 'Shozoendo', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTaG96b2VuZG8iLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTIyNzk0OSwiZXhwIjoxNjA5NjU5OTQ5fQ.QnixP2vkVZ1Hm5wVgH6OjVnNKnrzUWFBFLuWTsJy8jw', '2021-01-03 14:45:49', '1', 'Shozoendo', '2020-12-29 14:45:49', 'Shozoendo', '2020-12-29 14:45:49');
INSERT INTO `token` VALUES ('58', 'Shozoendo', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTaG96b2VuZG8iLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTIyODE2MywiZXhwIjoxNjA5NjYwMTYzfQ.6pG3QcRfbqFL69gGhF-z8SmfRyhVEIlSjJgBvE-auXc', '2021-01-03 14:49:24', '1', 'Shozoendo', '2020-12-29 14:49:24', 'Shozoendo', '2020-12-29 14:49:24');
INSERT INTO `token` VALUES ('59', 'Shozoendo', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTaG96b2VuZG8iLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTIyOTA3NSwiZXhwIjoxNjA5NjYxMDc1fQ.9niwlzbRqPXGGLydcHZC58-JEWCx2q-9V6zWF7tM3E4', '2021-01-03 15:04:35', '1', 'Shozoendo', '2020-12-29 15:04:35', 'Shozoendo', '2020-12-29 15:04:35');
INSERT INTO `token` VALUES ('60', 'Shozoendo', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTaG96b2VuZG8iLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTIyOTA5NSwiZXhwIjoxNjA5NjYxMDk1fQ.tAi6xxGnJutUqziiD8pdcnHB_Fp81A6BYumk-64h3YY', '2021-01-03 15:04:55', '1', 'Shozoendo', '2020-12-29 15:04:55', 'Shozoendo', '2020-12-29 15:04:55');
INSERT INTO `token` VALUES ('61', 'Shozoendo1', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTaG96b2VuZG8xIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMjkxODcsImV4cCI6MTYwOTY2MTE4N30.0_EE_lqi97R-SAaBir_fhKD6msq6wpfl9MhoF8QYZwk', '2021-01-03 15:06:28', '1', 'Shozoendo1', '2020-12-29 15:06:28', 'Shozoendo1', '2020-12-29 15:06:28');
INSERT INTO `token` VALUES ('62', 'aopro098', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhb3BybzA5OCIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjMwOTAxLCJleHAiOjE2MDk2NjI5MDF9.G3LT4FwYK61ckTp35RBy2jkL5Aw9togArueIwtIYT7U', '2021-01-03 15:35:02', '1', 'aopro098', '2020-12-29 15:35:02', 'aopro098', '2020-12-29 15:35:02');
INSERT INTO `token` VALUES ('63', 'Tam1101', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUYW0xMTAxIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMzUzNzMsImV4cCI6MTYwOTY2NzM3M30.eytGHnfwK5TRimu4MQwbYSPCJ-WTdbla5HPJioHTJpM', '2021-01-03 16:49:34', '1', 'Tam1101', '2020-12-29 16:49:34', 'Tam1101', '2020-12-29 16:49:34');
INSERT INTO `token` VALUES ('64', 'luclv20000', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJsdWNsdjIwMDAwIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMzc2ODksImV4cCI6MTYwOTY2OTY4OX0.giz2MCcBDb7Q39fsXrQptsITUGUZ4Yepz-ufrUyJ5po', '2021-01-03 17:28:10', '1', 'luclv20000', '2020-12-29 17:28:10', 'luclv20000', '2020-12-29 17:28:10');
INSERT INTO `token` VALUES ('65', 'Shozoendo1', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTaG96b2VuZG8xIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMzgxMTUsImV4cCI6MTYwOTY3MDExNX0.1KZgqdx6Mu0Wh7DoFQFfKl4L-POp_CHFByUkpkFkVqY', '2021-01-03 17:35:16', '1', 'Shozoendo1', '2020-12-29 17:35:16', 'Shozoendo1', '2020-12-29 17:35:16');
INSERT INTO `token` VALUES ('66', 'Shozoendo1', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTaG96b2VuZG8xIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMzgzNTksImV4cCI6MTYwOTY3MDM1OX0.07tm1PG5A6kw7REkQw_zhNLQhLQowqj-W2_ryxUjTE0', '2021-01-03 17:39:19', '1', 'Shozoendo1', '2020-12-29 17:39:19', 'Shozoendo1', '2020-12-29 17:39:19');
INSERT INTO `token` VALUES ('67', 'Hoang95', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIb2FuZzk1Iiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyMzkyNzQsImV4cCI6MTYwOTY3MTI3NH0.MthlGPcxfzQt5vCQWYu8shY8PlGtejspbXLImCWjfNc', '2021-01-03 17:54:34', '1', 'Hoang95', '2020-12-29 17:54:34', 'Hoang95', '2020-12-29 17:54:34');
INSERT INTO `token` VALUES ('68', 'denysusanto', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkZW55c3VzYW50byIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjQwMzU2LCJleHAiOjE2MDk2NzIzNTZ9.q-j_jZsUhw07hMbsQpJnDL5EXNh-E8wfzuhMVZuKRlw', '2021-01-03 18:12:36', '1', 'denysusanto', '2020-12-29 18:12:36', 'denysusanto', '2020-12-29 18:12:36');
INSERT INTO `token` VALUES ('69', 'denysusanto', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkZW55c3VzYW50byIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjQwNDM2LCJleHAiOjE2MDk2NzI0MzZ9.X-68RVPhpkxsoVsGX_2AZheFd9-tayEFaeqN3Zr6ttA', '2021-01-03 18:13:57', '1', 'denysusanto', '2020-12-29 18:13:57', 'denysusanto', '2020-12-29 18:13:57');
INSERT INTO `token` VALUES ('70', 'Gemman9x', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJHZW1tYW45eCIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjQxNDE3LCJleHAiOjE2MDk2NzM0MTd9.6wec5rGbYWmEDzoU6h1gOlFxEOW3dXuxw4TfJ9VS8T0', '2021-01-03 18:30:18', '1', 'Gemman9x', '2020-12-29 18:30:18', 'Gemman9x', '2020-12-29 18:30:18');
INSERT INTO `token` VALUES ('71', 'Tam1101', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUYW0xMTAxIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyNDMxMjgsImV4cCI6MTYwOTY3NTEyOH0.lWG2lgRxqTqpn7iV2w-B0zKww3kkbTaUszwd5jo1FWc', '2021-01-03 18:58:49', '1', 'Tam1101', '2020-12-29 18:58:49', 'Tam1101', '2020-12-29 18:58:49');
INSERT INTO `token` VALUES ('72', 'chien123', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjaGllbjEyMyIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjQ0MDQ4LCJleHAiOjE2MDk2NzYwNDh9.BHIyfsSgDHpUyMagLHfgtkeCko-qOhw4V22BiPR20ak', '2021-01-03 19:14:09', '1', 'chien123', '2020-12-29 19:14:09', 'chien123', '2020-12-29 19:14:09');
INSERT INTO `token` VALUES ('73', 'kawatokiro', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJrYXdhdG9raXJvIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyNDkzMTQsImV4cCI6MTYwOTY4MTMxNH0.bRJ17Ed6nOq__KtIqN3oHtnz4WWMzi2ka_uu7V5j_Js', '2021-01-03 20:41:55', '1', 'kawatokiro', '2020-12-29 20:41:55', 'kawatokiro', '2020-12-29 20:41:55');
INSERT INTO `token` VALUES ('74', 'Thaichau', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUaGFpY2hhdSIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjUwODU3LCJleHAiOjE2MDk2ODI4NTd9.PYoFkhpIazYMKT1B5zgLGGzpULPP23_Vxj3iI4pLcao', '2021-01-03 21:07:38', '1', 'Thaichau', '2020-12-29 21:07:38', 'Thaichau', '2020-12-29 21:07:38');
INSERT INTO `token` VALUES ('75', 'Tanglanh', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUYW5nbGFuaCIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjUxNTk1LCJleHAiOjE2MDk2ODM1OTV9.rTmKX0SZosev4gSLjZweSTHqEyqtd5R0JkUuAw65U00', '2021-01-03 21:19:56', '1', 'Tanglanh', '2020-12-29 21:19:56', 'Tanglanh', '2020-12-29 21:19:56');
INSERT INTO `token` VALUES ('76', 'saintmark', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWludG1hcmsiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTI1MjIxOCwiZXhwIjoxNjA5Njg0MjE4fQ.GoC3YYJT0oWOI5f58jfLBtzFSfQWXxSjnQ527IbaUIA', '2021-01-03 21:30:18', '1', 'saintmark', '2020-12-29 21:30:18', 'saintmark', '2020-12-29 21:30:18');
INSERT INTO `token` VALUES ('77', 'didaahay13', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkaWRhYWhheTEzIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyNTI2NjIsImV4cCI6MTYwOTY4NDY2Mn0.-8Afa1NrP7v1zYqZxIWLgcUj_q2V8wvATLrkvY5pfqY', '2021-01-03 21:37:42', '1', 'didaahay13', '2020-12-29 21:37:42', 'didaahay13', '2020-12-29 21:37:42');
INSERT INTO `token` VALUES ('78', 'didaahay13', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJkaWRhYWhheTEzIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyNTI5OTcsImV4cCI6MTYwOTY4NDk5N30.JR0UBBJQP9Ib-GF_JDQAIOaWHBbfMMREH4itYoCJkac', '2021-01-03 21:43:17', '1', 'didaahay13', '2020-12-29 21:43:17', 'didaahay13', '2020-12-29 21:43:17');
INSERT INTO `token` VALUES ('79', 'quaanhla', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJxdWFhbmhsYSIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjU2NDE0LCJleHAiOjE2MDk2ODg0MTR9.LHxvgYKiTzFtCjCoGL_xKD6IiVizxGixytYpsPV4a34', '2021-01-03 22:40:15', '1', 'quaanhla', '2020-12-29 22:40:15', 'quaanhla', '2020-12-29 22:40:15');
INSERT INTO `token` VALUES ('80', 'quaanhla', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJxdWFhbmhsYSIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjU3Mzg2LCJleHAiOjE2MDk2ODkzODZ9.q5uZJ-j_48nL0dRyh8d-qfV7elz-UP5bbW5LIBiGN7A', '2021-01-03 22:56:26', '1', 'quaanhla', '2020-12-29 22:56:26', 'quaanhla', '2020-12-29 22:56:26');
INSERT INTO `token` VALUES ('81', 'quaanhla', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJxdWFhbmhsYSIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjU3NzIzLCJleHAiOjE2MDk2ODk3MjN9.tFmyLQReCwxEomH1XpHrSXO1z9ApVvwpQ6p7ausiIVE', '2021-01-03 23:02:03', '1', 'quaanhla', '2020-12-29 23:02:03', 'quaanhla', '2020-12-29 23:02:03');
INSERT INTO `token` VALUES ('82', 'Bennyquy', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCZW5ueXF1eSIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjYwMTI0LCJleHAiOjE2MDk2OTIxMjR9.QCGsZ60TUsHtWuzH_g1fdEeaTQVwAhJgWdhK_uvzJwc', '2021-01-03 23:42:04', '1', 'Bennyquy', '2020-12-29 23:42:04', 'Bennyquy', '2020-12-29 23:42:04');
INSERT INTO `token` VALUES ('83', 'Bennyquy', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCZW5ueXF1eSIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MjYzNzU4LCJleHAiOjE2MDk2OTU3NTh9.QpWykU1T7kIcmBgIsC3hfltaM3BW6FxpGm_LtzELlNk', '2021-01-04 00:42:38', '1', 'Bennyquy', '2020-12-30 00:42:38', 'Bennyquy', '2020-12-30 00:42:38');
INSERT INTO `token` VALUES ('84', 'kenzolak99', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJrZW56b2xhazk5Iiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyNjcwNjUsImV4cCI6MTYwOTY5OTA2NX0.MY9uT_xtgcCGFLm81YykHJ-arooV4TQsVpxED0ceUaw', '2021-01-04 01:37:46', '1', 'kenzolak99', '2020-12-30 01:37:46', 'kenzolak99', '2020-12-30 01:37:46');
INSERT INTO `token` VALUES ('85', 'saintmark', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWludG1hcmsiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTI2ODg2NSwiZXhwIjoxNjA5NzAwODY1fQ.cIopQ22sL200YtstvAa7fV9ojoCVvpNRfw5_m2_t5K4', '2021-01-04 02:07:45', '1', 'saintmark', '2020-12-30 02:07:45', 'saintmark', '2020-12-30 02:07:45');
INSERT INTO `token` VALUES ('86', 'PoorSin', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQb29yU2luIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyODE4MjUsImV4cCI6MTYwOTcxMzgyNX0.tiRNCKMGJqNX87clD0Yt3DGRjUOHQuvyNvkwVxbBwcA', '2021-01-04 05:43:46', '1', 'PoorSin', '2020-12-30 05:43:46', 'PoorSin', '2020-12-30 05:43:46');
INSERT INTO `token` VALUES ('87', 'PoorSin', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQb29yU2luIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyODE4NzQsImV4cCI6MTYwOTcxMzg3NH0.BBa0sDSVUGZ9-L2TJm0pLrM7Q7yxY8amcKzXFfizeg8', '2021-01-04 05:44:35', '1', 'PoorSin', '2020-12-30 05:44:35', 'PoorSin', '2020-12-30 05:44:35');
INSERT INTO `token` VALUES ('88', 'PoorSin', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQb29yU2luIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyODE5MDMsImV4cCI6MTYwOTcxMzkwM30.IQX_N7Upz_wAtapO6LBhHHas8A4yvPufxXNiyazK-es', '2021-01-04 05:45:04', '1', 'PoorSin', '2020-12-30 05:45:04', 'PoorSin', '2020-12-30 05:45:04');
INSERT INTO `token` VALUES ('89', 'harusayoyo', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoYXJ1c2F5b3lvIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyOTM1MjQsImV4cCI6MTYwOTcyNTUyNH0.T5JiPhOON8HdKpI5abZ3KI-vO5nlrocxzcY7ubC_c-I', '2021-01-04 08:58:45', '1', 'harusayoyo', '2020-12-30 08:58:45', 'harusayoyo', '2020-12-30 08:58:45');
INSERT INTO `token` VALUES ('90', 'harusayoyo', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoYXJ1c2F5b3lvIiwicm9sZXMiOlsiVVNFUiJdLCJpYXQiOjE2MDkyOTM3ODgsImV4cCI6MTYwOTcyNTc4OH0.7DkRNXae29KQmS2NVhxY0lxTmG6JpW1DcoikWGtkEl0', '2021-01-04 09:03:08', '1', 'harusayoyo', '2020-12-30 09:03:08', 'harusayoyo', '2020-12-30 09:03:08');
INSERT INTO `token` VALUES ('91', 'giahy124', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJnaWFoeTEyNCIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5Mjk2OTk3LCJleHAiOjE2MDk3Mjg5OTd9.fPTUJ1MQ_g3bkPS3s5FpfKL9Gjhkb5auBw-A4AXwsDo', '2021-01-04 09:56:37', '1', 'giahy124', '2020-12-30 09:56:37', 'giahy124', '2020-12-30 09:56:37');
INSERT INTO `token` VALUES ('92', 'M3j42009', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJNM2o0MjAwOSIsInJvbGVzIjpbIlVTRVIiXSwiaWF0IjoxNjA5MzA4MTYyLCJleHAiOjE2MDk3NDAxNjJ9.A5ErJgIvaCF3rsAWJM9FQmEPulyl_AcRPmjZ6wgZEQE', '2021-01-04 13:02:42', '1', 'M3j42009', '2020-12-30 13:02:42', 'M3j42009', '2020-12-30 13:02:42');
INSERT INTO `token` VALUES ('93', 'saintmark', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWludG1hcmsiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTMwODcyNiwiZXhwIjoxNjA5NzQwNzI2fQ.Nrsfm7IV9F37DePg4plGTTizYbMX92d1C-iOycYHwn4', '2021-01-04 13:12:07', '1', 'saintmark', '2020-12-30 13:12:07', 'saintmark', '2020-12-30 13:12:07');
INSERT INTO `token` VALUES ('94', 'Ltn121001', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJMdG4xMjEwMDEiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTMxMzE0MiwiZXhwIjoxNjA5NzQ1MTQyfQ.KSx3IUz0rpyIA5qX11nauK06e66GoZOjkHub6WgZ9lQ', '2021-01-04 14:25:43', '1', 'Ltn121001', '2020-12-30 14:25:43', 'Ltn121001', '2020-12-30 14:25:43');
INSERT INTO `token` VALUES ('95', 'saintmark', 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzYWludG1hcmsiLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTYwOTM0MDI2NSwiZXhwIjoxNjA5NzcyMjY1fQ.6qTIcgMsg6AQKKkOfGuWOi_IK3gssb7aO2aW2LWGK_8', '2021-01-04 21:57:45', '1', 'saintmark', '2020-12-30 21:57:45', 'saintmark', '2020-12-30 21:57:45');

-- ----------------------------
-- Table structure for wallet_user
-- ----------------------------
DROP TABLE IF EXISTS `wallet_user`;
CREATE TABLE `wallet_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type_network` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `card_value` int(11) DEFAULT NULL,
  `seri_num` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `secret_num` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `response_first_face` varchar(5000) CHARACTER SET utf8 DEFAULT NULL,
  `response_call_back` varchar(5000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wallet_user
-- ----------------------------
