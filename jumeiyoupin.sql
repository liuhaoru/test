/*
MySQL Data Transfer
Source Host: localhost
Source Database: jumeiyoupin
Target Host: localhost
Target Database: jumeiyoupin
Date: 2017/7/13 15:36:31
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cartid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `meizhuangid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`cartid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `catalogid` int(11) NOT NULL AUTO_INCREMENT,
  `catalogname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`catalogid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for meizhuang
-- ----------------------------
DROP TABLE IF EXISTS `meizhuang`;
CREATE TABLE `meizhuang` (
  `meizhuangid` int(11) NOT NULL AUTO_INCREMENT,
  `meizhuangname` varchar(30) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `picture` varchar(20) DEFAULT NULL,
  `catalogid` int(11) DEFAULT NULL,
  PRIMARY KEY (`meizhuangid`),
  KEY `FK_meizhuang` (`catalogid`),
  CONSTRAINT `FK_meizhuang` FOREIGN KEY (`catalogid`) REFERENCES `catalog` (`catalogid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderitemid` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  `meizhuangid` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderitemid`),
  KEY `FK_orderitem` (`meizhuangid`),
  KEY `FK_orderitem2` (`orderid`),
  CONSTRAINT `FK_orderitem` FOREIGN KEY (`meizhuangid`) REFERENCES `meizhuang` (`meizhuangid`) ON UPDATE CASCADE,
  CONSTRAINT `FK_orderitem2` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `orderdate` datetime DEFAULT NULL,
  `totalprice` float DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `FK_orders` (`userid`),
  CONSTRAINT `FK_orders` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for userdetail
-- ----------------------------
DROP TABLE IF EXISTS `userdetail`;
CREATE TABLE `userdetail` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `xb` bit(1) DEFAULT NULL,
  `truename` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `csrq` date DEFAULT NULL,
  `phone` char(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `FK_userdetail` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '20', '1', '1');
INSERT INTO `cart` VALUES ('2', '20', '10', '1');
INSERT INTO `cart` VALUES ('3', '20', '21', '1');
INSERT INTO `cart` VALUES ('11', '2', '2', '1');
INSERT INTO `cart` VALUES ('12', '2', '11', '2');
INSERT INTO `catalog` VALUES ('1', '洗护用品');
INSERT INTO `catalog` VALUES ('2', '护肤产品');
INSERT INTO `catalog` VALUES ('3', '彩妆');
INSERT INTO `meizhuang` VALUES ('1', '佰草世家洗面奶', '15', 'img1.png', '1');
INSERT INTO `meizhuang` VALUES ('2', '瓷肌祛痘洗面奶', '6.5', 'img2.png', '1');
INSERT INTO `meizhuang` VALUES ('3', '花印氨基酸洗面奶', '8.17', 'img3.png', '1');
INSERT INTO `meizhuang` VALUES ('4', '泰国Milk洗面奶', '9.33', 'img4.png', '1');
INSERT INTO `meizhuang` VALUES ('5', '韩后茶蕊洗面奶', '19.22', 'img5.png', '1');
INSERT INTO `meizhuang` VALUES ('6', '韩后控油补水洗面奶', '8.17', 'img6.png', '1');
INSERT INTO `meizhuang` VALUES ('7', '珍珠美人洗面奶', '6.5', 'img7.png', '1');
INSERT INTO `meizhuang` VALUES ('8', '花印去黑头洗面奶', '9.67', 'img8.png', '1');
INSERT INTO `meizhuang` VALUES ('9', '薇诺娜去敏保湿洗面奶', '26.33', 'img9.png', '1');
INSERT INTO `meizhuang` VALUES ('10', '兰蔻清潭柔肤水', '420', 'hufu1.png', '2');
INSERT INTO `meizhuang` VALUES ('11', '欧舒丹润肤露', '260', 'hufu2.png', '2');
INSERT INTO `meizhuang` VALUES ('12', '倩碧润肤露', '195', 'hufu3.png', '2');
INSERT INTO `meizhuang` VALUES ('13', '欧珀莱抗皱眼霜', '260', 'hufu4.png', '2');
INSERT INTO `meizhuang` VALUES ('14', '露得清护手霜', '99', 'hufu5.png', '2');
INSERT INTO `meizhuang` VALUES ('15', '欧缇丽保湿喷雾', '130', 'hufu6.png', '2');
INSERT INTO `meizhuang` VALUES ('16', '薇诺娜保湿霜', '268', 'hufu7.png', '2');
INSERT INTO `meizhuang` VALUES ('17', '同仁堂祛斑美白霜', '135', 'hufu8.png', '2');
INSERT INTO `meizhuang` VALUES ('18', '膜法世家补水面膜', '89', 'hufu9.png', '2');
INSERT INTO `meizhuang` VALUES ('19', '爱丽小屋眉笔', '36', 'caiz1.jpg', '3');
INSERT INTO `meizhuang` VALUES ('20', '阿玛尼粉底液', '489', 'caiz2.jpeg', '3');
INSERT INTO `meizhuang` VALUES ('21', '火烈鸟睫毛膏', '59', 'caiz3.jpg', '3');
INSERT INTO `meizhuang` VALUES ('22', 'kiko口红', '68', 'caiz4.jpg', '3');
INSERT INTO `meizhuang` VALUES ('23', 'ysl粉底液', '389', 'caiz5.jpg', '3');
INSERT INTO `meizhuang` VALUES ('24', '悦诗风吟粉底液', '389', 'caiz6.jpg', '3');
INSERT INTO `orderitem` VALUES ('30', '1', '27', '3');
INSERT INTO `orderitem` VALUES ('31', '1', '28', '9');
INSERT INTO `orderitem` VALUES ('32', '1', '30', '1');
INSERT INTO `orderitem` VALUES ('33', '1', '30', '13');
INSERT INTO `orderitem` VALUES ('34', '1', '31', '19');
INSERT INTO `orderitem` VALUES ('35', '1', '31', '10');
INSERT INTO `orderitem` VALUES ('36', '1', '33', '12');
INSERT INTO `orderitem` VALUES ('37', '1', '34', '1');
INSERT INTO `orderitem` VALUES ('38', '1', '34', '11');
INSERT INTO `orderitem` VALUES ('39', '1', '35', '10');
INSERT INTO `orderitem` VALUES ('40', '1', '35', '13');
INSERT INTO `orderitem` VALUES ('41', '1', '36', '8');
INSERT INTO `orderitem` VALUES ('42', '1', '37', '15');
INSERT INTO `orderitem` VALUES ('43', '1', '38', '35');
INSERT INTO `orderitem` VALUES ('44', '1', '38', '33');
INSERT INTO `orderitem` VALUES ('45', '1', '38', '38');
INSERT INTO `orderitem` VALUES ('46', '1', '39', '1');
INSERT INTO `orderitem` VALUES ('47', '10', '40', '1');
INSERT INTO `orderitem` VALUES ('48', '1', '41', '1');
INSERT INTO `orders` VALUES ('26', '2016-05-23 20:22:55', null, '16');
INSERT INTO `orders` VALUES ('27', '2016-05-23 20:52:51', null, '16');
INSERT INTO `orders` VALUES ('28', '2016-05-23 21:15:09', null, '16');
INSERT INTO `orders` VALUES ('30', '2016-05-23 21:20:10', '320', '16');
INSERT INTO `orders` VALUES ('31', '2016-05-23 21:28:59', '286', '16');
INSERT INTO `orders` VALUES ('33', '2016-05-23 21:30:55', '187', '16');
INSERT INTO `orders` VALUES ('34', '2016-05-24 09:28:46', '288', '1');
INSERT INTO `orders` VALUES ('35', '2016-05-24 09:38:18', '360', '1');
INSERT INTO `orders` VALUES ('36', '2016-05-24 10:14:58', '199', '1');
INSERT INTO `orders` VALUES ('37', '2016-05-24 10:16:29', '216', '1');
INSERT INTO `orders` VALUES ('38', '2016-05-24 10:55:22', '655', '1');
INSERT INTO `orders` VALUES ('39', '2016-05-24 13:04:47', '119', '1');
INSERT INTO `orders` VALUES ('40', '2016-05-24 20:43:49', '1190', '19');
INSERT INTO `orders` VALUES ('41', '2016-05-25 16:42:20', '119', '19');
INSERT INTO `user` VALUES ('1', 'tom', '123', 'customer');
INSERT INTO `user` VALUES ('2', 'admin', 'admin666', 'admin');
INSERT INTO `user` VALUES ('3', 'er', '666', 'customer');
INSERT INTO `user` VALUES ('5', 'fg', '66', null);
INSERT INTO `user` VALUES ('15', 'q12345', '1234567', 'customer');
INSERT INTO `user` VALUES ('16', 'w12345', '12345', 'customer');
INSERT INTO `user` VALUES ('17', 'huahua', 'FCEA920F7412B5DA7BE0CF42B8C93759', 'customer');
INSERT INTO `user` VALUES ('18', 'xiao12', 'FCEA920F7412B5DA7BE0CF42B8C93759', 'customer');
INSERT INTO `user` VALUES ('19', 'dalong', 'C8837B23FF8AAA8A2DDE915473CE0991', 'customer');
INSERT INTO `user` VALUES ('20', 'chengxx', '123123', 'customer');
INSERT INTO `userdetail` VALUES ('1', '', 'tom111', '2016-04-20', '1234', 'tom@qq.com', 'tom111');
INSERT INTO `userdetail` VALUES ('15', '', 'aa', '2016-05-02', '12345678901', '', '浑南新区辽宁省沈阳');
INSERT INTO `userdetail` VALUES ('16', '', 'aa', '2016-05-02', '12345678901', '', '浑南新区辽宁省沈阳');
INSERT INTO `userdetail` VALUES ('17', '', '花花', '2016-05-01', '18946117256', 'huahua@qq.com', '黑龙江省哈尔滨道里区');
INSERT INTO `userdetail` VALUES ('18', '', '小明', '2016-05-01', '12345678901', 'xiao12@qq.com', '黑龙江省null啊啊');
INSERT INTO `userdetail` VALUES ('19', '', '大龙11', '2016-05-01', '15475570911', 'dalomn@qq.com', '辽宁省沈阳道里区');
