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
-- Table structure for table `notice_01t`
--

DROP TABLE IF EXISTS `notice_01t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_01t` (
  `SEQNO` int(10) unsigned NOT NULL auto_increment,
  `INPUT_DATE` date NOT NULL,
  `USER_ID` varchar(10) NOT NULL,
  `USER_NAME` varchar(30) NOT NULL,
  `TYPE` int(6) default NULL,
  `TITLE` varchar(200) default NULL,
  `CONTENT` varchar(4000) default NULL,
  `READ_CNT` int(8) unsigned default NULL,
  `MODIFY_DATE` date default NULL,
  PRIMARY KEY  (`SEQNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_01t`
--

LOCK TABLES `notice_01t` WRITE;
/*!40000 ALTER TABLE `notice_01t` DISABLE KEYS */;
INSERT INTO `notice_01t` VALUES (1,'2011-06-29','9144','Jeffrey H Song',1,'업무 게시판','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><img src=\"http://www.sebin2098.com/notice_new/upload/image1.gif\" border=\"0\"></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">업무 게시판입니다.</font></p>\r\n\r\n</body>\r\n\r\n',24,'2011-07-08'),(2,'2011-06-29','9144','Jeffrey H Song',2,'세빈관리자 및 오더사용자 메뉴얼','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p><font face=\"Arial\" size=\"2\">세빈관리자 및 오더사용자 메뉴얼입니다.</font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">첨부된 문서를 다운로드하여 사용하시면 됩니다.</font></p>\r\n\r\n</body>\r\n',6,'2011-06-29'),(3,'2011-06-29','9144','Jeffrey H Song',2,'바이어용 메뉴얼입니다.','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">바이어용 사용자 메뉴얼입니다.</font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">첨부된 문서를 다운로드하여 사용하시면 됩니다.</font></p>\r\n\r\n</body>\r\n',8,'2011-06-29');
/*!40000 ALTER TABLE `notice_01t` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-13 11:57:58
