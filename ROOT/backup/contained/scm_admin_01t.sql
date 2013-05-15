CREATE DATABASE  IF NOT EXISTS `scm` /*!40100 DEFAULT CHARACTER SET euckr */;
USE `scm`;
-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: scm
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `admin_01t`
--

DROP TABLE IF EXISTS `admin_01t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_01t` (
  `ADMINID` varchar(10) NOT NULL,
  `ADMINNAME` varchar(30) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `ADMINTYPE` varchar(5) default NULL,
  `ADMINGROUP` varchar(5) default 'A',
  `PW_DATE` date default NULL,
  `BRAND` varchar(2) default NULL,
  `ADMINCLASS` varchar(1) default NULL,
  `EMAIL` varchar(100) default NULL,
  `EMAIL_YN` varchar(1) default NULL,
  `APPROVAL` varchar(1) default NULL,
  PRIMARY KEY  (`ADMINID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_01t`
--

LOCK TABLES `admin_01t` WRITE;
/*!40000 ALTER TABLE `admin_01t` DISABLE KEYS */;
INSERT INTO `admin_01t` VALUES ('1000','CEO','1234','H','A',NULL,NULL,'1','ceo@sebin2098.com',NULL,'Y'),('1001','김은실','1234','H','B',NULL,NULL,'1','EunSilKim@sebin2098.com',NULL,'Y'),('2000','배상갑','gavi1004','H','A','2011-06-28','1','1','gvinschina@sebin2098.com',NULL,'Y'),('9144','Jeffrey H Song','1234','H','A','2011-05-26','1','1','jeffrey.song@ffb.net.au',NULL,'Y'),('9155','Alex Kim','1234','H','A',NULL,'1','1','alexkim9087@naver.com',NULL,'N');
/*!40000 ALTER TABLE `admin_01t` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-13 11:58:00
