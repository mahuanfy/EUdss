-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 172.16.0.105    Database: eudss
-- ------------------------------------------------------
-- Server version	5.5.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dssuser`
--

DROP TABLE IF EXISTS `dssuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dssuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `rank` varchar(20) NOT NULL DEFAULT '1',
  `date` varchar(20) DEFAULT NULL,
  `rankValue` varchar(20) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dssuser`
--

LOCK TABLES `dssuser` WRITE;
/*!40000 ALTER TABLE `dssuser` DISABLE KEYS */;
INSERT INTO `dssuser` VALUES (1,'admin管理员','admin','admin','女',19,'1365478596','0','2017-6-11','超级管理员','/9c3b2e18-8b7a-4972-846e-78587572fcd1.jpg'),(3,'管理员','super','super','女',21,'15802458456','0','2017-8-11','超级管理员','/849e4fb5-92ba-44ac-9cdf-9ac4cc37321e.jpg'),(19,'小明','xiaoming','123456','男',NULL,NULL,'1','2017-3-7','一级管理员',NULL),(112,'asdfa','asdfas','asdfasd','男',NULL,NULL,'3','2017-10-13 ','三级管理员',NULL),(113,'MR_欢先生','821453366','821453366','男',22,'15802365412','0','2017-10-13 ','超级管理员','/f8bc018f-a100-4e96-9ca1-f598bb4c1f08.jpg');
/*!40000 ALTER TABLE `dssuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eu_tronclass`
--

DROP TABLE IF EXISTS `eu_tronclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eu_tronclass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(20) NOT NULL,
  `tron_month` int(11) NOT NULL,
  `eu_rj` int(11) NOT NULL,
  `eu_xin` int(11) NOT NULL,
  `eu_rw` int(11) NOT NULL,
  `eu_ts` int(11) NOT NULL,
  `eu_xiu` int(11) NOT NULL,
  `eu_gz` int(11) NOT NULL,
  `eu_kuai` int(11) NOT NULL,
  `eu_ad` int(11) NOT NULL,
  `eu_wc` int(11) NOT NULL,
  `eu_wu` int(11) NOT NULL,
  `eu_jr` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eu_tronclass`
--

LOCK TABLES `eu_tronclass` WRITE;
/*!40000 ALTER TABLE `eu_tronclass` DISABLE KEYS */;
INSERT INTO `eu_tronclass` VALUES (1,'2017',3,657,482,465,448,427,421,318,219,207,146,142),(2,'2017',12,2303,1394,1654,1561,1712,1706,966,866,1133,1127,755),(3,'2017',5,657,482,465,448,427,421,318,219,207,146,142),(4,'2017',6,657,482,465,448,427,421,318,219,207,146,142),(5,'2017',10,657,482,465,448,427,421,318,219,207,146,142),(6,'2017',8,657,482,465,448,427,421,318,219,207,146,142),(8,'2017',11,565,232,676,244,234,543,438,219,207,146,142),(9,'2016',4,657,482,465,448,427,421,318,219,207,146,142),(10,'2016',5,657,482,465,448,427,421,318,219,207,146,142),(11,'2016',6,657,482,465,448,427,421,318,219,207,146,142),(12,'2016',7,657,482,465,448,427,421,318,219,207,146,142),(15,'2016',10,657,482,465,448,427,421,318,219,207,146,142),(16,'2016',3,657,482,465,448,427,421,318,219,207,146,142),(17,'2016',2,657,482,465,448,427,421,318,219,207,146,142),(18,'2016',2,657,482,465,448,427,421,318,219,207,146,142),(19,'2016',2,657,482,465,448,427,421,318,219,207,146,142),(21,'2016',2,657,482,465,448,427,421,318,219,207,146,142),(22,'2016',2,657,482,465,448,427,421,318,219,207,146,142),(23,'2016',8,657,482,465,448,427,421,318,219,207,146,142),(24,'2016',2,657,482,465,448,427,421,318,219,207,146,142),(26,'2016',2,657,482,465,448,427,421,318,219,207,146,142),(27,'2016',2,657,482,465,448,427,421,318,219,207,146,142),(28,'2016',2,657,482,465,448,427,421,318,219,207,146,142),(108,'2015',2,1221,89,89,8989,898,9898,989,89898,98989,898,898);
/*!40000 ALTER TABLE `eu_tronclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leavereason`
--

DROP TABLE IF EXISTS `leavereason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leavereason` (
  `leave_id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_year` int(11) DEFAULT NULL,
  `leave_month` int(11) DEFAULT NULL,
  `leave_credit` double DEFAULT NULL,
  `leave_work` double DEFAULT NULL,
  `leave_overdue` double DEFAULT NULL,
  `leave_study` double DEFAULT NULL,
  `leave_life` double DEFAULT NULL,
  `leave_interest` double DEFAULT NULL,
  `leave_home` double DEFAULT NULL,
  `leave_money` double DEFAULT NULL,
  `leave_abroad` double DEFAULT NULL,
  `leave_ill` double DEFAULT NULL,
  `leave_army` double DEFAULT NULL,
  `leave_repeat` double DEFAULT NULL,
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavereason`
--

