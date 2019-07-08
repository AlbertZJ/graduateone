/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.1.49-community : Database - graduate
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`graduate` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `graduate`;

/*Table structure for table `check_in` */

DROP TABLE IF EXISTS `check_in`;

CREATE TABLE `check_in` (
  `check_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '签到编号',
  `check_start` datetime NOT NULL COMMENT '签到开始时间',
  `check_end` datetime DEFAULT NULL COMMENT '签到结束时间',
  `stu_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '签到学生编号',
  `tech_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '教师编号',
  `check_num` int(50) DEFAULT NULL COMMENT '签到次数',
  PRIMARY KEY (`check_id`),
  KEY `stu_id` (`stu_id`),
  KEY `tech_id` (`tech_id`),
  CONSTRAINT `check_in_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `check_in_ibfk_2` FOREIGN KEY (`tech_id`) REFERENCES `teacher` (`tech_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `check_in` */

insert  into `check_in`(`check_id`,`check_start`,`check_end`,`stu_id`,`tech_id`,`check_num`) values (72,'2019-05-04 05:18:08','2019-05-04 05:18:15','1','1',8),(73,'2019-05-04 05:18:18','2019-05-04 05:18:22','1','1',26),(74,'2019-05-04 05:22:48','2019-05-04 05:22:55','1','44',NULL),(75,'2019-05-04 05:22:59','2019-05-04 05:23:04','1','5',NULL),(76,'2019-05-04 05:23:12','2019-05-04 05:23:16','1','1',15),(77,'2019-05-06 03:33:11','2019-05-06 03:33:22','1','1',4),(79,'2019-05-09 08:54:44','2019-05-09 08:54:59','1','1',4),(80,'2019-05-09 10:48:59','2019-05-09 10:49:06','1','1',3),(81,'2019-05-10 08:53:21','2019-05-10 08:53:26','1','1',2);

/*Table structure for table `notice` */

DROP TABLE IF EXISTS `notice`;

CREATE TABLE `notice` (
  `note_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '通知编号',
  `note` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT '通知内容',
  `tech_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `tech_id` (`tech_id`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`tech_id`) REFERENCES `teacher` (`tech_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `notice` */

insert  into `notice`(`note_id`,`note`,`tech_id`) values (1,'注意开学时间','1'),(2,'明天早上开会','44'),(5,'五四青年节3','1'),(6,'注意安全','1'),(10,'抓紧时间练习','1');

/*Table structure for table `score` */

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
  `score_id` int(50) NOT NULL AUTO_INCREMENT,
  `usual_grade` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '平时成绩',
  `reply_grade` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '答辩成绩',
  `total_grade` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '最终成绩',
  `tech_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stu_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`score_id`),
  KEY `tech_id` (`tech_id`),
  KEY `stu_id` (`stu_id`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`tech_id`) REFERENCES `teacher` (`tech_id`),
  CONSTRAINT `score_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `score` */

insert  into `score`(`score_id`,`usual_grade`,`reply_grade`,`total_grade`,`tech_id`,`stu_id`) values (5,'80','90','86.0','1','1'),(6,'80','70','74.0','1','1'),(7,'90','60','69.0','1','1'),(8,'70','80','80.0','4','11'),(9,'90','85','85.5','44','22');

/*Table structure for table `selectnews` */

DROP TABLE IF EXISTS `selectnews`;

CREATE TABLE `selectnews` (
  `selectnews_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '选题编号',
  `stu_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '学生编号',
  `title_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '课题编号',
  `select_state` enum('未选','已选') COLLATE utf8_unicode_ci NOT NULL COMMENT '课题状态',
  PRIMARY KEY (`selectnews_id`),
  KEY `stu_id` (`stu_id`),
  CONSTRAINT `selectnews_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `selectnews` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `stu_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stu_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stu_pwd` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `stu_tel` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`stu_id`),
  UNIQUE KEY `stu_tel` (`stu_tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `student` */

insert  into `student`(`stu_id`,`stu_name`,`stu_pwd`,`stu_tel`,`type`) values ('1','小红','1','18881361591','学生'),('101','李四','202CB962AC59075B964B07152D234B70','18881361592','学生'),('11','小明','11','18881361593','学生'),('22','小张','22','18881361594','学生'),('33','小李','33','18881361595','学生'),('7','小王','7','18881361596','学生'),('8','罗明','8','18881361597','学生'),('9','罗小英','9','18881361598','学生');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `tech_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '教师编号',
  `tech_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '教师姓名',
  `tech_pwd` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `tech_tel` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '教师类型',
  PRIMARY KEY (`tech_id`),
  UNIQUE KEY `tech_tel` (`tech_tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `teacher` */

insert  into `teacher`(`tech_id`,`tech_name`,`tech_pwd`,`tech_tel`,`type`) values ('1','李萍','wewe','18891361591','教师'),('4','张大强','4','18891361592','教师'),('44','刘强','44','18891361593','教师'),('5','李明','5','18891361594','教师'),('7','李小龙','7','18891361595','教师');

/*Table structure for table `testtitle` */

DROP TABLE IF EXISTS `testtitle`;

CREATE TABLE `testtitle` (
  `test_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '评测编号',
  `stu_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tech_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '课题名字',
  `stu_title` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '学生提交课题内容',
  `tech_title` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '教师评语',
  PRIMARY KEY (`test_id`),
  KEY `stu_id` (`stu_id`),
  KEY `tech_id` (`tech_id`),
  KEY `title_name` (`title_name`),
  CONSTRAINT `testtitle_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `testtitle_ibfk_2` FOREIGN KEY (`tech_id`) REFERENCES `teacher` (`tech_id`),
  CONSTRAINT `testtitle_ibfk_3` FOREIGN KEY (`title_name`) REFERENCES `title` (`title_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `testtitle` */

/*Table structure for table `title` */

DROP TABLE IF EXISTS `title`;

CREATE TABLE `title` (
  `title_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '课题编号',
  `title_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '课题名字',
  `tech_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '作者编号',
  `title_state` enum('未选','已选') COLLATE utf8_unicode_ci NOT NULL COMMENT '课题状态',
  `title_show` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '课题内容',
  `stu_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '选题人',
  `stu_title` longtext COLLATE utf8_unicode_ci COMMENT '学生提交课题内容',
  `tech_title` longtext COLLATE utf8_unicode_ci COMMENT '教师评语',
  `stu_file` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学生上传文件地址',
  `tech_file` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '教师批改后的文件地址',
  PRIMARY KEY (`title_id`),
  KEY `tech_id` (`tech_id`),
  KEY `title_name` (`title_name`),
  CONSTRAINT `title_ibfk_1` FOREIGN KEY (`tech_id`) REFERENCES `teacher` (`tech_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `title` */

insert  into `title`(`title_id`,`title_name`,`tech_id`,`title_state`,`title_show`,`stu_id`,`stu_title`,`tech_title`,`stu_file`,`tech_file`) values (19,'物理','1','已选','学好数理化，走遍天下都不怕','1','什么是 ADO？\r\nADO 是一项微软的技术\r\nADO 指 ActiveX 数据对象（ActiveX Data Objects）\r\nADO 是一个微软的 Active-X 组件\r\nADO 会随微软的 IIS 被自动安装\r\nADO 是一个访问数据库中数据的编程接口\r\n\r\n从 ASP 页面访问数据库\r\n从一个 ASP 页面内部访问数据库的通常的方法是：\r\n1.创建一个到数据库的 ADO 连接\r\n2.打开数据库连接\r\n3.创建 ADO 记录集\r\n4.从记录集提取您需要的数据\r\n5.关闭记录集\r\n6.关闭连接',NULL,'Git菜鸟教程.docx','asp 菜鸟教程.docx'),(21,'数学','1','未选','学好数理化，走遍天下都不怕数学','null','','儿童与购买方文山缺乏稳定为人父','jQuery UI菜鸟教程.docx','Json菜鸟教程.docx'),(22,'语文','1','已选',' 学好数理化','1',NULL,NULL,NULL,NULL),(23,' 软件工程','1','未选',' 好的',NULL,NULL,NULL,NULL,NULL),(24,'数据结构','4','未选',' 我骑单车',NULL,NULL,NULL,NULL,NULL),(25,'计算机组成原理','4','未选',' 去玩赛车',NULL,NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
