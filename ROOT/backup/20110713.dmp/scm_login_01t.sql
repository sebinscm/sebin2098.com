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
-- Table structure for table `login_01t`
--

DROP TABLE IF EXISTS `login_01t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_01t` (
  `ID` varchar(5) NOT NULL,
  `PASSWD` varchar(20) default NULL,
  `NAME` varchar(50) default NULL,
  `EMAIL` varchar(60) default NULL,
  `PHONE1` varchar(30) default NULL,
  `PHONE2` varchar(30) default NULL,
  `FAX` varchar(30) default NULL,
  `CONTACT` varchar(30) default NULL,
  `ADDR1` varchar(50) default NULL,
  `ADDR2` varchar(50) default NULL,
  `POSTCODE` varchar(10) default NULL,
  `SURBURB` varchar(30) default NULL,
  `STATE` varchar(30) default NULL,
  `UPDATED` date default NULL,
  `USER_TYPE` varchar(2) default NULL,
  `USER_GROUP` varchar(1) default NULL,
  `DELETE_YN` varchar(1) default NULL,
  `PW_DATE` date default NULL,
  `SUPPLIER_CLASS` varchar(4) default NULL,
  `REGDATE` date default NULL,
  `COUNTRY` varchar(20) default NULL,
  `SHIP_PORT` varchar(2) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_01t`
--

LOCK TABLES `login_01t` WRITE;
/*!40000 ALTER TABLE `login_01t` DISABLE KEYS */;
INSERT INTO `login_01t` VALUES ('B1001','1234','HOT & Delicious ','jeffrey.song@ffb.net.au','213-748-0320','213-748-2282','213-748-0920','Jenny hun','1015S, Crocker st, suite Q-9','','CA90021','LOS Angeles','LA','2011-05-31','B','F','N','2011-06-14','USD',NULL,'US','05'),('B1002','1234','LIT LIMITED GUANGZHOU','jeffrey.song@ffb.net.au','86-20-8445-5342','86-134-5036-0905','86-20-8420-1346','GWANGWOO NAM','107# XiangXingShangwuZhongXin, 66-68Hao','XiaDulu','','HaizhouQu','Guangzhou','2011-05-31','B','F','N','2011-04-13','USD','2011-03-07','CN','05'),('B1003','1234','PANAMTEX INT\'L.,LTD','by-ellen@naver.com','86-20-2860-7139','86-159-1319-2623','86-20-2860-7169','Ellen Song','#No.4 HePanDongLu,SanDongDaDaoDong','FengHuangCun','','HuaduDistrict','Guangzhou','2011-05-31','B','F','N',NULL,'USD','2011-05-31','CN','05'),('B1004','1234','PANAMTEX INT\'L.,LTD','ao712345@hanmail.net','86-20-2860-7139','86-135-6014-4677','86-20-2860-7169','Suk Chi Won','#No.4 HePanDongLu,SanDongDaDaoDong','FengHuangCun','','HuaduDistrict','Guangzhou',NULL,'B','F','N',NULL,'USD','2011-05-31','CN','05'),('B1005','1234','PANAMTEX INT\'L.,LTD','benite@naver.com','86-20-2860-7139','86-137-1034-4506','86-20-2860-7169','Ming Sung Hee','#No.4 HePanDongLu,SanDongDaDaoDong','FengHuangCun','','HuaduDistrict','Guangzhou',NULL,'B','F','N',NULL,'USD','2011-05-31','CN','05'),('B1006','1234','PANAMTEX INT\'L.,LTD','khurta@naver.com','86-20-2860-7139','86-237-5186-2388','86-20-2860-7169','Amy Sohn','#No.4 HePanDongLu,SanDongDaDaoDong','FengHuangCun','','HuaduDistrict','',NULL,'B','F','N',NULL,'USD','2011-05-31','CN','05'),('B9999','1234','Buyer(Test)','jeffrey.song@fbf.net.au','+612 9748 2286','+61417 566 450','','Jeffrey H Song','13 Blue Gum Pl.','','2127','Newington','NSW','2011-06-03','B','F','N',NULL,'USD','2011-06-03','AU','05'),('P1001',NULL,'Local하청업체','email@email.com','1234-45678','1234-45678','1234-45678','James Lee','street','','2123','surburb','state','2011-05-23','P',NULL,'N',NULL,'USD','2011-05-05','CN',NULL),('S1001',NULL,'SEBIN TRADING ENTERPRISE','jeffrey.song@ffb.net.au','86.20.2837.6200','86.20.2837.6200','86.20.2837.6200','Sebin Lee','Room#401 No.10 Building,#20-22,','Chigang West Road','','HaiZhu District','Guangzhou','2011-05-31','S',NULL,'N',NULL,'USD','2011-04-08','CN',NULL);
/*!40000 ALTER TABLE `login_01t` ENABLE KEYS */;
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
