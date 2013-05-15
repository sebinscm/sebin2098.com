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
-- Table structure for table `cost_01t`
--

DROP TABLE IF EXISTS `cost_01t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_01t` (
  `ORDER_NO` varchar(11) NOT NULL,
  `STYLE` varchar(20) NOT NULL,
  `SEASON` varchar(10) default NULL,
  `SGR` varchar(10) default NULL,
  `PGR` varchar(10) default NULL,
  `REORDER_SEQ` varchar(10) default NULL,
  `SUB_SUPPLIER` varchar(10) NOT NULL default '',
  `BUYER` varchar(10) default NULL,
  `SUPPLIER` varchar(10) default NULL,
  `MAIN_WIDTH` varchar(20) default NULL,
  `MAIN_QTY` decimal(14,4) default NULL,
  `MAIN_UNIT_PRICE` decimal(14,4) default NULL,
  `MAIN_TOTAL` decimal(14,4) default NULL,
  `MAIN_TEXT` varchar(200) default NULL,
  `COLOR_QTY` decimal(14,4) default NULL,
  `COLOR_WIDTH` varchar(20) default NULL,
  `COLOR_UNIT_PRICE` decimal(14,4) default NULL,
  `COLOR_TOTAL` decimal(14,4) default NULL,
  `COLOR_TEXT` varchar(200) default NULL,
  `INNER_QTY` decimal(14,4) default NULL,
  `INNER_WIDTH` varchar(20) default NULL,
  `INNER_UNIT_PRICE` decimal(14,4) default NULL,
  `INNER_TEXT` varchar(200) default NULL,
  `INNER_TOTAL` decimal(14,4) default NULL,
  `MAKE_PRICE` decimal(14,4) default NULL,
  `MAKE_TEXT` varchar(200) default NULL,
  `SUB1_CODE` varchar(10) default NULL,
  `SUB1_WIDTH` varchar(20) default NULL,
  `SUB1_QTY` decimal(14,4) default NULL,
  `SUB1_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB1_TOTAL` decimal(14,4) default NULL,
  `SUB1_TEXT` varchar(200) default NULL,
  `SUB2_CODE` varchar(10) default NULL,
  `SUB2_WIDTH` varchar(20) default NULL,
  `SUB2_QTY` decimal(14,4) default NULL,
  `SUB2_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB2_TOTAL` decimal(14,4) default NULL,
  `SUB2_TEXT` varchar(200) default NULL,
  `SUB3_CODE` varchar(10) default NULL,
  `SUB3_WIDTH` varchar(20) default NULL,
  `SUB3_QTY` decimal(14,4) default NULL,
  `SUB3_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB3_TOTAL` decimal(14,4) default NULL,
  `SUB3_TEXT` varchar(200) default NULL,
  `SUB4_CODE` varchar(10) default NULL,
  `SUB4_WIDTH` varchar(20) default NULL,
  `SUB4_QTY` decimal(14,4) default NULL,
  `SUB4_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB4_TOTAL` decimal(14,4) default NULL,
  `SUB4_TEXT` varchar(200) default NULL,
  `SUB5_CODE` varchar(10) default NULL,
  `SUB5_WIDTH` varchar(20) default NULL,
  `SUB5_QTY` decimal(14,4) default NULL,
  `SUB5_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB5_TOTAL` decimal(14,4) default NULL,
  `SUB5_TEXT` varchar(200) default NULL,
  `SUB6_CODE` varchar(10) default NULL,
  `SUB6_WIDTH` varchar(20) default NULL,
  `SUB6_QTY` decimal(14,4) default NULL,
  `SUB6_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB6_TOTAL` decimal(14,4) default NULL,
  `SUB6_TEXT` varchar(200) default NULL,
  `SUB7_WIDTH` varchar(20) default NULL,
  `SUB7_QTY` decimal(14,4) default NULL,
  `SUB7_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB7_TOTAL` decimal(14,4) default NULL,
  `SUB7_TEXT` varchar(200) default NULL,
  `SUB8_WIDTH` varchar(20) default NULL,
  `SUB8_QTY` decimal(14,4) default NULL,
  `SUB8_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB8_TOTAL` decimal(14,4) default NULL,
  `SUB8_TEXT` varchar(200) default NULL,
  `SUB9_WIDTH` varchar(20) default NULL,
  `SUB9_QTY` decimal(14,4) default NULL,
  `SUB9_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB9_TOTAL` decimal(14,4) default NULL,
  `SUB9_TEXT` varchar(200) default NULL,
  `COST_PRICE` decimal(14,4) default NULL,
  `RRP_PRICE` decimal(14,4) default NULL,
  `PROFIT` decimal(14,4) default NULL,
  `CONTENT` varchar(2000) default NULL,
  `STATUS` char(1) default NULL,
  `UPDATED` date default NULL,
  `USERID` varchar(10) default NULL,
  `CONFIRMED` date default NULL,
  `CONFIRMED_USER` varchar(10) default NULL,
  PRIMARY KEY  (`ORDER_NO`,`STYLE`,`SUB_SUPPLIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_01t`
--

LOCK TABLES `cost_01t` WRITE;
/*!40000 ALTER TABLE `cost_01t` DISABLE KEYS */;
INSERT INTO `cost_01t` VALUES ('PO201110000','12345','SPRING','WTOP','1',NULL,'P1001','B1001','S1001','12.30mm',12.3000,0.3000,12.5000,'12',1.2000,'10mm',0.2000,12.5000,'12',3.5000,'12.5mm',0.4000,'test',23.2300,1000.0000,'가공비','S10','3mm',1.5000,0.3500,1.4000,'test2','S20','1mm',0.3000,10.2000,12.0000,'1','S30','1.5mm',1.0000,2.0000,3.0000,'2','','',0.0000,0.0000,0.0000,'','','',0.0000,0.0000,0.0000,'','','',0.0000,0.0000,0.0000,'','워싱비',1.0000,4.0000,7.0000,'6','염색비',2.0000,5.0000,8.0000,'','포장비',3.0000,6.0000,9.0000,'8',23000.0000,12000.0000,11000.0000,'이윤','Y','2011-05-31','9144','2011-05-31','9144');
/*!40000 ALTER TABLE `cost_01t` ENABLE KEYS */;
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
