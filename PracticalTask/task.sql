/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.20-0ubuntu0.16.04.1 : Database - task
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`task` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `task`;

/*Table structure for table `exam` */

DROP TABLE IF EXISTS `exam`;

CREATE TABLE `exam` (
  `student_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `student_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `exam_1` tinyint(4) DEFAULT NULL,
  `exam_2` tinyint(4) DEFAULT NULL,
  `exam_3` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `exam` */

insert  into `exam`(`student_id`,`student_name`,`exam_1`,`exam_2`,`exam_3`) values (1,'student 1',15,30,50),(2,'student 2',20,20,40),(3,'student 3',18,18,80),(4,'student 4',30,30,80);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`first_name`,`last_name`,`email`) values (1,'hanwant','singh','hanwant0@gmail.com'),(2,'khuswant','singh','khuswant@gmail.com'),(3,'chandan','singh','chandan@gmail.com'),(4,'bhawani','singh','bhawani@gmail.com');

/*Table structure for table `user_info_data` */

DROP TABLE IF EXISTS `user_info_data`;

CREATE TABLE `user_info_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `fieldid` int(10) unsigned NOT NULL,
  `data` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `fieldid` (`fieldid`),
  CONSTRAINT `user_info_data_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_info_data_ibfk_2` FOREIGN KEY (`fieldid`) REFERENCES `user_info_field` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_info_data` */

insert  into `user_info_data`(`id`,`userid`,`fieldid`,`data`) values (1,1,1,'SLBS'),(2,1,2,'EC'),(3,2,1,'VYAS'),(4,2,2,'CS'),(5,3,1,'JNVU'),(6,3,2,'IT'),(7,4,1,'JNVU'),(8,4,2,'CIVIL');

/*Table structure for table `user_info_field` */

DROP TABLE IF EXISTS `user_info_field`;

CREATE TABLE `user_info_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `datatype` text COLLATE utf8_unicode_ci,
  `required` enum('','no','yes') COLLATE utf8_unicode_ci DEFAULT '',
  `deafultdata` text COLLATE utf8_unicode_ci,
  `options` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_info_field` */

insert  into `user_info_field`(`id`,`shortname`,`datatype`,`required`,`deafultdata`,`options`) values (1,'college',NULL,'no',NULL,NULL),(2,'department',NULL,'no',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
