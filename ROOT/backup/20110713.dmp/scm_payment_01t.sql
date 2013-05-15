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
-- Table structure for table `payment_01t`
--

DROP TABLE IF EXISTS `payment_01t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_01t` (
  `INVOICE_NO` varchar(15) NOT NULL,
  `SEQ_NO` int(3) NOT NULL,
  `PAY_DATE` date default NULL,
  `BUYER` varchar(10) NOT NULL,
  `SUPPLIER` varchar(10) NOT NULL,
  `PAY_AMT` decimal(15,4) default NULL,
  `PAY_COMMENT` varchar(1000) default NULL,
  `CLOSE_YN` varchar(1) default 'N',
  `CLAIM_AMOUNT` decimal(15,4) default '0.0000',
  `CLAIM_COMMENT` varchar(1000) default NULL,
  `CLAIM_DATE` date default NULL,
  `UPDATED` date default NULL,
  `UPDATED_ID` varchar(10) default '0',
  PRIMARY KEY  (`INVOICE_NO`,`SEQ_NO`,`BUYER`,`SUPPLIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_01t`
--

LOCK TABLES `payment_01t` WRITE;
/*!40000 ALTER TABLE `payment_01t` DISABLE KEYS */;
INSERT INTO `payment_01t` VALUES ('INV20110612',1,'2011-06-20','B9999','S1001',1200.0000,'','N',0.0000,'','0000-00-00','2011-06-08','9144'),('INV20110612',2,'2011-06-29','B9999','S1001',20743.0000,'','Y',0.0000,'입금완료','0000-00-00','2011-06-08','9144'),('INV5678',1,'2011-05-17','B1001','S1001',1234.5000,'','Y',0.0000,'','0000-00-00','2011-05-25','9144');
/*!40000 ALTER TABLE `payment_01t` ENABLE KEYS */;
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