LOCK TABLES `leavereason` WRITE;
/*!40000 ALTER TABLE `leavereason` DISABLE KEYS */;
INSERT INTO `leavereason` VALUES (1,2017,23,12341,64,641,634,64,41,34,64,634,6456,454,64);
/*!40000 ALTER TABLE `leavereason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissioninfo`
--

DROP TABLE IF EXISTS `permissioninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissioninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `unique_name` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `is_visiable` varchar(30) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `sort_num` int(11) DEFAULT NULL,
  `creater` varchar(30) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `updater` date DEFAULT NULL,
  `update_time` varchar(30) DEFAULT NULL,
  `isParent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限信息关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissioninfo`
--

LOCK TABLES `permissioninfo` WRITE;
/*!40000 ALTER TABLE `permissioninfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissioninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleinfo`
--

DROP TABLE IF EXISTS `roleinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  `creater` varchar(30) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `updater` varchar(30) DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色信息关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleinfo`
--

LOCK TABLES `roleinfo` WRITE;
/*!40000 ALTER TABLE `roleinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `roleinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomutilization`
--

DROP TABLE IF EXISTS `roomutilization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomutilization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(10) DEFAULT NULL,
  `year` varchar(10) DEFAULT NULL,
  `utilizationRate` varchar(10) NOT NULL COMMENT '利用率',
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='教室、工作室利用率';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomutilization`
--

LOCK TABLES `roomutilization` WRITE;
/*!40000 ALTER TABLE `roomutilization` DISABLE KEYS */;
INSERT INTO `roomutilization` VALUES (1,'12','2015','0.85','教室利用率'),(2,'12','2015','0.68','工作室利用率'),(3,'11','2017','0.89','工作室利用率'),(4,'10','2017','0.00','教室利用率'),(5,'11','2017','0.66','工作室利用率'),(6,'10','2017','0.01','教室利用率'),(7,'12','2015','0.02','工作室利用率'),(10,NULL,'','0.77','工作室利用率');
/*!40000 ALTER TABLE `roomutilization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_number`
--

DROP TABLE IF EXISTS `students_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` varchar(20) DEFAULT NULL,
  `ndergraduate` int(11) DEFAULT NULL,
  `specialty` int(11) DEFAULT NULL,
  `upgraded` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_number`
--

LOCK TABLES `students_number` WRITE;
/*!40000 ALTER TABLE `students_number` DISABLE KEYS */;
INSERT INTO `students_number` VALUES (1,'2017',11755,8461,449),(5,'2014',13230,9654,449),(7,'2016',11234,8964,449),(8,'2015',13233,9654,449);
/*!40000 ALTER TABLE `students_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `real_name` varchar(30) DEFAULT NULL,
  `is_delete` varchar(30) DEFAULT NULL,
  `creater` varchar(30) DEFAULT NULL COMMENT '创建者',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(30) DEFAULT NULL COMMENT '修改者',
  `update_time` date DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-17 13:33:28
