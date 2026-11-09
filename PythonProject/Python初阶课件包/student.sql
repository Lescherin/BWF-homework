/*
Navicat MySQL Data Transfer

Source Server         : jwconn
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : jwtest

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2016-12-13 19:53:59
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `cjb`
-- ----------------------------
DROP TABLE IF EXISTS `cjb`;
CREATE TABLE `cjb` (
  `kch` varchar(10) DEFAULT NULL,
  `xh` varchar(10) DEFAULT NULL,
  `cj` int(11) DEFAULT NULL,
  KEY `kch` (`kch`),
  KEY `xh` (`xh`),
  CONSTRAINT `cjb_ibfk_1` FOREIGN KEY (`kch`) REFERENCES `kcb` (`Kch`),
  CONSTRAINT `cjb_ibfk_2` FOREIGN KEY (`xh`) REFERENCES `xsb` (`xh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cjb
-- ----------------------------
INSERT INTO `cjb` VALUES ('01', '001', '100');
INSERT INTO `cjb` VALUES ('02', '002', '100');
INSERT INTO `cjb` VALUES ('03', '003', '80');
INSERT INTO `cjb` VALUES ('04', '004', '79');
INSERT INTO `cjb` VALUES ('05', '005', '96');
INSERT INTO `cjb` VALUES ('01', '006', '20');
INSERT INTO `cjb` VALUES ('04', '007', '30');
INSERT INTO `cjb` VALUES ('01', '006', '88');
INSERT INTO `cjb` VALUES ('04', '001', '78');
INSERT INTO `cjb` VALUES ('05', '003', '18');
INSERT INTO `cjb` VALUES ('04', '003', '16');
INSERT INTO `cjb` VALUES ('02', '001', '78');

-- ----------------------------
-- Table structure for `kcb`
-- ----------------------------
DROP TABLE IF EXISTS `kcb`;
CREATE TABLE `kcb` (
  `Kch` varchar(10) NOT NULL,
  `Kcm` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Kch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kcb
-- ----------------------------
INSERT INTO `kcb` VALUES ('01', '数据库');
INSERT INTO `kcb` VALUES ('02', 'java语言');
INSERT INTO `kcb` VALUES ('03', 'Linux');
INSERT INTO `kcb` VALUES ('04', '高等数学');
INSERT INTO `kcb` VALUES ('05', 'spring');
INSERT INTO `kcb` VALUES ('06', 'SOA分布式');
INSERT INTO `kcb` VALUES ('07', 'SVN版本控制');

-- ----------------------------
-- Table structure for `xsb`
-- ----------------------------
DROP TABLE IF EXISTS `xsb`;
CREATE TABLE `xsb` (
  `xh` varchar(10) NOT NULL,
  `xm` varchar(10) NOT NULL,
  `xb` enum('男','女') DEFAULT NULL,
  `jg` varchar(50) DEFAULT NULL,
  `nl` int(11) DEFAULT NULL,
  `bj` varchar(20) DEFAULT '1班',
  `sfzh` char(18) DEFAULT NULL,
  `zcrq` timestamp NOT NULL DEFAULT '2015-08-13 00:00:00',
  PRIMARY KEY (`xh`),
  UNIQUE KEY `sfzh` (`sfzh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xsb
-- ----------------------------
INSERT INTO `xsb` VALUES ('001', '张三', '男', '北京', '20', '1班', '340322199001247654', '2015-08-13 00:00:00');
INSERT INTO `xsb` VALUES ('002', '李四', '男', '上海', '18', '2班', '340322199002242354', '2015-08-13 00:00:00');
INSERT INTO `xsb` VALUES ('003', '张飞', '男', '南京', '24', '3班', '340322199003247654', '2015-08-13 00:00:00');
INSERT INTO `xsb` VALUES ('004', '刘备', '男', '安徽', '22', '4班', '340322199005247654', '2015-08-13 00:00:00');
INSERT INTO `xsb` VALUES ('005', '郭杨', '男', '天津', '19', '3班', '340322199004247654', '2015-08-13 00:00:00');
INSERT INTO `xsb` VALUES ('006', '王欣', '女', '河北', '18', '1班', '340322199006247654', '2015-08-13 00:00:00');
INSERT INTO `xsb` VALUES ('007', '王钊', '男', '山西', '20', '2班', '340322199007247654', '2015-08-13 00:00:00');
INSERT INTO `xsb` VALUES ('008', '邢华', '男', '河南', '20', '3班', '340322199008247654', '2015-08-13 00:00:00');
INSERT INTO `xsb` VALUES ('009', '班长', '男', '湖南', '21', '1班', '340322199000297654', '2015-08-13 00:00:00');
INSERT INTO `xsb` VALUES ('010', '范冰', '女', '广东', '26', '2班', '340322199607247654', '2015-08-13 00:00:00');
INSERT INTO `xsb` VALUES ('011', '李晨', '男', '北京', '30', '4班', '340322199005267754', '2015-08-13 00:00:00');
