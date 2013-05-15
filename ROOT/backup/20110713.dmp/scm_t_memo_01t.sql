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
-- Table structure for table `t_memo_01t`
--

DROP TABLE IF EXISTS `t_memo_01t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_memo_01t` (
  `SEQNO` int(11) NOT NULL,
  `ADMINID` varchar(10) NOT NULL,
  `ADMINNAME` varchar(30) NOT NULL,
  `IDATE` date NOT NULL,
  `DFLAG` char(1) NOT NULL,
  `TITLE` varchar(100) default NULL,
  `AFNAME` varchar(50) default NULL,
  `CONTENTS` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_memo_01t`
--

LOCK TABLES `t_memo_01t` WRITE;
/*!40000 ALTER TABLE `t_memo_01t` DISABLE KEYS */;
INSERT INTO `t_memo_01t` VALUES (1,'9144','송행렬인가','2011-05-10','0','테스트 한글',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">테스트 한글테스트 한글테스트 한글테스트 한글테스트 한글테스트 한글</font></p>\r\n\r\n</body>\r\n'),(2,'9144','송행렬인가','2011-05-10','1','이번주 공지사항입니다.','anz[0].pdf','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\n\n\n\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">이번주 공지사항입니다. 업무에 참고히시기 바랍니다.</font></p>\n\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">이번주 공지사항입니다. 업무에 참고히시기 바랍니다.</font></p>\n\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">이번주 공지사항입니다. 업무에 참고히시기 바랍니다.</font></p>\n\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">이번주 공지사항입니다. 업무에 참고히시기 바랍니다.</font></p>\n\n</body>'),(3,'9144','Jeffrey H Song','2011-05-23','0','공지테스트',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\"><img src=\"http://www.sebin2098.com/memo/upload/gbn2.gif\" border=\"0\"></font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\"><b>세빈 SCM에 오신 것을 환영합니다!</b></font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;</p>\r\n\r\n</body>\r\n\r\n');
/*!40000 ALTER TABLE `t_memo_01t` ENABLE KEYS */;
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
