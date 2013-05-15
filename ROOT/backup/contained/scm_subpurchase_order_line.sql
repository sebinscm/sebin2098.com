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
-- Table structure for table `subpurchase_order_line`
--

DROP TABLE IF EXISTS `subpurchase_order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subpurchase_order_line` (
  `ORDER_NO` varchar(11) NOT NULL,
  `BACKORDER_FLAG` char(1) default NULL,
  `COLOUR` varchar(20) NOT NULL,
  `SUPPLIER_COLOUR` varchar(50) default NULL,
  `TOTAL_QTY` int(11) default NULL,
  `SQTY_1` int(11) default NULL,
  `SQTY_2` int(11) default NULL,
  `SQTY_3` int(11) default NULL,
  `SQTY_4` int(11) default NULL,
  `SQTY_5` int(11) default NULL,
  `SQTY_6` int(11) default NULL,
  `SQTY_7` int(11) default NULL,
  `SQTY_8` int(11) default NULL,
  `SQTY_9` int(11) default NULL,
  `SQTY_10` int(11) default NULL,
  PRIMARY KEY  (`ORDER_NO`,`COLOUR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subpurchase_order_line`
--

LOCK TABLES `subpurchase_order_line` WRITE;
/*!40000 ALTER TABLE `subpurchase_order_line` DISABLE KEYS */;
INSERT INTO `subpurchase_order_line` VALUES ('PO201110000','N','BALCK',NULL,140,40,50,50,0,0,0,NULL,NULL,NULL,NULL),('PO201110000','N','RED',NULL,230,40,50,140,0,0,0,NULL,NULL,NULL,NULL),('PO201110001','N','RED',NULL,520,150,250,120,0,0,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subpurchase_order_line` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-13 11:57:59
