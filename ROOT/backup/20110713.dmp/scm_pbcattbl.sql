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
-- Table structure for table `pbcattbl`
--

DROP TABLE IF EXISTS `pbcattbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pbcattbl` (
  `pbt_tnam` char(65) NOT NULL,
  `pbt_tid` int(11) default NULL,
  `pbt_ownr` char(65) NOT NULL,
  `pbd_fhgt` smallint(6) default NULL,
  `pbd_fwgt` smallint(6) default NULL,
  `pbd_fitl` char(1) default NULL,
  `pbd_funl` char(1) default NULL,
  `pbd_fchr` smallint(6) default NULL,
  `pbd_fptc` smallint(6) default NULL,
  `pbd_ffce` char(18) default NULL,
  `pbh_fhgt` smallint(6) default NULL,
  `pbh_fwgt` smallint(6) default NULL,
  `pbh_fitl` char(1) default NULL,
  `pbh_funl` char(1) default NULL,
  `pbh_fchr` smallint(6) default NULL,
  `pbh_fptc` smallint(6) default NULL,
  `pbh_ffce` char(18) default NULL,
  `pbl_fhgt` smallint(6) default NULL,
  `pbl_fwgt` smallint(6) default NULL,
  `pbl_fitl` char(1) default NULL,
  `pbl_funl` char(1) default NULL,
  `pbl_fchr` smallint(6) default NULL,
  `pbl_fptc` smallint(6) default NULL,
  `pbl_ffce` char(18) default NULL,
  `pbt_cmnt` varchar(254) default NULL,
  UNIQUE KEY `pbcatt_x` (`pbt_tnam`,`pbt_ownr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pbcattbl`
--

LOCK TABLES `pbcattbl` WRITE;
/*!40000 ALTER TABLE `pbcattbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `pbcattbl` ENABLE KEYS */;
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
