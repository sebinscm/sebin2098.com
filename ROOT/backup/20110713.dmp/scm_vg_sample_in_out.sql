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
-- Table structure for table `vg_sample_in_out`
--

DROP TABLE IF EXISTS `vg_sample_in_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vg_sample_in_out` (
  `SEQUENCE_NO` int(10) NOT NULL auto_increment,
  `SAMPLE_NO` varchar(12) NOT NULL,
  `INPUT_DATE` date NOT NULL,
  `ITEM_GROUP` varchar(5) default NULL,
  `QTY` int(6) default NULL,
  `BUYERNAME` varchar(50) default NULL,
  `SUPPLIER` varchar(10) default NULL,
  `SENDING_DATE` date default NULL,
  `RETURN_DATE` date default NULL,
  `REMARKS` varchar(4000) default NULL,
  `MODIFIER` varchar(10) default NULL,
  `MODIFIED_DATE` date default NULL,
  `PLACE` int(8) default NULL,
  `BUYER` varchar(10) default NULL,
  `BUYEREMAIL` varchar(100) default NULL,
  `SUPPLIEREMAIL` varchar(100) default NULL,
  `CCEMAIL` varchar(100) default NULL,
  `SEASON` varchar(20) default NULL,
  `ITEM_CLASS` varchar(10) default NULL,
  `STYLE_NO` varchar(20) default NULL,
  `STATUS` varchar(2) default NULL,
  `COMMENTS` varchar(4000) default NULL,
  `AFILE1_NAME` varchar(100) default NULL,
  `AFILE2_NAME` varchar(100) default NULL,
  `AFILE3_NAME` varchar(100) default NULL,
  PRIMARY KEY  (`SEQUENCE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vg_sample_in_out`
--

LOCK TABLES `vg_sample_in_out` WRITE;
/*!40000 ALTER TABLE `vg_sample_in_out` DISABLE KEYS */;
INSERT INTO `vg_sample_in_out` VALUES (1,'12345','2011-05-17','KDRS',1,NULL,'S1001','2011-05-24','0000-00-00','주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','9144','2011-06-14',NULL,'B1001',NULL,'jeffrey.song@ffb.net.au','Jeffrey.song@ffb.net.au','SPRING','1','54321','22','바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다','12345_SAMPLE SHEET.doc','12345_REQUEST SHEET.doc','12345_AMEND SHEET.doc'),(2,'78910','2011-06-20','KJKT',1,NULL,'S1001','2011-06-01','0000-00-00','바이어에게 주고 받을 내용을 이곳에 기입합니다.','9144','2011-07-12',NULL,'B9999',NULL,NULL,NULL,'WINTER','1','78910','20',NULL,NULL,NULL,NULL),(3,'99999','2011-06-08','WSKT',1,NULL,'S1001','2011-06-10','0000-00-00','Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','9144','2011-06-30',NULL,'B9999',NULL,NULL,NULL,'SUMMER','1','99999','20',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vg_sample_in_out` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-13 11:57:28
