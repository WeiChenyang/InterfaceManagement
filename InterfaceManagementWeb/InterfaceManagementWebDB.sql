/*
SQLyog Professional v12.08 (64 bit)
MySQL - 5.7.30 : Database - yuanyi_intf
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yuanyi_intf` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yuanyi_intf`;

/*Table structure for table `cnbm_intf` */

DROP TABLE IF EXISTS `cnbm_intf`;

CREATE TABLE `cnbm_intf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '接口编码',
  `name` varchar(100) DEFAULT NULL COMMENT '接口名称',
  `input_name` varchar(50) DEFAULT NULL COMMENT '生产者系统名称',
  `input_url` varchar(255) DEFAULT NULL COMMENT '生产者系统地址',
  `input_param_format` varchar(1000) DEFAULT NULL COMMENT '生产者系统传入参数格式',
  `output_name` varchar(50) DEFAULT NULL COMMENT '消费者系统名称',
  `output_format` varchar(1000) DEFAULT NULL COMMENT '消费者系统传入参数格式',
  `remarks` varchar(1000) DEFAULT NULL COMMENT '接口描述',
  `input_class_name` varchar(100) DEFAULT NULL COMMENT '生产者系统类名',
  `input_method_name` varchar(50) DEFAULT NULL COMMENT '生产者系统方法名',
  `output_class_name` varchar(100) DEFAULT NULL COMMENT '消费者系统类名',
  `output_method_name` varchar(50) DEFAULT NULL COMMENT '生产者系统方法名',
  `status` varchar(1) DEFAULT '0' COMMENT '状态0启用，1禁用',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `is_retry` varchar(1) DEFAULT NULL COMMENT '是否重试',
  `max_retry_count` int(10) DEFAULT '3' COMMENT '重试次数',
  `timeout` int(10) DEFAULT NULL COMMENT '超时时间',
  `ip_address` varchar(255) DEFAULT NULL COMMENT 'IP限制',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `cnbm_intf` */

insert  into `cnbm_intf`(`id`,`code`,`name`,`input_name`,`input_url`,`input_param_format`,`output_name`,`output_format`,`remarks`,`input_class_name`,`input_method_name`,`output_class_name`,`output_method_name`,`status`,`created_date`,`updated_date`,`is_retry`,`max_retry_count`,`timeout`,`ip_address`) values (12,'YUANYI-KEHU','元亿客户-新增/修改-接口','用友U8','http://127.0.0.1:7788/customeradd/customer','{ \"id\": \"1\", \"ccuscode\": \"001\", \"ccusname\": \"客户\", \"define1\": \"1\", \"define2\": \"2\" }','中建材','{\r\n	\"code\":\"YUANYI-KEHU\",\r\n	\"method\": \"post\",\r\n	\"data\":{\r\n		\"id\": \"1\",\r\n		\"ccuscode\": \"001\",\r\n		\"ccusname\": \"客户\",\r\n		\"define1\": \"1\",\r\n		\"define2\": \"2\"\r\n	 }\r\n}',NULL,NULL,'customer','com.cnbm.bs.client.yuanyi.YuanyiController','yuanyiInterface','0','2021-03-11 14:28:19',NULL,'0',3,300000,NULL),(13,'P_001','考勤测试','192.168.1.216','http://192.168.1.216:9500/summary/getSummaryRowMap','{\"pageSize\":100000,\"pageNum\":1,\r\n \"entity\":{\r\n  \"personGroup\":{\r\n   \"persons\":[\r\n    {\"name\":\"魏晨阳\"}\r\n   ]\r\n  },\r\n  \"startTime\":\"2019-11-12 00:00:00\",\r\n  \"endTime\":\"2019-11-13 00:00:00\"\r\n }\r\n}','测试','ceshi ',NULL,NULL,'getSummaryRowMap','com.cnbm.bs.client.yuanyi.AttendanceResultController','apiGetResult','0','2021-03-12 14:42:42',NULL,'0',3,300000,NULL),(15,'YUANYI-GYS','元亿供应商-新增/修改-接口','用友U8','http://127.0.0.1:7788/vendoradd/vendor','{\"id\":\"1\",\"cvencode\":\"001\",\"cvenname\":\"供应商\",\"define1\":\"1\",\"define2\":\"2\"}','中建材','{\r\n	\"code\":\"YUANYI-GYS\",\r\n	\"method\": \"post\",\r\n	\"data\":{\r\n		\"id\": \"1\",\r\n		\"cvencode\": \"001\",\r\n		\"cvenname\": \"供应商\",\r\n		\"define1\": \"1\",\r\n		\"define2\": \"2\"\r\n	 }\r\n}',NULL,NULL,'vendor','com.cnbm.bs.client.yuanyi.YuanyiController','yuanyiInterface','0','2021-03-14 11:18:36',NULL,'0',3,300000,NULL);

/*Table structure for table `cnbm_intf_log` */

DROP TABLE IF EXISTS `cnbm_intf_log`;

CREATE TABLE `cnbm_intf_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intf_id` int(11) DEFAULT NULL COMMENT '接口管理表',
  `status` varchar(1) DEFAULT NULL COMMENT '状态0成功1失败',
  `input_status` varchar(1) DEFAULT NULL COMMENT '生产者调用状态0成功1失败',
  `input_params` longtext COMMENT '生产者调用参数',
  `input_return_val` longtext COMMENT '生产者响应结果',
  `output_status` varchar(1) DEFAULT NULL COMMENT '消费者调用抓状态0成功1失败',
  `output_params` longtext COMMENT '消费者调用参数',
  `failed_reason` longtext COMMENT '失败原因',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_date` datetime DEFAULT NULL COMMENT '更新时间',
  `ip_address` varchar(20) DEFAULT NULL COMMENT 'ip地址',
  `url` varchar(255) DEFAULT NULL COMMENT '访问地址',
  `method_ext` varchar(50) DEFAULT NULL COMMENT '调用方法',
  `response_time_ext` varchar(50) DEFAULT NULL COMMENT '响应时间',
  `retry_count` int(10) DEFAULT '0' COMMENT '记录重试次数',
  `intf_name` varchar(100) DEFAULT NULL COMMENT '接口名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `intf_id` (`intf_id`) USING BTREE,
  CONSTRAINT `cnbm_intf_log_ibfk_1` FOREIGN KEY (`intf_id`) REFERENCES `cnbm_intf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3121 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `cnbm_intf_log` */


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;