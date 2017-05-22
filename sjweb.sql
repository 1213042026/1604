/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.21 : Database - sjweb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sjweb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `sjweb`;

/*Table structure for table `car` */

DROP TABLE IF EXISTS `car`;

CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(50) DEFAULT NULL,
  `stuname` varchar(50) DEFAULT NULL,
  `jzname` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `dw` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `stupwd` varchar(50) DEFAULT NULL,
  `jzpwd` varchar(50) DEFAULT NULL,
  `bjnames` varchar(50) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `et` varchar(500) DEFAULT NULL,
  `bt` varchar(500) DEFAULT NULL,
  `yynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `car` */

insert  into `car`(`id`,`no`,`stuname`,`jzname`,`tel`,`dw`,`address`,`stupwd`,`jzpwd`,`bjnames`,`url`,`et`,`bt`,`yynum`) values (3,'B-01','BMW 7系','中型','898000','BMW 7X是今年宝马最新款！！','1.998L',NULL,NULL,'宝马','files/2017052021320994.png','2017.6.2','2017.5.20',2),(4,'B-02','BMW 5系','紧凑','457000','本车为BMW 5X四门轿车经典型。','1.2L',NULL,NULL,'宝马','files/2017052021355267.png','2017.6.5','2017.5.30',0),(5,'B-03','BMW i8','中型','1980000','BMW i8是全新概念的运动型跑车。','2.1L',NULL,NULL,'宝马','files/2017052021383017.png','2017.5.25','2017.5.12',0),(6,'K-01','奔驰','SUV','268000','似乎嗅到了冒险的气息，原来正是GLA SUV疾驰驾临.','2.1L',NULL,NULL,'奔驰','files/2017052021455960.png','2017.6.1','2017.5.22',0),(7,'K-02','奔驰','中大型','520000','长轴距C级运动轿车醒目的AMG车身风格组件，彰显出车辆的动感特性。','2L',NULL,NULL,'奔驰','files/2017052021490593.png','2017.6.13','2017.5.31',1),(8,'D-01','高尔夫','紧凑','265000','给予你更新的感受。','2L',NULL,NULL,'大众','files/2017052021545950.png','2017.6.2','2017.5.',1),(9,'D-02','全新一代','SUV','150000','全新一代为大众最新款！','2.1L',NULL,NULL,'大众','files/2017052021580316.png','2017.6.21','2017.6.1',0),(10,'C-01','CS95','SUV','220000','CS95以简约为设计准则，以简练视觉语言呈现纯正品位.','2L',NULL,NULL,'宝马','files/2017052022003646.png','2017.5.31','2017.5.20',0);

/*Table structure for table `demo` */

DROP TABLE IF EXISTS `demo`;

CREATE TABLE `demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `types` varchar(50) DEFAULT NULL,
  `descs` varchar(500) DEFAULT NULL,
  `times` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `demo` */

/*Table structure for table `pp` */

DROP TABLE IF EXISTS `pp`;

CREATE TABLE `pp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(50) DEFAULT NULL,
  `types` varchar(50) DEFAULT NULL,
  `nums` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `pp` */

insert  into `pp`(`id`,`names`,`types`,`nums`) values (8,'宝马',NULL,4),(9,'奔驰',NULL,2),(10,'大众',NULL,2),(11,'长安',NULL,0);

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `roles` varchar(50) DEFAULT NULL,
  `no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `t_admin` */

insert  into `t_admin`(`id`,`username`,`password`,`email`,`realname`,`tel`,`roles`,`no`) values (1,'admin','admin','1','zhangfei','037165285655','管理员','1'),(11,'123','123','1710155141@163.com','林零','13215488498','客户','410184199504285510'),(13,'789','789','1141150425@qq.com','王青','1131264897','客户','410155199504225410'),(14,'456','456','95231655414@qq.com','李孟','11315515956','客户','410184199504265211');

/*Table structure for table `ts` */

DROP TABLE IF EXISTS `ts`;

CREATE TABLE `ts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(50) DEFAULT NULL,
  `times` datetime DEFAULT NULL,
  `descs` varchar(50) DEFAULT NULL,
  `hfnames` varchar(50) DEFAULT NULL,
  `hfdescs` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `ts` */

insert  into `ts`(`id`,`names`,`times`,`descs`,`hfnames`,`hfdescs`) values (2,'王青','2017-05-20 22:05:59','宝马系列什么时候出新款？',NULL,'宝马 7系为今年最新款，其他款式未出新的。');

/*Table structure for table `xw` */

DROP TABLE IF EXISTS `xw`;

CREATE TABLE `xw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titles` varchar(50) DEFAULT NULL,
  `descs` varchar(50) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `times` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `xw` */

insert  into `xw`(`id`,`titles`,`descs`,`url`,`times`,`realname`) values (1,'BMW 最新款7系上线！','bmw 7系全新上线，有意预约的用户请注意预约时间。','files/2017052022025280.png','2017-05-20','zhangfei');

/*Table structure for table `yy` */

DROP TABLE IF EXISTS `yy`;

CREATE TABLE `yy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carnames` varchar(50) DEFAULT NULL,
  `unames` varchar(50) DEFAULT NULL,
  `descs` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `times` varchar(50) DEFAULT NULL,
  `sh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `yy` */

insert  into `yy`(`id`,`carnames`,`unames`,`descs`,`cid`,`uid`,`times`,`sh`) values (1,'BMW 7系','林零','将在6月1号试车，具体时间我会前一天联系。',3,11,'2017-06-01','通过'),(2,'BMW 7系','李孟','',3,14,'2017-05-22','通过'),(3,'高尔夫','王青','',8,13,'2017-05-27','通过'),(4,'奔驰','李孟','',7,14,'2017-06-14','未通过');

/*Table structure for table `zp` */

DROP TABLE IF EXISTS `zp`;

CREATE TABLE `zp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titles` varchar(50) DEFAULT NULL,
  `descs` varchar(50) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `times` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `types` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zp` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
