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
-- Table structure for table `po_comments`
--

DROP TABLE IF EXISTS `po_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `po_comments` (
  `SEQNO` int(10) NOT NULL auto_increment,
  `ORDER_NO` varchar(12) NOT NULL,
  `SUPPLIER_REMARKS` varchar(4000) default NULL,
  `BUYER_REMARKS` varchar(4000) default NULL,
  `SUPPLIER_ID` varchar(10) default NULL,
  `SUPPLIER_UPDATED` date default NULL,
  `BUYER_ID` varchar(10) default NULL,
  `BUYER_UPDATED` date default NULL,
  PRIMARY KEY  (`SEQNO`,`ORDER_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `po_comments`
--

LOCK TABLES `po_comments` WRITE;
/*!40000 ALTER TABLE `po_comments` DISABLE KEYS */;
INSERT INTO `po_comments` VALUES (1,'PO201110001','항목은 필수 입력항목입니다. Style번호는 숫자만 입력하세요. Style번호는 오더생성시에 \"SubGroup Code+Style번호\" 로 생성이 됩니다.테스트 추가',NULL,'9144','2011-06-24',NULL,NULL),(2,'PO201110001','항목은 필수 입력항목입니다. Style번호는 숫자만 입력하세요. Style번호는 오더생성시에 \"SubGroup Code+Style번호\" 로 생성이 됩니다.테스트 추가',NULL,'9144','2011-06-24',NULL,NULL),(3,'PO201110001','항목은 필수 입력항목입니다. Style번호는 숫자만 입력하세요. Style번호는 오더생성시에 \"SubGroup Code+Style번호\" 로 생성이 됩니다.테스트 추가\r\n\r\n항목은 필수 입력항목입니다. Style번호는 숫자만 입력하세요. Style번호는 오더생성시에 \"SubGroup Code+Style번호\" 로 생성이 됩니다.테스트 추가',NULL,'9144','2011-07-11',NULL,NULL);
/*!40000 ALTER TABLE `po_comments` ENABLE KEYS */;
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
