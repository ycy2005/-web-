/*
 Navicat Premium Dump SQL

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : agile

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 13/08/2024 15:00:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attachments
-- ----------------------------
DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments`  (
  `AttachmentID` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `TaskID` int(11) NULL DEFAULT NULL COMMENT '任务ID（关联任务表）',
  `FileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `FilePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件路径',
  `UploadDate` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '上传日期',
  PRIMARY KEY (`AttachmentID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attachments
-- ----------------------------
INSERT INTO `attachments` VALUES (1, 1, 'file1.png', '/files/', '2024-08-12 14:27:25');
INSERT INTO `attachments` VALUES (2, 2, 'file2.pdf', '/files/', '2024-08-12 14:28:11');
INSERT INTO `attachments` VALUES (3, 1, '1.png', '/admin/', NULL);
INSERT INTO `attachments` VALUES (4, 1, '1.png', '/admin/', NULL);
INSERT INTO `attachments` VALUES (5, 1, '图书管理系统1.md', '/file/test', '2024-01-01 00:00:00');
INSERT INTO `attachments` VALUES (6, 1, '图书管理系统1.md', '/file//test', '2024-01-01 00:00:00');
INSERT INTO `attachments` VALUES (7, 1, '图书管理系统1.md', '/file//test', '2024-01-01 00:00:00');
INSERT INTO `attachments` VALUES (8, 1, '图书管理系统1.md', '/file//test', '2024-01-01 00:00:00');
INSERT INTO `attachments` VALUES (9, 1, '图书管理系统.md', 'uploads图书管理系统.md', NULL);
INSERT INTO `attachments` VALUES (10, 1, '图书管理系统.md', 'uploads图书管理系统.md', NULL);
INSERT INTO `attachments` VALUES (11, 1, '图书管理系统.md', 'uploads/图书管理系统.md', NULL);
INSERT INTO `attachments` VALUES (12, 1, '图书管理系统.md', 'uploads/图书管理系统.md', NULL);
INSERT INTO `attachments` VALUES (13, 1, '图书管理系统.md', 'uploads/图书管理系统.md', NULL);
INSERT INTO `attachments` VALUES (14, 1, '图书管理系统.md', 'uploads692f387154646563f641824f9e867c35', NULL);
INSERT INTO `attachments` VALUES (15, 1, '图书管理系统.md', 'uploads85f90ddb6f8775449a54b27bf242f39e', NULL);
INSERT INTO `attachments` VALUES (16, 1, '图书管理系统.md', 'uploads\\d6ad9781395291e28dd8ef90b5257167', NULL);
INSERT INTO `attachments` VALUES (17, 1, 'vue-admin-template-4.2.1.zip', 'uploads\\f8b72f2b4dc7d9eb9d4dd6b299732092', NULL);
INSERT INTO `attachments` VALUES (18, 1, '1.md', 'uploads\\2eb620c0d41c54957d57559932122a8c', NULL);
INSERT INTO `attachments` VALUES (19, 1, '1_ææ¯ä¿è¯ç­çº§åçº§ ç³ è¯· è¡¨-é«å¼º-å®¡æ ¸ç»æ_20240712144338.pdf', 'uploads\\0cc6865625636094469e289880c6ce2e', NULL);
INSERT INTO `attachments` VALUES (20, 1, 'vue-admin-template-4.2.1.zip', 'uploads\\4266595db8991303e38afba7259ca554', NULL);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `CommentID` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `TaskID` int(11) NULL DEFAULT NULL COMMENT '关联任务表',
  `UserID` int(11) NULL DEFAULT NULL COMMENT '评论者ID',
  `Comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '评论内容',
  `CommentDate` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '评论日期',
  PRIMARY KEY (`CommentID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 1, 2, 'Nice', '2024-08-12 14:26:00');
INSERT INTO `comments` VALUES (2, 1, 3, 'Keep', '2024-08-12 14:26:22');
INSERT INTO `comments` VALUES (3, 2, 1, 'Need', '2024-08-12 14:26:39');
INSERT INTO `comments` VALUES (4, 1, 3, '测试评论接口', NULL);
INSERT INTO `comments` VALUES (5, 1, 1, '11111111111111', NULL);
INSERT INTO `comments` VALUES (6, 1, 1, '11111111111111', NULL);
INSERT INTO `comments` VALUES (8, 1, 1, 'cwadwadawdaw', NULL);
INSERT INTO `comments` VALUES (9, 1, 1, '11111111111111111', NULL);
INSERT INTO `comments` VALUES (10, 1, 1, 'dadwadw', NULL);

-- ----------------------------
-- Table structure for projectmembers
-- ----------------------------
DROP TABLE IF EXISTS `projectmembers`;
CREATE TABLE `projectmembers`  (
  `ProjectMemberID` int(11) NOT NULL COMMENT '项目成员ID',
  `ProjectID` int(11) NULL DEFAULT NULL COMMENT '项目ID（关联项目表）',
  `UserID` int(11) NULL DEFAULT NULL COMMENT '成员用户ID（关联用户表）',
  PRIMARY KEY (`ProjectMemberID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of projectmembers
-- ----------------------------
INSERT INTO `projectmembers` VALUES (1, 1, 2);
INSERT INTO `projectmembers` VALUES (2, 1, 3);
INSERT INTO `projectmembers` VALUES (3, 2, 2);

-- ----------------------------
-- Table structure for projects
-- ----------------------------
DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects`  (
  `ProjectID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目名称',
  `Description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目描述',
  `AdminID` int(11) NULL DEFAULT NULL COMMENT '管理员ID',
  PRIMARY KEY (`ProjectID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of projects
-- ----------------------------
INSERT INTO `projects` VALUES (1, 'Project A', 'This is project A.', 1);
INSERT INTO `projects` VALUES (2, 'Project B', 'This is project B.', 1);
INSERT INTO `projects` VALUES (6, '前端测试', '前端测试', 1);
INSERT INTO `projects` VALUES (4, '测试数据', '测试添加项目', 1);

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `TaskID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(11) NULL DEFAULT NULL COMMENT '项目ID',
  `TaskName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '任务名称',
  `Detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '任务详情',
  `Status` int(11) NULL DEFAULT NULL COMMENT '任务状态0待办1进行中2已完成',
  `AssigneeID` int(11) NULL DEFAULT NULL COMMENT '分配给的用户ID',
  `CreatorID` int(11) NULL DEFAULT NULL COMMENT '创建任务的用户ID',
  `CreatedDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`TaskID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (1, 1, 'Task 1', 'This is task 1.', 0, 2, 1, '2024-08-12 14:24:03');
INSERT INTO `tasks` VALUES (2, 1, 'Task 2', 'This is task 2.', 0, 2, 1, '2024-08-12 14:24:44');
INSERT INTO `tasks` VALUES (3, 2, 'Task 3', 'This is task 3.', 0, 2, 1, '2024-08-13 13:57:07');
INSERT INTO `tasks` VALUES (4, 1, '1', '1', 0, 1, 1, '2024-08-13 13:57:51');
INSERT INTO `tasks` VALUES (5, 3, 'Task 4', 'This is task 4.', 0, 3, 1, '2024-08-12 00:00:00');
INSERT INTO `tasks` VALUES (6, 4, '测试任务', '测试添加任务', 2, 1, 0, '2024-08-13 13:57:55');
INSERT INTO `tasks` VALUES (7, 2, '测试', '测试1111', 1, 1, 0, '2024-08-13 13:33:10');

-- ----------------------------
-- Table structure for userroles
-- ----------------------------
DROP TABLE IF EXISTS `userroles`;
CREATE TABLE `userroles`  (
  `UserRoleID` int(11) NOT NULL COMMENT '用户角色ID',
  `UserID` int(11) NULL DEFAULT NULL COMMENT '用户ID（关联用户表）',
  `Role` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '角色（管理员0、项目成员1等）',
  PRIMARY KEY (`UserRoleID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userroles
-- ----------------------------
INSERT INTO `userroles` VALUES (1, 1, 'admin');
INSERT INTO `userroles` VALUES (2, 2, 'user');
INSERT INTO `userroles` VALUES (3, 2, 'user');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `UserID` int(11) NOT NULL COMMENT '用户ID',
  `Username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名称',
  `Pssword` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户密码',
  `Role` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '角色：0管理员1普通用户',
  PRIMARY KEY (`UserID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '123456', 'admin');
INSERT INTO `users` VALUES (2, 'alice', '123456', 'user');
INSERT INTO `users` VALUES (3, 'bob', '123456', 'user');

SET FOREIGN_KEY_CHECKS = 1;
