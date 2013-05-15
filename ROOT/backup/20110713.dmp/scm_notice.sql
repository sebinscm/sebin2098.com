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
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
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
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'게시판입니다.','Jeffrey','1234','jeffrey.song@ffb.net.au','null','2011-05-10','자유로운 질문 답변 게시판 입니다.\n이곳에 자유롭게 게시를 할 수 있습니다. \n*주의사항: 작성을 위해서는 필히 제목,작성자,비밀번호를 입력해야 합니다!','null',0,34,1,0,0,'9144'),(2,'게시판 테스트입니다.','홍길동','1234','null','null','2011-05-24','게시판 테스트입니다.게시판 테스트입니다.게시판 테스트입니다.게시판 테스트입니다.게시판 테스트입니다.게시판 테스트입니다.게시판 테스트입니다.게시판 테스트입니다.','null',0,26,2,0,0,'9144');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
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
