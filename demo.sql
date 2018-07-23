/*
Navicat MySQL Data Transfer

Source Server         : node1
Source Server Version : 50173
Source Host           : 192.168.171.111:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-07-23 17:55:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `function`
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function` (
  `function_id` int(11) NOT NULL AUTO_INCREMENT,
  `function_name` varchar(32) NOT NULL,
  `url` varchar(1024) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`function_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of function
-- ----------------------------
INSERT INTO `function` VALUES ('1', '管理商品', '/admin/manage.jsp', '1');
INSERT INTO `function` VALUES ('2', '苹果', '/goods/apple.jsp', '2');
INSERT INTO `function` VALUES ('3', '香蕉', '/goods/banana.jsp', '2');
INSERT INTO `function` VALUES ('4', '梨', '/goods/pear.jsp', '2');
INSERT INTO `function` VALUES ('5', '当前订单', '/cart/current.jsp', '3');
INSERT INTO `function` VALUES ('6', '历史订单', '/cart/history.jsp', '3');
INSERT INTO `function` VALUES ('7', '功能待定', '/test/test.jsp', '4');
INSERT INTO `function` VALUES ('14', '葡萄', '/cart/putaotest.jsp', '2');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(64) NOT NULL,
  `amount` int(11) NOT NULL,
  `goods_photo_file` varchar(1024) NOT NULL,
  `price` float(11,0) unsigned NOT NULL,
  `type` varchar(11) NOT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('2', '红富士', '97', 'F:/upload_goods/苹果/红富士.jpg', '5', '苹果');
INSERT INTO `goods` VALUES ('3', '香梨', '97', 'F:/upload_goods/梨/香梨.jpg', '8', '梨');
INSERT INTO `goods` VALUES ('16', '大苹果', '99', 'F:/upload_goods/苹果/大苹果.jpg', '666', '苹果');
INSERT INTO `goods` VALUES ('17', '123', '100', 'F:/upload_goods/葡萄/123.jpg', '2', '葡萄');
INSERT INTO `goods` VALUES ('18', '大香蕉', '97', 'F:/upload_goods/香蕉/大香蕉.jpg', '3', '香蕉');
INSERT INTO `goods` VALUES ('19', '青香蕉', '96', 'F:/upload_goods/香蕉/青香蕉.jpg', '6', '香蕉');

-- ----------------------------
-- Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `address` varchar(128) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `all_total` float(11,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('1', '2018-07-22 21:39:39', '河南省', '123456', '669', '1');
INSERT INTO `history` VALUES ('2', '2018-07-22 21:41:33', '河南！', '1231231', '5', '1');
INSERT INTO `history` VALUES ('3', '2018-07-22 21:43:46', '123', '123', '11', '2');
INSERT INTO `history` VALUES ('4', '2018-07-22 21:48:07', '月球', '132', '6', '2');
INSERT INTO `history` VALUES ('5', '2018-07-22 21:49:41', '火星！', '1231332', '16', '2');
INSERT INTO `history` VALUES ('6', '2018-07-22 22:12:55', '23443', '232', '20', '1');
INSERT INTO `history` VALUES ('7', '2018-07-22 22:29:38', '123', '132', '8', '1');
INSERT INTO `history` VALUES ('8', '2018-07-22 22:31:18', '3123', '12', '3', '1');

-- ----------------------------
-- Table structure for `module`
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(32) NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('1', '管理员');
INSERT INTO `module` VALUES ('2', '浏览商品');
INSERT INTO `module` VALUES ('3', '购物车');
INSERT INTO `module` VALUES ('4', '模块3');

-- ----------------------------
-- Table structure for `ordering`
-- ----------------------------
DROP TABLE IF EXISTS `ordering`;
CREATE TABLE `ordering` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL,
  `goodsname` varchar(64) NOT NULL,
  `price` float(11,0) NOT NULL,
  `number` int(11) NOT NULL,
  `total` float(11,0) NOT NULL,
  `history_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordering
-- ----------------------------
INSERT INTO `ordering` VALUES ('1', '16', '大苹果', '666', '1', '666', '1');
INSERT INTO `ordering` VALUES ('2', '18', '大香蕉', '3', '1', '3', '1');
INSERT INTO `ordering` VALUES ('3', '2', '红富士', '5', '1', '5', '2');
INSERT INTO `ordering` VALUES ('4', '19', '青香蕉', '6', '1', '6', '3');
INSERT INTO `ordering` VALUES ('5', '2', '红富士', '5', '1', '5', '3');
INSERT INTO `ordering` VALUES ('6', '19', '青香蕉', '6', '1', '6', '4');
INSERT INTO `ordering` VALUES ('7', '3', '香梨', '8', '2', '16', '5');
INSERT INTO `ordering` VALUES ('8', '2', '红富士', '5', '1', '5', '6');
INSERT INTO `ordering` VALUES ('9', '18', '大香蕉', '3', '1', '3', '6');
INSERT INTO `ordering` VALUES ('10', '19', '青香蕉', '6', '2', '12', '6');
INSERT INTO `ordering` VALUES ('11', '3', '香梨', '8', '1', '8', '7');
INSERT INTO `ordering` VALUES ('12', '18', '大香蕉', '3', '1', '3', '8');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员');
INSERT INTO `role` VALUES ('2', '游客');

-- ----------------------------
-- Table structure for `role_function`
-- ----------------------------
DROP TABLE IF EXISTS `role_function`;
CREATE TABLE `role_function` (
  `rf_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `function_id` int(11) NOT NULL,
  PRIMARY KEY (`rf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_function
-- ----------------------------
INSERT INTO `role_function` VALUES ('1', '1', '1');
INSERT INTO `role_function` VALUES ('2', '2', '2');
INSERT INTO `role_function` VALUES ('3', '2', '3');
INSERT INTO `role_function` VALUES ('4', '2', '4');
INSERT INTO `role_function` VALUES ('5', '2', '5');
INSERT INTO `role_function` VALUES ('6', '2', '6');
INSERT INTO `role_function` VALUES ('7', '1', '7');
INSERT INTO `role_function` VALUES ('8', '2', '14');

-- ----------------------------
-- Table structure for `role_user`
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `ru_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`ru_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('1', '1', '1');
INSERT INTO `role_user` VALUES ('2', '2', '1');
INSERT INTO `role_user` VALUES ('3', '2', '2');
INSERT INTO `role_user` VALUES ('4', '2', '7');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(64) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '苹果');
INSERT INTO `type` VALUES ('2', '香蕉');
INSERT INTO `type` VALUES ('3', '梨');
INSERT INTO `type` VALUES ('4', '葡萄');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `salt` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'yangshuo', 'd21e10702737201907b4bfc0974f4f2b', '杨烁', '712');
INSERT INTO `user` VALUES ('2', 'youke', 'c2e38a2f71b30fe3cea051a6dfec9f1f', '游客', '71');
INSERT INTO `user` VALUES ('4', 'test', '9d8073723beb5134a9db253963194417', '测试', '505');
INSERT INTO `user` VALUES ('5', 'admin', 'd9827babae921194e1de00788c5d3aee', '管理员', '760');
INSERT INTO `user` VALUES ('6', 'test1', '3d26f405497a3e679da5ba4b7e9d5627', '游客', '265');
INSERT INTO `user` VALUES ('7', 'test2', '3420fc4b2d2e274624967c1e4a86127f', 'youke', '793');
