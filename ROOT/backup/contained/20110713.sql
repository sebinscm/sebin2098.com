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
-- Current Database: `scm`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `scm` /*!40100 DEFAULT CHARACTER SET euckr */;

USE `scm`;

--
-- Table structure for table `admin_01t`
--

DROP TABLE IF EXISTS `admin_01t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_01t` (
  `ADMINID` varchar(10) NOT NULL,
  `ADMINNAME` varchar(30) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `ADMINTYPE` varchar(5) default NULL,
  `ADMINGROUP` varchar(5) default 'A',
  `PW_DATE` date default NULL,
  `BRAND` varchar(2) default NULL,
  `ADMINCLASS` varchar(1) default NULL,
  `EMAIL` varchar(100) default NULL,
  `EMAIL_YN` varchar(1) default NULL,
  `APPROVAL` varchar(1) default NULL,
  PRIMARY KEY  (`ADMINID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_01t`
--

LOCK TABLES `admin_01t` WRITE;
/*!40000 ALTER TABLE `admin_01t` DISABLE KEYS */;
INSERT INTO `admin_01t` VALUES ('1000','CEO','1234','H','A',NULL,NULL,'1','ceo@sebin2098.com',NULL,'Y'),('1001','김은실','1234','H','B',NULL,NULL,'1','EunSilKim@sebin2098.com',NULL,'Y'),('2000','배상갑','gavi1004','H','A','2011-06-28','1','1','gvinschina@sebin2098.com',NULL,'Y'),('9144','Jeffrey H Song','1234','H','A','2011-05-26','1','1','jeffrey.song@ffb.net.au',NULL,'Y'),('9155','Alex Kim','1234','H','A',NULL,'1','1','alexkim9087@naver.com',NULL,'N');
/*!40000 ALTER TABLE `admin_01t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_01t`
--

DROP TABLE IF EXISTS `cost_01t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_01t` (
  `ORDER_NO` varchar(11) NOT NULL,
  `STYLE` varchar(20) NOT NULL,
  `SEASON` varchar(10) default NULL,
  `SGR` varchar(10) default NULL,
  `PGR` varchar(10) default NULL,
  `REORDER_SEQ` varchar(10) default NULL,
  `SUB_SUPPLIER` varchar(10) NOT NULL default '',
  `BUYER` varchar(10) default NULL,
  `SUPPLIER` varchar(10) default NULL,
  `MAIN_WIDTH` varchar(20) default NULL,
  `MAIN_QTY` decimal(14,4) default NULL,
  `MAIN_UNIT_PRICE` decimal(14,4) default NULL,
  `MAIN_TOTAL` decimal(14,4) default NULL,
  `MAIN_TEXT` varchar(200) default NULL,
  `COLOR_QTY` decimal(14,4) default NULL,
  `COLOR_WIDTH` varchar(20) default NULL,
  `COLOR_UNIT_PRICE` decimal(14,4) default NULL,
  `COLOR_TOTAL` decimal(14,4) default NULL,
  `COLOR_TEXT` varchar(200) default NULL,
  `INNER_QTY` decimal(14,4) default NULL,
  `INNER_WIDTH` varchar(20) default NULL,
  `INNER_UNIT_PRICE` decimal(14,4) default NULL,
  `INNER_TEXT` varchar(200) default NULL,
  `INNER_TOTAL` decimal(14,4) default NULL,
  `MAKE_PRICE` decimal(14,4) default NULL,
  `MAKE_TEXT` varchar(200) default NULL,
  `SUB1_CODE` varchar(10) default NULL,
  `SUB1_WIDTH` varchar(20) default NULL,
  `SUB1_QTY` decimal(14,4) default NULL,
  `SUB1_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB1_TOTAL` decimal(14,4) default NULL,
  `SUB1_TEXT` varchar(200) default NULL,
  `SUB2_CODE` varchar(10) default NULL,
  `SUB2_WIDTH` varchar(20) default NULL,
  `SUB2_QTY` decimal(14,4) default NULL,
  `SUB2_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB2_TOTAL` decimal(14,4) default NULL,
  `SUB2_TEXT` varchar(200) default NULL,
  `SUB3_CODE` varchar(10) default NULL,
  `SUB3_WIDTH` varchar(20) default NULL,
  `SUB3_QTY` decimal(14,4) default NULL,
  `SUB3_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB3_TOTAL` decimal(14,4) default NULL,
  `SUB3_TEXT` varchar(200) default NULL,
  `SUB4_CODE` varchar(10) default NULL,
  `SUB4_WIDTH` varchar(20) default NULL,
  `SUB4_QTY` decimal(14,4) default NULL,
  `SUB4_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB4_TOTAL` decimal(14,4) default NULL,
  `SUB4_TEXT` varchar(200) default NULL,
  `SUB5_CODE` varchar(10) default NULL,
  `SUB5_WIDTH` varchar(20) default NULL,
  `SUB5_QTY` decimal(14,4) default NULL,
  `SUB5_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB5_TOTAL` decimal(14,4) default NULL,
  `SUB5_TEXT` varchar(200) default NULL,
  `SUB6_CODE` varchar(10) default NULL,
  `SUB6_WIDTH` varchar(20) default NULL,
  `SUB6_QTY` decimal(14,4) default NULL,
  `SUB6_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB6_TOTAL` decimal(14,4) default NULL,
  `SUB6_TEXT` varchar(200) default NULL,
  `SUB7_WIDTH` varchar(20) default NULL,
  `SUB7_QTY` decimal(14,4) default NULL,
  `SUB7_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB7_TOTAL` decimal(14,4) default NULL,
  `SUB7_TEXT` varchar(200) default NULL,
  `SUB8_WIDTH` varchar(20) default NULL,
  `SUB8_QTY` decimal(14,4) default NULL,
  `SUB8_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB8_TOTAL` decimal(14,4) default NULL,
  `SUB8_TEXT` varchar(200) default NULL,
  `SUB9_WIDTH` varchar(20) default NULL,
  `SUB9_QTY` decimal(14,4) default NULL,
  `SUB9_UNIT_PRICE` decimal(14,4) default NULL,
  `SUB9_TOTAL` decimal(14,4) default NULL,
  `SUB9_TEXT` varchar(200) default NULL,
  `COST_PRICE` decimal(14,4) default NULL,
  `RRP_PRICE` decimal(14,4) default NULL,
  `PROFIT` decimal(14,4) default NULL,
  `CONTENT` varchar(2000) default NULL,
  `STATUS` char(1) default NULL,
  `UPDATED` date default NULL,
  `USERID` varchar(10) default NULL,
  `CONFIRMED` date default NULL,
  `CONFIRMED_USER` varchar(10) default NULL,
  PRIMARY KEY  (`ORDER_NO`,`STYLE`,`SUB_SUPPLIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_01t`
--

LOCK TABLES `cost_01t` WRITE;
/*!40000 ALTER TABLE `cost_01t` DISABLE KEYS */;
INSERT INTO `cost_01t` VALUES ('PO201110000','12345','SPRING','WTOP','1',NULL,'P1001','B1001','S1001','12.30mm',12.3000,0.3000,12.5000,'12',1.2000,'10mm',0.2000,12.5000,'12',3.5000,'12.5mm',0.4000,'test',23.2300,1000.0000,'가공비','S10','3mm',1.5000,0.3500,1.4000,'test2','S20','1mm',0.3000,10.2000,12.0000,'1','S30','1.5mm',1.0000,2.0000,3.0000,'2','','',0.0000,0.0000,0.0000,'','','',0.0000,0.0000,0.0000,'','','',0.0000,0.0000,0.0000,'','워싱비',1.0000,4.0000,7.0000,'6','염색비',2.0000,5.0000,8.0000,'','포장비',3.0000,6.0000,9.0000,'8',23000.0000,12000.0000,11000.0000,'이윤','Y','2011-05-31','9144','2011-05-31','9144');
/*!40000 ALTER TABLE `cost_01t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gp_input`
--

DROP TABLE IF EXISTS `gp_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gp_input` (
  `PO_NO` varchar(20) NOT NULL,
  `STYLE` varchar(20) default NULL,
  `PT_INFO` varchar(500) default NULL,
  `UPDATED` date default NULL,
  `USERID` varchar(10) default NULL,
  `PT_DATE` date default NULL,
  `SEQ` int(11) NOT NULL,
  PRIMARY KEY  (`PO_NO`,`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gp_input`
--

LOCK TABLES `gp_input` WRITE;
/*!40000 ALTER TABLE `gp_input` DISABLE KEYS */;
INSERT INTO `gp_input` VALUES ('PO201110000',NULL,'PT#1 1','2011-06-30','9144','2011-05-30',1),('PO201110000',NULL,'PT#2','2011-05-24','9144','2011-05-31',2),('PO201110001',NULL,'PT#정보 추가입니다.','2011-06-30','9144','2011-06-06',1),('PO201110001',NULL,'PT#정보 2번째 추가입니다.','2011-06-30','9144','2011-06-29',2),('PO201110001',NULL,'PT#정보 3번째 추가입니다.','2011-06-30','9144','2011-06-29',3);
/*!40000 ALTER TABLE `gp_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_01t`
--

DROP TABLE IF EXISTS `invoice_01t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_01t` (
  `INVOICE_DATE` date NOT NULL,
  `INVOICE_NO` varchar(15) NOT NULL,
  `BUYER_ID` varchar(10) NOT NULL,
  `SUP_ID` varchar(10) NOT NULL,
  `FILE_NAME` varchar(50) default NULL,
  `UPDATED` date default NULL,
  `STATUS` char(1) default 'N',
  `GP_STATUS` char(1) default 'N',
  `GP_DATE` date default NULL,
  `RCV_DATE` date default NULL,
  `PAID_DATE` date default NULL,
  PRIMARY KEY  (`INVOICE_DATE`,`INVOICE_NO`,`BUYER_ID`,`SUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_01t`
--

LOCK TABLES `invoice_01t` WRITE;
/*!40000 ALTER TABLE `invoice_01t` DISABLE KEYS */;
INSERT INTO `invoice_01t` VALUES ('2011-05-10','INV1234','B1001','S1001','B1001_INV1234.XLS','2011-05-10','R','Y','2011-05-10','2011-05-17',NULL),('2011-05-10','INV8787','B1002','S1001','B1002_INV8787.XLS','2011-05-10','S','Y','2011-05-10',NULL,NULL),('2011-05-19','INV2323','B1001','S1001','B1001_INV2323.JPG','2011-05-19','P','N',NULL,NULL,NULL),('2011-05-19','INV543','B1001','S1001','B1001_INV543.JPG','2011-05-19','R','Y','2011-05-19',NULL,'0000-00-00'),('2011-05-25','INV5678','B1001','S1001','B1001_INV5678.XLS','2011-05-25','R','Y','2011-05-25','2011-05-25','2011-05-25'),('2011-06-07','INV20110612','B9999','S1001','B9999_INV20110612.JPG','2011-06-07','C','N',NULL,NULL,'2011-06-08'),('2011-10-05','INV8787','B1002','S1001','B1002_INV8787.XLS','2011-10-05','S','Y','2011-10-05',NULL,NULL);
/*!40000 ALTER TABLE `invoice_01t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_02t`
--

DROP TABLE IF EXISTS `invoice_02t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_02t` (
  `INVOICE_NO` varchar(15) NOT NULL,
  `SEQ` int(3) NOT NULL,
  `PO_NO` varchar(15) NOT NULL,
  `STYLE_NO` varchar(15) default NULL,
  `QTY` int(5) default NULL,
  `PRICE` decimal(10,4) default NULL,
  `SUP_ID` varchar(10) default NULL,
  `BUYER_ID` varchar(10) default NULL,
  `UPDATED` date default NULL,
  `AIR_PRICE` decimal(10,4) default NULL,
  `DISC_PRICE` decimal(10,4) default '0.0000',
  PRIMARY KEY  (`INVOICE_NO`,`SEQ`,`PO_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_02t`
--

LOCK TABLES `invoice_02t` WRITE;
/*!40000 ALTER TABLE `invoice_02t` DISABLE KEYS */;
INSERT INTO `invoice_02t` VALUES ('INV1234',1,'PO201110001','WPNT10000',120,34.9000,'S1001','B1001','2011-05-10',NULL,0.0000),('INV1234',2,'PO201110003','WSKT12345',218,19.9500,'S1001','B1001','2011-05-10',NULL,0.0000),('INV20110612',1,'PO201110002','WJKT78910',1400,12.9500,'S1001','B9999','2011-06-07',NULL,0.0000),('INV20110612',2,'PO201110003','WPNT9087',310,12.3000,'S1001','B9999','2011-06-07',NULL,0.0000),('INV2323',1,'PO201110003','WSKT12345',218,9.9500,'S1001','B1001','2011-05-19',NULL,0.0000),('INV543',1,'PO201110003','WSKT12345',218,9.9500,'S1001','B1001','2011-05-19',NULL,0.0000),('INV5678',1,'PO201110000','WTOP12345',310,19.9500,'S1001','B1001','2011-05-25',NULL,0.0000),('INV8787',1,'PO201110002','WJKT21111',2700,25.4500,'S1001','B1002','2011-05-10',NULL,0.0000);
/*!40000 ALTER TABLE `invoice_02t` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `login_02t`
--

DROP TABLE IF EXISTS `login_02t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_02t` (
  `ID` varchar(6) NOT NULL,
  `MODIFYID` varchar(10) default NULL,
  `MODIFY_DATE` date default NULL,
  `SUPPLY_NAME` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_02t`
--

LOCK TABLES `login_02t` WRITE;
/*!40000 ALTER TABLE `login_02t` DISABLE KEYS */;
INSERT INTO `login_02t` VALUES ('10000','9144','2011-04-07','SEBIN DESIGN');
/*!40000 ALTER TABLE `login_02t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_t`
--

DROP TABLE IF EXISTS `menu_t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_t` (
  `SEQNO` int(19) NOT NULL auto_increment,
  `MENU_TYPE` varchar(2) NOT NULL,
  `USER_GROUP` varchar(5) NOT NULL,
  `MENUNAME` varchar(100) NOT NULL,
  `MENUURL` varchar(200) default NULL,
  `SORT_NO` varchar(4) default NULL,
  `PARENT_NO` int(19) NOT NULL,
  `STAFFID` varchar(10) default NULL,
  `INPUT_DATE` date default NULL,
  `MODIFYID` varchar(10) default NULL,
  `MODIFY_DATE` date default NULL,
  PRIMARY KEY  (`SEQNO`,`MENU_TYPE`,`USER_GROUP`,`MENUNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_t`
--

LOCK TABLES `menu_t` WRITE;
/*!40000 ALTER TABLE `menu_t` DISABLE KEYS */;
INSERT INTO `menu_t` VALUES (1,'Z','Z','Home',NULL,'000',1,'3',NULL,'3',NULL),(43,'H','N','My Account',NULL,'100',1,'3',NULL,'3',NULL),(44,'H','N','Buyer공지관리','/admin/memo/','110',43,'3',NULL,'9144',NULL),(48,'H','N','오더관리','','300',1,'3',NULL,'9144','2011-05-31'),(49,'H','N','PO수정','/ordermanagement/admin_order_list.jsp','310',48,'3',NULL,'9144',NULL),(50,'H','N','Order Amendment','/ordermanagement/order_amend_list.jsp','320',48,'3',NULL,'9144',NULL),(52,'H','N','Shipment생성','/ordermanagement/shipment_issue_list.jsp','510',528,'3',NULL,'9144',NULL),(54,'H','N','Invoices Search','/order/admin_invoice_search.jsp','360',48,'3',NULL,'3',NULL),(55,'H','N','업무게시판/자료실',NULL,'900',1,'3',NULL,'9144',NULL),(56,'H','N','제품정보 조회','/ordermanagementr/product_info.jsp','910',55,'3',NULL,'9144',NULL),(61,'H','N','Password Change','/admin/resetAdminPasswdForm.jsp?fromURL=menu','160',43,'9240',NULL,'9240',NULL),(101,'H','B','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(102,'H','B','SAMPLE관리',NULL,'200',1,NULL,NULL,'9144',NULL),(103,'H','B','Password Change','/admin/resetAdminPasswdForm.jsp?fromURL=menu','150',101,NULL,NULL,NULL,NULL),(110,'H','B','업무게시판/자료실',NULL,'900',1,NULL,NULL,'9144',NULL),(111,'H','B','제품정보 조회','/ordermanagement/product_info.jsp','910',110,NULL,NULL,'9144',NULL),(114,'H','N','SAMPLE관리',NULL,'200',1,NULL,NULL,'9144',NULL),(115,'H','N','Sample이미지 관리','/admin/buyer/style_image_upload_form.jsp','210',114,NULL,NULL,'9144',NULL),(116,'H','B','Sample이미지 관리','/admin/buyer/style_image_upload_form.jsp','240',102,NULL,NULL,'9144','2011-06-02'),(117,'H','N','Original Sample관리','/admin/buyer/original_sample_in_out_list.jsp','220',114,NULL,NULL,'9144',NULL),(118,'H','B','Original Sample관리','/admin/buyer/original_sample_in_out_list.jsp','220',102,NULL,NULL,'9144',NULL),(201,'C','M','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(202,'C','M','Memorandum','/memo/memo.jsp','110',201,NULL,NULL,NULL,NULL),(203,'C','M','Profile','/account/','120',201,NULL,NULL,NULL,NULL),(205,'C','M','Order Management',NULL,'300',1,NULL,NULL,NULL,NULL),(206,'C','M','PO Confirmation','/order/dsk_po_confirm_search.jsp','310',205,NULL,NULL,'9240',NULL),(207,'C','M','PO History','/order/dsk_po_status.jsp','320',205,NULL,NULL,NULL,NULL),(208,'C','M','Order Amendment','/order/po_amend.jsp','330',205,NULL,NULL,NULL,NULL),(209,'C','M','Barcode Files','/order/barcode.jsp','340',205,NULL,NULL,NULL,NULL),(211,'C','M','Packing List','/order/packing.jsp','361',205,NULL,NULL,NULL,NULL),(213,'C','M','Q.C Roster','/order/qc_report.jsp','380',205,NULL,NULL,NULL,NULL),(214,'C','M','Q.C Analysis','/order/qc_analysis.jsp','390',205,NULL,NULL,NULL,NULL),(216,'C','M','GI Packing List','/order/invoice_confirm_search_dsk.jsp','362',205,NULL,NULL,NULL,NULL),(220,'C','M','Services & Support',NULL,'500',1,NULL,NULL,NULL,NULL),(221,'C','M','Product Info.','/order/product_info.jsp','510',220,NULL,NULL,NULL,NULL),(222,'C','M','Manuals','/notice/list.jsp?table_name=notice','530',220,NULL,NULL,'9240',NULL),(224,'C','M','Password Change','/apess/resetPasswdForm.jsp?fromURL=menu','140',201,NULL,NULL,NULL,NULL),(226,'C','C','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(227,'C','C','Memorandum','/memo/memo.jsp','110',226,NULL,NULL,NULL,NULL),(228,'C','C','Password Change','/apess/resetPasswdForm.jsp?fromURL=menu','140',226,NULL,NULL,NULL,NULL),(229,'C','C','Payment Management',NULL,'300',1,NULL,NULL,NULL,NULL),(230,'C','C','PO History','/order/dsk_po_status.jsp','320',229,NULL,NULL,NULL,NULL),(233,'C','C','GI Packing List','/order/invoice_confirm_search_dsk.jsp','362',229,NULL,NULL,NULL,NULL),(237,'C','C','Invoice Search','/apess/invoice_list.jsp','351',229,NULL,NULL,NULL,NULL),(238,'C','C','Services & Support',NULL,'600',1,NULL,NULL,NULL,NULL),(239,'C','C','Product Info.','/order/product_info.jsp','610',238,NULL,NULL,NULL,NULL),(240,'C','C','Manuals','/notice/list.jsp?table_name=notice','630',238,NULL,NULL,'9240',NULL),(242,'C','S','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(243,'C','S','Memorandum','/memo/memo.jsp','110',242,NULL,NULL,NULL,NULL),(244,'C','S','Password Change','/apess/resetPasswdForm.jsp?fromURL=menu','140',242,NULL,NULL,NULL,NULL),(245,'C','S','Shipment Management',NULL,'300',1,NULL,NULL,NULL,NULL),(247,'C','S','Packing Form Creation','/order/packing_create.jsp','350',245,NULL,NULL,NULL,NULL),(248,'C','S','Packing List','/order/packing.jsp','351',245,NULL,NULL,NULL,NULL),(252,'C','S','Invoice Creation','/apess/invoice_issue_list.jsp','360',245,NULL,NULL,NULL,NULL),(253,'C','S','Invoice Search','/apess/invoice_list.jsp','361',245,NULL,NULL,NULL,NULL),(257,'C','A','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(258,'C','A','Memorandum','/memo/memo.jsp','110',257,NULL,NULL,'9240',NULL),(259,'C','A','Password Change','/apess/resetPasswdForm.jsp?fromURL=menu','140',257,NULL,NULL,NULL,NULL),(260,'C','A','Shipment Management',NULL,'300',1,NULL,NULL,NULL,NULL),(261,'C','A','PO History','/order/dsk_po_status.jsp','320',260,NULL,NULL,NULL,NULL),(262,'C','A','Packing List','/order/packing.jsp','351',260,NULL,NULL,NULL,NULL),(263,'C','A','Received Qty List','/order/invoice_confirm_search_dsk.jsp','352',260,NULL,NULL,'9240',NULL),(265,'C','A','Invoice Search','/apess/invoice_list.jsp','361',260,NULL,NULL,NULL,NULL),(268,'C','A','Services & Support',NULL,'600',1,NULL,NULL,NULL,NULL),(269,'C','A','Product Info.','/order/product_info.jsp','610',268,NULL,NULL,NULL,NULL),(270,'C','A','Manuals','/notice/list.jsp?table_name=notice','630',268,NULL,NULL,'9240',NULL),(272,'C','A','Packing Form Creation','/order/packing_create.jsp','350',260,NULL,NULL,NULL,NULL),(273,'C','A','Invoice Creation','/apess/invoice_issue_list.jsp','360',260,NULL,NULL,NULL,NULL),(274,'C','A','PO History+','/order/dsk_po_status.jsp?M=Y','321',260,NULL,NULL,'9240',NULL),(275,'C','A','Invoice Search+','/apess/invoice_list.jsp?M=Y','362',260,NULL,NULL,'9240',NULL),(276,'C','A','Apess User List','/admin/apessuser/list.jsp','120',257,NULL,NULL,'9240',NULL),(277,'C','A','Inspector Management','/apess/inspector_list.jsp','130',257,NULL,NULL,NULL,NULL),(286,'H','A','나의계정','','050',1,NULL,NULL,'9144','2011-05-23'),(287,'H','A','SAMPLE관리',NULL,'200',1,NULL,NULL,'9144',NULL),(288,'H','A','오더관리',NULL,'300',1,NULL,NULL,'9144',NULL),(289,'H','A','업무게시판/자료실',NULL,'900',1,NULL,NULL,'9144',NULL),(290,'H','A','Buyer 공지사항 관리','/admin/memo/','110',494,NULL,NULL,'9144',NULL),(291,'H','A','Buyer관리','/account/supplier.jsp','120',494,NULL,NULL,'9144',NULL),(293,'H','A','사용자 관리','/admin/adminuser/list.jsp','140',494,NULL,NULL,'9144',NULL),(296,'H','A','사용자 메뉴관리','/admin/menu/menu_list.jsp?menuType=H','150',494,NULL,NULL,'9144','2011-06-03'),(297,'H','A','Buyer 메뉴 관리','/admin/menu/menu_list.jsp?menuType=S','151',494,NULL,NULL,'9144','2011-06-03'),(299,'H','A','비밀번호 변경','/admin/resetAdminPasswdForm.jsp?fromURL=menu','060',286,NULL,NULL,'9144',NULL),(300,'H','A','Sample이미지 관리','/admin/buyer/style_image_upload_form.jsp','250',287,NULL,NULL,'9144','2011-06-02'),(301,'H','A','Original Sample관리','/admin/buyer/original_sample_in_out_list.jsp','220',287,NULL,NULL,'9144',NULL),(302,'H','A','PO수정','/ordermanagement/admin_order_list.jsp','310',288,NULL,NULL,'9144',NULL),(303,'H','A','Order Amendment','/ordermanagement/order_amend_list.jsp','320',288,NULL,NULL,'9144',NULL),(305,'H','A','Shipment생성','/ordermanagement/shipment_issue_list.jsp','510',525,NULL,NULL,'9144',NULL),(308,'H','A','Invoices검색','/payment/invoice_search.jsp','740',527,NULL,NULL,'9144',NULL),(311,'H','A','제품정보 조회','/ordermanagement/admin_item_history_list.jsp','910',289,NULL,NULL,'9144',NULL),(351,'C','S','PO History','/order/dsk_po_status.jsp','320',245,'9240',NULL,'9240',NULL),(353,'C','A','Q.C Roster','/order/qc_report.jsp','380',260,'9240',NULL,'9240',NULL),(354,'C','A','Q.C Analysis','/order/qc_analysis.jsp','381',260,'9240',NULL,'9240',NULL),(355,'C','A','Barcode Files','/order/barcode.jsp','340',260,'9240',NULL,'9240',NULL),(356,'C','S','Barcode Files','/order/barcode.jsp','340',245,'9240',NULL,'9240',NULL),(359,'C','A','Barcode Check','/pda.jsp','390',260,'9240',NULL,'9240',NULL),(360,'C','C','Barcode Check','/pda.jsp','390',229,'9240',NULL,'9240',NULL),(361,'C','M','Barcode Check','/pda.jsp','395',205,'9240',NULL,'9240',NULL),(362,'C','S','Barcode Check','/pda.jsp','390',245,'9240',NULL,'9240',NULL),(364,'H','N','Buyer관리','/account/supplier.jsp','120',43,'9240',NULL,'9144',NULL),(391,'H','A','자료실','/notice_new/list.jsp?noticeType=2','940',289,'9240',NULL,'9144','2011-06-29'),(392,'H','N','자료실','/notice_new/list.jsp?noticeType=2','940',55,'9240',NULL,'9144','2011-06-29'),(393,'H','B','자료실','/notice_new/list.jsp?noticeType=2','940',110,'9240',NULL,'9144','2011-06-29'),(400,'S','F','My Account','','100',1,'9240',NULL,'9144','2011-05-23'),(401,'S','F','Order Management',NULL,'300',1,'9240',NULL,'9144',NULL),(402,'S','F','Invoices',NULL,'400',1,'9240',NULL,'9144',NULL),(403,'S','F','업무게시판/자료실',NULL,'500',1,'9240',NULL,'9144',NULL),(404,'S','F','공지사항','/memo/index.jsp','110',400,'9240',NULL,'9144',NULL),(405,'S','F','Profile','/account/view_profile.jsp','120',400,'9240',NULL,'9144',NULL),(406,'S','F','PO Confirmation','/ordermanagement/buyer_order_confirm_list.jsp','310',401,'9240',NULL,'9144',NULL),(407,'S','F','PO History','/ordermanagement/buyer_order_list.jsp','320',401,'9240',NULL,'9144',NULL),(408,'S','F','Order Amendment','/ordermanagement/buyer_order_amend_list.jsp','330',401,'9240',NULL,'9144',NULL),(412,'S','F','Invoice조회','/payment/buyer_invoice_search.jsp','405',402,'9240',NULL,'9144',NULL),(415,'S','F','Payment조회','/payment/buyer_payment_search.jsp','425',402,'9240',NULL,'9144',NULL),(417,'S','F','제품정보 조회','/ordermanagement/buyer_item_history_list.jsp','510',403,'9240',NULL,'9144',NULL),(418,'S','F','게시판','/notice_new/buyer_list.jsp?noticeType=1','530',403,'9240',NULL,'9144','2011-06-29'),(419,'S','F','자료실','/notice_new/buyer_list.jsp?noticeType=2','540',403,'9240',NULL,'9144','2011-06-29'),(447,'C','A','Tag Specs','/notice/list.jsp?table_name=notice2','640',268,'9240',NULL,'9240',NULL),(448,'C','C','Tag Specs','/notice/list.jsp?table_name=notice2','640',238,'9240',NULL,'9240',NULL),(449,'C','M','Tag Specs','/notice/list.jsp?table_name=notice2','540',220,'9240',NULL,'9240',NULL),(453,'H','A','Order Status관리','/ordermanagement/admin_order_status_list.jsp','315',288,'9240',NULL,'9144',NULL),(454,'H','B','오더관리',NULL,'300',1,'9240',NULL,'9144',NULL),(455,'H','B','Order Status관리','/ordermanagement/admin_order_status_list.jsp','315',454,'9240',NULL,'9144',NULL),(457,'S','F','Shipment List','/ordermanagement/buyer_shipment_list.jsp','375',401,'9240',NULL,'9144',NULL),(458,'H','A','Shipment List','/ordermanagement/admin_shipment_list.jsp','520',525,'9240',NULL,'9144',NULL),(459,'H','N','Shipment List','/ordermanagement/admin_shipment_list.jsp','520',528,'9240',NULL,'9144',NULL),(460,'C','A','Profile','/account/','135',257,'9240',NULL,'9240',NULL),(461,'H','N','Order Status관리','/ordermanagement/admin_order_status_list.jsp','315',48,'9240',NULL,'9144',NULL),(485,'C','A','Shipment Creation','/order/shipment_issue_list.jsp','355',260,'9240',NULL,'9240',NULL),(486,'C','A','Shipment List','/order/shipment_list.jsp','356',260,'9240',NULL,'9240',NULL),(487,'C','A','Credit/Debit Note','/order/dsk_note.jsp','363',260,'9240',NULL,'9240',NULL),(488,'C','S','Shipment Creation','/order/shipment_issue_list.jsp','355',245,'9240',NULL,'9240',NULL),(489,'C','S','Shipment List','/order/shipment_list.jsp','356',245,'9240',NULL,'9240',NULL),(490,'C','S','Credit/Debit Note','/order/dsk_note.jsp','363',245,'9240',NULL,'9240',NULL),(491,'C','C','Credit/Debit Note','/order/dsk_note.jsp','363',229,'9240',NULL,'9240',NULL),(492,'H','A','기초코드 관리','/admin/codes/code_list.jsp','125',494,'9144',NULL,'9144',NULL),(494,'H','A','시스템관리','','100',1,'9144',NULL,'9144','2011-05-23'),(496,'H','A','시스템공지 관리','/admin/notice/list.jsp','155',494,'9144',NULL,'9144',NULL),(497,'H','A','생산업체 등록','/account/sub_list.jsp','130',494,'9144',NULL,'9144',NULL),(498,'H','A','PO생성','/ordermanagement/PurchaseOrder.jsp','305',288,'9144',NULL,'9144',NULL),(500,'H','A','상품이미지 Upload','/ordermanagement/image_upload.jsp','313',288,'9144',NULL,'9144',NULL),(502,'H','A','Company Logo등록','/admin/codes/companyci_upload.jsp','160',494,'9144',NULL,'9144',NULL),(504,'H','A','상품이미지 Batch Upload','/ordermanagement/style_image_upload_form.jsp','314',288,'9144',NULL,'9144',NULL),(505,'H','B','상품이미지 Batch Upload','/ordermanagement/style_image_upload_form.jsp','321',454,'9144',NULL,'9144','2011-06-08'),(506,'H','N','상품이미지 Batch Upload','/ordermanagement/style_image_upload_form.jsp','305',48,'9144',NULL,'9144',NULL),(508,'S','F','SAMPLE관리',NULL,'200',1,'9144',NULL,'9144',NULL),(509,'S','F','Original Sample관리','/sample/original_sample_list.jsp','210',508,'9144',NULL,'9144','2011-05-23'),(510,'H','A','회사정보 관리','/account/company_list.jsp','135',494,'9144',NULL,'9144',NULL),(511,'H','A','생산관리',NULL,'400',1,'9144',NULL,'9144',NULL),(512,'H','A','생산현황 관리','/admin/product/product_management.jsp','410',511,'9144',NULL,'9144',NULL),(515,'H','B','Order Amendment','/ordermanagement/order_amend_list.jsp','317',454,'9144',NULL,'9144',NULL),(516,'H','B','PO생성','/ordermanagement/PurchaseOrder.jsp','312',454,'9144',NULL,'9144','2011-06-08'),(517,'H','B','PO수정','/ordermanagement/admin_order_list.jsp','313',454,'9144',NULL,'9144','2011-06-08'),(518,'H','B','상품이미지 Upload','/ordermanagement/image_upload.jsp','320',454,'9144',NULL,'9144','2011-06-08'),(520,'H','B','Shipment생성','/ordermanagement/shipment_issue_list.jsp','510',529,'9144',NULL,'9144',NULL),(522,'H','B','생산관리',NULL,'400',1,'9144',NULL,'9144',NULL),(523,'H','B','생산현황 관리','/admin/product/product_management.jsp','410',522,'9144',NULL,'9144',NULL),(524,'H','B','Buyer 공지사항 관리','/admin/memo/','151',101,'9144',NULL,'9144',NULL),(525,'H','A','출하관리',NULL,'500',1,'9144',NULL,'9144',NULL),(526,'H','A','Invoice생성','/payment/invoice_confirm_search.jsp','730',527,'9144',NULL,'9144',NULL),(527,'H','A','대금결제 관리','','700',1,'9144',NULL,'9144','2011-05-31'),(528,'H','N','출하관리',NULL,'500',1,'9144',NULL,'9144',NULL),(529,'H','B','출하관리',NULL,'500',1,'9144',NULL,'9144',NULL),(530,'H','B','Shipment list','/ordermanagement/admin_shipment_list.jsp','520',529,'9144',NULL,'9144',NULL),(531,'H','B','대금결제 관리','','700',1,'9144',NULL,'9144','2011-05-31'),(532,'H','B','Invoice생성','/payment/invoice_confirm_search.jsp','710',531,'9144',NULL,'9144',NULL),(533,'H','B','Invoices검색','/payment/invoice_search.jsp','720',531,'9144',NULL,'9144',NULL),(534,'H','A','하청공장 결제관리','/payment/sub_payment_list.jsp','710',527,'9144',NULL,'9144','2011-05-31'),(535,'H','A','PO History','/ordermanagement/admin_order_history_list.jsp','311',288,'9144',NULL,'9144',NULL),(536,'H','N','PO History','/ordermanagement/admin_order_history_list.jsp','316',48,'9144',NULL,'9144',NULL),(537,'H','B','PO History','/ordermanagement/admin_order_history_list.jsp','314',454,'9144',NULL,'9144','2011-06-08'),(538,'H','A','Buyer Payment관리','/payment/admin_payment_list.jsp','750',527,'9144',NULL,'9144',NULL),(539,'H','A','Payment조회','/payment/admin_payment_search.jsp','760',527,'9144',NULL,'9144',NULL),(540,'H','A','생산원가관리','/admin/product/cost_management.jsp','420',511,'9144','2011-05-26','9144','2011-05-26'),(541,'H','A','Sample Sheet관리','/admin/buyer/original_sample_list.jsp','230',287,'9144','2011-06-02','9144','2011-06-02'),(542,'H','B','Sample Sheet관리','/admin/buyer/original_sample_list.jsp','230',102,'9144','2011-06-02','9144','2011-06-02'),(543,'S','F','Sample Sheet조회','/sample/sample_sheet_list.jsp','220',508,'9144','2011-06-03','9144','2011-06-03'),(544,'H','B','Buyer조회','/account/supplier.jsp','311',454,'9144','2011-06-08','9144','2011-06-08'),(545,'H','B','외주생산업체 관리','/account/sub_list.jsp','310',454,'9144','2011-06-08','9144','2011-06-08'),(546,'H','B','생산원가 관리','/admin/product/cost_management.jsp','420',522,'1001','2011-06-08','1001','2011-06-08'),(547,'H','B','하청공장 결제관리','/admin/product/cost_management.jsp','705',531,'1001','2011-06-08','1001','2011-06-08'),(548,'H','B','Buyer Payment관리','/payment/admin_payment_list.jsp','730',531,'1001','2011-06-08','1001','2011-06-08'),(549,'H','B','Payment조회','/payment/admin_payment_search.jsp','740',531,'1001','2011-06-08','1001','2011-06-08'),(550,'H','A','외주하청 오더관리','/admin/product/admin_suborder_list.jsp','415',511,'9144','2011-06-17','9144','2011-06-17'),(551,'H','B','외주하청 오더관리','/admin/product/admin_suborder_list.jsp','415',522,'9144','2011-06-20','9144','2011-06-20'),(552,'H','A','업무 게시판','/notice_new/list.jsp?noticeType=1','920',289,'9144','2011-06-29','9144','2011-06-29'),(553,'H','B','업무 게시판','/notice_new/list.jsp?noticeType=1','920',110,'9144','2011-06-29','9144','2011-06-29'),(554,'H','N','업무 게시판','/notice_new/list.jsp?noticeType=1','920',55,'9144','2011-06-29','9144','2011-06-29'),(555,'H','A','DB Layout','/admin/SystemAdmin/Table_Layout.html','190',494,'9144','2011-07-05','9144','2011-07-05');
/*!40000 ALTER TABLE `menu_t` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `notice_02t`
--

DROP TABLE IF EXISTS `notice_02t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_02t` (
  `SEQNO` int(10) unsigned NOT NULL auto_increment,
  `NOTICE_SEQNO` int(10) unsigned NOT NULL,
  `ATTACH_FILE` varchar(300) default NULL,
  `ATTACH_REAL_FILE` varchar(300) default NULL,
  PRIMARY KEY  (`SEQNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_02t`
--

LOCK TABLES `notice_02t` WRITE;
/*!40000 ALTER TABLE `notice_02t` DISABLE KEYS */;
INSERT INTO `notice_02t` VALUES (1,1,'shout.jpg','shout.jpg'),(2,2,'SCM_Admin & Users_Manual.pdf','SCM_Admin & Users_Manual.pdf'),(3,3,'SCM_Buyers_Manual.pdf','SCM_Buyers_Manual.pdf');
/*!40000 ALTER TABLE `notice_02t` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `pbcatedt`
--

DROP TABLE IF EXISTS `pbcatedt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pbcatedt` (
  `pbe_name` varchar(30) NOT NULL,
  `pbe_edit` varchar(254) default NULL,
  `pbe_type` smallint(6) default NULL,
  `pbe_cntr` int(11) default NULL,
  `pbe_seqn` smallint(6) NOT NULL,
  `pbe_flag` int(11) default NULL,
  `pbe_work` char(32) default NULL,
  UNIQUE KEY `pbcate_x` (`pbe_name`,`pbe_seqn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pbcatedt`
--

LOCK TABLES `pbcatedt` WRITE;
/*!40000 ALTER TABLE `pbcatedt` DISABLE KEYS */;
INSERT INTO `pbcatedt` VALUES ('#####','#####',90,1,1,32,'10'),('###,###.00','###,###.00',90,1,1,32,'10'),('###-##-####','###-##-####',90,1,1,32,'00'),('DD/MM/YY','DD/MM/YY',90,1,1,32,'20'),('DD/MM/YY HH:MM:SS','DD/MM/YY HH:MM:SS',90,1,1,32,'40'),('DD/MM/YY HH:MM:SS:FFFFFF','DD/MM/YY HH:MM:SS:FFFFFF',90,1,1,32,'40'),('DD/MM/YYYY','DD/MM/YYYY',90,1,1,32,'20'),('DD/MM/YYYY HH:MM:SS','DD/MM/YYYY HH:MM:SS',90,1,1,32,'40'),('DD/MMM/YY','DD/MMM/YY',90,1,1,32,'20'),('DD/MMM/YY HH:MM:SS','DD/MMM/YY HH:MM:SS',90,1,1,32,'40'),('HH:MM:SS','HH:MM:SS',90,1,1,32,'30'),('HH:MM:SS:FFF','HH:MM:SS:FFF',90,1,1,32,'30'),('HH:MM:SS:FFFFFF','HH:MM:SS:FFFFFF',90,1,1,32,'30'),('JJJ/YY','JJJ/YY',90,1,1,32,'20'),('JJJ/YY HH:MM:SS','JJJ/YY HH:MM:SS',90,1,1,32,'40'),('JJJ/YYYY','JJJ/YYYY',90,1,1,32,'20'),('JJJ/YYYY HH:MM:SS','JJJ/YYYY HH:MM:SS',90,1,1,32,'40'),('MM/DD/YY','MM/DD/YY',90,1,1,32,'20'),('MM/DD/YY HH:MM:SS','MM/DD/YY HH:MM:SS',90,1,1,32,'40'),('MM/DD/YYYY','MM/DD/YYYY',90,1,1,32,'20'),('MM/DD/YYYY HH:MM:SS','MM/DD/YYYY HH:MM:SS',90,1,1,32,'40');
/*!40000 ALTER TABLE `pbcatedt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pbcatfmt`
--

DROP TABLE IF EXISTS `pbcatfmt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pbcatfmt` (
  `pbf_name` varchar(30) NOT NULL,
  `pbf_frmt` varchar(254) default NULL,
  `pbf_type` smallint(6) default NULL,
  `pbf_cntr` int(11) default NULL,
  UNIQUE KEY `pbcatf_x` (`pbf_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pbcatfmt`
--

LOCK TABLES `pbcatfmt` WRITE;
/*!40000 ALTER TABLE `pbcatfmt` DISABLE KEYS */;
INSERT INTO `pbcatfmt` VALUES ('#,##0','#,##0',81,0),('#,##0.00','#,##0.00',81,0),('$#,##0.00;($#,##0.00)','$#,##0.00;($#,##0.00)',81,0),('$#,##0.00;[RED]($#,##0.00)','$#,##0.00;[RED]($#,##0.00)',81,0),('$#,##0;($#,##0)','$#,##0;($#,##0)',81,0),('$#,##0;[RED]($#,##0)','$#,##0;[RED]($#,##0)',81,0),('0','0',81,0),('0%','0%',81,0),('0.00','0.00',81,0),('0.00%','0.00%',81,0),('0.00E+00','0.00E+00',81,0),('d-mmm','d-mmm',84,0),('d-mmm-yy','d-mmm-yy',84,0),('h:mm AM/PM','h:mm AM/PM',84,0),('h:mm:ss','h:mm:ss',84,0),('h:mm:ss AM/PM','h:mm:ss AM/PM',84,0),('m/d/yy','m/d/yy',84,0),('m/d/yy h:mm','m/d/yy h:mm',84,0),('mmm-yy','mmm-yy',84,0),('[General]','[General]',81,0);
/*!40000 ALTER TABLE `pbcatfmt` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `pbcatvld`
--

DROP TABLE IF EXISTS `pbcatvld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pbcatvld` (
  `pbv_name` varchar(30) NOT NULL,
  `pbv_vald` varchar(254) default NULL,
  `pbv_type` smallint(6) default NULL,
  `pbv_cntr` int(11) default NULL,
  `pbv_msg` varchar(254) default NULL,
  UNIQUE KEY `pbcatv_x` (`pbv_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pbcatvld`
--

LOCK TABLES `pbcatvld` WRITE;
/*!40000 ALTER TABLE `pbcatvld` DISABLE KEYS */;
/*!40000 ALTER TABLE `pbcatvld` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order` (
  `ORDER_NO` varchar(20) NOT NULL,
  `BACKORDER_FLAG` char(1) default NULL,
  `STYLE` varchar(20) NOT NULL,
  `SEASON` varchar(10) default NULL,
  `SGR` varchar(10) default NULL,
  `PGR` varchar(10) default NULL,
  `FABRIC` varchar(10) default NULL,
  `REORDER_SEQ` varchar(10) default NULL,
  `RATIO` varchar(10) default NULL,
  `BUYER_COMMENTS` varchar(4000) default NULL,
  `ITEM_TEXT` varchar(1000) default NULL,
  `SUP_STOCK_CODE` varchar(50) default NULL,
  `ORDER_TYPE` varchar(2) default NULL,
  `VENDOR_PRICE` decimal(14,4) default NULL,
  `SIZC_1` varchar(3) default NULL,
  `SIZC_2` varchar(3) default NULL,
  `SIZC_3` varchar(3) default NULL,
  `SIZC_4` varchar(3) default NULL,
  `SIZC_5` varchar(3) default NULL,
  `SIZC_6` varchar(3) default NULL,
  `SIZC_7` varchar(3) default NULL,
  `SIZC_8` varchar(3) default NULL,
  `SIZC_9` varchar(3) default NULL,
  `SIZC_10` varchar(3) default NULL,
  `LOCAL_PRICE` decimal(14,4) default NULL,
  `ALLOC_COST` decimal(14,4) default NULL,
  `AIR_COST` decimal(14,4) default NULL,
  `DISCOUNT` decimal(14,4) default NULL,
  `ESTIMATED_COST` decimal(14,4) default NULL,
  `RRP` decimal(14,4) default NULL,
  `WEIGHT` decimal(13,4) default NULL,
  `INITIAL_DEL_DATE` date default NULL,
  `EX_FACTORY_DATE` date default NULL,
  `TRANS_TYPE` varchar(10) default NULL,
  `PO_TYPE` varchar(10) default NULL,
  `ORDER_DATE` date default NULL,
  `ARRIVAL_DATE` date default NULL,
  `RECEIVED_DATE` date default NULL,
  `ORDER_STATUS` varchar(2) default NULL,
  `CURRENCY_CODE` varchar(10) default NULL,
  `INIT_CURR_RATE` decimal(14,4) default NULL,
  `ORDER_TOTAL` decimal(14,4) default NULL,
  `USER_NAME` varchar(30) default NULL,
  `BRAND` varchar(20) default NULL,
  `CLASS` varchar(4) default NULL,
  `BUYER` varchar(10) default NULL,
  `SUPPLIER` varchar(10) default NULL,
  `SUBSUPPLIER` varchar(10) default NULL,
  `UPDATED` date default NULL,
  `DELIVERY_DATE` date default NULL,
  `CONFIRM_DATE` date default NULL,
  `CREATED` date default NULL,
  `BUYER_NAME` varchar(50) default NULL,
  `SUPPLIER_NAME` varchar(50) default NULL,
  `SUBSUPPLIER_NAME` varchar(50) default NULL,
  `COMMENTS` varchar(4000) default NULL,
  `TOTAL_QTY` int(10) default NULL,
  `MODIFIED_DATE` date default NULL,
  `MODIFIER` varchar(30) default NULL,
  `SHIPMENT_NO` varchar(30) default NULL,
  `PAYMENT_NO` varchar(30) default NULL,
  `CONTRACT_DATE` date default NULL,
  `FIT_CONFIRM_DATE` date default NULL,
  `PP_CONFIRM_DATE` date default NULL,
  `PP_REQUESTED` date default NULL,
  `MAT_ORDER_DATE` date default NULL,
  `MAT_IN_DATE` date default NULL,
  `ACC_ORDER_DATE` date default NULL,
  `ACC_IN_DATE` date default NULL,
  `CUTTING` date default NULL,
  `RUNNING` date default NULL,
  `TOP_SENT` date default NULL,
  `TOP_CONFIRM` date default NULL,
  `PACKING_DATE` date default NULL,
  `INHOUSE_DATE` date default NULL,
  `COL_ORDER_DATE` date default NULL,
  `COL_IN_DATE` date default NULL,
  `PP_IN_DATE` date default NULL,
  `SUB_PAYMENT` decimal(14,4) default NULL,
  `SUB_PAYDATE` date default NULL,
  `SUB_PAID` decimal(14,4) default NULL,
  `SUB_BALANCE` decimal(14,4) default NULL,
  `SUB_CHARGE` decimal(14,4) default NULL,
  `SUB_COMMENT` varchar(1000) default NULL,
  `AMEND_DATE` date default NULL,
  `AMEND_USER` varchar(10) default NULL,
  `SUB_PAYDATE2` date default NULL,
  `SUB_PAID2` decimal(14,4) default NULL,
  `SUB_PAYDATE3` date default NULL,
  `SUB_PAID3` decimal(14,4) default NULL,
  PRIMARY KEY  (`ORDER_NO`,`STYLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES ('PO201110000','N','12345','SPRING','WDRS','1','10','0',NULL,NULL,'Woven top women ','32231#',NULL,15.9000,'S','M','L','','','',NULL,NULL,NULL,NULL,10.5000,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-30','0000-00-00','FOB','SEA','2011-05-24','0000-00-00','0000-00-00','75','USD',NULL,NULL,'9144','brand k',NULL,'B1001','S1001','P1001','2011-07-11','2011-06-30',NULL,'2011-05-24','HOT & Delicious ','SEBIN TRADING ENTERPRISE','Local하청업체','Woven top women 오더 테스트입니다.Woven top women 오더 테스트입니다.\r\n',310,'2011-07-11','9144','INV1234','INV5678','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','2011-05-24','0000-00-00','0000-00-00','0000-00-00',3885.0000,'2011-06-20',1000.0000,0.0000,0.0000,'      ','2011-06-30','9144','2011-06-20',1253.2000,'0000-00-00',0.0000),('PO201110001','N','54321','SUMMER','WSHT','1','10','0',NULL,' ','Woven-Shirt','',NULL,25.9500,'S','M','L','','','',NULL,NULL,NULL,NULL,12.4000,NULL,NULL,NULL,NULL,NULL,NULL,'2011-05-31',NULL,'FOB','SEA','2011-05-25',NULL,NULL,'40','HKD',NULL,NULL,'9144','브랜드',NULL,'B1001','S1001','P1001','2011-06-30','2011-05-31','2011-05-25','2011-05-25','HOT & Delicious ','SEBIN TRADING ENTERPRISE','Local하청업체','항목은 필수 입력항목입니다. Style번호는 숫자만 입력하세요. Style번호는 오더생성시에 \"SubGroup Code+Style번호\" 로 생성이 됩니다.테스트 추가\r\n\r\n항목은 필수 입력항목입니다. Style번호는 숫자만 입력하세요. Style번호는 오더생성시에 \"SubGroup Code+Style번호\" 로 생성이 됩니다.테스트 추가',400,'2011-07-12','9144',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000,'0000-00-00',0.0000,0.0000,0.0000,'      ','2011-06-30','9144','0000-00-00',0.0000,'0000-00-00',0.0000),('PO201110002','N','78910','SPRING','WJKT','1','10','0',NULL,NULL,'Woven Jacket','#1234',NULL,12.9500,'S','M','L','XL','','',NULL,NULL,NULL,NULL,3.2000,NULL,NULL,NULL,NULL,NULL,NULL,'2011-08-23',NULL,'FOB','SHIP','2011-06-03',NULL,NULL,'99','USD',NULL,NULL,'9144','Longhorn',NULL,'B9999','S1001','P1001','2011-06-07','2011-08-23',NULL,'2011-06-03','Buyer(Test)','SEBIN TRADING ENTERPRISE','Local하청업체','테스트 오더입니다. 최초 생성시 하청원가는 예상가를 입력하면 됩니다.\r\n공급단가는 1PCS당 단가이며 총액이 아닙니다. 모든 Price는 GST(VAT)포함가 입니다.',1400,'2011-06-30','9144','INV20110612','INV20110612',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000,'0000-00-00',0.0000,0.0000,0.0000,'      ',NULL,NULL,'0000-00-00',0.0000,'0000-00-00',0.0000),('PO201110003','N','9087','SPRING','WPNT','1','10','0',NULL,NULL,'Woven-Pants ','',NULL,12.3000,'S','M','L','XL','','',NULL,NULL,NULL,NULL,5.2300,NULL,NULL,NULL,NULL,NULL,NULL,'2011-07-31',NULL,'FOB','SHIP','2011-06-06',NULL,NULL,'99','USD',NULL,NULL,'9144','브랜드정보',NULL,'B9999','S1001','P1001','2011-06-07','2011-07-31',NULL,'2011-06-06','Buyer(Test)','SEBIN TRADING ENTERPRISE','Local하청업체','오더에 대한 추가 정보를 입력합니다.',310,'2011-06-30','9144','INV20110612','INV20110612',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.0000,'0000-00-00',0.0000,0.0000,0.0000,'      ',NULL,NULL,'0000-00-00',0.0000,'0000-00-00',0.0000),('PO201110004','N','34566','SPRING','WSKT','1','10','0',NULL,NULL,'woven hot','',NULL,9.9500,'S','M','L','XL','','',NULL,NULL,NULL,NULL,5.0000,NULL,NULL,NULL,NULL,NULL,NULL,'2011-08-29',NULL,'FOB','SHIP','2011-07-11',NULL,NULL,'40','USD',NULL,NULL,'9144','',NULL,'B1001','S1001','P1001','2011-07-11','2011-08-29',NULL,'2011-07-11','HOT & Delicious ','SEBIN TRADING ENTERPRISE','Local하청업체','',1100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_history`
--

DROP TABLE IF EXISTS `purchase_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_history` (
  `ORDER_NO` varchar(11) NOT NULL,
  `BACKORDER_FLAG` char(1) default NULL,
  `STYLE` varchar(20) default NULL,
  `SEASON` varchar(10) default NULL,
  `SGR` varchar(10) default NULL,
  `PGR` varchar(10) default NULL,
  `FABRIC` varchar(10) default NULL,
  `REORDER_SEQ` varchar(10) default NULL,
  `RATIO` varchar(10) default NULL,
  `BUYER_COMMENTS` varchar(4000) default NULL,
  `ITEM_TEXT` varchar(1000) default NULL,
  `SUP_STOCK_CODE` varchar(50) default NULL,
  `ORDER_TYPE` varchar(2) default NULL,
  `VENDOR_PRICE` decimal(14,4) default NULL,
  `SIZC_1` varchar(3) default NULL,
  `SIZC_2` varchar(3) default NULL,
  `SIZC_3` varchar(3) default NULL,
  `SIZC_4` varchar(3) default NULL,
  `SIZC_5` varchar(3) default NULL,
  `SIZC_6` varchar(3) default NULL,
  `SIZC_7` varchar(3) default NULL,
  `SIZC_8` varchar(3) default NULL,
  `SIZC_9` varchar(3) default NULL,
  `SIZC_10` varchar(3) default NULL,
  `LOCAL_PRICE` decimal(14,2) default NULL,
  `ALLOC_COST` decimal(14,2) default NULL,
  `AIR_COST` decimal(14,2) default NULL,
  `DISCOUNT` decimal(14,2) default NULL,
  `ESTIMATED_COST` decimal(14,2) default NULL,
  `RRP` decimal(14,2) default NULL,
  `WEIGHT` decimal(13,2) default NULL,
  `INITIAL_DEL_DATE` date default NULL,
  `EX_FACTORY_DATE` date default NULL,
  `TRANS_TYPE` varchar(10) default NULL,
  `PO_TYPE` varchar(10) default NULL,
  `ORDER_DATE` date default NULL,
  `ARRIVAL_DATE` date default NULL,
  `RECEIVED_DATE` date default NULL,
  `ORDER_STATUS` varchar(2) default NULL,
  `CURRENCY_CODE` varchar(10) default NULL,
  `INIT_CURR_RATE` decimal(14,6) default NULL,
  `ORDER_TOTAL` decimal(14,2) default NULL,
  `USER_NAME` varchar(30) default NULL,
  `BRAND` varchar(20) default NULL,
  `CLASS` varchar(4) default NULL,
  `BUYER` varchar(10) default NULL,
  `SUPPLIER` varchar(10) default NULL,
  `SUBSUPPLIER` varchar(10) default NULL,
  `UPDATED` date default NULL,
  `DELIVERY_DATE` date default NULL,
  `CONFIRM_DATE` date default NULL,
  `CREATED` date default NULL,
  `BUYER_NAME` varchar(50) default NULL,
  `SUPPLIER_NAME` varchar(50) default NULL,
  `SUBSUPPLIER_NAME` varchar(50) default NULL,
  `COMMENTS` varchar(4000) default NULL,
  `TOTAL_QTY` int(5) default NULL,
  `MODIFIED_DATE` date default NULL,
  `MODIFIER` varchar(30) default NULL,
  `SHIPMENT_NO` varchar(30) default NULL,
  `PAYMENT_NO` varchar(30) default NULL,
  `CONTRACT_DATE` date default NULL,
  `FIT_CONFIRM_DATE` date default NULL,
  `PP_CONFIRM_DATE` date default NULL,
  `PP_REQUESTED` date default NULL,
  `MAT_ORDER_DATE` date default NULL,
  `MAT_IN_DATE` date default NULL,
  `ACC_ORDER_DATE` date default NULL,
  `ACC_IN_DATE` date default NULL,
  `CUTTING` date default NULL,
  `RUNNING` date default NULL,
  `TOP_SENT` date default NULL,
  `TOP_CONFIRM` date default NULL,
  `PACKING_DATE` date default NULL,
  `INHOUSE_DATE` date default NULL,
  `COL_ORDER_DATE` date default NULL,
  `COL_IN_DATE` date default NULL,
  `PP_IN_DATE` date default NULL,
  `SUB_PAYMENT` decimal(14,2) default NULL,
  `SUB_PAYDATE` date default NULL,
  `SUB_PAID` decimal(14,2) default NULL,
  `SUB_PAYDATE2` date default NULL,
  `SUB_PAID2` decimal(14,2) default NULL,
  `SUB_PAYDATE3` date default NULL,
  `SUB_PAID3` decimal(14,2) default NULL,
  `SUB_BALANCE` decimal(14,2) default NULL,
  `SUB_CHARGE` decimal(14,2) default NULL,
  `SUB_COMMENT` varchar(1000) default NULL,
  `AMEND_DATE` date default NULL,
  `AMEND_USER` varchar(10) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_history`
--

LOCK TABLES `purchase_order_history` WRITE;
/*!40000 ALTER TABLE `purchase_order_history` DISABLE KEYS */;
INSERT INTO `purchase_order_history` VALUES ('PO201110000','N','12345','SPRING','WTOP','1','10','0',NULL,NULL,'Woven top women ','32231#',NULL,19.9500,'S','M','L','','','',NULL,NULL,NULL,NULL,10.50,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-30',NULL,'FOB','SEA','2011-05-24',NULL,NULL,'40','HKD',NULL,NULL,'9144','brand k',NULL,'B1001','S1001','P1001','2011-06-30','2011-06-30',NULL,'2011-06-30','HOT & Delicious ','SEBIN TRADING ENTERPRISE','Local하청업체','Woven top women 오더 테스트입니다.Woven top women 오더 테스트입니다.\r\nWoven top women 오더 테스트입니다.',310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110000','N','12345','SPRING','WDRS','1','10','0',NULL,NULL,'Woven top women ','32231#',NULL,19.9500,'S','M','L','','','',NULL,NULL,NULL,NULL,10.50,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-30',NULL,'FOB','SEA','2011-05-24',NULL,NULL,'40','HKD',NULL,NULL,'9144','brand k',NULL,'B1001','S1001','P1001','2011-06-30','2011-06-30',NULL,'2011-06-30','HOT & Delicious ','SEBIN TRADING ENTERPRISE','Local하청업체','Woven top women 오더 테스트입니다.Woven top women 오더 테스트입니다.\r\n',310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110001','N','54321','SUMMER','WSHT','1','10','0',NULL,NULL,'Woven-Shirt','',NULL,25.9500,'S','M','L','','','',NULL,NULL,NULL,NULL,12.40,NULL,NULL,NULL,NULL,NULL,NULL,'2011-05-31',NULL,'FOB','SEA','2011-05-25',NULL,NULL,NULL,'HKD',NULL,NULL,'9144','브랜드',NULL,NULL,NULL,'P1001','2011-06-30','2011-05-31',NULL,'2011-06-30','','','Local하청업체','항목은 필수 입력항목입니다. Style번호는 숫자만 입력하세요. Style번호는 오더생성시에 \"SubGroup Code+Style번호\" 로 생성이 됩니다.테스트 추가',400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-30','9144'),('PO201110001','N','54321','SUMMER','WSHT','1','10','0',NULL,NULL,'Woven-Shirt','',NULL,25.9500,'S','M','L','','','',NULL,NULL,NULL,NULL,12.40,NULL,NULL,NULL,NULL,NULL,NULL,'2011-05-31',NULL,'FOB','SEA','2011-05-25',NULL,NULL,'55','HKD',NULL,NULL,'9144','브랜드',NULL,'B1001','S1001','P1001','2011-06-30','2011-05-31',NULL,'2011-06-30','','','Local하청업체','항목은 필수 입력항목입니다. Style번호는 숫자만 입력하세요. Style번호는 오더생성시에 \"SubGroup Code+Style번호\" 로 생성이 됩니다.테스트 추가',400,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-30','9144'),('PO201110000','N','12345','SPRING','WDRS','1','10','0',NULL,NULL,'Woven top women ','32231#',NULL,19.9500,'S','M','L','','','',NULL,NULL,NULL,NULL,10.50,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-30',NULL,'FOB','SEA','2011-05-24',NULL,NULL,'45','HKD',NULL,NULL,'9144','brand k',NULL,'B1001','S1001','P1001','2011-06-30','2011-06-30',NULL,'2011-06-30','','','Local하청업체','Woven top women 오더 테스트입니다.Woven top women 오더 테스트입니다.\r\n',310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-30','9144'),('PO201110001','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-05-31',NULL,NULL,NULL,NULL,NULL,NULL,'73',NULL,NULL,NULL,'9144',NULL,NULL,NULL,NULL,NULL,'2011-06-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110000','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-30',NULL,NULL,NULL,NULL,NULL,NULL,'65',NULL,NULL,NULL,'9144',NULL,NULL,NULL,NULL,NULL,'2011-06-30',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110000','N','12345','SPRING','WDRS','1','10','0',NULL,NULL,'Woven top women ','32231#',NULL,15.9000,'S','M','L','','','',NULL,NULL,NULL,NULL,10.50,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-30',NULL,'FOB','SEA','2011-05-24',NULL,NULL,'40','USD',NULL,NULL,'9144','brand k',NULL,'B1001','S1001','P1001','2011-07-11','2011-06-30',NULL,'2011-07-11','HOT & Delicious ','SEBIN TRADING ENTERPRISE','Local하청업체','Woven top women 오더 테스트입니다.Woven top women 오더 테스트입니다.\r\n',310,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110001','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-05-31',NULL,NULL,NULL,NULL,NULL,NULL,'70',NULL,NULL,NULL,'9144',NULL,NULL,NULL,NULL,NULL,'2011-07-11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110000','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-06-30',NULL,NULL,NULL,NULL,NULL,NULL,'75',NULL,NULL,NULL,'9144',NULL,NULL,NULL,NULL,NULL,'2011-07-11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110001','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-05-31',NULL,NULL,NULL,NULL,NULL,NULL,'35',NULL,NULL,NULL,'9144',NULL,NULL,NULL,NULL,NULL,'2011-07-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110001','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2011-05-31',NULL,NULL,NULL,NULL,NULL,NULL,'40',NULL,NULL,NULL,'9144',NULL,NULL,NULL,NULL,NULL,'2011-07-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchase_order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_line`
--

DROP TABLE IF EXISTS `purchase_order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_line` (
  `ORDER_NO` varchar(20) NOT NULL,
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
-- Dumping data for table `purchase_order_line`
--

LOCK TABLES `purchase_order_line` WRITE;
/*!40000 ALTER TABLE `purchase_order_line` DISABLE KEYS */;
INSERT INTO `purchase_order_line` VALUES ('PO201110000','N','BALCK',NULL,100,10,50,40,0,0,0,NULL,NULL,NULL,NULL),('PO201110000','N','RED',NULL,210,30,40,140,0,0,0,NULL,NULL,NULL,NULL),('PO201110001','N','RED',NULL,400,100,200,100,0,0,0,NULL,NULL,NULL,NULL),('PO201110002','N','BALCK_CHK',NULL,600,100,200,200,100,0,0,NULL,NULL,NULL,NULL),('PO201110002','N','RED_CHK',NULL,800,100,300,300,100,0,0,NULL,NULL,NULL,NULL),('PO201110003','N','Blue_CHK',NULL,150,10,50,60,30,0,0,NULL,NULL,NULL,NULL),('PO201110003','N','RED_CHK',NULL,160,20,50,60,30,0,0,NULL,NULL,NULL,NULL),('PO201110004','N','blue',NULL,600,100,200,200,100,0,0,NULL,NULL,NULL,NULL),('PO201110004','N','red',NULL,500,100,200,100,100,0,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `purchase_order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_line_history`
--

DROP TABLE IF EXISTS `purchase_order_line_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_order_line_history` (
  `ORDER_NO` varchar(11) NOT NULL,
  `BACKORDER_FLAG` char(1) default NULL,
  `COLOUR` varchar(20) default NULL,
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
  `UPDATED` datetime default NULL,
  `AMEND_DATE` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_line_history`
--

LOCK TABLES `purchase_order_line_history` WRITE;
/*!40000 ALTER TABLE `purchase_order_line_history` DISABLE KEYS */;
INSERT INTO `purchase_order_line_history` VALUES ('PO201110000','N','BALCK',NULL,100,10,50,40,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110000','N','RED',NULL,210,30,40,140,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110000','N','BALCK',NULL,100,10,50,40,0,0,0,NULL,NULL,NULL,NULL,'2011-06-30 14:00:48',NULL),('PO201110000','N','RED',NULL,210,30,40,140,0,0,0,NULL,NULL,NULL,NULL,'2011-06-30 14:00:48',NULL),('PO201110001','N','RED',NULL,400,100,200,100,0,0,0,NULL,NULL,NULL,NULL,'2011-06-30 14:12:44',NULL),('PO201110001','N','RED',NULL,400,100,200,100,0,0,0,NULL,NULL,NULL,NULL,'2011-06-30 14:20:54',NULL),('PO201110000','N','BALCK',NULL,100,10,50,40,0,0,0,NULL,NULL,NULL,NULL,NULL,'2011-06-30 00:00:00'),('PO201110000','N','RED',NULL,210,30,40,140,0,0,0,NULL,NULL,NULL,NULL,NULL,'2011-06-30 00:00:00'),('PO201110004','N','red',NULL,500,100,200,100,100,0,0,NULL,NULL,NULL,NULL,'2011-07-11 13:30:03',NULL),('PO201110004','N','blue',NULL,600,100,200,200,100,0,0,NULL,NULL,NULL,NULL,'2011-07-11 13:30:03',NULL),('PO201110000','N','BALCK',NULL,100,10,50,40,0,0,0,NULL,NULL,NULL,NULL,'2011-07-11 13:36:00',NULL),('PO201110000','N','RED',NULL,210,30,40,140,0,0,0,NULL,NULL,NULL,NULL,'2011-07-11 13:36:00',NULL);
/*!40000 ALTER TABLE `purchase_order_line_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_memo_02t`
--

DROP TABLE IF EXISTS `s_memo_02t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_memo_02t` (
  `SEQNO` int(11) NOT NULL,
  `COMNAME` varchar(50) NOT NULL,
  `STAFFID` varchar(10) NOT NULL,
  `STAFFNAME` varchar(50) NOT NULL,
  `RDATE` date default NULL,
  PRIMARY KEY  (`SEQNO`,`COMNAME`,`STAFFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_memo_02t`
--

LOCK TABLES `s_memo_02t` WRITE;
/*!40000 ALTER TABLE `s_memo_02t` DISABLE KEYS */;
INSERT INTO `s_memo_02t` VALUES (1,'USA RETAIL LIMITED.','B1001','USA RETAIL LIMITED.','2011-05-25');
/*!40000 ALTER TABLE `s_memo_02t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_memo_03t`
--

DROP TABLE IF EXISTS `s_memo_03t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_memo_03t` (
  `SEQNO` int(11) NOT NULL,
  `COMNAME` varchar(50) NOT NULL,
  `IDATE` date NOT NULL,
  `DFLAG` char(1) NOT NULL,
  `TITLE` varchar(100) default NULL,
  `COMID` varchar(10) default NULL,
  PRIMARY KEY  (`SEQNO`,`COMNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_memo_03t`
--

LOCK TABLES `s_memo_03t` WRITE;
/*!40000 ALTER TABLE `s_memo_03t` DISABLE KEYS */;
INSERT INTO `s_memo_03t` VALUES (1,'미국바이어','2011-05-10','0','테스트 한글','B1001'),(2,'미국바이어','2011-05-10','1','이번주 공지사항입니다.','B1001'),(3,'GLOBAL SOURCING USA CO,.LTD.','2011-05-23','0','공지테스트','B1002');
/*!40000 ALTER TABLE `s_memo_03t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_comments`
--

DROP TABLE IF EXISTS `sample_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_comments` (
  `SEQNO` int(10) NOT NULL auto_increment,
  `SEQUENCE_NO` int(10) NOT NULL,
  `SAMPLE_NO` varchar(12) NOT NULL,
  `SUPPLIER_REMARKS` varchar(4000) default NULL,
  `BUYER_REMARKS` varchar(4000) default NULL,
  `SUPPLIER_ID` varchar(10) default NULL,
  `SUPPLIER_UPDATED` date default NULL,
  `BUYER_ID` varchar(10) default NULL,
  `BUYER_UPDATED` date default NULL,
  PRIMARY KEY  (`SEQNO`,`SEQUENCE_NO`,`SAMPLE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_comments`
--

LOCK TABLES `sample_comments` WRITE;
/*!40000 ALTER TABLE `sample_comments` DISABLE KEYS */;
INSERT INTO `sample_comments` VALUES (1,1,'12345','주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다','9144','2011-06-14',NULL,NULL),(2,1,'12345','주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다',NULL,NULL,'B1001','2011-06-14'),(3,3,'99999','Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','','9144','2011-06-30',NULL,NULL),(4,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(5,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(6,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(7,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(8,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(9,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(10,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL);
/*!40000 ALTER TABLE `sample_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scm_notice_01t`
--

DROP TABLE IF EXISTS `scm_notice_01t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scm_notice_01t` (
  `SEQNO` int(10) NOT NULL auto_increment,
  `INPUT_DATE` date NOT NULL,
  `ADMIN_ID` varchar(10) NOT NULL,
  `ADMIN_NAME` varchar(30) NOT NULL,
  `TITLE` varchar(200) default NULL,
  `CONTENT` varchar(4000) default NULL,
  `READ_CNT` int(8) default NULL,
  `MODIFY_ID` varchar(10) default NULL,
  `MODIFY_DATE` date default NULL,
  PRIMARY KEY  (`SEQNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scm_notice_01t`
--

LOCK TABLES `scm_notice_01t` WRITE;
/*!40000 ALTER TABLE `scm_notice_01t` DISABLE KEYS */;
INSERT INTO `scm_notice_01t` VALUES (5,'2011-05-10','9144','Jeffrey H Song','관리자 공지사항입니다.','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;</p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"4\" color=\"#FF0080\"><b>세빈 SCM 오신 것을 환영합니다!</b></font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"4\" color=\"#0080C0\"><b><img src=\"http://www.sebin2098.com/admin/notice/upload/gbn2.gif\" border=\"0\"></b></font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;</p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;<b>SCM( Supply Chain Management ) 이란? </b></p>\r\n\r\n<p align=\"left\">Supply-Chain </p>\r\n\r\n<p align=\"left\">고객 /소매상/ 도매상/ 제조업/ 부품/자재 공급자 등의 공급활동의 연쇄구조 </p>\r\n\r\n<p align=\"left\">Supply-Chain Management </p>\r\n\r\n<p align=\"left\">기업 내 또는 기업 간의 다양한 사업활동의 프로세스와 부문간·부서간에 존재하는 벽을 넘어서 \r\n\r\n수주에서부터 고객 납품에 이르기까지 상품 공급의 흐름을 효율적으로 잘 관리하는 것 </p>\r\n\r\n<p align=\"left\">가장 최소의 비용으로 수주로부터 고객에게 납품하는 시간에 제한 받지 않고 Zero에 근접시키기 \r\n\r\n위한 경영관리 기법 </p>\r\n\r\n<p align=\"left\">구체적으로는 이제까지 부문마다의 최적화, 기업마다의 최적화에 머물렀던 정보, 물류, 현금에 관련된 업무의 흐름을 Supply Chain 전체의 관점에서 재검토하여 정보의 공유화와 Business \r\n\r\nProcess의 근본적인 변혁을 꾀하여 Supply Chain전체의 Cash Flow의 효율을 향상 시키려고 하는 \r\n\r\nManagement Concept이다 </p>\r\n\r\n<p align=\"left\">원재료의 수급에서 고객에게 제품을 전달하는 자원과 정보의 일련의 흐름 전체를 경쟁력 있는 업무의 흐름으로 관리하려는 관리 시스템 </p>\r\n\r\n<p align=\"left\">최적화된 SCM은 제품을 생산하는 기업이 부품의 구매, 제조, 판매까지의 모든 일정을 수립하고 \r\n\r\n고객의 수요계획 및 물류현황을 체계적으로 정리함으로써 제품의 흐름 (부가가치 물자흐름)을 원활하고 효율적으로 수행할 수 있게 한다. </p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;<b>SCM의 필요성 </b></p>\r\n\r\n<p align=\"left\">부가가치의 60-70%가 &nbsp;제조과정 외부의 공급체인상에서 발생한다 </p>\r\n\r\n<p align=\"left\">순수제조시간보다 제품이 고객에게 이르기까지 유통과정의 소요기간이 길다 </p>\r\n\r\n<p align=\"left\">고객만족 효과는 주문처리, 물류관리, 구매 조달 등의 개선으로 쉽게 얻을수 있다 </p>\r\n\r\n<p align=\"left\">부품 및 기자재 공급의 납기 및 품질의 불확실성과 수요 및 주문의 납기, 수량 등의 불확실성 </p>\r\n\r\n<p align=\"left\">제품 설계와 제조방식 자체의 어려움보다 고객의 수요 예측의 부정확과 주문의 다양성, 그리고 자재 공급업체의 납기 지연 및 품질 불량 등으로 어려움과 비용손실을 입고있다 </p>\r\n\r\n<p align=\"left\">생산, 부품 조달 및 구매, 보관 및 물류, 운송, 판매 및 유통 등의 기업 활동이 이 글로벌화 됨에 따라 공급체인상의 리드타임이 길어지고 불확실해졌다 </p>\r\n\r\n<p align=\"left\">글로벌한 공급체인 및 물류의 합리적인 계획 및 관리와 조정 통제가 중요 </p>\r\n\r\n<p align=\"left\">어떤 주문을 언제 어디서 어떻게 얼마나 만들고 어떻게 유통, 운송하고 부품조달을 어떻게 할 것인가에 대한 계획 및 의사결정, 실행 및 추적의 필요성 </p>\r\n\r\n</body>\r\n',699,'9144','2011-07-12');
/*!40000 ALTER TABLE `scm_notice_01t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scm_notice_02t`
--

DROP TABLE IF EXISTS `scm_notice_02t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scm_notice_02t` (
  `NOTICE_SEQNO` int(10) NOT NULL,
  `SEQNO` int(10) NOT NULL,
  `ATTACH_FILE` varchar(300) default NULL,
  `ATTACH_REAL_FILE` varchar(300) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scm_notice_02t`
--

LOCK TABLES `scm_notice_02t` WRITE;
/*!40000 ALTER TABLE `scm_notice_02t` DISABLE KEYS */;
/*!40000 ALTER TABLE `scm_notice_02t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_01t`
--

DROP TABLE IF EXISTS `shipment_01t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment_01t` (
  `INVOICE_NO` varchar(30) NOT NULL,
  `BUYER_ID` varchar(10) NOT NULL,
  `ISSUE_DATE` date NOT NULL,
  `SHIPPING_PORT` varchar(20) NOT NULL,
  `HANDOVER_DATE` date NOT NULL,
  `SHIPPING_TYPE` varchar(20) NOT NULL,
  `NOMINATED_FORWARDER` varchar(50) NOT NULL,
  `BL_FILENAME` varchar(100) default NULL,
  `IV_FILENAME` varchar(100) default NULL,
  `PL_FILENAME` varchar(100) default NULL,
  `CONFIRM_STATUS` varchar(1) NOT NULL default 'N',
  `CONFIRM_DATE` date default NULL,
  `CONFIRM_ID` varchar(10) default NULL,
  `ADMIN_COMMENTS` varchar(1000) default NULL,
  `UPDATE_DATE` date default NULL,
  `SUPPLIER_ID` varchar(6) NOT NULL,
  `CREATED_ID` varchar(10) default NULL,
  PRIMARY KEY  (`INVOICE_NO`,`BUYER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_01t`
--

LOCK TABLES `shipment_01t` WRITE;
/*!40000 ALTER TABLE `shipment_01t` DISABLE KEYS */;
INSERT INTO `shipment_01t` VALUES ('INV1234','B1001','2011-05-24','05','2011-05-23','FOB','02','B1001_BL_INV1234.jpg','B1001_IV_INV1234.jpg','B1001_PL_INV1234.jpg','N','2011-05-25','B1001',NULL,'2011-05-24','S1001','9144'),('INV20110612','B9999','2011-06-07','05','2011-06-27','FOB','02','B9999_BL_INV20110612.png','B9999_IV_INV20110612.jpg','B9999_PL_INV20110612.png','N',NULL,NULL,NULL,'2011-06-07','S1001','9144');
/*!40000 ALTER TABLE `shipment_01t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipment_02t`
--

DROP TABLE IF EXISTS `shipment_02t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipment_02t` (
  `PO_NO` varchar(11) NOT NULL,
  `STYLE_NO` varchar(20) NOT NULL,
  `INVOICE_NO` varchar(20) NOT NULL,
  `SUPPLIER_ID` varchar(6) NOT NULL,
  `SEASON` varchar(20) NOT NULL,
  `TRANS_TYPE` varchar(20) NOT NULL,
  `ORDER_QTY` int(6) NOT NULL,
  `TOTAL_AMOUNT` decimal(10,4) NOT NULL,
  `INPUT_DATE` date default NULL,
  `INPUT_ID` varchar(10) default NULL,
  `BUYER_ID` varchar(6) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipment_02t`
--

LOCK TABLES `shipment_02t` WRITE;
/*!40000 ALTER TABLE `shipment_02t` DISABLE KEYS */;
INSERT INTO `shipment_02t` VALUES ('PO201110000','12345','INV1234','S1001','SPRING','FOB',310,6184.5000,'2011-05-24','9144','B1001'),('PO201110002','78910','INV20110612','S1001','SPRING','FOB',1400,18130.0000,'2011-06-07','9144','B9999'),('PO201110003','9087','INV20110612','S1001','SPRING','FOB',310,3813.0000,'2011-06-07','9144','B9999');
/*!40000 ALTER TABLE `shipment_02t` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `t1`
--

DROP TABLE IF EXISTS `t1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1` (
  `col1` date default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t1`
--

LOCK TABLES `t1` WRITE;
/*!40000 ALTER TABLE `t1` DISABLE KEYS */;
INSERT INTO `t1` VALUES ('0000-00-00'),('0000-00-00');
/*!40000 ALTER TABLE `t1` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `user_02t`
--

DROP TABLE IF EXISTS `user_02t`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_02t` (
  `SCMID` varchar(10) NOT NULL,
  `IPADDRESS` varchar(20) default NULL,
  `LOGINTIME` date default NULL,
  `PASSWORD` varchar(40) default NULL,
  `LOGINNAME` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_02t`
--

LOCK TABLES `user_02t` WRITE;
/*!40000 ALTER TABLE `user_02t` DISABLE KEYS */;
INSERT INTO `user_02t` VALUES ('B1001','10.2.1.161','2011-05-25','1234','USA RETAIL LIMITED.'),('b1001','10.2.1.161','2011-05-25','1234','USA RETAIL LIMITED.'),('B1001','10.2.1.161','2011-05-25','1234','USA RETAIL LIMITED.'),('B1001','10.2.1.161','2011-05-25','1234','USA RETAIL LIMITED.'),('B1001','10.2.1.161','2011-05-26','1233','USA RETAIL LIMITED.'),('b1001','58.106.238.45','2011-05-28','1233','USA RETAIL LIMITED.'),('B1002','58.106.238.45','2011-06-03','1234','LIT LIMITED GUANGZHOU'),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-07','1233','HOT & DELICIOUS '),('B9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('B9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('B9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('b9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('b9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('B1001','175.39.77.33','2011-06-13','1233','HOT & DELICIOUS '),('B1001','175.39.77.33','2011-06-13','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-14','1111','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-14','1111','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-14','1111','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-16','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-16','1234','HOT & DELICIOUS '),('b1001','10.2.1.161','2011-06-16','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-21','1234','HOT & DELICIOUS '),('b1001','10.2.1.161','2011-06-21','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-24','1234','HOT & DELICIOUS '),('b1001','10.2.1.161','2011-06-24','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-27','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-27','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-27','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-27','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-29','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-29','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','219.136.88.251','2011-07-11','1234','HOT & DELICIOUS '),('B1001','219.136.88.251','2011-07-11','1234','HOT & DELICIOUS '),('B1001','219.136.88.251','2011-07-11','1234','HOT & DELICIOUS '),('B1001','219.136.81.195','2011-07-11','1234','HOT & DELICIOUS '),('B1001','113.68.195.157','2011-07-12','1234','HOT & DELICIOUS ');
/*!40000 ALTER TABLE `user_02t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vg_common_code`
--

DROP TABLE IF EXISTS `vg_common_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vg_common_code` (
  `CODE` varchar(20) NOT NULL,
  `CODE_NAME` varchar(50) NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(200) default NULL,
  `USE_YN` varchar(1) default 'Y',
  `MODIFIER` varchar(10) default NULL,
  `MODIFIED_DATE` date default NULL,
  `SORT_ORDER` int(5) default NULL,
  `RELATED_CODE` varchar(20) default NULL,
  PRIMARY KEY  (`TYPE`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vg_common_code`
--

LOCK TABLES `vg_common_code` WRITE;
/*!40000 ALTER TABLE `vg_common_code` DISABLE KEYS */;
INSERT INTO `vg_common_code` VALUES ('COUNTRY_CODE','Country Code','0',NULL,'Y',NULL,NULL,NULL,NULL),('CURRENCY','CURRENCY TYPE','0',NULL,'Y',NULL,NULL,NULL,NULL),('DELIVERY_TYPE','Deliver Type','0',NULL,'Y',NULL,NULL,NULL,NULL),('FORWARDER','Nominated Forwarder','0',NULL,'Y',NULL,NULL,NULL,NULL),('MATERIAL','제품소재','0',NULL,NULL,NULL,NULL,NULL,NULL),('ORDER_STATUS','Order Status','0',NULL,'Y',NULL,NULL,NULL,NULL),('PGR','Product Group','0',NULL,'Y',NULL,NULL,NULL,NULL),('SAMPLE','SAMPLE관리자','0',NULL,NULL,NULL,NULL,NULL,NULL),('SEASON','SEASON','0',NULL,'Y',NULL,NULL,NULL,NULL),('SGR','Product Sub group','0',NULL,'Y',NULL,NULL,NULL,NULL),('SHIPPING_PORT','Shipping Port','0',NULL,'Y',NULL,NULL,NULL,NULL),('SUB_MAT','부자재코드','0','원가관리용','Y',NULL,NULL,NULL,NULL),('TRANS_TYPE','배송형태','0',NULL,NULL,NULL,NULL,NULL,NULL),('USER_CLASS','User Class','0',NULL,'Y',NULL,NULL,NULL,NULL),('USER_GROUP','User Group','0',NULL,'Y',NULL,NULL,NULL,NULL),('USER_TYPE','User Type','0',NULL,'Y',NULL,NULL,NULL,NULL),('AU','Australia','COUNTRY_CODE',NULL,'Y','9144',NULL,6,NULL),('BD','Bangladesh','COUNTRY_CODE',NULL,'Y','9144',NULL,8,NULL),('CN','CHINA','COUNTRY_CODE','','Y','9144','2011-05-23',2,''),('HK','Hongkong','COUNTRY_CODE',NULL,'Y','9144',NULL,3,NULL),('IN','India','COUNTRY_CODE',NULL,'Y','9144',NULL,7,NULL),('KR','KOREA','COUNTRY_CODE',NULL,'Y','9144',NULL,4,NULL),('MN','Mongolia','COUNTRY_CODE',NULL,'Y','9144',NULL,9,NULL),('PH','Philippines','COUNTRY_CODE',NULL,'Y','9144',NULL,10,NULL),('PK','Pakistan','COUNTRY_CODE',NULL,'Y','9144',NULL,11,NULL),('TW','Taiwan','COUNTRY_CODE',NULL,'Y','9144',NULL,12,NULL),('US','USA','COUNTRY_CODE',NULL,'Y','9144',NULL,1,NULL),('VN','Vietnam','COUNTRY_CODE',NULL,'Y','9144',NULL,5,NULL),('CNY','CNY','CURRENCY',NULL,'Y','9144',NULL,6,NULL),('EUR','EUR','CURRENCY',NULL,'Y','9144',NULL,3,NULL),('GBP','GBP','CURRENCY',NULL,'Y','9144',NULL,5,NULL),('HKD','HKD','CURRENCY',NULL,'Y','9144',NULL,NULL,NULL),('JPY','JPY','CURRENCY',NULL,'Y','9144',NULL,2,NULL),('KRW','KRW','CURRENCY',NULL,'Y','9144',NULL,4,NULL),('USD','USD','CURRENCY',NULL,'Y','9144',NULL,1,NULL),('CMT','CMT','DELIVERY_TYPE',NULL,'Y','9144',NULL,20,NULL),('ES','ES','DELIVERY_TYPE',NULL,'Y','9144',NULL,50,NULL),('FOB','FOB','DELIVERY_TYPE',NULL,'Y','9144',NULL,10,NULL),('J','J','DELIVERY_TYPE',NULL,'Y','9144',NULL,NULL,NULL),('PN','PN','DELIVERY_TYPE',NULL,'Y','9144',NULL,70,NULL),('PNJ','PNJ','DELIVERY_TYPE',NULL,'Y','9144',NULL,60,NULL),('SMP','SMP','DELIVERY_TYPE',NULL,'Y','9144',NULL,30,NULL),('SO','SO','DELIVERY_TYPE',NULL,'Y','9144',NULL,40,NULL),('01','Capricon Logistics','FORWARDER',NULL,'Y',NULL,NULL,NULL,'IN'),('02','Coreana Co','FORWARDER',NULL,'Y',NULL,NULL,NULL,'CN'),('03','SGL Universal Co','FORWARDER',NULL,'Y',NULL,NULL,NULL,'CN'),('04','Alliance','FORWARDER',NULL,'Y',NULL,NULL,NULL,'IN'),('05','Wings Air Cargo Co','FORWARDER',NULL,'Y',NULL,NULL,NULL,'BD'),('06','TNT China','FORWARDER',NULL,'Y',NULL,NULL,NULL,'CN'),('07','TNT India','FORWARDER',NULL,'Y',NULL,NULL,NULL,'IN'),('08','Explorer Freight Co','FORWARDER',NULL,'Y',NULL,NULL,NULL,'PH'),('10','WOVEN-나일론','MATERIAL','','Y','9144','2011-06-30',10,''),('00','CREATED','ORDER_STATUS',NULL,'Y','9144',NULL,10,NULL),('10','ORIGINAL SAMPLE','ORDER_STATUS',NULL,'Y','9144',NULL,11,NULL),('20','SAMPLE발송','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','9144','2011-06-03',12,''),('22','SAMPLE수신','ORDER_STATUS',NULL,'Y','9144',NULL,13,NULL),('24','DESIGN수정요청','ORDER_STATUS','바이어로 부터 세빈담당자에게 e-mail발송됨','Y','9144','2011-06-03',14,''),('26','SAMPLE수정','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','9144','2011-06-03',15,''),('30','DESIGN확정','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','9144','2011-06-03',16,''),('35','ORDER요청','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','9144','2011-06-03',17,''),('40','PO-CONFIRM요청','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','9144','2011-06-21',18,''),('45','ORDER확정및생산','ORDER_STATUS','바이어로 부터 세빈담당자에게 e-mail발송됨','Y','9144','2011-06-21',19,''),('50','PP SAMPLE','ORDER_STATUS',NULL,'Y','9144',NULL,20,NULL),('55','PP CONFIRM','ORDER_STATUS',NULL,'Y','9144',NULL,21,NULL),('60','생산지시','ORDER_STATUS',NULL,'Y','9144',NULL,22,NULL),('65','하청','ORDER_STATUS',NULL,'Y','9144',NULL,23,NULL),('70','TOP제작','ORDER_STATUS',NULL,'Y','9144',NULL,24,NULL),('73','제품완성','ORDER_STATUS',NULL,'Y','9144',NULL,24,NULL),('75','SHIPMENT작성','ORDER_STATUS',NULL,'Y','9144',NULL,24,NULL),('80','제품출고','ORDER_STATUS',NULL,'Y','9144',NULL,25,NULL),('85','상품입고','ORDER_STATUS',NULL,'Y','9144',NULL,26,NULL),('90','INVOICE작성','ORDER_STATUS',NULL,'Y','9144',NULL,27,NULL),('92','대금청구','ORDER_STATUS',NULL,'Y','9144',NULL,28,NULL),('94','INVOICE수신','ORDER_STATUS',NULL,'Y','9144',NULL,29,NULL),('96','대금지불','ORDER_STATUS',NULL,'Y','9144',NULL,30,NULL),('98','입금확인','ORDER_STATUS',NULL,'Y','9144',NULL,31,NULL),('99','PAYMENT완료','ORDER_STATUS',NULL,'Y','9144',NULL,32,NULL),('999','ORDER취소','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','9144','2011-06-03',33,''),('1','WOVEN','PGR',NULL,'Y','9144',NULL,5,NULL),('2','KNIT','PGR',NULL,'Y',NULL,NULL,10,NULL),('3','ACCESSORY','PGR',NULL,'Y',NULL,NULL,20,NULL),('9144','JEFFREY SONG','SAMPLE','Jeffrey.song@ffb.net.au','Y','9144',NULL,10,NULL),('AUTUMN','AUTUMN','SEASON',NULL,'Y','9144',NULL,30,NULL),('SPRING','SPRING','SEASON',NULL,'Y','9144',NULL,10,NULL),('SUMMER','SUMMER','SEASON',NULL,'Y','9144',NULL,20,NULL),('WINTER','WINTER','SEASON',NULL,'Y','9144',NULL,40,NULL),('KCRD','Knit-Cardigan','SGR',NULL,'Y',NULL,NULL,540,'2'),('KDRS','Knit-Dress','SGR',NULL,'Y',NULL,NULL,560,'2'),('KJKT','Knit-Jacket','SGR',NULL,'Y',NULL,NULL,570,'2'),('KTOP','Knit-Top','SGR',NULL,'Y',NULL,NULL,520,'2'),('WBLS','Woven-Blouse','SGR',NULL,'Y',NULL,NULL,360,'1'),('WDRS','Woven-Dress','SGR',NULL,'Y',NULL,NULL,310,'1'),('WJKT','Woven-Jacket','SGR',NULL,'Y',NULL,NULL,370,'1'),('WPNT','Woven-Pants','SGR',NULL,'Y',NULL,NULL,490,'1'),('WSHT','Woven-Shirt','SGR',NULL,'Y',NULL,NULL,340,'1'),('WSKT','Woven-Skirt','SGR',NULL,'Y',NULL,NULL,450,'1'),('WTOP','Woven-Top','SGR',NULL,'Y',NULL,NULL,280,'1'),('01','Bangladesh','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'BD'),('02','Chennai','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'IN'),('03','Dalian','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('04','Hangzhou','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('05','Guangzhou','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('06','Hanoi','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'VN'),('07','Hochimin','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'VN'),('08','Honkong','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'HK'),('09','Incheon','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'KR'),('10','Jaipur','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'IN'),('11','KICT','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'PK'),('12','Mongolia','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'MN'),('13','Mumbai','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'IN'),('14','New Delhi','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'IN'),('15','PICT','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'PK'),('16','Pusan','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'KR'),('17','Qingdao','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('18','Shanghai','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('19','Shenzhen','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('20','Taipei','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'TW'),('21','Manila','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'PH'),('S10','단추','SUB_MAT','','Y','9144','2011-05-27',10,''),('S20','고무줄','SUB_MAT','','Y','9144','2011-05-27',20,''),('S30','지퍼','SUB_MAT','','Y','9144','2011-05-27',30,''),('S40','행거루프','SUB_MAT','','Y','9144','2011-05-27',40,''),('AIR','AIR','TRANS_TYPE',NULL,'Y','9144',NULL,20,NULL),('SEA','SEA','TRANS_TYPE',NULL,'Y','9144',NULL,10,NULL),('1','Apparel','USER_CLASS',NULL,'Y',NULL,NULL,10,NULL),('2','Non-Apparel','USER_CLASS',NULL,'Y',NULL,NULL,20,NULL),('A','시스템관리자 Group','USER_GROUP',NULL,'Y','9144',NULL,10,'0'),('AP','LOCAL','USER_GROUP',NULL,'Y','9144',NULL,100,'S'),('B','PO관리 Group','USER_GROUP',NULL,'Y','9144',NULL,30,'H'),('C','Account','USER_GROUP',NULL,'Y',NULL,NULL,60,'C'),('D','DDP','USER_GROUP',NULL,'Y',NULL,NULL,80,'S'),('F','FOB','USER_GROUP',NULL,'Y',NULL,NULL,90,'S'),('M','QC','USER_GROUP',NULL,'Y','9144',NULL,50,'C'),('N','일반관리자 Group','USER_GROUP',NULL,'Y','9144',NULL,20,'H'),('S','Shipping','USER_GROUP',NULL,'Y',NULL,NULL,70,'C'),('H','세빈 사용자','USER_TYPE',NULL,'Y','9144',NULL,10,'H'),('S','Buyer','USER_TYPE',NULL,'Y','9144',NULL,20,'S');
/*!40000 ALTER TABLE `vg_common_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vg_inspector`
--

DROP TABLE IF EXISTS `vg_inspector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vg_inspector` (
  `CODE` varchar(10) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `ORIGIN` int(2) NOT NULL,
  `USE_YN` varchar(1) NOT NULL default 'Y',
  `CREATOR` varchar(10) default NULL,
  `CREATE_DATE` date default NULL,
  `USER_TYPE` varchar(5) NOT NULL,
  PRIMARY KEY  (`CODE`,`USER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vg_inspector`
--

LOCK TABLES `vg_inspector` WRITE;
/*!40000 ALTER TABLE `vg_inspector` DISABLE KEYS */;
/*!40000 ALTER TABLE `vg_inspector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vg_sample_in_out`
--

DROP TABLE IF EXISTS `vg_sample_in_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vg_sample_in_out` (
  `SEQUENCE_NO` int(10) NOT NULL auto_increment,
  `SAMPLE_NO` varchar(12) NOT NULL,
  `INPUT_DATE` date NOT NULL,
  `ITEM_GROUP` varchar(5) default NULL,
  `QTY` int(6) default NULL,
  `BUYERNAME` varchar(50) default NULL,
  `SUPPLIER` varchar(10) default NULL,
  `SENDING_DATE` date default NULL,
  `RETURN_DATE` date default NULL,
  `REMARKS` varchar(4000) default NULL,
  `MODIFIER` varchar(10) default NULL,
  `MODIFIED_DATE` date default NULL,
  `PLACE` int(8) default NULL,
  `BUYER` varchar(10) default NULL,
  `BUYEREMAIL` varchar(100) default NULL,
  `SUPPLIEREMAIL` varchar(100) default NULL,
  `CCEMAIL` varchar(100) default NULL,
  `SEASON` varchar(20) default NULL,
  `ITEM_CLASS` varchar(10) default NULL,
  `STYLE_NO` varchar(20) default NULL,
  `STATUS` varchar(2) default NULL,
  `COMMENTS` varchar(4000) default NULL,
  `AFILE1_NAME` varchar(100) default NULL,
  `AFILE2_NAME` varchar(100) default NULL,
  `AFILE3_NAME` varchar(100) default NULL,
  PRIMARY KEY  (`SEQUENCE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vg_sample_in_out`
--

LOCK TABLES `vg_sample_in_out` WRITE;
/*!40000 ALTER TABLE `vg_sample_in_out` DISABLE KEYS */;
INSERT INTO `vg_sample_in_out` VALUES (1,'12345','2011-05-17','KDRS',1,NULL,'S1001','2011-05-24','0000-00-00','주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','9144','2011-06-14',NULL,'B1001',NULL,'jeffrey.song@ffb.net.au','Jeffrey.song@ffb.net.au','SPRING','1','54321','22','바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다','12345_SAMPLE SHEET.doc','12345_REQUEST SHEET.doc','12345_AMEND SHEET.doc'),(2,'78910','2011-06-20','KJKT',1,NULL,'S1001','2011-06-01','0000-00-00','바이어에게 주고 받을 내용을 이곳에 기입합니다.','9144','2011-07-12',NULL,'B9999',NULL,NULL,NULL,'WINTER','1','78910','20',NULL,NULL,NULL,NULL),(3,'99999','2011-06-08','WSKT',1,NULL,'S1001','2011-06-10','0000-00-00','Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','9144','2011-06-30',NULL,'B9999',NULL,NULL,NULL,'SUMMER','1','99999','20',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vg_sample_in_out` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-13 11:56:32
