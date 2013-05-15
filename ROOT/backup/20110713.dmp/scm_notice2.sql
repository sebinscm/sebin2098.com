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
-- Table structure for table `notice2`
--

DROP TABLE IF EXISTS `notice2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice2` (
  `BBS_ID` int(20) NOT NULL auto_increment,
  `SUBJECT` varchar(255) NOT NULL,
  `CREATOR` varchar(255) default NULL,
  `PASSWORD` varchar(10) default NULL,
  `CREATOR_EMAIL` varchar(255) default NULL,
  `CREATOR_HOME` varchar(255) default NULL,
  `CREATE_DATE` date default NULL,
  `CONTENTS` varchar(2000) default NULL,
  `FILENAME` varchar(255) default NULL,
  `FILESIZE` int(20) default NULL,
  `HITS` int(5) default NULL,
  `P_BBS_ID` int(20) NOT NULL,
  `P_LEVEL` int(10) NOT NULL,
  `P_SERIAL` int(10) default NULL,
  `CREATOR_ID` varchar(10) default NULL,
  PRIMARY KEY  (`BBS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice2`
--

LOCK TABLES `notice2` WRITE;
/*!40000 ALTER TABLE `notice2` DISABLE KEYS */;
INSERT INTO `notice2` VALUES (1,'세빈SCM 관리자 및 사용자 메뉴얼','System Admin','1234','jeffrey.song@ffb.net.au','null','2011-06-28','안녕하세요,\r\n\r\nSebin SCM에 대한 시스템 관리자 및 사용자 메뉴얼입니다.\r\n첨부화일을 다운로드 하시기 바랍니다.\r\n','/upload/scm/SCM_Admin & Users_Manual.pdf',10520193,3,1,0,0,'9144'),(2,'Sebin SCM Buyers 메뉴얼','System Admin','1234','jeffrey.song@ffb.net.au','null','2011-06-28','Sebin SCM에 대한 Buyer를 위한 메뉴얼입니다.\r\n첨부된 문서를 읽기 위해서는 반드시 Adobe PDF Reader가 설치 되어 있어야 합니다.\r\n\r\n기타 문의사항에 대해서는 세빈 본사에 문의하여 주세요.','/upload/scm/SCM_Buyers_Manual.pdf',3921366,2,2,0,0,'9144');
/*!40000 ALTER TABLE `notice2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-13 11:57:31
