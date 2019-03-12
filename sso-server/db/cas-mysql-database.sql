/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : cas-mysql-database

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_attrs
-- ----------------------------
DROP TABLE IF EXISTS `sys_attrs`;
CREATE TABLE `sys_attrs`  (
  `username` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `attr_key` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `attr_val` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_attrs
-- ----------------------------
INSERT INTO `sys_attrs` VALUES ('admin', 'group', 'ADMIN_ROLE');
INSERT INTO `sys_attrs` VALUES ('admin', 'group', 'MANAGEMENT_ROLE');
INSERT INTO `sys_attrs` VALUES ('admin', 'group', 'DEV_ROLE');
INSERT INTO `sys_attrs` VALUES ('admin', 'school', 'GuangZhou');
INSERT INTO `sys_attrs` VALUES ('admin', 'school', 'ZhuHai');
INSERT INTO `sys_attrs` VALUES ('root', 'group', 'ADMIN_ROLE');
INSERT INTO `sys_attrs` VALUES ('root', 'group', 'MANAGEMENT_ROLE');
INSERT INTO `sys_attrs` VALUES ('root', 'group', 'DEV_ROLE');
INSERT INTO `sys_attrs` VALUES ('root', 'school', 'GuangZhou');
INSERT INTO `sys_attrs` VALUES ('root', 'school', 'ZhuHai');
INSERT INTO `sys_attrs` VALUES ('zhangsan', 'group', 'DEV_ROLE');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `username` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `expired` int(11) NULL DEFAULT NULL,
  `disable` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('admin', '202cb962ac59075b964b07152d234b70', 'huang.wenbin@foxmail.com', 'Guangzhou Tianhe', 24, 0, 0);
INSERT INTO `sys_user` VALUES ('root', '63a9f0ea7bb98050796b649e85481845', 'root@passport.sso.com', 'Guangzhou Panyu', 28, 0, 0);
INSERT INTO `sys_user` VALUES ('wangwu', '827ccb0eea8a706c4c34a16891f84e7b', 'wangwu@foxmail.com', 'Guangzhou Panyu', 27, 1, 0);
INSERT INTO `sys_user` VALUES ('zhangsan', '25d55ad283aa400af464c76d713c07ad', '756884434@qq.com', 'Guangzhou Yuexiu', 26, 0, 0);
INSERT INTO `sys_user` VALUES ('zhaosi', '81dc9bdb52d04dc20036dbd8313ed055', 'zhaosi@foxmail.com', 'Guangzhou Haizhu', 25, 0, 1);

-- ----------------------------
-- Table structure for sys_user_encode
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_encode`;
CREATE TABLE `sys_user_encode`  (
  `username` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `expired` int(11) NULL DEFAULT NULL,
  `disabled` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_encode
-- ----------------------------
INSERT INTO `sys_user_encode` VALUES ('admin_en', 'bfb194d5bd84a5fc77c1d303aefd36c3', 'huang.wenbin@foxmail.com', 'Jiangmen Pengjiang', 24, 0, 0);
INSERT INTO `sys_user_encode` VALUES ('root_en', '6943f96b79f0464b285c006f78547d57', 'root@passport.sso.com', 'Mr Root', 25, 0, 0);
INSERT INTO `sys_user_encode` VALUES ('wangwu_en', '44b907d6fee23a552348eabf5fcf1ac7', 'wangwu@foxmail.com', 'Foshan Shunde', 19, 1, 0);
INSERT INTO `sys_user_encode` VALUES ('zhangsan_en', '68ae075edf004353a0403ee681e45056', 'zhangsan@foxmail.com', 'Shenzhen Baoan', 21, 0, 0);
INSERT INTO `sys_user_encode` VALUES ('zhaosi_en', 'd66108d0409f68af538301b637f13a18', 'zhaosi@foxmail.com', 'Qingyuan Fresh', 20, 0, 1);

-- ----------------------------
-- Table structure for sys_user_question
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_question`;
CREATE TABLE `sys_user_question`  (
  `username` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `question` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `answer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_question
-- ----------------------------
INSERT INTO `sys_user_question` VALUES ('admin', 'Used password is?', '123');
INSERT INTO `sys_user_question` VALUES ('admin', 'Your age is?', '24');
INSERT INTO `sys_user_question` VALUES ('zhangsan', 'My name is?', 'zhangsan');
INSERT INTO `sys_user_question` VALUES ('zhangsan', 'Where am I working?', 'guangzhou');
INSERT INTO `sys_user_question` VALUES ('root', 'Used password is root?', '123');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'test@test.com', 'test');
INSERT INTO `users` VALUES (2, 'admin', 'admin');
INSERT INTO `users` VALUES (3, 'root', 'root');

SET FOREIGN_KEY_CHECKS = 1;
