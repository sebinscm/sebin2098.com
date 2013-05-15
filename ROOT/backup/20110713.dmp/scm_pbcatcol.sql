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
-- Table structure for table `pbcatcol`
--

DROP TABLE IF EXISTS `pbcatcol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pbcatcol` (
  `pbc_tnam` char(65) NOT NULL,
  `pbc_tid` int(11) default NULL,
  `pbc_ownr` char(65) NOT NULL,
  `pbc_cnam` char(65) NOT NULL,
  `pbc_cid` smallint(6) default NULL,
  `pbc_labl` varchar(254) default NULL,
  `pbc_lpos` smallint(6) default NULL,
  `pbc_hdr` varchar(254) default NULL,
  `pbc_hpos` smallint(6) default NULL,
  `pbc_jtfy` smallint(6) default NULL,
  `pbc_mask` varchar(31) default NULL,
  `pbc_case` smallint(6) default NULL,
  `pbc_hght` smallint(6) default NULL,
  `pbc_wdth` smallint(6) default NULL,
  `pbc_ptrn` varchar(31) default NULL,
  `pbc_bmap` char(1) default NULL,
  `pbc_init` varchar(254) default NULL,
  `pbc_cmnt` varchar(254) default NULL,
  `pbc_edit` varchar(31) default NULL,
  `pbc_tag` varchar(254) default NULL,
  UNIQUE KEY `pbcatc_x` (`pbc_tnam`,`pbc_ownr`,`pbc_cnam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pbcatcol`
--

LOCK TABLES `pbcatcol` WRITE;
/*!40000 ALTER TABLE `pbcatcol` DISABLE KEYS */;
/*!40000 ALTER TABLE `pbcatcol` ENABLE KEYS */;
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
