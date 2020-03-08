/*
 Navicat Premium Data Transfer

 Source Server         : javaee
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : j1

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 08/03/2020 22:29:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `1` bigint(255) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1);

-- ----------------------------
-- Table structure for s_homework
-- ----------------------------
DROP TABLE IF EXISTS `s_homework`;
CREATE TABLE `s_homework`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_time` timestamp(0) NOT NULL,
  `update_time` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_homework
-- ----------------------------
INSERT INTO `s_homework` VALUES (1, '作业', '123', '2020-03-02 12:54:39', NULL);
INSERT INTO `s_homework` VALUES (2, '作业2', '12', '2020-03-26 00:43:31', NULL);
INSERT INTO `s_homework` VALUES (3, 'linux', '123123', '2020-03-08 03:51:49', NULL);
INSERT INTO `s_homework` VALUES (4, 'java', '00-0', '2020-03-08 04:24:08', NULL);
INSERT INTO `s_homework` VALUES (6, '人工智能', '11', '2020-03-03 12:24:50', NULL);
INSERT INTO `s_homework` VALUES (7, '作业', '123123', '2020-03-08 05:51:36', NULL);
INSERT INTO `s_homework` VALUES (8, 'll', 'haao', '2020-03-08 06:41:17', NULL);
INSERT INTO `s_homework` VALUES (9, '系统设计', '好', '2020-03-08 07:49:39', NULL);
INSERT INTO `s_homework` VALUES (10, '数据库', '1234567', '2020-03-08 13:36:55', NULL);

-- ----------------------------
-- Table structure for s_student
-- ----------------------------
DROP TABLE IF EXISTS `s_student`;
CREATE TABLE `s_student`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` timestamp(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_student
-- ----------------------------
INSERT INTO `s_student` VALUES (1, 'zhang', '2020-03-02 13:39:33');
INSERT INTO `s_student` VALUES (2, '2', '2020-03-08 06:02:26');
INSERT INTO `s_student` VALUES (91, 'liu', '2020-03-04 13:39:42');
INSERT INTO `s_student` VALUES (1231, '1231', '2020-03-08 06:21:42');
INSERT INTO `s_student` VALUES (1350, 'zzz', '2020-03-08 13:26:23');
INSERT INTO `s_student` VALUES (1872, 'zjy', '2020-03-08 14:28:29');
INSERT INTO `s_student` VALUES (17301111, '张竞艺', '2020-03-08 05:55:06');
INSERT INTO `s_student` VALUES (17301113, '刘', '2020-03-08 14:29:13');

-- ----------------------------
-- Table structure for s_student_homework
-- ----------------------------
DROP TABLE IF EXISTS `s_student_homework`;
CREATE TABLE `s_student_homework`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) NOT NULL,
  `homework_id` bigint(20) NOT NULL,
  `homework_title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `homework_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `create_time` timestamp(0) NOT NULL,
  `update_time` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `homework_id`(`homework_id`) USING BTREE,
  CONSTRAINT `s_student_homework_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `s_student_homework_ibfk_2` FOREIGN KEY (`homework_id`) REFERENCES `s_homework` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_student_homework
-- ----------------------------
INSERT INTO `s_student_homework` VALUES (1, 1, 1, 'java', '12333', '2020-03-03 12:55:06', NULL);
INSERT INTO `s_student_homework` VALUES (3, 91, 3, '123', 'jsjsjsjs', '2020-03-08 05:15:36', NULL);
INSERT INTO `s_student_homework` VALUES (5, 1, 2, '123', '213', '2020-03-08 05:52:46', NULL);
INSERT INTO `s_student_homework` VALUES (10, 1, 1, '123', '213', '2020-03-08 08:46:02', NULL);
INSERT INTO `s_student_homework` VALUES (12, 17301111, 1, '123', 'jsjsjsjs', '2020-03-08 13:38:23', NULL);

SET FOREIGN_KEY_CHECKS = 1;
