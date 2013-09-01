/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50037
Source Host           : localhost:3306
Source Database       : gogowise

Target Server Type    : MYSQL
Target Server Version : 50037
File Encoding         : 65001

Date: 2012-03-24 09:36:42
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `allocation`
-- ----------------------------
DROP TABLE IF EXISTS `allocation`;
CREATE TABLE `allocation` (
  `discriminator` int(11) NOT NULL,
  `id` int(11) NOT NULL auto_increment,
  `code` varchar(255) default NULL,
  `comments` varchar(255) default NULL,
  `confirmed` bit(1) default NULL,
  `mark` int(11) default NULL,
  `competitionSession_id` int(11) default NULL,
  `singUpInfo_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK4D42D00D9369657` (`competitionSession_id`),
  KEY `FK4D42D00A4A92C17` (`singUpInfo_id`),
  CONSTRAINT `FK4D42D00A4A92C17` FOREIGN KEY (`singUpInfo_id`) REFERENCES `singupinfo` (`id`),
  CONSTRAINT `FK4D42D00D9369657` FOREIGN KEY (`competitionSession_id`) REFERENCES `competitionsession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allocation
-- ----------------------------
INSERT INTO `allocation` VALUES ('2', '1', null, null, '\0', null, '1', null);
INSERT INTO `allocation` VALUES ('2', '2', null, null, '\0', null, '1', null);
INSERT INTO `allocation` VALUES ('1', '3', null, null, '\0', null, '1', null);
INSERT INTO `allocation` VALUES ('1', '4', null, null, '\0', null, '1', null);
INSERT INTO `allocation` VALUES ('1', '5', null, null, '\0', null, '1', null);
INSERT INTO `allocation` VALUES ('1', '6', null, null, '\0', null, '1', null);
INSERT INTO `allocation` VALUES ('1', '7', null, null, '\0', null, '1', null);
INSERT INTO `allocation` VALUES ('1', '8', null, null, '\0', null, '1', null);
INSERT INTO `allocation` VALUES ('1', '9', null, null, '\0', null, '1', null);
INSERT INTO `allocation` VALUES ('1', '10', null, null, '\0', null, '1', null);
INSERT INTO `allocation` VALUES ('1', '11', null, null, '\0', null, '1', null);
INSERT INTO `allocation` VALUES ('3', '12', null, null, '\0', null, '1', '1');

-- ----------------------------
-- Table structure for `applyorganization`
-- ----------------------------
DROP TABLE IF EXISTS `applyorganization`;
CREATE TABLE `applyorganization` (
  `id` int(11) NOT NULL auto_increment,
  `city` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `depositBankAcount` varchar(255) default NULL,
  `depositBankName` varchar(255) default NULL,
  `depositName` varchar(255) default NULL,
  `effective` bit(1) default NULL,
  `effectiveCode` varchar(255) default NULL,
  `province` varchar(255) default NULL,
  `schoolName` varchar(255) default NULL,
  `agent_id` int(11) default NULL,
  `responsiblePerson_id` int(11) default NULL,
  `description` varchar(255) default NULL,
  `logoUrl` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKD0804FA1148F92A8` (`responsiblePerson_id`),
  KEY `FKD0804FA17EC65F2E` (`agent_id`),
  CONSTRAINT `FKD0804FA1148F92A8` FOREIGN KEY (`responsiblePerson_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FKD0804FA17EC65F2E` FOREIGN KEY (`agent_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of applyorganization
-- ----------------------------
INSERT INTO `applyorganization` VALUES ('1', null, null, '1231232421342142', '中国银行', '张林', '\0', '93ADFBD81860C9B9C03BC6CFD4A3F71D', null, '中南大学', null, '1', 'TTTTTTTTTTTTTT', 'E:\\Dev\\jboss-as-web-7.0.2.Final\\standalone\\deployments\\ROOT.war\\upload\\images\\org/张林/null');

-- ----------------------------
-- Table structure for `browsedcourse`
-- ----------------------------
DROP TABLE IF EXISTS `browsedcourse`;
CREATE TABLE `browsedcourse` (
  `id` int(11) NOT NULL auto_increment,
  `course_id` int(11) default NULL,
  `owner_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC15BEBB5ACBD5F77` (`course_id`),
  KEY `FKC15BEBB58A5668C0` (`owner_id`),
  CONSTRAINT `FKC15BEBB58A5668C0` FOREIGN KEY (`owner_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FKC15BEBB5ACBD5F77` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of browsedcourse
-- ----------------------------
INSERT INTO `browsedcourse` VALUES ('26', '58', '16');
INSERT INTO `browsedcourse` VALUES ('41', '60', '15');
INSERT INTO `browsedcourse` VALUES ('43', '62', '1');
INSERT INTO `browsedcourse` VALUES ('45', '76', '15');
INSERT INTO `browsedcourse` VALUES ('59', '82', '6');
INSERT INTO `browsedcourse` VALUES ('61', '58', '6');
INSERT INTO `browsedcourse` VALUES ('63', '87', '20');
INSERT INTO `browsedcourse` VALUES ('66', '93', '20');
INSERT INTO `browsedcourse` VALUES ('69', '63', '4');
INSERT INTO `browsedcourse` VALUES ('75', '63', '24');
INSERT INTO `browsedcourse` VALUES ('76', '94', '24');
INSERT INTO `browsedcourse` VALUES ('78', '106', '32');
INSERT INTO `browsedcourse` VALUES ('81', '57', '20');
INSERT INTO `browsedcourse` VALUES ('86', '59', '6');
INSERT INTO `browsedcourse` VALUES ('87', '152', '47');
INSERT INTO `browsedcourse` VALUES ('89', '150', '4');
INSERT INTO `browsedcourse` VALUES ('90', '150', '15');
INSERT INTO `browsedcourse` VALUES ('91', '150', '24');
INSERT INTO `browsedcourse` VALUES ('95', '160', '49');
INSERT INTO `browsedcourse` VALUES ('96', '56', '49');
INSERT INTO `browsedcourse` VALUES ('100', '182', '50');
INSERT INTO `browsedcourse` VALUES ('107', '184', '52');
INSERT INTO `browsedcourse` VALUES ('108', '185', '52');
INSERT INTO `browsedcourse` VALUES ('121', '172', '61');
INSERT INTO `browsedcourse` VALUES ('122', '183', '62');
INSERT INTO `browsedcourse` VALUES ('123', '198', '62');
INSERT INTO `browsedcourse` VALUES ('124', '174', '62');
INSERT INTO `browsedcourse` VALUES ('126', '198', '63');
INSERT INTO `browsedcourse` VALUES ('128', '201', '2');
INSERT INTO `browsedcourse` VALUES ('129', '144', '2');
INSERT INTO `browsedcourse` VALUES ('130', '202', '66');
INSERT INTO `browsedcourse` VALUES ('131', '204', '66');
INSERT INTO `browsedcourse` VALUES ('132', '203', '49');
INSERT INTO `browsedcourse` VALUES ('137', '183', '4');
INSERT INTO `browsedcourse` VALUES ('138', '202', '68');
INSERT INTO `browsedcourse` VALUES ('139', '208', '68');
INSERT INTO `browsedcourse` VALUES ('140', '172', '70');
INSERT INTO `browsedcourse` VALUES ('141', '207', '17');
INSERT INTO `browsedcourse` VALUES ('144', '183', '72');
INSERT INTO `browsedcourse` VALUES ('148', '210', '29');
INSERT INTO `browsedcourse` VALUES ('149', '229', '29');
INSERT INTO `browsedcourse` VALUES ('150', '205', '29');
INSERT INTO `browsedcourse` VALUES ('151', '57', '53');
INSERT INTO `browsedcourse` VALUES ('153', '229', '17');
INSERT INTO `browsedcourse` VALUES ('155', '183', '73');
INSERT INTO `browsedcourse` VALUES ('158', '57', '75');
INSERT INTO `browsedcourse` VALUES ('159', '174', '13');
INSERT INTO `browsedcourse` VALUES ('161', '174', '2');
INSERT INTO `browsedcourse` VALUES ('163', '241', '19');
INSERT INTO `browsedcourse` VALUES ('164', '183', '61');
INSERT INTO `browsedcourse` VALUES ('166', '174', '140');
INSERT INTO `browsedcourse` VALUES ('167', '240', '141');
INSERT INTO `browsedcourse` VALUES ('168', '209', '141');
INSERT INTO `browsedcourse` VALUES ('169', '106', '141');
INSERT INTO `browsedcourse` VALUES ('171', '242', '19');
INSERT INTO `browsedcourse` VALUES ('172', '241', '3');
INSERT INTO `browsedcourse` VALUES ('173', '240', '19');
INSERT INTO `browsedcourse` VALUES ('174', '183', '142');
INSERT INTO `browsedcourse` VALUES ('175', '225', '3');
INSERT INTO `browsedcourse` VALUES ('176', '244', '3');

-- ----------------------------
-- Table structure for `changeresponserhistory`
-- ----------------------------
DROP TABLE IF EXISTS `changeresponserhistory`;
CREATE TABLE `changeresponserhistory` (
  `id` int(11) NOT NULL auto_increment,
  `effectiveCode` varchar(255) default NULL,
  `currentResponser_id` int(11) default NULL,
  `newResponser_id` int(11) default NULL,
  `organization_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK4DA85EF39D0A3EB7` (`organization_id`),
  KEY `FK4DA85EF314BB5402` (`newResponser_id`),
  KEY `FK4DA85EF3CF716A5B` (`currentResponser_id`),
  CONSTRAINT `FK4DA85EF314BB5402` FOREIGN KEY (`newResponser_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK4DA85EF39D0A3EB7` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK4DA85EF3CF716A5B` FOREIGN KEY (`currentResponser_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of changeresponserhistory
-- ----------------------------

-- ----------------------------
-- Table structure for `chargestudent`
-- ----------------------------
DROP TABLE IF EXISTS `chargestudent`;
CREATE TABLE `chargestudent` (
  `chargeCourse_id` int(11) NOT NULL,
  `chargeStudent_id` int(11) NOT NULL,
  PRIMARY KEY  (`chargeCourse_id`,`chargeStudent_id`),
  KEY `FK566874C7484D9DEC` (`chargeStudent_id`),
  KEY `FK566874C744700743` (`chargeCourse_id`),
  CONSTRAINT `FK566874C744700743` FOREIGN KEY (`chargeCourse_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK566874C7484D9DEC` FOREIGN KEY (`chargeStudent_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chargestudent
-- ----------------------------

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(11) NOT NULL auto_increment,
  `date` datetime default NULL,
  `endTimeHour` int(11) NOT NULL,
  `endTimeMinite` int(11) NOT NULL,
  `isFinished` bit(1) default NULL,
  `isRecord` bit(1) default NULL,
  `name` varchar(255) default NULL,
  `nickName` varchar(255) default NULL,
  `realStartTime` double default NULL,
  `startTimeHour` int(11) NOT NULL,
  `startTimeMinite` int(11) NOT NULL,
  `course_id` int(11) default NULL,
  `finishDate` datetime default NULL,
  `duration` int(11) default NULL,
  `isTeacherEntered` bit(1) default NULL,
  `isTeacherOut` bit(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK3E2B958ACBD5F77` (`course_id`),
  CONSTRAINT `FK3E2B958ACBD5F77` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('41', '2012-01-23 10:20:00', '0', '0', '', null, '第1节课', '课程练习', null, '0', '0', '56', '2012-01-23 11:05:00', '45', null, null);
INSERT INTO `class` VALUES ('42', '2012-01-28 11:45:00', '0', '0', '\0', null, '第2节课', '强化班', null, '0', '0', '56', '2012-01-28 12:35:00', '50', null, null);
INSERT INTO `class` VALUES ('43', '2012-01-13 16:00:00', '0', '0', '\0', null, '第1节课', '美国梦', null, '0', '0', '57', '2012-01-13 17:00:00', '60', null, null);
INSERT INTO `class` VALUES ('44', '2012-01-16 13:00:56', '0', '0', '', null, '第1节课', null, null, '0', '0', '58', '2012-01-16 09:30:56', '60', null, null);
INSERT INTO `class` VALUES ('45', '2012-01-16 13:00:56', '0', '0', '', null, '第2节课', null, null, '0', '0', '58', '2012-01-16 09:30:56', '60', null, null);
INSERT INTO `class` VALUES ('46', '2012-01-16 13:00:56', '0', '0', '', null, '第3节课', null, null, '0', '0', '58', '2012-01-16 13:55:56', '55', null, null);
INSERT INTO `class` VALUES ('47', '2012-01-16 13:00:56', '0', '0', '', null, '第4节课', null, null, '0', '0', '58', '2012-01-16 09:30:56', '60', null, null);
INSERT INTO `class` VALUES ('48', '2012-01-16 13:00:56', '0', '0', '', null, '第5节课', null, null, '0', '0', '58', '2012-01-16 09:30:56', '60', null, null);
INSERT INTO `class` VALUES ('49', '2012-01-16 13:00:56', '0', '0', '', null, '第6节课', null, null, '0', '0', '58', '2012-01-16 13:55:56', '55', null, null);
INSERT INTO `class` VALUES ('50', '2012-01-23 13:00:56', '0', '0', '', null, '第7节课', null, null, '0', '0', '58', '2012-01-23 09:30:56', '60', null, null);
INSERT INTO `class` VALUES ('51', '2012-01-23 13:00:56', '0', '0', '', null, '第8节课', null, null, '0', '0', '58', '2012-01-23 09:30:56', '60', null, null);
INSERT INTO `class` VALUES ('52', '2012-01-23 13:00:56', '0', '0', '', null, '第9节课', null, null, '0', '0', '58', '2012-01-23 13:55:56', '55', null, null);
INSERT INTO `class` VALUES ('53', '2012-01-30 13:00:56', '0', '0', '', null, '第10节课', null, null, '0', '0', '58', '2012-01-30 09:30:56', '60', null, null);
INSERT INTO `class` VALUES ('54', '2012-01-30 13:00:56', '0', '0', '', null, '第11节课', null, null, '0', '0', '58', '2012-01-30 09:30:56', '60', null, null);
INSERT INTO `class` VALUES ('55', '2012-01-30 13:00:56', '0', '0', '', null, '第12节课', null, null, '0', '0', '58', '2012-01-30 13:55:56', '55', null, null);
INSERT INTO `class` VALUES ('56', '2012-02-06 13:00:57', '0', '0', '\0', null, '第13节课', null, null, '0', '0', '58', '2012-02-06 09:30:57', '60', null, null);
INSERT INTO `class` VALUES ('57', '2012-02-06 13:00:57', '0', '0', '\0', null, '第14节课', null, null, '0', '0', '58', '2012-02-06 09:30:57', '60', null, null);
INSERT INTO `class` VALUES ('58', '2012-02-06 13:00:57', '0', '0', '\0', null, '第15节课', null, null, '0', '0', '58', '2012-02-06 13:55:57', '55', null, null);
INSERT INTO `class` VALUES ('59', '2012-01-13 16:00:00', '0', '0', '\0', null, '第1节课', '入门教学', null, '0', '0', '59', '2012-01-13 17:00:00', '60', null, null);
INSERT INTO `class` VALUES ('60', '2012-01-13 16:00:00', '0', '0', '\0', null, '第1节课', '测试', null, '0', '0', '60', '2012-01-13 16:55:00', '55', null, null);
INSERT INTO `class` VALUES ('61', '2012-01-14 16:00:00', '0', '0', '\0', null, '第1节课', '一直丢失的美洲豹', null, '0', '0', '62', '2012-01-14 17:00:00', '60', null, null);
INSERT INTO `class` VALUES ('62', '2012-01-14 16:00:00', '0', '0', '\0', null, '第1节课', 'tt', null, '0', '0', '63', '2012-01-14 17:00:00', '60', null, null);
INSERT INTO `class` VALUES ('63', '2012-01-14 16:00:00', '0', '0', '\0', null, '第1节课', 'testing', null, '0', '0', '65', '2012-01-14 17:00:00', '60', null, null);
INSERT INTO `class` VALUES ('64', '2012-01-14 16:00:00', '0', '0', '\0', null, '第1节课', '皇帝的新衣', null, '0', '0', '67', '2012-01-14 17:00:00', '60', null, null);
INSERT INTO `class` VALUES ('65', '2012-01-16 06:30:00', '0', '0', '', null, '第2节课', '仪表仪态', null, '0', '0', '68', '2012-01-16 07:15:00', '45', null, null);
INSERT INTO `class` VALUES ('66', '2012-01-16 16:00:00', '0', '0', '', null, '第3节课', '生活礼仪', null, '0', '0', '68', '2012-01-16 16:45:00', '45', null, null);
INSERT INTO `class` VALUES ('67', '2012-01-17 16:00:00', '0', '0', '\0', null, '第4节课', '言谈礼仪', null, '0', '0', '68', '2012-01-17 16:45:00', '45', null, null);
INSERT INTO `class` VALUES ('68', '2012-01-16 02:00:00', '0', '0', '', null, '第1节课', '职场礼仪', null, '0', '0', '68', '2012-01-16 02:45:00', '45', null, null);
INSERT INTO `class` VALUES ('69', '2012-01-01 11:00:00', '0', '0', '', null, '第1节课', '商务英语1', null, '0', '0', '69', '2012-01-01 12:00:00', '60', null, null);
INSERT INTO `class` VALUES ('70', '2012-01-18 16:00:00', '0', '0', '', null, '第4节课', '商务英语2', null, '0', '0', '69', '2012-01-18 17:00:00', '60', null, null);
INSERT INTO `class` VALUES ('71', '2012-01-16 17:00:30', '0', '0', '', null, '第2节课', null, null, '0', '0', '69', '2012-01-16 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('72', '2012-01-16 17:00:30', '0', '0', '', null, '第3节课', null, null, '0', '0', '69', '2012-01-16 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('73', '2012-01-23 17:00:30', '0', '0', '', null, '第5节课', null, null, '0', '0', '69', '2012-01-23 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('74', '2012-01-23 17:00:30', '0', '0', '', null, '第6节课', null, null, '0', '0', '69', '2012-01-23 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('75', '2012-01-30 17:00:30', '0', '0', '', null, '第7节课', null, null, '0', '0', '69', '2012-01-30 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('76', '2012-01-30 17:00:30', '0', '0', '', null, '第8节课', null, null, '0', '0', '69', '2012-01-30 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('77', '2012-02-06 17:00:30', '0', '0', '', null, '第9节课', null, null, '0', '0', '69', '2012-02-06 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('78', '2012-02-06 17:00:30', '0', '0', '', null, '第10节课', null, null, '0', '0', '69', '2012-02-06 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('79', '2012-02-13 17:00:30', '0', '0', '', null, '第11节课', null, null, '0', '0', '69', '2012-02-13 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('80', '2012-02-13 17:00:30', '0', '0', '', null, '第12节课', null, null, '0', '0', '69', '2012-02-13 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('81', '2012-02-20 17:00:30', '0', '0', '', null, '第13节课', null, null, '0', '0', '69', '2012-02-20 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('82', '2012-02-20 17:00:30', '0', '0', '', null, '第14节课', null, null, '0', '0', '69', '2012-02-20 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('83', '2012-02-27 17:00:30', '0', '0', '', null, '第15节课', null, null, '0', '0', '69', '2012-02-27 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('84', '2012-02-27 17:00:30', '0', '0', '', null, '第16节课', null, null, '0', '0', '69', '2012-02-27 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('85', '2012-03-05 17:00:30', '0', '0', '', null, '第17节课', null, null, '0', '0', '69', '2012-03-05 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('86', '2012-03-05 17:00:30', '0', '0', '', null, '第18节课', null, null, '0', '0', '69', '2012-03-05 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('87', '2012-03-12 17:00:30', '0', '0', '', null, '第19节课', null, null, '0', '0', '69', '2012-03-12 18:00:30', '60', '', null);
INSERT INTO `class` VALUES ('88', '2012-03-12 17:00:30', '0', '0', '', null, '第20节课', null, null, '0', '0', '69', '2012-03-12 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('89', '2012-03-19 17:00:30', '0', '0', '\0', null, '第21节课', null, null, '0', '0', '69', '2012-03-19 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('90', '2012-03-19 17:00:30', '0', '0', '\0', null, '第22节课', null, null, '0', '0', '69', '2012-03-19 18:00:30', '60', null, null);
INSERT INTO `class` VALUES ('91', '2012-01-22 15:51:09', '0', '0', '\0', null, '第1节课', null, null, '0', '0', '70', '2012-01-22 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('92', '2012-01-22 15:51:09', '0', '0', '\0', null, '第2节课', null, null, '0', '0', '70', '2012-01-22 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('93', '2012-01-22 15:51:09', '0', '0', '\0', null, '第3节课', null, null, '0', '0', '70', '2012-01-22 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('94', '2012-01-22 15:51:09', '0', '0', '\0', null, '第4节课', null, null, '0', '0', '70', '2012-01-22 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('95', '2012-01-23 15:51:09', '0', '0', '\0', null, '第5节课', null, null, '0', '0', '70', '2012-01-23 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('96', '2012-01-23 15:51:09', '0', '0', '\0', null, '第6节课', null, null, '0', '0', '70', '2012-01-23 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('97', '2012-01-23 15:51:09', '0', '0', '\0', null, '第7节课', null, null, '0', '0', '70', '2012-01-23 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('98', '2012-01-23 15:51:09', '0', '0', '\0', null, '第8节课', null, null, '0', '0', '70', '2012-01-23 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('99', '2012-01-17 15:51:09', '0', '0', '\0', null, '第9节课', null, null, '0', '0', '70', '2012-01-17 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('100', '2012-01-17 15:51:09', '0', '0', '\0', null, '第10节课', null, null, '0', '0', '70', '2012-01-17 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('101', '2012-01-17 15:51:09', '0', '0', '\0', null, '第11节课', null, null, '0', '0', '70', '2012-01-17 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('102', '2012-01-17 15:51:09', '0', '0', '\0', null, '第12节课', null, null, '0', '0', '70', '2012-01-17 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('103', '2012-01-18 15:51:09', '0', '0', '\0', null, '第13节课', null, null, '0', '0', '70', '2012-01-18 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('104', '2012-01-18 15:51:09', '0', '0', '\0', null, '第14节课', null, null, '0', '0', '70', '2012-01-18 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('105', '2012-01-18 15:51:09', '0', '0', '\0', null, '第15节课', null, null, '0', '0', '70', '2012-01-18 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('106', '2012-01-18 15:51:09', '0', '0', '\0', null, '第16节课', null, null, '0', '0', '70', '2012-01-18 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('107', '2012-01-19 15:51:09', '0', '0', '\0', null, '第17节课', null, null, '0', '0', '70', '2012-01-19 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('108', '2012-01-19 15:51:09', '0', '0', '\0', null, '第18节课', null, null, '0', '0', '70', '2012-01-19 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('109', '2012-01-19 15:51:09', '0', '0', '\0', null, '第19节课', null, null, '0', '0', '70', '2012-01-19 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('110', '2012-01-19 15:51:09', '0', '0', '\0', null, '第20节课', null, null, '0', '0', '70', '2012-01-19 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('111', '2012-01-20 15:51:09', '0', '0', '\0', null, '第21节课', null, null, '0', '0', '70', '2012-01-20 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('112', '2012-01-20 15:51:09', '0', '0', '\0', null, '第22节课', null, null, '0', '0', '70', '2012-01-20 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('113', '2012-01-20 15:51:09', '0', '0', '\0', null, '第23节课', null, null, '0', '0', '70', '2012-01-20 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('114', '2012-01-20 15:51:09', '0', '0', '\0', null, '第24节课', null, null, '0', '0', '70', '2012-01-20 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('115', '2012-01-21 15:51:09', '0', '0', '\0', null, '第25节课', null, null, '0', '0', '70', '2012-01-21 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('116', '2012-01-21 15:51:09', '0', '0', '\0', null, '第26节课', null, null, '0', '0', '70', '2012-01-21 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('117', '2012-01-21 15:51:09', '0', '0', '\0', null, '第27节课', null, null, '0', '0', '70', '2012-01-21 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('118', '2012-01-21 15:51:09', '0', '0', '\0', null, '第28节课', null, null, '0', '0', '70', '2012-01-21 16:51:09', '60', null, null);
INSERT INTO `class` VALUES ('119', '2012-01-22 15:51:50', '0', '0', '\0', null, '第29节课', null, null, '0', '0', '70', '2012-01-22 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('120', '2012-01-22 15:51:50', '0', '0', '\0', null, '第30节课', null, null, '0', '0', '70', '2012-01-22 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('121', '2012-01-22 15:51:50', '0', '0', '\0', null, '第31节课', null, null, '0', '0', '70', '2012-01-22 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('122', '2012-01-22 15:51:50', '0', '0', '\0', null, '第32节课', null, null, '0', '0', '70', '2012-01-22 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('123', '2012-01-23 15:51:50', '0', '0', '\0', null, '第33节课', null, null, '0', '0', '70', '2012-01-23 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('124', '2012-01-23 15:51:50', '0', '0', '\0', null, '第34节课', null, null, '0', '0', '70', '2012-01-23 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('125', '2012-01-23 15:51:50', '0', '0', '\0', null, '第35节课', null, null, '0', '0', '70', '2012-01-23 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('126', '2012-01-23 15:51:50', '0', '0', '\0', null, '第36节课', null, null, '0', '0', '70', '2012-01-23 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('127', '2012-01-17 15:51:50', '0', '0', '\0', null, '第37节课', null, null, '0', '0', '70', '2012-01-17 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('128', '2012-01-17 15:51:50', '0', '0', '\0', null, '第38节课', null, null, '0', '0', '70', '2012-01-17 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('129', '2012-01-17 15:51:50', '0', '0', '\0', null, '第39节课', null, null, '0', '0', '70', '2012-01-17 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('130', '2012-01-17 15:51:50', '0', '0', '\0', null, '第40节课', null, null, '0', '0', '70', '2012-01-17 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('131', '2012-01-18 15:51:50', '0', '0', '\0', null, '第41节课', null, null, '0', '0', '70', '2012-01-18 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('132', '2012-01-18 15:51:50', '0', '0', '\0', null, '第42节课', null, null, '0', '0', '70', '2012-01-18 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('133', '2012-01-18 15:51:50', '0', '0', '\0', null, '第43节课', null, null, '0', '0', '70', '2012-01-18 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('134', '2012-01-18 15:51:50', '0', '0', '\0', null, '第44节课', null, null, '0', '0', '70', '2012-01-18 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('135', '2012-01-19 15:51:50', '0', '0', '\0', null, '第45节课', null, null, '0', '0', '70', '2012-01-19 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('136', '2012-01-19 15:51:50', '0', '0', '\0', null, '第46节课', null, null, '0', '0', '70', '2012-01-19 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('137', '2012-01-19 15:51:50', '0', '0', '\0', null, '第47节课', null, null, '0', '0', '70', '2012-01-19 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('138', '2012-01-19 15:51:50', '0', '0', '\0', null, '第48节课', null, null, '0', '0', '70', '2012-01-19 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('139', '2012-01-20 15:51:50', '0', '0', '\0', null, '第49节课', null, null, '0', '0', '70', '2012-01-20 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('140', '2012-01-20 15:51:50', '0', '0', '\0', null, '第50节课', null, null, '0', '0', '70', '2012-01-20 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('141', '2012-01-20 15:51:50', '0', '0', '\0', null, '第51节课', null, null, '0', '0', '70', '2012-01-20 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('142', '2012-01-20 15:51:50', '0', '0', '\0', null, '第52节课', null, null, '0', '0', '70', '2012-01-20 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('143', '2012-01-21 15:51:50', '0', '0', '\0', null, '第53节课', null, null, '0', '0', '70', '2012-01-21 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('144', '2012-01-21 15:51:50', '0', '0', '\0', null, '第54节课', null, null, '0', '0', '70', '2012-01-21 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('145', '2012-01-21 15:51:50', '0', '0', '\0', null, '第55节课', null, null, '0', '0', '70', '2012-01-21 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('146', '2012-01-21 15:51:50', '0', '0', '\0', null, '第56节课', null, null, '0', '0', '70', '2012-01-21 16:51:50', '60', null, null);
INSERT INTO `class` VALUES ('147', '2012-01-22 16:24:15', '0', '0', '\0', null, '第1节课', null, null, '0', '0', '71', '2012-01-22 17:24:15', '60', null, null);
INSERT INTO `class` VALUES ('148', '2012-01-22 16:24:15', '0', '0', '\0', null, '第2节课', null, null, '0', '0', '71', '2012-01-22 17:24:15', '60', null, null);
INSERT INTO `class` VALUES ('149', '2012-01-22 16:24:15', '0', '0', '\0', null, '第3节课', null, null, '0', '0', '71', '2012-01-22 17:24:15', '60', null, null);
INSERT INTO `class` VALUES ('150', '2012-01-23 16:24:15', '0', '0', '\0', null, '第4节课', null, null, '0', '0', '71', '2012-01-23 17:24:15', '60', null, null);
INSERT INTO `class` VALUES ('151', '2012-01-23 16:24:15', '0', '0', '\0', null, '第5节课', null, null, '0', '0', '71', '2012-01-23 17:24:15', '60', null, null);
INSERT INTO `class` VALUES ('152', '2012-01-23 16:24:15', '0', '0', '\0', null, '第6节课', null, null, '0', '0', '71', '2012-01-23 17:24:15', '60', null, null);
INSERT INTO `class` VALUES ('153', '2012-01-23 16:31:20', '0', '0', '', null, '第1节课', null, null, '0', '0', '73', '2012-01-23 17:31:20', '60', null, null);
INSERT INTO `class` VALUES ('154', '2012-01-23 16:31:20', '0', '0', '', null, '第2节课', null, null, '0', '0', '73', '2012-01-23 17:31:20', '60', null, null);
INSERT INTO `class` VALUES ('155', '2012-01-23 16:31:20', '0', '0', '', null, '第3节课', null, null, '0', '0', '73', '2012-01-23 17:31:20', '60', null, null);
INSERT INTO `class` VALUES ('156', '2012-01-23 16:31:20', '0', '0', '', null, '第4节课', null, null, '0', '0', '73', '2012-01-23 17:31:20', '60', null, null);
INSERT INTO `class` VALUES ('157', '2012-01-23 16:31:20', '0', '0', '', null, '第5节课', null, null, '0', '0', '73', '2012-01-23 17:31:20', '60', null, null);
INSERT INTO `class` VALUES ('158', '2012-01-23 16:31:20', '0', '0', '', null, '第6节课', null, null, '0', '0', '73', '2012-01-23 17:31:20', '60', null, null);
INSERT INTO `class` VALUES ('159', '2012-01-30 16:31:21', '0', '0', '', null, '第7节课', null, null, '0', '0', '73', '2012-01-30 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('160', '2012-01-30 16:31:21', '0', '0', '', null, '第8节课', null, null, '0', '0', '73', '2012-01-30 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('161', '2012-01-30 16:31:21', '0', '0', '', null, '第9节课', null, null, '0', '0', '73', '2012-01-30 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('162', '2012-02-06 16:31:21', '0', '0', '', null, '第10节课', null, null, '0', '0', '73', '2012-02-06 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('164', '2012-02-06 16:31:21', '0', '0', '', null, '第11节课', null, null, '0', '0', '73', '2012-02-06 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('165', '2012-02-13 16:31:21', '0', '0', '', null, '第12节课', null, null, '0', '0', '73', '2012-02-13 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('166', '2012-02-13 16:31:21', '0', '0', '', null, '第13节课', null, null, '0', '0', '73', '2012-02-13 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('167', '2012-02-13 16:31:21', '0', '0', '', null, '第14节课', null, null, '0', '0', '73', '2012-02-13 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('168', '2012-02-20 16:31:21', '0', '0', '', null, '第15节课', null, null, '0', '0', '73', '2012-02-20 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('169', '2012-02-20 16:31:21', '0', '0', '', null, '第16节课', null, null, '0', '0', '73', '2012-02-20 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('170', '2012-02-20 16:31:21', '0', '0', '', null, '第17节课', null, null, '0', '0', '73', '2012-02-20 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('171', '2012-02-27 16:31:21', '0', '0', '', null, '第18节课', null, null, '0', '0', '73', '2012-02-27 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('172', '2012-02-27 16:31:21', '0', '0', '', null, '第19节课', null, null, '0', '0', '73', '2012-02-27 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('173', '2012-02-27 16:31:21', '0', '0', '', null, '第20节课', null, null, '0', '0', '73', '2012-02-27 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('174', '2012-03-05 16:31:21', '0', '0', '', null, '第21节课', null, null, '0', '0', '73', '2012-03-05 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('175', '2012-03-05 16:31:21', '0', '0', '', null, '第22节课', null, null, '0', '0', '73', '2012-03-05 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('176', '2012-03-05 16:31:21', '0', '0', '', null, '第23节课', null, null, '0', '0', '73', '2012-03-05 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('177', '2012-03-12 16:31:21', '0', '0', '', null, '第24节课', null, null, '0', '0', '73', '2012-03-12 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('178', '2012-03-12 16:31:21', '0', '0', '', null, '第25节课', null, null, '0', '0', '73', '2012-03-12 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('179', '2012-03-12 16:31:21', '0', '0', '', null, '第26节课', null, null, '0', '0', '73', '2012-03-12 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('180', '2012-03-19 16:31:21', '0', '0', '', null, '第27节课', null, null, '0', '0', '73', '2012-03-19 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('181', '2012-03-19 16:31:21', '0', '0', '', null, '第28节课', null, null, '0', '0', '73', '2012-03-19 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('182', '2012-03-19 16:31:21', '0', '0', '', null, '第29节课', null, null, '0', '0', '73', '2012-03-19 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('183', '2012-01-24 16:31:21', '0', '0', '', null, '第30节课', null, null, '0', '0', '73', '2012-01-24 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('184', '2012-01-24 16:31:21', '0', '0', '', null, '第31节课', null, null, '0', '0', '73', '2012-01-24 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('185', '2012-01-24 16:31:21', '0', '0', '', null, '第32节课', null, null, '0', '0', '73', '2012-01-24 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('186', '2012-01-24 16:31:21', '0', '0', '', null, '第33节课', null, null, '0', '0', '73', '2012-01-24 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('187', '2012-01-24 16:31:21', '0', '0', '', null, '第34节课', null, null, '0', '0', '73', '2012-01-24 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('188', '2012-01-24 16:31:21', '0', '0', '', null, '第35节课', null, null, '0', '0', '73', '2012-01-24 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('189', '2012-01-31 16:31:21', '0', '0', '', null, '第36节课', null, null, '0', '0', '73', '2012-01-31 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('190', '2012-01-31 16:31:21', '0', '0', '', null, '第37节课', null, null, '0', '0', '73', '2012-01-31 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('191', '2012-01-31 16:31:21', '0', '0', '', null, '第38节课', null, null, '0', '0', '73', '2012-01-31 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('192', '2012-02-07 16:31:21', '0', '0', '', null, '第39节课', null, null, '0', '0', '73', '2012-02-07 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('193', '2012-02-07 16:31:21', '0', '0', '', null, '第40节课', null, null, '0', '0', '73', '2012-02-07 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('194', '2012-02-07 16:31:21', '0', '0', '', null, '第41节课', null, null, '0', '0', '73', '2012-02-07 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('195', '2012-02-14 16:31:21', '0', '0', '', null, '第42节课', null, null, '0', '0', '73', '2012-02-14 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('196', '2012-02-14 16:31:21', '0', '0', '', null, '第43节课', null, null, '0', '0', '73', '2012-02-14 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('197', '2012-02-14 16:31:21', '0', '0', '', null, '第44节课', null, null, '0', '0', '73', '2012-02-14 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('198', '2012-02-21 16:31:21', '0', '0', '', null, '第45节课', null, null, '0', '0', '73', '2012-02-21 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('199', '2012-02-21 16:31:21', '0', '0', '', null, '第46节课', null, null, '0', '0', '73', '2012-02-21 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('200', '2012-02-21 16:31:21', '0', '0', '', null, '第47节课', null, null, '0', '0', '73', '2012-02-21 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('201', '2012-02-28 16:31:21', '0', '0', '', null, '第48节课', null, null, '0', '0', '73', '2012-02-28 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('202', '2012-02-28 16:31:21', '0', '0', '', null, '第49节课', null, null, '0', '0', '73', '2012-02-28 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('203', '2012-02-28 16:31:21', '0', '0', '', null, '第50节课', null, null, '0', '0', '73', '2012-02-28 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('204', '2012-03-06 16:31:21', '0', '0', '', null, '第51节课', null, null, '0', '0', '73', '2012-03-06 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('205', '2012-03-06 16:31:21', '0', '0', '', null, '第52节课', null, null, '0', '0', '73', '2012-03-06 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('206', '2012-03-06 16:31:21', '0', '0', '', null, '第53节课', null, null, '0', '0', '73', '2012-03-06 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('207', '2012-03-13 16:31:21', '0', '0', '', null, '第54节课', null, null, '0', '0', '73', '2012-03-13 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('208', '2012-03-13 16:31:21', '0', '0', '', null, '第55节课', null, null, '0', '0', '73', '2012-03-13 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('209', '2012-03-13 16:31:21', '0', '0', '', null, '第56节课', null, null, '0', '0', '73', '2012-03-13 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('210', '2012-03-20 16:31:21', '0', '0', '', null, '第57节课', null, null, '0', '0', '73', '2012-03-20 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('211', '2012-03-20 16:31:21', '0', '0', '', null, '第58节课', null, null, '0', '0', '73', '2012-03-20 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('212', '2012-03-20 16:31:21', '0', '0', '', null, '第59节课', null, null, '0', '0', '73', '2012-03-20 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('213', '2012-01-20 16:31:21', '0', '0', '', null, '第60节课', null, null, '0', '0', '73', '2012-01-20 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('214', '2012-01-20 16:31:21', '0', '0', '', null, '第61节课', null, null, '0', '0', '73', '2012-01-20 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('215', '2012-01-20 16:31:21', '0', '0', '', null, '第62节课', null, null, '0', '0', '73', '2012-01-20 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('216', '2012-01-27 16:31:21', '0', '0', '', null, '第63节课', null, null, '0', '0', '73', '2012-01-27 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('217', '2012-01-27 16:31:21', '0', '0', '', null, '第64节课', null, null, '0', '0', '73', '2012-01-27 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('218', '2012-01-27 16:31:21', '0', '0', '', null, '第65节课', null, null, '0', '0', '73', '2012-01-27 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('219', '2012-02-03 16:31:21', '0', '0', '', null, '第66节课', null, null, '0', '0', '73', '2012-02-03 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('220', '2012-02-03 16:31:21', '0', '0', '', null, '第67节课', null, null, '0', '0', '73', '2012-02-03 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('221', '2012-02-03 16:31:21', '0', '0', '', null, '第68节课', null, null, '0', '0', '73', '2012-02-03 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('222', '2012-02-10 16:31:21', '0', '0', '', null, '第69节课', null, null, '0', '0', '73', '2012-02-10 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('223', '2012-02-10 16:31:21', '0', '0', '', null, '第70节课', null, null, '0', '0', '73', '2012-02-10 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('224', '2012-02-10 16:31:21', '0', '0', '', null, '第71节课', null, null, '0', '0', '73', '2012-02-10 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('225', '2012-02-17 16:31:21', '0', '0', '', null, '第72节课', null, null, '0', '0', '73', '2012-02-17 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('226', '2012-02-17 16:31:21', '0', '0', '', null, '第73节课', null, null, '0', '0', '73', '2012-02-17 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('227', '2012-02-17 16:31:21', '0', '0', '', null, '第74节课', null, null, '0', '0', '73', '2012-02-17 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('228', '2012-02-24 16:31:21', '0', '0', '', null, '第75节课', null, null, '0', '0', '73', '2012-02-24 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('229', '2012-02-24 16:31:21', '0', '0', '', null, '第76节课', null, null, '0', '0', '73', '2012-02-24 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('230', '2012-02-24 16:31:21', '0', '0', '', null, '第77节课', null, null, '0', '0', '73', '2012-02-24 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('231', '2012-03-02 16:31:21', '0', '0', '', null, '第78节课', null, null, '0', '0', '73', '2012-03-02 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('232', '2012-03-02 16:31:21', '0', '0', '', null, '第79节课', null, null, '0', '0', '73', '2012-03-02 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('233', '2012-03-02 16:31:21', '0', '0', '', null, '第80节课', null, null, '0', '0', '73', '2012-03-02 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('234', '2012-03-09 16:31:21', '0', '0', '', null, '第81节课', null, null, '0', '0', '73', '2012-03-09 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('235', '2012-03-09 16:31:21', '0', '0', '', null, '第82节课', null, null, '0', '0', '73', '2012-03-09 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('236', '2012-03-09 16:31:21', '0', '0', '', null, '第83节课', null, null, '0', '0', '73', '2012-03-09 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('237', '2012-03-16 16:31:21', '0', '0', '', null, '第84节课', null, null, '0', '0', '73', '2012-03-16 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('238', '2012-03-16 16:31:21', '0', '0', '', null, '第85节课', null, null, '0', '0', '73', '2012-03-16 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('239', '2012-03-16 16:31:21', '0', '0', '', null, '第86节课', null, null, '0', '0', '73', '2012-03-16 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('240', '2012-03-23 16:31:21', '0', '0', '\0', null, '第87节课', null, null, '0', '0', '73', '2012-03-23 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('241', '2012-03-23 16:31:21', '0', '0', '\0', null, '第88节课', null, null, '0', '0', '73', '2012-03-23 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('242', '2012-03-23 16:31:21', '0', '0', '\0', null, '第89节课', null, null, '0', '0', '73', '2012-03-23 17:31:21', '60', null, null);
INSERT INTO `class` VALUES ('244', '2012-01-23 18:04:25', '0', '0', '\0', null, '第1节课', null, null, '0', '0', '74', '2012-01-23 19:04:25', '60', null, null);
INSERT INTO `class` VALUES ('245', '2012-01-23 18:04:25', '0', '0', '\0', null, '第2节课', null, null, '0', '0', '74', '2012-01-23 19:04:25', '60', null, null);
INSERT INTO `class` VALUES ('246', '2012-01-24 18:04:25', '0', '0', '\0', null, '第3节课', null, null, '0', '0', '74', '2012-01-24 19:04:25', '60', null, null);
INSERT INTO `class` VALUES ('247', '2012-01-24 18:04:25', '0', '0', '\0', null, '第4节课', null, null, '0', '0', '74', '2012-01-24 19:04:25', '60', null, null);
INSERT INTO `class` VALUES ('248', '2012-01-18 18:04:25', '0', '0', '', null, '第5节课', null, null, '0', '0', '74', '2012-01-18 19:04:25', '60', null, null);
INSERT INTO `class` VALUES ('249', '2012-01-18 18:04:25', '0', '0', '', null, '第6节课', null, null, '0', '0', '74', '2012-01-18 19:04:25', '60', null, null);
INSERT INTO `class` VALUES ('250', '2012-01-21 06:30:00', '0', '0', '\0', null, '第2节课', '元末农民起义', null, '0', '0', '75', '2012-01-21 07:15:00', '45', null, null);
INSERT INTO `class` VALUES ('251', '2012-01-21 00:30:00', '0', '0', '\0', null, '第1节课', '朱元璋崛起', null, '0', '0', '75', '2012-01-21 00:15:00', '45', null, null);
INSERT INTO `class` VALUES ('252', '2012-01-23 03:24:44', '0', '0', '', null, '第1节课', null, null, '0', '0', '76', '2012-01-23 04:24:44', '60', null, null);
INSERT INTO `class` VALUES ('253', '2012-01-23 03:24:44', '0', '0', '', null, '第2节课', null, null, '0', '0', '76', '2012-01-23 04:24:44', '60', null, null);
INSERT INTO `class` VALUES ('254', '2012-01-20 03:24:44', '0', '0', '', null, '第3节课', null, null, '0', '0', '76', '2012-01-20 04:24:44', '60', null, null);
INSERT INTO `class` VALUES ('255', '2012-01-27 03:24:44', '0', '0', '\0', null, '第4节课', null, null, '0', '0', '76', '2012-01-27 04:24:44', '60', null, null);
INSERT INTO `class` VALUES ('256', '2012-01-21 02:15:00', '0', '0', '\0', null, 'No.1', '讨论课', null, '0', '0', '78', '2012-01-21 03:15:00', '60', null, null);
INSERT INTO `class` VALUES ('257', '2012-01-31 06:20:00', '0', '0', '\0', null, '第1节课', '第一次讨论', null, '0', '0', '79', '2012-01-31 07:05:00', '45', null, null);
INSERT INTO `class` VALUES ('258', '2012-02-02 06:30:00', '0', '0', '\0', null, '第1节课', '讨论', null, '0', '0', '80', '2012-02-02 07:15:00', '45', null, null);
INSERT INTO `class` VALUES ('259', '2012-02-15 00:00:00', '0', '0', '\0', null, '第1节课', 'IT学着', null, '0', '0', '81', '2012-02-15 00:45:00', '45', null, null);
INSERT INTO `class` VALUES ('260', '2012-02-15 07:35:00', '0', '0', '\0', null, '第1节课', '自然浅谈', null, '0', '0', '82', '2012-02-15 08:20:00', '45', null, null);
INSERT INTO `class` VALUES ('261', '2012-02-17 01:15:00', '0', '0', '', null, '第1节课', '课程练习', null, '0', '0', '83', '2012-02-17 02:15:00', '60', null, null);
INSERT INTO `class` VALUES ('262', '2012-02-13 05:00:20', '0', '0', '', null, '第2节课', null, null, '0', '0', '83', '2012-02-13 05:45:20', '45', null, null);
INSERT INTO `class` VALUES ('263', '2012-02-13 05:00:20', '0', '0', '', null, '第3节课', null, null, '0', '0', '83', '2012-02-13 05:45:20', '45', null, null);
INSERT INTO `class` VALUES ('264', '2012-02-20 05:00:20', '0', '0', '', null, '第4节课', null, null, '0', '0', '83', '2012-02-20 05:45:20', '45', null, null);
INSERT INTO `class` VALUES ('265', '2012-02-11 05:00:20', '0', '0', '', null, '第5节课', null, null, '0', '0', '83', '2012-02-11 05:45:20', '45', null, null);
INSERT INTO `class` VALUES ('266', '2012-02-18 05:00:20', '0', '0', '', null, '第6节课', null, null, '0', '0', '83', '2012-02-18 05:45:20', '45', null, null);
INSERT INTO `class` VALUES ('267', '2012-02-25 05:00:20', '0', '0', '\0', null, '第7节课', null, null, '0', '0', '83', '2012-02-25 05:45:20', '45', '', '');
INSERT INTO `class` VALUES ('268', '2012-02-13 06:00:11', '0', '0', '\0', null, '第1节课', null, null, '0', '0', '84', '2012-02-13 06:45:11', '45', null, null);
INSERT INTO `class` VALUES ('269', '2012-02-13 06:00:11', '0', '0', '\0', null, '第2节课', null, null, '0', '0', '84', '2012-02-13 06:45:11', '45', null, null);
INSERT INTO `class` VALUES ('270', '2012-02-20 06:00:11', '0', '0', '\0', null, '第3节课', null, null, '0', '0', '84', '2012-02-20 06:45:11', '45', null, null);
INSERT INTO `class` VALUES ('271', '2012-02-27 06:00:11', '0', '0', '\0', null, '第4节课', null, null, '0', '0', '84', '2012-02-27 06:45:11', '45', null, null);
INSERT INTO `class` VALUES ('274', '2012-02-13 06:00:19', '0', '0', '\0', null, '第3节课', null, null, '0', '0', '85', '2012-02-13 06:45:19', '45', null, null);
INSERT INTO `class` VALUES ('275', '2012-02-13 06:00:13', '0', '0', '\0', null, '第1节课', null, null, '0', '0', '85', '2012-02-13 07:00:13', '60', null, null);
INSERT INTO `class` VALUES ('276', '2012-02-13 06:00:13', '0', '0', '\0', null, '第2节课', null, null, '0', '0', '85', '2012-02-13 07:00:13', '60', null, null);
INSERT INTO `class` VALUES ('277', '2012-02-20 06:00:13', '0', '0', '\0', null, '第7节课', null, null, '0', '0', '85', '2012-02-20 07:00:13', '60', null, null);
INSERT INTO `class` VALUES ('278', '2012-02-27 06:00:13', '0', '0', '\0', null, '第8节课', null, null, '0', '0', '85', '2012-02-27 07:00:13', '60', null, null);
INSERT INTO `class` VALUES ('279', '2012-02-13 08:00:03', '0', '0', '\0', null, '第4节课', null, null, '0', '0', '85', '2012-02-13 09:00:03', '60', null, null);
INSERT INTO `class` VALUES ('280', '2012-02-13 08:00:03', '0', '0', '\0', null, '第5节课', null, null, '0', '0', '85', '2012-02-13 09:00:03', '60', null, null);
INSERT INTO `class` VALUES ('281', '2012-02-15 16:00:00', '0', '0', '\0', null, '第6节课', 'fsdfs', null, '0', '0', '85', '2012-02-15 17:00:00', '60', null, null);
INSERT INTO `class` VALUES ('284', '2012-02-13 06:30:08', '0', '0', '\0', null, '第1节课', null, null, '0', '0', '86', '2012-02-13 07:30:08', '60', null, null);
INSERT INTO `class` VALUES ('285', '2012-02-20 06:30:08', '0', '0', '\0', null, '第2节课', null, null, '0', '0', '86', '2012-02-20 07:30:08', '60', null, null);
INSERT INTO `class` VALUES ('286', '2012-02-11 05:10:00', '0', '0', '\0', null, '第1节课', '123', null, '0', '0', '87', '2012-02-11 06:10:00', '60', null, null);
INSERT INTO `class` VALUES ('287', '2012-02-11 10:40:00', '0', '0', '\0', null, '第1节课', '123', null, '0', '0', '88', '2012-02-11 11:40:00', '60', null, null);
INSERT INTO `class` VALUES ('288', '2012-02-13 11:30:25', '0', '0', '', null, 'No.2', null, null, '0', '0', '89', '2012-02-13 12:30:25', '60', null, null);
INSERT INTO `class` VALUES ('289', '2012-02-13 11:30:25', '0', '0', '', null, 'No.3', null, null, '0', '0', '89', '2012-02-13 12:30:25', '60', null, null);
INSERT INTO `class` VALUES ('291', '2012-02-27 11:30:25', '0', '0', '', null, 'No.7', null, null, '0', '0', '89', '2012-02-27 12:30:25', '60', null, null);
INSERT INTO `class` VALUES ('292', '2012-03-05 11:30:25', '0', '0', '', null, 'No.10', null, null, '0', '0', '89', '2012-03-05 12:30:25', '60', null, null);
INSERT INTO `class` VALUES ('293', '2012-02-15 11:30:25', '0', '0', '', null, 'No.4', null, null, '0', '0', '89', '2012-02-15 12:30:25', '60', null, null);
INSERT INTO `class` VALUES ('296', '2012-02-29 11:30:25', '0', '0', '', null, 'No.8', null, null, '0', '0', '89', '2012-02-29 12:30:25', '60', null, null);
INSERT INTO `class` VALUES ('297', '2012-03-07 11:30:25', '0', '0', '', null, 'No.11', null, null, '0', '0', '89', '2012-03-07 12:30:25', '60', '', '');
INSERT INTO `class` VALUES ('298', '2012-02-10 11:30:25', '0', '0', '', null, 'No.1', null, null, '0', '0', '89', '2012-02-10 12:30:25', '60', null, null);
INSERT INTO `class` VALUES ('299', '2012-02-17 11:30:25', '0', '0', '', null, 'No.5', null, null, '0', '0', '89', '2012-02-17 12:30:25', '60', null, null);
INSERT INTO `class` VALUES ('300', '2012-02-24 11:30:25', '0', '0', '', null, 'No.6', null, null, '0', '0', '89', '2012-02-24 12:30:25', '60', null, null);
INSERT INTO `class` VALUES ('301', '2012-03-02 11:30:25', '0', '0', '', null, 'No.9', null, null, '0', '0', '89', '2012-03-02 12:30:25', '60', null, null);
INSERT INTO `class` VALUES ('302', '2012-03-09 11:30:25', '0', '0', '\0', null, 'No.12', null, null, '0', '0', '89', '2012-03-09 12:30:25', '60', null, null);
INSERT INTO `class` VALUES ('303', '2012-02-13 13:00:16', '0', '0', '', null, '第3节课', null, null, '0', '0', '90', '2012-02-13 12:15:16', '45', null, null);
INSERT INTO `class` VALUES ('304', '2012-02-13 13:00:16', '0', '0', '', null, '第4节课', null, null, '0', '0', '90', '2012-02-13 13:45:16', '45', null, null);
INSERT INTO `class` VALUES ('305', '2012-02-13 13:00:16', '0', '0', '', null, '第5节课', null, null, '0', '0', '90', '2012-02-13 12:15:16', '45', null, null);
INSERT INTO `class` VALUES ('307', '2012-02-20 13:00:16', '0', '0', '', null, '第8节课', null, null, '0', '0', '90', '2012-02-20 12:15:16', '45', null, null);
INSERT INTO `class` VALUES ('309', '2012-02-27 13:00:16', '0', '0', '', null, '第11节课', null, null, '0', '0', '90', '2012-02-27 12:15:16', '45', null, null);
INSERT INTO `class` VALUES ('310', '2012-02-27 13:00:16', '0', '0', '', null, '第12节课', null, null, '0', '0', '90', '2012-02-27 13:45:16', '45', null, null);
INSERT INTO `class` VALUES ('311', '2012-02-11 13:00:16', '0', '0', '', null, '第1节课', null, null, '0', '0', '90', '2012-02-11 12:15:16', '45', null, null);
INSERT INTO `class` VALUES ('312', '2012-02-11 13:00:16', '0', '0', '', null, '第2节课', null, null, '0', '0', '90', '2012-02-11 13:45:16', '45', null, null);
INSERT INTO `class` VALUES ('313', '2012-02-18 13:00:16', '0', '0', '', null, '第6节课', null, null, '0', '0', '90', '2012-02-18 12:15:16', '45', null, null);
INSERT INTO `class` VALUES ('314', '2012-02-18 13:00:16', '0', '0', '', null, '第7节课', null, null, '0', '0', '90', '2012-02-18 13:45:16', '45', null, null);
INSERT INTO `class` VALUES ('315', '2012-02-25 13:00:16', '0', '0', '', null, '第9节课', null, null, '0', '0', '90', '2012-02-25 12:15:16', '45', null, null);
INSERT INTO `class` VALUES ('316', '2012-02-25 13:00:16', '0', '0', '', null, '第10节课', null, null, '0', '0', '90', '2012-02-25 13:45:16', '45', null, null);
INSERT INTO `class` VALUES ('317', '2012-03-03 13:00:00', '0', '0', '\0', null, '第13节课', '', null, '0', '0', '90', '2012-03-03 13:45:00', '45', null, null);
INSERT INTO `class` VALUES ('318', '2012-03-03 13:00:16', '0', '0', '\0', null, '第14节课', null, null, '0', '0', '90', '2012-03-03 13:45:16', '45', null, null);
INSERT INTO `class` VALUES ('319', '2012-02-13 13:00:29', '0', '0', '', null, 'No.1', null, null, '0', '0', '91', '2012-02-13 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('320', '2012-02-13 13:00:29', '0', '0', '', null, 'No.2', null, null, '0', '0', '91', '2012-02-13 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('321', '2012-02-13 13:00:29', '0', '0', '', null, 'No.3', null, null, '0', '0', '91', '2012-02-13 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('322', '2012-02-13 13:00:29', '0', '0', '', null, 'No.4', null, null, '0', '0', '91', '2012-02-13 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('323', '2012-02-20 13:00:29', '0', '0', '', null, 'No.5', null, null, '0', '0', '91', '2012-02-20 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('324', '2012-02-20 13:00:29', '0', '0', '', null, 'No.6', null, null, '0', '0', '91', '2012-02-20 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('325', '2012-02-27 13:00:29', '0', '0', '', null, 'No.7', null, null, '0', '0', '91', '2012-02-27 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('326', '2012-02-27 13:00:29', '0', '0', '', null, 'No.8', null, null, '0', '0', '91', '2012-02-27 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('327', '2012-03-05 13:00:29', '0', '0', '', null, 'No.9', null, null, '0', '0', '91', '2012-03-05 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('328', '2012-03-05 13:00:29', '0', '0', '', null, 'No.10', null, null, '0', '0', '91', '2012-03-05 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('329', '2012-02-15 13:00:29', '0', '0', '', null, 'No.11', null, null, '0', '0', '91', '2012-02-15 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('330', '2012-02-15 13:00:29', '0', '0', '', null, 'No.12', null, null, '0', '0', '91', '2012-02-15 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('331', '2012-02-15 13:00:29', '0', '0', '', null, 'No.13', null, null, '0', '0', '91', '2012-02-15 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('332', '2012-02-15 13:00:29', '0', '0', '', null, 'No.14', null, null, '0', '0', '91', '2012-02-15 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('333', '2012-02-22 13:00:29', '0', '0', '', null, 'No.15', null, null, '0', '0', '91', '2012-02-22 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('334', '2012-02-22 13:00:29', '0', '0', '', null, 'No.16', null, null, '0', '0', '91', '2012-02-22 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('335', '2012-02-29 13:00:29', '0', '0', '', null, 'No.17', null, null, '0', '0', '91', '2012-02-29 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('336', '2012-02-29 13:00:29', '0', '0', '', null, 'No.18', null, null, '0', '0', '91', '2012-02-29 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('337', '2012-03-07 13:00:29', '0', '0', '', null, 'No.19', null, null, '0', '0', '91', '2012-03-07 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('338', '2012-03-07 13:00:29', '0', '0', '', null, 'No.20', null, null, '0', '0', '91', '2012-03-07 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('339', '2012-02-10 13:00:29', '0', '0', '', null, 'No.21', null, null, '0', '0', '91', '2012-02-10 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('340', '2012-02-10 13:00:29', '0', '0', '', null, 'No.22', null, null, '0', '0', '91', '2012-02-10 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('341', '2012-02-17 13:00:29', '0', '0', '', null, 'No.23', null, null, '0', '0', '91', '2012-02-17 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('342', '2012-02-17 13:00:29', '0', '0', '', null, 'No.24', null, null, '0', '0', '91', '2012-02-17 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('343', '2012-02-24 13:00:29', '0', '0', '', null, 'No.25', null, null, '0', '0', '91', '2012-02-24 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('344', '2012-02-24 13:00:29', '0', '0', '', null, 'No.26', null, null, '0', '0', '91', '2012-02-24 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('345', '2012-03-02 13:00:29', '0', '0', '', null, 'No.27', null, null, '0', '0', '91', '2012-03-02 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('346', '2012-03-02 13:00:29', '0', '0', '', null, 'No.28', null, null, '0', '0', '91', '2012-03-02 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('347', '2012-03-09 13:00:29', '0', '0', '\0', null, 'No.29', null, null, '0', '0', '91', '2012-03-09 13:00:29', '60', null, null);
INSERT INTO `class` VALUES ('348', '2012-03-09 13:00:29', '0', '0', '\0', null, 'No.30', null, null, '0', '0', '91', '2012-03-09 14:00:29', '60', null, null);
INSERT INTO `class` VALUES ('349', '2012-10-01 16:00:00', '0', '0', '\0', '', 'No.1', 'test', null, '0', '0', '92', '2012-10-01 17:00:00', '60', '', null);
INSERT INTO `class` VALUES ('350', '2012-02-16 10:50:00', '0', '0', '', '', '第1节课', '123', null, '0', '0', '93', '2012-02-16 11:50:00', '60', null, null);
INSERT INTO `class` VALUES ('351', '2012-02-13 10:00:03', '0', '0', '', null, '第3节课', null, null, '0', '0', '94', '2012-02-13 09:45:03', '45', null, null);
INSERT INTO `class` VALUES ('353', '2012-02-13 10:00:03', '0', '0', '', null, '第4节课', null, null, '0', '0', '94', '2012-02-13 09:45:03', '45', null, null);
INSERT INTO `class` VALUES ('354', '2012-02-13 10:00:03', '0', '0', '', null, '第5节课', null, null, '0', '0', '94', '2012-02-13 10:45:03', '45', null, null);
INSERT INTO `class` VALUES ('355', '2012-02-11 10:00:03', '0', '0', '', null, '第1节课', null, null, '0', '0', '94', '2012-02-11 09:45:03', '45', null, null);
INSERT INTO `class` VALUES ('356', '2012-02-11 10:00:03', '0', '0', '', null, '第2节课', null, null, '0', '0', '94', '2012-02-11 10:45:03', '45', null, null);
INSERT INTO `class` VALUES ('357', '2012-02-18 10:00:03', '0', '0', '\0', null, '第6节课', null, null, '0', '0', '94', '2012-02-18 09:45:03', '45', null, null);
INSERT INTO `class` VALUES ('358', '2012-02-18 10:00:03', '0', '0', '\0', null, '第7节课', null, null, '0', '0', '94', '2012-02-18 10:45:03', '45', null, null);
INSERT INTO `class` VALUES ('360', '2013-01-02 09:30:00', '0', '0', '\0', null, 'No.24', '3', null, '0', '0', '96', '2013-01-02 10:25:00', '55', null, null);
INSERT INTO `class` VALUES ('361', '2012-02-13 09:30:19', '0', '0', '', null, 'No.3', null, null, '0', '0', '96', '2012-02-13 08:55:19', '55', null, null);
INSERT INTO `class` VALUES ('362', '2013-01-02 09:30:00', '0', '0', '\0', null, 'No.25', '5', null, '0', '0', '96', '2013-01-02 10:25:00', '55', null, null);
INSERT INTO `class` VALUES ('363', '2012-02-20 09:30:19', '0', '0', '', null, 'No.8', null, null, '0', '0', '96', '2012-02-20 08:55:19', '55', null, null);
INSERT INTO `class` VALUES ('364', '2012-02-20 09:30:19', '0', '0', '', null, 'No.9', null, null, '0', '0', '96', '2012-02-20 10:25:19', '55', null, null);
INSERT INTO `class` VALUES ('365', '2012-02-27 09:30:19', '0', '0', '', null, 'No.13', null, null, '0', '0', '96', '2012-02-27 08:55:19', '55', null, null);
INSERT INTO `class` VALUES ('366', '2012-02-27 09:30:19', '0', '0', '', null, 'No.14', null, null, '0', '0', '96', '2012-02-27 10:25:19', '55', null, null);
INSERT INTO `class` VALUES ('367', '2012-03-05 09:30:19', '0', '0', '', null, 'No.19', null, null, '0', '0', '96', '2012-03-05 08:55:19', '55', null, null);
INSERT INTO `class` VALUES ('368', '2012-03-05 09:30:19', '0', '0', '', null, 'No.20', null, null, '0', '0', '96', '2012-03-05 10:25:19', '55', null, null);
INSERT INTO `class` VALUES ('369', '2012-02-15 09:30:19', '0', '0', '', null, 'No.4', null, null, '0', '0', '96', '2012-02-15 08:55:19', '55', null, null);
INSERT INTO `class` VALUES ('370', '2013-03-02 09:30:00', '0', '0', '\0', null, 'No.26', 'Hello', null, '0', '0', '96', '2013-03-02 10:25:00', '55', null, null);
INSERT INTO `class` VALUES ('372', '2012-02-15 09:30:19', '0', '0', '', null, 'No.5', null, null, '0', '0', '96', '2012-02-15 10:25:19', '55', null, null);
INSERT INTO `class` VALUES ('373', '2013-10-02 09:30:00', '0', '0', '\0', null, 'No.27', '12', null, '0', '0', '96', '2013-10-02 10:25:00', '55', null, null);
INSERT INTO `class` VALUES ('374', '2012-02-22 09:30:19', '0', '0', '', null, 'No.10', null, null, '0', '0', '96', '2012-02-22 10:25:19', '55', null, null);
INSERT INTO `class` VALUES ('375', '2012-02-29 09:30:19', '0', '0', '', null, 'No.15', null, null, '0', '0', '96', '2012-02-29 08:55:19', '55', null, null);
INSERT INTO `class` VALUES ('376', '2012-02-29 09:30:19', '0', '0', '', null, 'No.16', null, null, '0', '0', '96', '2012-02-29 10:25:19', '55', null, null);
INSERT INTO `class` VALUES ('377', '2012-03-07 09:30:19', '0', '0', '', null, 'No.21', null, null, '0', '0', '96', '2012-03-07 08:55:19', '55', null, null);
INSERT INTO `class` VALUES ('379', '2012-02-11 09:30:19', '0', '0', '', null, 'No.1', null, null, '0', '0', '96', '2012-02-11 08:55:19', '55', null, null);
INSERT INTO `class` VALUES ('380', '2012-02-11 09:30:19', '0', '0', '', null, 'No.2', null, null, '0', '0', '96', '2012-02-11 10:25:19', '55', null, null);
INSERT INTO `class` VALUES ('381', '2012-02-12 02:30:19', '0', '0', '', null, 'No.6', null, null, '0', '0', '96', '2012-02-18 22:55:19', '55', null, null);
INSERT INTO `class` VALUES ('382', '2012-02-18 09:30:19', '0', '0', '', null, 'No.7', null, null, '0', '0', '96', '2012-02-18 10:25:19', '55', null, null);
INSERT INTO `class` VALUES ('383', '2012-02-25 09:30:19', '0', '0', '', null, 'No.11', null, null, '0', '0', '96', '2012-02-25 08:55:19', '55', null, null);
INSERT INTO `class` VALUES ('384', '2012-02-25 09:30:19', '0', '0', '', null, 'No.12', null, null, '0', '0', '96', '2012-02-25 10:25:19', '55', null, null);
INSERT INTO `class` VALUES ('385', '2012-03-03 09:30:19', '0', '0', '', null, 'No.17', null, null, '0', '0', '96', '2012-03-03 08:55:19', '55', null, null);
INSERT INTO `class` VALUES ('386', '2012-03-03 09:30:19', '0', '0', '', null, 'No.18', null, null, '0', '0', '96', '2012-03-03 10:25:19', '55', null, null);
INSERT INTO `class` VALUES ('387', '2012-03-10 09:30:19', '0', '0', '', null, 'No.22', null, null, '0', '0', '96', '2012-03-10 08:55:19', '55', null, null);
INSERT INTO `class` VALUES ('388', '2012-03-10 09:30:19', '0', '0', '', null, 'No.23', null, null, '0', '0', '96', '2012-03-10 10:25:19', '55', null, null);
INSERT INTO `class` VALUES ('389', '2012-02-12 02:30:00', '0', '0', '', null, '第1节课', '企业文化浅谈', null, '0', '0', '97', '2012-02-12 15:45:00', '45', null, null);
INSERT INTO `class` VALUES ('390', '2012-02-17 02:35:00', '0', '0', '\0', '', '第2节课', '企业领导战略眼光', null, '0', '0', '97', '2012-02-17 03:20:00', '45', null, null);
INSERT INTO `class` VALUES ('391', '2012-02-20 10:36:03', '0', '0', '', '', 'No.5', null, null, '0', '0', '98', '2012-02-20 11:36:03', '60', null, null);
INSERT INTO `class` VALUES ('392', '2012-02-20 14:30:03', '0', '0', '', null, 'No.7', null, null, '0', '0', '98', '2012-02-20 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('393', '2012-02-20 10:36:03', '0', '0', '', null, 'No.6', null, null, '0', '0', '98', '2012-02-20 11:36:03', '60', null, null);
INSERT INTO `class` VALUES ('394', '2012-02-20 14:30:03', '0', '0', '', null, 'No.8', null, null, '0', '0', '98', '2012-02-20 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('395', '2012-02-27 10:36:03', '0', '0', '', null, 'No.13', null, null, '0', '0', '98', '2012-02-27 11:36:03', '60', '', '');
INSERT INTO `class` VALUES ('396', '2012-02-27 14:30:03', '0', '0', '', null, 'No.14', null, null, '0', '0', '98', '2012-02-27 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('397', '2012-03-05 10:36:03', '0', '0', '', null, 'No.19', null, null, '0', '0', '98', '2012-03-05 11:36:03', '60', '', '');
INSERT INTO `class` VALUES ('398', '2012-03-05 14:30:03', '0', '0', '', null, 'No.20', null, null, '0', '0', '98', '2012-03-05 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('399', '2012-03-12 10:36:03', '0', '0', '', null, 'No.25', null, null, '0', '0', '98', '2012-03-12 11:36:03', '60', null, null);
INSERT INTO `class` VALUES ('400', '2012-03-12 14:30:03', '0', '0', '', null, 'No.26', null, null, '0', '0', '98', '2012-03-12 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('401', '2012-02-15 10:36:03', '0', '0', '', null, 'No.1', null, null, '0', '0', '98', '2012-02-15 11:36:03', '60', null, null);
INSERT INTO `class` VALUES ('402', '2012-02-15 14:30:03', '0', '0', '', null, 'No.2', null, null, '0', '0', '98', '2012-02-15 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('403', '2012-02-22 10:36:03', '0', '0', '', null, 'No.9', null, null, '0', '0', '98', '2012-02-22 11:36:03', '60', null, null);
INSERT INTO `class` VALUES ('404', '2012-02-22 14:30:03', '0', '0', '', null, 'No.10', null, null, '0', '0', '98', '2012-02-22 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('405', '2012-02-29 10:36:03', '0', '0', '', null, 'No.15', null, null, '0', '0', '98', '2012-02-29 11:36:03', '60', null, null);
INSERT INTO `class` VALUES ('406', '2012-02-29 14:30:03', '0', '0', '', null, 'No.16', null, null, '0', '0', '98', '2012-02-29 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('407', '2012-03-07 10:36:03', '0', '0', '', null, 'No.21', null, null, '0', '0', '98', '2012-03-07 11:36:03', '60', '', '');
INSERT INTO `class` VALUES ('408', '2012-03-07 14:30:03', '0', '0', '', null, 'No.22', null, null, '0', '0', '98', '2012-03-07 15:25:03', '55', '', '');
INSERT INTO `class` VALUES ('409', '2012-03-14 10:36:03', '0', '0', '', null, 'No.27', null, null, '0', '0', '98', '2012-03-14 11:36:03', '60', null, null);
INSERT INTO `class` VALUES ('410', '2012-03-14 14:30:03', '0', '0', '', null, 'No.28', null, null, '0', '0', '98', '2012-03-14 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('411', '2012-02-18 10:36:03', '0', '0', '', null, 'No.3', null, null, '0', '0', '98', '2012-02-18 11:36:03', '60', null, null);
INSERT INTO `class` VALUES ('412', '2012-02-18 14:30:03', '0', '0', '', null, 'No.4', null, null, '0', '0', '98', '2012-02-18 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('413', '2012-02-25 10:36:03', '0', '0', '', null, 'No.11', null, null, '0', '0', '98', '2012-02-25 11:36:03', '60', null, null);
INSERT INTO `class` VALUES ('414', '2012-02-25 14:30:03', '0', '0', '', null, 'No.12', null, null, '0', '0', '98', '2012-02-25 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('415', '2012-03-03 10:36:03', '0', '0', '', null, 'No.17', null, null, '0', '0', '98', '2012-03-03 11:36:03', '60', null, null);
INSERT INTO `class` VALUES ('416', '2012-03-03 14:30:03', '0', '0', '', null, 'No.18', null, null, '0', '0', '98', '2012-03-03 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('417', '2012-03-10 10:36:03', '0', '0', '', null, 'No.23', null, null, '0', '0', '98', '2012-03-10 11:36:03', '60', null, null);
INSERT INTO `class` VALUES ('418', '2012-03-10 14:30:03', '0', '0', '', null, 'No.24', null, null, '0', '0', '98', '2012-03-10 15:25:03', '55', '', null);
INSERT INTO `class` VALUES ('419', '2012-03-17 10:36:03', '0', '0', '\0', null, 'No.29', null, null, '0', '0', '98', '2012-03-17 11:36:03', '60', null, null);
INSERT INTO `class` VALUES ('420', '2012-03-17 14:30:03', '0', '0', '\0', null, 'No.30', null, null, '0', '0', '98', '2012-03-17 15:25:03', '55', null, null);
INSERT INTO `class` VALUES ('421', '2012-02-13 02:35:00', '0', '0', '', null, '第1节课', '系统测试', null, '0', '0', '99', '2012-02-13 16:20:00', '45', null, null);
INSERT INTO `class` VALUES ('422', '2012-02-15 00:40:00', '0', '0', '', '', '第2节课', '测试系统', null, '0', '0', '99', '2012-02-15 16:30:00', '50', null, null);
INSERT INTO `class` VALUES ('423', '2012-02-16 06:30:00', '0', '0', '\0', '', '第1节课', '编译原理概述', null, '0', '0', '102', '2012-02-16 07:15:00', '45', null, null);
INSERT INTO `class` VALUES ('424', '2012-02-16 06:30:00', '0', '0', '', '', '第1节课', '操作系统绪论', null, '0', '0', '103', '2012-02-16 07:15:00', '45', null, null);
INSERT INTO `class` VALUES ('425', '2013-04-02 11:00:00', '0', '0', '\0', '\0', 'No.1', 'Introduction', null, '0', '0', '104', '2013-04-02 12:00:00', '60', null, null);
INSERT INTO `class` VALUES ('426', '2013-04-02 11:00:00', '0', '0', '\0', '\0', 'No.2', 'Introduction', null, '0', '0', '104', '2013-04-02 12:00:00', '60', null, null);
INSERT INTO `class` VALUES ('434', '2012-02-16 02:00:09', '0', '0', '', '', 'No.1', null, null, '0', '0', '106', '2012-02-16 03:00:09', '60', null, null);
INSERT INTO `class` VALUES ('435', '2012-02-18 02:00:09', '0', '0', '\0', '', 'No.2', null, null, '0', '0', '106', '2012-02-18 03:00:09', '60', null, null);
INSERT INTO `class` VALUES ('436', '2012-02-18 11:40:00', '0', '0', '\0', '\0', '第1节课', '123', null, '0', '0', '107', '2012-02-18 12:40:00', '60', null, null);
INSERT INTO `class` VALUES ('437', '2012-02-19 00:15:00', '0', '0', '\0', '\0', '第2节课', '1234', null, '0', '0', '107', '2012-02-19 00:10:00', '55', null, null);
INSERT INTO `class` VALUES ('438', '2012-02-17 11:40:00', '0', '0', '\0', '', '第1节课', '123', null, '0', '0', '108', '2012-02-17 12:40:00', '60', null, null);
INSERT INTO `class` VALUES ('439', '2012-02-16 02:30:35', '0', '0', '', '', 'No.1', null, null, '0', '0', '109', '2012-02-16 03:30:35', '60', null, null);
INSERT INTO `class` VALUES ('440', '2012-02-18 02:30:35', '0', '0', '\0', '', 'No.2', null, null, '0', '0', '109', '2012-02-18 03:30:35', '60', null, null);
INSERT INTO `class` VALUES ('441', '2012-04-03 06:40:00', '0', '0', '\0', '\0', '第1节课', '123', null, '0', '0', '110', '2012-04-03 07:40:00', '60', null, null);
INSERT INTO `class` VALUES ('442', '2012-02-16 01:25:00', '0', '0', '', '', '第1节课', '测试第一步', null, '0', '0', '112', '2012-02-16 16:20:00', '55', null, null);
INSERT INTO `class` VALUES ('443', '2012-02-20 01:40:00', '0', '0', '', '', '第2节课', '测试第二步', null, '0', '0', '112', '2012-02-20 02:30:00', '50', null, null);
INSERT INTO `class` VALUES ('444', '2012-02-01 05:35:00', '0', '0', '', '\0', '第1节课', '测试时间第一节', null, '0', '0', '113', '2012-02-01 06:30:00', '55', null, null);
INSERT INTO `class` VALUES ('445', '2012-02-17 02:35:00', '0', '0', '\0', '\0', '第2节课', '哎呀妈呀对了', null, '0', '0', '113', '2012-02-17 03:20:00', '45', null, null);
INSERT INTO `class` VALUES ('446', '2012-02-15 21:55:00', '0', '0', '', '\0', '第1节课', '时间真的坏了', null, '0', '0', '114', '2012-02-15 22:40:00', '45', null, null);
INSERT INTO `class` VALUES ('447', '2012-02-17 01:40:00', '0', '0', '\0', '\0', '第2节课', '还好吗', null, '0', '0', '114', '2012-02-17 02:25:00', '45', null, null);
INSERT INTO `class` VALUES ('448', '2012-02-16 07:05:00', '0', '0', '', '\0', '第1节课', '123测试一', null, '0', '0', '115', '2012-02-16 07:50:00', '45', null, null);
INSERT INTO `class` VALUES ('449', '2012-02-20 06:20:00', '0', '0', '\0', '', '第2节课', '234测试二', null, '0', '0', '115', '2012-02-20 22:10:00', '50', '', '');
INSERT INTO `class` VALUES ('450', '2012-02-16 08:37:00', '0', '0', '', '', '第1节课', '口语课', null, '0', '0', '116', '2012-02-16 09:37:00', '60', '', '\0');
INSERT INTO `class` VALUES ('451', '2013-05-02 12:00:00', '0', '0', '\0', '', 'No.1', '介绍', null, '0', '0', '117', '2013-05-02 13:00:00', '60', null, null);
INSERT INTO `class` VALUES ('452', '2013-04-02 11:00:00', '0', '0', '\0', '\0', 'No.1', 'sdf', null, '0', '0', '118', '2013-04-02 12:00:00', '60', null, null);
INSERT INTO `class` VALUES ('453', '2013-04-02 10:00:00', '0', '0', '\0', '\0', 'No.1', 'sfd', null, '0', '0', '119', '2013-04-02 11:00:00', '60', null, null);
INSERT INTO `class` VALUES ('454', '2012-02-16 11:20:00', '0', '0', '\0', '\0', '第1节课', '测试系统', null, '0', '0', '120', '2012-02-16 12:10:00', '50', null, null);
INSERT INTO `class` VALUES ('455', '2012-02-17 00:30:00', '0', '0', '\0', '\0', '第2节课', '系统测试', null, '0', '0', '120', '2012-02-17 00:25:00', '55', null, null);
INSERT INTO `class` VALUES ('456', '2013-04-02 11:10:00', '0', '0', '\0', '\0', 'No.1', '测试系统', null, '0', '0', '121', '2013-04-02 12:10:00', '60', null, null);
INSERT INTO `class` VALUES ('457', '2013-05-02 13:10:00', '0', '0', '\0', '\0', 'No.2', '系统测试', null, '0', '0', '121', '2013-05-02 14:05:00', '55', null, null);
INSERT INTO `class` VALUES ('458', '2012-02-20 11:00:53', '0', '0', '', '', 'No.4', null, null, '0', '0', '123', '2012-02-20 12:00:53', '60', null, null);
INSERT INTO `class` VALUES ('459', '2012-02-20 12:00:53', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '123', '2012-02-20 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('460', '2012-02-20 13:00:53', '0', '0', '', '\0', 'No.8', null, null, '0', '0', '123', '2012-02-20 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('461', '2012-02-20 11:00:53', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '123', '2012-02-20 12:00:53', '60', null, null);
INSERT INTO `class` VALUES ('462', '2012-02-20 12:00:53', '0', '0', '', '\0', 'No.7', null, null, '0', '0', '123', '2012-02-20 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('463', '2012-02-20 13:00:53', '0', '0', '', '\0', 'No.9', null, null, '0', '0', '123', '2012-02-20 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('464', '2012-02-27 11:00:53', '0', '0', '', '\0', 'No.19', null, null, '0', '0', '123', '2012-02-27 12:00:53', '60', '', '');
INSERT INTO `class` VALUES ('465', '2012-02-27 12:00:53', '0', '0', '', '\0', 'No.20', null, null, '0', '0', '123', '2012-02-27 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('466', '2012-02-27 13:00:53', '0', '0', '', '\0', 'No.21', null, null, '0', '0', '123', '2012-02-27 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('467', '2012-03-05 11:00:53', '0', '0', '', '\0', 'No.28', null, null, '0', '0', '123', '2012-03-05 12:00:53', '60', '', '');
INSERT INTO `class` VALUES ('468', '2012-03-05 12:00:53', '0', '0', '', '\0', 'No.29', null, null, '0', '0', '123', '2012-03-05 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('469', '2012-03-05 13:00:53', '0', '0', '', '\0', 'No.30', null, null, '0', '0', '123', '2012-03-05 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('470', '2012-03-12 11:00:53', '0', '0', '', '\0', 'No.37', null, null, '0', '0', '123', '2012-03-12 12:00:53', '60', null, null);
INSERT INTO `class` VALUES ('471', '2012-03-12 12:00:53', '0', '0', '', '\0', 'No.38', null, null, '0', '0', '123', '2012-03-12 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('472', '2012-03-12 13:00:53', '0', '0', '', '\0', 'No.39', null, null, '0', '0', '123', '2012-03-12 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('473', '2012-02-22 11:00:53', '0', '0', '', '\0', 'No.10', null, null, '0', '0', '123', '2012-02-22 12:00:53', '60', null, null);
INSERT INTO `class` VALUES ('474', '2012-02-22 12:00:53', '0', '0', '', '\0', 'No.12', null, null, '0', '0', '123', '2012-02-22 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('475', '2012-02-22 13:00:53', '0', '0', '', '\0', 'No.14', null, null, '0', '0', '123', '2012-02-22 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('476', '2012-02-22 11:00:53', '0', '0', '', '\0', 'No.11', null, null, '0', '0', '123', '2012-02-22 12:00:53', '60', null, null);
INSERT INTO `class` VALUES ('477', '2012-02-22 12:00:53', '0', '0', '', '\0', 'No.13', null, null, '0', '0', '123', '2012-02-22 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('478', '2012-02-22 13:00:53', '0', '0', '', '\0', 'No.15', null, null, '0', '0', '123', '2012-02-22 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('479', '2012-02-29 11:00:53', '0', '0', '', '\0', 'No.22', null, null, '0', '0', '123', '2012-02-29 12:00:53', '60', '', '');
INSERT INTO `class` VALUES ('480', '2012-02-29 12:00:53', '0', '0', '', '\0', 'No.23', null, null, '0', '0', '123', '2012-02-29 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('481', '2012-02-29 13:00:53', '0', '0', '', '\0', 'No.24', null, null, '0', '0', '123', '2012-02-29 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('482', '2012-03-07 11:00:53', '0', '0', '', '\0', 'No.31', null, null, '0', '0', '123', '2012-03-07 12:00:53', '60', '', '');
INSERT INTO `class` VALUES ('483', '2012-03-07 12:00:53', '0', '0', '', '\0', 'No.32', null, null, '0', '0', '123', '2012-03-07 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('484', '2012-03-07 13:00:53', '0', '0', '', '\0', 'No.33', null, null, '0', '0', '123', '2012-03-07 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('485', '2012-03-14 11:00:53', '0', '0', '', '\0', 'No.40', null, null, '0', '0', '123', '2012-03-14 12:00:53', '60', null, null);
INSERT INTO `class` VALUES ('486', '2012-03-14 12:00:53', '0', '0', '', '\0', 'No.41', null, null, '0', '0', '123', '2012-03-14 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('487', '2012-03-14 13:00:53', '0', '0', '', '\0', 'No.42', null, null, '0', '0', '123', '2012-03-14 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('488', '2012-02-17 11:00:53', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '123', '2012-02-17 12:00:53', '60', null, null);
INSERT INTO `class` VALUES ('489', '2012-02-17 12:00:53', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '123', '2012-02-17 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('490', '2012-02-17 13:00:53', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '123', '2012-02-17 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('491', '2012-02-24 11:00:53', '0', '0', '', '\0', 'No.16', null, null, '0', '0', '123', '2012-02-24 12:00:53', '60', '', '');
INSERT INTO `class` VALUES ('492', '2012-02-24 12:00:53', '0', '0', '', '\0', 'No.17', null, null, '0', '0', '123', '2012-02-24 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('493', '2012-02-24 13:00:53', '0', '0', '', '\0', 'No.18', null, null, '0', '0', '123', '2012-02-24 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('494', '2012-03-02 11:00:53', '0', '0', '', '\0', 'No.25', null, null, '0', '0', '123', '2012-03-02 12:00:53', '60', '', '');
INSERT INTO `class` VALUES ('495', '2012-03-02 12:00:53', '0', '0', '', '\0', 'No.26', null, null, '0', '0', '123', '2012-03-02 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('496', '2012-03-02 13:00:53', '0', '0', '', '\0', 'No.27', null, null, '0', '0', '123', '2012-03-02 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('497', '2012-03-09 11:00:53', '0', '0', '', '\0', 'No.34', null, null, '0', '0', '123', '2012-03-09 12:00:53', '60', '', null);
INSERT INTO `class` VALUES ('498', '2012-03-09 12:00:53', '0', '0', '', '\0', 'No.35', null, null, '0', '0', '123', '2012-03-09 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('499', '2012-03-09 13:00:53', '0', '0', '', '\0', 'No.36', null, null, '0', '0', '123', '2012-03-09 14:00:53', '60', null, null);
INSERT INTO `class` VALUES ('500', '2012-03-16 11:00:53', '0', '0', '', '\0', 'No.43', null, null, '0', '0', '123', '2012-03-16 12:00:53', '60', null, null);
INSERT INTO `class` VALUES ('501', '2012-03-16 12:00:53', '0', '0', '\0', '\0', 'No.44', null, null, '0', '0', '123', '2012-03-16 13:00:53', '60', null, null);
INSERT INTO `class` VALUES ('502', '2012-03-16 13:00:53', '0', '0', '\0', '\0', 'No.45', null, null, '0', '0', '123', '2012-03-16 14:00:53', '60', '', '');
INSERT INTO `class` VALUES ('503', '2012-02-20 02:30:00', '0', '0', '', '', '第1节课', '成本论', null, '0', '0', '125', '2012-02-20 22:15:00', '45', '', '\0');
INSERT INTO `class` VALUES ('504', '2012-02-21 02:30:00', '0', '0', '\0', '\0', 'No.1', 'Hello', null, '0', '0', '126', '2012-02-21 03:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('505', '2012-02-23 02:35:00', '0', '0', '\0', '\0', 'No.1', '发邮件啦', null, '0', '0', '127', '2012-02-23 03:25:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('506', '2012-02-25 06:20:00', '0', '0', '\0', '\0', 'No.2', '系统测试', null, '0', '0', '127', '2012-02-25 07:15:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('507', '2012-02-22 06:45:00', '0', '0', '\0', '\0', '第1节课', '发啦，真的发啦', null, '0', '0', '128', '2012-02-22 07:35:00', '50', '', '\0');
INSERT INTO `class` VALUES ('508', '2012-02-21 07:00:00', '0', '0', '\0', '\0', 'No.1', 'Testing', null, '0', '0', '129', '2012-02-21 08:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('509', '2012-02-21 11:30:00', '0', '0', '\0', '\0', 'No.1', 'Testing', null, '0', '0', '131', '2012-02-21 12:30:00', '60', '', '\0');
INSERT INTO `class` VALUES ('510', '2012-02-15 11:00:00', '0', '0', '\0', '\0', 'No.1', 'Hello', null, '0', '0', '132', '2012-02-15 12:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('511', '2012-02-22 11:00:00', '0', '0', '\0', '\0', 'No.1', 'Tesing', null, '0', '0', '133', '2012-02-22 12:00:00', '60', '', '');
INSERT INTO `class` VALUES ('512', '2012-02-23 05:40:00', '0', '0', '\0', '\0', '第1节课', '效果挺好的，继续加油', null, '0', '0', '134', '2012-02-23 06:35:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('513', '2012-02-23 10:00:00', '0', '0', '\0', '\0', 'No.1', 'Hello', null, '0', '0', '135', '2012-02-23 11:00:00', '60', '', '\0');
INSERT INTO `class` VALUES ('514', '2012-02-23 11:00:00', '0', '0', '\0', '\0', 'No.1', 'hello... ', null, '0', '0', '136', '2012-02-23 12:00:00', '60', '', '');
INSERT INTO `class` VALUES ('515', '2012-02-22 11:40:00', '0', '0', '\0', '\0', 'No.1', 'hao hao de', null, '0', '0', '137', '2012-02-22 12:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('516', '2012-02-26 10:30:18', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '139', '2012-02-26 11:30:18', '60', '\0', '\0');
INSERT INTO `class` VALUES ('517', '2012-02-26 10:30:18', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '139', '2012-02-26 11:30:18', '60', '\0', '\0');
INSERT INTO `class` VALUES ('518', '2012-03-04 10:30:18', '0', '0', '', '\0', 'No.13', null, null, '0', '0', '139', '2012-03-04 11:30:18', '60', '\0', '\0');
INSERT INTO `class` VALUES ('519', '2012-02-28 10:30:18', '0', '0', '', '\0', 'No.7', null, null, '0', '0', '139', '2012-02-28 11:30:18', '60', '\0', '\0');
INSERT INTO `class` VALUES ('520', '2012-02-28 10:30:18', '0', '0', '', '\0', 'No.8', null, null, '0', '0', '139', '2012-02-28 11:30:18', '60', '\0', '\0');
INSERT INTO `class` VALUES ('521', '2012-03-06 10:30:18', '0', '0', '', '\0', 'No.15', null, null, '0', '0', '139', '2012-03-06 11:30:18', '60', '\0', '\0');
INSERT INTO `class` VALUES ('522', '2012-02-25 10:30:18', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '139', '2012-02-25 11:30:18', '60', '\0', '\0');
INSERT INTO `class` VALUES ('523', '2012-03-03 10:30:18', '0', '0', '', '\0', 'No.11', null, null, '0', '0', '139', '2012-03-03 11:30:18', '60', '\0', '\0');
INSERT INTO `class` VALUES ('524', '2012-03-10 10:30:18', '0', '0', '\0', '\0', 'No.17', null, null, '0', '0', '139', '2012-03-10 11:30:18', '60', '\0', '\0');
INSERT INTO `class` VALUES ('525', '2012-02-26 11:00:13', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '139', '2012-02-26 12:00:13', '60', '\0', '\0');
INSERT INTO `class` VALUES ('526', '2012-02-26 11:00:13', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '139', '2012-02-26 12:00:13', '60', '\0', '\0');
INSERT INTO `class` VALUES ('527', '2012-03-04 11:00:13', '0', '0', '', '\0', 'No.14', null, null, '0', '0', '139', '2012-03-04 12:00:13', '60', '\0', '\0');
INSERT INTO `class` VALUES ('528', '2012-02-28 11:00:13', '0', '0', '', '\0', 'No.9', null, null, '0', '0', '139', '2012-02-28 12:00:13', '60', '\0', '\0');
INSERT INTO `class` VALUES ('529', '2012-02-28 11:00:13', '0', '0', '', '\0', 'No.10', null, null, '0', '0', '139', '2012-02-28 12:00:13', '60', '\0', '\0');
INSERT INTO `class` VALUES ('530', '2012-03-06 11:00:13', '0', '0', '', '\0', 'No.16', null, null, '0', '0', '139', '2012-03-06 12:00:13', '60', '\0', '\0');
INSERT INTO `class` VALUES ('531', '2012-02-25 11:00:13', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '139', '2012-02-25 12:00:13', '60', '\0', '\0');
INSERT INTO `class` VALUES ('532', '2012-03-03 11:00:13', '0', '0', '', '\0', 'No.12', null, null, '0', '0', '139', '2012-03-03 12:00:13', '60', '\0', '\0');
INSERT INTO `class` VALUES ('533', '2012-03-10 11:00:13', '0', '0', '\0', '\0', 'No.18', null, null, '0', '0', '139', '2012-03-10 12:00:13', '60', '\0', '\0');
INSERT INTO `class` VALUES ('534', '2012-02-22 12:00:00', '0', '0', '\0', '\0', 'No.1', 'haohaode ', null, '0', '0', '140', '2012-02-22 13:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('535', '2012-02-23 11:00:00', '0', '0', '\0', '\0', 'No.1', 'hello  ', null, '0', '0', '141', '2012-02-23 12:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('536', '2012-02-22 16:00:00', '0', '0', '\0', '\0', 'No.1', '12', null, '0', '0', '142', '2012-02-22 17:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('537', '2012-02-23 11:40:00', '0', '0', '\0', '\0', 'No.1', '1', null, '0', '0', '143', '2012-02-23 12:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('538', '2012-02-27 12:30:58', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '144', '2012-02-27 13:30:58', '60', '', '\0');
INSERT INTO `class` VALUES ('539', '2012-02-27 12:30:58', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '144', '2012-02-27 13:30:58', '60', '\0', '\0');
INSERT INTO `class` VALUES ('540', '2012-03-05 12:30:58', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '144', '2012-03-05 13:30:58', '60', '\0', '\0');
INSERT INTO `class` VALUES ('541', '2012-03-12 12:30:58', '0', '0', '', '\0', 'No.7', null, null, '0', '0', '144', '2012-03-12 13:30:58', '60', '', '');
INSERT INTO `class` VALUES ('542', '2012-03-19 12:30:58', '0', '0', '', '\0', 'No.9', null, null, '0', '0', '144', '2012-03-19 13:30:58', '60', '\0', '\0');
INSERT INTO `class` VALUES ('543', '2012-02-23 12:30:58', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '144', '2012-02-23 13:30:58', '60', '\0', '\0');
INSERT INTO `class` VALUES ('544', '2012-03-01 12:30:58', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '144', '2012-03-01 13:30:58', '60', '\0', '\0');
INSERT INTO `class` VALUES ('545', '2012-03-08 12:30:58', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '144', '2012-03-08 13:30:58', '60', '\0', '\0');
INSERT INTO `class` VALUES ('546', '2012-03-15 12:30:58', '0', '0', '', '\0', 'No.8', null, null, '0', '0', '144', '2012-03-15 13:30:58', '60', '', '');
INSERT INTO `class` VALUES ('547', '2012-03-22 12:30:58', '0', '0', '\0', '\0', 'No.10', null, null, '0', '0', '144', '2012-03-22 13:30:58', '60', '', '');
INSERT INTO `class` VALUES ('548', '2012-02-23 02:30:00', '0', '0', '\0', '\0', 'No.1', 'Testing', null, '0', '0', '146', '2012-02-23 03:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('549', '2012-02-24 02:30:00', '0', '0', '\0', '\0', 'No.1', 'testing', null, '0', '0', '147', '2012-02-24 03:30:00', '60', '', '');
INSERT INTO `class` VALUES ('550', '2012-02-27 13:10:19', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '148', '2012-02-27 14:10:19', '60', '', '');
INSERT INTO `class` VALUES ('551', '2012-02-27 13:10:19', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '148', '2012-02-27 14:00:19', '50', '\0', '\0');
INSERT INTO `class` VALUES ('552', '2012-02-27 12:30:19', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '148', '2012-02-27 13:25:19', '55', '\0', '\0');
INSERT INTO `class` VALUES ('553', '2012-02-29 13:10:19', '0', '0', '\0', '\0', 'No.8', null, null, '0', '0', '148', '2012-02-29 14:10:19', '60', '\0', '\0');
INSERT INTO `class` VALUES ('554', '2012-02-29 13:10:19', '0', '0', '\0', '\0', 'No.9', null, null, '0', '0', '148', '2012-02-29 14:00:19', '50', '\0', '\0');
INSERT INTO `class` VALUES ('555', '2012-02-29 12:30:19', '0', '0', '\0', '\0', 'No.7', null, null, '0', '0', '148', '2012-02-29 13:25:19', '55', '\0', '\0');
INSERT INTO `class` VALUES ('556', '2012-02-25 13:10:19', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '148', '2012-02-25 14:10:19', '60', '\0', '\0');
INSERT INTO `class` VALUES ('557', '2012-02-25 13:10:19', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '148', '2012-02-25 14:00:19', '50', '\0', '\0');
INSERT INTO `class` VALUES ('558', '2012-02-25 12:30:19', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '148', '2012-02-25 13:25:19', '55', '', '');
INSERT INTO `class` VALUES ('560', '2012-02-27 10:00:57', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '149', '2012-02-27 11:00:57', '60', '', '');
INSERT INTO `class` VALUES ('561', '2012-02-27 11:30:57', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '149', '2012-02-27 12:30:57', '60', '\0', '\0');
INSERT INTO `class` VALUES ('562', '2012-02-27 10:00:57', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '149', '2012-02-27 11:00:57', '60', '\0', '\0');
INSERT INTO `class` VALUES ('563', '2012-02-29 11:30:57', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '149', '2012-02-29 12:30:57', '60', '\0', '\0');
INSERT INTO `class` VALUES ('564', '2012-02-29 10:00:57', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '149', '2012-02-29 11:00:57', '60', '\0', '\0');
INSERT INTO `class` VALUES ('565', '2012-02-29 11:30:57', '0', '0', '', '\0', 'No.7', null, null, '0', '0', '149', '2012-02-29 12:30:57', '60', '\0', '\0');
INSERT INTO `class` VALUES ('568', '2012-02-25 10:00:57', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '149', '2012-02-25 11:00:57', '60', '\0', '\0');
INSERT INTO `class` VALUES ('569', '2012-03-03 11:30:57', '0', '0', '\0', '\0', 'No.9', null, null, '0', '0', '149', '2012-03-03 12:30:57', '60', '\0', '\0');
INSERT INTO `class` VALUES ('570', '2012-03-03 10:00:57', '0', '0', '', '\0', 'No.8', null, null, '0', '0', '149', '2012-03-03 11:00:57', '60', '\0', '\0');
INSERT INTO `class` VALUES ('574', '2012-02-27 13:30:41', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '150', '2012-02-27 14:25:41', '55', '\0', '\0');
INSERT INTO `class` VALUES ('575', '2012-02-25 11:30:41', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '150', '2012-02-25 12:30:41', '60', '\0', '\0');
INSERT INTO `class` VALUES ('577', '2012-03-03 11:30:41', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '150', '2012-03-03 12:30:41', '60', '\0', '');
INSERT INTO `class` VALUES ('578', '2012-03-03 13:30:41', '0', '0', '\0', '\0', 'No.4', null, null, '0', '0', '150', '2012-03-03 14:25:41', '55', '\0', '\0');
INSERT INTO `class` VALUES ('579', '2012-02-27 04:30:21', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '151', '2012-02-27 05:30:21', '60', '', '');
INSERT INTO `class` VALUES ('580', '2012-02-29 04:30:21', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '151', '2012-02-29 05:30:21', '60', '', '');
INSERT INTO `class` VALUES ('581', '2012-03-03 04:30:21', '0', '0', '\0', '\0', 'No.3', null, null, '0', '0', '151', '2012-03-03 05:30:21', '60', '\0', '\0');
INSERT INTO `class` VALUES ('583', '2012-02-28 07:00:00', '0', '0', '\0', '\0', 'No.1', 'Introduction', null, '0', '0', '152', '2012-02-28 08:00:00', '60', '', '');
INSERT INTO `class` VALUES ('584', '2012-02-28 16:00:00', '0', '0', '\0', '\0', '第1节课', 'introduce', null, '0', '0', '153', '2012-02-28 17:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('585', '2012-02-28 17:00:00', '0', '0', '\0', '\0', 'No.1', 'testing ', null, '0', '0', '154', '2012-02-28 18:00:00', '60', '', '');
INSERT INTO `class` VALUES ('586', '2012-02-28 16:05:00', '0', '0', '\0', '\0', 'No.1', 'testing', null, '0', '0', '155', '2012-02-28 17:05:00', '60', '', '');
INSERT INTO `class` VALUES ('590', '2012-03-19 14:00:06', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '156', '2012-03-19 15:00:06', '60', '\0', '\0');
INSERT INTO `class` VALUES ('593', '2012-03-07 14:00:00', '0', '0', '', '\0', 'No.2', '4', null, '0', '0', '156', '2012-03-07 15:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('594', '2012-03-14 14:00:06', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '156', '2012-03-14 15:00:06', '60', '\0', '\0');
INSERT INTO `class` VALUES ('595', '2012-03-21 14:00:06', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '156', '2012-03-21 15:00:06', '60', '', '');
INSERT INTO `class` VALUES ('597', '2012-03-02 14:00:06', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '156', '2012-03-02 15:00:06', '60', '', '');
INSERT INTO `class` VALUES ('598', '2012-03-09 14:00:06', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '156', '2012-03-09 15:00:06', '60', '', '');
INSERT INTO `class` VALUES ('599', '2012-04-02 12:00:00', '0', '0', '\0', '\0', 'No.8', '21', null, '0', '0', '156', '2012-04-02 12:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('600', '2012-03-23 14:00:06', '0', '0', '', '\0', 'No.7', null, null, '0', '0', '156', '2012-03-23 15:00:06', '60', '', '');
INSERT INTO `class` VALUES ('602', '2012-03-01 02:00:00', '0', '0', '\0', '\0', 'No.1', 'haha', null, '0', '0', '158', '2012-03-01 03:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('603', '2012-03-01 08:30:00', '0', '0', '\0', '\0', '第1节课', '测试1', null, '0', '0', '160', '2012-03-01 09:30:00', '60', '', '');
INSERT INTO `class` VALUES ('604', '2012-03-01 02:53:00', '0', '0', '\0', '\0', '第1节课', 'aaa', null, '0', '0', '161', '2012-03-01 03:53:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('605', '2012-03-04 03:30:29', '0', '0', '', '\0', '第1节课', null, null, '0', '0', '162', '2012-03-04 04:30:29', '60', '', '\0');
INSERT INTO `class` VALUES ('606', '2012-03-04 03:30:29', '0', '0', '', '\0', '第2节课', null, null, '0', '0', '162', '2012-03-04 04:30:29', '60', '\0', '\0');
INSERT INTO `class` VALUES ('607', '2012-03-05 03:30:29', '0', '0', '\0', '\0', '第3节课', null, null, '0', '0', '162', '2012-03-05 04:30:29', '60', '\0', '\0');
INSERT INTO `class` VALUES ('608', '2012-03-05 03:30:29', '0', '0', '\0', '\0', '第4节课', null, null, '0', '0', '162', '2012-03-05 04:30:29', '60', '\0', '\0');
INSERT INTO `class` VALUES ('609', '2012-03-05 11:00:44', '0', '0', '', '\0', '第1节课', null, null, '0', '0', '164', '2012-03-05 12:00:44', '60', '', '');
INSERT INTO `class` VALUES ('610', '2012-03-06 11:00:44', '0', '0', '', '\0', '第2节课', null, null, '0', '0', '164', '2012-03-06 12:00:44', '60', '\0', '\0');
INSERT INTO `class` VALUES ('611', '2012-03-07 11:00:44', '0', '0', '\0', '\0', '第3节课', null, null, '0', '0', '164', '2012-03-07 12:00:44', '60', '\0', '\0');
INSERT INTO `class` VALUES ('612', '2012-03-01 13:30:00', '0', '0', '\0', '\0', 'No.1', 'Introduction', null, '0', '0', '165', '2012-03-01 14:30:00', '60', '\0', '');
INSERT INTO `class` VALUES ('613', '2012-03-01 13:30:00', '0', '0', '\0', '\0', 'No.1', 'Hi', null, '0', '0', '166', '2012-03-01 14:30:00', '60', '\0', '');
INSERT INTO `class` VALUES ('614', '2012-03-02 09:47:00', '0', '0', '\0', '\0', '第1节课', 'CSS页面设计', null, '0', '0', '167', '2012-03-02 10:47:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('615', '2012-03-02 09:49:00', '0', '0', '\0', '\0', '第1节课', 'CSS页面设计', null, '0', '0', '168', '2012-03-02 10:49:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('616', '2012-03-03 00:35:00', '0', '0', '\0', '\0', '第1节课', '效果挺好的，继续加油', null, '0', '0', '169', '2012-03-03 00:20:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('617', '2012-03-03 08:30:00', '0', '0', '\0', '\0', 'No.1', '55', null, '0', '0', '170', '2012-03-03 09:30:00', '60', '', '');
INSERT INTO `class` VALUES ('618', '2012-03-03 08:45:00', '0', '0', '\0', '\0', 'No.1', 'testing', null, '0', '0', '171', '2012-03-03 09:45:00', '60', '\0', '');
INSERT INTO `class` VALUES ('619', '2012-03-03 08:35:00', '0', '0', '\0', '\0', 'No.1', 'testing', null, '0', '0', '172', '2012-03-03 09:35:00', '60', '\0', '');
INSERT INTO `class` VALUES ('620', '2012-03-04 04:30:00', '0', '0', '\0', '\0', 'No.1', 'first testing', null, '0', '0', '173', '2012-03-04 05:30:00', '60', '', '');
INSERT INTO `class` VALUES ('621', '2012-03-03 09:30:00', '0', '0', '\0', '\0', 'No.1', 'tt', null, '0', '0', '174', '2012-03-03 10:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('622', '2012-03-03 10:00:00', '0', '0', '\0', '\0', 'No.1', 'Tesing', null, '0', '0', '175', '2012-03-03 11:00:00', '60', '', '\0');
INSERT INTO `class` VALUES ('623', '2012-03-03 10:00:00', '0', '0', '\0', '\0', 'No.1', 'ss', null, '0', '0', '176', '2012-03-03 11:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('624', '2012-03-03 10:35:00', '0', '0', '\0', '\0', 'No.1', 'sfsd', null, '0', '0', '177', '2012-03-03 11:35:00', '60', '', '\0');
INSERT INTO `class` VALUES ('625', '2012-03-03 10:00:00', '0', '0', '\0', '\0', 'No.1', 'tt', null, '0', '0', '178', '2012-03-03 11:00:00', '60', '', '\0');
INSERT INTO `class` VALUES ('626', '2012-03-03 12:35:00', '0', '0', '\0', '\0', 'No.1', 'test', null, '0', '0', '179', '2012-03-03 13:35:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('627', '2012-03-05 00:30:00', '0', '0', '\0', '\0', '第1节课', '习题讲解', null, '0', '0', '180', '2012-03-05 00:15:00', '45', '', '');
INSERT INTO `class` VALUES ('628', '2012-03-03 12:30:00', '0', '0', '\0', '\0', 'No.1', 'test', null, '0', '0', '182', '2012-03-03 13:30:00', '60', '', '');
INSERT INTO `class` VALUES ('629', '2012-03-04 20:50:00', '0', '0', '\0', '\0', '第1节课', 'its really gogo', null, '0', '0', '183', '2012-03-04 21:35:00', '45', '\0', '');
INSERT INTO `class` VALUES ('630', '2012-03-03 14:59:00', '0', '0', '\0', '\0', '第1节课', '酒是什么', null, '0', '0', '184', '2012-03-03 14:59:00', '55', '', '');
INSERT INTO `class` VALUES ('631', '2012-03-04 06:00:01', '0', '0', '', '\0', '第1节课', null, null, '0', '0', '185', '2012-03-04 06:45:01', '45', '', '');
INSERT INTO `class` VALUES ('632', '2012-03-11 06:00:01', '0', '0', '', '\0', '第2节课', null, null, '0', '0', '185', '2012-03-11 06:45:01', '45', '\0', '\0');
INSERT INTO `class` VALUES ('633', '2012-03-18 06:00:01', '0', '0', '\0', '\0', '第3节课', null, null, '0', '0', '185', '2012-03-18 06:45:01', '45', '\0', '\0');
INSERT INTO `class` VALUES ('634', '2012-03-12 04:30:56', '0', '0', '', '\0', '第3节课', null, null, '0', '0', '186', '2012-03-12 05:20:56', '50', '\0', '\0');
INSERT INTO `class` VALUES ('635', '2012-03-12 04:30:56', '0', '0', '', '\0', '第4节课', null, null, '0', '0', '186', '2012-03-12 05:20:56', '50', '\0', '\0');
INSERT INTO `class` VALUES ('636', '2012-03-19 04:30:56', '0', '0', '', '', '第7节课', null, null, '0', '0', '186', '2012-03-19 05:20:56', '50', '', '');
INSERT INTO `class` VALUES ('637', '2012-03-06 05:15:00', '0', '0', '', '\0', '第1节课', '', null, '0', '0', '186', '2012-03-06 05:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('638', '2012-03-13 04:30:56', '0', '0', '', '\0', '第5节课', null, null, '0', '0', '186', '2012-03-13 05:20:56', '50', '\0', '\0');
INSERT INTO `class` VALUES ('639', '2012-03-20 04:30:56', '0', '0', '\0', '\0', '第8节课', null, null, '0', '0', '186', '2012-03-20 05:20:56', '50', '\0', '\0');
INSERT INTO `class` VALUES ('640', '2012-03-07 04:30:56', '0', '0', '', '\0', '第2节课', null, null, '0', '0', '186', '2012-03-07 05:20:56', '50', '\0', '\0');
INSERT INTO `class` VALUES ('641', '2012-03-14 04:30:56', '0', '0', '', '\0', '第6节课', null, null, '0', '0', '186', '2012-03-14 05:20:56', '50', '\0', '\0');
INSERT INTO `class` VALUES ('642', '2012-03-21 04:30:56', '0', '0', '\0', '\0', '第9节课', null, null, '0', '0', '186', '2012-03-21 05:20:56', '50', '\0', '\0');
INSERT INTO `class` VALUES ('643', '2012-03-06 15:00:00', '0', '0', '\0', '\0', 'No.1', 'Hi', null, '0', '0', '187', '2012-03-06 16:00:00', '60', '\0', '');
INSERT INTO `class` VALUES ('645', '2012-03-12 13:30:00', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '188', '2012-03-12 14:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('646', '2012-03-12 12:00:00', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '188', '2012-03-12 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('647', '2012-03-12 12:30:00', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '188', '2012-03-12 13:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('648', '2012-03-12 13:30:00', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '188', '2012-03-12 14:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('651', '2012-03-10 13:30:00', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '188', '2012-03-10 14:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('652', '2012-03-10 12:00:00', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '188', '2012-03-10 12:50:00', '50', '\0', '');
INSERT INTO `class` VALUES ('653', '2012-03-17 12:30:00', '0', '0', '\0', '\0', 'No.8', null, null, '0', '0', '188', '2012-03-17 13:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('654', '2012-03-17 13:30:00', '0', '0', '\0', '\0', 'No.9', null, null, '0', '0', '188', '2012-03-17 14:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('655', '2012-03-17 12:00:00', '0', '0', '\0', '\0', 'No.7', null, null, '0', '0', '188', '2012-03-17 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('656', '2012-03-12 14:20:00', '0', '0', '', '\0', 'No.3', '', null, '0', '0', '189', '2012-03-12 14:20:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('657', '2012-03-12 14:25:00', '0', '0', '', '\0', 'No.4', 'Hello', null, '0', '0', '189', '2012-03-12 14:25:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('658', '2012-03-19 13:30:54', '0', '0', '', '\0', 'No.7', null, null, '0', '0', '189', '2012-03-19 14:30:54', '60', '\0', '\0');
INSERT INTO `class` VALUES ('659', '2012-03-26 13:30:54', '0', '0', '\0', '\0', 'No.10', null, null, '0', '0', '189', '2012-03-26 14:30:54', '60', '\0', '\0');
INSERT INTO `class` VALUES ('660', '2012-03-07 13:30:54', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '189', '2012-03-07 14:30:54', '60', '\0', '');
INSERT INTO `class` VALUES ('661', '2012-03-14 13:30:54', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '189', '2012-03-14 14:30:54', '60', '\0', '\0');
INSERT INTO `class` VALUES ('662', '2012-03-21 13:30:54', '0', '0', '', '\0', 'No.8', null, null, '0', '0', '189', '2012-03-21 14:30:54', '60', '\0', '\0');
INSERT INTO `class` VALUES ('663', '2012-03-28 13:30:54', '0', '0', '\0', '\0', 'No.11', null, null, '0', '0', '189', '2012-03-28 14:30:54', '60', '\0', '\0');
INSERT INTO `class` VALUES ('664', '2012-03-10 13:30:54', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '189', '2012-03-10 14:30:54', '60', '\0', '\0');
INSERT INTO `class` VALUES ('665', '2012-03-17 13:30:54', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '189', '2012-03-17 14:30:54', '60', '\0', '\0');
INSERT INTO `class` VALUES ('666', '2012-03-24 13:30:54', '0', '0', '\0', '\0', 'No.9', null, null, '0', '0', '189', '2012-03-24 14:30:54', '60', '\0', '\0');
INSERT INTO `class` VALUES ('667', '2012-03-31 13:30:54', '0', '0', '\0', '\0', 'No.12', null, null, '0', '0', '189', '2012-03-31 14:30:54', '60', '\0', '\0');
INSERT INTO `class` VALUES ('668', '2012-03-07 01:10:00', '0', '0', '\0', '\0', 'No.1', 'test', null, '0', '0', '192', '2012-03-07 02:10:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('669', '2012-03-01 00:30:00', '0', '0', '\0', '\0', '第1节课', '会议测试', null, '0', '0', '191', '2012-03-01 00:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('670', '2012-03-07 14:00:00', '0', '0', '\0', '\0', 'No.1', 'test', null, '0', '0', '193', '2012-03-07 15:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('671', '2012-03-08 00:30:00', '0', '0', '\0', '\0', '第1节课', '会议测试', null, '0', '0', '194', '2012-03-08 00:15:00', '45', '', '\0');
INSERT INTO `class` VALUES ('672', '2012-03-12 11:30:00', '0', '0', '', '\0', 'No.1', 'Hello, this is the introduction', null, '0', '0', '196', '2012-03-12 12:30:00', '60', '', '');
INSERT INTO `class` VALUES ('673', '2012-03-13 10:40:00', '0', '0', '\0', '\0', 'No.2', 'ste', null, '0', '0', '196', '2012-03-13 11:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('674', '2012-03-13 12:00:00', '0', '0', '\0', '\0', 'No.1', 'the first meeting with zeng', null, '0', '0', '197', '2012-03-13 13:00:00', '60', '', '');
INSERT INTO `class` VALUES ('675', '2012-03-13 06:30:00', '0', '0', '\0', '\0', '第1节课', '口语讨论课', null, '0', '0', '198', '2012-03-13 07:15:00', '45', '', '\0');
INSERT INTO `class` VALUES ('676', '2012-03-28 16:00:00', '0', '0', '\0', '\0', '第1节课', '00000000000000', null, '0', '0', '199', '2012-03-28 17:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('677', '2012-03-12 16:00:00', '0', '0', '\0', '\0', '第2节课', '00', null, '0', '0', '200', '2012-03-12 17:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('678', '2012-02-29 16:00:00', '0', '0', '\0', '\0', '第1节课', '00000000000000', null, '0', '0', '200', '2012-02-29 17:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('679', '2012-03-12 16:00:00', '0', '0', '\0', '\0', '第3节课', '00000000000000', null, '0', '0', '200', '2012-03-12 17:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('680', '2012-03-12 12:32:00', '0', '0', '\0', '\0', '第1节课', '测试', null, '0', '0', '201', '2012-03-12 13:32:00', '60', '', '');
INSERT INTO `class` VALUES ('681', '2012-03-14 05:40:00', '0', '0', '\0', '\0', '第1节课', 'speaking time', null, '0', '0', '202', '2012-03-14 06:10:00', '30', '\0', '\0');
INSERT INTO `class` VALUES ('682', '2012-03-12 13:00:24', '0', '0', '', '\0', '第1节课', null, null, '0', '0', '203', '2012-03-12 13:45:24', '45', '\0', '\0');
INSERT INTO `class` VALUES ('683', '2012-03-19 13:00:24', '0', '0', '', '\0', '第4节课', null, null, '0', '0', '203', '2012-03-19 13:45:24', '45', '\0', '\0');
INSERT INTO `class` VALUES ('684', '2012-03-26 13:00:24', '0', '0', '\0', '\0', '第7节课', null, null, '0', '0', '203', '2012-03-26 13:45:24', '45', '\0', '\0');
INSERT INTO `class` VALUES ('685', '2012-03-14 13:00:24', '0', '0', '', '\0', '第2节课', null, null, '0', '0', '203', '2012-03-14 13:45:24', '45', '', '');
INSERT INTO `class` VALUES ('686', '2012-03-21 13:00:24', '0', '0', '', '\0', '第5节课', null, null, '0', '0', '203', '2012-03-21 13:45:24', '45', '\0', '\0');
INSERT INTO `class` VALUES ('687', '2012-03-28 13:00:24', '0', '0', '\0', '\0', '第8节课', null, null, '0', '0', '203', '2012-03-28 13:45:24', '45', '\0', '\0');
INSERT INTO `class` VALUES ('688', '2012-03-16 13:00:24', '0', '0', '', '\0', '第3节课', null, null, '0', '0', '203', '2012-03-16 13:45:24', '45', '', '\0');
INSERT INTO `class` VALUES ('689', '2012-03-23 13:00:24', '0', '0', '\0', '\0', '第6节课', null, null, '0', '0', '203', '2012-03-23 13:45:24', '45', '\0', '\0');
INSERT INTO `class` VALUES ('690', '2012-03-30 13:00:24', '0', '0', '\0', '\0', '第9节课', null, null, '0', '0', '203', '2012-03-30 13:45:24', '45', '\0', '\0');
INSERT INTO `class` VALUES ('691', '2012-03-14 05:40:00', '0', '0', '\0', '\0', '第1节课', 'speaking time', null, '0', '0', '204', '2012-03-14 06:10:00', '30', '', '');
INSERT INTO `class` VALUES ('692', '2012-03-18 05:34:54', '0', '0', '', '\0', '第2节课', null, null, '0', '0', '205', '2012-03-18 06:24:54', '50', '\0', '\0');
INSERT INTO `class` VALUES ('693', '2012-03-18 05:34:54', '0', '0', '', '\0', '第3节课', null, null, '0', '0', '205', '2012-03-18 06:24:54', '50', '\0', '\0');
INSERT INTO `class` VALUES ('694', '2012-03-17 05:34:54', '0', '0', '', '', '第1节课', null, null, '0', '0', '205', '2012-03-17 06:24:54', '50', '', '');
INSERT INTO `class` VALUES ('695', '2012-03-24 05:34:54', '0', '0', '\0', '\0', '第4节课', null, null, '0', '0', '205', '2012-03-24 06:24:54', '50', '\0', '\0');
INSERT INTO `class` VALUES ('696', '2012-03-18 17:00:57', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '206', '2012-03-18 18:00:57', '60', '\0', '\0');
INSERT INTO `class` VALUES ('697', '2012-03-18 18:00:57', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '206', '2012-03-18 18:45:57', '45', '\0', '\0');
INSERT INTO `class` VALUES ('698', '2012-03-18 17:00:57', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '206', '2012-03-18 18:00:57', '60', '\0', '\0');
INSERT INTO `class` VALUES ('699', '2012-03-18 18:00:57', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '206', '2012-03-18 18:45:57', '45', '\0', '\0');
INSERT INTO `class` VALUES ('700', '2012-03-17 17:00:57', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '206', '2012-03-17 18:00:57', '60', '\0', '\0');
INSERT INTO `class` VALUES ('701', '2012-03-17 18:00:57', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '206', '2012-03-17 18:45:57', '45', '\0', '\0');
INSERT INTO `class` VALUES ('702', '2012-03-24 17:00:57', '0', '0', '\0', '\0', 'No.7', null, null, '0', '0', '206', '2012-03-24 18:00:57', '60', '\0', '\0');
INSERT INTO `class` VALUES ('703', '2012-03-24 18:00:57', '0', '0', '\0', '\0', 'No.8', null, null, '0', '0', '206', '2012-03-24 18:45:57', '45', '\0', '\0');
INSERT INTO `class` VALUES ('704', '2012-03-14 12:00:00', '0', '0', '\0', '', 'No.1', 'Introduction', null, '0', '0', '207', '2012-03-14 13:00:00', '60', '', '');
INSERT INTO `class` VALUES ('705', '2012-03-14 05:00:00', '0', '0', '\0', '\0', 'No.1', 'System Introduction', null, '0', '0', '208', '2012-03-14 06:00:00', '60', '', '');
INSERT INTO `class` VALUES ('706', '2012-03-15 11:00:00', '0', '0', '\0', '\0', 'No.1', 'tt', null, '0', '0', '209', '2012-03-15 12:00:00', '60', '', '');
INSERT INTO `class` VALUES ('707', '2012-03-15 04:00:00', '0', '0', '\0', '\0', '第1节课', 'Testing', null, '0', '0', '210', '2012-03-15 05:00:00', '60', '\0', '');
INSERT INTO `class` VALUES ('708', '2012-03-15 10:30:00', '0', '0', '\0', '\0', 'No.1', 'tt', null, '0', '0', '211', '2012-03-15 11:30:00', '60', '', '');
INSERT INTO `class` VALUES ('709', '2012-03-01 03:00:00', '0', '0', '', '\0', 'No.1', 'First', null, '0', '0', '212', '2012-03-01 04:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('710', '2012-03-14 01:00:13', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '212', '2012-03-14 02:00:13', '60', '\0', '\0');
INSERT INTO `class` VALUES ('711', '2012-03-21 00:55:00', '0', '0', '', '\0', 'No.7', 'sfsfsdfsd', null, '0', '0', '212', '2012-03-21 00:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('712', '2012-03-28 01:00:14', '0', '0', '\0', '\0', 'No.9', null, null, '0', '0', '212', '2012-03-28 02:00:14', '60', '\0', '\0');
INSERT INTO `class` VALUES ('713', '2012-04-04 01:00:15', '0', '0', '\0', '\0', 'No.11', null, null, '0', '0', '212', '2012-04-04 02:00:15', '60', '\0', '\0');
INSERT INTO `class` VALUES ('715', '2012-04-18 01:00:16', '0', '0', '\0', '\0', 'No.16', null, null, '0', '0', '212', '2012-04-18 02:00:16', '60', '\0', '\0');
INSERT INTO `class` VALUES ('716', '2012-03-15 01:00:17', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '212', '2012-03-15 02:00:17', '60', '', '');
INSERT INTO `class` VALUES ('718', '2012-03-29 01:00:18', '0', '0', '\0', '\0', 'No.10', null, null, '0', '0', '212', '2012-03-29 02:00:18', '60', '\0', '\0');
INSERT INTO `class` VALUES ('719', '2012-04-05 01:00:18', '0', '0', '\0', '\0', 'No.12', null, null, '0', '0', '212', '2012-04-05 02:00:18', '60', '\0', '\0');
INSERT INTO `class` VALUES ('720', '2012-04-12 01:00:19', '0', '0', '\0', '\0', 'No.14', null, null, '0', '0', '212', '2012-04-12 02:00:19', '60', '\0', '\0');
INSERT INTO `class` VALUES ('721', '2012-04-19 01:00:19', '0', '0', '\0', '\0', 'No.17', null, null, '0', '0', '212', '2012-04-19 02:00:19', '60', '\0', '\0');
INSERT INTO `class` VALUES ('722', '2012-03-17 01:00:20', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '212', '2012-03-17 02:00:20', '60', '\0', '\0');
INSERT INTO `class` VALUES ('723', '2012-03-24 01:00:21', '0', '0', '\0', '\0', 'No.8', null, null, '0', '0', '212', '2012-03-24 02:00:21', '60', '', '');
INSERT INTO `class` VALUES ('725', '2012-04-07 01:00:22', '0', '0', '\0', '\0', 'No.13', null, null, '0', '0', '212', '2012-04-07 02:00:22', '60', '\0', '\0');
INSERT INTO `class` VALUES ('726', '2012-04-14 01:00:22', '0', '0', '\0', '\0', 'No.15', null, null, '0', '0', '212', '2012-04-14 02:00:22', '60', '\0', '\0');
INSERT INTO `class` VALUES ('727', '2012-04-21 01:00:23', '0', '0', '\0', '\0', 'No.18', null, null, '0', '0', '212', '2012-04-21 02:00:23', '60', '\0', '\0');
INSERT INTO `class` VALUES ('728', '2012-03-15 00:35:00', '0', '0', '\0', '\0', '第1节课', '效果挺好的，继续加油', null, '0', '0', '214', '2012-03-15 00:15:00', '40', '\0', '\0');
INSERT INTO `class` VALUES ('729', '2012-03-15 08:30:00', '0', '0', '\0', '\0', '第1节课', '测试3.14', null, '0', '0', '215', '2012-03-15 09:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('730', '2012-03-15 10:00:00', '0', '0', '\0', '\0', 'No.1', 'testing', null, '0', '0', '218', '2012-03-15 11:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('731', '2012-03-15 10:00:00', '0', '0', '', '\0', 'No.4', 'tt', null, '0', '0', '212', '2012-03-15 11:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('732', '2012-03-20 13:35:00', '0', '0', '', '\0', 'No.6', 'sfdsfs', null, '0', '0', '212', '2012-03-20 14:35:00', '60', '', '');
INSERT INTO `class` VALUES ('733', '2012-03-15 05:40:00', '0', '0', '\0', '\0', '第1节课', 'speaking time', null, '0', '0', '219', '2012-03-15 06:20:00', '40', '\0', '\0');
INSERT INTO `class` VALUES ('734', '2012-03-19 11:40:26', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '220', '2012-03-19 12:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('735', '2012-03-19 13:40:26', '0', '0', '', '\0', 'No.7', null, null, '0', '0', '220', '2012-03-19 14:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('736', '2012-03-19 11:40:26', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '220', '2012-03-19 12:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('737', '2012-03-19 13:40:26', '0', '0', '', '\0', 'No.8', null, null, '0', '0', '220', '2012-03-19 14:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('738', '2012-03-26 11:40:26', '0', '0', '\0', '\0', 'No.13', null, null, '0', '0', '220', '2012-03-26 12:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('739', '2012-03-26 13:40:26', '0', '0', '\0', '\0', 'No.14', null, null, '0', '0', '220', '2012-03-26 14:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('740', '2012-04-02 11:40:26', '0', '0', '\0', '\0', 'No.19', null, null, '0', '0', '220', '2012-04-02 12:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('741', '2012-04-02 13:40:26', '0', '0', '\0', '\0', 'No.20', null, null, '0', '0', '220', '2012-04-02 14:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('742', '2012-03-15 11:40:26', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '220', '2012-03-15 12:40:26', '60', '', '');
INSERT INTO `class` VALUES ('743', '2012-03-15 13:40:26', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '220', '2012-03-15 14:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('744', '2012-03-22 11:40:26', '0', '0', '', '\0', 'No.9', null, null, '0', '0', '220', '2012-03-22 12:40:26', '60', '', '');
INSERT INTO `class` VALUES ('745', '2012-03-22 13:40:26', '0', '0', '', '\0', 'No.10', null, null, '0', '0', '220', '2012-03-22 14:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('746', '2012-03-29 11:40:26', '0', '0', '\0', '\0', 'No.15', null, null, '0', '0', '220', '2012-03-29 12:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('747', '2012-03-29 13:40:26', '0', '0', '\0', '\0', 'No.16', null, null, '0', '0', '220', '2012-03-29 14:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('748', '2012-04-05 11:40:26', '0', '0', '\0', '\0', 'No.21', null, null, '0', '0', '220', '2012-04-05 12:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('749', '2012-04-05 13:40:26', '0', '0', '\0', '\0', 'No.22', null, null, '0', '0', '220', '2012-04-05 14:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('750', '2012-03-17 11:40:26', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '220', '2012-03-17 12:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('751', '2012-03-17 13:40:26', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '220', '2012-03-17 14:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('752', '2012-03-24 11:40:26', '0', '0', '\0', '\0', 'No.11', null, null, '0', '0', '220', '2012-03-24 12:40:26', '60', '', '');
INSERT INTO `class` VALUES ('753', '2012-03-24 13:40:26', '0', '0', '\0', '\0', 'No.12', null, null, '0', '0', '220', '2012-03-24 14:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('754', '2012-03-31 11:40:26', '0', '0', '\0', '\0', 'No.17', null, null, '0', '0', '220', '2012-03-31 12:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('755', '2012-03-31 13:40:26', '0', '0', '\0', '\0', 'No.18', null, null, '0', '0', '220', '2012-03-31 14:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('756', '2012-04-07 11:40:26', '0', '0', '\0', '\0', 'No.23', null, null, '0', '0', '220', '2012-04-07 12:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('757', '2012-04-07 13:40:26', '0', '0', '\0', '\0', 'No.24', null, null, '0', '0', '220', '2012-04-07 14:40:26', '60', '\0', '\0');
INSERT INTO `class` VALUES ('758', '2012-03-15 05:40:00', '0', '0', '\0', '\0', '第1节课', '效果挺好的，继续加油', null, '0', '0', '221', '2012-03-15 06:25:00', '45', '', '\0');
INSERT INTO `class` VALUES ('759', '2012-03-19 12:00:40', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '222', '2012-03-19 13:00:40', '60', '\0', '\0');
INSERT INTO `class` VALUES ('760', '2012-03-19 12:00:40', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '222', '2012-03-19 13:00:40', '60', '\0', '\0');
INSERT INTO `class` VALUES ('761', '2012-03-17 12:00:40', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '222', '2012-03-17 13:00:40', '60', '\0', '\0');
INSERT INTO `class` VALUES ('762', '2012-03-24 12:00:40', '0', '0', '\0', '\0', 'No.4', null, null, '0', '0', '222', '2012-03-24 13:00:40', '60', '\0', '\0');
INSERT INTO `class` VALUES ('763', '2012-03-18 12:40:00', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '224', '2012-03-18 13:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('764', '2012-03-18 12:40:00', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '224', '2012-03-18 13:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('765', '2012-03-25 12:40:00', '0', '0', '\0', '\0', 'No.7', null, null, '0', '0', '224', '2012-03-25 13:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('766', '2012-04-01 12:40:00', '0', '0', '\0', '\0', 'No.10', null, null, '0', '0', '224', '2012-04-01 13:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('767', '2012-03-20 12:40:00', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '224', '2012-03-20 13:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('768', '2012-03-20 12:40:00', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '224', '2012-03-20 13:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('769', '2012-03-27 12:40:00', '0', '0', '\0', '\0', 'No.8', null, null, '0', '0', '224', '2012-03-27 13:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('770', '2012-04-03 12:40:00', '0', '0', '\0', '\0', 'No.11', null, null, '0', '0', '224', '2012-04-03 13:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('771', '2012-03-17 12:40:00', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '224', '2012-03-17 13:40:00', '60', '', '\0');
INSERT INTO `class` VALUES ('772', '2012-03-24 12:40:00', '0', '0', '\0', '\0', 'No.6', null, null, '0', '0', '224', '2012-03-24 13:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('773', '2012-03-31 12:40:00', '0', '0', '\0', '\0', 'No.9', null, null, '0', '0', '224', '2012-03-31 13:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('774', '2012-04-07 12:40:00', '0', '0', '\0', '\0', 'No.12', null, null, '0', '0', '224', '2012-04-07 13:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('775', '2012-03-19 07:30:07', '0', '0', '', '\0', '第2节课', null, null, '0', '0', '225', '2012-03-19 08:15:07', '45', '\0', '\0');
INSERT INTO `class` VALUES ('776', '2012-03-19 07:30:07', '0', '0', '', '\0', '第3节课', null, null, '0', '0', '225', '2012-03-19 08:15:07', '45', '\0', '\0');
INSERT INTO `class` VALUES ('777', '2012-03-17 08:15:00', '0', '0', '', '\0', '第1节课', '小浪人', null, '0', '0', '225', '2012-03-17 08:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('778', '2012-03-24 07:30:07', '0', '0', '\0', '\0', '第4节课', null, null, '0', '0', '225', '2012-03-24 08:15:07', '45', '\0', '\0');
INSERT INTO `class` VALUES ('779', '2012-03-16 12:00:00', '0', '0', '', '\0', 'No.1', 'sdfsd', null, '0', '0', '226', '2012-03-16 13:00:00', '60', '', '');
INSERT INTO `class` VALUES ('780', '2012-03-18 12:41:45', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '226', '2012-03-18 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('781', '2012-03-18 14:41:45', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '226', '2012-03-18 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('782', '2012-03-18 12:41:45', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '226', '2012-03-18 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('783', '2012-03-18 14:41:45', '0', '0', '', '\0', 'No.7', null, null, '0', '0', '226', '2012-03-18 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('784', '2012-03-25 12:41:45', '0', '0', '\0', '\0', 'No.14', null, null, '0', '0', '226', '2012-03-25 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('785', '2012-03-25 14:41:45', '0', '0', '\0', '\0', 'No.15', null, null, '0', '0', '226', '2012-03-25 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('786', '2012-04-01 12:41:45', '0', '0', '\0', '\0', 'No.20', null, null, '0', '0', '226', '2012-04-01 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('787', '2012-04-01 14:41:45', '0', '0', '\0', '\0', 'No.21', null, null, '0', '0', '226', '2012-04-01 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('788', '2012-04-08 12:41:45', '0', '0', '\0', '\0', 'No.26', null, null, '0', '0', '226', '2012-04-08 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('789', '2012-04-08 14:41:45', '0', '0', '\0', '\0', 'No.27', null, null, '0', '0', '226', '2012-04-08 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('790', '2012-03-20 12:41:45', '0', '0', '', '\0', 'No.8', null, null, '0', '0', '226', '2012-03-20 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('791', '2012-03-20 14:41:45', '0', '0', '', '\0', 'No.10', null, null, '0', '0', '226', '2012-03-20 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('792', '2012-03-20 12:41:45', '0', '0', '', '\0', 'No.9', null, null, '0', '0', '226', '2012-03-20 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('793', '2012-03-20 14:41:45', '0', '0', '', '\0', 'No.11', null, null, '0', '0', '226', '2012-03-20 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('794', '2012-03-27 12:41:45', '0', '0', '\0', '\0', 'No.16', null, null, '0', '0', '226', '2012-03-27 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('795', '2012-03-27 14:41:45', '0', '0', '\0', '\0', 'No.17', null, null, '0', '0', '226', '2012-03-27 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('796', '2012-04-03 12:41:45', '0', '0', '\0', '\0', 'No.22', null, null, '0', '0', '226', '2012-04-03 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('797', '2012-04-03 14:41:45', '0', '0', '\0', '\0', 'No.23', null, null, '0', '0', '226', '2012-04-03 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('798', '2012-04-10 12:41:45', '0', '0', '\0', '\0', 'No.28', null, null, '0', '0', '226', '2012-04-10 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('799', '2012-04-10 14:41:45', '0', '0', '\0', '\0', 'No.29', null, null, '0', '0', '226', '2012-04-10 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('800', '2012-03-17 12:41:45', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '226', '2012-03-17 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('801', '2012-03-17 14:41:45', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '226', '2012-03-17 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('802', '2012-03-24 12:41:45', '0', '0', '\0', '\0', 'No.12', null, null, '0', '0', '226', '2012-03-24 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('803', '2012-03-24 14:41:45', '0', '0', '\0', '\0', 'No.13', null, null, '0', '0', '226', '2012-03-24 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('804', '2012-03-31 12:41:45', '0', '0', '\0', '\0', 'No.18', null, null, '0', '0', '226', '2012-03-31 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('805', '2012-03-31 14:41:45', '0', '0', '\0', '\0', 'No.19', null, null, '0', '0', '226', '2012-03-31 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('806', '2012-04-07 12:41:45', '0', '0', '\0', '\0', 'No.24', null, null, '0', '0', '226', '2012-04-07 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('807', '2012-04-07 14:41:45', '0', '0', '\0', '\0', 'No.25', null, null, '0', '0', '226', '2012-04-07 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('808', '2012-04-14 12:41:45', '0', '0', '\0', '\0', 'No.30', null, null, '0', '0', '226', '2012-04-14 13:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('809', '2012-04-14 14:41:45', '0', '0', '\0', '\0', 'No.31', null, null, '0', '0', '226', '2012-04-14 15:41:45', '60', '\0', '\0');
INSERT INTO `class` VALUES ('817', '2012-03-24 09:00:58', '0', '0', '\0', '\0', 'No.9', null, null, '0', '0', '227', '2012-03-24 09:50:58', '50', '\0', '\0');
INSERT INTO `class` VALUES ('819', '2012-03-15 11:00:00', '0', '0', '', '\0', 'No.1', 'sfd', null, '0', '0', '228', '2012-03-15 12:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('820', '2012-03-18 07:30:53', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '228', '2012-03-18 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('821', '2012-03-18 07:30:53', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '228', '2012-03-18 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('822', '2012-03-25 07:30:53', '0', '0', '\0', '\0', 'No.8', null, null, '0', '0', '228', '2012-03-25 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('823', '2012-04-01 07:30:53', '0', '0', '\0', '\0', 'No.11', null, null, '0', '0', '228', '2012-04-01 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('824', '2012-04-08 07:30:53', '0', '0', '\0', '\0', 'No.14', null, null, '0', '0', '228', '2012-04-08 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('825', '2012-04-15 07:30:53', '0', '0', '\0', '\0', 'No.17', null, null, '0', '0', '228', '2012-04-15 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('826', '2012-04-22 07:30:53', '0', '0', '\0', '\0', 'No.20', null, null, '0', '0', '228', '2012-04-22 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('827', '2012-03-21 07:30:53', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '228', '2012-03-21 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('828', '2012-03-21 07:30:53', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '228', '2012-03-21 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('829', '2012-03-28 07:30:53', '0', '0', '\0', '\0', 'No.9', null, null, '0', '0', '228', '2012-03-28 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('830', '2012-04-04 07:30:53', '0', '0', '\0', '\0', 'No.12', null, null, '0', '0', '228', '2012-04-04 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('831', '2012-04-11 07:30:53', '0', '0', '\0', '\0', 'No.15', null, null, '0', '0', '228', '2012-04-11 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('832', '2012-04-18 07:30:53', '0', '0', '\0', '\0', 'No.18', null, null, '0', '0', '228', '2012-04-18 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('833', '2012-04-25 07:30:53', '0', '0', '\0', '\0', 'No.21', null, null, '0', '0', '228', '2012-04-25 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('834', '2012-03-16 07:30:53', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '228', '2012-03-16 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('835', '2012-03-23 07:30:53', '0', '0', '', '\0', 'No.7', null, null, '0', '0', '228', '2012-03-23 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('836', '2012-03-30 07:30:53', '0', '0', '\0', '\0', 'No.10', null, null, '0', '0', '228', '2012-03-30 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('837', '2012-04-06 07:30:53', '0', '0', '\0', '\0', 'No.13', null, null, '0', '0', '228', '2012-04-06 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('838', '2012-04-13 07:30:53', '0', '0', '\0', '\0', 'No.16', null, null, '0', '0', '228', '2012-04-13 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('839', '2012-04-20 07:30:53', '0', '0', '\0', '\0', 'No.19', null, null, '0', '0', '228', '2012-04-20 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('840', '2012-04-27 07:30:53', '0', '0', '\0', '\0', 'No.22', null, null, '0', '0', '228', '2012-04-27 08:30:53', '60', '\0', '\0');
INSERT INTO `class` VALUES ('842', '2012-03-19 07:30:03', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '227', '2012-03-19 08:15:03', '45', '\0', '\0');
INSERT INTO `class` VALUES ('843', '2012-03-26 07:30:03', '0', '0', '\0', '\0', 'No.11', null, null, '0', '0', '227', '2012-03-26 08:15:03', '45', '\0', '\0');
INSERT INTO `class` VALUES ('844', '2012-04-02 07:30:03', '0', '0', '\0', '\0', 'No.14', null, null, '0', '0', '227', '2012-04-02 08:15:03', '45', '\0', '\0');
INSERT INTO `class` VALUES ('845', '2012-03-17 07:30:03', '0', '0', '', '\0', 'No.2', null, null, '0', '0', '227', '2012-03-17 08:15:03', '45', '\0', '\0');
INSERT INTO `class` VALUES ('848', '2012-04-07 07:30:03', '0', '0', '\0', '\0', 'No.16', null, null, '0', '0', '227', '2012-04-07 08:15:03', '45', '\0', '\0');
INSERT INTO `class` VALUES ('849', '2012-03-19 07:30:03', '0', '0', '', '\0', 'No.7', null, null, '0', '0', '227', '2012-03-19 08:20:03', '50', '\0', '\0');
INSERT INTO `class` VALUES ('850', '2012-03-17 07:30:03', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '227', '2012-03-17 08:20:03', '50', '\0', '\0');
INSERT INTO `class` VALUES ('851', '2012-03-19 00:40:38', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '227', '2012-03-19 00:20:38', '40', '\0', '\0');
INSERT INTO `class` VALUES ('852', '2012-03-19 00:40:38', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '227', '2012-03-19 00:20:38', '40', '\0', '\0');
INSERT INTO `class` VALUES ('853', '2012-03-26 00:40:38', '0', '0', '\0', '\0', 'No.10', null, null, '0', '0', '227', '2012-03-26 00:20:38', '40', '\0', '\0');
INSERT INTO `class` VALUES ('854', '2012-04-02 00:40:38', '0', '0', '\0', '\0', 'No.13', null, null, '0', '0', '227', '2012-04-02 00:20:38', '40', '\0', '\0');
INSERT INTO `class` VALUES ('855', '2012-03-17 00:40:38', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '227', '2012-03-17 00:20:38', '40', '\0', '\0');
INSERT INTO `class` VALUES ('856', '2012-03-24 00:40:38', '0', '0', '', '\0', 'No.8', null, null, '0', '0', '227', '2012-03-24 00:20:38', '40', '\0', '\0');
INSERT INTO `class` VALUES ('857', '2012-03-31 00:40:38', '0', '0', '\0', '\0', 'No.12', null, null, '0', '0', '227', '2012-03-31 00:20:38', '40', '\0', '\0');
INSERT INTO `class` VALUES ('858', '2012-04-07 00:40:38', '0', '0', '\0', '\0', 'No.15', null, null, '0', '0', '227', '2012-04-07 00:20:38', '40', '\0', '\0');
INSERT INTO `class` VALUES ('859', '2012-03-15 11:30:00', '0', '0', '\0', '\0', '第1节课', 'Introduction', null, '0', '0', '229', '2012-03-15 12:30:00', '60', '', '');
INSERT INTO `class` VALUES ('860', '2012-03-22 16:00:00', '0', '0', '\0', '\0', '第2节课', '', null, '0', '0', '230', '2012-03-22 17:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('861', '2012-03-18 10:30:22', '0', '0', '', '\0', '第1节课', null, null, '0', '0', '230', '2012-03-18 11:30:22', '60', '', '');
INSERT INTO `class` VALUES ('862', '2012-03-15 16:00:00', '0', '0', '', '\0', '第1节课', '', null, '0', '0', '231', '2012-03-15 17:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('863', '2012-03-19 00:25:00', '0', '0', '\0', '\0', '第1节课', '', null, '0', '0', '232', '2012-03-19 00:25:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('864', '2012-03-19 11:40:00', '0', '0', '\0', '\0', '第2节课', null, null, '0', '0', '232', '2012-03-19 12:30:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('865', '2012-03-26 00:35:00', '0', '0', '\0', '\0', '第5节课', null, null, '0', '0', '232', '2012-03-26 00:15:00', '40', '\0', '\0');
INSERT INTO `class` VALUES ('866', '2012-03-26 11:40:00', '0', '0', '\0', '\0', '第6节课', null, null, '0', '0', '232', '2012-03-26 12:30:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('867', '2012-03-24 00:35:00', '0', '0', '\0', '\0', '第3节课', null, null, '0', '0', '232', '2012-03-24 00:15:00', '40', '\0', '\0');
INSERT INTO `class` VALUES ('868', '2012-03-24 11:40:00', '0', '0', '\0', '\0', '第4节课', null, null, '0', '0', '232', '2012-03-24 12:30:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('869', '2012-03-31 00:35:00', '0', '0', '\0', '\0', '第7节课', null, null, '0', '0', '232', '2012-03-31 00:15:00', '40', '\0', '\0');
INSERT INTO `class` VALUES ('870', '2012-03-31 11:40:00', '0', '0', '\0', '\0', '第8节课', null, null, '0', '0', '232', '2012-03-31 12:30:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('871', '2012-03-16 12:30:00', '0', '0', '', '\0', 'No.2', 'tt', null, '0', '0', '233', '2012-03-16 13:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('872', '2012-03-19 12:00:00', '0', '0', '', '\0', 'No.5', null, null, '0', '0', '233', '2012-03-19 12:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('873', '2012-03-19 13:00:00', '0', '0', '', '\0', 'No.6', null, null, '0', '0', '233', '2012-03-19 13:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('874', '2012-03-19 13:00:00', '0', '0', '', '\0', 'No.7', null, null, '0', '0', '233', '2012-03-19 13:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('875', '2012-03-26 12:00:00', '0', '0', '\0', '\0', 'No.11', null, null, '0', '0', '233', '2012-03-26 12:55:00', '55', '', '\0');
INSERT INTO `class` VALUES ('876', '2012-03-26 13:00:00', '0', '0', '\0', '\0', 'No.12', null, null, '0', '0', '233', '2012-03-26 13:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('877', '2012-03-26 13:00:00', '0', '0', '\0', '\0', 'No.13', null, null, '0', '0', '233', '2012-03-26 13:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('878', '2012-04-02 12:00:00', '0', '0', '\0', '\0', 'No.17', null, null, '0', '0', '233', '2012-04-02 12:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('879', '2012-04-02 13:00:00', '0', '0', '\0', '\0', 'No.18', null, null, '0', '0', '233', '2012-04-02 13:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('880', '2012-04-02 13:00:00', '0', '0', '\0', '\0', 'No.19', null, null, '0', '0', '233', '2012-04-02 13:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('881', '2012-03-16 12:00:00', '0', '0', '', '\0', 'No.1', null, null, '0', '0', '233', '2012-03-16 12:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('882', '2012-03-16 13:00:00', '0', '0', '', '\0', 'No.3', null, null, '0', '0', '233', '2012-03-16 13:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('883', '2012-03-16 13:00:00', '0', '0', '', '\0', 'No.4', null, null, '0', '0', '233', '2012-03-16 13:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('884', '2012-03-23 12:00:00', '0', '0', '', '\0', 'No.8', null, null, '0', '0', '233', '2012-03-23 12:55:00', '55', '', '');
INSERT INTO `class` VALUES ('885', '2012-03-23 13:00:00', '0', '0', '', '\0', 'No.9', null, null, '0', '0', '233', '2012-03-23 13:55:00', '55', '', '');
INSERT INTO `class` VALUES ('886', '2012-03-23 13:00:00', '0', '0', '', '\0', 'No.10', null, null, '0', '0', '233', '2012-03-23 13:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('887', '2012-03-30 12:00:00', '0', '0', '\0', '\0', 'No.14', null, null, '0', '0', '233', '2012-03-30 12:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('888', '2012-03-30 13:00:00', '0', '0', '\0', '\0', 'No.15', null, null, '0', '0', '233', '2012-03-30 13:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('889', '2012-03-30 13:00:00', '0', '0', '\0', '\0', 'No.16', null, null, '0', '0', '233', '2012-03-30 13:55:00', '55', '\0', '\0');
INSERT INTO `class` VALUES ('890', '2012-03-22 05:40:00', '0', '0', '', '\0', '第1节课', '123', null, '0', '0', '236', '2012-03-22 06:40:00', '60', '', '\0');
INSERT INTO `class` VALUES ('891', '2012-03-23 11:40:00', '0', '0', '', '\0', '第1节课', '123', null, '0', '0', '237', '2012-03-23 12:40:00', '60', '', '');
INSERT INTO `class` VALUES ('892', '2012-03-26 08:30:00', '0', '0', '\0', '\0', '第4节课', null, null, '0', '0', '238', '2012-03-26 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('893', '2012-04-02 08:30:00', '0', '0', '\0', '\0', '第8节课', null, null, '0', '0', '238', '2012-04-02 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('894', '2012-04-09 08:30:00', '0', '0', '\0', '\0', '第12节课', null, null, '0', '0', '238', '2012-04-09 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('895', '2012-04-16 08:30:00', '0', '0', '\0', '\0', '第16节课', null, null, '0', '0', '238', '2012-04-16 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('896', '2012-04-23 08:30:00', '0', '0', '\0', '\0', '第20节课', null, null, '0', '0', '238', '2012-04-23 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('897', '2012-04-30 08:30:00', '0', '0', '\0', '\0', '第24节课', null, null, '0', '0', '238', '2012-04-30 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('898', '2012-05-07 08:30:00', '0', '0', '\0', '\0', '第28节课', null, null, '0', '0', '238', '2012-05-07 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('899', '2012-05-14 08:30:00', '0', '0', '\0', '\0', '第32节课', null, null, '0', '0', '238', '2012-05-14 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('900', '2012-03-20 08:30:00', '0', '0', '', '\0', '第1节课', null, null, '0', '0', '238', '2012-03-20 09:30:00', '60', '\0', '');
INSERT INTO `class` VALUES ('901', '2012-03-27 08:30:00', '0', '0', '\0', '\0', '第5节课', null, null, '0', '0', '238', '2012-03-27 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('902', '2012-04-03 08:30:00', '0', '0', '\0', '\0', '第9节课', null, null, '0', '0', '238', '2012-04-03 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('903', '2012-04-10 08:30:00', '0', '0', '\0', '\0', '第13节课', null, null, '0', '0', '238', '2012-04-10 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('904', '2012-04-17 08:30:00', '0', '0', '\0', '\0', '第17节课', null, null, '0', '0', '238', '2012-04-17 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('905', '2012-04-24 08:30:00', '0', '0', '\0', '\0', '第21节课', null, null, '0', '0', '238', '2012-04-24 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('906', '2012-05-01 08:30:00', '0', '0', '\0', '\0', '第25节课', null, null, '0', '0', '238', '2012-05-01 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('907', '2012-05-08 08:30:00', '0', '0', '\0', '\0', '第29节课', null, null, '0', '0', '238', '2012-05-08 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('908', '2012-03-23 08:30:00', '0', '0', '', '\0', '第2节课', null, null, '0', '0', '238', '2012-03-23 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('909', '2012-03-30 08:30:00', '0', '0', '\0', '\0', '第6节课', null, null, '0', '0', '238', '2012-03-30 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('910', '2012-04-06 08:30:00', '0', '0', '\0', '\0', '第10节课', null, null, '0', '0', '238', '2012-04-06 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('911', '2012-04-13 08:30:00', '0', '0', '\0', '\0', '第14节课', null, null, '0', '0', '238', '2012-04-13 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('912', '2012-04-20 08:30:00', '0', '0', '\0', '\0', '第18节课', null, null, '0', '0', '238', '2012-04-20 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('913', '2012-04-27 08:30:00', '0', '0', '\0', '\0', '第22节课', null, null, '0', '0', '238', '2012-04-27 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('914', '2012-05-04 08:30:00', '0', '0', '\0', '\0', '第26节课', null, null, '0', '0', '238', '2012-05-04 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('915', '2012-05-11 08:30:00', '0', '0', '\0', '\0', '第30节课', null, null, '0', '0', '238', '2012-05-11 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('916', '2012-03-24 08:30:00', '0', '0', '\0', '\0', '第3节课', null, null, '0', '0', '238', '2012-03-24 09:30:00', '60', '\0', '');
INSERT INTO `class` VALUES ('917', '2012-03-31 08:30:00', '0', '0', '\0', '\0', '第7节课', null, null, '0', '0', '238', '2012-03-31 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('918', '2012-04-07 08:30:00', '0', '0', '\0', '\0', '第11节课', null, null, '0', '0', '238', '2012-04-07 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('919', '2012-04-14 08:30:00', '0', '0', '\0', '\0', '第15节课', null, null, '0', '0', '238', '2012-04-14 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('920', '2012-04-21 08:30:00', '0', '0', '\0', '\0', '第19节课', null, null, '0', '0', '238', '2012-04-21 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('921', '2012-04-28 08:30:00', '0', '0', '\0', '\0', '第23节课', null, null, '0', '0', '238', '2012-04-28 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('922', '2012-05-05 08:30:00', '0', '0', '\0', '\0', '第27节课', null, null, '0', '0', '238', '2012-05-05 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('923', '2012-05-12 08:30:00', '0', '0', '\0', '\0', '第31节课', null, null, '0', '0', '238', '2012-05-12 09:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('924', '2012-03-21 10:30:00', '0', '0', '', '\0', '第1节课', '介绍', null, '0', '0', '239', '2012-03-21 11:20:00', '50', '', '');
INSERT INTO `class` VALUES ('925', '2012-03-26 11:30:00', '0', '0', '\0', '\0', '第3节课', null, null, '0', '0', '239', '2012-03-26 12:15:00', '45', '', '');
INSERT INTO `class` VALUES ('926', '2012-04-02 11:30:00', '0', '0', '\0', '\0', '第5节课', null, null, '0', '0', '239', '2012-04-02 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('927', '2012-04-09 11:30:00', '0', '0', '\0', '\0', '第7节课', null, null, '0', '0', '239', '2012-04-09 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('928', '2012-04-16 11:30:00', '0', '0', '\0', '\0', '第9节课', null, null, '0', '0', '239', '2012-04-16 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('929', '2012-04-23 11:30:00', '0', '0', '\0', '\0', '第11节课', null, null, '0', '0', '239', '2012-04-23 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('930', '2012-03-23 11:30:00', '0', '0', '', '\0', '第2节课', null, null, '0', '0', '239', '2012-03-23 12:15:00', '45', '', '\0');
INSERT INTO `class` VALUES ('931', '2012-03-30 11:30:00', '0', '0', '\0', '\0', '第4节课', null, null, '0', '0', '239', '2012-03-30 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('932', '2012-04-06 11:30:00', '0', '0', '\0', '\0', '第6节课', null, null, '0', '0', '239', '2012-04-06 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('933', '2012-04-13 11:30:00', '0', '0', '\0', '\0', '第8节课', null, null, '0', '0', '239', '2012-04-13 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('934', '2012-04-20 11:30:00', '0', '0', '\0', '\0', '第10节课', null, null, '0', '0', '239', '2012-04-20 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('935', '2012-03-21 12:30:00', '0', '0', '', '\0', '第2节课', '乐理知识', null, '0', '0', '240', '2012-03-21 13:20:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('936', '2012-03-26 11:30:00', '0', '0', '\0', '\0', '第4节课', null, null, '0', '0', '240', '2012-03-26 12:15:00', '45', '', '');
INSERT INTO `class` VALUES ('937', '2012-04-02 11:30:00', '0', '0', '\0', '\0', '第7节课', null, null, '0', '0', '240', '2012-04-02 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('938', '2012-04-09 11:30:00', '0', '0', '\0', '\0', '第10节课', null, null, '0', '0', '240', '2012-04-09 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('939', '2012-04-16 11:30:00', '0', '0', '\0', '\0', '第13节课', null, null, '0', '0', '240', '2012-04-16 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('940', '2012-04-23 11:30:00', '0', '0', '\0', '\0', '第16节课', null, null, '0', '0', '240', '2012-04-23 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('941', '2012-03-21 11:30:00', '0', '0', '', '\0', '第1节课', null, null, '0', '0', '240', '2012-03-21 12:15:00', '45', '', '\0');
INSERT INTO `class` VALUES ('942', '2012-03-28 11:30:00', '0', '0', '\0', '\0', '第5节课', null, null, '0', '0', '240', '2012-03-28 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('943', '2012-04-04 11:30:00', '0', '0', '\0', '\0', '第8节课', null, null, '0', '0', '240', '2012-04-04 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('944', '2012-04-11 11:30:00', '0', '0', '\0', '\0', '第11节课', null, null, '0', '0', '240', '2012-04-11 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('945', '2012-04-18 11:30:00', '0', '0', '\0', '\0', '第14节课', null, null, '0', '0', '240', '2012-04-18 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('946', '2012-03-23 11:30:00', '0', '0', '', '\0', '第3节课', null, null, '0', '0', '240', '2012-03-23 12:15:00', '45', '', '');
INSERT INTO `class` VALUES ('947', '2012-03-30 11:30:00', '0', '0', '\0', '\0', '第6节课', null, null, '0', '0', '240', '2012-03-30 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('948', '2012-04-06 11:30:00', '0', '0', '\0', '\0', '第9节课', null, null, '0', '0', '240', '2012-04-06 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('949', '2012-04-13 11:30:00', '0', '0', '\0', '\0', '第12节课', null, null, '0', '0', '240', '2012-04-13 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('950', '2012-04-20 11:30:00', '0', '0', '\0', '\0', '第15节课', null, null, '0', '0', '240', '2012-04-20 12:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('952', '2012-03-26 12:30:00', '0', '0', '\0', '\0', '第5节课', null, null, '0', '0', '241', '2012-03-26 13:15:00', '45', '', '\0');
INSERT INTO `class` VALUES ('953', '2012-03-26 14:00:00', '0', '0', '\0', '\0', '第6节课', null, null, '0', '0', '241', '2012-03-26 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('954', '2012-04-02 12:30:00', '0', '0', '\0', '\0', '第11节课', null, null, '0', '0', '241', '2012-04-02 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('955', '2012-04-02 14:00:00', '0', '0', '\0', '\0', '第12节课', null, null, '0', '0', '241', '2012-04-02 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('957', '2012-04-09 14:00:00', '0', '0', '\0', '\0', '第17节课', null, null, '0', '0', '241', '2012-04-09 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('958', '2012-04-16 12:30:00', '0', '0', '\0', '\0', '第22节课', null, null, '0', '0', '241', '2012-04-16 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('959', '2012-04-16 14:00:00', '0', '0', '\0', '\0', '第23节课', null, null, '0', '0', '241', '2012-04-16 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('960', '2012-04-23 12:30:00', '0', '0', '\0', '\0', '第28节课', null, null, '0', '0', '241', '2012-04-23 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('961', '2012-04-23 14:00:00', '0', '0', '\0', '\0', '第29节课', null, null, '0', '0', '241', '2012-04-23 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('962', '2012-03-22 13:30:00', '0', '0', '', '\0', '第1节课', '', null, '0', '0', '241', '2012-03-22 13:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('963', '2012-03-22 14:00:00', '0', '0', '', '\0', '第2节课', null, null, '0', '0', '241', '2012-03-22 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('964', '2012-03-29 12:30:00', '0', '0', '\0', '\0', '第7节课', null, null, '0', '0', '241', '2012-03-29 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('965', '2012-03-29 14:00:00', '0', '0', '\0', '\0', '第8节课', null, null, '0', '0', '241', '2012-03-29 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('966', '2012-04-05 12:30:00', '0', '0', '\0', '\0', '第13节课', null, null, '0', '0', '241', '2012-04-05 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('967', '2012-04-05 14:00:00', '0', '0', '\0', '\0', '第14节课', null, null, '0', '0', '241', '2012-04-05 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('968', '2012-04-12 12:30:00', '0', '0', '\0', '\0', '第18节课', null, null, '0', '0', '241', '2012-04-12 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('969', '2012-04-12 14:00:00', '0', '0', '\0', '\0', '第19节课', null, null, '0', '0', '241', '2012-04-12 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('970', '2012-04-19 12:30:00', '0', '0', '\0', '\0', '第24节课', null, null, '0', '0', '241', '2012-04-19 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('971', '2012-04-19 14:00:00', '0', '0', '\0', '\0', '第25节课', null, null, '0', '0', '241', '2012-04-19 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('972', '2012-03-24 12:30:00', '0', '0', '\0', '\0', '第3节课', null, null, '0', '0', '241', '2012-03-24 13:15:00', '45', '', '');
INSERT INTO `class` VALUES ('973', '2012-03-24 14:00:00', '0', '0', '\0', '\0', '第4节课', null, null, '0', '0', '241', '2012-03-24 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('974', '2012-03-31 12:30:00', '0', '0', '\0', '\0', '第9节课', null, null, '0', '0', '241', '2012-03-31 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('975', '2012-03-31 14:00:00', '0', '0', '\0', '\0', '第10节课', null, null, '0', '0', '241', '2012-03-31 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('976', '2012-04-07 12:30:00', '0', '0', '\0', '\0', '第15节课', null, null, '0', '0', '241', '2012-04-07 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('977', '2012-04-07 14:00:00', '0', '0', '\0', '\0', '第16节课', null, null, '0', '0', '241', '2012-04-07 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('978', '2012-04-14 12:30:00', '0', '0', '\0', '\0', '第20节课', null, null, '0', '0', '241', '2012-04-14 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('979', '2012-04-14 14:00:00', '0', '0', '\0', '\0', '第21节课', null, null, '0', '0', '241', '2012-04-14 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('980', '2012-04-21 12:30:00', '0', '0', '\0', '\0', '第26节课', null, null, '0', '0', '241', '2012-04-21 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('981', '2012-04-21 14:00:00', '0', '0', '\0', '\0', '第27节课', null, null, '0', '0', '241', '2012-04-21 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('982', '2012-03-30 16:00:00', '0', '0', '\0', '\0', '第1节课', '高中数学', null, '0', '0', '242', '2012-03-30 16:45:00', '45', '', '');
INSERT INTO `class` VALUES ('983', '2012-03-30 16:00:00', '0', '0', '\0', '\0', '第1节课', '第二课堂', null, '0', '0', '243', '2012-03-30 17:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('984', '2012-03-25 12:00:00', '0', '0', '\0', '\0', '第2节课', 'introduction', null, '0', '0', '244', '2012-03-25 13:00:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('985', '2012-03-26 12:00:00', '0', '0', '\0', '\0', '第3节课', null, null, '0', '0', '244', '2012-03-26 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('986', '2012-04-02 12:00:00', '0', '0', '\0', '\0', '第6节课', null, null, '0', '0', '244', '2012-04-02 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('987', '2012-04-09 12:00:00', '0', '0', '\0', '\0', '第9节课', null, null, '0', '0', '244', '2012-04-09 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('988', '2012-04-16 12:00:00', '0', '0', '\0', '\0', '第12节课', null, null, '0', '0', '244', '2012-04-16 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('989', '2012-04-23 12:00:00', '0', '0', '\0', '\0', '第15节课', null, null, '0', '0', '244', '2012-04-23 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('990', '2012-03-28 12:00:00', '0', '0', '\0', '\0', '第4节课', null, null, '0', '0', '244', '2012-03-28 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('991', '2012-04-04 12:00:00', '0', '0', '\0', '\0', '第7节课', null, null, '0', '0', '244', '2012-04-04 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('992', '2012-04-11 12:00:00', '0', '0', '\0', '\0', '第10节课', null, null, '0', '0', '244', '2012-04-11 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('993', '2012-04-18 12:00:00', '0', '0', '\0', '\0', '第13节课', null, null, '0', '0', '244', '2012-04-18 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('994', '2012-04-25 12:00:00', '0', '0', '\0', '\0', '第16节课', null, null, '0', '0', '244', '2012-04-25 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('995', '2012-03-24 12:00:00', '0', '0', '\0', '\0', '第1节课', null, null, '0', '0', '244', '2012-03-24 12:50:00', '50', '', '\0');
INSERT INTO `class` VALUES ('996', '2012-03-31 12:00:00', '0', '0', '\0', '\0', '第5节课', null, null, '0', '0', '244', '2012-03-31 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('997', '2012-04-07 12:00:00', '0', '0', '\0', '\0', '第8节课', null, null, '0', '0', '244', '2012-04-07 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('998', '2012-04-14 12:00:00', '0', '0', '\0', '\0', '第11节课', null, null, '0', '0', '244', '2012-04-14 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('999', '2012-04-21 12:00:00', '0', '0', '\0', '\0', '第14节课', null, null, '0', '0', '244', '2012-04-21 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1000', '2012-03-26 12:00:00', '0', '0', '\0', '\0', '第2节课', null, null, '0', '0', '245', '2012-03-26 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1001', '2012-04-02 12:00:00', '0', '0', '\0', '\0', '第5节课', null, null, '0', '0', '245', '2012-04-02 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1002', '2012-04-09 12:00:00', '0', '0', '\0', '\0', '第8节课', null, null, '0', '0', '245', '2012-04-09 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1003', '2012-04-16 12:00:00', '0', '0', '\0', '\0', '第11节课', null, null, '0', '0', '245', '2012-04-16 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1004', '2012-03-28 12:00:00', '0', '0', '\0', '\0', '第3节课', null, null, '0', '0', '245', '2012-03-28 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1005', '2012-04-04 12:00:00', '0', '0', '\0', '\0', '第6节课', null, null, '0', '0', '245', '2012-04-04 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1006', '2012-04-11 12:00:00', '0', '0', '\0', '\0', '第9节课', null, null, '0', '0', '245', '2012-04-11 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1007', '2012-04-18 12:00:00', '0', '0', '\0', '\0', '第12节课', null, null, '0', '0', '245', '2012-04-18 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1008', '2012-03-24 12:00:00', '0', '0', '\0', '\0', '第1节课', null, null, '0', '0', '245', '2012-03-24 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1009', '2012-03-31 12:00:00', '0', '0', '\0', '\0', '第4节课', null, null, '0', '0', '245', '2012-03-31 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1010', '2012-04-07 12:00:00', '0', '0', '\0', '\0', '第7节课', null, null, '0', '0', '245', '2012-04-07 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1011', '2012-04-14 12:00:00', '0', '0', '\0', '\0', '第10节课', null, null, '0', '0', '245', '2012-04-14 12:50:00', '50', '\0', '\0');
INSERT INTO `class` VALUES ('1012', '2012-03-29 13:30:00', '0', '0', '\0', '\0', '第1节课', '', null, '0', '0', '246', '2012-03-29 14:30:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('1013', '2012-03-22 14:00:00', '0', '0', '\0', '\0', '第2节课', null, null, '0', '0', '246', '2012-03-22 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1014', '2012-03-24 12:30:00', '0', '0', '\0', '\0', '第3节课', null, null, '0', '0', '246', '2012-03-24 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1015', '2012-03-24 14:00:00', '0', '0', '\0', '\0', '第4节课', null, null, '0', '0', '246', '2012-03-24 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1016', '2012-03-26 12:30:00', '0', '0', '\0', '\0', '第5节课', null, null, '0', '0', '246', '2012-03-26 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1017', '2012-03-26 14:00:00', '0', '0', '\0', '\0', '第6节课', null, null, '0', '0', '246', '2012-03-26 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1018', '2012-03-29 12:30:00', '0', '0', '\0', '\0', '第7节课', null, null, '0', '0', '246', '2012-03-29 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1019', '2012-03-29 14:00:00', '0', '0', '\0', '\0', '第8节课', null, null, '0', '0', '246', '2012-03-29 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1020', '2012-03-31 12:30:00', '0', '0', '\0', '\0', '第9节课', null, null, '0', '0', '246', '2012-03-31 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1021', '2012-03-31 14:00:00', '0', '0', '\0', '\0', '第10节课', null, null, '0', '0', '246', '2012-03-31 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1022', '2012-04-02 12:30:00', '0', '0', '\0', '\0', '第11节课', null, null, '0', '0', '246', '2012-04-02 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1023', '2012-04-02 14:00:00', '0', '0', '\0', '\0', '第12节课', null, null, '0', '0', '246', '2012-04-02 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1024', '2012-04-05 12:30:00', '0', '0', '\0', '\0', '第13节课', null, null, '0', '0', '246', '2012-04-05 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1025', '2012-04-05 14:00:00', '0', '0', '\0', '\0', '第14节课', null, null, '0', '0', '246', '2012-04-05 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1026', '2012-04-07 12:30:00', '0', '0', '\0', '\0', '第15节课', null, null, '0', '0', '246', '2012-04-07 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1027', '2012-04-07 14:00:00', '0', '0', '\0', '\0', '第16节课', null, null, '0', '0', '246', '2012-04-07 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1028', '2012-04-09 14:00:00', '0', '0', '\0', '\0', '第17节课', null, null, '0', '0', '246', '2012-04-09 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1029', '2012-04-12 12:30:00', '0', '0', '\0', '\0', '第18节课', null, null, '0', '0', '246', '2012-04-12 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1030', '2012-04-12 14:00:00', '0', '0', '\0', '\0', '第19节课', null, null, '0', '0', '246', '2012-04-12 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1031', '2012-04-14 12:30:00', '0', '0', '\0', '\0', '第20节课', null, null, '0', '0', '246', '2012-04-14 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1032', '2012-04-14 14:00:00', '0', '0', '\0', '\0', '第21节课', null, null, '0', '0', '246', '2012-04-14 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1033', '2012-04-16 12:30:00', '0', '0', '\0', '\0', '第22节课', null, null, '0', '0', '246', '2012-04-16 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1034', '2012-04-16 14:00:00', '0', '0', '\0', '\0', '第23节课', null, null, '0', '0', '246', '2012-04-16 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1035', '2012-04-19 12:30:00', '0', '0', '\0', '\0', '第24节课', null, null, '0', '0', '246', '2012-04-19 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1036', '2012-04-19 14:00:00', '0', '0', '\0', '\0', '第25节课', null, null, '0', '0', '246', '2012-04-19 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1037', '2012-04-21 12:30:00', '0', '0', '\0', '\0', '第26节课', null, null, '0', '0', '246', '2012-04-21 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1038', '2012-04-21 14:00:00', '0', '0', '\0', '\0', '第27节课', null, null, '0', '0', '246', '2012-04-21 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1039', '2012-04-23 12:30:00', '0', '0', '\0', '\0', '第28节课', null, null, '0', '0', '246', '2012-04-23 13:15:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1040', '2012-04-23 14:00:00', '0', '0', '\0', '\0', '第29节课', null, null, '0', '0', '246', '2012-04-23 14:45:00', '45', '\0', '\0');
INSERT INTO `class` VALUES ('1041', '2012-03-26 12:00:00', '0', '0', '\0', '\0', '第1节课', 'instroduction', null, '0', '0', '247', '2012-03-26 13:00:00', '60', '', '\0');
INSERT INTO `class` VALUES ('1042', '2012-03-30 11:40:00', '0', '0', '\0', '\0', '第1节课', '123', null, '0', '0', '248', '2012-03-30 12:40:00', '60', '\0', '\0');
INSERT INTO `class` VALUES ('1043', '2012-03-27 10:40:00', '0', '0', '\0', '\0', '第1节课', '222222', null, '0', '0', '249', '2012-03-27 11:40:00', '60', '', '');

-- ----------------------------
-- Table structure for `classroom`
-- ----------------------------
DROP TABLE IF EXISTS `classroom`;
CREATE TABLE `classroom` (
  `id` int(11) NOT NULL auto_increment,
  `course_id` int(11) default NULL,
  `student_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK76DD4253E9AB4C38` (`student_id`),
  KEY `FK76DD4253ACBD5F77` (`course_id`),
  CONSTRAINT `FK76DD4253ACBD5F77` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK76DD4253E9AB4C38` FOREIGN KEY (`student_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classroom
-- ----------------------------

-- ----------------------------
-- Table structure for `commentreply`
-- ----------------------------
DROP TABLE IF EXISTS `commentreply`;
CREATE TABLE `commentreply` (
  `id` int(11) NOT NULL auto_increment,
  `content` varchar(255) default NULL,
  `replyTime` date default NULL,
  `courseComment_id` int(11) default NULL,
  `replyer_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK3879ABEB6CC83DC` (`replyer_id`),
  KEY `FK3879ABEB94240CDD` (`courseComment_id`),
  CONSTRAINT `FK3879ABEB6CC83DC` FOREIGN KEY (`replyer_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK3879ABEB94240CDD` FOREIGN KEY (`courseComment_id`) REFERENCES `coursecomment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commentreply
-- ----------------------------
INSERT INTO `commentreply` VALUES ('1', '楼上正解', '2012-02-14', '13', '29');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `description` varchar(255) default NULL,
  `owner_id` int(11) default NULL,
  `to_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKDFF242142DCB57F8` (`to_id`),
  KEY `FKDFF242148A5668C0` (`owner_id`),
  CONSTRAINT `FKDFF242142DCB57F8` FOREIGN KEY (`to_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FKDFF242148A5668C0` FOREIGN KEY (`owner_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '2012-01-18 13:41:45', '2321', '3', '3');
INSERT INTO `comments` VALUES ('2', '2012-01-19 09:56:12', 'hello', '2', '2');
INSERT INTO `comments` VALUES ('3', '2012-01-20 03:35:25', '加油', '4', '4');
INSERT INTO `comments` VALUES ('4', '2012-02-11 04:38:38', 'hel', '3', '2');
INSERT INTO `comments` VALUES ('5', '2012-02-11 04:38:49', 'nihao ', '3', '2');
INSERT INTO `comments` VALUES ('6', '2012-03-03 15:23:19', 'hello', '19', '29');
INSERT INTO `comments` VALUES ('7', '2012-03-03 15:23:19', 'hello', '19', '29');
INSERT INTO `comments` VALUES ('8', '2012-03-03 15:27:14', '很认真，很靠谱', '19', '3');
INSERT INTO `comments` VALUES ('9', '2012-03-08 13:44:23', 'hello,...', '2', '19');
INSERT INTO `comments` VALUES ('10', '2012-03-12 17:57:21', 'This course is really nice!', '29', '1');
INSERT INTO `comments` VALUES ('11', '2012-03-12 17:57:31', 'This course is really nice!', '29', '1');
INSERT INTO `comments` VALUES ('12', '2012-03-12 17:57:41', 'This course is really nice!', '29', '1');
INSERT INTO `comments` VALUES ('13', '2012-03-12 17:57:46', 'This course is really nice!', '29', '1');

-- ----------------------------
-- Table structure for `competition`
-- ----------------------------
DROP TABLE IF EXISTS `competition`;
CREATE TABLE `competition` (
  `id` int(11) NOT NULL auto_increment,
  `QQ` varchar(255) default NULL,
  `brief` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `endDate` date default NULL,
  `guanMing` varchar(255) default NULL,
  `logoUrl` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `singUpEndDate` date default NULL,
  `singUpStartDate` date default NULL,
  `startDate` date default NULL,
  `status` int(11) NOT NULL,
  `creator_id` int(11) default NULL,
  `subject_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK221F399F8BD29E3D` (`subject_id`),
  KEY `FK221F399F796BBCA7` (`creator_id`),
  CONSTRAINT `FK221F399F796BBCA7` FOREIGN KEY (`creator_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK221F399F8BD29E3D` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition
-- ----------------------------
INSERT INTO `competition` VALUES ('1', null, null, null, '2011-11-29', null, null, '第一届', '12321421321', '2011-11-29', null, '2011-11-29', '0', null, '1');

-- ----------------------------
-- Table structure for `competitionaudience`
-- ----------------------------
DROP TABLE IF EXISTS `competitionaudience`;
CREATE TABLE `competitionaudience` (
  `id` int(11) NOT NULL auto_increment,
  `audience_id` int(11) default NULL,
  `competitionSession_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK245878C3D9369657` (`competitionSession_id`),
  KEY `FK245878C35DB0E3CF` (`audience_id`),
  CONSTRAINT `FK245878C35DB0E3CF` FOREIGN KEY (`audience_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK245878C3D9369657` FOREIGN KEY (`competitionSession_id`) REFERENCES `competitionsession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competitionaudience
-- ----------------------------

-- ----------------------------
-- Table structure for `competitioncomments`
-- ----------------------------
DROP TABLE IF EXISTS `competitioncomments`;
CREATE TABLE `competitioncomments` (
  `id` int(11) NOT NULL auto_increment,
  `date` datetime default NULL,
  `description` varchar(255) default NULL,
  `mark` int(11) NOT NULL,
  `competitionSession_id` int(11) default NULL,
  `owner_id` int(11) default NULL,
  `to_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC6496CB3D9369657` (`competitionSession_id`),
  KEY `FKC6496CB32DCB57F8` (`to_id`),
  KEY `FKC6496CB38A5668C0` (`owner_id`),
  CONSTRAINT `FKC6496CB32DCB57F8` FOREIGN KEY (`to_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FKC6496CB38A5668C0` FOREIGN KEY (`owner_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FKC6496CB3D9369657` FOREIGN KEY (`competitionSession_id`) REFERENCES `competitionsession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competitioncomments
-- ----------------------------

-- ----------------------------
-- Table structure for `competitionphase`
-- ----------------------------
DROP TABLE IF EXISTS `competitionphase`;
CREATE TABLE `competitionphase` (
  `id` int(11) NOT NULL auto_increment,
  `endDate` date default NULL,
  `name` varchar(255) default NULL,
  `startDate` date default NULL,
  `status` int(11) default NULL,
  `type` int(11) default NULL,
  `competition_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKB1670B1CC22037DD` (`competition_id`),
  CONSTRAINT `FKB1670B1CC22037DD` FOREIGN KEY (`competition_id`) REFERENCES `competition` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competitionphase
-- ----------------------------
INSERT INTO `competitionphase` VALUES ('1', null, '第一阶段', null, null, '1', '1');

-- ----------------------------
-- Table structure for `competitionsession`
-- ----------------------------
DROP TABLE IF EXISTS `competitionsession`;
CREATE TABLE `competitionsession` (
  `id` int(11) NOT NULL auto_increment,
  `date` date default NULL,
  `endTime` double default NULL,
  `name` varchar(255) default NULL,
  `startTime` double default NULL,
  `status` int(11) default NULL,
  `competitionPhase_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK8E629FF79C946377` (`competitionPhase_id`),
  CONSTRAINT `FK8E629FF79C946377` FOREIGN KEY (`competitionPhase_id`) REFERENCES `competitionphase` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competitionsession
-- ----------------------------
INSERT INTO `competitionsession` VALUES ('1', '2011-11-29', '18', null, '14', null, '1');

-- ----------------------------
-- Table structure for `consumptionrecord`
-- ----------------------------
DROP TABLE IF EXISTS `consumptionrecord`;
CREATE TABLE `consumptionrecord` (
  `id` int(11) NOT NULL auto_increment,
  `consumptionDate` datetime default NULL,
  `consumptionType` bit(1) default NULL,
  `quantity` double default NULL,
  `recordState` bit(1) default NULL,
  `remarks` varchar(255) default NULL,
  `seriesConsumption_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK42C52BAC5414175D` (`seriesConsumption_id`),
  KEY `FK42C52BAC1E6FB8A8` (`user_id`),
  CONSTRAINT `FK42C52BAC1E6FB8A8` FOREIGN KEY (`user_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK42C52BAC5414175D` FOREIGN KEY (`seriesConsumption_id`) REFERENCES `seriesconsumption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consumptionrecord
-- ----------------------------
INSERT INTO `consumptionrecord` VALUES ('1', '2012-01-04 03:17:10', '', '0', '\0', 'zengzeng预定hailinchl000老师java程序设计课程,花费0.0知币', '1', '3');
INSERT INTO `consumptionrecord` VALUES ('2', '2012-01-04 03:17:10', '', '0', '\0', 'zengzeng预定hailinchl000老师java程序设计课程,花费0.0知币', '2', '2');
INSERT INTO `consumptionrecord` VALUES ('3', '2012-01-06 08:05:45', '\0', '100', '', '申请账号，系统赠送100知券', '3', '14');
INSERT INTO `consumptionrecord` VALUES ('4', '2012-01-11 14:52:45', '\0', '100', '', '申请账号，系统赠送100知券', '4', '15');
INSERT INTO `consumptionrecord` VALUES ('5', '2012-01-13 14:40:30', '', '0', '\0', 'hailinchl000预定zengzeng老师好好学习课程,花费0.0知币', '5', '2');
INSERT INTO `consumptionrecord` VALUES ('6', '2012-01-13 14:40:30', '', '0', '\0', 'hailinchl000预定zengzeng老师好好学习课程,花费0.0知币', '6', '3');
INSERT INTO `consumptionrecord` VALUES ('7', '2012-01-13 14:47:07', '\0', '0', '\0', 'hailinchl000预定jiajun老师三缺一，长沙麻将训练营课程,花费0.0知券', '7', '4');
INSERT INTO `consumptionrecord` VALUES ('8', '2012-01-13 14:47:07', '\0', '0', '\0', 'hailinchl000预定jiajun老师三缺一，长沙麻将训练营课程,花费0.0知券', '8', '3');
INSERT INTO `consumptionrecord` VALUES ('9', '2012-01-13 15:00:04', '', '0', '\0', 'hailinchl000预定jiajun老师英语口语培训课程,花费0.0知币', '9', '4');
INSERT INTO `consumptionrecord` VALUES ('10', '2012-01-13 15:00:04', '', '0', '\0', 'hailinchl000预定jiajun老师英语口语培训课程,花费0.0知币', '10', '3');
INSERT INTO `consumptionrecord` VALUES ('11', '2012-01-13 15:10:05', '\0', '100', '', '申请账号，系统赠送100知券', '11', '16');
INSERT INTO `consumptionrecord` VALUES ('12', '2012-01-13 15:16:42', '\0', '100', '', '申请账号，系统赠送100知券', '12', '17');
INSERT INTO `consumptionrecord` VALUES ('13', '2012-01-13 15:25:44', '', '0', '\0', '成安预定null老师Special for you课程,花费0.0知币', '13', '17');
INSERT INTO `consumptionrecord` VALUES ('14', '2012-01-13 15:25:44', '', '0', '\0', '成安预定null老师Special for you课程,花费0.0知币', '14', '16');
INSERT INTO `consumptionrecord` VALUES ('15', '2012-01-14 07:38:09', '', '0', '\0', 'zengzeng预定hailinchl000老师TEST课程,花费0.0知币', '15', '3');
INSERT INTO `consumptionrecord` VALUES ('16', '2012-01-14 07:38:09', '', '0', '\0', 'zengzeng预定hailinchl000老师TEST课程,花费0.0知币', '16', '2');
INSERT INTO `consumptionrecord` VALUES ('17', '2012-01-29 12:23:09', '', '0', '\0', 'hailinchl000预定jiajun老师第一次会议课程,花费0.0知币', '17', '4');
INSERT INTO `consumptionrecord` VALUES ('18', '2012-01-29 12:23:09', '', '0', '\0', 'hailinchl000预定jiajun老师第一次会议课程,花费0.0知币', '18', '3');
INSERT INTO `consumptionrecord` VALUES ('19', '2012-02-04 06:13:05', '\0', '100', '', '申请账号，系统赠送100知券', '19', '18');
INSERT INTO `consumptionrecord` VALUES ('20', '2012-02-04 06:27:38', '\0', '100', '', '申请账号，系统赠送100知券', '20', '19');
INSERT INTO `consumptionrecord` VALUES ('21', '2012-02-04 06:32:02', '\0', '100', '', '申请账号，系统赠送100知券', '21', '20');
INSERT INTO `consumptionrecord` VALUES ('22', '2012-02-09 08:45:23', '', '0', '\0', 'wuhuan预定陈海林老师wwh课程,花费0.0知币', '22', '3');
INSERT INTO `consumptionrecord` VALUES ('23', '2012-02-09 08:45:23', '', '0', '\0', 'wuhuan预定陈海林老师wwh课程,花费0.0知币', '23', '20');
INSERT INTO `consumptionrecord` VALUES ('24', '2012-02-09 09:03:14', '', '0', '\0', '陈海林预定wuhuan老师数据结构课程,花费0.0知币', '24', '20');
INSERT INTO `consumptionrecord` VALUES ('25', '2012-02-09 09:03:14', '', '0', '\0', '陈海林预定wuhuan老师数据结构课程,花费0.0知币', '25', '3');
INSERT INTO `consumptionrecord` VALUES ('26', '2012-02-09 09:12:55', '', '0', '\0', 'zengzeng预定陈海林老师毛泽东思想课程,花费0.0知币', '26', '3');
INSERT INTO `consumptionrecord` VALUES ('27', '2012-02-09 09:12:55', '', '0', '\0', 'zengzeng预定陈海林老师毛泽东思想课程,花费0.0知币', '27', '2');
INSERT INTO `consumptionrecord` VALUES ('28', '2012-02-09 11:54:56', '\0', '100', '', '申请账号，系统赠送100知券', '28', '21');
INSERT INTO `consumptionrecord` VALUES ('29', '2012-02-09 12:02:28', '', '0', '\0', '陈海林预定zengzeng老师First课程,花费0.0知币', '29', '2');
INSERT INTO `consumptionrecord` VALUES ('30', '2012-02-09 12:02:28', '', '0', '\0', '陈海林预定zengzeng老师First课程,花费0.0知币', '30', '3');
INSERT INTO `consumptionrecord` VALUES ('31', '2012-02-09 12:19:18', '\0', '100', '', '申请账号，系统赠送100知券', '31', '22');
INSERT INTO `consumptionrecord` VALUES ('32', '2012-02-09 12:21:16', '\0', '100', '', '申请账号，系统赠送100知券', '32', '23');
INSERT INTO `consumptionrecord` VALUES ('33', '2012-02-09 15:07:35', '\0', '100', '', '申请账号，系统赠送100知券', '33', '24');
INSERT INTO `consumptionrecord` VALUES ('34', '2012-02-09 15:08:56', '', '0', '\0', '陈海林预定zengzeng老师Second课程,花费0.0知币', '34', '2');
INSERT INTO `consumptionrecord` VALUES ('35', '2012-02-09 15:08:56', '', '0', '\0', '陈海林预定zengzeng老师Second课程,花费0.0知币', '35', '3');
INSERT INTO `consumptionrecord` VALUES ('36', '2012-02-09 15:31:42', '', '0', '\0', 'wuhuan预定陈海林老师Third课程,花费0.0知币', '36', '3');
INSERT INTO `consumptionrecord` VALUES ('37', '2012-02-09 15:31:42', '', '0', '\0', 'wuhuan预定陈海林老师Third课程,花费0.0知币', '37', '20');
INSERT INTO `consumptionrecord` VALUES ('38', '2012-02-10 09:08:18', '\0', '100', '', '申请账号，系统赠送100知券', '38', '25');
INSERT INTO `consumptionrecord` VALUES ('39', '2012-02-10 09:19:08', '\0', '100', '', '申请账号，系统赠送100知券', '39', '26');
INSERT INTO `consumptionrecord` VALUES ('40', '2012-02-11 03:20:08', '\0', '100', '', '申请账号，系统赠送100知券', '40', '27');
INSERT INTO `consumptionrecord` VALUES ('41', '2012-02-11 05:49:14', '\0', '100', '', '申请账号，系统赠送100知券', '41', '28');
INSERT INTO `consumptionrecord` VALUES ('42', '2012-02-12 05:59:38', '\0', '100', '', '申请账号，系统赠送100知券', '42', '29');
INSERT INTO `consumptionrecord` VALUES ('43', '2012-02-12 09:10:54', '\0', '100', '', '申请账号，系统赠送100知券', '43', '30');
INSERT INTO `consumptionrecord` VALUES ('44', '2012-02-12 09:33:42', '', '0', '\0', 'zengzeng预定陈海林老师CHL集团培训课程,花费0.0知币', '44', '3');
INSERT INTO `consumptionrecord` VALUES ('45', '2012-02-12 09:33:42', '', '0', '\0', 'zengzeng预定陈海林老师CHL集团培训课程,花费0.0知币', '45', '2');
INSERT INTO `consumptionrecord` VALUES ('46', '2012-02-14 06:30:49', '\0', '0', '\0', '陈海林预定zengzeng老师1对1旁听测试课程,花费0.0知券', '46', '2');
INSERT INTO `consumptionrecord` VALUES ('47', '2012-02-14 06:30:49', '\0', '0', '\0', '陈海林预定zengzeng老师1对1旁听测试课程,花费0.0知券', '47', '3');
INSERT INTO `consumptionrecord` VALUES ('48', '2012-02-14 17:25:54', '', '0', '\0', '那年此时预定zengzeng老师Fourth课程,花费0.0知币', '48', '2');
INSERT INTO `consumptionrecord` VALUES ('49', '2012-02-14 17:25:54', '', '0', '\0', '那年此时预定zengzeng老师Fourth课程,花费0.0知币', '49', '29');
INSERT INTO `consumptionrecord` VALUES ('50', '2012-02-15 08:54:54', '\0', '100', '', '申请账号，系统赠送100知券', '50', '31');
INSERT INTO `consumptionrecord` VALUES ('51', '2012-02-15 09:01:38', '', '0', '\0', '441599204@qq.com预定jiajun老师编译原理2.25课程,花费0.0知币', '51', '4');
INSERT INTO `consumptionrecord` VALUES ('52', '2012-02-15 09:01:38', '', '0', '\0', '441599204@qq.com预定jiajun老师编译原理2.25课程,花费0.0知币', '52', '31');
INSERT INTO `consumptionrecord` VALUES ('53', '2012-02-15 09:34:00', '', '0', '\0', 'zengzeng预定jiajun老师操作系统2.15课程,花费0.0知币', '53', '4');
INSERT INTO `consumptionrecord` VALUES ('54', '2012-02-15 09:34:00', '', '0', '\0', 'zengzeng预定jiajun老师操作系统2.15课程,花费0.0知币', '54', '2');
INSERT INTO `consumptionrecord` VALUES ('55', '2012-02-16 02:24:13', '\0', '100', '', '申请账号，系统赠送100知券', '55', '32');
INSERT INTO `consumptionrecord` VALUES ('56', '2012-02-16 02:33:02', '', '0', '\0', '陈海林预定zengzeng老师武汉测试课程,花费0.0知币', '56', '2');
INSERT INTO `consumptionrecord` VALUES ('57', '2012-02-16 02:33:02', '', '0', '\0', '陈海林预定zengzeng老师武汉测试课程,花费0.0知币', '57', '3');
INSERT INTO `consumptionrecord` VALUES ('58', '2012-02-16 02:52:18', '', '0', '\0', 'zengzeng预定曾锃老师Testing Wuhan课程,花费0.0知币', '58', '19');
INSERT INTO `consumptionrecord` VALUES ('59', '2012-02-16 02:52:18', '', '0', '\0', 'zengzeng预定曾锃老师Testing Wuhan课程,花费0.0知币', '59', '2');
INSERT INTO `consumptionrecord` VALUES ('60', '2012-02-16 03:05:22', '\0', '0', '\0', 'zengzeng预定陈海林老师武汉旁听测试课程,花费0.0知券', '60', '3');
INSERT INTO `consumptionrecord` VALUES ('61', '2012-02-16 03:05:22', '\0', '0', '\0', 'zengzeng预定陈海林老师武汉旁听测试课程,花费0.0知券', '61', '2');
INSERT INTO `consumptionrecord` VALUES ('62', '2012-02-16 08:18:13', '\0', '100', '', '申请账号，系统赠送100知券', '62', '33');
INSERT INTO `consumptionrecord` VALUES ('63', '2012-02-16 08:36:55', '\0', '100', '', '申请账号，系统赠送100知券', '63', '34');
INSERT INTO `consumptionrecord` VALUES ('64', '2012-02-16 08:38:18', '', '0', '\0', 'zengzeng预定null老师英语口语第一步课程,花费0.0知币', '64', '33');
INSERT INTO `consumptionrecord` VALUES ('65', '2012-02-16 08:38:18', '', '0', '\0', 'zengzeng预定null老师英语口语第一步课程,花费0.0知币', '65', '2');
INSERT INTO `consumptionrecord` VALUES ('66', '2012-02-16 09:08:41', '\0', '100', '', '申请账号，系统赠送100知券', '66', '35');
INSERT INTO `consumptionrecord` VALUES ('67', '2012-02-16 09:11:30', '', '0', '\0', 'zengzeng预定null老师Hello课程,花费0.0知币', '67', '35');
INSERT INTO `consumptionrecord` VALUES ('68', '2012-02-16 09:11:30', '', '0', '\0', 'zengzeng预定null老师Hello课程,花费0.0知币', '68', '2');
INSERT INTO `consumptionrecord` VALUES ('69', '2012-02-16 09:12:39', '\0', '100', '', '申请账号，系统赠送100知券', '69', '36');
INSERT INTO `consumptionrecord` VALUES ('70', '2012-02-16 09:12:53', '\0', '100', '', '申请账号，系统赠送100知券', '70', '37');
INSERT INTO `consumptionrecord` VALUES ('71', '2012-02-16 09:13:15', '\0', '100', '', '申请账号，系统赠送100知券', '71', '38');
INSERT INTO `consumptionrecord` VALUES ('72', '2012-02-16 12:25:33', '', '0', '\0', 'zengzeng预定陈海林老师The Seven课程,花费0.0知币', '72', '3');
INSERT INTO `consumptionrecord` VALUES ('73', '2012-02-16 12:25:33', '', '0', '\0', 'zengzeng预定陈海林老师The Seven课程,花费0.0知币', '73', '2');
INSERT INTO `consumptionrecord` VALUES ('74', '2012-02-20 13:47:53', '', '0', '\0', '陈海林预定jiajun老师西方经济学课程,花费0.0知币', '74', '4');
INSERT INTO `consumptionrecord` VALUES ('75', '2012-02-20 13:47:54', '', '0', '\0', '陈海林预定jiajun老师西方经济学课程,花费0.0知币', '75', '3');
INSERT INTO `consumptionrecord` VALUES ('76', '2012-02-21 10:52:21', '\0', '100', '', '申请账号，系统赠送100知券', '76', '39');
INSERT INTO `consumptionrecord` VALUES ('77', '2012-02-25 15:18:55', '\0', '100', '', '申请账号，系统赠送100知券', '77', '43');
INSERT INTO `consumptionrecord` VALUES ('78', '2012-02-25 16:02:23', '\0', '100', '', '申请账号，系统赠送100知券', '78', '44');
INSERT INTO `consumptionrecord` VALUES ('79', '2012-02-27 04:08:06', '\0', '100', '', '申请账号，系统赠送100知券', '79', '45');
INSERT INTO `consumptionrecord` VALUES ('80', '2012-02-27 04:16:03', '\0', '100', '', '申请账号，系统赠送100知券', '80', '46');
INSERT INTO `consumptionrecord` VALUES ('81', '2012-02-28 03:12:51', '\0', '100', '', '申请账号，系统赠送100知券', '81', '48');
INSERT INTO `consumptionrecord` VALUES ('82', '2012-02-29 14:48:52', '\0', '0', '\0', '泡泡雪儿预定jiajun老师课程测试2.29课程,花费0.0知券', '82', '4');
INSERT INTO `consumptionrecord` VALUES ('83', '2012-02-29 14:48:52', '\0', '0', '\0', '泡泡雪儿预定jiajun老师课程测试2.29课程,花费0.0知券', '83', '15');
INSERT INTO `consumptionrecord` VALUES ('84', '2012-03-01 12:17:10', '\0', '100', '', '申请账号，系统赠送100知券', '84', '49');
INSERT INTO `consumptionrecord` VALUES ('85', '2012-03-03 08:37:04', '\0', '0', '\0', 'hailinchl@yeah.net预定曾锃老师1:2 Testing Mar 2, again课程,花费0.0知券', '85', '19');
INSERT INTO `consumptionrecord` VALUES ('86', '2012-03-03 08:37:04', '\0', '0', '\0', 'hailinchl@yeah.net预定曾锃老师1:2 Testing Mar 2, again课程,花费0.0知券', '86', '48');
INSERT INTO `consumptionrecord` VALUES ('87', '2012-03-03 09:09:12', '\0', '0', '\0', 'zengzeng预定曾锃老师1:3 testing 1st课程,花费0.0知券', '87', '19');
INSERT INTO `consumptionrecord` VALUES ('88', '2012-03-03 09:09:12', '\0', '0', '\0', 'zengzeng预定曾锃老师1:3 testing 1st课程,花费0.0知券', '88', '2');
INSERT INTO `consumptionrecord` VALUES ('89', '2012-03-03 09:49:50', '\0', '100', '', '申请账号，系统赠送100知券', '89', '50');
INSERT INTO `consumptionrecord` VALUES ('90', '2012-03-03 13:22:13', '\0', '0', '\0', 'zengzeng预定陈海林老师one 2 three test课程,花费0.0知券', '90', '3');
INSERT INTO `consumptionrecord` VALUES ('91', '2012-03-03 13:22:13', '\0', '0', '\0', 'zengzeng预定陈海林老师one 2 three test课程,花费0.0知券', '91', '2');
INSERT INTO `consumptionrecord` VALUES ('92', '2012-03-03 13:24:46', '\0', '0', '\0', '曾锃预定陈海林老师one 2 three test课程,花费0.0知券', '90', '3');
INSERT INTO `consumptionrecord` VALUES ('93', '2012-03-03 13:24:46', '\0', '0', '\0', '曾锃预定陈海林老师one 2 three test课程,花费0.0知券', '92', '19');
INSERT INTO `consumptionrecord` VALUES ('94', '2012-03-03 13:25:42', '\0', '0', '\0', 'elezengz@nus.edu.sg预定陈海林老师one 2 three test课程,花费0.0知券', '90', '3');
INSERT INTO `consumptionrecord` VALUES ('95', '2012-03-03 13:25:42', '\0', '0', '\0', 'elezengz@nus.edu.sg预定陈海林老师one 2 three test课程,花费0.0知券', '93', '17');
INSERT INTO `consumptionrecord` VALUES ('96', '2012-03-04 05:34:58', '\0', '100', '', '申请账号，系统赠送100知券', '94', '52');
INSERT INTO `consumptionrecord` VALUES ('97', '2012-03-05 14:48:48', '\0', '100', '', '申请账号，系统赠送100知券', '95', '53');
INSERT INTO `consumptionrecord` VALUES ('98', '2012-03-06 14:51:35', '\0', '0', '\0', 'zengzeng预定曾锃老师1:2 Testing 1课程,花费0.0知券', '96', '19');
INSERT INTO `consumptionrecord` VALUES ('99', '2012-03-06 14:51:35', '\0', '0', '\0', 'zengzeng预定曾锃老师1:2 Testing 1课程,花费0.0知券', '97', '2');
INSERT INTO `consumptionrecord` VALUES ('100', '2012-03-09 03:07:50', '\0', '0', '\0', '陈海林预定zengzeng老师1:2 Testing 3课程,花费0.0知券', '98', '2');
INSERT INTO `consumptionrecord` VALUES ('101', '2012-03-09 03:07:50', '\0', '0', '\0', '陈海林预定zengzeng老师1:2 Testing 3课程,花费0.0知券', '99', '3');
INSERT INTO `consumptionrecord` VALUES ('102', '2012-03-11 09:05:28', '\0', '100', '', '申请账号，系统赠送100知券', '100', '54');
INSERT INTO `consumptionrecord` VALUES ('103', '2012-03-11 09:08:03', '\0', '100', '', '申请账号，系统赠送100知券', '101', '55');
INSERT INTO `consumptionrecord` VALUES ('104', '2012-03-11 09:12:51', '\0', '100', '', '申请账号，系统赠送100知券', '102', '56');
INSERT INTO `consumptionrecord` VALUES ('105', '2012-03-11 09:15:52', '\0', '100', '', '申请账号，系统赠送100知券', '103', '57');
INSERT INTO `consumptionrecord` VALUES ('106', '2012-03-11 09:22:00', '\0', '100', '', '申请账号，系统赠送100知券', '104', '58');
INSERT INTO `consumptionrecord` VALUES ('107', '2012-03-11 09:24:03', '\0', '100', '', '申请账号，系统赠送100知券', '105', '59');
INSERT INTO `consumptionrecord` VALUES ('108', '2012-03-11 12:27:52', '\0', '100', '', '申请账号，系统赠送100知券', '106', '60');
INSERT INTO `consumptionrecord` VALUES ('109', '2012-03-12 05:13:02', '\0', '100', '', '申请账号，系统赠送100知券', '107', '61');
INSERT INTO `consumptionrecord` VALUES ('110', '2012-03-12 10:38:19', '\0', '100', '', '申请账号，系统赠送100知券', '108', '62');
INSERT INTO `consumptionrecord` VALUES ('111', '2012-03-12 12:25:46', '\0', '100', '', '申请账号，系统赠送100知券', '109', '63');
INSERT INTO `consumptionrecord` VALUES ('112', '2012-03-12 12:58:01', '\0', '100', '', '申请账号，系统赠送100知券', '110', '64');
INSERT INTO `consumptionrecord` VALUES ('113', '2012-03-12 14:36:23', '\0', '100', '', '申请账号，系统赠送100知券', '111', '65');
INSERT INTO `consumptionrecord` VALUES ('114', '2012-03-13 08:30:20', '\0', '100', '', '申请账号，系统赠送100知券', '112', '68');
INSERT INTO `consumptionrecord` VALUES ('115', '2012-03-13 09:19:28', '\0', '100', '', '申请账号，系统赠送100知券', '113', '69');
INSERT INTO `consumptionrecord` VALUES ('116', '2012-03-13 15:03:55', '\0', '100', '', '申请账号，系统赠送100知券', '114', '70');
INSERT INTO `consumptionrecord` VALUES ('117', '2012-03-19 08:05:50', '\0', '100', '', '申请账号，系统赠送100知券', '115', '73');
INSERT INTO `consumptionrecord` VALUES ('118', '2012-03-20 08:02:16', '', '0', '\0', '成安预定陈海林老师test fms 1to2课程,花费0.0知币', '116', '3');
INSERT INTO `consumptionrecord` VALUES ('119', '2012-03-20 08:02:16', '', '0', '\0', '成安预定陈海林老师test fms 1to2课程,花费0.0知币', '117', '16');
INSERT INTO `consumptionrecord` VALUES ('120', '2012-03-20 12:14:49', '\0', '100', '', '申请账号，系统赠送100知券', '118', '75');
INSERT INTO `consumptionrecord` VALUES ('121', '2012-03-20 13:15:09', '', '0', '\0', 'elezengz@nus.edu.sg预定曾锃老师美声乐理课程,花费0.0知币', '119', '19');
INSERT INTO `consumptionrecord` VALUES ('122', '2012-03-20 13:15:09', '', '0', '\0', 'elezengz@nus.edu.sg预定曾锃老师美声乐理课程,花费0.0知币', '120', '17');
INSERT INTO `consumptionrecord` VALUES ('123', '2012-03-21 05:29:35', '\0', '100', '', '申请账号，系统赠送100知券', '121', '77');
INSERT INTO `consumptionrecord` VALUES ('124', '2012-03-21 05:32:39', '\0', '100', '', '申请账号，系统赠送100知券', '122', '78');
INSERT INTO `consumptionrecord` VALUES ('125', '2012-03-21 12:35:24', '\0', '100', '', '申请账号，系统赠送100知券', '123', '79');
INSERT INTO `consumptionrecord` VALUES ('126', '2012-03-21 12:41:02', '\0', '100', '', '申请账号，系统赠送100知券', '124', '80');
INSERT INTO `consumptionrecord` VALUES ('127', '2012-03-21 12:41:03', '\0', '100', '', '申请账号，系统赠送100知券', '125', '81');
INSERT INTO `consumptionrecord` VALUES ('128', '2012-03-21 12:41:04', '\0', '100', '', '申请账号，系统赠送100知券', '126', '82');
INSERT INTO `consumptionrecord` VALUES ('129', '2012-03-21 12:41:06', '\0', '100', '', '申请账号，系统赠送100知券', '127', '83');
INSERT INTO `consumptionrecord` VALUES ('130', '2012-03-21 12:41:07', '\0', '100', '', '申请账号，系统赠送100知券', '128', '84');
INSERT INTO `consumptionrecord` VALUES ('131', '2012-03-21 12:41:08', '\0', '100', '', '申请账号，系统赠送100知券', '129', '85');
INSERT INTO `consumptionrecord` VALUES ('132', '2012-03-21 12:41:09', '\0', '100', '', '申请账号，系统赠送100知券', '130', '86');
INSERT INTO `consumptionrecord` VALUES ('133', '2012-03-21 12:41:10', '\0', '100', '', '申请账号，系统赠送100知券', '131', '87');
INSERT INTO `consumptionrecord` VALUES ('134', '2012-03-21 12:41:12', '\0', '100', '', '申请账号，系统赠送100知券', '132', '88');
INSERT INTO `consumptionrecord` VALUES ('135', '2012-03-21 12:41:13', '\0', '100', '', '申请账号，系统赠送100知券', '133', '89');
INSERT INTO `consumptionrecord` VALUES ('136', '2012-03-21 12:41:18', '\0', '100', '', '申请账号，系统赠送100知券', '134', '90');
INSERT INTO `consumptionrecord` VALUES ('137', '2012-03-21 12:41:19', '\0', '100', '', '申请账号，系统赠送100知券', '135', '91');
INSERT INTO `consumptionrecord` VALUES ('138', '2012-03-21 12:41:20', '\0', '100', '', '申请账号，系统赠送100知券', '136', '92');
INSERT INTO `consumptionrecord` VALUES ('139', '2012-03-23 07:11:47', '\0', '100', '', '申请账号，系统赠送100知券', '137', '139');
INSERT INTO `consumptionrecord` VALUES ('140', '2012-03-23 07:42:41', '\0', '100', '', '申请账号，系统赠送100知券', '138', '140');
INSERT INTO `consumptionrecord` VALUES ('141', '2012-03-23 10:50:44', '\0', '100', '', '申请账号，系统赠送100知券', '139', '141');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL auto_increment,
  `available` double default NULL,
  `buyAgesNum` int(11) default NULL,
  `cameraManComments` varchar(255) default NULL,
  `cameraManConfirmed` bit(1) default NULL,
  `charges` double default NULL,
  `confirmCode` varchar(255) default NULL,
  `consumptionQuantity` double default NULL,
  `consumptionType` bit(1) default NULL,
  `costPerformance` double default NULL,
  `description` varchar(255) default NULL,
  `evaluatorNums` int(11) default NULL,
  `finishDate` datetime default NULL,
  `interaction` double default NULL,
  `interest` double default NULL,
  `limitNum` int(11) default NULL,
  `limitNumUp` int(11) default NULL,
  `logoUrl` varchar(255) default NULL,
  `masterComments` varchar(255) default NULL,
  `masterConfirmed` bit(1) default NULL,
  `name` varchar(255) default NULL,
  `observationNum` int(11) default NULL,
  `opened` bit(1) default NULL,
  `over` bit(1) default NULL,
  `startDate` datetime default NULL,
  `synthetical` double default NULL,
  `teacherComments` varchar(255) default NULL,
  `teacherConfirmed` bit(1) default NULL,
  `teachingNum` int(11) default NULL,
  `totalHours` int(11) default NULL,
  `cameraMan_id` int(11) default NULL,
  `organization_id` int(11) default NULL,
  `personalTeacher_id` int(11) default NULL,
  `teacher_id` int(11) default NULL,
  `publicationTime` datetime default NULL,
  `languageType` varchar(255) default NULL,
  `inviteStudentNum` int(11) default NULL,
  `type` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK78A7CC3B9D0A3EB7` (`organization_id`),
  KEY `FK78A7CC3B1AE1741E` (`cameraMan_id`),
  KEY `FK78A7CC3BE0134D31` (`teacher_id`),
  KEY `FK78A7CC3BA9B2A371` (`personalTeacher_id`),
  CONSTRAINT `FK78A7CC3B1AE1741E` FOREIGN KEY (`cameraMan_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK78A7CC3B9D0A3EB7` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK78A7CC3BA9B2A371` FOREIGN KEY (`personalTeacher_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK78A7CC3BE0134D31` FOREIGN KEY (`teacher_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('56', '4', '0', null, '', '500', null, '0', '', '3.5', '好好学习吧孩子', '1', null, '3', '3.5', null, null, 'upload/images/course/56/javabcsx.jpg', null, '', '高高等英语', '0', '', '', '2012-01-19 16:00:00', '3.5', null, '', null, '19', '3', null, '3', '3', null, null, null, null);
INSERT INTO `course` VALUES ('57', '2', '0', null, '', '100', null, '0', '', '2', '国外专业老师，专业化标准', '1', null, '2', '2', null, null, 'upload/images/course/57/3D_001008.jpg', null, '', '英语口语培训', '1', '', '', '2012-01-13 16:00:00', '2', null, '', '1', '32', '4', null, '4', '4', null, null, null, null);
INSERT INTO `course` VALUES ('58', '3', '0', null, '', '11', null, '0', '', '3', '天天向上', '0', null, '3', '3', null, null, 'upload/images/course/58/icon_join_us.jpg', null, '', '好好学习', '1', '', '', '2012-01-13 16:00:00', '3', null, '', '1', '12', '2', null, '2', '2', null, null, null, null);
INSERT INTO `course` VALUES ('59', '3', '0', null, '', '100', null, '0', '\0', '3', '测试测试', '0', null, '3', '3', null, null, 'upload/images/course/59/3D_001006.jpg', null, '', '三缺一，长沙麻将训练营', '1', '', '', '2012-01-13 16:00:00', '3', null, '', '3', '4', '4', null, '4', '4', null, null, null, null);
INSERT INTO `course` VALUES ('60', '3', '0', null, '', '1', null, '0', '', '3', 'ttt', '0', null, '3', '3', null, null, 'upload/images/course/60/JoinUs_Icon.jpg', null, '', 'Special for you', '1', '', '', '2012-01-13 16:00:00', '3', null, '', '1', '1', '17', null, '17', '17', null, null, null, null);
INSERT INTO `course` VALUES ('61', '3', '0', null, null, '22', null, '0', '', '3', '123', '0', null, '3', '3', null, null, 'upload/images/course/61/disp.jpg', null, null, 'TTTT', '0', '', '', '2012-01-20 16:00:00', '3', null, null, '1', '11', '3', null, '3', '3', null, null, null, null);
INSERT INTO `course` VALUES ('62', '3', '0', null, '', '2000', null, '0', '\0', '3', '纯正的美式口语，30天让你英语脱口而出', '0', null, '3', '3', null, null, 'upload/images/course/62/123.jpg', null, '', '口语大讲堂', '0', '', '', '2012-01-14 16:00:00', '3', null, '', '4', '32', '4', '2', '4', '4', null, null, null, null);
INSERT INTO `course` VALUES ('63', '3', '0', null, '', '1', null, '0', '', '3', 'TTT', '0', null, '3', '3', null, null, 'upload/images/course/63/meizi.jpg', null, '', 'TEST', '1', '', '', '2012-01-14 16:00:00', '3', null, '', '1', '1', '3', null, '3', '3', null, null, null, null);
INSERT INTO `course` VALUES ('64', '3', '0', null, null, '1', null, '0', '\0', '3', 'Testing', '0', null, '3', '3', null, null, 'upload/images/course/64/JoinUs_Icon.jpg', null, null, '开会了', '0', '', '', '2012-01-14 16:00:00', '3', null, null, '1', '1', '2', null, '2', '2', null, null, null, null);
INSERT INTO `course` VALUES ('65', '3', '0', null, '', '1', null, '0', '\0', '3', 'Testing', '0', null, '3', '3', null, null, 'upload/images/course/65/JoinUs_Icon.jpg', null, '', '开会了', '0', '', '', '2012-01-14 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', null, null, null, null);
INSERT INTO `course` VALUES ('66', '3', '0', null, null, '100', null, '0', '\0', '3', '以英语散文的形式介绍最美的英语短剧', '0', null, '3', '3', null, null, 'upload/images/course/66/u=2774846200,3582483626&fm=0&gp=0.jpg', null, null, '我的英语课堂', '0', '', '', '2012-01-14 16:00:00', '3', null, null, '4', '20', '4', null, '4', '4', null, null, null, null);
INSERT INTO `course` VALUES ('67', '3', '0', null, '', '200', null, '0', '', '3', '以英语散文的形式介绍最美的英语短剧', '0', null, '3', '3', null, null, 'upload/images/course/67/u=2774846200,3582483626&fm=0&gp=0.jpg', null, '', '我的英文短剧', '0', '', '', '2012-01-14 16:00:00', '3', null, '', '4', '20', '4', null, '4', '4', null, null, null, null);
INSERT INTO `course` VALUES ('68', '3', '0', null, '', '3000', null, '0', '\0', '3', '你知道在正式场合需要注意的握手礼仪吗？你知道如何邀请别人参加你的聚会吗？在这里，我将手把手告诉你', '0', null, '3', '3', null, null, 'upload/images/course/68/现代礼仪.jpg', null, '', '现代礼仪', '0', '', '', '2012-01-15 16:00:00', '3', null, '', null, '32', '4', null, '4', '4', null, null, null, null);
INSERT INTO `course` VALUES ('69', '3', '0', null, '', '200', null, '0', '', '3', 'BEC高级', '0', null, '3', '3', null, null, 'upload/images/course/69/u=2362890155,309677720&fm=0&gp=38[1].jpg', null, '', '商务英语', '0', '', '', '2012-01-16 16:00:00', '3', null, '', '1', '10', '15', null, '15', '15', '2012-03-05 13:58:20', null, null, null);
INSERT INTO `course` VALUES ('70', '3', '0', null, null, '1000', null, '0', '', '3', '概率论与数理统计为大学理工科类课程', '0', null, '3', '3', null, null, 'upload/images/course/70/Winter.jpg', null, null, '概率论与数理统计', '0', '', '', '2012-01-18 16:00:00', '3', null, null, null, '10', '15', null, '15', '15', null, null, null, null);
INSERT INTO `course` VALUES ('71', '3', '0', null, null, '1000', null, '0', '', '3', '概率论与数理统计', '0', null, '3', '3', null, null, 'upload/images/course/71/Winter.jpg', null, null, '概率论与数理统计', '0', '', '', '2012-01-18 16:00:00', '3', null, null, '2', '10', '15', null, '15', '15', null, null, null, null);
INSERT INTO `course` VALUES ('72', '3', '0', null, null, '10000', null, '0', '', '3', '概率论与数理统计是一门大学理工科类课程', '0', null, '3', '3', null, null, 'upload/images/course/72/Blue hills.jpg', null, null, '概率论与数理统计', '0', '', '', '2012-01-18 16:00:00', '3', null, null, '1', '2', '15', null, '15', '15', null, null, null, null);
INSERT INTO `course` VALUES ('73', '3', '0', null, '', '100', null, '0', '', '3', '概率论与数理统计是大学理工科课程', '0', null, '3', '3', null, null, 'upload/images/course/73/Blue hills.jpg', null, '', '概率论与数理统计', '0', '', '', '2012-01-18 16:00:00', '3', null, '', '1', '2', '15', null, '15', '15', null, null, null, null);
INSERT INTO `course` VALUES ('74', '3', '0', null, '', '1200', null, '0', '', '3', '线性代数为理工科必修科目', '0', null, '3', '3', null, null, 'upload/images/course/74/Sunset.jpg', null, '', '线性代数', '0', '', '', '2012-01-19 16:00:00', '3', null, '', '1', '10', '15', null, '15', '15', null, null, null, null);
INSERT INTO `course` VALUES ('75', '3', '0', null, '', '100', null, '0', '', '3', '生动的话语，历史的故事', '0', null, '3', '3', null, null, 'upload/images/course/75/ming_chao_4_9789867480897.jpg', null, '', '明朝那些事精讲', '0', '', '', '2012-01-20 16:00:00', '3', null, '', '1', '16', '4', null, '4', '4', null, null, null, null);
INSERT INTO `course` VALUES ('76', '3', '0', null, '', '100', null, '0', '\0', '3', '共同学习，共同进步', '0', null, '3', '3', null, null, 'upload/images/course/76/u=2362890155,309677720&fm=0&gp=38[1].jpg', null, '', '大学英语', '0', '', '', '2012-01-20 16:00:00', '3', null, '', '1', '100', '15', null, '15', '15', null, null, null, null);
INSERT INTO `course` VALUES ('77', '3', '0', null, null, '1', null, '0', '\0', '3', '探讨就业压力', '0', null, '3', '3', null, null, 'upload/images/course/77/guest2.jpg', null, null, '刘莉莉事件的心得', '0', '', '', '2013-08-31 16:00:00', '3', null, null, '1', '1', '2', null, '2', '2', null, null, null, null);
INSERT INTO `course` VALUES ('78', '3', '0', null, null, '1', null, '0', '\0', '3', '讨论', '0', null, '3', '3', null, null, 'upload/images/course/78/guest2.jpg', null, null, '刘莉莉事件的心得', '0', '', '', '2013-08-31 16:00:00', '3', null, null, '1', '1', '2', null, '2', '2', '2012-02-04 05:30:16', null, null, null);
INSERT INTO `course` VALUES ('79', '3', '0', null, '', '10', null, '0', '', '3', '视频开会', '0', null, '3', '3', null, null, 'upload/images/course/79/2718203850095471185.jpg', null, '', '第一次会议', '1', '', '', '2012-01-29 16:00:00', '3', null, '', '1', '10', '4', null, '4', '4', '2012-02-02 05:30:01', null, null, null);
INSERT INTO `course` VALUES ('80', '3', '0', null, '', '10', null, '0', '', '3', '测试', '0', null, '3', '3', null, null, 'upload/images/course/80/20086410299326_2.jpg', null, '', '第一次会议', '0', '', '', '2012-02-01 16:00:00', '3', null, '', '1', '10', '4', null, '4', '4', '2012-02-01 05:29:51', null, null, null);
INSERT INTO `course` VALUES ('81', '3', '0', null, '', '800', null, '0', '', '3', '这是一门计算机专业基础课程，主要介绍存储在计算机中的信息的结构组成。', '0', null, '3', '3', null, null, 'upload/images/course/81/bull.jpg', null, '', '数据结构', '1', '', '', '2012-02-14 16:00:00', '3', null, '', '4', '32', '20', null, '20', '20', '2012-02-05 05:30:00', null, null, null);
INSERT INTO `course` VALUES ('82', '3', '0', null, '', '480', null, '0', '\0', '3', '大自然的奥妙，等待我们去发现', '0', null, '3', '3', null, null, 'upload/images/course/82/kebiwanisha.jpg', null, '', '人与自然', '0', '', '', '2012-02-11 16:00:00', '3', null, '', '2', '4', '3', null, '3', '3', '2012-02-06 03:37:03', null, null, null);
INSERT INTO `course` VALUES ('83', '3', '0', null, '', '500', null, '0', '\0', '3', '撒旦法撒的发生大幅', '0', null, '3', '3', null, null, 'upload/images/course/83/0.jpg', null, '', '人与自然', '0', '', '', '2012-02-16 16:00:00', '3', null, '', '1', '4', '3', null, '3', '3', '2012-02-08 05:32:35', null, null, null);
INSERT INTO `course` VALUES ('84', '3', '0', null, null, '300', null, '0', '', '3', '计算机基础知识普及', '0', null, '3', '3', null, null, 'upload/images/course/84/jobs.jpg', null, null, '计算机基础', '0', '', '', '2012-02-19 16:00:00', '3', null, null, null, '16', '20', null, '20', '20', null, null, null, null);
INSERT INTO `course` VALUES ('85', '3', '0', null, null, '300', null, '0', '', '3', '计算机基础普及', '0', null, '3', '3', null, null, 'upload/images/course/85/jobs.jpg', null, null, '计算机基础', '0', '', '', '2012-02-19 16:00:00', '3', null, null, null, '16', '20', null, '20', '20', null, null, null, null);
INSERT INTO `course` VALUES ('86', '3', '0', null, null, '300', null, '0', '', '3', '计算机基础普及', '0', null, '3', '3', null, null, 'upload/images/course/86/jobs.jpg', null, null, '计算机基础', '0', '', '', '2012-02-19 16:00:00', '3', null, null, '1', '16', '20', null, '20', '20', null, null, null, null);
INSERT INTO `course` VALUES ('87', '3', '0', null, '', '12', null, '0', '', '3', '3432', '0', null, '3', '3', null, null, 'upload/images/course/87/700x568_937252508.jpg', null, '', 'wwh', '1', '', '', '2012-02-10 16:00:00', '3', null, '', '1', '1', '3', null, '3', '3', '2012-02-09 08:18:09', null, null, null);
INSERT INTO `course` VALUES ('88', '3', '0', null, '', '1', null, '0', '', '3', '问', '0', null, '3', '3', null, null, 'upload/images/course/88/700x568_937252508.jpg', null, '', '毛泽东思想', '1', '', '', '2012-02-09 16:00:00', '3', null, '', '1', '12', '3', null, '3', '3', '2012-02-09 09:12:27', null, null, null);
INSERT INTO `course` VALUES ('89', '3', '0', null, '', '1', null, '0', '', '3', 'First testing', '0', null, '3', '3', null, null, 'upload/images/course/89/Tulips.jpg', null, '', 'First', '1', '', '', '2012-10-01 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-09 12:00:20', null, null, null);
INSERT INTO `course` VALUES ('90', '3', '0', null, '', '480', null, '0', '', '3', '你是sb', '0', null, '3', '3', null, null, 'upload/images/course/90/hailin.jpg', null, '', 'java程序设计', '0', '', '', '2012-02-12 16:00:00', '3', null, '', '1', '48', '21', null, '21', '21', '2012-02-09 12:17:02', null, null, null);
INSERT INTO `course` VALUES ('91', '3', '0', null, '', '1', null, '0', '', '3', 'Testing', '0', null, '3', '3', null, null, 'upload/images/course/91/Desert.jpg', null, '', 'Second', '0', '', '', '2012-02-09 16:00:00', '3', null, '', '1', '1', '23', null, '23', '23', '2012-02-09 12:30:56', null, null, null);
INSERT INTO `course` VALUES ('92', '3', '0', null, '', '1', null, '0', '', '3', 'sf', '0', null, '3', '3', null, null, 'upload/images/course/92/Penguins.jpg', null, '', 'Second', '1', '', '', '2012-10-01 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-09 15:08:32', null, null, null);
INSERT INTO `course` VALUES ('93', '3', '0', null, '', '1', null, '0', '', '3', '位', '0', null, '3', '3', null, null, 'upload/images/course/93/lena.jpg', null, '', 'Third', '1', '', '', '2012-02-10 16:00:00', '3', null, '', '1', '23', '3', null, '3', '3', '2012-02-09 15:13:28', null, null, null);
INSERT INTO `course` VALUES ('94', '3', '0', null, '', '0', null, '0', '', '3', '你好吗，小海哥', '0', null, '3', '3', null, null, 'upload/images/course/94/hailin.jpg', null, '', '是大方的说法', '0', '', '', '2012-02-12 16:00:00', '3', null, '', '1', null, '25', null, '25', '25', '2012-02-10 09:10:31', '汉语', null, null);
INSERT INTO `course` VALUES ('95', '3', '0', null, null, '0', null, '0', '\0', '3', '撒的发生地方', '0', null, '3', '3', null, null, 'upload/images/course/95/hailin.jpg', null, null, '恼人', '0', '', '', '2012-02-15 16:00:00', '3', null, null, null, null, '25', null, '25', '25', null, '英语', null, null);
INSERT INTO `course` VALUES ('96', '3', '0', null, '', '0', null, '0', '', '3', 'Hello, the world', '0', null, '3', '3', null, null, 'upload/images/course/96/Tulips.jpg', null, '', 'Third', '0', '', '', '2012-11-01 16:00:00', '3', null, '', '1', null, '26', null, '26', '26', '2012-02-10 09:30:35', '英语', null, null);
INSERT INTO `course` VALUES ('97', '3', '0', null, '', '480', null, '0', '', '3', '你想了解顶尖的IT集团管理经验吗，那来这里吧，这是成功者的窗户。', '0', null, '3', '3', null, null, 'upload/images/course/97/mariopartybizhi01.jpg', null, '', 'CHL集团培训', '1', '', '', '2012-02-13 16:00:00', '3', null, '', '1', '2', '3', null, '3', '3', '2012-02-12 08:08:03', '英语', null, null);
INSERT INTO `course` VALUES ('98', '3', '0', null, '', '0', null, '0', '', '3', 'have a test', '0', null, '3', '3', null, null, 'upload/images/course/98/Koala.jpg', null, '', 'Fourth', '1', '', '', '2013-03-01 16:00:00', '3', null, '', '1', '30', '2', null, '2', '2', '2012-02-14 02:39:17', '汉语', null, null);
INSERT INTO `course` VALUES ('99', '3', '0', null, '', '0', null, '0', '\0', '3', '好好测试吧，多出来几个错误', '0', null, '3', '3', null, null, 'upload/images/course/99/mariopartybizhi01.jpg', null, '', '1对1旁听测试', '1', '', '', '2012-02-15 16:00:00', '3', null, '', '1', '2', '2', null, '2', '2', '2012-02-14 06:29:41', '英语', null, null);
INSERT INTO `course` VALUES ('100', '3', '0', null, null, '300', null, '0', '', '3', 'CSS样式设计一网打尽', '0', null, '3', '3', null, null, 'upload/images/course/100/logo.jpg', null, null, 'CSS页面设计', '0', '', '', '2012-02-21 16:00:00', '3', null, null, '1', '0', '29', null, '29', '29', null, '英语', null, null);
INSERT INTO `course` VALUES ('101', '2', '0', null, '', '300', null, '0', '', '2', 'CSS样式设计一网打尽', '1', null, '2', '2', null, null, 'upload/images/course/101/logo.jpg', null, '', 'CSS页面设计', '0', '', '', '2012-02-21 16:00:00', '2', null, '', '1', '0', '29', null, '29', '29', '2012-02-14 17:21:09', '英语', null, null);
INSERT INTO `course` VALUES ('102', '3', '0', null, '', '100', null, '0', '', '3', '测试上课', '0', null, '3', '3', null, null, 'upload/images/course/102/u=2328817649,3993578222&fm=51&gp=0.jpg', null, '', '编译原理2.25', '1', '', '', '2012-02-15 16:00:00', '3', null, '', '1', '1', '4', null, '4', '4', '2012-02-15 08:59:49', '汉语', null, null);
INSERT INTO `course` VALUES ('103', '3', '0', null, '', '100', null, '0', '', '3', '测试课程', '0', null, '3', '3', null, null, 'upload/images/course/103/340425big.jpg', null, '', '操作系统2.15', '1', '', '', '2012-02-15 16:00:00', '3', null, '', '1', '1', '4', null, '4', '4', '2012-02-15 09:31:58', '汉语', null, null);
INSERT INTO `course` VALUES ('104', '3', '0', null, null, '0', null, '0', '', '3', 'Haha, ths system is more and more beautiful day by day!', '0', null, '3', '3', null, null, 'upload/images/course/104/Jellyfish.jpg', null, null, 'Fifth', '0', '', '', '2013-04-01 16:00:00', '3', null, null, null, '1', '3', null, '3', '3', null, '汉语', null, null);
INSERT INTO `course` VALUES ('105', '3', '0', null, null, '0', null, '0', '', '3', 'testing', '0', null, '3', '3', null, null, 'upload/images/course/105/Lighthouse.jpg', null, null, '武汉测试', '0', '', '', '2013-04-01 16:00:00', '3', null, null, '1', '0', '3', null, '3', '3', null, '汉语', null, null);
INSERT INTO `course` VALUES ('106', '3', '0', null, '', '0', null, '0', '', '3', '武汉旁听测试', '0', null, '3', '3', null, null, 'upload/images/course/106/Lighthouse.jpg', null, '', '武汉测试', '1', '', '', '2013-04-01 16:00:00', '3', null, '', '1', '4', '2', null, '2', '2', '2012-02-16 02:26:31', '汉语', null, null);
INSERT INTO `course` VALUES ('107', '3', '0', null, '', '12', null, '0', '', '3', 'dsadsa', '0', null, '3', '3', null, null, 'upload/images/course/107/700x568_937252508.jpg', null, '', '毛泽东思想', '0', '', '', '2012-02-16 16:00:00', '3', null, '', '1', '2', '3', null, '3', '3', '2012-02-16 02:34:47', '汉语', null, null);
INSERT INTO `course` VALUES ('108', '3', '0', null, '', '23', null, '0', '', '3', '二位', '0', null, '3', '3', null, null, 'upload/images/course/108/700x568_937252508.jpg', null, '', '毛泽东思想', '0', '', '', '2012-02-16 16:00:00', '3', null, '', '1', '1', '3', null, '3', '3', '2012-02-16 02:40:13', '汉语', null, null);
INSERT INTO `course` VALUES ('109', '3', '0', null, '', '0', null, '0', '', '3', 'Testing', '0', null, '3', '3', null, null, 'upload/images/course/109/Desert.jpg', null, '', 'Testing Wuhan', '1', '', '', '2013-04-01 16:00:00', '3', null, '', '1', '2', '19', null, '19', '19', '2012-02-16 02:40:48', '汉语', null, null);
INSERT INTO `course` VALUES ('110', '3', '0', null, null, '23', null, '0', '', '3', 'hjhj', '0', null, '3', '3', null, null, 'upload/images/course/110/700x568_937252508.jpg', null, null, 'qqq', '0', '', '', '2012-04-01 16:00:00', '3', null, null, '1', '1', '3', null, '3', '3', null, '汉语', null, null);
INSERT INTO `course` VALUES ('111', '3', '0', null, '', '23', null, '0', '', '3', 'hjhj', '0', null, '3', '3', null, null, 'upload/images/course/111/700x568_937252508.jpg', null, '', 'qqq', '0', '', '', '2012-04-01 16:00:00', '3', null, '', '1', '0', '3', null, '3', '3', '2012-02-16 02:53:38', '汉语', null, null);
INSERT INTO `course` VALUES ('112', '3', '0', null, '', '480', null, '0', '\0', '3', '嗯，不错哦', '0', null, '3', '3', null, null, 'upload/images/course/112/幻灯片3.JPG', null, '', '武汉旁听测试', '1', '', '', '2012-02-17 16:00:00', '3', null, '', '1', '2', '3', null, '3', '3', '2012-02-16 03:01:34', '英语', null, null);
INSERT INTO `course` VALUES ('113', '3', '0', null, '', '480', null, '0', '\0', '3', '时间是对的吗？', '0', null, '3', '3', null, null, 'upload/images/course/113/测试.jpg', null, '', '时间测试', '0', '', '', '2012-02-15 16:00:00', '3', null, '', '1', '2', '3', null, '3', '3', '2012-02-16 05:21:46', '日语', null, null);
INSERT INTO `course` VALUES ('114', '3', '0', null, '', '480', null, '0', '', '3', '不理想啊', '0', null, '3', '3', null, null, 'upload/images/course/114/测试.jpg', null, '', '继续时间测试', '0', '', '', '2012-02-15 16:00:00', '3', null, '', '1', '2', '3', null, '3', '3', '2012-02-16 05:44:14', '汉语', null, null);
INSERT INTO `course` VALUES ('115', '3', '0', null, '', '123', null, '0', '\0', '3', '就不信了', '0', null, '3', '3', null, null, 'upload/images/course/115/123.jpg', null, '', '还是时间测试', '0', '', '', '2012-02-15 16:00:00', '3', null, '', '1', '1', '3', null, '3', '3', '2012-02-16 06:46:19', '汉语', null, null);
INSERT INTO `course` VALUES ('116', '3', '0', null, '', '19', null, '0', '', '3', '没有', '0', null, '3', '3', null, null, 'upload/images/course/116/evaluation report.pdf', null, '', '英语口语第一步', '1', '', '', '2012-02-15 16:00:00', '3', null, '', '1', '1', '33', null, '33', '33', '2012-02-16 08:35:35', '汉语', null, null);
INSERT INTO `course` VALUES ('117', '3', '0', null, '', '0', null, '0', '', '3', 'Hello', '0', null, '3', '3', null, null, 'upload/images/course/117/Jellyfish.jpg', null, '', 'Hello', '1', '', '', '2013-04-01 16:00:00', '3', null, '', '1', '1', '35', null, '35', '35', '2012-02-16 09:10:28', '汉语', null, null);
INSERT INTO `course` VALUES ('118', '3', '0', null, null, '0', null, '0', '', '3', 'aa', '0', null, '3', '3', null, null, 'upload/images/course/118/Koala.jpg', null, null, 'tt', '0', '', '', '2013-04-01 16:00:00', '3', null, null, '1', '1', '38', null, '38', '38', null, '汉语', null, null);
INSERT INTO `course` VALUES ('119', '3', '0', null, null, '0', null, '0', '', '3', 'Hello', '0', null, '3', '3', null, null, 'upload/images/course/119/Hydrangeas.jpg', null, null, 'The sixth', '0', '', '', '2013-04-01 16:00:00', '3', null, null, '1', '1', '2', null, '2', '2', null, '汉语', null, null);
INSERT INTO `course` VALUES ('120', '3', '0', null, null, '0', null, '0', '', '3', '上的发的发', '0', null, '3', '3', null, null, 'upload/images/course/120/测试.jpg', null, null, '1对1旁听测试2', '0', '', '', '2012-02-15 16:00:00', '3', null, null, '1', '2', '3', null, '3', '3', null, '汉语', null, null);
INSERT INTO `course` VALUES ('121', '3', '0', null, null, '0', null, '0', '', '3', 'hello,world', '0', null, '3', '3', null, null, 'upload/images/course/121/mariopartybizhi01.jpg', null, null, '1对1旁听测试3', '0', '', '', '2013-04-01 16:00:00', '3', null, null, '1', '2', '3', null, '3', '3', null, '日语', null, null);
INSERT INTO `course` VALUES ('122', '3', '0', null, null, '0', null, '0', '', '3', '1243', '0', null, '3', '3', null, null, 'upload/images/course/122/测试.jpg', null, null, '1对1旁听测试3', '0', '', '', '2013-05-01 16:00:00', '3', null, null, '1', '0', '3', null, '3', '3', null, '英语', null, null);
INSERT INTO `course` VALUES ('123', '3', '0', null, '', '0', null, '0', '', '3', 'seven', '0', null, '3', '3', null, null, 'upload/images/course/123/Hydrangeas.jpg', null, '', 'The Seven', '1', '', '', '2013-04-01 16:00:00', '3', null, '', '1', '45', '3', null, '3', '3', '2012-02-16 12:23:37', '汉语', null, null);
INSERT INTO `course` VALUES ('124', '3', '0', null, null, '222', null, '0', '', '3', 'fdsfasaf', '0', null, '3', '3', null, null, 'upload/images/course/124/W020101023522139309591.jpg', null, null, 'fdsaf', '0', '', '', '2012-03-07 16:00:00', '3', null, null, '1', '0', '3', null, '3', '3', null, '汉语', null, null);
INSERT INTO `course` VALUES ('125', '3', '0', null, '', '100', null, '0', '', '3', '测试课程', '0', null, '3', '3', null, null, 'upload/images/course/125/jobs.jpg', null, '', '西方经济学', '1', '', '', '2012-02-18 16:00:00', '3', null, '', '1', '0', '4', null, '4', '4', '2012-02-19 06:38:22', '汉语', null, null);
INSERT INTO `course` VALUES ('126', '3', '0', null, '', '0', null, '0', '', '3', 'Add student testing', '0', null, '3', '3', null, null, 'upload/images/course/126/Hydrangeas.jpg', null, '', 'Eighth', '0', '', '', '2012-02-20 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-21 02:07:11', '英语', '1', null);
INSERT INTO `course` VALUES ('127', '3', '0', null, null, '0', null, '0', '\0', '3', '你到底发不发邮件', '0', null, '3', '3', null, null, 'upload/images/course/127/mariopartybizhi01.jpg', null, null, '邮件测试', '0', '', '', '2012-02-21 16:00:00', '3', null, null, '2', '2', '3', null, '3', '3', null, '汉语', '2', null);
INSERT INTO `course` VALUES ('128', '3', '0', null, '', '0', null, '0', '', '3', '真的发送了，漂亮', '0', null, '3', '3', null, null, 'upload/images/course/128/mariopartybizhi01.jpg', null, '', '邮件测试', '0', '', '', '2012-02-20 16:00:00', '3', null, '', '2', '1', '3', null, '3', '3', '2012-02-21 02:44:12', '汉语', '2', null);
INSERT INTO `course` VALUES ('129', '3', '0', null, '', '0', null, '0', '', '3', 'How about invitation?', '0', null, '3', '3', null, null, 'upload/images/course/129/Penguins.jpg', null, '', 'Ninth Testing', '0', '', '', '2012-02-21 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-21 06:13:35', '汉语', '1', null);
INSERT INTO `course` VALUES ('130', '3', '0', null, null, '23', null, '0', '', '3', '毛泽东思想，是马克思列宁主义普遍原理和中国革命具体实践相结合的产物。它是以毛泽东为主要代表的中国共产党人，运用马克思主义的立场、观点和方法，把中国长期革命和建设实践中的一系列独创性经验作了理论概括而形成的适合中国情况的科学的指导思想。它是马克思列宁主义在中国的运用和发展，是被实践证明了的适合中国革命和建设的正确的理论原则和经验总结，是中国共产党集体智慧的结晶。', '0', null, '3', '3', null, null, 'upload/images/course/130/566_200812262130411ds4d.jpg', null, null, '毛泽东思想', '0', '', '', '2012-02-21 16:00:00', '3', null, null, '1', '0', '3', null, '3', '3', null, '汉语', '1', null);
INSERT INTO `course` VALUES ('131', '3', '0', null, '', '0', null, '0', '', '3', 'Testing', '0', null, '3', '3', null, null, 'upload/images/course/131/Hydrangeas.jpg', null, '', 'Tenth', '0', '', '', '2012-02-20 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-21 12:16:41', '英语', '1', null);
INSERT INTO `course` VALUES ('132', '3', '0', null, null, '1', null, '0', '', '3', 'sdf', '0', null, '3', '3', null, null, 'upload/images/course/132/Tulips.jpg', null, null, 's', '0', '', '', '2012-02-22 16:00:00', '3', null, null, '1', '1', '2', null, '2', '2', null, '汉语', '1', null);
INSERT INTO `course` VALUES ('133', '3', '0', null, '', '0', null, '0', '', '3', 'Testing', '0', null, '3', '3', null, null, 'upload/images/course/133/Hydrangeas.jpg', null, '', '1:2 Testing 1', '0', '', '', '2012-02-21 16:00:00', '3', null, '', '2', '1', '2', null, '2', '2', '2012-02-22 07:12:03', '汉语', '2', null);
INSERT INTO `course` VALUES ('134', '3', '0', null, '', '0', null, '0', '\0', '3', '效果还不错哦，大家辛苦了', '0', null, '3', '3', null, null, 'upload/images/course/134/mariopartybizhi01.jpg', null, '', '整体测试', '0', '\0', '', '2012-02-21 16:00:00', '3', null, '', '1', '1', '3', null, '3', '3', '2012-02-22 10:51:31', '汉语', '1', null);
INSERT INTO `course` VALUES ('135', '3', '0', null, '', '0', null, '0', '', '3', 'Testing for two', '0', null, '3', '3', null, null, 'upload/images/course/135/Hydrangeas.jpg', null, '', 'Eleventh', '0', '\0', '', '2012-02-22 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-22 11:27:39', '英语', '1', null);
INSERT INTO `course` VALUES ('136', '3', '0', null, '', '1', null, '0', '', '3', 'testing email', '0', null, '3', '3', null, null, 'upload/images/course/136/Chrysanthemum.jpg', null, '', 'Theeteenth', '1', '\0', '', '2012-02-22 16:00:00', '3', null, '', '2', '1', '2', null, '2', '2', '2012-02-22 11:35:40', '汉语', '1', null);
INSERT INTO `course` VALUES ('137', '3', '0', null, '', '0', null, '0', '', '3', 'Hello', '0', null, '3', '3', null, null, 'upload/images/course/137/Desert.jpg', null, '', 'Fourteenth', '1', '\0', '', '2012-02-21 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-22 11:42:30', '英语', '1', null);
INSERT INTO `course` VALUES ('138', '3', '0', null, '', '0', null, '0', '', '3', 'Find it.', '0', null, '3', '3', null, null, 'upload/images/course/138/Tulips.jpg', null, '', 'Testing', '0', '\0', '', '2012-02-21 16:00:00', '3', null, '', '1', '0', '17', null, '17', '17', '2012-02-22 11:48:09', '英语', '1', null);
INSERT INTO `course` VALUES ('139', '3', '0', null, '', '0', null, '0', '', '3', 'Lingfang', '0', null, '3', '3', null, null, 'upload/images/course/139/Jellyfish.jpg', null, '', 'Fifth testing', '1', '\0', '', '2012-02-21 16:00:00', '3', null, '', '1', '18', '17', null, '17', '17', '2012-02-22 11:57:43', '汉语', '0', null);
INSERT INTO `course` VALUES ('140', '3', '0', null, '', '0', null, '0', '', '3', '18', '0', null, '3', '3', null, null, 'upload/images/course/140/Koala.jpg', null, '', 'The eighteenth', '1', '\0', '', '2012-02-21 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-22 14:51:36', '英语', '1', null);
INSERT INTO `course` VALUES ('141', '3', '0', null, '', '0', null, '0', '', '3', 'how are you.', '0', null, '3', '3', null, null, 'upload/images/course/141/Desert.jpg', null, '', 'nineteenth', '1', '\0', '', '2012-02-21 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-22 15:00:13', '汉语', '1', null);
INSERT INTO `course` VALUES ('142', '3', '0', null, '', '0', null, '0', '', '3', '20', '0', null, '3', '3', null, null, 'upload/images/course/142/Koala.jpg', null, '', '20', '0', '\0', '', '2012-02-22 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-02-22 15:05:58', '汉语', '1', null);
INSERT INTO `course` VALUES ('143', '3', '0', null, '', '0', null, '0', '', '3', 'sdsfs', '0', null, '3', '3', null, null, 'upload/images/course/143/Desert.jpg', null, '', '21', '0', '\0', '', '2012-02-22 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-22 15:09:00', '汉语', '1', null);
INSERT INTO `course` VALUES ('144', '3', '0', null, '', '0', null, '0', '', '3', 'for the meeting', '0', null, '3', '3', null, null, 'upload/images/course/144/Penguins.jpg', null, '', '23th testing', '0', '\0', '', '2012-02-22 16:00:00', '3', null, '', '1', '10', '2', null, '2', '2', '2012-02-23 03:22:52', '英语', '1', null);
INSERT INTO `course` VALUES ('145', '3', '0', null, null, '0', null, '0', '', '3', 'sdf', '0', null, '3', '3', null, null, 'upload/images/course/145/Chrysanthemum.jpg', null, null, 'Hl', '0', '\0', '', '2012-02-23 16:00:00', '3', null, null, '1', '0', '2', null, '2', '2', null, '汉语', '1', null);
INSERT INTO `course` VALUES ('146', '3', '0', null, '', '0', null, '0', '', '3', 'Testing with mouse', '0', null, '3', '3', null, null, 'upload/images/course/146/Koala.jpg', null, '', 'Mouse, Mouse, Come on', '0', '\0', '', '2012-02-23 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-24 02:04:10', '英语', '1', null);
INSERT INTO `course` VALUES ('147', '3', '0', null, '', '1', null, '0', '', '3', 'Testing', '0', null, '3', '3', null, null, 'upload/images/course/147/SSL22253-1.jpg', null, '', 'Mouse, Mouse, Come on', '0', '\0', '', '2012-02-23 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-24 02:05:42', '汉语', '1', null);
INSERT INTO `course` VALUES ('148', '3', '0', null, '', '0', null, '0', '', '3', 'Twenty-fourth Testing', '0', null, '3', '3', null, null, 'upload/images/course/148/Lighthouse.jpg', null, '', '24th Testing', '1', '\0', '', '2012-02-23 16:00:00', '3', null, '', '1', '9', '2', null, '2', '2', '2012-02-24 09:09:47', '英语', '1', null);
INSERT INTO `course` VALUES ('149', '3', '0', null, '', '0', null, '0', '', '3', 'Hello', '0', null, '3', '3', null, null, 'upload/images/course/149/guest2.jpg', null, '', '25th Testing 1 to 1', '1', '\0', '', '2012-02-24 16:00:00', '3', null, '', null, '-1', '2', null, '2', '2', '2012-02-25 11:13:20', '汉语', '1', null);
INSERT INTO `course` VALUES ('150', '3', '0', null, '', '0', null, '0', '', '3', 'Testing', '0', null, '3', '3', null, null, 'upload/images/course/150/Tulips.jpg', null, '', '1: 2 Testing', '2', '\0', '', '2012-02-24 16:00:00', '3', null, '', '2', '4', '2', null, '2', '2', '2012-02-25 15:42:26', '汉语', '2', null);
INSERT INTO `course` VALUES ('151', '3', '0', null, '', '0', null, '0', '', '3', 'test', '0', null, '3', '3', null, null, 'upload/images/course/151/Jellyfish.jpg', null, '', '27 Testing', '1', '\0', '', '2012-02-27 16:00:00', '3', null, '', '1', '3', '2', null, '2', '2', '2012-02-27 05:23:28', '汉语', '1', null);
INSERT INTO `course` VALUES ('152', '3', '0', null, '', '100', null, '0', '', '3', 'For Miss Huang', '0', null, '3', '3', null, null, 'upload/images/course/152/guest2.jpg', null, '', 'Joan Huang, Testing', '1', '\0', '', '2012-02-27 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-02-27 07:17:15', '汉语', '1', null);
INSERT INTO `course` VALUES ('153', '3', '0', null, '', '0', null, '0', '', '3', 'beginner level', '0', null, '3', '3', null, null, 'upload/images/course/153/bjb4.png', null, '', 'Business Chinese ', '0', '\0', '', '2012-02-28 16:00:00', '3', null, '', '1', '1', '47', null, '47', '47', '2012-02-27 09:04:25', '汉语', '1', null);
INSERT INTO `course` VALUES ('154', '3', '0', null, '', '0', null, '0', '', '3', 'Testing', '0', null, '3', '3', null, null, 'upload/images/course/154/Lighthouse.jpg', null, '', 'bkk Testing', '1', '\0', '', '2012-02-28 16:00:00', '3', null, '', '1', '1', '30', null, '30', '30', '2012-02-28 14:09:49', '汉语', '1', null);
INSERT INTO `course` VALUES ('155', '3', '0', null, '', '0', null, '0', '', '3', 'hehe', '0', null, '3', '3', null, null, 'upload/images/course/155/Penguins.jpg', null, '', 'BKK Testing again', '1', '\0', '', '2012-02-28 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-02-28 14:23:42', '汉语', '1', null);
INSERT INTO `course` VALUES ('156', '3', '0', null, '', '0', null, '0', '', '3', 'Hello', '0', null, '3', '3', null, null, 'upload/images/course/156/football.jpg', null, '', 'Home Testing', '0', '\0', '', '2012-02-28 16:00:00', '3', null, '', '1', '12', '19', null, '19', '19', '2012-03-11 15:21:38', '汉语', '1', null);
INSERT INTO `course` VALUES ('157', '3', '0', null, null, '0', null, '0', '', '3', '撒的发生地方', '0', null, '3', '3', null, null, 'upload/images/course/157/hailin.jpg', null, null, '高等数学', '0', '\0', '', '2012-02-28 16:00:00', '3', null, null, '1', '0', '3', null, '3', '3', null, '汉语', '0', null);
INSERT INTO `course` VALUES ('158', '3', '0', null, '', '0', null, '0', '', '3', 'testing', '0', null, '3', '3', null, null, 'upload/images/course/158/football.jpg', null, '', '1:2 Testing 2', '0', '\0', '', '2012-02-29 16:00:00', '3', null, '', '2', '1', '2', null, '2', '2', '2012-02-29 04:10:48', '汉语', '2', null);
INSERT INTO `course` VALUES ('159', '3', '0', null, null, '100', null, '0', '\0', '3', '测试', '0', null, '3', '3', null, null, 'upload/images/course/159/u=971967835,1274249583&fm=52&gp=0.jpg', null, null, '课程测试2.29', '0', '\0', '', '2012-02-29 16:00:00', '3', null, null, '1', '0', '4', null, '4', '4', null, '汉语', '0', null);
INSERT INTO `course` VALUES ('160', '3', '0', null, '', '100', null, '0', '\0', '3', '测试', '0', null, '3', '3', null, null, 'upload/images/course/160/u=971967835,1274249583&fm=52&gp=0.jpg', null, '', '课程测试2.29', '1', '\0', '', '2012-02-29 16:00:00', '3', null, '', '1', '1', '4', null, '4', '4', '2012-02-29 13:47:43', '汉语', '0', null);
INSERT INTO `course` VALUES ('161', '3', '0', null, null, '1', null, '0', '\0', '3', 'aaa', '0', null, '3', '3', null, null, 'upload/images/course/161/Jellyfish.jpg', null, null, 'aaa', '0', '\0', '', '2012-03-01 16:00:00', '3', null, null, '1', '1', '29', null, '29', '29', null, '汉语', '0', null);
INSERT INTO `course` VALUES ('162', '3', '0', null, '', '100', null, '0', '\0', '3', '全方位提升英语口语表达能力与技巧', '0', null, '3', '3', null, null, 'upload/images/course/162/Lighthouse.jpg', null, '', '高级英语口语', '0', '\0', '', '2012-03-01 16:00:00', '3', null, '', '1', '4', '15', null, '15', '15', '2012-03-01 03:59:13', '英语', '0', null);
INSERT INTO `course` VALUES ('163', '3', '0', null, '', '1', null, '0', '\0', '3', '12321', '0', null, '3', '3', null, null, 'upload/images/course/163/index_r2_c1.png', null, '', 'TT', '0', '\0', '', '2012-03-14 16:00:00', '3', null, '', '2', '0', '3', null, '3', '3', '2012-03-01 12:28:16', '汉语', '1', null);
INSERT INTO `course` VALUES ('164', '3', '0', null, '', '100', null, '0', '\0', '3', '主讲西方经济学', '0', null, '3', '3', null, null, 'upload/images/course/164/Hydrangeas.jpg', null, '', '经济学原理', '0', '\0', '', '2012-03-01 16:00:00', '3', null, '', '1', '3', '49', null, '49', '49', '2012-03-01 12:33:59', '汉语', '0', null);
INSERT INTO `course` VALUES ('165', '3', '0', null, '', '0', null, '0', '', '3', 'Testing', '0', null, '3', '3', null, null, 'upload/images/course/165/Koala.jpg', null, '', '1:2 Testing Mar 1', '0', '\0', '', '2012-03-01 16:00:00', '3', null, '', '2', '1', '3', null, '3', '3', '2012-03-01 12:52:43', '汉语', '2', null);
INSERT INTO `course` VALUES ('166', '3', '0', null, '', '0', null, '0', '', '3', 'Hi', '0', null, '3', '3', null, null, 'upload/images/course/166/football.jpg', null, '', '1:2 How is it?', '0', '\0', '', '2012-03-01 16:00:00', '3', null, '', '2', '1', '2', null, '2', '2', '2012-03-01 13:20:55', '汉语', '2', null);
INSERT INTO `course` VALUES ('167', '3', '0', null, null, '1', null, '0', '', '3', 'CSS页面设计', '0', null, '3', '3', null, null, 'upload/images/course/167/p3.jpg', null, null, 'CSS页面设计', '0', '\0', '', '2012-04-02 16:00:00', '3', null, null, '1', '1', '29', null, '29', '29', null, '汉语', '0', null);
INSERT INTO `course` VALUES ('168', '3', '0', null, null, '1', null, '0', '', '3', 'CSS页面设计', '0', null, '3', '3', null, null, 'upload/images/course/168/p3.jpg', null, null, 'CSS页面设计', '0', '\0', '', '2012-04-02 16:00:00', '3', null, null, '1', '1', '29', null, '29', '29', null, '汉语', '0', null);
INSERT INTO `course` VALUES ('169', '3', '0', null, '', '0', null, '0', '\0', '3', '啦啦啦拉拉了', '0', null, '3', '3', null, null, 'upload/images/course/169/0.jpg', null, '', '开始1对2测试', '0', '\0', '', '2012-03-02 16:00:00', '3', null, '', '2', '1', '3', null, '3', '3', '2012-03-02 12:01:17', '汉语', '1', null);
INSERT INTO `course` VALUES ('170', '3', '0', null, '', '0', null, '0', '', '3', 'Testing', '0', null, '3', '3', null, null, 'upload/images/course/170/football.jpg', null, '', 'XiXi Testing', '0', '\0', '', '2012-03-03 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-03-03 07:58:11', '汉语', '1', null);
INSERT INTO `course` VALUES ('171', '3', '0', null, '', '0', null, '0', '\0', '3', 'testing', '0', null, '3', '3', null, null, 'upload/images/course/171/football.jpg', null, '', '1:2 Testing Mar 2', '0', '\0', '', '2012-03-03 16:00:00', '3', null, '', '2', '1', '2', null, '2', '2', '2012-03-03 08:15:59', '汉语', '1', null);
INSERT INTO `course` VALUES ('172', '2', '0', null, '', '0', null, '0', '\0', '2', 'test', '1', null, '2', '2', null, null, 'upload/images/course/172/football.jpg', null, '', '1:2 Testing Mar 2, again', '1', '\0', '', '2012-03-03 16:00:00', '2', null, '', '2', '1', '19', null, '19', '19', '2012-03-03 08:20:54', '汉语', '1', null);
INSERT INTO `course` VALUES ('173', '3', '0', null, '', '0', null, '0', '\0', '3', '北京时间12：30， 4 Mar.', '0', null, '3', '3', null, null, 'upload/images/course/173/football.jpg', null, '', '很久没聊聊了，有空没？曾锃', '0', '\0', '', '2012-03-03 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-03 08:35:46', '英语', '1', null);
INSERT INTO `course` VALUES ('174', '4', '0', null, '', '0', null, '0', '\0', '3.5', 'testing', '1', null, '3.5', '3', null, null, 'upload/images/course/174/guest2.jpg', null, '', '1:3 testing 1st', '1', '\0', '', '2012-03-03 16:00:00', '3.5', null, '', '3', '1', '19', null, '19', '19', '2012-03-03 09:08:01', '汉语', '2', null);
INSERT INTO `course` VALUES ('175', '3', '0', null, '', '0', null, '0', '\0', '3', '曾锃', '0', null, '3', '3', null, null, 'upload/images/course/175/SSL22253-1.jpg', null, '', '好好聊聊', '0', '\0', '', '2012-03-03 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-03 09:30:38', '英语', '1', null);
INSERT INTO `course` VALUES ('176', '3', '0', null, '', '0', null, '0', '\0', '3', 'tt', '0', null, '3', '3', null, null, 'upload/images/course/176/language.png', null, '', 'Testing again', '0', '\0', '', '2012-03-03 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-03 09:36:50', '汉语', '1', null);
INSERT INTO `course` VALUES ('177', '3', '0', null, '', '0', null, '0', '\0', '3', 'sfsdf', '0', null, '3', '3', null, null, 'upload/images/course/177/SSL22253-1.jpg', null, '', 'Testing again 1', '0', '\0', '', '2012-03-03 16:00:00', '3', null, '', '1', '1', '2', null, '2', '2', '2012-03-03 09:48:48', '汉语', '1', null);
INSERT INTO `course` VALUES ('178', '3', '0', null, '', '0', null, '0', '\0', '3', 'Have a chat', '0', null, '3', '3', null, null, 'upload/images/course/178/football.jpg', null, '', 'Yanhong testing', '0', '\0', '', '2012-03-03 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-03 09:56:43', '汉语', '1', null);
INSERT INTO `course` VALUES ('179', '3', '0', null, '', '0', null, '0', '\0', '3', 'Testing', '0', null, '3', '3', null, null, 'upload/images/course/179/Slide1.JPG', null, '', 'Yanhong 1 to 1', '0', '\0', '', '2012-03-03 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-03 12:12:55', '汉语', '1', null);
INSERT INTO `course` VALUES ('180', '3', '0', null, '', '0', null, '0', '\0', '3', '啦啦啦', '0', null, '3', '3', null, null, 'upload/images/course/180/test.jpg', null, '', '1对1test', '0', '\0', '', '2012-03-03 16:00:00', '3', null, '', '1', '1', '3', null, '3', '3', '2012-03-03 12:13:24', '英语', '1', null);
INSERT INTO `course` VALUES ('181', '3', '0', null, null, '0', null, '0', '\0', '3', 's', '0', null, '3', '3', null, null, 'upload/images/course/181/football.jpg', null, null, 'Yanhong 1 to 1 again', '0', '\0', '', '2012-03-03 16:00:00', '3', null, null, '1', '0', '19', null, '19', '19', null, '汉语', '1', null);
INSERT INTO `course` VALUES ('182', '3', '0', null, '', '0', null, '0', '\0', '3', 's', '0', null, '3', '3', null, null, 'upload/images/course/182/football.jpg', null, '', 'Yanhong 1 to 1 again', '0', '\0', '', '2012-03-03 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-03 12:15:34', '汉语', '1', null);
INSERT INTO `course` VALUES ('183', '3', '0', null, '', '0', null, '0', '\0', '3', 'it is great', '0', null, '3', '3', null, null, 'upload/images/course/183/est.jpg', null, '', 'one 2 three test', '3', '\0', '', '2012-03-03 16:00:00', '3', null, '', '3', '1', '3', null, '3', '3', '2012-03-03 13:18:22', '法语', '0', null);
INSERT INTO `course` VALUES ('184', '2', '0', null, '', '5', null, '0', '\0', '2', '无酒不成礼', '1', null, '2', '4', null, null, 'upload/images/course/184/p3.jpg', null, '', '中国酒文化', '0', '\0', '', '2012-03-03 16:00:00', '2.5', null, '', '1', '1', '29', null, '29', '29', '2012-03-03 14:01:29', '汉语', '1', null);
INSERT INTO `course` VALUES ('185', '2', '0', null, '', '1', null, '0', '\0', '2', '乐理基础', '1', null, '2', '2', null, null, 'upload/images/course/185/p1.jpg', null, '', '乐理基础', '0', '\0', '', '2012-03-04 16:00:00', '2', null, '', '1', '3', '29', null, '29', '29', '2012-03-04 05:37:12', '汉语', '1', null);
INSERT INTO `course` VALUES ('186', '3', '0', null, '', '1', null, '0', '', '3', '考研全攻略', '0', null, '3', '3', null, null, 'upload/images/course/186/answers_sm.jpg', null, '', '考研全攻略', '0', '\0', '', '2012-03-06 16:00:00', '3', null, '', '1', '9', '29', null, '29', '29', '2012-03-06 04:09:57', '汉语', '0', null);
INSERT INTO `course` VALUES ('187', '3', '0', null, '', '0', null, '0', '\0', '3', 'ster', '0', null, '3', '3', null, null, 'upload/images/course/187/Hydrangeas.jpg', null, '', '1:2 Testing 1', '1', '\0', '', '2012-03-06 16:00:00', '3', null, '', '2', '1', '19', null, '19', '19', '2012-03-06 14:47:41', '汉语', '1', null);
INSERT INTO `course` VALUES ('188', '3', '0', null, '', '0', null, '0', '\0', '3', 'test', '0', null, '3', '3', null, null, 'upload/images/course/188/IMG_0127.jpg', null, '', '1:2 Testing 3', '1', '\0', '', '2012-03-07 16:00:00', '3', null, '', '2', '9', '2', null, '2', '2', '2012-03-07 12:04:40', '英语', '1', null);
INSERT INTO `course` VALUES ('189', '3', '0', null, '', '0', null, '0', '\0', '3', 're', '0', null, '3', '3', null, null, 'upload/images/course/189/guest2.jpg', null, '', '1:3 Testing 3', '0', '\0', '', '2012-03-07 16:00:00', '3', null, '', '3', '12', '17', null, '17', '17', '2012-03-07 12:17:12', '汉语', '1', null);
INSERT INTO `course` VALUES ('190', '3', '0', null, null, '100', null, '0', '\0', '3', '测试', '0', null, '3', '3', null, null, 'upload/images/course/190/u=2901283867,4254715980&fm=52&gp=0.jpg', null, null, '3.7晚 会议测试', '0', '\0', '', '2012-03-07 16:00:00', '3', null, null, '1', '0', '4', null, '4', '4', null, '汉语', '1', null);
INSERT INTO `course` VALUES ('191', '3', '0', null, '', '100', null, '0', '\0', '3', '测试', '0', null, '3', '3', null, null, 'upload/images/course/191/u=2901283867,4254715980&fm=52&gp=0.jpg', null, '', '3.7晚 会议测试', '0', '\0', '', '2012-03-07 16:00:00', '3', null, '', '1', '1', '4', null, '4', '4', '2012-03-07 13:02:52', '汉语', '1', null);
INSERT INTO `course` VALUES ('192', '3', '0', null, '', '0', null, '0', '\0', '3', '1', '0', null, '3', '3', null, null, 'upload/images/course/192/SSL22253-1.jpg', null, '', '1:1 Meeting', '0', '\0', '', '2012-03-07 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-07 13:02:13', '汉语', '1', null);
INSERT INTO `course` VALUES ('193', '3', '0', null, '', '0', null, '0', '\0', '3', 'tet', '0', null, '3', '3', null, null, 'upload/images/course/193/SSL22253-1.jpg', null, '', 'Testing again 1 1', '0', '\0', '', '2012-03-07 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-07 13:06:17', '英语', '1', null);
INSERT INTO `course` VALUES ('194', '3', '0', null, '', '100', null, '0', '\0', '3', '测试', '0', null, '3', '3', null, null, 'upload/images/course/194/u=2901283867,4254715980&fm=52&gp=0.jpg', null, '', '3.7晚 会议测试', '0', '\0', '', '2012-03-07 16:00:00', '3', null, '', '1', '1', '4', null, '4', '4', '2012-03-07 13:06:33', '汉语', '1', null);
INSERT INTO `course` VALUES ('195', '3', '0', null, null, '100', null, '0', '\0', '3', '课程测试', '0', null, '3', '3', null, null, 'upload/images/course/195/Koala.jpg', null, null, '一对一测试', '0', '\0', '', '2012-03-11 16:00:00', '3', null, null, '1', '0', '15', null, '15', '15', null, '汉语', '1', '0');
INSERT INTO `course` VALUES ('196', '3', '0', null, '', '0', null, '0', '\0', '3', 'Meeting for the next few days', '0', null, '3', '3', null, null, 'upload/images/course/196/guest2.jpg', null, '', '1:1Testing -30', '0', '\0', '', '2012-03-12 16:00:00', '3', null, '', '1', '2', '19', null, '19', '19', '2012-03-12 02:45:57', 'English', '1', '0');
INSERT INTO `course` VALUES ('197', '3', '0', null, '', '0', null, '0', '\0', '3', 'sdf', '0', null, '3', '3', null, null, 'upload/images/course/197/broccoflower-fractal.jpg', null, '', 'a meeting with lingfang', '0', '\0', '', '2012-03-13 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-12 08:23:24', 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('198', '3', '0', null, '', '100', null, '0', '\0', '3', '测试', '0', null, '3', '3', null, null, 'upload/images/course/198/u=2246236858,496129920&fm=52&gp=0.jpg', null, '', '3.12测试课程', '0', '\0', '', '2012-03-12 16:00:00', '3', null, '', '1', '1', '4', null, '4', '4', '2012-03-12 09:31:54', '汉语', '1', '0');
INSERT INTO `course` VALUES ('199', '3', '0', null, null, '1', null, '0', '\0', '3', 'sdf ', '0', null, '3', '3', null, null, 'upload/images/course/199/Sunset.jpg', null, null, 'xccv ', '0', '\0', '', '2012-03-19 16:00:00', '3', null, null, '1', '1', '62', null, '62', '62', null, '汉语', '1', '0');
INSERT INTO `course` VALUES ('200', '3', '0', null, null, '0', null, '0', '\0', '3', '00', '0', null, '3', '3', null, null, 'upload/images/course/200/Sunset.jpg', null, null, '00', '0', '\0', '', '2012-03-12 16:00:00', '3', null, null, '1', '3', '62', null, '62', '62', null, '汉语', '1', '0');
INSERT INTO `course` VALUES ('201', '3', '0', null, '', '0', null, '0', '\0', '3', '一对一课程测试1', '0', null, '3', '3', null, null, 'upload/images/course/201/Koala.jpg', null, '', '课程测试1', '0', '\0', '', '2012-03-12 16:00:00', '3', null, '', '1', '1', '15', null, '15', '15', '2012-03-12 12:29:35', '汉语', '1', '0');
INSERT INTO `course` VALUES ('202', '3', '0', null, '', '0', null, '0', '', '3', 'is so good,a haha.', '0', null, '3', '3', null, null, 'upload/images/course/202/mariopartybizhi01.jpg', null, '', 'chat with my bestFriend', '0', '\0', '', '2012-03-12 16:00:00', '3', null, '', null, '0', '3', null, '3', '3', '2012-03-12 14:43:12', '汉语', '1', '0');
INSERT INTO `course` VALUES ('203', '4.5', '0', null, '', '30', null, '0', '\0', '5', '湖南大学著名教授亲力教授', '1', null, '5', '4.5', null, null, 'upload/images/course/203/1274961283ahd0aR3A.jpg', null, '', '《宏观经济学》', '0', '\0', '', '2012-03-12 16:00:00', '4.8', null, '', '1', '9', '65', null, '65', '65', '2012-03-12 14:46:22', '汉语', '1', '0');
INSERT INTO `course` VALUES ('204', '5', '0', null, '', '0', null, '0', '', '5', 'you can study hard', '1', null, '5', '4.5', null, null, 'upload/images/course/204/this.JPG', null, '', 'girl you are so good', '0', '\0', '', '2012-03-12 16:00:00', '4.9', null, '', '1', '1', '3', null, '3', '3', '2012-03-12 14:49:22', '法语', '1', '0');
INSERT INTO `course` VALUES ('205', '3', '0', null, '', '1', null, '0', '\0', '3', '你在舞台上你的骄傲和美丽中舞蹈', '0', null, '3', '3', null, null, 'upload/images/course/205/图片001.jpg', null, '', '此间少年', '0', '\0', '', '2012-03-13 16:00:00', '3', null, '', '2', '4', '29', null, '29', '29', '2012-03-12 17:31:08', '德语', '0', '0');
INSERT INTO `course` VALUES ('206', '3', '0', null, '', '6', null, '0', '\0', '3', 'Those Years', '0', null, '3', '3', null, null, 'upload/images/course/206/代代2.jpg', null, '', 'Those Years', '0', '\0', '', '2012-03-13 16:00:00', '3', null, '', '4', '8', '29', '4', '29', null, '2012-03-12 17:56:19', 'Chinese', '0', '0');
INSERT INTO `course` VALUES ('207', '3', '0', null, '', '0', null, '0', '\0', '3', 'Have a first meeting with VC', '0', null, '3', '3', null, null, 'upload/images/course/207/IMG_0127.jpg', null, '', 'Meetings', '0', '\0', '', '2012-03-13 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-13 02:21:59', 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('208', '3', '0', null, '', '0', null, '0', '\0', '3', 'Hello, I am Dr. Zeng. Nice to meet you on GoGoWise', '0', null, '3', '3', null, null, 'upload/images/course/208/guest2.jpg', null, '', 'The First Meeting With Duke', '0', '\0', '', '2012-03-13 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-13 02:32:46', 'English', '1', '0');
INSERT INTO `course` VALUES ('209', '3', '0', null, '', '0', null, '0', '\0', '3', 'tt', '0', null, '3', '3', null, null, 'upload/images/course/209/SSL22253-1.jpg', null, '', '1:1 Testing ', '0', '\0', '', '2012-03-14 16:00:00', '3', null, '', '1', '1', '3', null, '3', '3', '2012-03-14 01:41:28', 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('210', '3', '0', null, '', '0', null, '0', '\0', '3', 'With Lingfang and Wangyang', '0', null, '3', '3', null, null, 'upload/images/course/210/SSL21073.jpg', null, '', '1: 2 Testing in lab', '0', '\0', '', '2012-03-14 16:00:00', '3', null, '', '2', '1', '19', null, '19', '19', '2012-03-14 02:09:53', 'Chinese', '2', '0');
INSERT INTO `course` VALUES ('211', '3', '0', null, '', '0', null, '0', '\0', '3', 'Lingfang Zeng', '0', null, '3', '3', null, null, 'upload/images/course/211/football.jpg', null, '', 'Testing again', '0', '\0', '', '2012-03-14 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-14 02:25:14', 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('212', '3', '0', null, '', '2121', null, '0', '\0', '3', 'First Wang', '0', null, '3', '3', null, null, 'upload/images/course/212/Img300790138.jpg', null, '', 'TestLingfang-first', '0', '\0', '', '2012-03-14 16:00:00', '3', null, '', '1', '18', '19', null, '19', '19', '2012-03-14 08:57:18', '汉语', '1', '0');
INSERT INTO `course` VALUES ('213', '3', '0', null, null, '0', null, '0', '\0', '3', '来吧来吧', '0', null, '3', '3', null, null, 'upload/images/course/213/this.JPG', null, null, '组织开课功能测试', '0', '\0', '', '2012-03-14 16:00:00', '3', null, null, '1', '0', '19', '4', '19', null, null, '日语', '1', '0');
INSERT INTO `course` VALUES ('214', '3', '0', null, '', '0', null, '0', '\0', '3', '来吧来吧', '0', null, '3', '3', null, null, 'upload/images/course/214/this.JPG', null, '', '组织开课功能测试', '0', '\0', '', '2012-03-14 16:00:00', '3', null, '', '1', '1', '19', '4', '19', null, '2012-03-14 03:07:19', '日语', '1', '0');
INSERT INTO `course` VALUES ('215', '3', '0', null, '', '100', null, '0', '\0', '3', '测试', '0', null, '3', '3', null, null, 'upload/images/course/215/u=1765887540,100577892&fm=52&gp=0.jpg', null, '', '测试课程', '0', '\0', '', '2012-03-14 16:00:00', '3', null, '', '3', '1', '4', '4', '4', null, '2012-03-14 03:42:40', '汉语', '1', '0');
INSERT INTO `course` VALUES ('216', '3', '0', null, null, '100', null, '0', '\0', '3', '课程测试', '0', null, '3', '3', null, null, 'upload/images/course/216/u=1765887540,100577892&fm=52&gp=0.jpg', null, null, '3.14测试', '0', '\0', '', '2012-03-14 16:00:00', '3', null, null, '1', '0', '4', '4', '4', null, null, '汉语', '1', '0');
INSERT INTO `course` VALUES ('217', '3', '0', null, null, '100', null, '0', '\0', '3', '测试', '0', null, '3', '3', null, null, 'upload/images/course/217/u=1765887540,100577892&fm=52&gp=0.jpg', null, null, '3.14测试课程', '0', '\0', '', '2012-03-14 16:00:00', '3', null, null, '1', '0', '4', '4', '4', null, null, '汉语', '1', '0');
INSERT INTO `course` VALUES ('218', '3', '0', null, '', '0', null, '0', '\0', '3', 'test', '0', null, '3', '3', null, null, 'upload/images/course/218/Slide1.JPG', null, '', '1:1 Simu-Org', '0', '\0', '', '2012-03-14 16:00:00', '3', null, '', '1', '1', '19', '4', '19', null, '2012-03-14 08:38:23', 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('219', '3', '0', null, '', '0', null, '0', '', '3', '阿拉拉拉了', '0', null, '3', '3', null, null, 'upload/images/course/219/mariopartybizhi01.jpg', null, '', '组织模拟开课', '0', '\0', '', '2012-03-14 16:00:00', '3', null, '', '1', '1', '3', '4', '3', '48', '2012-03-14 10:12:07', '日语', '1', '0');
INSERT INTO `course` VALUES ('220', '3', '0', null, '', '0', null, '0', '\0', '3', 'test', '0', null, '3', '3', null, null, 'upload/images/course/220/football.jpg', null, '', '1:1 Simu-Org again', '0', '\0', '', '2012-03-14 16:00:00', '3', null, '', '1', '24', '19', '4', '19', '17', '2012-03-14 10:58:56', 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('221', '3', '0', null, '', '0', null, '0', '', '3', '拉拉了', '0', null, '3', '3', null, null, 'upload/images/course/221/mariopartybizhi01.jpg', null, '', '模拟组织开课1:1 test', '0', '\0', '', '2012-03-14 16:00:00', '3', null, '', '1', '1', '3', '4', '3', '19', '2012-03-14 11:04:44', '日语', '1', '0');
INSERT INTO `course` VALUES ('222', '3', '0', null, '', '0', null, '0', '\0', '3', 'test', '0', null, '3', '3', null, null, 'upload/images/course/222/football.jpg', null, '', '1: 2 Testing in lab', '0', '\0', '', '2012-03-14 16:00:00', '3', null, '', null, '4', '19', null, '19', '19', '2012-03-14 11:37:49', 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('223', '3', '0', null, null, '0', null, '0', '\0', '3', 'sdf', '0', null, '3', '3', null, null, 'upload/images/course/223/football.jpg', null, null, 'Testing again 1 1', '0', '\0', '', '2012-03-14 16:00:00', '3', null, null, '1', '0', '19', null, '19', '19', null, 'Chinese', '0', '0');
INSERT INTO `course` VALUES ('224', '3', '0', null, '', '0', null, '0', '\0', '3', 'hello', '0', null, '3', '3', null, null, 'upload/images/course/224/guest2.jpg', null, '', '1:1 Testing for simu-org', '0', '\0', '', '2012-03-15 16:00:00', '3', null, '', '1', '12', '19', '4', '19', '17', '2012-03-15 04:37:34', 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('225', '3', '0', null, '', '0', null, '0', '\0', '3', '123的冯绍峰沙发上', '0', null, '3', '3', null, null, 'upload/images/course/225/mariopartybizhi01.jpg', null, '', '开课test', '0', '\0', '', '2012-03-15 16:00:00', '3', null, '', '1', '4', '3', '4', '3', null, '2012-03-15 08:33:28', '汉语', '1', '0');
INSERT INTO `course` VALUES ('226', '3', '0', null, '', '0', null, '0', '\0', '3', 'sfdsf', '0', null, '3', '3', null, null, 'upload/images/course/226/guest2.jpg', null, '', 'sdf', '0', '\0', '', '2012-03-15 16:00:00', '3', null, '', '1', '31', '17', '4', '17', '17', '2012-03-15 08:38:48', 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('227', '3.5', '0', null, '', '0', null, '0', '', '4', 'I don\'t like this feeling', '1', null, '4', '3.5', null, null, 'upload/images/course/227/javabcsx.jpg', null, '', '心情糟透了', '0', '\0', '', '2012-03-15 16:00:00', '3.8', null, '', '1', '16', '3', '4', '3', null, '2012-03-15 09:28:04', 'English', '1', '0');
INSERT INTO `course` VALUES ('228', '3', '0', null, '', '0', null, '0', '\0', '3', 'sfsd', '0', null, '3', '3', null, null, 'upload/images/course/228/football.jpg', null, '', 'sfd', '0', '\0', '', '2012-03-15 16:00:00', '3', null, '', '1', '22', '19', '4', '19', null, '2012-03-15 08:47:16', 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('229', '3', '0', null, '', '0', null, '0', '\0', '3', 'Introduction', '0', null, '3', '3', null, null, 'upload/images/course/229/language.png', null, '', 'Xiurui Meeting', '0', '\0', '', '2012-03-15 16:00:00', '3', null, '', '1', '1', '17', null, '17', '17', '2012-03-23 15:16:10', 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('230', '3', '0', null, '', '100', null, '0', '\0', '3', '高中物理', '0', null, '3', '3', null, null, 'upload/images/course/230/未命名.jpg', null, '', '物理', '0', '\0', '', '2012-03-16 16:00:00', '3', null, '', '1', '2', '72', null, '72', '72', '2012-03-15 11:12:34', '汉语', '0', '0');
INSERT INTO `course` VALUES ('231', '3', '0', null, '', '100', null, '0', '\0', '3', '高中物理', '0', null, '3', '3', null, null, 'upload/images/course/231/未命名.jpg', null, '', '物理', '0', '\0', '', '2012-03-16 16:00:00', '3', null, '', '1', '1', '72', null, '72', '72', '2012-03-15 11:16:07', '汉语', '1', '0');
INSERT INTO `course` VALUES ('232', '3', '0', null, null, '0', null, '0', '', '3', '啊哈哈 啊哈哈', '0', null, '3', '3', null, null, 'upload/images/course/232/mariopartybizhi01.jpg', null, null, 'time test', '0', '\0', '', '2012-03-19 16:00:00', '3', null, null, '1', '8', '3', '4', '3', null, null, '日语', '1', '0');
INSERT INTO `course` VALUES ('233', '3', '0', null, '', '0', null, '0', '\0', '3', 'tst', '0', null, '3', '3', null, null, 'upload/images/course/233/football.jpg', null, '', 'simu orga.', '0', '\0', '', '2012-03-16 16:00:00', '3', null, '', '1', '19', '19', '4', '19', '17', '2012-03-16 07:55:07', 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('234', '3', '0', null, null, '0', null, '0', '\0', '3', 'sdf', '0', null, '3', '3', null, null, 'upload/images/course/234/guest2.jpg', null, null, 'simu orga.', '0', '\0', '', '2012-03-16 16:00:00', '3', null, null, '1', '0', '19', '4', '19', null, null, 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('235', '3', '0', null, null, '9', null, '0', '\0', '3', 'dgfd', '0', null, '3', '3', null, null, 'upload/images/course/235/football.jpg', null, null, 'sdfsd', '0', '\0', '', '2012-03-16 16:00:00', '3', null, null, '1', '0', '19', '4', '19', null, null, 'Chinese', '1', '0');
INSERT INTO `course` VALUES ('236', '3', '0', null, '', '2', null, '0', '', '3', '(1)我们党要始终代表中国先进生产力的发展要求\r\n　　(2)我们党要始终代表中国先进文化的前进方向\r\n　　(3)我们党要始终代表中国最广大人民的根本利益', '0', null, '3', '3', null, null, 'upload/images/course/236/5.jpg', null, '', '三个代表', '0', '\0', '', '2012-03-20 16:00:00', '3', null, '', '1', '1', '3', null, '3', '3', '2012-03-20 06:37:27', '汉语', '1', '0');
INSERT INTO `course` VALUES ('237', '3', '0', null, '', '12', null, '0', '\0', '3', 'fdsfds', '0', null, '3', '3', null, null, 'upload/images/course/237/W020101023522139309591.jpg', null, '', '阳光灿烂的日子', '0', '\0', '', '2012-03-21 16:00:00', '3', null, '', '1', '1', '3', null, '3', '3', '2012-03-20 06:55:50', '法语', '1', '0');
INSERT INTO `course` VALUES ('238', '3', '0', null, '', '12', null, '0', '', '3', 'qwe', '0', null, '3', '3', null, null, 'upload/images/course/238/未标题-1.png', null, '', 'test fms 1to2', '1', '\0', '', '2012-03-20 16:00:00', '3', null, '', '2', '32', '3', null, '3', '3', '2012-03-20 07:58:52', '汉语', '1', '0');
INSERT INTO `course` VALUES ('239', '3', '0', null, '', '0', null, '0', '\0', '3', 'sfsdljflsdj ', '0', null, '3', '3', null, null, 'upload/images/course/239/08_avatar_middle.jpg', null, '', '托福英语', '0', '\0', '', '2012-03-20 16:00:00', '3', null, '', '1', '11', '19', null, '19', '19', '2012-03-20 12:52:15', '英语', '1', '0');
INSERT INTO `course` VALUES ('240', '3', '0', null, '', '1000', null, '0', '', '3', '速度分公司地方', '0', null, '3', '3', null, null, 'upload/images/course/240/jiaocai.jpg', null, '', '美声乐理', '1', '\0', '', '2012-03-20 16:00:00', '3', null, '', '1', '16', '19', null, '19', '19', '2012-03-20 13:13:49', '汉语', '0', '0');
INSERT INTO `course` VALUES ('241', '3', '0', null, '', '1000', null, '0', '', '3', '文心语文', '0', null, '3', '3', null, null, 'upload/images/course/241/21_1227_0e59027607b5296.jpg', null, '', '高中语文', '0', '\0', '', '2012-03-21 16:00:00', '3', null, '', '1', '29', '19', null, '19', '19', '2012-03-23 15:59:48', '汉语', '1', '0');
INSERT INTO `course` VALUES ('242', '3', '0', null, '', '20', null, '0', '', '3', '高中数学必修课', '0', null, '3', '3', null, null, 'upload/images/course/242/u=3595128119,1543936704&fm=51&gp=0.jpg', null, '', '高中数学', '0', '\0', '', '2012-03-23 16:00:00', '3', null, '', '1', '1', '140', null, '140', '140', '2012-03-23 07:54:12', '汉语', '1', '0');
INSERT INTO `course` VALUES ('243', '3', '0', null, null, '30', null, '0', '', '3', '初一数学', '0', null, '3', '3', null, null, 'upload/images/course/243/u=2190503718,1721782952&fm=51&gp=0.jpg', null, null, '数学', '0', '\0', '', '2012-03-30 16:00:00', '3', null, null, '1', '1', '139', null, '139', '139', null, '汉语', '1', '0');
INSERT INTO `course` VALUES ('244', '3', '0', null, '', '1000', null, '0', '', '3', 'Test', '0', null, '3', '3', null, null, 'upload/images/course/244/Desert.jpg', null, '', 'Testing', '0', '\0', '', '2012-03-24 16:00:00', '3', null, '', '1', '16', '19', null, '19', '19', '2012-03-24 02:05:48', '汉语', '1', '0');
INSERT INTO `course` VALUES ('245', '3', '0', null, '', '2000', null, '0', '', '3', '特色同', '0', null, '3', '3', null, null, 'upload/images/course/245/Hydrangeas.jpg', null, '', '高中英语', '0', '\0', '', '2012-03-24 16:00:00', '3', null, '', '1', '12', '19', null, '19', '19', '2012-03-24 07:14:05', '英语', '1', '0');
INSERT INTO `course` VALUES ('246', '3', '0', null, null, '1000', null, '0', '', '3', '文心语文', '0', null, '3', '3', null, null, 'upload/images/course/241/21_1227_0e59027607b5296.jpg', null, null, '高中语文', '0', '\0', '', '2012-03-24 16:00:00', '3', null, null, '1', '29', '19', null, '19', '19', null, '汉语', '0', '0');
INSERT INTO `course` VALUES ('247', '3', '0', null, '', '0', null, '0', '\0', '3', 'serewr', '0', null, '3', '3', null, null, 'upload/images/course/247/Penguins.jpg', null, '', 'test', '0', '\0', '', '2012-03-24 16:00:00', '3', null, '', '1', '1', '19', null, '19', '19', '2012-03-24 07:21:48', '汉语', '1', '0');
INSERT INTO `course` VALUES ('248', '3', '0', null, null, '12', null, '0', '\0', '3', 'fdsfds', '0', null, '3', '3', null, null, 'upload/images/course/237/W020101023522139309591.jpg', null, null, '阳光灿烂的日子', '0', '\0', '', '2012-03-25 16:00:00', '3', null, null, '1', '1', '3', null, '3', '3', null, '法语', '0', '0');
INSERT INTO `course` VALUES ('249', '3', '0', null, '', '2', null, '0', '\0', '3', 'test', '0', null, '3', '3', null, null, 'upload/images/course/249/Logo.jpg', null, '', 'fms test', '0', '\0', '', '2012-03-25 16:00:00', '3', null, '', '1', '1', '3', null, '3', '3', '2012-03-24 08:25:42', '汉语', '1', '0');

-- ----------------------------
-- Table structure for `coursecomment`
-- ----------------------------
DROP TABLE IF EXISTS `coursecomment`;
CREATE TABLE `coursecomment` (
  `id` int(11) NOT NULL auto_increment,
  `commentTime` date default NULL,
  `content` varchar(255) default NULL,
  `replyNums` int(11) default NULL,
  `commenter_id` int(11) default NULL,
  `course_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC9FE91A456F48987` (`commenter_id`),
  KEY `FKC9FE91A4ACBD5F77` (`course_id`),
  CONSTRAINT `FKC9FE91A456F48987` FOREIGN KEY (`commenter_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FKC9FE91A4ACBD5F77` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursecomment
-- ----------------------------
INSERT INTO `coursecomment` VALUES ('1', '2012-01-14', '', '0', '4', '58');
INSERT INTO `coursecomment` VALUES ('2', '2012-01-14', '', '0', '4', '58');
INSERT INTO `coursecomment` VALUES ('3', '2012-01-14', '', '0', '4', '58');
INSERT INTO `coursecomment` VALUES ('4', '2012-01-14', '', '0', '4', '58');
INSERT INTO `coursecomment` VALUES ('5', '2012-01-14', '', '0', '4', '58');
INSERT INTO `coursecomment` VALUES ('6', '2012-01-14', '', '0', '4', '58');
INSERT INTO `coursecomment` VALUES ('7', '2012-01-14', '这门课程有很多经典的地方', '0', '4', '58');
INSERT INTO `coursecomment` VALUES ('8', '2012-01-14', '这门课程有很多经典的地方', '0', '4', '58');
INSERT INTO `coursecomment` VALUES ('9', '2012-01-14', '这门课程有很多经典的地方', '0', '4', '58');
INSERT INTO `coursecomment` VALUES ('10', '2012-02-04', '挺好的', '0', '20', '80');
INSERT INTO `coursecomment` VALUES ('11', '2012-02-08', '123不错', '0', '3', '56');
INSERT INTO `coursecomment` VALUES ('12', '2012-02-10', '非常好', '0', '4', '56');
INSERT INTO `coursecomment` VALUES ('13', '2012-02-14', '这课程真的不错哦', '1', '29', '88');
INSERT INTO `coursecomment` VALUES ('14', '2012-03-12', '12345+6', '0', '61', '172');
INSERT INTO `coursecomment` VALUES ('15', '2012-03-12', '', '0', '61', '172');
INSERT INTO `coursecomment` VALUES ('16', '2012-03-12', '', '0', '61', '172');
INSERT INTO `coursecomment` VALUES ('17', '2012-03-12', 'hkhjlkj', '0', '49', '203');
INSERT INTO `coursecomment` VALUES ('18', '2012-03-12', '', '0', '49', '203');
INSERT INTO `coursecomment` VALUES ('19', '2012-03-12', 'fjalskfj', '0', '49', '203');
INSERT INTO `coursecomment` VALUES ('20', '2012-03-12', '', '0', '49', '203');
INSERT INTO `coursecomment` VALUES ('21', '2012-03-15', '这个课程挺好的', '0', '29', '210');
INSERT INTO `coursecomment` VALUES ('22', '2012-03-22', '', '0', '61', '183');

-- ----------------------------
-- Table structure for `courseevaluation`
-- ----------------------------
DROP TABLE IF EXISTS `courseevaluation`;
CREATE TABLE `courseevaluation` (
  `id` int(11) NOT NULL auto_increment,
  `available` double default NULL,
  `costPerformance` double default NULL,
  `interaction` double default NULL,
  `interest` double default NULL,
  `synthetical` double default NULL,
  `course_id` int(11) default NULL,
  `evaluator_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK4D0BE1D73FD1B1C4` (`evaluator_id`),
  KEY `FK4D0BE1D7ACBD5F77` (`course_id`),
  CONSTRAINT `FK4D0BE1D73FD1B1C4` FOREIGN KEY (`evaluator_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK4D0BE1D7ACBD5F77` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseevaluation
-- ----------------------------
INSERT INTO `courseevaluation` VALUES ('2', '4', '3.5', '3', '3.5', '3.5', '56', '20');
INSERT INTO `courseevaluation` VALUES ('3', '2', '2', '2', '2', '2', '101', '29');
INSERT INTO `courseevaluation` VALUES ('4', '2', '2', '2', '4', '2.5', '184', '19');
INSERT INTO `courseevaluation` VALUES ('5', '2', '2', '2', '2', '2', '185', '52');
INSERT INTO `courseevaluation` VALUES ('6', '4', '3.5', '3.5', '3', '3.5', '174', '2');
INSERT INTO `courseevaluation` VALUES ('7', '2', '2', '2', '2', '2', '172', '61');
INSERT INTO `courseevaluation` VALUES ('8', '5', '5', '5', '4.5', '4.9', '204', '66');
INSERT INTO `courseevaluation` VALUES ('9', '4.5', '5', '5', '4.5', '4.8', '203', '49');
INSERT INTO `courseevaluation` VALUES ('10', '2', '2', '2', '2', '2', '57', '53');
INSERT INTO `courseevaluation` VALUES ('11', '3.5', '4', '4', '3.5', '3.8', '227', '3');

-- ----------------------------
-- Table structure for `courseinvitestudent`
-- ----------------------------
DROP TABLE IF EXISTS `courseinvitestudent`;
CREATE TABLE `courseinvitestudent` (
  `id` int(11) NOT NULL auto_increment,
  `invitedStudentEmail` varchar(255) default NULL,
  `course_id` int(11) default NULL,
  `acceptInvite` bit(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK1CCCFA77ACBD5F77` (`course_id`),
  CONSTRAINT `FK1CCCFA77ACBD5F77` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseinvitestudent
-- ----------------------------
INSERT INTO `courseinvitestudent` VALUES ('1', 'zeng_zeng@hotmail.com', '126', '\0');
INSERT INTO `courseinvitestudent` VALUES ('2', 'hailinchl@yeah.net', '127', '\0');
INSERT INTO `courseinvitestudent` VALUES ('3', '50879504@qq.com', '127', '\0');
INSERT INTO `courseinvitestudent` VALUES ('4', 'hailinchl@yeah.net', '128', '\0');
INSERT INTO `courseinvitestudent` VALUES ('5', '50879504@qq.com', '128', '\0');
INSERT INTO `courseinvitestudent` VALUES ('6', 'elezengz@nus.edu.sg', '129', '\0');
INSERT INTO `courseinvitestudent` VALUES ('7', '83284522@qq.com', '130', '\0');
INSERT INTO `courseinvitestudent` VALUES ('8', 'elezengz@nus.edu.sg', '131', '');
INSERT INTO `courseinvitestudent` VALUES ('9', '', '132', '\0');
INSERT INTO `courseinvitestudent` VALUES ('10', 'zeng_zeng@hotmail.com', '133', '\0');
INSERT INTO `courseinvitestudent` VALUES ('11', 'elezengz@nus.edu.sg', '133', '\0');
INSERT INTO `courseinvitestudent` VALUES ('12', 'hailinchl@yeah.net', '134', '\0');
INSERT INTO `courseinvitestudent` VALUES ('13', 'zeng_zeng@hotmail.com', '135', '\0');
INSERT INTO `courseinvitestudent` VALUES ('14', 'elezengz@nus.edu.sg', '136', '');
INSERT INTO `courseinvitestudent` VALUES ('15', 'elezengz@nus.edu.sg', '137', '');
INSERT INTO `courseinvitestudent` VALUES ('16', 'elewan@nus.edu.sg', '138', '');
INSERT INTO `courseinvitestudent` VALUES ('17', 'elezengl@nus.edu.sg', '139', '');
INSERT INTO `courseinvitestudent` VALUES ('18', 'zeng_zeng@hotmail.com', '140', '');
INSERT INTO `courseinvitestudent` VALUES ('19', 'zeng_zeng@hotmail.com', '141', '');
INSERT INTO `courseinvitestudent` VALUES ('20', 'z@126.com', '142', '\0');
INSERT INTO `courseinvitestudent` VALUES ('21', 'zz@126.com', '143', '\0');
INSERT INTO `courseinvitestudent` VALUES ('22', 'necthl@nus.edu.sg', '144', '');
INSERT INTO `courseinvitestudent` VALUES ('23', '', '145', '\0');
INSERT INTO `courseinvitestudent` VALUES ('24', 'wanghao212@hotmail.com', '146', '');
INSERT INTO `courseinvitestudent` VALUES ('25', 'wanghao212@hotmail.com', '147', '');
INSERT INTO `courseinvitestudent` VALUES ('26', 'zeng_zeng@hotmail.com', '148', '');
INSERT INTO `courseinvitestudent` VALUES ('28', 'zeng_zeng@hotmail.com', '149', '');
INSERT INTO `courseinvitestudent` VALUES ('29', 'zeng_zeng@hotmail.com', '150', '');
INSERT INTO `courseinvitestudent` VALUES ('30', 'elezengz@nus.edu.sg', '150', '');
INSERT INTO `courseinvitestudent` VALUES ('31', 'elezengz@nus.edu.sg', '151', '');
INSERT INTO `courseinvitestudent` VALUES ('32', '1306435903@qq.com', '152', '');
INSERT INTO `courseinvitestudent` VALUES ('33', 'hicestmoi@hotmail.com', '153', '\0');
INSERT INTO `courseinvitestudent` VALUES ('34', 'wanghao212@hotmail.com', '154', '');
INSERT INTO `courseinvitestudent` VALUES ('35', 'wanghao212@hotmail.com', '155', '');
INSERT INTO `courseinvitestudent` VALUES ('37', 'zeng_zeng@hotmail.com', '158', '');
INSERT INTO `courseinvitestudent` VALUES ('38', 'elezengz@nus.edu.sg', '158', '\0');
INSERT INTO `courseinvitestudent` VALUES ('39', 'zlhades@hotmail.com', '163', '\0');
INSERT INTO `courseinvitestudent` VALUES ('40', 'elezengz@nus.edu.sg', '165', '');
INSERT INTO `courseinvitestudent` VALUES ('41', 'zeng_zeng@hotmail.com', '165', '');
INSERT INTO `courseinvitestudent` VALUES ('42', 'zeng_zeng@hotmail.com', '166', '');
INSERT INTO `courseinvitestudent` VALUES ('43', 'elezengz@nus.edu.sg', '166', '');
INSERT INTO `courseinvitestudent` VALUES ('44', 'hailinchl@yeah.net', '169', '\0');
INSERT INTO `courseinvitestudent` VALUES ('45', 'xiaojb@teg.cn', '170', '\0');
INSERT INTO `courseinvitestudent` VALUES ('46', '50879504@qq.com', '171', '');
INSERT INTO `courseinvitestudent` VALUES ('47', '50879504@qq.com', '172', '');
INSERT INTO `courseinvitestudent` VALUES ('48', 'yunjianj@gmail.com', '173', '\0');
INSERT INTO `courseinvitestudent` VALUES ('49', '50879504@qq.com', '174', '');
INSERT INTO `courseinvitestudent` VALUES ('50', 'hailinchl@yeah.net', '174', '');
INSERT INTO `courseinvitestudent` VALUES ('51', 'yhliu02@hotmail.com', '175', '\0');
INSERT INTO `courseinvitestudent` VALUES ('52', 'yhliu02@hotmail.com', '176', '\0');
INSERT INTO `courseinvitestudent` VALUES ('53', 'zeng_zeng@hotmail.com', '177', '');
INSERT INTO `courseinvitestudent` VALUES ('54', 'yanhong.liu@ia.ac.cn', '178', '');
INSERT INTO `courseinvitestudent` VALUES ('55', 'yanhong.liu@hotmail.com', '179', '\0');
INSERT INTO `courseinvitestudent` VALUES ('56', 'zeng_zeng@hotmail.com', '180', '');
INSERT INTO `courseinvitestudent` VALUES ('57', 'yanhong.liu@ia.ac.cn', '181', '\0');
INSERT INTO `courseinvitestudent` VALUES ('58', 'yanhong.liu@ia.ac.cn', '182', '');
INSERT INTO `courseinvitestudent` VALUES ('59', 'zeng_zeng@hotmail.com', '184', '');
INSERT INTO `courseinvitestudent` VALUES ('60', '511941753@qq.com', '185', '');
INSERT INTO `courseinvitestudent` VALUES ('61', 'elezengz@nus.edu.sg', '187', '');
INSERT INTO `courseinvitestudent` VALUES ('62', 'elezengz@nus.edu.sg', '188', '');
INSERT INTO `courseinvitestudent` VALUES ('63', 'zeng_zeng@hotmail.com', '189', '');
INSERT INTO `courseinvitestudent` VALUES ('64', 'zeng_zeng@hotmail.com', '190', '\0');
INSERT INTO `courseinvitestudent` VALUES ('65', 'zeng_zeng@hotmail.com', '191', '');
INSERT INTO `courseinvitestudent` VALUES ('66', 'silencalm@qq.com', '192', '\0');
INSERT INTO `courseinvitestudent` VALUES ('67', 'silencalm@qq.com', '193', '\0');
INSERT INTO `courseinvitestudent` VALUES ('68', 'zeng_zeng@hotmail.com', '194', '');
INSERT INTO `courseinvitestudent` VALUES ('70', '363704159@qq.com', '195', '\0');
INSERT INTO `courseinvitestudent` VALUES ('72', 'zengzeng@teg.cn', '156', '\0');
INSERT INTO `courseinvitestudent` VALUES ('73', 'elezengz@nus.edu.sg', '196', '');
INSERT INTO `courseinvitestudent` VALUES ('74', 'elezengz@nus.edu.sg', '197', '');
INSERT INTO `courseinvitestudent` VALUES ('75', 'silencalm@gmail.com', '198', '\0');
INSERT INTO `courseinvitestudent` VALUES ('76', '1@1.com', '199', '\0');
INSERT INTO `courseinvitestudent` VALUES ('77', '1@1.com', '200', '\0');
INSERT INTO `courseinvitestudent` VALUES ('78', '363704159@qq.com', '201', '');
INSERT INTO `courseinvitestudent` VALUES ('80', '838063944@qq.com', '203', '');
INSERT INTO `courseinvitestudent` VALUES ('81', '1009775755@qq.com', '202', '');
INSERT INTO `courseinvitestudent` VALUES ('82', '1009775755@qq.com', '204', '');
INSERT INTO `courseinvitestudent` VALUES ('83', 'elezengz@nus.edu.sg', '207', '');
INSERT INTO `courseinvitestudent` VALUES ('84', 'daisuke.shudo@jmap.sg', '208', '');
INSERT INTO `courseinvitestudent` VALUES ('85', 'zeng_zeng@hotmail.com', '209', '');
INSERT INTO `courseinvitestudent` VALUES ('88', 'lingfangzeng@gmail.com', '211', '');
INSERT INTO `courseinvitestudent` VALUES ('91', 'lingfangzeng@gmail.com', '210', '\0');
INSERT INTO `courseinvitestudent` VALUES ('92', 'yangwang5@msn.com', '210', '\0');
INSERT INTO `courseinvitestudent` VALUES ('94', '50879504@qq', '213', '\0');
INSERT INTO `courseinvitestudent` VALUES ('95', '50879504@qq.com', '214', '\0');
INSERT INTO `courseinvitestudent` VALUES ('96', 'silencalm@gmail.com', '215', '\0');
INSERT INTO `courseinvitestudent` VALUES ('97', 'silencalm@qq.com', '216', '\0');
INSERT INTO `courseinvitestudent` VALUES ('98', 'silencalm@qq.com', '217', '\0');
INSERT INTO `courseinvitestudent` VALUES ('99', 'wangyang5@msn.com', '218', '\0');
INSERT INTO `courseinvitestudent` VALUES ('100', 'yangwang5@msn.com', '212', '\0');
INSERT INTO `courseinvitestudent` VALUES ('101', '1009775755@qq.com', '219', '');
INSERT INTO `courseinvitestudent` VALUES ('102', 'zengzeng@teg.cn', '220', '\0');
INSERT INTO `courseinvitestudent` VALUES ('103', 'hailinchl@yeah.net', '221', '');
INSERT INTO `courseinvitestudent` VALUES ('105', 'zengzeng@teg.cn', '222', '\0');
INSERT INTO `courseinvitestudent` VALUES ('106', 'elezengz@nus.edu.sg', '224', '\0');
INSERT INTO `courseinvitestudent` VALUES ('107', '1009775755@qq.com', '225', '\0');
INSERT INTO `courseinvitestudent` VALUES ('108', 'zengzeng@teg.cn', '226', '\0');
INSERT INTO `courseinvitestudent` VALUES ('109', 'zeng_zeng@hotmail.com', '227', '\0');
INSERT INTO `courseinvitestudent` VALUES ('110', 'zengzeng@teg.cn', '228', '\0');
INSERT INTO `courseinvitestudent` VALUES ('111', '654581728@qq.com', '229', '');
INSERT INTO `courseinvitestudent` VALUES ('112', 'zeng_zeng@hotmail.com', '231', '');
INSERT INTO `courseinvitestudent` VALUES ('113', '1009775755@qq.com', '232', '\0');
INSERT INTO `courseinvitestudent` VALUES ('114', 'zengzeng@teg.cn', '233', '\0');
INSERT INTO `courseinvitestudent` VALUES ('115', 'elezengz@nus.edu.sg', '234', '\0');
INSERT INTO `courseinvitestudent` VALUES ('116', 'elezengz@nus.edu.sg', '235', '\0');
INSERT INTO `courseinvitestudent` VALUES ('117', 'chengwang1988@126.com', '236', '\0');
INSERT INTO `courseinvitestudent` VALUES ('118', 'chengwang1988@126.com', '237', '');
INSERT INTO `courseinvitestudent` VALUES ('119', 'chengwang1988@126.com', '238', '');
INSERT INTO `courseinvitestudent` VALUES ('120', 'yan_521314@yahoo.com.cn', '239', '');
INSERT INTO `courseinvitestudent` VALUES ('122', '654581728@qq.com', '242', '\0');
INSERT INTO `courseinvitestudent` VALUES ('123', '654581728@qq.com', '243', '\0');
INSERT INTO `courseinvitestudent` VALUES ('124', '123199239@qq.com', '241', '\0');
INSERT INTO `courseinvitestudent` VALUES ('125', 'cs57177@126.com', '244', '');
INSERT INTO `courseinvitestudent` VALUES ('126', '2584743921@qq.com', '245', '\0');
INSERT INTO `courseinvitestudent` VALUES ('127', 's1642wuk@163.com', '246', '\0');
INSERT INTO `courseinvitestudent` VALUES ('128', 's1642wuk@163.com', '247', '');
INSERT INTO `courseinvitestudent` VALUES ('129', 'zeng_zeng@hotmail.com', '248', '\0');
INSERT INTO `courseinvitestudent` VALUES ('130', 'zeng_zeng@hotmail.com', '249', '');

-- ----------------------------
-- Table structure for `coursequestion`
-- ----------------------------
DROP TABLE IF EXISTS `coursequestion`;
CREATE TABLE `coursequestion` (
  `id` int(11) NOT NULL auto_increment,
  `description` varchar(255) default NULL,
  `isAnswered` bit(1) default NULL,
  `putTime` date default NULL,
  `course_id` int(11) default NULL,
  `questioner_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK543E0141ACBD5F77` (`course_id`),
  KEY `FK543E0141EA1E9860` (`questioner_id`),
  CONSTRAINT `FK543E0141ACBD5F77` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FK543E0141EA1E9860` FOREIGN KEY (`questioner_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursequestion
-- ----------------------------
INSERT INTO `coursequestion` VALUES ('1', '我有一个问题', '\0', '2012-02-10', '56', '4');
INSERT INTO `coursequestion` VALUES ('2', 'no idea', '\0', '2012-03-03', '183', '19');

-- ----------------------------
-- Table structure for `courseresource`
-- ----------------------------
DROP TABLE IF EXISTS `courseresource`;
CREATE TABLE `courseresource` (
  `id` int(11) NOT NULL auto_increment,
  `description` varchar(255) default NULL,
  `estimateTime` date default NULL,
  `fullPath` varchar(255) default NULL,
  `provideTime` date default NULL,
  `sourceTitle` varchar(255) default NULL,
  `course_id` int(11) default NULL,
  `provider_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK85678969A245A4C2` (`provider_id`),
  KEY `FK85678969ACBD5F77` (`course_id`),
  CONSTRAINT `FK85678969A245A4C2` FOREIGN KEY (`provider_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK85678969ACBD5F77` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courseresource
-- ----------------------------
INSERT INTO `courseresource` VALUES ('2', '', null, 'E:\\Dev\\jboss-as-web-7.0.2.Final\\standalone\\deployments\\ROOT.war\\download\\resource/20/null', '2012-02-04', null, '56', '20');
INSERT INTO `courseresource` VALUES ('3', '一只考拉', null, 'E:\\Dev\\jboss-as-web-7.0.2.Final\\standalone\\deployments\\ROOT.war\\download\\resource/4/Koala.jpg', '2012-02-10', 'Koala.jpg', '56', '4');
INSERT INTO `courseresource` VALUES ('4', '', null, 'E:\\Dev\\jboss-as-web-7.0.2.Final\\standalone\\deployments\\ROOT.war\\download\\resource/61/[edubt]字幕.rar', '2012-03-22', '[edubt]字幕.rar', '183', '61');
INSERT INTO `courseresource` VALUES ('5', '', null, 'E:\\Dev\\jboss-as-web-7.0.2.Final\\standalone\\deployments\\ROOT.war\\download\\resource/61/[edubt]字幕.rar', '2012-03-22', '[edubt]字幕.rar', '183', '61');
INSERT INTO `courseresource` VALUES ('6', '', null, 'E:\\Dev\\jboss-as-web-7.0.2.Final\\standalone\\deployments\\ROOT.war\\download\\resource/61/[edubt]字幕.rar', '2012-03-22', '[edubt]字幕.rar', '183', '61');

-- ----------------------------
-- Table structure for `follows`
-- ----------------------------
DROP TABLE IF EXISTS `follows`;
CREATE TABLE `follows` (
  `MemberShip_id` int(11) NOT NULL,
  `follows_id` int(11) NOT NULL,
  PRIMARY KEY  (`MemberShip_id`,`follows_id`),
  KEY `FKD74A3AE2AE707E31` (`follows_id`),
  KEY `FKD74A3AE2E3B89CBD` (`MemberShip_id`),
  CONSTRAINT `FKD74A3AE2AE707E31` FOREIGN KEY (`follows_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FKD74A3AE2E3B89CBD` FOREIGN KEY (`MemberShip_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follows
-- ----------------------------

-- ----------------------------
-- Table structure for `freestudent`
-- ----------------------------
DROP TABLE IF EXISTS `freestudent`;
CREATE TABLE `freestudent` (
  `freeCourse_id` int(11) NOT NULL,
  `freeStudent_id` int(11) NOT NULL,
  PRIMARY KEY  (`freeCourse_id`,`freeStudent_id`),
  KEY `FKED4ADA0FE5B34BA4` (`freeStudent_id`),
  KEY `FKED4ADA0F4141C28B` (`freeCourse_id`),
  CONSTRAINT `FKED4ADA0F4141C28B` FOREIGN KEY (`freeCourse_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FKED4ADA0FE5B34BA4` FOREIGN KEY (`freeStudent_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of freestudent
-- ----------------------------

-- ----------------------------
-- Table structure for `inviterelationship`
-- ----------------------------
DROP TABLE IF EXISTS `inviterelationship`;
CREATE TABLE `inviterelationship` (
  `id` int(11) NOT NULL auto_increment,
  `invitedCode` varchar(255) default NULL,
  `competitionSessionId_id` int(11) default NULL,
  `inviteder_id` int(11) default NULL,
  `inviter_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKF73270018F17291C` (`competitionSessionId_id`),
  KEY `FKF73270016EAB912A` (`inviter_id`),
  KEY `FKF73270015488F6EB` (`inviteder_id`),
  CONSTRAINT `FKF73270015488F6EB` FOREIGN KEY (`inviteder_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FKF73270016EAB912A` FOREIGN KEY (`inviter_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FKF73270018F17291C` FOREIGN KEY (`competitionSessionId_id`) REFERENCES `competitionsession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inviterelationship
-- ----------------------------

-- ----------------------------
-- Table structure for `membership`
-- ----------------------------
DROP TABLE IF EXISTS `membership`;
CREATE TABLE `membership` (
  `id` int(11) NOT NULL auto_increment,
  `ableToLogon` bit(1) default NULL,
  `activeCode` varchar(255) default NULL,
  `answer` varchar(255) default NULL,
  `cardId` varchar(255) default NULL,
  `dueDate` datetime default NULL,
  `email` varchar(255) default NULL,
  `failedPasswordAnswerAttemptCount` int(11) default NULL,
  `failedPasswordAttemptCount` int(11) default NULL,
  `isLive` bit(1) default NULL,
  `isLockedOut` bit(1) default NULL,
  `lastLoginDate` datetime default NULL,
  `nickName` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `pic` varchar(255) default NULL,
  `question` varchar(255) default NULL,
  `regDate` datetime default NULL,
  `regIp` varchar(255) default NULL,
  `sexy` bit(1) default NULL,
  `telphone` varchar(255) default NULL,
  `timeZone` int(11) default NULL,
  `userName` varchar(255) default NULL,
  `userType` int(11) default NULL,
  `zhiBi` double default NULL,
  `zhiQuan` double default NULL,
  `isCompletedAlInfo` bit(1) default NULL,
  `birthDay` datetime default NULL,
  `idCardUrl` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of membership
-- ----------------------------
INSERT INTO `membership` VALUES ('1', '', null, null, '430721198209202815', '2011-11-29 16:16:11', 'zlhades@hotmail.com', '0', '0', '', '\0', '2012-03-13 13:01:27', 'Benson', '202CB962AC59075B964B07152D234B70', 'upload/images/1/0.png', null, '2011-11-29 16:16:11', '', '', '13807482200', '8', '张林', '0', '2000', '2000', null, null, null);
INSERT INTO `membership` VALUES ('2', '', '33ECF00202D3C8F685149C9901F2F6FC', null, '430203197412190018', '2011-11-29 16:17:04', 'zengzeng@teg.cn', '0', '0', '', '\0', '2012-03-23 16:30:04', 'TaoTao', '202CB962AC59075B964B07152D234B70', 'upload/images/2/0.jpg', null, '2011-11-29 16:17:04', '', '\0', '13762272506', '8', 'zengzeng', '0', '0', '88', null, '2012-02-29 16:00:00', 'upload/user/2/idCard/2012030509394048132.jpg');
INSERT INTO `membership` VALUES ('3', '', 'CF66023C64B5D9765DDA34CFFF7F3407', null, '431202198910150018', '2011-11-29 16:24:30', '50879504@qq.com', '0', '0', '', '\0', '2012-03-24 09:04:17', '小海哥', '202CB962AC59075B964B07152D234B70', 'upload/images/3/0.jpg', null, '2011-11-29 16:24:30', '', '\0', '111111111111', '8', '', '0', '0', '100', null, '2012-03-13 16:00:00', 'upload/user/3/idCard/2012031603141694406.png');
INSERT INTO `membership` VALUES ('4', '', '021EC6E1D14DC2CA7790B766B218F525', null, '', '2011-11-29 20:13:45', 'silencalm@qq.com', '0', '0', '', '\0', '2012-03-13 03:43:58', '顽石', '7051D5BC88FEA594D79C870003FFD389', 'upload/images/4/0.jpg', null, '2011-11-29 20:13:45', '', '\0', '', '8', 'jiajun', '0', '0', '88', null, '2012-03-13 16:00:00', null);
INSERT INTO `membership` VALUES ('5', '', '1071161BC8350706EA548FC62E4DCE70', null, null, '2011-11-29 20:31:27', 'yangwang5@msn.com', '0', '0', '', '', '2012-03-14 02:36:57', null, '80F103038AE7D0058150B966B7519EC6', null, null, '2011-11-29 20:31:27', '', '\0', null, '8', null, '0', '0', '100', null, null, null);
INSERT INTO `membership` VALUES ('6', '', '77C0C078B216A6C216F3A1E599DFAD29', null, null, '2011-11-29 21:27:01', '228949324@qq.com', '0', '0', '', '\0', '2012-03-19 14:50:23', null, '202CB962AC59075B964B07152D234B70', null, null, '2011-11-29 21:27:01', '', '\0', null, '8', null, '0', '0', '100', null, null, null);
INSERT INTO `membership` VALUES ('7', '', 'A0E53770B1267447FA2F69620F9C0702', null, null, '2011-11-29 21:32:24', '995015739@qq.com', '0', '0', '', '\0', '2011-11-29 21:32:24', null, '202CB962AC59075B964B07152D234B70', null, null, '2011-11-29 21:32:24', '', '\0', null, '8', null, '0', '0', '100', null, null, null);
INSERT INTO `membership` VALUES ('8', '', '10CF1FB0B990F9A01C7AA8639B8DA84C', null, null, '2011-11-30 10:44:14', 'zenglingfang@gmail.com', '0', '0', '', '\0', '2011-12-02 12:37:17', null, 'DC4133E6C2E5ED3643C497FED09EAA54', null, null, '2011-11-30 10:44:14', '', '\0', null, '8', null, '0', '0', '100', null, null, null);
INSERT INTO `membership` VALUES ('9', '', 'C842DE97A2B93E32FCC59DA8AAC98D31', null, null, '2011-11-30 10:46:25', 'elezengl@nus.edu.sg', '0', '0', '', '\0', '2011-12-02 12:38:23', null, 'DC4133E6C2E5ED3643C497FED09EAA54', null, null, '2011-11-30 10:46:25', '', '\0', null, '8', null, '0', '0', '100', null, null, null);
INSERT INTO `membership` VALUES ('10', '', '571198A3369D52A24EFC822DC4754CD4', null, '', '2011-11-30 14:59:29', '', '0', '0', '', '', '2011-11-30 14:59:29', null, 'D41D8CD98F00B204E9800998ECF8427E', null, null, '2011-11-30 14:59:29', '', null, '', '8', '', '0', '0', '100', null, null, null);
INSERT INTO `membership` VALUES ('11', '', 'CAEAD40A11608CF30ABE3D1B990D8927', null, null, '2011-12-01 16:44:41', 'elelucas@nus.edu.sg', '0', '0', '', '\0', '2011-12-02 21:05:29', null, '202CB962AC59075B964B07152D234B70', null, null, '2011-12-01 16:44:41', '', '\0', null, '8', null, '0', '0', '100', null, null, null);
INSERT INTO `membership` VALUES ('12', '', 'E357D8FBC2BC4E473EF308972BC681BB', null, null, '2011-12-02 16:40:37', 'sammilea1229@hotmaiL.com', '0', '0', '', '', '2011-12-02 16:40:37', null, '202CB962AC59075B964B07152D234B70', null, null, '2011-12-02 16:40:37', '', '\0', null, '8', null, '0', '0', '100', null, null, null);
INSERT INTO `membership` VALUES ('13', '', 'FF262E6A25AC81D52B7C795C4EC5855B', null, '', '2011-12-02 17:20:47', 'yan_521314@yahoo.com.cn', '0', '0', '', '\0', '2011-12-02 20:58:50', '言', '202CB962AC59075B964B07152D234B70', 'upload/user/13/0.jpg', null, '2011-12-02 17:20:47', '', '\0', null, '8', '言', '0', '0', '100', null, null, null);
INSERT INTO `membership` VALUES ('14', '', 'A66CDAA26EAB254F6EB6BB2BE55DCB41', null, null, '2012-01-06 08:05:45', '19816831@qq.com', '0', '0', '', '\0', '2012-01-06 08:05:45', null, 'E10ADC3949BA59ABBE56E057F20F883E', null, null, '2012-01-06 08:05:45', '', '\0', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('15', '', 'A5A25FD7BB766AE5B45EB4E153D51F7F', null, '', '2012-01-11 14:52:45', '478763120@qq.com', '0', '0', '', '\0', '2012-03-13 07:46:59', '泡泡雪儿', 'DA13B70C16FC3648F118834A584252FE', 'upload/images/15/0.jpg', null, '2012-01-11 14:52:45', '', '\0', null, '8', '泡泡雪儿', '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('16', '', '00DA30F29DC26073DA37BEE0C1439827', null, '131102198810203438', '2012-01-13 15:10:05', '83284522@qq.com', '0', '0', '', '\0', '2012-03-23 16:29:44', 'AN', '202CB962AC59075B964B07152D234B70', 'upload/images/16/0.jpg', null, '2012-01-13 15:10:05', '', '\0', null, '8', '成安', '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('17', '', '0E8AD40E13BE4ABFC2812DA0226417B0', null, '', '2012-01-13 15:16:42', 'elezengz@nus.edu.sg', '0', '0', '', '\0', '2012-03-23 16:28:30', 'Hello', '202CB962AC59075B964B07152D234B70', 'upload/images/17/0.jpg', null, '2012-01-13 15:16:42', '', '\0', null, '8', '', '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('18', '', 'E21A1B98000BBE5A51477B6B0E5B724B', null, null, '2012-02-04 06:13:05', 'wwhuan1989@126.com', '0', '0', '', '', '2012-02-04 06:13:05', null, '3036C5F29C90BB269381F8E7B0D51894', null, null, '2012-02-04 06:13:05', '', '\0', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('19', '', '899B36E6454349DA667A7BF82CC82D9D', null, '430203197412190018', '2012-02-04 06:27:38', 'zeng_zeng@hotmail.com', '0', '0', '', '\0', '2012-03-24 07:11:14', 'GoGoWise', '202CB962AC59075B964B07152D234B70', 'upload/images/19/0.jpg', null, '2012-02-04 06:27:38', '', '', '13762272506', '8', '曾锃', '0', '0', '200', '\0', '1974-12-18 16:00:00', null);
INSERT INTO `membership` VALUES ('20', '', '38191E60CC47C9271F40676832764FD3', null, '', '2012-02-04 06:32:02', '729109380@qq.com', '0', '0', '', '\0', '2012-02-21 14:21:55', 'ocean', '3036C5F29C90BB269381F8E7B0D51894', 'upload/images/20/0.jpg', null, '2012-02-04 06:32:02', '', '\0', null, '8', 'wuhuan', '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('21', '', 'B2493A1FD015A960CDF32EC978B4BFAC', null, null, '2012-02-09 11:54:56', 'zengng@teg.cn', '0', '0', '', '', '2012-02-09 11:54:56', 'best_chl_gl', '202CB962AC59075B964B07152D234B70', null, null, '2012-02-09 11:54:56', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('22', '', 'CE6A8AABD84103CB2DB304C71B663CED', null, null, '2012-02-09 12:19:18', 'zengzeng@google.com', '0', '0', '', '\0', '2012-02-14 06:42:39', 'TT', '202CB962AC59075B964B07152D234B70', null, null, '2012-02-09 12:19:18', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('23', '', '8B75B4D437C8EB95FCAE55F18E92D46B', null, null, '2012-02-09 12:21:16', 'tt@google.com', '0', '0', '', '', '2012-02-09 12:21:16', 'TT', '202CB962AC59075B964B07152D234B70', null, null, '2012-02-09 12:21:16', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('24', '', '109EB32B9253C555AB3F7D6CAD4E79F4', null, '', '2012-02-09 15:07:35', 'followlord@163.com', '0', '0', '', '\0', '2012-02-29 15:50:15', 'william', '202CB962AC59075B964B07152D234B70', '', null, '2012-02-09 15:07:35', '', '\0', null, '8', 'cheung', '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('25', '', '4C550CE9D9078D7EC50DB429BC9E1683', null, null, '2012-02-10 09:08:17', 'partyguest@126.com', '0', '0', '', '', '2012-02-10 09:08:17', '小海哥', '202CB962AC59075B964B07152D234B70', null, null, '2012-02-10 09:08:17', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('26', '', 'F3B0428663380FFF98C096F21F548A22', null, null, '2012-02-10 09:19:08', 'elezengz1@nus.edu.sg', '0', '0', '', '', '2012-02-10 09:19:08', 'TT', '202CB962AC59075B964B07152D234B70', null, null, '2012-02-10 09:19:08', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('27', '', '9F25295CAB47DFC9C0A309BC4598172C', null, null, '2012-02-11 03:20:08', '285215392@qq.com', '0', '0', '', '', '2012-02-11 03:20:08', null, 'E7E4869843B578D4A3CB8C9F1559A7E7', null, null, '2012-02-11 03:20:08', '', '\0', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('28', '', '22C0B608B4C2BA6812EF87CACEB9C4E1', null, null, '2012-02-11 05:49:14', '123@qq.com', '0', '0', '', '', '2012-02-11 05:49:14', '', '202CB962AC59075B964B07152D234B70', null, null, '2012-02-11 05:49:14', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('29', '', '376CE741C27FC87301D317E82C02084E', null, '341224198806108235', '2012-02-12 05:59:38', '422104389@qq.com', '0', '0', '', '\0', '2012-03-24 05:47:54', '那年此时', '2A71152B38AD5A23D8F1DA9C744DA054', 'upload/images/29/0.jpg', null, '2012-02-12 05:59:38', '', '', '432432423', '8', '4123412312', '0', '0', '200', '\0', '2012-02-29 16:00:00', 'upload/user/29/idCard/2012031217521856192.jpg');
INSERT INTO `membership` VALUES ('30', '', '154B2D35875E99CB1CB215B2ADD6E181', null, null, '2012-02-12 09:10:54', 'zeng_zeng@hotmiail.com', '0', '0', '', '\0', '2012-03-03 12:50:08', null, '202CB962AC59075B964B07152D234B70', null, null, '2012-02-12 09:10:54', '', '\0', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('31', '', '5190004095E9C4640A5DFDE19CB43E0D', null, null, '2012-02-15 08:54:54', '441599204@qq.com', '0', '0', '', '\0', '2012-02-27 09:07:05', null, '7BA6F30F6AAD55ADE5CA0E378817E7D2', null, null, '2012-02-15 08:54:54', '', '\0', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('32', '', '489AD44C00EBE829F28031E348EA5239', null, null, '2012-02-16 02:24:13', '380355912@qq.com', '0', '0', '', '\0', '2012-02-16 02:39:44', null, '4FFB3B777A1D1E89513222A37DB9F971', null, null, '2012-02-16 02:24:13', '', '\0', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('33', '', '7C6527B00D80FDA6CC7040D103333ECA', null, null, '2012-02-16 08:18:12', '1227971082@qq.com', '0', '0', '', '', '2012-02-16 08:18:12', null, 'E10ADC3949BA59ABBE56E057F20F883E', null, null, '2012-02-16 08:18:13', '', '\0', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('34', '', 'D7F81814DE005F9467278A8E8998D67C', null, null, '2012-02-16 08:36:55', '2528570717@qq.com', '0', '0', '', '', '2012-02-16 08:36:55', '天天', '202CB962AC59075B964B07152D234B70', null, null, '2012-02-16 08:36:55', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('35', '', '8E7160B63F99936F9FF5AB6A32C66CB6', null, null, '2012-02-16 09:08:41', 'tt@123.com', '0', '0', '', '', '2012-02-16 09:08:41', 'TTT', '202CB962AC59075B964B07152D234B70', null, null, '2012-02-16 09:08:41', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('36', '', 'B180B84BFC54B0C341DF4A36BAD66E8D', null, null, '2012-02-16 09:12:39', 'aa@11.com', '0', '0', '', '', '2012-02-16 09:12:39', '', '202CB962AC59075B964B07152D234B70', null, null, '2012-02-16 09:12:39', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('37', '', '677275F3FF82AA5F9D827FDFD5745CFA', null, null, '2012-02-16 09:12:53', 'tt@qq.com', '0', '0', '', '', '2012-02-16 09:12:53', '', '202CB962AC59075B964B07152D234B70', null, null, '2012-02-16 09:12:53', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('38', '', '7A602B02CF66BBA2009F4E8911CF9BDB', null, null, '2012-02-16 09:13:15', '444@qq.com', '0', '0', '', '', '2012-02-16 09:13:15', '', '202CB962AC59075B964B07152D234B70', null, null, '2012-02-16 09:13:15', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('39', '', 'AF8C01C96AAEA4C6E9F7C7BDCFF96ECA', null, null, '2012-02-21 10:52:20', '1018645428@qq.com', '0', '0', '', '', '2012-02-21 10:52:20', null, 'E10ADC3949BA59ABBE56E057F20F883E', null, null, '2012-02-21 10:52:20', '', '\0', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('40', '', null, null, null, '2012-02-22 11:50:25', 'elewan@nus.edu.sg', '0', '0', '', '\0', '2012-02-22 11:50:25', 'wang', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, '2012-02-22 11:50:25', '', null, null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('41', '', null, null, null, '2012-02-23 03:24:17', 'necthl@nus.edu.sg', '0', '0', '', '\0', '2012-02-23 03:24:17', 'test1', '1406F37190E825427440BC020919218A', null, null, '2012-02-23 03:24:17', '', null, null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('42', '', null, null, null, '2012-02-24 02:07:05', 'wanghao212@hotmail.com', '0', '0', '', '\0', '2012-02-28 14:53:55', '风月无边', '75585AB0BDD5B39659C96DA2BF8654EA', null, null, '2012-02-24 02:07:05', '', null, null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('43', '', '79685137080FBC28581971B3C3C05188', null, null, '2012-02-25 15:18:55', '1054861740@qq.com', '0', '0', '', '\0', '2012-02-25 15:18:55', null, '18BEC96AFE82F884841BA2EDD23CE056', null, null, '2012-02-25 15:18:55', '', '\0', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('44', '', '352340C53867FA9198A3F1AE9A65A320', null, null, '2012-02-25 16:02:23', '118171020115@qq.com', '0', '0', '', '', '2012-02-25 16:02:23', '', '202CB962AC59075B964B07152D234B70', null, null, '2012-02-25 16:02:23', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('45', '', 'B2111DE0163257B6B9E00582455C10F4', null, null, '2012-02-27 04:08:05', 'silencalm@gmail.com', '0', '0', '', '', '2012-02-27 04:08:05', null, '7051D5BC88FEA594D79C870003FFD389', null, null, '2012-02-27 04:08:05', '', '\0', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('46', '', 'C358FFBBDA1564E590F7395DD140E2EA', null, '', '2012-02-27 04:16:03', '1747514078@qq.com', '0', '0', '', '\0', '2012-02-27 04:16:03', 'silen', '7051D5BC88FEA594D79C870003FFD389', '', null, '2012-02-27 04:16:03', '', '\0', null, '8', '李佳俊', '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('47', '', null, null, null, '2012-02-27 08:18:34', '1306435903@qq.com', '0', '0', '', '\0', '2012-02-27 08:18:34', 'jeanne', '73882AB1FA529D7273DA0DB6B49CC4F3', null, null, '2012-02-27 08:18:34', '', null, null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('48', '', '28E0AE5617431363E1849D75422708E1', null, '430723198909067813', '2012-02-28 03:12:51', 'hailinchl@yeah.net', '0', '0', '', '\0', '2012-03-14 10:15:32', 'guoxiaosi', '202CB962AC59075B964B07152D234B70', 'upload/user/48/0.jpg', null, '2012-02-28 03:12:51', '', '\0', null, '8', 'hailinchl', '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('49', '', 'D1D18C8156DC0CCC10D2F35A6A0FC657', null, null, '2012-03-01 12:17:10', '838063944@qq.com', '0', '0', '', '\0', '2012-03-15 14:27:51', null, '5A59BB632B76A307414755E0DEDD45DA', null, null, '2012-03-01 12:17:10', '', '\0', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('50', '', 'ADD63518AA8D0D53D4029847BA30EAF5', null, null, '2012-03-03 09:49:50', 'yhliu02@hotmail.com', '0', '0', '', '\0', '2012-03-03 12:41:44', 'littlefish', '182C4BAFB0B8E5972321BC9384C3EF93', null, null, '2012-03-03 09:49:50', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('51', '', null, null, null, '2012-03-03 10:01:09', 'yanhong.liu@ia.ac.cn', '0', '0', '', '\0', '2012-03-03 10:01:09', 'hi', '182C4BAFB0B8E5972321BC9384C3EF93', null, null, '2012-03-03 10:01:09', '', null, null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('52', '', '73AFD349C5B7F24D9E622D903549C832', null, null, '2012-03-04 05:34:58', '511941753@qq.com', '0', '0', '', '\0', '2012-03-04 05:34:58', '炊烟', 'D186DBEE846BF13C89E7D60189C9CA09', null, null, '2012-03-04 05:34:58', '', null, null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('53', '', '4589397037368B9BD466B888BF75A70A', null, null, '2012-03-05 14:48:48', '1131022516@qq.com', '0', '0', '', '', '2012-03-16 09:27:42', 'cp123', '92005281BC064BAE353FABFAFDEB25F7', null, null, '2012-03-05 14:48:48', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('54', '', '8D1156B6445A4228ADB174E7D1EDF69C', null, null, '2012-03-11 09:05:28', '2449782456@qq.com', '0', '0', '', '\0', '2012-03-11 09:05:28', '测试1', '9AB7AB9A0EF3F278A9E786521E5D76C0', null, null, '2012-03-11 09:05:28', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('55', '', '1A460FB784DA72DBCD71FAD6AD86FCD5', null, null, '2012-03-11 09:08:02', 'gogowise@163.com', '0', '0', '', '', '2012-03-11 09:08:02', '测试2', '9AB7AB9A0EF3F278A9E786521E5D76C0', null, null, '2012-03-11 09:08:02', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('56', '', '0F34ACE886DA0A5F86787636C06AB01F', null, null, '2012-03-11 09:12:51', 'gogowise123@126.com', '0', '0', '', '', '2012-03-11 09:12:51', '测试3', '9AB7AB9A0EF3F278A9E786521E5D76C0', null, null, '2012-03-11 09:12:51', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('57', '', '58824720911F66B059A82EC1A6D342A4', null, null, '2012-03-11 09:15:52', 'gogowise@sohu.com', '0', '0', '', '', '2012-03-11 09:15:52', '测试4', '9AB7AB9A0EF3F278A9E786521E5D76C0', null, null, '2012-03-11 09:15:52', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('58', '', 'FCAE40E4099FADA2029A171FBFC8B8B6', null, null, '2012-03-11 09:22:00', 'gogowise@sina.com', '0', '0', '', '', '2012-03-11 09:22:00', '测试5', '9AB7AB9A0EF3F278A9E786521E5D76C0', null, null, '2012-03-11 09:22:00', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('59', '', '6FFCAB97EF6F91D740D26731AE09AB87', null, null, '2012-03-11 09:24:03', 'gogowise@tom.com', '0', '0', '', '', '2012-03-11 09:24:03', '测试6', '9AB7AB9A0EF3F278A9E786521E5D76C0', null, null, '2012-03-11 09:24:03', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('60', '', '6E1961DC71081FFD0873BD0CF27EB753', null, null, '2012-03-11 12:27:52', '100775755@qq.com', '0', '0', '', '', '2012-03-11 12:27:52', '果小思', '5010B1BEB0B050F810FA0827BD329EE7', null, null, '2012-03-11 12:27:52', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('61', '', '532CFF33A97C889BC51AE061DA21488C', null, null, '2012-03-12 05:13:02', 'hellohotbear@139.com', '0', '0', '', '\0', '2012-03-22 08:27:47', 'hellobear', '918D63CF0464811452B5355E151D3605', null, null, '2012-03-12 05:13:02', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('62', '', '4D0AD1140C23ACB1BEC337A38BAE331B', null, null, '2012-03-12 10:38:18', 'test@test.com', '0', '0', '', '', '2012-03-12 10:38:18', 'Test', '202CB962AC59075B964B07152D234B70', null, null, '2012-03-12 10:38:18', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('63', '', '912A0F302914DEAC36393307345DFF04', null, null, '2012-03-12 12:25:46', '363704159@qq.com', '0', '0', '', '', '2012-03-12 12:25:46', 'Snowman', 'B28B05B5C8E602A4D4EBB9122842F249', null, null, '2012-03-12 12:25:46', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('64', '', '93B2795466C6D2D8D08F5F37C5750357', null, null, '2012-03-12 12:58:01', '2228119123@qq.com', '0', '0', '', '', '2012-03-12 12:58:01', '测试7', '9AB7AB9A0EF3F278A9E786521E5D76C0', null, null, '2012-03-12 12:58:01', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('65', '', '34A64209776FD27F2285C5DE248EB3A9', null, null, '2012-03-12 14:36:23', 'qinshipb2010@163.com', '0', '0', '', '', '2012-03-15 14:29:42', '不凡', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, '2012-03-12 14:36:23', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('66', '', null, null, null, '2012-03-12 14:44:01', '1009775755@qq.com', '0', '0', '', '\0', '2012-03-12 14:52:37', '果小思', '5010B1BEB0B050F810FA0827BD329EE7', null, null, '2012-03-12 14:44:01', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('67', '', null, null, null, '2012-03-13 05:45:32', 'daisuke.shudo@jmap.sg', '0', '0', '', '\0', '2012-03-14 05:41:24', 'Duke', 'DEA88EE328F363914DD05D3550E3B2D3', null, null, '2012-03-13 05:45:32', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('68', '', '9705397F0837FA4AA34615A28FD345EC', null, null, '2012-03-13 08:30:20', '252491497@qq.com', '0', '0', '', '', '2012-03-13 08:30:20', '雾夜飞鹰', 'C3A3F8DC3E3313752ECF0B110C7B30C1', null, null, '2012-03-13 08:30:20', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('69', '', '009A911B771BE63023E7D0DD60F27784', null, null, '2012-03-13 09:19:28', '394366927@qq.com', '0', '0', '', '', '2012-03-13 09:19:28', '宁', '5A59BB632B76A307414755E0DEDD45DA', null, null, '2012-03-13 09:19:28', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('70', '', 'A5614AA71AF4B1CFA96A5C513AB1F4A8', null, null, '2012-03-13 15:03:55', 'liking025@163.com', '0', '0', '', '', '2012-03-13 15:03:55', '东东坊', '68C6FAF97B5CFCFB6226CAF9A77D09FB', null, null, '2012-03-13 15:03:55', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('71', '', null, null, null, '2012-03-14 02:15:05', 'lingfangzeng@gmail.com', '0', '0', '', '\0', '2012-03-14 02:15:05', 'nikeson', 'F431A3E20FA83C4E328402E41CB63D46', null, null, '2012-03-14 02:15:05', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('72', '', null, null, null, '2012-03-15 11:00:14', '654581728@qq.com', '0', '0', '', '\0', '2012-03-15 11:00:14', 'fly', 'A6B19AC665D2C7F570D931740788613D', null, null, '2012-03-15 11:00:14', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('73', '', '1B48AC0846944B87070D736CF25F2920', null, null, '2012-03-19 08:05:50', '765363846@qq.com', '0', '0', '', '', '2012-03-19 08:05:50', '蓝石头lx', '340D1216D2990DE7FE793B19D4C91997', null, null, '2012-03-19 08:05:50', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('74', '', null, null, null, '2012-03-20 06:56:38', 'chengwang1988@126.com', '0', '0', '', '\0', '2012-03-24 07:44:20', 'AN', '202CB962AC59075B964B07152D234B70', null, null, '2012-03-20 06:56:38', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('75', '', '77D111FDA973B202B821D6FA07B2DF94', null, null, '2012-03-20 12:14:49', 'sd7000@126.com', '0', '0', '', '', '2012-03-20 12:14:49', '金牛座', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, '2012-03-20 12:14:49', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('76', '', null, null, null, '2012-03-21 02:46:14', '123199239@qq.com', '0', '0', '', '\0', '2012-03-21 02:46:14', '轻轻巧巧', '202CB962AC59075B964B07152D234B70', null, null, '2012-03-21 02:46:14', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('77', '', 'F846508EDF8A7DC50819B13678B18E62', null, null, '2012-03-21 05:29:34', '642796608@qq.com', '0', '0', '', '', '2012-03-21 05:29:34', 'AD', '202CB962AC59075B964B07152D234B70', null, null, '2012-03-21 05:29:34', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('78', '', '0DAD319A67C6C28B31D7FD37F20AFB95', null, null, '2012-03-21 05:32:39', '11711377072@qq.com', '0', '0', '', '', '2012-03-21 05:32:39', 'SD', '202CB962AC59075B964B07152D234B70', null, null, '2012-03-21 05:32:39', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('79', '', '0826E0A6F7E8383A2128445C2A218365', null, null, '2012-03-21 12:35:23', 'hacker@hacker.org', '0', '0', '', '', '2012-03-21 12:35:23', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:35:23', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('80', '', 'F7D1E71E5E2A2763F3BF639EFA83C024', null, null, '2012-03-21 12:41:02', 'hacker@hacker.org<script>alert(42873)</script>', '0', '0', '', '', '2012-03-21 12:41:02', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:02', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('81', '', '29D627BC6C28E4D7A8895D80E5BC9409', null, null, '2012-03-21 12:41:03', 'hacker@hacker.orgalert(42873)', '0', '0', '', '', '2012-03-21 12:41:03', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:03', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('82', '', '781CE797E059CE1682BC1E48678AAC41', null, null, '2012-03-21 12:41:04', 'hacker@hacker.org\'', '0', '0', '', '', '2012-03-21 12:41:04', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:04', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('83', '', 'CD7B6E6B425098708A7B7C0E00D1EA83', null, null, '2012-03-21 12:41:05', 'hacker@hacker.org%27', '0', '0', '', '', '2012-03-21 12:41:05', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:05', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('84', '', '8BE3BE9633FA5F379A446BFCDBCAD258', null, null, '2012-03-21 12:41:07', 'hacker@hacker.org\0\'', '0', '0', '', '', '2012-03-21 12:41:07', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:07', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('85', '', 'FADCBB290D2621C97BD18F94D6C74B1A', null, null, '2012-03-21 12:41:08', 'hacker@hacker.org\\\'', '0', '0', '', '', '2012-03-21 12:41:08', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:08', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('86', '', '5BF41B8A8365665B9AF58309BCFDE271', null, null, '2012-03-21 12:41:09', 'hacker@hacker.org\\\"', '0', '0', '', '', '2012-03-21 12:41:09', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:09', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('87', '', 'A7DB3FAA087A4DACAB134104F2C6962C', null, null, '2012-03-21 12:41:10', 'hacker@hacker.orgJyI=', '0', '0', '', '', '2012-03-21 12:41:10', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:10', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('88', '', 'C7724AAB1E7DCBDCC97058602B850A32', null, null, '2012-03-21 12:41:12', 'hacker@hacker.org\'\"', '0', '0', '', '', '2012-03-21 12:41:12', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:12', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('89', '', '2CD99715977087E54C95A47D5ED3D585', null, null, '2012-03-21 12:41:13', 'hacker@hacker.org�\'', '0', '0', '', '', '2012-03-21 12:41:13', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:13', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('90', '', 'CBD462091EF54BAA3B5D382CC5D21302', null, null, '2012-03-21 12:41:18', 'hacker@hacker.org/', '0', '0', '', '', '2012-03-21 12:41:18', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:18', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('91', '', '2AF39EC8F650EDDA6215098DA91494EF', null, null, '2012-03-21 12:41:19', 'hacker@hacker.org)', '0', '0', '', '', '2012-03-21 12:41:19', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:19', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('92', '', 'CA18DE64EDE3371466785B2C3E6A4835', null, null, '2012-03-21 12:41:20', 'hacker@hacker.org!(()', '0', '0', '', '', '2012-03-21 12:41:20', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:20', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('93', '', 'F56E375C80C304AFF978067F0A6CD0D6', null, null, '2012-03-21 12:41:21', '../../../../../../../../boot.ini', '0', '0', '', '', '2012-03-21 12:41:21', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:21', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('94', '', '48AD11000D445A3891A2AC5BEF309482', null, null, '2012-03-21 12:41:21', '../../../../../../../../boot.ini\0', '0', '0', '', '', '2012-03-21 12:41:21', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:21', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('95', '', '20D2602DA2545E070AEECD38C405B07F', null, null, '2012-03-21 12:41:22', '������������������������������������������������boot.ini', '0', '0', '', '', '2012-03-21 12:41:22', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:22', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('96', '', '49EA2D62376DE3A52D41AA56D906A45A', null, null, '2012-03-21 12:41:22', '../../../../../../../../boot.ini\0.jpg', '0', '0', '', '', '2012-03-21 12:41:22', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:22', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('97', '', '7496FF536F4703D10DDA5DED460CD354', null, null, '2012-03-21 12:41:22', '../../../../../../../../boot.ini\0.html', '0', '0', '', '', '2012-03-21 12:41:22', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:22', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('98', '', 'AE5FCB5F0376CC8B4B420E07D8B4B47A', null, null, '2012-03-21 12:41:23', '/.\\\\./.\\\\./.\\\\./.\\\\./.\\\\./.\\\\./boot.ini', '0', '0', '', '', '2012-03-21 12:41:23', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:23', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('99', '', 'E28C114B2397F9695AB5312C9D865C70', null, null, '2012-03-21 12:41:23', 'C:\\boot.ini', '0', '0', '', '', '2012-03-21 12:41:23', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:23', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('100', '', '65BFAFC84A370720C93F933C436AF309', null, null, '2012-03-21 12:41:23', '..\\..\\..\\..\\..\\..\\..\\..\\boot.ini', '0', '0', '', '', '2012-03-21 12:41:23', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:23', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('101', '', 'D57D6601AA7C75721E0CCD7F1B0C2707', null, null, '2012-03-21 12:41:23', '../..//../..//../..//../..//../..//../..//../..//../..//boot.ini', '0', '0', '', '', '2012-03-21 12:41:23', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:23', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('102', '', '497FCA536A694CE3E3643664A4933AEE', null, null, '2012-03-21 12:41:24', '../.../.././../.../.././../.../.././../.../.././../.../.././../.../.././boot.ini', '0', '0', '', '', '2012-03-21 12:41:24', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:24', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('103', '', '2A65EC7CB8DA17ADA938F2276224FCB0', null, null, '2012-03-21 12:41:24', '..��..��..��..��..��..��..��..��boot.ini', '0', '0', '', '', '2012-03-21 12:41:24', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:24', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('104', '', '5C57FBD43CDC42296F015192002D39DA', null, null, '2012-03-21 12:41:24', '<..\\..\\..\\..\\..\\..\\..\\..\\boot.ini', '0', '0', '', '', '2012-03-21 12:41:24', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:24', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('105', '', '5384ED39D4F379B2CC56DA68B45E287D', null, null, '2012-03-21 12:41:25', '|..\\..\\..\\..\\..\\..\\..\\..\\boot.ini', '0', '0', '', '', '2012-03-21 12:41:25', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:25', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('106', '', '38E7226A05349E85A74DF12C83D83F4C', null, null, '2012-03-21 12:41:25', '../../../../../../../../boot.ini\0.htm', '0', '0', '', '', '2012-03-21 12:41:25', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:25', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('107', '', '093F8CE0451CAB0AA75AD492E64C9CFB', null, null, '2012-03-21 12:41:25', '../../../../../../../../boot.ini\0.txt', '0', '0', '', '', '2012-03-21 12:41:25', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:25', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('108', '', '041FC59807838527B262F7BF1E11CE06', null, null, '2012-03-21 12:41:26', 'file:///c:/boot.ini', '0', '0', '', '', '2012-03-21 12:41:26', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:26', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('109', '', '83021395C7D10827E9697B055836F2A9', null, null, '2012-03-21 12:41:26', '../../../../../../../../etc/passwd', '0', '0', '', '', '2012-03-21 12:41:26', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:26', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('110', '', 'AE181243EBB0EBF509095507A8DA0AAD', null, null, '2012-03-21 12:41:26', '../../../../../../../../etc/passwd\0', '0', '0', '', '', '2012-03-21 12:41:26', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:26', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('111', '', '613BE3F2CB82A7AFB0EA145776AF5209', null, null, '2012-03-21 12:41:26', '\0../../../../../../../../etc/passwd', '0', '0', '', '', '2012-03-21 12:41:26', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:26', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('112', '', '95A4BF206E01BACC73C720832A84DB00', null, null, '2012-03-21 12:41:27', '../../../../../../../../etc/passwd\0.html', '0', '0', '', '', '2012-03-21 12:41:27', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:27', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('113', '', '4244E3504035B53DFBC862AB09D5C6DA', null, null, '2012-03-21 12:41:27', '../../../../../../../../etc/passwd\0.jpg', '0', '0', '', '', '2012-03-21 12:41:27', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:27', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('114', '', '40FD3CA8EA2824FE4CB2D5A4AE540EA9', null, null, '2012-03-21 12:41:27', '.\\\\./.\\\\./.\\\\./.\\\\./.\\\\./.\\\\./etc/passwd', '0', '0', '', '', '2012-03-21 12:41:27', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:27', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('115', '', '66F21D91ADD3F3F4D29DC4EC9533FF38', null, null, '2012-03-21 12:41:28', '/etc/passwd', '0', '0', '', '', '2012-03-21 12:41:28', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:28', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('116', '', 'EDA1C8659D02398EA15EC024E72188D3', null, null, '2012-03-21 12:41:28', '/./././././././etc/passwd', '0', '0', '', '', '2012-03-21 12:41:28', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:28', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('117', '', '7200167F33DB74AFB4075D457E54CA4E', null, null, '2012-03-21 12:41:28', '..\\..\\..\\..\\..\\..\\..\\..\\etc/passwd', '0', '0', '', '', '2012-03-21 12:41:28', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:28', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('118', '', '14977332D69E2AC24392AF4C2A092F5F', null, null, '2012-03-21 12:41:28', '../.../.././../.../.././../.../.././../.../.././../.../.././../.../.././etc/passwd', '0', '0', '', '', '2012-03-21 12:41:28', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:28', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('119', '', '671EFB3A5B50EB0100AD88B45D685895', null, null, '2012-03-21 12:41:29', '..��..��..��..��..��..��..��..��etc/passwd', '0', '0', '', '', '2012-03-21 12:41:29', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:29', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('120', '', 'F5D410B72A0C548C6EC38D22CA934DE3', null, null, '2012-03-21 12:41:29', '<../../../../../../../../etc/passwd', '0', '0', '', '', '2012-03-21 12:41:29', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:29', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('121', '', '8AAE82CCF01E09E2E00428E3EF4D8C1B', null, null, '2012-03-21 12:41:29', '|../../../../../../../../etc/passwd', '0', '0', '', '', '2012-03-21 12:41:29', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:29', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('122', '', '22BD8491A3A0463A165BAEF383D517AF', null, null, '2012-03-21 12:41:29', '������������������������������������������������/etc/passwd', '0', '0', '', '', '2012-03-21 12:41:29', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:29', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('123', '', '21F9FCDC4A321FFEEA835B7BEE55A2B3', null, null, '2012-03-21 12:41:29', 'file:///etc/passwd', '0', '0', '', '', '2012-03-21 12:41:29', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:30', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('124', '', 'FF9E00F8967CD7FADC86D734115817D6', null, null, '2012-03-21 12:41:30', '../..//../..//../..//../..//../..//../..//../..//../..//etc/passwd', '0', '0', '', '', '2012-03-21 12:41:30', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:30', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('125', '', '9060F3BE16C0836D0209C6A30B722F9B', null, null, '2012-03-21 12:41:30', 'identityConfirm.html', '0', '0', '', '', '2012-03-21 12:41:30', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:30', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('126', '', 'B7762C2606879218769903CB7F2853B3', null, null, '2012-03-21 12:41:30', 'http://some-inexistent-website.com/some_inexistent_file_with_long_name', '0', '0', '', '', '2012-03-21 12:41:30', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:30', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('127', '', 'CE3DFFDC88F931A44329397BED0A3E33', null, null, '2012-03-21 12:41:31', '/some_inexistent_file_with_long_name', '0', '0', '', '', '2012-03-21 12:41:31', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:31', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('128', '', 'AE7A92E4C78CBCA0701830D6A0F1F106', null, null, '2012-03-21 12:41:31', '\r\n SomeCustomInjectedHeader:injected_by_wvs', '0', '0', '', '', '2012-03-21 12:41:31', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:31', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('129', '', '8B7D04873ECE1B1345B3B810DA91150F', null, null, '2012-03-21 12:41:31', '\n SomeCustomInjectedHeader:injected_by_wvs', '0', '0', '', '', '2012-03-21 12:41:31', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:31', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('130', '', 'AEC2E21D0A1110E4989A62E289A9B059', null, null, '2012-03-21 12:41:31', 'dir', '0', '0', '', '', '2012-03-21 12:41:31', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:31', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('131', '', '958B61123A1D7B49A030B87E90236526', null, null, '2012-03-21 12:41:32', '&dir&', '0', '0', '', '', '2012-03-21 12:41:32', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:32', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('132', '', '6F2857191DC19F452F1716010AD94D73', null, null, '2012-03-21 12:41:32', '|dir', '0', '0', '', '', '2012-03-21 12:41:32', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:32', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('133', '', 'DAA90D27338F8846CF677CB666027F28', null, null, '2012-03-21 12:41:32', '&dir', '0', '0', '', '', '2012-03-21 12:41:32', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:32', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('134', '', '3FA6392A0F7C30F6561BC422BF5FC530', null, null, '2012-03-21 12:41:33', ';dir', '0', '0', '', '', '2012-03-21 12:41:33', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:33', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('135', '', 'C0BB87485EB340612B84F1140B69AE20', null, null, '2012-03-21 12:41:33', '<dir', '0', '0', '', '', '2012-03-21 12:41:33', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:33', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('136', '', '78B8434496F8066A5BE09714D12D4EB7', null, null, '2012-03-21 12:41:33', '\0dir\0', '0', '0', '', '', '2012-03-21 12:41:33', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:41:33', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('137', '', '3A983217707A7BEB48B549EED54E3527', null, null, '2012-03-21 12:44:12', 'orgCourseCreationIdentityConfirm.html', '0', '0', '', '', '2012-03-21 12:44:12', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:44:12', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('138', '', '3B81B98E7F3EC0A8081FE5FA5C360EB4', null, null, '2012-03-21 12:45:40', 'orgIdentityConfirm.html', '0', '0', '', '', '2012-03-21 12:45:40', 'hacker', 'D6A6BC0DB10694A2D90E3A69648F3A03', null, null, '2012-03-21 12:45:40', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('139', '', '6B50CDBA6B845883040E9FB0CD28C6C1', null, null, '2012-03-23 07:11:47', '475707838@qq.com', '0', '0', '', '', '2012-03-23 08:10:52', 'liaoliao', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, '2012-03-23 07:11:47', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('140', '', '478308F77073D4AC5703E06676079082', null, null, '2012-03-23 07:42:41', '769721709@qq.com', '0', '0', '', '', '2012-03-23 07:48:59', '静夜思', 'ACA55A5926FF4026CC896DE3CC78A279', null, null, '2012-03-23 07:42:41', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('141', '', '60BF9CA578B173D31AEFA29630DF5303', null, null, '2012-03-23 10:50:44', 'wengqz.eric@gmail.com', '0', '0', '', '\0', '2012-03-23 10:50:44', 'weng', '9404C50B32EC506348D0467847A38913', null, null, '2012-03-23 10:50:44', '', '', null, '8', null, '0', '0', '200', '\0', null, null);
INSERT INTO `membership` VALUES ('142', '', null, null, null, '2012-03-24 02:08:15', 'cs57177@126.com', '0', '0', '', '\0', '2012-03-24 02:08:15', 'cha l s', '69A5B5995110B36A9A347898D97A610E', null, null, '2012-03-24 02:08:15', '', '', null, '8', null, '0', '0', '100', '\0', null, null);
INSERT INTO `membership` VALUES ('143', '', null, null, null, '2012-03-24 07:22:20', 's1642wuk@163.com', '0', '0', '', '\0', '2012-03-24 08:01:33', '翼の小风', '202CB962AC59075B964B07152D234B70', null, null, '2012-03-24 07:22:20', '', '', null, '8', null, '0', '0', '100', '\0', null, null);

-- ----------------------------
-- Table structure for `organization`
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL auto_increment,
  `city` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `depositBankAcount` varchar(255) default NULL,
  `depositBankName` varchar(255) default NULL,
  `depositName` varchar(255) default NULL,
  `isVirtual` bit(1) default NULL,
  `province` varchar(255) default NULL,
  `schoolName` varchar(255) default NULL,
  `agent_id` int(11) default NULL,
  `responsiblePerson_id` int(11) default NULL,
  `createDate` datetime default NULL,
  `description` varchar(255) default NULL,
  `logoUrl` varchar(255) default NULL,
  `businessAddress` varchar(255) default NULL,
  `businessLicenseUrl` varchar(255) default NULL,
  `cellPhone` varchar(255) default NULL,
  `confirmed` bit(1) default NULL,
  `contactName` varchar(255) default NULL,
  `memberSize` int(11) default NULL,
  `multipleOrg` bit(1) default NULL,
  `telPhone` varchar(255) default NULL,
  `zipCode` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK50104153148F92A8` (`responsiblePerson_id`),
  KEY `FK501041537EC65F2E` (`agent_id`),
  CONSTRAINT `FK50104153148F92A8` FOREIGN KEY (`responsiblePerson_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK501041537EC65F2E` FOREIGN KEY (`agent_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES ('2', null, null, '1231232421342142', '中国银行', '张林', '\0', null, '中南大学', '1', '1', '2012-01-18 15:04:24', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `organization` VALUES ('3', null, null, null, null, null, '', null, '复旦大学', null, null, '2012-02-07 05:25:24', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `organization` VALUES ('4', null, null, null, null, null, null, null, '知元模拟学校', null, '3', '2012-03-09 11:19:58', null, null, null, null, null, '', null, '5', '\0', null, null);

-- ----------------------------
-- Table structure for `organizationcomment`
-- ----------------------------
DROP TABLE IF EXISTS `organizationcomment`;
CREATE TABLE `organizationcomment` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `message` varchar(255) default NULL,
  `organization_id` int(11) default NULL,
  `owner_id` int(11) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKF434B18C9D0A3EB7` (`organization_id`),
  KEY `FKF434B18C8A5668C0` (`owner_id`),
  CONSTRAINT `FKF434B18C8A5668C0` FOREIGN KEY (`owner_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FKF434B18C9D0A3EB7` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organizationcomment
-- ----------------------------

-- ----------------------------
-- Table structure for `organizationhistory`
-- ----------------------------
DROP TABLE IF EXISTS `organizationhistory`;
CREATE TABLE `organizationhistory` (
  `id` int(11) NOT NULL auto_increment,
  `agent_id` int(11) default NULL,
  `organization_id` int(11) default NULL,
  `responser_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKF2CEA7C19D0A3EB7` (`organization_id`),
  KEY `FKF2CEA7C17D0B1A62` (`responser_id`),
  KEY `FKF2CEA7C17EC65F2E` (`agent_id`),
  CONSTRAINT `FKF2CEA7C17D0B1A62` FOREIGN KEY (`responser_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FKF2CEA7C17EC65F2E` FOREIGN KEY (`agent_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FKF2CEA7C19D0A3EB7` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organizationhistory
-- ----------------------------
INSERT INTO `organizationhistory` VALUES ('1', null, '2', '1');

-- ----------------------------
-- Table structure for `organizationteacher`
-- ----------------------------
DROP TABLE IF EXISTS `organizationteacher`;
CREATE TABLE `organizationteacher` (
  `id` int(11) NOT NULL auto_increment,
  `createDate` datetime default NULL,
  `org_id` int(11) default NULL,
  `teacher_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK65C08F0F11DA5366` (`org_id`),
  KEY `FK65C08F0FE0134D31` (`teacher_id`),
  CONSTRAINT `FK65C08F0F11DA5366` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`),
  CONSTRAINT `FK65C08F0FE0134D31` FOREIGN KEY (`teacher_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organizationteacher
-- ----------------------------

-- ----------------------------
-- Table structure for `seniorclassroom`
-- ----------------------------
DROP TABLE IF EXISTS `seniorclassroom`;
CREATE TABLE `seniorclassroom` (
  `id` int(11) NOT NULL auto_increment,
  `course_id` int(11) default NULL,
  `student_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKB188C203E9AB4C38` (`student_id`),
  KEY `FKB188C203ACBD5F77` (`course_id`),
  CONSTRAINT `FKB188C203ACBD5F77` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `FKB188C203E9AB4C38` FOREIGN KEY (`student_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seniorclassroom
-- ----------------------------
INSERT INTO `seniorclassroom` VALUES ('2', '58', '3');
INSERT INTO `seniorclassroom` VALUES ('3', '59', '3');
INSERT INTO `seniorclassroom` VALUES ('4', '57', '3');
INSERT INTO `seniorclassroom` VALUES ('5', '60', '16');
INSERT INTO `seniorclassroom` VALUES ('6', '63', '2');
INSERT INTO `seniorclassroom` VALUES ('7', '79', '3');
INSERT INTO `seniorclassroom` VALUES ('8', '87', '20');
INSERT INTO `seniorclassroom` VALUES ('9', '81', '3');
INSERT INTO `seniorclassroom` VALUES ('10', '88', '2');
INSERT INTO `seniorclassroom` VALUES ('11', '89', '3');
INSERT INTO `seniorclassroom` VALUES ('12', '92', '3');
INSERT INTO `seniorclassroom` VALUES ('13', '93', '20');
INSERT INTO `seniorclassroom` VALUES ('14', '97', '2');
INSERT INTO `seniorclassroom` VALUES ('15', '99', '3');
INSERT INTO `seniorclassroom` VALUES ('16', '98', '29');
INSERT INTO `seniorclassroom` VALUES ('17', '102', '31');
INSERT INTO `seniorclassroom` VALUES ('18', '103', '2');
INSERT INTO `seniorclassroom` VALUES ('19', '106', '3');
INSERT INTO `seniorclassroom` VALUES ('20', '109', '2');
INSERT INTO `seniorclassroom` VALUES ('21', '112', '2');
INSERT INTO `seniorclassroom` VALUES ('22', '116', '2');
INSERT INTO `seniorclassroom` VALUES ('23', '117', '2');
INSERT INTO `seniorclassroom` VALUES ('24', '123', '2');
INSERT INTO `seniorclassroom` VALUES ('25', '125', '3');
INSERT INTO `seniorclassroom` VALUES ('26', '136', '17');
INSERT INTO `seniorclassroom` VALUES ('27', '137', '17');
INSERT INTO `seniorclassroom` VALUES ('28', '138', '40');
INSERT INTO `seniorclassroom` VALUES ('29', '139', '9');
INSERT INTO `seniorclassroom` VALUES ('30', '140', '19');
INSERT INTO `seniorclassroom` VALUES ('31', '141', '19');
INSERT INTO `seniorclassroom` VALUES ('32', '144', '41');
INSERT INTO `seniorclassroom` VALUES ('33', '147', '42');
INSERT INTO `seniorclassroom` VALUES ('34', '148', '19');
INSERT INTO `seniorclassroom` VALUES ('35', '149', '19');
INSERT INTO `seniorclassroom` VALUES ('36', '150', '19');
INSERT INTO `seniorclassroom` VALUES ('37', '150', '17');
INSERT INTO `seniorclassroom` VALUES ('38', '151', '17');
INSERT INTO `seniorclassroom` VALUES ('39', '152', '47');
INSERT INTO `seniorclassroom` VALUES ('40', '154', '42');
INSERT INTO `seniorclassroom` VALUES ('41', '155', '42');
INSERT INTO `seniorclassroom` VALUES ('42', '158', '19');
INSERT INTO `seniorclassroom` VALUES ('43', '160', '15');
INSERT INTO `seniorclassroom` VALUES ('44', '165', '19');
INSERT INTO `seniorclassroom` VALUES ('45', '165', '17');
INSERT INTO `seniorclassroom` VALUES ('46', '166', '17');
INSERT INTO `seniorclassroom` VALUES ('47', '166', '19');
INSERT INTO `seniorclassroom` VALUES ('48', '171', '3');
INSERT INTO `seniorclassroom` VALUES ('49', '172', '3');
INSERT INTO `seniorclassroom` VALUES ('50', '172', '48');
INSERT INTO `seniorclassroom` VALUES ('51', '174', '3');
INSERT INTO `seniorclassroom` VALUES ('52', '174', '48');
INSERT INTO `seniorclassroom` VALUES ('53', '174', '2');
INSERT INTO `seniorclassroom` VALUES ('54', '177', '19');
INSERT INTO `seniorclassroom` VALUES ('55', '178', '51');
INSERT INTO `seniorclassroom` VALUES ('56', '180', '19');
INSERT INTO `seniorclassroom` VALUES ('57', '182', '51');
INSERT INTO `seniorclassroom` VALUES ('58', '183', '2');
INSERT INTO `seniorclassroom` VALUES ('59', '183', '19');
INSERT INTO `seniorclassroom` VALUES ('60', '183', '17');
INSERT INTO `seniorclassroom` VALUES ('61', '184', '19');
INSERT INTO `seniorclassroom` VALUES ('62', '185', '52');
INSERT INTO `seniorclassroom` VALUES ('63', '187', '17');
INSERT INTO `seniorclassroom` VALUES ('64', '187', '2');
INSERT INTO `seniorclassroom` VALUES ('65', '188', '17');
INSERT INTO `seniorclassroom` VALUES ('66', '189', '19');
INSERT INTO `seniorclassroom` VALUES ('67', '191', '19');
INSERT INTO `seniorclassroom` VALUES ('68', '194', '19');
INSERT INTO `seniorclassroom` VALUES ('69', '188', '3');
INSERT INTO `seniorclassroom` VALUES ('70', '196', '17');
INSERT INTO `seniorclassroom` VALUES ('71', '197', '17');
INSERT INTO `seniorclassroom` VALUES ('72', '201', '63');
INSERT INTO `seniorclassroom` VALUES ('73', '202', '66');
INSERT INTO `seniorclassroom` VALUES ('74', '204', '66');
INSERT INTO `seniorclassroom` VALUES ('75', '203', '49');
INSERT INTO `seniorclassroom` VALUES ('76', '207', '17');
INSERT INTO `seniorclassroom` VALUES ('77', '208', '67');
INSERT INTO `seniorclassroom` VALUES ('78', '209', '19');
INSERT INTO `seniorclassroom` VALUES ('79', '210', '5');
INSERT INTO `seniorclassroom` VALUES ('80', '210', '71');
INSERT INTO `seniorclassroom` VALUES ('81', '211', '71');
INSERT INTO `seniorclassroom` VALUES ('82', '212', '5');
INSERT INTO `seniorclassroom` VALUES ('83', '219', '66');
INSERT INTO `seniorclassroom` VALUES ('84', '221', '48');
INSERT INTO `seniorclassroom` VALUES ('85', '229', '72');
INSERT INTO `seniorclassroom` VALUES ('86', '231', '19');
INSERT INTO `seniorclassroom` VALUES ('87', '237', '74');
INSERT INTO `seniorclassroom` VALUES ('88', '238', '74');
INSERT INTO `seniorclassroom` VALUES ('89', '238', '16');
INSERT INTO `seniorclassroom` VALUES ('90', '239', '13');
INSERT INTO `seniorclassroom` VALUES ('91', '240', '17');
INSERT INTO `seniorclassroom` VALUES ('92', '241', '76');
INSERT INTO `seniorclassroom` VALUES ('93', '244', '142');
INSERT INTO `seniorclassroom` VALUES ('94', '247', '143');
INSERT INTO `seniorclassroom` VALUES ('95', '249', '19');

-- ----------------------------
-- Table structure for `seriesconsumption`
-- ----------------------------
DROP TABLE IF EXISTS `seriesconsumption`;
CREATE TABLE `seriesconsumption` (
  `id` int(11) NOT NULL auto_increment,
  `businessId` int(11) default NULL,
  `businessSummary` varchar(255) default NULL,
  `consumptionDate` datetime default NULL,
  `consumptionState` bit(1) default NULL,
  `zhibiQuantity` double default NULL,
  `zhiquanQuantity` double default NULL,
  `beneficiary_id` int(11) default NULL,
  `consumer_id` int(11) default NULL,
  `allSettlement` bit(1) default NULL,
  `interimSettlement` bit(1) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK8CA6FC8474395F4E` (`beneficiary_id`),
  KEY `FK8CA6FC84F40AAC9D` (`consumer_id`),
  CONSTRAINT `FK8CA6FC8474395F4E` FOREIGN KEY (`beneficiary_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK8CA6FC84F40AAC9D` FOREIGN KEY (`consumer_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seriesconsumption
-- ----------------------------
INSERT INTO `seriesconsumption` VALUES ('1', '38', '预定课程', '2012-01-04 03:17:10', '\0', '0', '0', '3', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('2', '38', '预定课程', '2012-01-04 03:17:10', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('3', null, '注册账号', '2012-01-06 08:05:45', '', '0', '100', '14', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('4', null, '注册账号', '2012-01-11 14:52:45', '', '0', '100', '15', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('5', '58', '预定课程', '2012-01-13 14:40:30', '\0', '0', '0', '2', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('6', '58', '预定课程', '2012-01-13 14:40:30', '\0', '0', '0', null, '3', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('7', '59', '预定课程', '2012-01-13 14:47:07', '\0', '0', '0', '4', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('8', '59', '预定课程', '2012-01-13 14:47:07', '\0', '0', '0', null, '3', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('9', '57', '预定课程', '2012-01-13 15:00:04', '\0', '0', '0', '4', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('10', '57', '预定课程', '2012-01-13 15:00:04', '\0', '0', '0', null, '3', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('11', null, '注册账号', '2012-01-13 15:10:05', '', '0', '100', '16', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('12', null, '注册账号', '2012-01-13 15:16:42', '', '0', '100', '17', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('13', '60', '预定课程', '2012-01-13 15:25:44', '\0', '0', '0', '17', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('14', '60', '预定课程', '2012-01-13 15:25:44', '\0', '0', '0', null, '16', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('15', '63', '预定课程', '2012-01-14 07:38:09', '\0', '0', '0', '3', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('16', '63', '预定课程', '2012-01-14 07:38:09', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('17', '79', '预定课程', '2012-01-29 12:23:09', '\0', '0', '0', '4', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('18', '79', '预定课程', '2012-01-29 12:23:09', '\0', '0', '0', null, '3', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('19', null, '注册账号', '2012-02-04 06:13:05', '', '0', '100', '18', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('20', null, '注册账号', '2012-02-04 06:27:38', '', '0', '100', '19', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('21', null, '注册账号', '2012-02-04 06:32:02', '', '0', '100', '20', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('22', '87', '预定课程', '2012-02-09 08:45:23', '\0', '0', '0', '3', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('23', '87', '预定课程', '2012-02-09 08:45:23', '\0', '0', '0', null, '20', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('24', '81', '预定课程', '2012-02-09 09:03:14', '\0', '0', '0', '20', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('25', '81', '预定课程', '2012-02-09 09:03:14', '\0', '0', '0', null, '3', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('26', '88', '预定课程', '2012-02-09 09:12:55', '\0', '0', '0', '3', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('27', '88', '预定课程', '2012-02-09 09:12:55', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('28', null, '注册账号', '2012-02-09 11:54:56', '', '0', '100', '21', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('29', '89', '预定课程', '2012-02-09 12:02:28', '\0', '0', '0', '2', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('30', '89', '预定课程', '2012-02-09 12:02:28', '\0', '0', '0', null, '3', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('31', null, '注册账号', '2012-02-09 12:19:18', '', '0', '100', '22', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('32', null, '注册账号', '2012-02-09 12:21:16', '', '0', '100', '23', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('33', null, '注册账号', '2012-02-09 15:07:35', '', '0', '100', '24', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('34', '92', '预定课程', '2012-02-09 15:08:56', '\0', '0', '0', '2', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('35', '92', '预定课程', '2012-02-09 15:08:56', '\0', '0', '0', null, '3', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('36', '93', '预定课程', '2012-02-09 15:31:42', '\0', '0', '0', '3', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('37', '93', '预定课程', '2012-02-09 15:31:42', '\0', '0', '0', null, '20', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('38', null, '注册账号', '2012-02-10 09:08:18', '', '0', '100', '25', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('39', null, '注册账号', '2012-02-10 09:19:08', '', '0', '100', '26', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('40', null, '注册账号', '2012-02-11 03:20:08', '', '0', '100', '27', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('41', null, '注册账号', '2012-02-11 05:49:14', '', '0', '100', '28', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('42', null, '注册账号', '2012-02-12 05:59:38', '', '0', '100', '29', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('43', null, '注册账号', '2012-02-12 09:10:54', '', '0', '100', '30', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('44', '97', '预定课程', '2012-02-12 09:33:42', '\0', '0', '0', '3', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('45', '97', '预定课程', '2012-02-12 09:33:42', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('46', '99', '预定课程', '2012-02-14 06:30:49', '\0', '0', '0', '2', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('47', '99', '预定课程', '2012-02-14 06:30:49', '\0', '0', '0', null, '3', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('48', '98', '预定课程', '2012-02-14 17:25:54', '\0', '0', '0', '2', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('49', '98', '预定课程', '2012-02-14 17:25:54', '\0', '0', '0', null, '29', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('50', null, '注册账号', '2012-02-15 08:54:54', '', '0', '100', '31', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('51', '102', '预定课程', '2012-02-15 09:01:38', '\0', '0', '0', '4', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('52', '102', '预定课程', '2012-02-15 09:01:38', '\0', '0', '0', null, '31', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('53', '103', '预定课程', '2012-02-15 09:34:00', '\0', '0', '0', '4', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('54', '103', '预定课程', '2012-02-15 09:34:00', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('55', null, '注册账号', '2012-02-16 02:24:13', '', '0', '100', '32', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('56', '106', '预定课程', '2012-02-16 02:33:02', '\0', '0', '0', '2', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('57', '106', '预定课程', '2012-02-16 02:33:02', '\0', '0', '0', null, '3', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('58', '109', '预定课程', '2012-02-16 02:52:18', '\0', '0', '0', '19', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('59', '109', '预定课程', '2012-02-16 02:52:18', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('60', '112', '预定课程', '2012-02-16 03:05:22', '\0', '0', '0', '3', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('61', '112', '预定课程', '2012-02-16 03:05:22', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('62', null, '注册账号', '2012-02-16 08:18:13', '', '0', '100', '33', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('63', null, '注册账号', '2012-02-16 08:36:55', '', '0', '100', '34', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('64', '116', '预定课程', '2012-02-16 08:38:18', '\0', '0', '0', '33', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('65', '116', '预定课程', '2012-02-16 08:38:18', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('66', null, '注册账号', '2012-02-16 09:08:41', '', '0', '100', '35', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('67', '117', '预定课程', '2012-02-16 09:11:30', '\0', '0', '0', '35', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('68', '117', '预定课程', '2012-02-16 09:11:30', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('69', null, '注册账号', '2012-02-16 09:12:39', '', '0', '100', '36', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('70', null, '注册账号', '2012-02-16 09:12:53', '', '0', '100', '37', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('71', null, '注册账号', '2012-02-16 09:13:15', '', '0', '100', '38', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('72', '123', '预定课程', '2012-02-16 12:25:33', '\0', '0', '0', '3', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('73', '123', '预定课程', '2012-02-16 12:25:33', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('74', '125', '预定课程', '2012-02-20 13:47:53', '\0', '0', '0', '4', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('75', '125', '预定课程', '2012-02-20 13:47:54', '\0', '0', '0', null, '3', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('76', null, '注册账号', '2012-02-21 10:52:21', '', '0', '100', '39', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('77', null, '注册账号', '2012-02-25 15:18:55', '', '0', '100', '43', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('78', null, '注册账号', '2012-02-25 16:02:23', '', '0', '100', '44', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('79', null, '注册账号', '2012-02-27 04:08:06', '', '0', '100', '45', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('80', null, '注册账号', '2012-02-27 04:16:03', '', '0', '100', '46', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('81', null, '注册账号', '2012-02-28 03:12:51', '', '0', '100', '48', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('82', '160', '预定课程', '2012-02-29 14:48:52', '\0', '0', '0', '4', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('83', '160', '预定课程', '2012-02-29 14:48:52', '\0', '0', '0', null, '15', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('84', null, '注册账号', '2012-03-01 12:17:10', '', '0', '100', '49', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('85', '172', '预定课程', '2012-03-03 08:37:04', '\0', '0', '0', '19', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('86', '172', '预定课程', '2012-03-03 08:37:04', '\0', '0', '0', null, '48', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('87', '174', '预定课程', '2012-03-03 09:09:12', '\0', '0', '0', '19', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('88', '174', '预定课程', '2012-03-03 09:09:12', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('89', null, '注册账号', '2012-03-03 09:49:50', '', '0', '100', '50', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('90', '183', '预定课程', '2012-03-03 13:25:42', '\0', '0', '0', '3', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('91', '183', '预定课程', '2012-03-03 13:22:13', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('92', '183', '预定课程', '2012-03-03 13:24:46', '\0', '0', '0', null, '19', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('93', '183', '预定课程', '2012-03-03 13:25:42', '\0', '0', '0', null, '17', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('94', null, '注册账号', '2012-03-04 05:34:58', '', '0', '100', '52', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('95', null, '注册账号', '2012-03-05 14:48:48', '', '0', '100', '53', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('96', '187', '预定课程', '2012-03-06 14:51:35', '\0', '0', '0', '19', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('97', '187', '预定课程', '2012-03-06 14:51:35', '\0', '0', '0', null, '2', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('98', '188', '预定课程', '2012-03-09 03:07:50', '\0', '0', '0', '2', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('99', '188', '预定课程', '2012-03-09 03:07:50', '\0', '0', '0', null, '3', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('100', null, '注册账号', '2012-03-11 09:05:28', '', '0', '100', '54', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('101', null, '注册账号', '2012-03-11 09:08:03', '', '0', '100', '55', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('102', null, '注册账号', '2012-03-11 09:12:51', '', '0', '100', '56', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('103', null, '注册账号', '2012-03-11 09:15:52', '', '0', '100', '57', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('104', null, '注册账号', '2012-03-11 09:22:00', '', '0', '100', '58', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('105', null, '注册账号', '2012-03-11 09:24:03', '', '0', '100', '59', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('106', null, '注册账号', '2012-03-11 12:27:52', '', '0', '100', '60', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('107', null, '注册账号', '2012-03-12 05:13:02', '', '0', '100', '61', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('108', null, '注册账号', '2012-03-12 10:38:19', '', '0', '100', '62', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('109', null, '注册账号', '2012-03-12 12:25:46', '', '0', '100', '63', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('110', null, '注册账号', '2012-03-12 12:58:01', '', '0', '100', '64', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('111', null, '注册账号', '2012-03-12 14:36:23', '', '0', '100', '65', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('112', null, '注册账号', '2012-03-13 08:30:20', '', '0', '100', '68', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('113', null, '注册账号', '2012-03-13 09:19:28', '', '0', '100', '69', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('114', null, '注册账号', '2012-03-13 15:03:55', '', '0', '100', '70', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('115', null, '注册账号', '2012-03-19 08:05:50', '', '0', '100', '73', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('116', '238', '预定课程', '2012-03-20 08:02:16', '\0', '0', '0', '3', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('117', '238', '预定课程', '2012-03-20 08:02:16', '\0', '0', '0', null, '16', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('118', null, '注册账号', '2012-03-20 12:14:49', '', '0', '100', '75', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('119', '240', '预定课程', '2012-03-20 13:15:09', '\0', '0', '0', '19', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('120', '240', '预定课程', '2012-03-20 13:15:09', '\0', '0', '0', null, '17', '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('121', null, '注册账号', '2012-03-21 05:29:35', '', '0', '100', '77', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('122', null, '注册账号', '2012-03-21 05:32:39', '', '0', '100', '78', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('123', null, '注册账号', '2012-03-21 12:35:24', '', '0', '100', '79', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('124', null, '注册账号', '2012-03-21 12:41:02', '', '0', '100', '80', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('125', null, '注册账号', '2012-03-21 12:41:03', '', '0', '100', '81', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('126', null, '注册账号', '2012-03-21 12:41:04', '', '0', '100', '82', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('127', null, '注册账号', '2012-03-21 12:41:06', '', '0', '100', '83', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('128', null, '注册账号', '2012-03-21 12:41:07', '', '0', '100', '84', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('129', null, '注册账号', '2012-03-21 12:41:08', '', '0', '100', '85', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('130', null, '注册账号', '2012-03-21 12:41:09', '', '0', '100', '86', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('131', null, '注册账号', '2012-03-21 12:41:10', '', '0', '100', '87', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('132', null, '注册账号', '2012-03-21 12:41:12', '', '0', '100', '88', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('133', null, '注册账号', '2012-03-21 12:41:13', '', '0', '100', '89', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('134', null, '注册账号', '2012-03-21 12:41:18', '', '0', '100', '90', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('135', null, '注册账号', '2012-03-21 12:41:19', '', '0', '100', '91', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('136', null, '注册账号', '2012-03-21 12:41:20', '', '0', '100', '92', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('137', null, '注册账号', '2012-03-23 07:11:47', '', '0', '100', '139', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('138', null, '注册账号', '2012-03-23 07:42:41', '', '0', '100', '140', null, '\0', '\0');
INSERT INTO `seriesconsumption` VALUES ('139', null, '注册账号', '2012-03-23 10:50:44', '', '0', '100', '141', null, '\0', '\0');

-- ----------------------------
-- Table structure for `singupinfo`
-- ----------------------------
DROP TABLE IF EXISTS `singupinfo`;
CREATE TABLE `singupinfo` (
  `id` int(11) NOT NULL auto_increment,
  `address` varchar(255) default NULL,
  `age` int(11) default NULL,
  `blogUrl` varchar(255) default NULL,
  `cellPhone` bigint(20) default NULL,
  `comments` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `enounce` varchar(255) default NULL,
  `interest` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `qq` bigint(20) default NULL,
  `singType` int(11) default NULL,
  `status` int(11) default NULL,
  `type` int(11) default NULL,
  `role_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK869D6178BC75C7C1` (`role_id`),
  KEY `FK869D61781E6FB8A8` (`user_id`),
  CONSTRAINT `FK869D61781E6FB8A8` FOREIGN KEY (`user_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK869D6178BC75C7C1` FOREIGN KEY (`role_id`) REFERENCES `singuprole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of singupinfo
-- ----------------------------
INSERT INTO `singupinfo` VALUES ('1', null, null, 'blog url0', '13807482200', null, '你好吗？我现在GOOD0', '加油', null, null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for `singuprole`
-- ----------------------------
DROP TABLE IF EXISTS `singuprole`;
CREATE TABLE `singuprole` (
  `id` int(11) NOT NULL auto_increment,
  `role` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of singuprole
-- ----------------------------

-- ----------------------------
-- Table structure for `subject`
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `owner_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKF3E2ED0C8A5668C0` (`owner_id`),
  CONSTRAINT `FKF3E2ED0C8A5668C0` FOREIGN KEY (`owner_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '湖南大赛', '1');

-- ----------------------------
-- Table structure for `tb_group`
-- ----------------------------
DROP TABLE IF EXISTS `tb_group`;
CREATE TABLE `tb_group` (
  `id` int(11) NOT NULL auto_increment,
  `comments` varchar(255) default NULL,
  `isActive` bit(1) NOT NULL,
  `isPrivate` bit(1) NOT NULL,
  `isSystem` bit(1) NOT NULL,
  `name` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_group
-- ----------------------------

-- ----------------------------
-- Table structure for `useracountinfo`
-- ----------------------------
DROP TABLE IF EXISTS `useracountinfo`;
CREATE TABLE `useracountinfo` (
  `id` int(11) NOT NULL auto_increment,
  `bankAcount` varchar(255) default NULL,
  `bankName` varchar(255) default NULL,
  `disposeName` varchar(255) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKD1A079671E6FB8A8` (`user_id`),
  CONSTRAINT `FKD1A079671E6FB8A8` FOREIGN KEY (`user_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useracountinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `userrelationship`
-- ----------------------------
DROP TABLE IF EXISTS `userrelationship`;
CREATE TABLE `userrelationship` (
  `id` int(11) NOT NULL auto_increment,
  `validateCode` varchar(255) default NULL,
  `user_id` int(11) default NULL,
  `userFriend_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK9008A1C3DF61ED8A` (`userFriend_id`),
  KEY `FK9008A1C31E6FB8A8` (`user_id`),
  CONSTRAINT `FK9008A1C31E6FB8A8` FOREIGN KEY (`user_id`) REFERENCES `membership` (`id`),
  CONSTRAINT `FK9008A1C3DF61ED8A` FOREIGN KEY (`userFriend_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userrelationship
-- ----------------------------

-- ----------------------------
-- Table structure for `usersession`
-- ----------------------------
DROP TABLE IF EXISTS `usersession`;
CREATE TABLE `usersession` (
  `id` int(11) NOT NULL auto_increment,
  `insertTime` datetime default NULL,
  `sessionkey` varchar(255) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC7BC0C2B1E6FB8A8` (`user_id`),
  CONSTRAINT `FKC7BC0C2B1E6FB8A8` FOREIGN KEY (`user_id`) REFERENCES `membership` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usersession
-- ----------------------------
