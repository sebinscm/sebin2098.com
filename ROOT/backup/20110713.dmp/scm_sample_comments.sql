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
-- Table structure for table `sample_comments`
--

DROP TABLE IF EXISTS `sample_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_comments` (
  `SEQNO` int(10) NOT NULL auto_increment,
  `SEQUENCE_NO` int(10) NOT NULL,
  `SAMPLE_NO` varchar(12) NOT NULL,
  `SUPPLIER_REMARKS` varchar(4000) default NULL,
  `BUYER_REMARKS` varchar(4000) default NULL,
  `SUPPLIER_ID` varchar(10) default NULL,
  `SUPPLIER_UPDATED` date default NULL,
  `BUYER_ID` varchar(10) default NULL,
  `BUYER_UPDATED` date default NULL,
  PRIMARY KEY  (`SEQNO`,`SEQUENCE_NO`,`SAMPLE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_comments`
--

LOCK TABLES `sample_comments` WRITE;
/*!40000 ALTER TABLE `sample_comments` DISABLE KEYS */;
INSERT INTO `sample_comments` VALUES (1,1,'12345','주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다','9144','2011-06-14',NULL,NULL),(2,1,'12345','주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다',NULL,NULL,'B1001','2011-06-14'),(3,3,'99999','Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','','9144','2011-06-30',NULL,NULL),(4,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(5,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(6,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(7,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(8,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(9,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(10,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL);
/*!40000 ALTER TABLE `sample_comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-13 11:57:29
