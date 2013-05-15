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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-13 11:57:28
