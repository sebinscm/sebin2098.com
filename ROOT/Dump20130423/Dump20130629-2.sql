-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: scm
-- ------------------------------------------------------
-- Server version	5.0.23-community-nt

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

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `scm` /*!40100 DEFAULT CHARACTER SET utf8 */;

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
INSERT INTO `admin_01t` VALUES ('1000','CEO','business1','H','A',NULL,NULL,'1','ceo@sebin2098.com',NULL,'Y'),('2000','Sebin SCM','business1','H','A','2013-04-16',NULL,'1','wp1968@sebin2098.com',NULL,'Y'),('5000','Sebin JaeHwan','1111','H','A',NULL,NULL,'1','yjhwan87@gmail.com',NULL,'Y');
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
/*!40000 ALTER TABLE `cost_01t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_sheet`
--

DROP TABLE IF EXISTS `cost_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_sheet` (
  `id` int(11) NOT NULL auto_increment,
  `po_num` varchar(45) default NULL,
  `r_m_order_total` varchar(45) default NULL,
  `purchase_total` varchar(45) default NULL,
  `forwarding_company_1` varchar(45) default NULL,
  `forwarding_vehicle_no_1` varchar(45) default NULL,
  `forwarding_cost_1` decimal(10,2) default NULL,
  `forwarding_company_2` varchar(45) default NULL,
  `forwarding_vehicle_no_2` varchar(45) default NULL,
  `forwarding_cost_2` decimal(10,2) default NULL,
  `rely_on_factory` decimal(10,2) default NULL,
  `r_m_total` decimal(10,2) default NULL,
  `factory_fee` decimal(10,2) default NULL,
  `domestic` decimal(10,2) default NULL,
  `international` decimal(10,2) default NULL,
  `etc` decimal(10,2) default NULL,
  `benefit` decimal(10,2) default NULL,
  `dollor` decimal(10,2) default '0.00',
  `currency` decimal(10,2) default '0.00',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `po_num_UNIQUE` (`po_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_sheet`
--

LOCK TABLES `cost_sheet` WRITE;
/*!40000 ALTER TABLE `cost_sheet` DISABLE KEYS */;
INSERT INTO `cost_sheet` VALUES (2,'PO201310002',NULL,NULL,'','',0.00,'','',0.00,0.00,1000.00,15.00,2.00,2.00,2.00,11864.00,9.79,6.13),(3,'PO201310003',NULL,NULL,'','',0.00,'','',0.00,0.00,210.00,100.00,50.00,40.00,10.00,454.00,NULL,NULL),(4,'PO201310004',NULL,NULL,'','',0.00,'','',0.00,2.00,1000.00,500.00,1000.00,100.00,0.00,1448.00,NULL,NULL);
/*!40000 ALTER TABLE `cost_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_sheet_purchase_in_stock`
--

DROP TABLE IF EXISTS `cost_sheet_purchase_in_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_sheet_purchase_in_stock` (
  `id` int(11) NOT NULL auto_increment,
  `po_num` varchar(45) default NULL,
  `purchase_date` varchar(45) default NULL,
  `purchase_qty` int(11) default NULL,
  `purchase_cost` decimal(10,2) default NULL,
  `purchase_etc` varchar(45) default NULL,
  `in_stock_date_received` varchar(45) default NULL,
  `in_stock_qty` int(11) default NULL,
  `in_stock_date_received_f` varchar(45) default NULL,
  `in_stock_date_checked_f` varchar(45) default NULL,
  `in_stock_qty_f` int(45) default NULL,
  `in_stock_diff` varchar(45) default NULL,
  `consumption` varchar(45) default NULL,
  `qty` int(45) default NULL,
  `cost` decimal(10,2) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_sheet_purchase_in_stock`
--

LOCK TABLES `cost_sheet_purchase_in_stock` WRITE;
/*!40000 ALTER TABLE `cost_sheet_purchase_in_stock` DISABLE KEYS */;
INSERT INTO `cost_sheet_purchase_in_stock` VALUES (74,'PO201310003','',8,170.00,'','',0,'','',0,'','out_shell',10,2.00),(75,'PO201310003','',56,40.00,'','',0,'','',0,'','combination',0,0.00),(76,'PO201310003','',0,0.00,'','',0,'','',0,'','lining',0,0.00),(77,'PO201310003','',0,0.00,'','',0,'','',0,'','button',0,0.00),(78,'PO201310003','',0,0.00,'','',0,'','',0,'','',0,0.00),(114,'PO201310004','',35,100.00,'m','2013/06/28',33,'','',0,'','out_shell',3,3.00),(115,'PO201310004','',56,200.00,'y','',0,'','',0,'','combination',0,0.00),(116,'PO201310004','',7,300.00,'','',0,'','',0,'','inter_lining',0,0.00),(117,'PO201310004','',8,400.00,'','',0,'','',0,'','hanger_tape',0,0.00),(118,'PO201310004','',0,0.00,'','',0,'','',0,'','',0,0.00),(214,'PO201310002','',100,1000.00,'','2013.06.20',95,'2013.06.24','2013.06.25',92,'8','out_shell',100,10.00),(215,'PO201310002','',0,0.00,'','',0,'','',0,'','combination',0,0.00),(216,'PO201310002','',0,0.00,'','',0,'','',0,'','lining',0,0.00),(217,'PO201310002','',0,0.00,'','',0,'','',0,'','button',0,0.00),(218,'PO201310002','',0,0.00,'','',0,'','',0,'','',0,0.00);
/*!40000 ALTER TABLE `cost_sheet_purchase_in_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_sheet_r_m_o`
--

DROP TABLE IF EXISTS `cost_sheet_r_m_o`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_sheet_r_m_o` (
  `id` int(11) NOT NULL auto_increment,
  `po_num` varchar(45) default NULL,
  `consumption` varchar(45) default NULL,
  `qty` varchar(45) default NULL,
  `cost` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_sheet_r_m_o`
--

LOCK TABLES `cost_sheet_r_m_o` WRITE;
/*!40000 ALTER TABLE `cost_sheet_r_m_o` DISABLE KEYS */;
/*!40000 ALTER TABLE `cost_sheet_r_m_o` ENABLE KEYS */;
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
  `PO_INPUT` varchar(1) default 'N',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_01t`
--

LOCK TABLES `login_01t` WRITE;
/*!40000 ALTER TABLE `login_01t` DISABLE KEYS */;
INSERT INTO `login_01t` VALUES ('b1000','1234','JaeHwan','yjhwan87@gmail.com','18520594112','','2342','','','','','','','2013-05-11','B','D','N',NULL,'USD','2013-05-08','KR','16','N'),('P1001',NULL,'test man','wjdgyrlf@hotmail.com','29385','','','','','','','','',NULL,'P',NULL,'N',NULL,'HKD','2013-05-09','US',NULL,'N'),('P1002',NULL,'TEST Manufacturer','test@test.com','1234','1234','123455','111','address test manufacturer','','SSD','','',NULL,'P',NULL,'N',NULL,'HKD','2013-05-09','US',NULL,'N'),('S1001',NULL,'SEBIN','scm@sebin2098.com','1234','1234','124','','sds','','1122','SSS','','2013-05-11','S',NULL,'N',NULL,'HKD','2013-05-09','US',NULL,'N');
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
  `SUPPLY_NAME` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
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
INSERT INTO `menu_t` VALUES (1,'Z','Z','Home',NULL,'000',1,'3',NULL,'3',NULL),(43,'H','N','My Account',NULL,'100',1,'3',NULL,'3',NULL),(44,'H','N','Notice for Buyers','/admin/memo/','110',43,'3',NULL,'9144',NULL),(48,'H','N','Order','','300',1,'3',NULL,'9144','2011-05-31'),(49,'H','N','Edit PPO','/ordermanagement/admin_order_list.jsp','310',48,'3',NULL,'9144',NULL),(50,'H','N','Order Amendment','/ordermanagement/order_amend_list.jsp','320',48,'3',NULL,'9144',NULL),(52,'H','N','Create Shipment','/ordermanagement/shipment_issue_list.jsp','510',528,'3',NULL,'9144',NULL),(54,'H','N','Search Invoice','/order/admin_invoice_search.jsp','360',48,'3',NULL,'3',NULL),(55,'H','N','Bulletin Board/PDS',NULL,'900',1,'3',NULL,'9144',NULL),(56,'H','N','Item History','/ordermanagementr/product_info.jsp','910',55,'3',NULL,'9144',NULL),(61,'H','N','Password Change','/admin/resetAdminPasswdForm.jsp?fromURL=menu','160',43,'9240',NULL,'9240',NULL),(101,'H','B','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(102,'H','B','Sample',NULL,'200',1,NULL,NULL,'9144',NULL),(103,'H','B','Password Change','/admin/resetAdminPasswdForm.jsp?fromURL=menu','150',101,NULL,NULL,NULL,NULL),(110,'H','B','Bulletin Board/PDS',NULL,'900',1,NULL,NULL,'9144',NULL),(111,'H','B','Item History','/ordermanagement/product_info.jsp','910',110,NULL,NULL,'9144',NULL),(114,'H','N','Sample',NULL,'200',1,NULL,NULL,'9144',NULL),(115,'H','N','Sample Image','/admin/buyer/style_image_upload_form.jsp','210',114,NULL,NULL,'9144',NULL),(116,'H','B','Sample Image','/admin/buyer/style_image_upload_form.jsp','240',102,NULL,NULL,'9144','2011-06-02'),(117,'H','N','Original Sample','/admin/buyer/original_sample_in_out_list.jsp','220',114,NULL,NULL,'9144',NULL),(118,'H','B','Original Sample','/admin/buyer/original_sample_in_out_list.jsp','220',102,NULL,NULL,'9144',NULL),(201,'C','M','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(202,'C','M','Memorandum','/memo/memo.jsp','110',201,NULL,NULL,NULL,NULL),(203,'C','M','Profile','/account/','120',201,NULL,NULL,NULL,NULL),(205,'C','M','Order Management',NULL,'300',1,NULL,NULL,NULL,NULL),(206,'C','M','PO Confirmation','/order/dsk_po_confirm_search.jsp','310',205,NULL,NULL,'9240',NULL),(207,'C','M','PO History','/order/dsk_po_status.jsp','320',205,NULL,NULL,NULL,NULL),(208,'C','M','Order Amendment','/order/po_amend.jsp','330',205,NULL,NULL,NULL,NULL),(209,'C','M','Barcode Files','/order/barcode.jsp','340',205,NULL,NULL,NULL,NULL),(211,'C','M','Packing List','/order/packing.jsp','361',205,NULL,NULL,NULL,NULL),(213,'C','M','Q.C Roster','/order/qc_report.jsp','380',205,NULL,NULL,NULL,NULL),(214,'C','M','Q.C Analysis','/order/qc_analysis.jsp','390',205,NULL,NULL,NULL,NULL),(216,'C','M','GI Packing List','/order/invoice_confirm_search_dsk.jsp','362',205,NULL,NULL,NULL,NULL),(220,'C','M','Services & Support',NULL,'500',1,NULL,NULL,NULL,NULL),(221,'C','M','Product Info.','/order/product_info.jsp','510',220,NULL,NULL,NULL,NULL),(222,'C','M','Manuals','/notice/list.jsp?table_name=notice','530',220,NULL,NULL,'9240',NULL),(224,'C','M','Password Change','/apess/resetPasswdForm.jsp?fromURL=menu','140',201,NULL,NULL,NULL,NULL),(226,'C','C','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(227,'C','C','Memorandum','/memo/memo.jsp','110',226,NULL,NULL,NULL,NULL),(228,'C','C','Password Change','/apess/resetPasswdForm.jsp?fromURL=menu','140',226,NULL,NULL,NULL,NULL),(229,'C','C','Payment Management',NULL,'300',1,NULL,NULL,NULL,NULL),(230,'C','C','PO History','/order/dsk_po_status.jsp','320',229,NULL,NULL,NULL,NULL),(233,'C','C','GI Packing List','/order/invoice_confirm_search_dsk.jsp','362',229,NULL,NULL,NULL,NULL),(237,'C','C','Search Invoice','/apess/invoice_list.jsp','351',229,NULL,NULL,NULL,NULL),(238,'C','C','Services & Support',NULL,'600',1,NULL,NULL,NULL,NULL),(239,'C','C','Product Info.','/order/product_info.jsp','610',238,NULL,NULL,NULL,NULL),(240,'C','C','Manuals','/notice/list.jsp?table_name=notice','630',238,NULL,NULL,'9240',NULL),(242,'C','S','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(243,'C','S','Memorandum','/memo/memo.jsp','110',242,NULL,NULL,NULL,NULL),(244,'C','S','Password Change','/apess/resetPasswdForm.jsp?fromURL=menu','140',242,NULL,NULL,NULL,NULL),(245,'C','S','Shipment Management',NULL,'300',1,NULL,NULL,NULL,NULL),(247,'C','S','Packing Form Creation','/order/packing_create.jsp','350',245,NULL,NULL,NULL,NULL),(248,'C','S','Packing List','/order/packing.jsp','351',245,NULL,NULL,NULL,NULL),(252,'C','S','Create Invoice','/apess/invoice_issue_list.jsp','360',245,NULL,NULL,NULL,NULL),(253,'C','S','Search Invoice','/apess/invoice_list.jsp','361',245,NULL,NULL,NULL,NULL),(257,'C','A','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(258,'C','A','Memorandum','/memo/memo.jsp','110',257,NULL,NULL,'9240',NULL),(259,'C','A','Password Change','/apess/resetPasswdForm.jsp?fromURL=menu','140',257,NULL,NULL,NULL,NULL),(260,'C','A','Shipment Management',NULL,'300',1,NULL,NULL,NULL,NULL),(261,'C','A','PO History','/order/dsk_po_status.jsp','320',260,NULL,NULL,NULL,NULL),(262,'C','A','Packing List','/order/packing.jsp','351',260,NULL,NULL,NULL,NULL),(263,'C','A','Received Qty List','/order/invoice_confirm_search_dsk.jsp','352',260,NULL,NULL,'9240',NULL),(265,'C','A','Search Invoice','/apess/invoice_list.jsp','361',260,NULL,NULL,NULL,NULL),(268,'C','A','Services & Support',NULL,'600',1,NULL,NULL,NULL,NULL),(269,'C','A','Product Info.','/order/product_info.jsp','610',268,NULL,NULL,NULL,NULL),(270,'C','A','Manuals','/notice/list.jsp?table_name=notice','630',268,NULL,NULL,'9240',NULL),(272,'C','A','Packing Form Creation','/order/packing_create.jsp','350',260,NULL,NULL,NULL,NULL),(273,'C','A','Create Invoice','/apess/invoice_issue_list.jsp','360',260,NULL,NULL,NULL,NULL),(274,'C','A','PO History+','/order/dsk_po_status.jsp?M=Y','321',260,NULL,NULL,'9240',NULL),(275,'C','A','Search Invoice+','/apess/invoice_list.jsp?M=Y','362',260,NULL,NULL,'9240',NULL),(276,'C','A','Apess User List','/admin/apessuser/list.jsp','120',257,NULL,NULL,'9240',NULL),(277,'C','A','Inspector Management','/apess/inspector_list.jsp','130',257,NULL,NULL,NULL,NULL),(286,'H','A','My Account','','050',1,NULL,NULL,'9144','2011-05-23'),(287,'H','A','Sample',NULL,'200',1,NULL,NULL,'9144',NULL),(288,'H','A','Order',NULL,'300',1,NULL,NULL,'9144',NULL),(289,'H','A','Bulletin Board/PDS',NULL,'900',1,NULL,NULL,'9144',NULL),(290,'H','A','Notice for Buyers','/admin/memo/','110',494,NULL,NULL,'9144',NULL),(291,'H','A','Buyer','/account/supplier.jsp','120',494,NULL,NULL,'9144',NULL),(293,'H','A','Sebin User','/admin/adminuser/list.jsp','140',494,NULL,NULL,'9144',NULL),(296,'H','A','User Screen Menu','/admin/menu/menu_list.jsp?menuType=H','150',494,NULL,NULL,'9144','2011-06-03'),(297,'H','A','Buyer Screen Menu','/admin/menu/menu_list.jsp?menuType=S','151',494,NULL,NULL,'9144','2011-06-03'),(299,'H','A','Edit Password','/admin/resetAdminPasswdForm.jsp?fromURL=menu','060',286,NULL,NULL,'9144',NULL),(300,'H','A','Sample Image','/admin/buyer/style_image_upload_form.jsp','250',287,NULL,NULL,'9144','2011-06-02'),(301,'H','A','Original Sample','/admin/buyer/original_sample_in_out_list.jsp','220',287,NULL,NULL,'9144',NULL),(302,'H','A','Edit PPO','/ordermanagement/admin_order_list.jsp','310',288,NULL,NULL,'9144',NULL),(303,'H','A','Order Amendment','/ordermanagement/order_amend_list.jsp','320',288,NULL,NULL,'9144',NULL),(305,'H','A','Create Shipment','/ordermanagement/shipment_issue_list.jsp','510',525,NULL,NULL,'9144',NULL),(308,'H','A','Search Invoices','/payment/invoice_search.jsp','740',527,NULL,NULL,'9144',NULL),(311,'H','A','Item History','/ordermanagement/admin_item_history_list.jsp','910',289,NULL,NULL,'9144',NULL),(351,'C','S','PO History','/order/dsk_po_status.jsp','320',245,'9240',NULL,'9240',NULL),(353,'C','A','Q.C Roster','/order/qc_report.jsp','380',260,'9240',NULL,'9240',NULL),(354,'C','A','Q.C Analysis','/order/qc_analysis.jsp','381',260,'9240',NULL,'9240',NULL),(355,'C','A','Barcode Files','/order/barcode.jsp','340',260,'9240',NULL,'9240',NULL),(356,'C','S','Barcode Files','/order/barcode.jsp','340',245,'9240',NULL,'9240',NULL),(359,'C','A','Barcode Check','/pda.jsp','390',260,'9240',NULL,'9240',NULL),(360,'C','C','Barcode Check','/pda.jsp','390',229,'9240',NULL,'9240',NULL),(361,'C','M','Barcode Check','/pda.jsp','395',205,'9240',NULL,'9240',NULL),(362,'C','S','Barcode Check','/pda.jsp','390',245,'9240',NULL,'9240',NULL),(364,'H','N','Buyer','/account/supplier.jsp','120',43,'9240',NULL,'9144',NULL),(391,'H','A','PDS','/notice_new/list.jsp?noticeType=2','940',289,'9240',NULL,'9144','2011-06-29'),(392,'H','N','PDS','/notice_new/list.jsp?noticeType=2','940',55,'9240',NULL,'9144','2011-06-29'),(393,'H','B','PDS','/notice_new/list.jsp?noticeType=2','940',110,'9240',NULL,'9144','2011-06-29'),(400,'S','F','My Account','','100',1,'9240',NULL,'9144','2011-05-23'),(401,'S','F','Order Management',NULL,'300',1,'9240',NULL,'9144',NULL),(402,'S','F','Invoices',NULL,'400',1,'9240',NULL,'9144',NULL),(403,'S','F','Support & Services','','500',1,'9240',NULL,'9144','2011-07-27'),(404,'S','F','Announcement','/memo/index.jsp','110',400,'9240',NULL,'9144','2011-07-27'),(405,'S','F','Profile','/account/view_profile.jsp','120',400,'9240',NULL,'9144',NULL),(406,'S','F','PO Confirmation','/ordermanagement/buyer_order_confirm_list.jsp','310',401,'9240',NULL,'9144',NULL),(407,'S','F','PO History','/ordermanagement/buyer_order_list.jsp','320',401,'9240',NULL,'9144',NULL),(408,'S','F','Order Amendment','/ordermanagement/buyer_order_amend_list.jsp','330',401,'9240',NULL,'9144',NULL),(412,'S','F','Invoice list','/payment/buyer_invoice_search.jsp','405',402,'9240',NULL,'9144','2011-07-27'),(415,'S','F','Payment','/payment/buyer_payment_search.jsp','425',402,'9240',NULL,'9144','2011-07-27'),(417,'S','F','Product Search','/ordermanagement/buyer_item_history_list.jsp','510',403,'9240',NULL,'9144','2011-07-27'),(418,'S','F','Bulletin board','/notice_new/buyer_list.jsp?noticeType=1','530',403,'9240',NULL,'9144','2011-07-27'),(419,'S','F','Download','/notice_new/buyer_list.jsp?noticeType=2','540',403,'9240',NULL,'9144','2011-07-27'),(447,'C','A','Tag Specs','/notice/list.jsp?table_name=notice2','640',268,'9240',NULL,'9240',NULL),(448,'C','C','Tag Specs','/notice/list.jsp?table_name=notice2','640',238,'9240',NULL,'9240',NULL),(449,'C','M','Tag Specs','/notice/list.jsp?table_name=notice2','540',220,'9240',NULL,'9240',NULL),(453,'H','A','Order Status','/ordermanagement/admin_order_status_list.jsp','315',288,'9240',NULL,'9144',NULL),(454,'H','B','Order',NULL,'300',1,'9240',NULL,'9144',NULL),(455,'H','B','Order Status','/ordermanagement/admin_order_status_list.jsp','315',454,'9240',NULL,'9144',NULL),(457,'S','F','Shipment List','/ordermanagement/buyer_shipment_list.jsp','375',401,'9240',NULL,'9144',NULL),(458,'H','A','Shipment List','/ordermanagement/admin_shipment_list.jsp','520',525,'9240',NULL,'9144',NULL),(459,'H','N','Shipment List','/ordermanagement/admin_shipment_list.jsp','520',528,'9240',NULL,'9144',NULL),(460,'C','A','Profile','/account/','135',257,'9240',NULL,'9240',NULL),(461,'H','N','Order Status','/ordermanagement/admin_order_status_list.jsp','315',48,'9240',NULL,'9144',NULL),(485,'C','A','Shipment Creation','/order/shipment_issue_list.jsp','355',260,'9240',NULL,'9240',NULL),(486,'C','A','Shipment List','/order/shipment_list.jsp','356',260,'9240',NULL,'9240',NULL),(487,'C','A','Credit/Debit Note','/order/dsk_note.jsp','363',260,'9240',NULL,'9240',NULL),(488,'C','S','Shipment Creation','/order/shipment_issue_list.jsp','355',245,'9240',NULL,'9240',NULL),(489,'C','S','Shipment List','/order/shipment_list.jsp','356',245,'9240',NULL,'9240',NULL),(490,'C','S','Credit/Debit Note','/order/dsk_note.jsp','363',245,'9240',NULL,'9240',NULL),(491,'C','C','Credit/Debit Note','/order/dsk_note.jsp','363',229,'9240',NULL,'9240',NULL),(492,'H','A','Code Management','/admin/codes/code_list.jsp','125',494,'9144',NULL,'9144',NULL),(494,'H','A','System Administration','','100',1,'9144',NULL,'9144','2011-05-23'),(496,'H','A','Notice for Sebin Users','/admin/notice/list.jsp','155',494,'9144',NULL,'9144',NULL),(497,'H','A','Manufacturer','/account/sub_list.jsp','130',494,'9144',NULL,'9144',NULL),(498,'H','A','Create PPO','/ordermanagement/PurchaseOrder.jsp','305',288,'9144',NULL,'9144',NULL),(500,'H','A','Upload Style Image','/ordermanagement/image_upload.jsp','313',288,'9144',NULL,'9144',NULL),(502,'H','A','Company CI','/admin/codes/companyci_upload.jsp','160',494,'9144',NULL,'9144',NULL),(504,'H','A','Upload Style Images (Batch)','/ordermanagement/style_image_upload_form.jsp','314',288,'9144',NULL,'9144',NULL),(505,'H','B','Upload Style Images (Batch)','/ordermanagement/style_image_upload_form.jsp','321',454,'9144',NULL,'9144','2011-06-08'),(506,'H','N','Upload Style Images (Batch)','/ordermanagement/style_image_upload_form.jsp','305',48,'9144',NULL,'9144',NULL),(508,'S','F','SAMPLE Management','','200',1,'9144',NULL,'9144','2011-07-27'),(509,'S','F','Original Sample','/sample/original_sample_list.jsp','210',508,'9144',NULL,'9144','2011-07-27'),(510,'H','A','Company Profile','/account/company_list.jsp','135',494,'9144',NULL,'9144',NULL),(511,'H','A','Production',NULL,'400',1,'9144',NULL,'9144',NULL),(512,'H','A','Production Status','/admin/product/product_management.jsp','410',511,'9144',NULL,'9144',NULL),(515,'H','B','Order Amendment','/ordermanagement/order_amend_list.jsp','317',454,'9144',NULL,'9144',NULL),(516,'H','B','Create PPO','/ordermanagement/PurchaseOrder.jsp','312',454,'9144',NULL,'9144','2011-06-08'),(517,'H','B','Edit PPO','/ordermanagement/admin_order_list.jsp','313',454,'9144',NULL,'9144','2011-06-08'),(518,'H','B','Upload Style Image','/ordermanagement/image_upload.jsp','320',454,'9144',NULL,'9144','2011-06-08'),(520,'H','B','Create Shipment','/ordermanagement/shipment_issue_list.jsp','510',529,'9144',NULL,'9144',NULL),(522,'H','B','Production',NULL,'400',1,'9144',NULL,'9144',NULL),(523,'H','B','Production Status','/admin/product/product_management.jsp','410',522,'9144',NULL,'9144',NULL),(524,'H','B','Notice for Buyers','/admin/memo/','151',101,'9144',NULL,'9144',NULL),(525,'H','A','Shipment',NULL,'500',1,'9144',NULL,'9144',NULL),(526,'H','A','Create Invoice','/payment/invoice_confirm_search.jsp','730',527,'9144',NULL,'9144',NULL),(527,'H','A','Payment','','700',1,'9144',NULL,'9144','2011-05-31'),(528,'H','N','Shipment',NULL,'500',1,'9144',NULL,'9144',NULL),(529,'H','B','Shipment',NULL,'500',1,'9144',NULL,'9144',NULL),(530,'H','B','Shipment list','/ordermanagement/admin_shipment_list.jsp','520',529,'9144',NULL,'9144',NULL),(531,'H','B','Payment','','700',1,'9144',NULL,'9144','2011-05-31'),(532,'H','B','Create Invoice','/payment/invoice_confirm_search.jsp','710',531,'9144',NULL,'9144',NULL),(533,'H','B','Search Invoices','/payment/invoice_search.jsp','720',531,'9144',NULL,'9144',NULL),(534,'H','A','Contractor Payment','/payment/sub_payment_list.jsp','710',527,'9144',NULL,'9144','2011-05-31'),(535,'H','A','PO History','/ordermanagement/admin_order_history_list.jsp','311',288,'9144',NULL,'9144',NULL),(536,'H','N','PO History','/ordermanagement/admin_order_history_list.jsp','316',48,'9144',NULL,'9144',NULL),(537,'H','B','PO History','/ordermanagement/admin_order_history_list.jsp','314',454,'9144',NULL,'9144','2011-06-08'),(538,'H','A','Buyer Payment','/payment/admin_payment_list.jsp','750',527,'9144',NULL,'9144',NULL),(539,'H','A','Payment Record','/payment/admin_payment_search.jsp','760',527,'9144',NULL,'9144',NULL),(540,'H','A','Cost','/admin/product/cost_management.jsp','420',511,'9144','2011-05-26','9144','2011-05-26'),(541,'H','A','Sample Spec Sheet','/admin/buyer/original_sample_list.jsp','230',287,'9144','2011-06-02','9144','2011-06-02'),(542,'H','B','Sample Spec Sheet','/admin/buyer/original_sample_list.jsp','230',102,'9144','2011-06-02','9144','2011-06-02'),(543,'S','F','Sample Sheet','/sample/sample_sheet_list.jsp','220',508,'9144','2011-06-03','9144','2011-07-27'),(544,'H','B','Buyer','/account/supplier.jsp','311',454,'9144','2011-06-08','9144','2011-06-08'),(545,'H','B','Manufacturer','/account/sub_list.jsp','310',454,'9144','2011-06-08','9144','2011-06-08'),(546,'H','B','Cost','/admin/product/cost_management.jsp','420',522,'1001','2011-06-08','1001','2011-06-08'),(547,'H','B','Contractor Payment','/admin/product/cost_management.jsp','705',531,'1001','2011-06-08','1001','2011-06-08'),(548,'H','B','Buyer Payment','/payment/admin_payment_list.jsp','730',531,'1001','2011-06-08','1001','2011-06-08'),(549,'H','B','Payment Record','/payment/admin_payment_search.jsp','740',531,'1001','2011-06-08','1001','2011-06-08'),(550,'H','A','Contractor Order','/admin/product/admin_suborder_list.jsp','415',511,'9144','2011-06-17','9144','2011-06-17'),(551,'H','B','Contractor Order','/admin/product/admin_suborder_list.jsp','415',522,'9144','2011-06-20','9144','2011-06-20'),(552,'H','A','Bulletin Board','/notice_new/list.jsp?noticeType=1','920',289,'9144','2011-06-29','9144','2011-06-29'),(553,'H','B','Bulletin Board','/notice_new/list.jsp?noticeType=1','920',110,'9144','2011-06-29','9144','2011-06-29'),(554,'H','N','Bulletin Board','/notice_new/list.jsp?noticeType=1','920',55,'9144','2011-06-29','9144','2011-06-29'),(555,'H','A','DB Layout','/admin/SystemAdmin/Table_Layout.html','190',494,'9144','2011-07-05','9144','2011-07-05'),(556,'S','D','My Account','','100',1,'9144','2011-07-27','9144','2011-07-27'),(557,'S','D','Announcement','/memo/index.jsp','110',556,'9144','2011-07-27','9144','2011-07-27'),(558,'S','D','Profile','/account/view_profile.jsp','120',556,'9144','2011-07-27','9144','2011-07-27'),(559,'S','D','SAMPLE Management','','200',1,'9144','2011-07-27','9144','2011-07-27'),(560,'S','D','Original Sample list','/sample/original_sample_list.jsp','210',559,'9144','2011-07-27','9144','2011-07-27'),(561,'S','D','Sample Sheet','/sample/sample_sheet_list.jsp','220',559,'9144','2011-07-27','9144','2011-07-27'),(562,'S','D','Order Management','','300',1,'9144','2011-07-27','9144','2011-07-27'),(564,'S','D','PO LIST','/ordermanagement/buyer_order_edit_list.jsp','320',562,'9144','2011-07-27','2000','2013-06-28'),(565,'S','D','PO Confirmation','/ordermanagement/buyer_order_confirm_list.jsp','330',562,'9144','2011-07-27','9144','2011-07-27'),(566,'S','D','PO History','/ordermanagement/buyer_order_list.jsp','340',562,'9144','2011-07-27','9144','2011-07-27'),(567,'S','D','Order Amendment report','/ordermanagement/buyer_order_amend_list.jsp','350',562,'9144','2011-07-27','9144','2011-08-09'),(568,'S','D','Shipment List','/ordermanagement/buyer_shipment_list.jsp','360',562,'9144','2011-07-27','9144','2011-07-27'),(569,'S','D','Invoices','','400',1,'9144','2011-07-27','9144','2011-07-27'),(570,'S','D','Invoice list','/payment/buyer_invoice_search.jsp','410',569,'9144','2011-07-27','9144','2011-07-27'),(571,'S','D','Payment','/payment/buyer_payment_search.jsp','420',569,'9144','2011-07-27','9144','2011-07-27'),(572,'S','D','Support & Services','','500',1,'9144','2011-07-27','9144','2011-07-27'),(573,'S','D','Product Search','/ordermanagement/buyer_item_history_list.jsp','510',572,'9144','2011-07-27','9144','2011-07-27'),(574,'S','D','Bulletin board','/notice_new/buyer_list.jsp?noticeType=1','530',1,'9144','2011-07-27','9144','2011-07-27'),(575,'S','D','Download','/notice_new/buyer_list.jsp?noticeType=2','540',572,'9144','2011-07-27','9144','2011-07-27'),(576,'H','A','Browse Style Image','Browser.jsp?sort=1&dir=C%3A%5CSCM_MYSQL%5CROOT%5Cimages','950',289,'9144','2011-08-02','9144','2011-08-02'),(579,'S','D','Order Amendment','/ordermanagement/buyer_order_amend_input.jsp','345',562,'9144','2011-08-09','9144','2011-08-09'),(580,'S','D','PO Status update','/ordermanagement/buyer_order_status_list.jsp','342',562,'9144','2011-08-09','9144','2011-08-09');
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
INSERT INTO `notice2` VALUES (1,'세빈SCM 관리자 및 사용자 메뉴얼','System Admin','1234','scm@sebin2098.com','null','2011-06-28','안녕하세요,\r\n\r\nSebin SCM에 대한 시스템 관리자 및 사용자 메뉴얼입니다.\r\n첨부화일을 다운로드 하시기 바랍니다.\r\n','/upload/scm/SCM_Admin & Users_Manual.pdf',10520193,3,1,0,0,'9144'),(2,'Sebin SCM Buyers 메뉴얼','System Admin','1234','scm@sebin2098.com','null','2011-06-28','Sebin SCM에 대한 Buyer를 위한 메뉴얼입니다.\r\n첨부된 문서를 읽기 위해서는 반드시 Adobe PDF Reader가 설치 되어 있어야 합니다.\r\n\r\n기타 문의사항에 대해서는 세빈 본사에 문의하여 주세요.','/upload/scm/SCM_Buyers_Manual.pdf',3921366,2,2,0,0,'9144');
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
INSERT INTO `notice_01t` VALUES (3,'2011-06-29','9144','SCM manager',2,'바이어용 메뉴얼입니다.','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">바이어용 사용자 메뉴얼입니다.</font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">첨부된 문서를 다운로드하여 사용하시면 됩니다.</font></p>\r\n\r\n</body>\r\n',26,'2011-06-29'),(7,'2011-08-17','2000','SCM manager',2,'바이어용 중요요약 메뉴얼V1.0 입니다. ','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">바이어용 중요 요약 메뉴얼입니다..</font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;</p>\r\n\r\n</body>\r\n',21,'2012-06-02'),(8,'2013-06-28','2000','Sebin SCM',2,'SEBIN SCM 간단 메뉴얼 ','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p>SEBIN SCM 간단 메뉴얼 </p>\r\n\r\n</body>\r\n',9,'2013-06-28');
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
INSERT INTO `notice_02t` VALUES (3,3,'SCM_Buyers_Manual.pdf','SCM_Buyers_Manual.pdf'),(7,7,'20110809_SEBIN_요약scm.ppt','20110809_SEBIN_요약scm.ppt'),(10,8,'SEBIN SCM MANUAL.docx','SEBIN SCM MANUAL.docx');
/*!40000 ALTER TABLE `notice_02t` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_sheet`
--

DROP TABLE IF EXISTS `order_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_sheet` (
  `id` int(11) NOT NULL auto_increment,
  `po_num` varchar(45) default NULL,
  `comment` text,
  `main_label` varchar(45) default NULL,
  `size_label` varchar(45) default NULL,
  `care_label` varchar(45) default NULL,
  `hanger_tape` varchar(45) default NULL,
  `price_tag` varchar(45) default NULL,
  `hanger_tape_simple` varchar(45) default NULL,
  `packing` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `po_num_UNIQUE` (`po_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_sheet`
--

LOCK TABLES `order_sheet` WRITE;
/*!40000 ALTER TABLE `order_sheet` DISABLE KEYS */;
INSERT INTO `order_sheet` VALUES (2,'PO201310002','asfgasdf','asdf','dgasfg','fqwg','g','hgwsfg','asdrgqwf',''),(3,'PO201310003','qwefqwefasdfgasdg','ddd','ff','e','q','qwef','dd','345'),(4,'PO201310004','asdf','as','g','sadf','','','',''),(7,'PO201310005','','','','','','','','');
/*!40000 ALTER TABLE `order_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_sheet_size`
--

DROP TABLE IF EXISTS `order_sheet_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_sheet_size` (
  `id` int(11) NOT NULL auto_increment,
  `po_num` varchar(45) default NULL,
  `size_name` varchar(45) default NULL,
  `first` varchar(45) default NULL,
  `second` varchar(45) default NULL,
  `third` varchar(45) default NULL,
  `fourth` varchar(45) default NULL,
  `fifth` varchar(45) default NULL,
  `sixth` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_sheet_size`
--

LOCK TABLES `order_sheet_size` WRITE;
/*!40000 ALTER TABLE `order_sheet_size` DISABLE KEYS */;
INSERT INTO `order_sheet_size` VALUES (85,'PO201310003','前衣长/총기장','1','2','34','0','0','0'),(86,'PO201310003','前中长/앞중심기장','asd','','','0','0','0'),(87,'PO201310003','后中长/뒷중심기장','f','','','0','0','0'),(88,'PO201310003','肩宽/어깨너비','qw','','','0','0','0'),(89,'PO201310003','qwg','','','','0','0','0'),(90,'PO201310003','前领深/앞목깊이','234','','s','0','0','0'),(91,'PO201310003','后领深/뒷목깊이','','','','0','0','0'),(92,'PO201310003','1/2胸围/가슴','23','5','','0','0','0'),(93,'PO201310003','1/2腰围','3111','ae56s','','0','0','0'),(94,'PO201310003','1/2下摆/밑단  弯量','','dvn','3t54','0','0','0'),(95,'PO201310003','夹圈','','','','0','0','0'),(96,'PO201310003','','','','','0','0','0'),(97,'PO201310003','','','','','0','0','0'),(98,'PO201310003','','','','','0','0','0'),(113,'PO201310002','前衣长/총기장','1','2','3f','0','0','0'),(114,'PO201310002','前中长/앞중심기장','w','q','','0','0','0'),(115,'PO201310002','后中长/뒷중심기장','d','f','','0','0','0'),(116,'PO201310002','肩宽/어깨너비','','','','0','0','0'),(117,'PO201310002','领宽/목너비','asg','','','0','0','0'),(118,'PO201310002','前领深/앞목깊이','','','','0','0','0'),(119,'PO201310002','后领深/뒷목깊이','','','','0','0','0'),(120,'PO201310002','1/2胸围/가슴','','','','0','0','0'),(121,'PO201310002','1/2腰围','cc','','','0','0','0'),(122,'PO201310002','1/2下摆/밑단  弯量','','','','0','0','0'),(123,'PO201310002','','','','','0','0','0'),(124,'PO201310002','ccc','','','','0','0','0'),(125,'PO201310002','','','','','0','0','0'),(126,'PO201310002','','','','','0','0','0'),(127,'PO201310004','前衣长/총기장','a','','','0','0','0'),(128,'PO201310004','前中长/앞중심기장','','','','0','0','0'),(129,'PO201310004','后中长/뒷중심기장','','asdf','','0','0','0'),(130,'PO201310004','肩宽/어깨너비','','','','0','0','0'),(131,'PO201310004','领宽/목너비','gqw','','','0','0','0'),(132,'PO201310004','前领深/앞목깊이','','','','0','0','0'),(133,'PO201310004','后领深/뒷목깊이','','','','0','0','0'),(134,'PO201310004','1/2胸围/가슴','','w','','0','0','0'),(135,'PO201310004','1/2腰围','','','','0','0','0'),(136,'PO201310004','1/2下摆/밑단  弯量','','g','','0','0','0'),(137,'PO201310004','夹圈','','','','0','0','0'),(138,'PO201310004','asdg','d','','','0','0','0'),(139,'PO201310004','asdg','assa','','','0','0','0'),(140,'PO201310004','','','','','0','0','0'),(141,'PO201310005','前衣长/총기장','1','1','1','0','0','0'),(142,'PO201310005','前中长/앞중심기장','2','2','2','0','0','0'),(143,'PO201310005','后中长/뒷중심기장','3','3','4','0','0','0'),(144,'PO201310005','肩宽/어깨너비','5','6','5','0','0','0'),(145,'PO201310005','领宽/목너비','6','7','2','0','0','0'),(146,'PO201310005','前领深/앞목깊이','','','','0','0','0'),(147,'PO201310005','后领深/뒷목깊이','','','','0','0','0'),(148,'PO201310005','1/2胸围/가슴','','','','0','0','0'),(149,'PO201310005','1/2腰围','','','','0','0','0'),(150,'PO201310005','1/2下摆/밑단  弯量','','','','0','0','0'),(151,'PO201310005','夹圈','','','','0','0','0'),(152,'PO201310005','','','','','0','0','0'),(153,'PO201310005','','','','','0','0','0'),(154,'PO201310005','','','','','0','0','0'),(155,'PO201310005','','','','','0','0','0'),(156,'PO201310005','','','','','0','0','0'),(157,'PO201310005','','','','','0','0','0');
/*!40000 ALTER TABLE `order_sheet_size` ENABLE KEYS */;
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
INSERT INTO `po_comments` VALUES (6,'PO201310001','트웬티원 오더임\r\n\r\n홍콜달러로 잘못 기장되어 US달러로 바꿈',NULL,'2000','2013-05-17',NULL,NULL),(7,'PO201310001','브랜드명 잘못 기장하여 피오 업데이트함\r\n\r\n홍콜달러로 잘못 기장되어 US달러로 바꿈\r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. ',NULL,'2000','2013-05-17',NULL,NULL),(8,'PO201310001','브랜드명 잘못 기장하여 피오 업데이트함\r\n\r\n홍콜달러로 잘못 기장되어 US달러로 바꿈\r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. ',NULL,'2000','2013-05-17',NULL,NULL),(9,'PO201310001','브랜드명 잘못 기장하여 피오 업데이트함\r\n\r\n홍콜달러로 잘못 기장되어 US달러로 바꿈\r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. ',NULL,'2000','2013-05-17',NULL,NULL);
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
  `ORDER_STATUS` varchar(3) default NULL,
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
  `has_order_sheet` int(1) default NULL,
  `has_rm_po` int(1) default NULL,
  PRIMARY KEY  (`ORDER_NO`,`STYLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
INSERT INTO `purchase_order` VALUES ('PO201310001','N','ST2552','SUMMER','WSHT','1','10','1',NULL,NULL,'WOVEN SHIRTS','001',NULL,10.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,51.0000,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-31',NULL,'FOB','SEA','2013-05-17',NULL,NULL,'999','USD',NULL,NULL,'2000','AGACY',NULL,'b1000','S1001','P1001','2013-06-27','2013-05-31',NULL,'2013-05-17','JaeHwan','SEBIN','test man','브랜드명 잘못 기장하여 피오 업데이트함\r\n\r\n홍콜달러로 잘못 기장되어 US달러로 바꿈\r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. ',732,'2013-06-13','2000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310002','N','DDF','AUTUMN','WTOP','1','10','2',NULL,NULL,'fdsa','',NULL,60.0000,'b','s','c','','','',NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,NULL,NULL,NULL,'2013-06-07','0000-00-00','FOB','SEA','2013-06-25','0000-00-00','0000-00-00','45','CNY',NULL,NULL,'2000','aas',NULL,'b1000','S1001','P1001','2013-06-29','2013-06-07',NULL,'2013-06-25','JaeHwan','SEBIN','test man','fda',286,'2013-06-29','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,'2013-06-28','B1000',NULL,NULL,NULL,NULL,1,1),('PO201310003','N','DDF','SPRING','WTOP','1','10','2',NULL,NULL,'dd','',NULL,2.0000,'s','m','l','','','',NULL,NULL,NULL,NULL,1.0000,NULL,NULL,NULL,NULL,NULL,NULL,'2013-06-07','0000-00-00','FOB','SHIP','2013-06-28','0000-00-00','0000-00-00','40','HKD',NULL,NULL,'2000','',NULL,'b1000','S1001','P1001','2013-06-28','2013-06-07',NULL,'2013-06-28','JaeHwan','SEBIN','test man','ff',332,'2013-06-29','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1),('PO201310004','N','FFFFF','SPRING','WTOP','1','10','4',NULL,NULL,'test','',NULL,3.0000,'s','m','l','','','',NULL,NULL,NULL,NULL,3.0000,NULL,NULL,NULL,NULL,NULL,NULL,'2013-06-04','0000-00-00','FOB','SHIP','2013-06-28','0000-00-00','0000-00-00','40','HKD',NULL,NULL,'2000','',NULL,'b1000','S1001','P1001','2013-06-28','2013-06-04',NULL,'2013-06-28','JaeHwan','SEBIN','test man','test',1350,'2013-06-29','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1),('PO201310005','N','SD9999','SPRING','WDRS','1','10','X',NULL,' ','SD9999','',NULL,45.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,40.0000,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','2013-06-02','FOB','AIR','2013-06-29','0000-00-00','0000-00-00','45','CNY',NULL,NULL,'B1000','',NULL,'b1000','S1001','P1001','2013-06-29','2013-06-03','2013-06-29','2013-06-29','JaeHwan','SEBIN','test man','SD9999\r\n\r\nnew ',33,'2013-06-29','2000',NULL,NULL,'2013-06-01','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','2013-06-07','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,'2013-06-29','B1000',NULL,NULL,NULL,NULL,1,1);
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
  `ORDER_STATUS` varchar(3) default NULL,
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
INSERT INTO `purchase_order_history` VALUES ('PO201210001','N','1135A','SPRING','WTOP','1','10','0',NULL,NULL,'dress','',NULL,6.0000,'s','m','l','','','',NULL,NULL,NULL,NULL,30.00,NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-31',NULL,'FOB','SEA','2012-04-06',NULL,NULL,'40','USD',NULL,NULL,'2000','M&D',NULL,'B1001','S1001','P1003','2012-04-06','2012-05-31',NULL,'2012-04-06','HOT & Delicious ','SEBIN DESIGN Co,Ltd','TAI HE','임시용입니다. 테스트용 \r\n\r\n칼라 애드 orange',600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210001','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'55',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2012-06-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210001','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'75',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2012-06-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210003','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'55',NULL,NULL,NULL,'B9999',NULL,NULL,NULL,NULL,NULL,'2012-06-19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210003','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'80',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2012-06-28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210005','N','SD2000','SPRING','WTOP','1','10','0',NULL,NULL,'dress',NULL,NULL,4.0000,'s','m','L','XL','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-07-31',NULL,'FOB','SEA','2012-07-24',NULL,NULL,'40','HKD',NULL,NULL,'B0326','hot & delicious',NULL,'B0326','S1001',NULL,'2012-07-24','2012-07-31',NULL,'2012-07-24','Hikaru','SEBIN DESIGN Co,Ltd',NULL,'this is new sample\r\n',170,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210005','N','SD2000','SPRING','WTOP','1','10','0',NULL,NULL,'dress','',NULL,5.0000,'s','m','L','XL','','',NULL,NULL,NULL,NULL,15.00,NULL,NULL,NULL,NULL,NULL,NULL,'2012-07-31',NULL,'FOB','SEA','2012-07-24',NULL,NULL,'40','HKD',NULL,NULL,'2000','hot & delicious',NULL,'B0326','S1001','P1001','2012-07-24','2012-07-31',NULL,'2012-07-24','Hikaru','SEBIN DESIGN Co,Ltd','Local Contractor','this is new sample\r\n',170,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210005','N','SD2000','SPRING','WTOP','1','10','0',NULL,NULL,'dress',NULL,NULL,5.0000,'s','m','L','XL','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-07-31',NULL,'FOB','SEA','2012-07-24',NULL,NULL,'40','HKD',NULL,NULL,'B0326','hot & delicious',NULL,'B0326','S1001',NULL,'2012-07-24','2012-07-31',NULL,'2012-07-24','Hikaru','SEBIN DESIGN Co,Ltd',NULL,'this is new sample\r\n\r\n\r\ncan you make it 4doller',170,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210005','N','SD2000','SPRING','WTOP','1','10','0',NULL,NULL,'dress',NULL,NULL,5.0000,'s','m','L','XL','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-07-31',NULL,'FOB','SEA','2012-07-24',NULL,NULL,'40','HKD',NULL,NULL,'B0326','hot & delicious',NULL,'B0326','S1001',NULL,'2012-08-03','2012-07-31',NULL,'2012-08-03','Hikaru','SEBIN DESIGN Co,Ltd',NULL,'this is new sample\r\n\r\n\r\ncan you make it 4doller',170,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210004','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'73',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2012-08-14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210006','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'73',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2012-08-19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N','1234','SPRING','WTOP','1','10','1',NULL,NULL,'test Create Pre-Purchase Order','',NULL,5.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,5.00,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',NULL,'CMT','SEA','2013-04-17',NULL,NULL,'40','USD',NULL,NULL,'2000','',NULL,'B1000','S1001','P1017','2013-04-17','0000-00-00',NULL,'2013-04-17','test','SEBIN DESIGN Co,Ltd','TEST','',129,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N','TEST1','SPRING','WTOP','1','10','1',NULL,NULL,'test Create Pre-Purchase Order','',NULL,5.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,5.00,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',NULL,'CMT','SEA','2013-04-17',NULL,NULL,'40','USD',NULL,NULL,'2000','',NULL,'B1000','S1001','P1017','2013-04-17','0000-00-00',NULL,'2013-04-17','test','SEBIN DESIGN Co,Ltd','TEST','',129,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'45',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2013-04-17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'50',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2013-04-17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N','TEST1','SPRING','WTOP','1','10','1',NULL,NULL,'test Create Pre-Purchase Order','',NULL,5.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,6.00,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',NULL,'FOB','SEA','2013-04-17',NULL,NULL,'50','USD',NULL,NULL,'2000','',NULL,'B1000','S1001','P1017','2013-04-17','0000-00-00',NULL,'2013-04-17','test','SEBIN DESIGN Co,Ltd','TEST','',129,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-17','2000'),('PO201310001','N','TEST1','SPRING','WTOP','1','10','1',NULL,NULL,'test Create Pre-Purchase Order','',NULL,5.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,6.00,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',NULL,'FOB','SEA','2013-04-17',NULL,NULL,'40','USD',NULL,NULL,'2000','',NULL,'B1000','S1001','P1017','2013-04-17','0000-00-00',NULL,'2013-04-17','test','SEBIN DESIGN Co,Ltd','TEST','test 1 from us',129,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N','BBAB','SPRING','WTOP','1','10','1',NULL,NULL,'test Create Pre-Purchase Order','',NULL,5.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,6.00,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',NULL,'FOB','SEA','2013-04-17',NULL,NULL,'40','USD',NULL,NULL,'2000','',NULL,'B1000','S1001','P1017','2013-04-20','0000-00-00',NULL,'2013-04-20','test','SEBIN DESIGN Co,Ltd','TEST','test 1 from us',129,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310002','N','TEST2','SPRING','WTOP','1','10','1',NULL,NULL,'test item text','test task number',NULL,1.0000,'S','M','L','XL','','',NULL,NULL,NULL,NULL,90.00,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-02',NULL,'FOB','AIR','2013-04-20',NULL,NULL,'40','HKD',NULL,NULL,'2000','test brand',NULL,'B1000','S1001','P1017','2013-04-20','2013-04-02',NULL,'2013-04-20','test','SEBIN DESIGN Co,Ltd','TEST','test comments in create pre-purchase order',24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310002','N','TEST2','SPRING','WTOP','1','10','1',NULL,NULL,'test item text','test task number',NULL,2.0000,'S','M','L','XL','','',NULL,NULL,NULL,NULL,90.00,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-02',NULL,'FOB','AIR','2013-04-20',NULL,NULL,'40','HKD',NULL,NULL,'2000','test brand',NULL,'B1000','S1001','P1017','2013-04-20','2013-04-02',NULL,'2013-04-20','test','SEBIN DESIGN Co,Ltd','TEST','test comments in create pre-purchase order',24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310003','N','TEST4','SPRING','WTOP','1','10','1',NULL,NULL,'test item text','',NULL,2.0000,'s','c','d','','','',NULL,NULL,NULL,NULL,1.00,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',NULL,'FOB','SEA','2013-04-20',NULL,NULL,'40','HKD',NULL,NULL,'2000','',NULL,'B1000','S1001','P1017','2013-04-22','0000-00-00',NULL,'2013-04-22','test','SEBIN DESIGN Co,Ltd','TEST','test',31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310004','N',' TEST5','SPRING','WTOP','1','10','1',NULL,NULL,'TEST 5','',NULL,4.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,2.00,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-17',NULL,'FOB','SEA','2013-04-22',NULL,NULL,'40','HKD',NULL,NULL,'2000','',NULL,'B1000','S1001','P1001','2013-04-22','2013-04-17',NULL,'2013-04-22','test','SEBIN DESIGN Co,Ltd','Local Contractor','TEST 5',48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310004','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'45',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2013-04-22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310002','N','TEST2','AUTUMN','WTOP','1','10','1',NULL,NULL,'test item text','test task number',NULL,2.0000,'S','M','L','XL','','',NULL,NULL,NULL,NULL,100.00,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-02',NULL,'FOB','AIR','2013-04-20',NULL,NULL,'45','HKD',NULL,NULL,'2000','test brand',NULL,'B1000','S1001','P1017','2013-04-22','2013-04-02',NULL,'2013-04-22','test','SEBIN DESIGN Co,Ltd','TEST','test comments in create pre-purchase order',24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-22','2000'),('PO201310007','N','S0435','SPRING','WTOP','1','10','first',NULL,NULL,'ITEM TEXT 111',NULL,NULL,12.0000,'xs','s','m','l','xl','xxl',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-16',NULL,'CMT','AIR','2013-05-04',NULL,NULL,'40','HKD',NULL,NULL,'B1007','HND',NULL,'B1007','S1001',NULL,'2013-05-04','2013-05-16',NULL,'2013-05-04','jaehwan','SEBIN DESIGN Co,Ltd',NULL,'ITEM TEXT 111',252,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310004','N',' TEST5','SUMMER','WTOP','1','10','1',NULL,NULL,'TEST 5rrrr','',NULL,4.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,2.00,NULL,NULL,NULL,NULL,NULL,NULL,'2013-04-17',NULL,'FOB','SEA','2013-04-22',NULL,NULL,'40','HKD',NULL,NULL,'2000','',NULL,'B0326','S1001','P1006','2013-05-04','2013-04-17',NULL,'2013-05-04','Hikaru','SEBIN DESIGN Co,Ltd','XIN JIN YANG','TEST 5ee',48,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310007','N','S0435','SPRING','WSHT','1','10','first',NULL,NULL,'ITEM TEXT 111222',NULL,NULL,12.0000,'xs','s','m','l','xl','xxl',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-16',NULL,'FOB','AIR','2013-05-04',NULL,NULL,'40','HKD',NULL,NULL,'B1007','HND',NULL,'B1007','S1001',NULL,'2013-05-04','2013-05-16',NULL,'2013-05-04','jaehwan','SEBIN DESIGN Co,Ltd',NULL,'ITEM TEXT 111222',291,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310007','N','SSSSSSSSS0435','SPRING','WSHT','1','10','first',NULL,NULL,'ITEM TEXT 111222 III iii',NULL,NULL,12.0000,'xs','S','m','l','xl','xxl',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-16',NULL,'FOB','AIR','2013-05-04',NULL,NULL,'40','HKD',NULL,NULL,'B1007','HND',NULL,'B1007','S1001',NULL,'2013-05-04','2013-05-16',NULL,'2013-05-04','jaehwan','SEBIN DESIGN Co,Ltd',NULL,'ITEM TEXT 111222',291,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310007','N','SSSSSSSSS0435','SPRING','WSHT','1','10','first',NULL,NULL,'ITEM TEXT 111222 III iii',NULL,NULL,12.0000,'xs','S','m','l','xl','xxl',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-16',NULL,'FOB','AIR','2013-05-04',NULL,NULL,'40','HKD',NULL,NULL,'B1007','HND',NULL,'B1007','S1001',NULL,'2013-05-04','2013-05-16',NULL,'2013-05-04','jaehwan','SEBIN DESIGN Co,Ltd',NULL,'테스트 페이지',291,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310007','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'55',NULL,NULL,NULL,'B1007',NULL,NULL,NULL,NULL,NULL,'2013-05-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310007','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'85',NULL,NULL,NULL,'B1007',NULL,NULL,NULL,NULL,NULL,'2013-05-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310002','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'80',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2013-05-14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'999',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2013-05-14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N','ST2552','SUMMER','WSHT','1','10','1',NULL,NULL,'WOVEN SHIRTS',NULL,NULL,10.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-31',NULL,'FOB','SEA','2013-05-17',NULL,NULL,'40','USD',NULL,NULL,'B1000','F21',NULL,'b1000','S1001',NULL,'2013-05-17','2013-05-31',NULL,'2013-05-17','JaeHwan','SEBIN',NULL,'트웬티원 오더임',600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N','ST2552','SUMMER','WSHT','1','10','1',NULL,NULL,'WOVEN SHIRTS','001',NULL,10.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,51.00,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-31',NULL,'FOB','SEA','2013-05-17',NULL,NULL,'40','USD',NULL,NULL,'2000','UM',NULL,'b1000','S1001','P1001','2013-05-17','2013-05-31',NULL,'2013-05-17','JaeHwan','SEBIN','test man','브랜드명 잘못 기장하여 피오 업데이트함\r\n\r\n홍콜달러로 잘못 기장되어 US달러로 바꿈',600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N','ST2552','SUMMER','WSHT','1','10','1',NULL,NULL,'WOVEN SHIRTS',NULL,NULL,10.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-31',NULL,'FOB','SEA','2013-05-17',NULL,NULL,'40','USD',NULL,NULL,'B1000','AGACY',NULL,'b1000','S1001',NULL,'2013-05-17','2013-05-31',NULL,'2013-05-17','JaeHwan','SEBIN',NULL,'브랜드명 잘못 기장하여 피오 업데이트함\r\n\r\n홍콜달러로 잘못 기장되어 US달러로 바꿈\r\n\r\n브랜드명 아가씨로 수정했습니다. ',600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N','ST2552','SUMMER','WSHT','1','10','1',NULL,NULL,'WOVEN SHIRTS','001',NULL,10.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,51.00,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-31',NULL,'FOB','SEA','2013-05-17',NULL,NULL,'40','USD',NULL,NULL,'2000','AGACY',NULL,'b1000','S1001','P1001','2013-05-17','2013-05-31',NULL,'2013-05-17','JaeHwan','SEBIN','test man','브랜드명 잘못 기장하여 피오 업데이트함\r\n\r\n홍콜달러로 잘못 기장되어 US달러로 바꿈\r\n\r\n브랜드명 아가씨로 수정했습니다. ',600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N','ST2552','SUMMER','WSHT','1','10','1',NULL,NULL,'WOVEN SHIRTS','001',NULL,10.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,51.00,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-31',NULL,'FOB','SEA','2013-05-17',NULL,NULL,'40','USD',NULL,NULL,'2000','AGACY',NULL,'b1000','S1001','P1001','2013-05-17','2013-05-31',NULL,'2013-05-17','JaeHwan','SEBIN','test man','브랜드명 잘못 기장하여 피오 업데이트함\r\n\r\n홍콜달러로 잘못 기장되어 US달러로 바꿈\r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. ',600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N','ST2552','SUMMER','WSHT','1','10','1',NULL,NULL,'WOVEN SHIRTS','001',NULL,10.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,51.00,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-31',NULL,'FOB','SEA','2013-05-17',NULL,NULL,'40','USD',NULL,NULL,'2000','AGACY',NULL,'b1000','S1001','P1001','2013-05-17','2013-05-31',NULL,'2013-05-17','JaeHwan','SEBIN','test man','브랜드명 잘못 기장하여 피오 업데이트함\r\n\r\n홍콜달러로 잘못 기장되어 US달러로 바꿈\r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. ',600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'999',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2013-06-13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310002','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'45',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2013-06-25',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310001','N','ST2552','SUMMER','WSHT','1','10','1',NULL,NULL,'WOVEN SHIRTS','001',NULL,10.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,51.00,NULL,NULL,NULL,NULL,NULL,NULL,'2013-05-31',NULL,'FOB','SEA','2013-05-17',NULL,NULL,'40','USD',NULL,NULL,'2000','AGACY',NULL,'b1000','S1001','P1001','2013-06-27','2013-05-31',NULL,'2013-06-27','JaeHwan','SEBIN','test man','브랜드명 잘못 기장하여 피오 업데이트함\r\n\r\n홍콜달러로 잘못 기장되어 US달러로 바꿈\r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. \r\n\r\n브랜드명 아가씨로 수정했습니다. ',732,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310002','N','DDF','SPRING','WBLS','1','10','2',NULL,NULL,'fdsa',NULL,NULL,3.0000,'b','s','c','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-06-07',NULL,'FOB','SEA','2013-06-25',NULL,NULL,'45','HKD',NULL,NULL,'B1000','aas',NULL,'b1000','S1001',NULL,'2013-06-28','2013-06-07',NULL,'2013-06-28','JaeHwan','SEBIN',NULL,'fda',77,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-06-28','B1000'),('PO201310002','N','DDF','AUTUMN','WTOP','1','10','2',NULL,NULL,'fdsa',NULL,NULL,3.0000,'b','s','c','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-06-07',NULL,'FOB','SEA','2013-06-25',NULL,NULL,'45','HKD',NULL,NULL,'B1000','aas',NULL,'b1000','S1001',NULL,'2013-06-28','2013-06-07',NULL,'2013-06-28','JaeHwan','SEBIN',NULL,'fda',286,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-06-28','B1000'),('PO201310002','N','DDF','AUTUMN','WTOP','1','10','2',NULL,NULL,'fdsa','',NULL,60.0000,'b','s','c','','','',NULL,NULL,NULL,NULL,3.00,NULL,NULL,NULL,NULL,NULL,NULL,'2013-06-07',NULL,'FOB','SEA','2013-06-25',NULL,NULL,'40','CNY',NULL,NULL,'2000','aas',NULL,'b1000','S1001','P1001','2013-06-29','2013-06-07',NULL,'2013-06-29','JaeHwan','SEBIN','test man','fda',286,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201310005','N','SD9999','SPRING','WDRS','1','10','X',NULL,NULL,'SD9999',NULL,NULL,45.0000,'S','M','L','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',NULL,'FOB','AIR','2013-06-29',NULL,NULL,'45','CNY',NULL,NULL,'B1000','',NULL,'b1000','S1001',NULL,'2013-06-29','0000-00-00',NULL,'2013-06-29','JaeHwan','SEBIN',NULL,'SD9999\r\n\r\nnew ',33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2013-06-29','B1000');
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
INSERT INTO `purchase_order_line` VALUES ('PO201310001','N','Black',NULL,132,12,65,55,0,0,0,NULL,NULL,NULL,NULL),('PO201310001','N','OLIVE',NULL,600,100,100,100,0,0,0,NULL,NULL,NULL,NULL),('PO201310002','N','d',NULL,49,21,51,42,0,0,0,NULL,NULL,NULL,NULL),('PO201310002','N','f',NULL,12,3,4,5,0,0,0,NULL,NULL,NULL,NULL),('PO201310002','N','s',NULL,225,11,211,3,0,0,0,NULL,NULL,NULL,NULL),('PO201310003','N','Black',NULL,110,1,64,45,0,0,0,NULL,NULL,NULL,NULL),('PO201310003','N','Gray',NULL,219,47,87,85,0,0,0,NULL,NULL,NULL,NULL),('PO201310003','N','JeHwan',NULL,3,1,1,1,0,0,0,NULL,NULL,NULL,NULL),('PO201310004','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL),('PO201310004','N','Gold',NULL,450,150,150,150,0,0,0,NULL,NULL,NULL,NULL),('PO201310004','N','Gray',NULL,600,200,200,200,0,0,0,NULL,NULL,NULL,NULL),('PO201310005','N','RED',NULL,33,11,11,11,0,0,0,NULL,NULL,NULL,NULL);
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
INSERT INTO `purchase_order_line_history` VALUES ('PO201110000','N','IVORY',NULL,300,75,75,75,75,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:13:55',NULL),('PO201110000','N','ANTIQUE',NULL,200,50,50,50,50,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:13:55',NULL),('PO201110000','N','MOONLIGHT',NULL,200,50,50,50,50,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:13:55',NULL),('PO201110000','N','BLANCO',NULL,300,75,75,75,75,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:13:55',NULL),('PO201110000','N','ANTIQUE',NULL,200,50,50,50,50,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:16:48',NULL),('PO201110000','N','BLANCO',NULL,300,75,75,75,75,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:16:48',NULL),('PO201110000','N','IVORY',NULL,300,75,75,75,75,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:16:48',NULL),('PO201110000','N','MOONLIGHT',NULL,200,50,50,50,50,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:16:48',NULL),('PO201110001','N','IVORY',NULL,300,75,75,75,75,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:20:48',NULL),('PO201110001','N','ANTIQUE',NULL,200,50,50,50,50,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:20:48',NULL),('PO201110001','N','MOONLIGHT',NULL,200,50,50,50,50,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:20:48',NULL),('PO201110001','N','BLANCO',NULL,300,75,75,75,75,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:20:48',NULL),('PO201110002','N','Brown #4',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-08-24 10:18:23',NULL),('PO201110002','N','Teal #25',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-08-24 10:18:23',NULL),('PO201110002','N','Brown #4',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-08-24 10:24:47',NULL),('PO201110002','N','Teal #25',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-08-24 10:24:47',NULL),('PO201110003','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 12:52:45',NULL),('PO201110003','N','Silver',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 12:52:45',NULL),('PO201110003','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 12:54:45',NULL),('PO201110003','N','Silver',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 12:54:45',NULL),('PO201110003','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 13:09:57',NULL),('PO201110003','N','Silver',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 13:09:57',NULL),('PO201110003','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 13:10:28',NULL),('PO201110003','N','Silver',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 13:10:28',NULL),('PO201110000','N','Black',NULL,126,42,42,42,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 14:55:21',NULL),('PO201110000','N','Grey',NULL,120,40,40,40,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 14:55:21',NULL),('PO201110000','N','Gold',NULL,126,42,42,42,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 14:55:21',NULL),('PO201110001','N','Ivory',NULL,342,112,112,118,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:20:37',NULL),('PO201110001','N','Ivory[Mix&Match',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:20:37',NULL),('PO201110001','N','Black',NULL,450,150,150,150,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:20:37',NULL),('PO201110002','N','Black',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:42:31',NULL),('PO201110002','N','Silver',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:42:31',NULL),('PO201110002','N','Gold',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:42:31',NULL),('PO201110003','N','Black',NULL,180,90,60,30,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:45:10',NULL),('PO201110003','N','Silver',NULL,180,90,60,30,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:45:10',NULL),('PO201110004','N','Red',NULL,252,82,82,88,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:59:57',NULL),('PO201110004','N','Cocoa',NULL,252,82,82,88,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:59:57',NULL),('PO201110004','N','Red[Mix&Match]',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:59:57',NULL),('PO201110004','N','Cocoa[Mix&Match',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:59:57',NULL),('PO201110005','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 16:08:24',NULL),('PO201110005','N','Silver',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 16:08:24',NULL),('PO201110005','N','Antique Gold',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 16:08:24',NULL),('PO201110006','N','Orange/Green',NULL,285,95,95,95,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 16:13:49',NULL),('PO201110006','N','Pink/Blue',NULL,285,95,95,95,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 16:13:49',NULL),('PO201110007','N','BLUE',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 18:01:30',NULL),('PO201110007','N','BLACK',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 18:01:30',NULL),('PO201110007','N','WHITE',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 18:01:30',NULL),('PO201210001','N','black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2012-04-06 20:26:43',NULL),('PO201210001','N','black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2012-04-06 20:36:38',NULL),('PO201210001','N','orange',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2012-04-06 20:36:38',NULL),('PO201210002','N','Black',NULL,20,10,10,0,0,0,0,NULL,NULL,NULL,NULL,'2012-06-01 09:39:15',NULL),('PO201210003','N','A',NULL,6,1,3,2,0,0,0,NULL,NULL,NULL,NULL,'2012-06-02 14:48:50',NULL),('PO201210003','N','A',NULL,6,1,3,2,0,0,0,NULL,NULL,NULL,NULL,'2012-06-02 14:49:30',NULL),('PO201210003','N','b',NULL,6,3,3,0,0,0,0,NULL,NULL,NULL,NULL,'2012-06-11 10:52:22',NULL),('PO201210004','N','4',NULL,3,3,0,0,0,0,0,NULL,NULL,NULL,NULL,'2012-06-28 22:12:02',NULL),('PO201210005','N','red',NULL,15,5,10,0,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:36:13',NULL),('PO201210005','N','red',NULL,15,5,10,0,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:43:12',NULL),('PO201210005','N','Blue',NULL,155,55,50,50,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:43:12',NULL),('PO201210005','N','Blue',NULL,155,55,50,50,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:44:48',NULL),('PO201210005','N','red',NULL,15,5,10,0,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:44:48',NULL),('PO201210005','N','Blue',NULL,155,55,50,50,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:46:21',NULL),('PO201210005','N','red',NULL,15,5,10,0,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:46:21',NULL),('PO201210005','N','Blue',NULL,155,55,50,50,0,0,0,NULL,NULL,NULL,NULL,'2012-08-03 21:21:11',NULL),('PO201210005','N','red',NULL,15,5,10,0,0,0,0,NULL,NULL,NULL,NULL,'2012-08-03 21:21:11',NULL),('PO201210006','N','blue',NULL,300,100,200,0,0,0,0,NULL,NULL,NULL,NULL,'2012-08-19 14:03:53',NULL),('PO201310001','N','Black',NULL,120,40,30,50,0,0,0,NULL,NULL,NULL,NULL,'2013-04-17 19:10:14',NULL),('PO201310001','N','White',NULL,9,4,2,3,0,0,0,NULL,NULL,NULL,NULL,'2013-04-17 19:10:14',NULL),('PO201310001','N','Black',NULL,120,40,30,50,0,0,0,NULL,NULL,NULL,NULL,'2013-04-17 19:14:03',NULL),('PO201310001','N','White',NULL,9,4,2,3,0,0,0,NULL,NULL,NULL,NULL,'2013-04-17 19:14:03',NULL),('PO201310001','N','Black',NULL,120,40,30,50,0,0,0,NULL,NULL,NULL,NULL,'2013-04-17 19:14:38',NULL),('PO201310001','N','White',NULL,9,4,2,3,0,0,0,NULL,NULL,NULL,NULL,'2013-04-17 19:14:38',NULL),('PO201310001','N','Black',NULL,120,40,30,50,0,0,0,NULL,NULL,NULL,NULL,NULL,'2013-04-17 19:27:31'),('PO201310001','N','White',NULL,9,4,2,3,0,0,0,NULL,NULL,NULL,NULL,NULL,'2013-04-17 19:27:31'),('PO201310001','N','Black',NULL,120,40,30,50,0,0,0,NULL,NULL,NULL,NULL,'2013-04-17 19:29:28',NULL),('PO201310001','N','White',NULL,9,4,2,3,0,0,0,NULL,NULL,NULL,NULL,'2013-04-17 19:29:28',NULL),('PO201310002','N','White',NULL,10,1,2,3,4,0,0,NULL,NULL,NULL,NULL,'2013-04-20 12:17:08',NULL),('PO201310002','N','Black',NULL,14,5,2,4,3,0,0,NULL,NULL,NULL,NULL,'2013-04-20 12:17:08',NULL),('PO201310001','N','Black',NULL,120,40,30,50,0,0,0,NULL,NULL,NULL,NULL,'2013-04-20 15:08:57',NULL),('PO201310001','N','White',NULL,9,4,2,3,0,0,0,NULL,NULL,NULL,NULL,'2013-04-20 15:08:57',NULL),('PO201310002','N','Black',NULL,14,5,2,4,3,0,0,NULL,NULL,NULL,NULL,'2013-04-20 17:48:42',NULL),('PO201310002','N','White',NULL,10,1,2,3,4,0,0,NULL,NULL,NULL,NULL,'2013-04-20 17:48:42',NULL),('PO201310002','N','Black',NULL,14,5,2,4,3,0,0,NULL,NULL,NULL,NULL,'2013-04-20 17:51:00',NULL),('PO201310002','N','White',NULL,10,1,2,3,4,0,0,NULL,NULL,NULL,NULL,'2013-04-20 17:51:00',NULL),('PO201310003','N','test 1',NULL,24,1,20,3,0,0,0,NULL,NULL,NULL,NULL,'2013-04-20 17:56:25',NULL),('PO201310003','N','test 2',NULL,7,1,2,4,0,0,0,NULL,NULL,NULL,NULL,'2013-04-20 17:56:25',NULL),('PO201310003','N','test 1',NULL,24,1,20,3,0,0,0,NULL,NULL,NULL,NULL,'2013-04-22 12:02:07',NULL),('PO201310003','N','test 2',NULL,7,1,2,4,0,0,0,NULL,NULL,NULL,NULL,'2013-04-22 12:02:07',NULL),('PO201310004','N','W',NULL,10,1,4,5,0,0,0,NULL,NULL,NULL,NULL,'2013-04-22 12:35:36',NULL),('PO201310004','N','B',NULL,38,2,30,6,0,0,0,NULL,NULL,NULL,NULL,'2013-04-22 12:35:36',NULL),('PO201310004','N','B',NULL,38,2,30,6,0,0,0,NULL,NULL,NULL,NULL,'2013-04-22 12:37:11',NULL),('PO201310004','N','W',NULL,10,1,4,5,0,0,0,NULL,NULL,NULL,NULL,'2013-04-22 12:37:11',NULL),('PO201310005','N','w',NULL,11,5,4,2,0,0,0,NULL,NULL,NULL,NULL,'2013-04-22 17:09:13',NULL),('PO201310005','N','b',NULL,9,3,5,1,0,0,0,NULL,NULL,NULL,NULL,'2013-04-22 17:09:13',NULL),('PO201310002','N','Black',NULL,14,5,2,4,3,0,0,NULL,NULL,NULL,NULL,NULL,'2013-04-22 18:53:51'),('PO201310002','N','White',NULL,10,1,2,3,4,0,0,NULL,NULL,NULL,NULL,NULL,'2013-04-22 18:53:51'),('PO201310006','N','Bai',NULL,6,1,3,2,0,0,0,NULL,NULL,NULL,NULL,'2013-05-02 13:15:26',NULL),('PO201310006','N','B',NULL,7,4,2,1,0,0,0,NULL,NULL,NULL,NULL,'2013-05-02 13:15:26',NULL),('PO201310007','N','W',NULL,68,1,3,4,55,5,0,NULL,NULL,NULL,NULL,'2013-05-04 13:00:52',NULL),('PO201310007','N','B',NULL,85,5,66,12,0,1,1,NULL,NULL,NULL,NULL,'2013-05-04 13:00:52',NULL),('PO201310007','N','B',NULL,85,4,66,12,0,1,1,NULL,NULL,NULL,NULL,'2013-05-04 13:11:51',NULL),('PO201310007','N','W',NULL,167,13,33,4,55,51,11,NULL,NULL,NULL,NULL,'2013-05-04 13:11:51',NULL),('PO201310004','N','B',NULL,38,2,30,6,0,0,0,NULL,NULL,NULL,NULL,'2013-05-04 16:02:08',NULL),('PO201310004','N','W',NULL,10,1,4,5,0,0,0,NULL,NULL,NULL,NULL,'2013-05-04 16:02:08',NULL),('PO201310007','N','B',NULL,85,4,66,123,0,1,1,NULL,NULL,NULL,NULL,'2013-05-04 16:15:17',NULL),('PO201310007','N','W',NULL,206,13,33,43,55,51,11,NULL,NULL,NULL,NULL,'2013-05-04 16:15:17',NULL),('PO201310007','N','B',NULL,85,4,66,123,0,1,1,NULL,NULL,NULL,NULL,'2013-05-04 16:38:16',NULL),('PO201310007','N','W',NULL,206,13,33,43,55,51,11,NULL,NULL,NULL,NULL,'2013-05-04 16:38:16',NULL),('PO201310007','N','B',NULL,85,4,66,123,0,1,1,NULL,NULL,NULL,NULL,'2013-05-04 16:48:40',NULL),('PO201310007','N','W',NULL,206,13,33,43,55,51,11,NULL,NULL,NULL,NULL,'2013-05-04 16:48:40',NULL),('PO201310000','N','d',NULL,5,1,3,1,0,0,0,NULL,NULL,NULL,NULL,'2013-05-11 16:30:22',NULL),('PO201310000','N','f',NULL,8,2,4,2,0,0,0,NULL,NULL,NULL,NULL,'2013-05-11 16:30:22',NULL),('PO201310000','N','d',NULL,5,11,3,1,1,1,2,NULL,NULL,NULL,NULL,'2013-05-11 16:35:26',NULL),('PO201310000','N','f',NULL,87,21,41,21,0,1,3,NULL,NULL,NULL,NULL,'2013-05-11 16:35:26',NULL),('PO201310000','N','d',NULL,5,11,3,1,1,1,2,NULL,NULL,NULL,NULL,'2013-05-14 17:45:48',NULL),('PO201310000','N','f',NULL,87,21,41,21,0,1,3,NULL,NULL,NULL,NULL,'2013-05-14 17:45:48',NULL),('PO201310001','N','w',NULL,6,1,3,2,0,0,0,NULL,NULL,NULL,NULL,'2013-05-14 19:48:26',NULL),('PO201310001','N','e',NULL,9,2,4,3,0,0,0,NULL,NULL,NULL,NULL,'2013-05-14 19:48:26',NULL),('PO201310002','N','w',NULL,8,1,3,4,0,0,0,NULL,NULL,NULL,NULL,'2013-05-14 19:49:07',NULL),('PO201310002','N','d',NULL,10,2,4,4,0,0,0,NULL,NULL,NULL,NULL,'2013-05-14 19:49:07',NULL),('PO201310003','N','s',NULL,11,2,4,5,0,0,0,NULL,NULL,NULL,NULL,'2013-05-14 19:49:36',NULL),('PO201310003','N','d',NULL,13,3,5,5,0,0,0,NULL,NULL,NULL,NULL,'2013-05-14 19:49:36',NULL),('PO201310000','N','WHITE',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2013-05-17 18:06:19',NULL),('PO201310000','N','BLACK',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2013-05-17 18:06:19',NULL),('PO201310001','N','OLIVE',NULL,600,200,200,200,0,0,0,NULL,NULL,NULL,NULL,'2013-05-17 18:35:07',NULL),('PO201310001','N','OLIVE',NULL,600,200,200,200,0,0,0,NULL,NULL,NULL,NULL,'2013-05-17 18:50:57',NULL),('PO201310001','N','OLIVE',NULL,600,200,200,200,0,0,0,NULL,NULL,NULL,NULL,'2013-05-17 18:58:54',NULL),('PO201310001','N','OLIVE',NULL,600,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2013-05-17 19:01:45',NULL),('PO201310001','N','OLIVE',NULL,600,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2013-05-17 19:03:32',NULL),('PO201310001','N','OLIVE',NULL,600,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2013-05-17 19:03:59',NULL),('PO201310001','N','OLIVE',NULL,600,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2013-05-17 19:07:08',NULL),('PO201310002','N','s',NULL,6,1,2,3,0,0,0,NULL,NULL,NULL,NULL,'2013-06-25 13:20:05',NULL),('PO201310002','N','d',NULL,49,2,5,42,0,0,0,NULL,NULL,NULL,NULL,'2013-06-25 13:20:05',NULL),('PO201310002','N','f',NULL,12,3,4,5,0,0,0,NULL,NULL,NULL,NULL,'2013-06-25 13:20:05',NULL),('PO201310001','N','OLIVE',NULL,600,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2013-06-27 19:31:54',NULL),('PO201310001','N','Black',NULL,132,12,65,55,0,0,0,NULL,NULL,NULL,NULL,'2013-06-27 19:31:54',NULL),('PO201310003','N','Black',NULL,110,1,64,45,0,0,0,NULL,NULL,NULL,NULL,'2013-06-28 09:53:22',NULL),('PO201310003','N','Gray',NULL,219,47,87,85,0,0,0,NULL,NULL,NULL,NULL,'2013-06-28 09:53:22',NULL),('PO201310003','N','JeHwan',NULL,3,1,1,1,0,0,0,NULL,NULL,NULL,NULL,'2013-06-28 09:53:22',NULL),('PO201310004','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2013-06-28 11:17:50',NULL),('PO201310004','N','Gray',NULL,600,200,200,200,0,0,0,NULL,NULL,NULL,NULL,'2013-06-28 11:17:50',NULL),('PO201310004','N','Gold',NULL,450,150,150,150,0,0,0,NULL,NULL,NULL,NULL,'2013-06-28 11:17:50',NULL),('PO201310002','N','d',NULL,49,21,51,42,0,0,0,NULL,NULL,NULL,NULL,NULL,'2013-06-28 15:05:29'),('PO201310002','N','f',NULL,12,3,4,5,0,0,0,NULL,NULL,NULL,NULL,NULL,'2013-06-28 15:05:29'),('PO201310002','N','s',NULL,16,11,2,3,0,0,0,NULL,NULL,NULL,NULL,NULL,'2013-06-28 15:05:29'),('PO201310002','N','d',NULL,49,21,51,42,0,0,0,NULL,NULL,NULL,NULL,NULL,'2013-06-28 16:54:34'),('PO201310002','N','f',NULL,12,3,4,5,0,0,0,NULL,NULL,NULL,NULL,NULL,'2013-06-28 16:54:34'),('PO201310002','N','s',NULL,225,11,211,3,0,0,0,NULL,NULL,NULL,NULL,NULL,'2013-06-28 16:54:34'),('PO201310002','N','d',NULL,49,21,51,42,0,0,0,NULL,NULL,NULL,NULL,'2013-06-29 10:47:21',NULL),('PO201310002','N','f',NULL,12,3,4,5,0,0,0,NULL,NULL,NULL,NULL,'2013-06-29 10:47:21',NULL),('PO201310002','N','s',NULL,225,11,211,3,0,0,0,NULL,NULL,NULL,NULL,'2013-06-29 10:47:21',NULL),('PO201310005','N','RED',NULL,33,11,11,11,0,0,0,NULL,NULL,NULL,NULL,'2013-06-29 12:51:19',NULL),('PO201310005','N','RED',NULL,33,11,11,11,0,0,0,NULL,NULL,NULL,NULL,NULL,'2013-06-29 13:17:49');
/*!40000 ALTER TABLE `purchase_order_line_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_m_p_o_colour_cons`
--

DROP TABLE IF EXISTS `r_m_p_o_colour_cons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_m_p_o_colour_cons` (
  `id` int(11) NOT NULL,
  `po_num` varchar(45) default NULL,
  `consumption` varchar(45) default NULL,
  `length` varchar(45) default NULL,
  `order_qty` varchar(45) default NULL,
  `stocked` varchar(45) default NULL,
  `colour` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_m_p_o_colour_cons`
--

LOCK TABLES `r_m_p_o_colour_cons` WRITE;
/*!40000 ALTER TABLE `r_m_p_o_colour_cons` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_m_p_o_colour_cons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_m_p_o_qty`
--

DROP TABLE IF EXISTS `r_m_p_o_qty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_m_p_o_qty` (
  `id` int(11) NOT NULL auto_increment,
  `po_num` varchar(45) default NULL,
  `colour` varchar(45) default NULL,
  `qty` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_m_p_o_qty`
--

LOCK TABLES `r_m_p_o_qty` WRITE;
/*!40000 ALTER TABLE `r_m_p_o_qty` DISABLE KEYS */;
/*!40000 ALTER TABLE `r_m_p_o_qty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `r_m_p_order_basic`
--

DROP TABLE IF EXISTS `r_m_p_order_basic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `r_m_p_order_basic` (
  `id` int(11) NOT NULL auto_increment,
  `po_num` varchar(45) default NULL,
  `date_ordered` varchar(45) default NULL,
  `writer` varchar(45) default NULL,
  `factory` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `r_m_p_order_basic`
--

LOCK TABLES `r_m_p_order_basic` WRITE;
/*!40000 ALTER TABLE `r_m_p_order_basic` DISABLE KEYS */;
INSERT INTO `r_m_p_order_basic` VALUES (2,'PO201310002','','',''),(4,'PO201310003','45/36/37','JeHwan','Dandong'),(6,'PO201310004','','',''),(7,'PO201310005','','','');
/*!40000 ALTER TABLE `r_m_p_order_basic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raw_material_purchase_order`
--

DROP TABLE IF EXISTS `raw_material_purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raw_material_purchase_order` (
  `id` int(11) NOT NULL auto_increment,
  `po_num` varchar(45) default NULL,
  `colour` varchar(45) default NULL,
  `cons` varchar(45) default NULL,
  `length` varchar(45) default NULL,
  `order_qty` varchar(45) default NULL,
  `stocked` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raw_material_purchase_order`
--

LOCK TABLES `raw_material_purchase_order` WRITE;
/*!40000 ALTER TABLE `raw_material_purchase_order` DISABLE KEYS */;
INSERT INTO `raw_material_purchase_order` VALUES (19,'PO201310002','d','out_shell','','f','d'),(20,'PO201310002','f','out_shell','','',''),(21,'PO201310002','s','out_shell','','',''),(22,'PO201310002','d','combination','','s','a'),(23,'PO201310002','f','combination','','',''),(24,'PO201310002','s','combination','','',''),(25,'PO201310002','d','lining','','a',''),(26,'PO201310002','f','lining','','',''),(27,'PO201310002','s','lining','','',''),(28,'PO201310002','d','button','','',''),(29,'PO201310002','f','button','','',''),(30,'PO201310002','s','button','','',''),(31,'PO201310002','d','','','',''),(32,'PO201310002','f','','','',''),(33,'PO201310002','s','','','',''),(34,'PO201310002','d','','','',''),(35,'PO201310002','f','','','',''),(36,'PO201310002','s','','','',''),(55,'PO201310003','Black','out_shell','1351235','14','1234'),(56,'PO201310003','Gray','out_shell','1351235','2341','234'),(57,'PO201310003','JeHwan','out_shell','1351235','1234','124'),(58,'PO201310003','Black','combination','4124','124','312'),(59,'PO201310003','Gray','combination','4124','sdrg','fgq'),(60,'PO201310003','JeHwan','combination','4124','gqwergfqe','sdf'),(61,'PO201310003','Black','lining','','',''),(62,'PO201310003','Gray','lining','','',''),(63,'PO201310003','JeHwan','lining','','',''),(64,'PO201310003','Black','button','','',''),(65,'PO201310003','Gray','button','','',''),(66,'PO201310003','JeHwan','button','','',''),(67,'PO201310003','Black','','','',''),(68,'PO201310003','Gray','','','',''),(69,'PO201310003','JeHwan','','','',''),(70,'PO201310003','Black','','','',''),(71,'PO201310003','Gray','','','',''),(72,'PO201310003','JeHwan','','','',''),(91,'PO201310004','Black','out_shell','asdg','a','sgasd'),(92,'PO201310004','Gold','out_shell','asdg','asg',''),(93,'PO201310004','Gray','out_shell','asdg','',''),(94,'PO201310004','Black','combination','g','',''),(95,'PO201310004','Gold','combination','g','',''),(96,'PO201310004','Gray','combination','g','',''),(97,'PO201310004','Black','inter_lining','asdgas','as','dg'),(98,'PO201310004','Gold','inter_lining','asdgas','',''),(99,'PO201310004','Gray','inter_lining','asdgas','',''),(100,'PO201310004','Black','hanger_tape','','',''),(101,'PO201310004','Gold','hanger_tape','','',''),(102,'PO201310004','Gray','hanger_tape','','',''),(103,'PO201310004','Black','','','',''),(104,'PO201310004','Gold','','','',''),(105,'PO201310004','Gray','','','',''),(106,'PO201310004','Black','','','',''),(107,'PO201310004','Gold','','','',''),(108,'PO201310004','Gray','','','',''),(109,'PO201310005','RED','out_shell','','12','11'),(110,'PO201310005','RED','lining','','12','11'),(111,'PO201310005','RED','combination_1','','12','11'),(112,'PO201310005','RED','','','',''),(113,'PO201310005','RED','','','',''),(114,'PO201310005','RED','','','','');
/*!40000 ALTER TABLE `raw_material_purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raw_material_purchase_order_store_info`
--

DROP TABLE IF EXISTS `raw_material_purchase_order_store_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raw_material_purchase_order_store_info` (
  `id` int(11) NOT NULL auto_increment,
  `po_num` varchar(45) default NULL,
  `consumption` varchar(45) default NULL,
  `store_name` varchar(45) default NULL,
  `composition` varchar(45) default NULL,
  `cons_name` varchar(45) default NULL,
  `cons_cost` varchar(45) default NULL,
  `cons_add` varchar(45) default NULL,
  `cons_tel` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raw_material_purchase_order_store_info`
--

LOCK TABLES `raw_material_purchase_order_store_info` WRITE;
/*!40000 ALTER TABLE `raw_material_purchase_order_store_info` DISABLE KEYS */;
INSERT INTO `raw_material_purchase_order_store_info` VALUES (7,'PO201310002','out_shell','w','a','','','',''),(8,'PO201310002','combination','d','f','','','',''),(9,'PO201310002','lining','f','d','','','',''),(10,'PO201310002','button','d','d','','','',''),(11,'PO201310002','','','','','','',''),(12,'PO201310002','','','','','','',''),(19,'PO201310003','out_shell','asgqwerg','wqr','g','qwergqwe','rg','rgwg'),(20,'PO201310003','combination','qwrg','wrgqw','wgqw','g','gwqrg','s'),(21,'PO201310003','lining','','','','','',''),(22,'PO201310003','button','','','','','',''),(23,'PO201310003','','','','','','',''),(24,'PO201310003','','','','','','',''),(31,'PO201310004','out_shell','dwf','asdfg','as','gasdfg','asfa',''),(32,'PO201310004','combination','','g','','','',''),(33,'PO201310004','inter_lining','asdg','','','','',''),(34,'PO201310004','hanger_tape','fa','','','','',''),(35,'PO201310004','','','','','','',''),(36,'PO201310004','','','','','','',''),(37,'PO201310005','out_shell','','','','','',''),(38,'PO201310005','lining','','','','','',''),(39,'PO201310005','combination_1','','','','','',''),(40,'PO201310005','','','','','','',''),(41,'PO201310005','','','','','','',''),(42,'PO201310005','','','','','','','');
/*!40000 ALTER TABLE `raw_material_purchase_order_store_info` ENABLE KEYS */;
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
  `COMID` varchar(10) NOT NULL,
  PRIMARY KEY  (`SEQNO`,`COMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_memo_03t`
--

LOCK TABLES `s_memo_03t` WRITE;
/*!40000 ALTER TABLE `s_memo_03t` DISABLE KEYS */;
INSERT INTO `s_memo_03t` VALUES (1,'JAEHWAN','2013-05-09','0','안녕하세요 공지사항입니다.','b1000'),(2,'JAEHWAN','2013-05-11','0','안녕하세요 세빈 바이어 여러분. 공지사항입니다.','b1000'),(2,'TEST BUYER','2013-05-11','0','안녕하세요 세빈 바이어 여러분. 공지사항입니다.','B1001'),(2,'TEST MAN','2013-05-11','0','안녕하세요 세빈 바이어 여러분. 공지사항입니다.','P1001'),(2,'TEST MANUFACTURER','2013-05-11','0','안녕하세요 세빈 바이어 여러분. 공지사항입니다.','P1002'),(2,'SEBIN','2013-05-11','0','안녕하세요 세빈 바이어 여러분. 공지사항입니다.','S1001');
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
INSERT INTO `sample_comments` VALUES (206,7,'HA130517-01','샘플 생성 1번','','2000','2013-05-17',NULL,NULL),(207,7,'HA130517-01','샘플 생성 1번','1번샘플 확인했습니다.',NULL,NULL,'B1000','2013-05-17'),(208,7,'HA130517-01','NEW SAMPLE','1번샘플 확인했습니다.','2000','2013-05-17',NULL,NULL),(209,7,'HA130517-01','NEW SAMPLE','수정사항 아래와 같습니다. \r\n\r\n1. 맨위 단추 없애주세요. \r\n\r\n2. 카라 색갈 바꿔주세요. \r\n\r\n3. 별 빼주세요.\r\n\r\n기본600장 단가 얼마입니까?',NULL,NULL,'B1000','2013-05-17'),(210,7,'HA130517-01','기본 600장\r\n\r\n오션 $10 입니다.\r\n\r\n코멘트대로 진행하겠습니다.\r\n\r\n확인 후 오더 컨펌 주시면 진행 가능합니다.','수정사항 아래와 같습니다. \r\n\r\n1. 맨위 단추 없애주세요. \r\n\r\n2. 카라 색갈 바꿔주세요. \r\n\r\n3. 별 빼주세요.\r\n\r\n기본600장 단가 얼마입니까?','2000','2013-05-17',NULL,NULL),(211,7,'HA130517-01','기본 600장\r\n\r\n오션 $10 입니다.\r\n\r\n코멘트대로 진행하겠습니다.\r\n\r\n확인 후 오더 컨펌 주시면 진행 가능합니다.','OK. 진행해주세요.',NULL,NULL,'B1000','2013-05-17'),(212,8,'AAAAA','aa','',NULL,NULL,'B1000','2013-06-28'),(213,8,'AAAAA','aa','ㅓㅏㅇ리어ㅏ러아',NULL,NULL,'B1000','2013-06-28'),(214,11,'20130629','DESIGNED BY MARC JAKO','GOOD JOB',NULL,NULL,'B1000','2013-06-29'),(215,11,'20130629','DESIGNED BY MARC JAKO','GOOD JOB','2000','2013-06-29',NULL,NULL);
/*!40000 ALTER TABLE `sample_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_history`
--

DROP TABLE IF EXISTS `sample_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sample_history` (
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
  `designer` varchar(45) default NULL,
  PRIMARY KEY  (`SEQUENCE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_history`
--

LOCK TABLES `sample_history` WRITE;
/*!40000 ALTER TABLE `sample_history` DISABLE KEYS */;
INSERT INTO `sample_history` VALUES (173,'HA130517-01','2013-05-17','WDRS',1,NULL,'S1001','0000-00-00','0000-00-00','샘플 생성 1번','2000','2013-05-17',NULL,'b1000',NULL,NULL,NULL,'SUMMER','1','','20',NULL,NULL),(174,'HA130517-01','2013-05-17','WDRS',1,NULL,'S1001','0000-00-00','0000-00-00','NEW SAMPLE','2000','2013-05-17',NULL,'b1000',NULL,NULL,NULL,'SUMMER','1','ST2552','10',NULL,NULL),(175,'HA130517-01','2013-05-17','WDRS',1,NULL,'S1001','0000-00-00','0000-00-00','기본 600장\r\n\r\n오션 $10 입니다.\r\n\r\n코멘트대로 진행하겠습니다.\r\n\r\n확인 후 오더 컨펌 주시면 진행 가능합니다.','2000','2013-05-17',NULL,'b1000',NULL,NULL,NULL,'SUMMER','1','ST2552','26',NULL,NULL),(176,'20130629','2013-06-29','WDRS',1,NULL,'S1001','0000-00-00','0000-00-00','DESIGNED BY MARC JAKO','2000','2013-06-29',NULL,'b1000',NULL,NULL,NULL,'AUTUMN','1','SD9999','10',NULL,'MARC JAKO');
/*!40000 ALTER TABLE `sample_history` ENABLE KEYS */;
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
INSERT INTO `scm_notice_01t` VALUES (5,'2011-05-10','9144','SCM manager','관리자 공지사항입니다.','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;</p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"4\" color=\"#004080\"><b>세빈 SCM 오신 것을 환영합니다!</b></font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;</p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"4\" color=\"#0080C0\"><b><img src=\"http://www.sebin2098.com/admin/notice/upload/sbscm.jpg\" border=\"0\"></b></font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;</p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;<font color=\"#FF8000\"><b>SCM( Supply Chain Management ) 이란? </b></font></p>\r\n\r\n<p align=\"left\">Supply-Chain Management </p>\r\n\r\n<p align=\"left\">기업 내 또는 기업 간의 다양한 사업활동의 프로세스와 부문간·부서간에 존재하는 벽을 넘어서 \r\n\r\n수주에서부터 고객 납품에 이르기까지 상품 공급의 흐름을 효율적으로 잘 관리하는 것 </p>\r\n\r\n<p align=\"left\">최적화된 SCM은 제품을 생산하는 기업이 부품의 구매, 제조, 판매까지의 모든 일정을 수립하고 \r\n\r\n고객의 수요계획 및 물류현황을 체계적으로 정리함으로써 제품의 흐름 (부가가치 물자흐름)을 원활하고 효율적으로 수행할 수 있게 한다. </p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;<img src=\"http://www.sebin2098.com/admin/notice/upload/sebin_process.jpg\" border=\"0\"></p>\r\n\r\n</body>\r\n',1508,'9144','2012-06-01');
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
  `ATTACH_REAL_FILE` varchar(300) default NULL,
  PRIMARY KEY  (`NOTICE_SEQNO`)
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
INSERT INTO `shipment_02t` VALUES ('PO201210006','232442','125522','S1001','SPRING','FOB',300,3000.0000,'2012-08-19','2000','B0326'),('PO201310003','TEST4','test123','S1001','SPRING','FOB',31,62.0000,'2013-04-22','2000','B1000'),('PO201310001','BBAB','123457','S1001','SPRING','FOB',129,645.0000,'2013-04-22','2000','B1000'),('PO201310004',' TEST5','test1234','S1001','SPRING','FOB',48,192.0000,'2013-04-22','2000','B1000'),('PO201310000','SDFSD','invoice test','S1001','SUMMER','FOB',92,368.0000,'2013-05-11','2000','b1000');
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
INSERT INTO `subpurchase_order_line` VALUES ('PO201310000','N','d',NULL,5,11,3,1,1,1,2,NULL,NULL,NULL,NULL),('PO201310000','N','f',NULL,87,21,41,21,0,1,3,NULL,NULL,NULL,NULL);
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
  `CONTENTS` text,
  PRIMARY KEY  (`SEQNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_memo_01t`
--

LOCK TABLES `t_memo_01t` WRITE;
/*!40000 ALTER TABLE `t_memo_01t` DISABLE KEYS */;
INSERT INTO `t_memo_01t` VALUES (1,'2000','Sebin SCM','2013-05-09','0','안녕하세요 공지사항입니다.',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">ㅂㄹ라</font></p>\r\n\r\n</body>\r\n'),(2,'2000','Sebin SCM','2013-05-11','0','안녕하세요 세빈 바이어 여러분. 공지사항입니다.',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">블라블라</font></p>\r\n\r\n</body>\r\n');
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
INSERT INTO `user_02t` VALUES ('B1001','10.2.1.161','2011-05-25','1234','USA RETAIL LIMITED.'),('b1001','10.2.1.161','2011-05-25','1234','USA RETAIL LIMITED.'),('B1001','10.2.1.161','2011-05-25','1234','USA RETAIL LIMITED.'),('B1001','10.2.1.161','2011-05-25','1234','USA RETAIL LIMITED.'),('B1001','10.2.1.161','2011-05-26','1233','USA RETAIL LIMITED.'),('b1001','58.106.238.45','2011-05-28','1233','USA RETAIL LIMITED.'),('B1002','58.106.238.45','2011-06-03','1234','LIT LIMITED GUANGZHOU'),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-07','1233','HOT & DELICIOUS '),('B9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('B9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('B9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('b9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('b9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('B1001','175.39.77.33','2011-06-13','1233','HOT & DELICIOUS '),('B1001','175.39.77.33','2011-06-13','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-14','1111','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-14','1111','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-14','1111','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-16','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-16','1234','HOT & DELICIOUS '),('b1001','10.2.1.161','2011-06-16','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-21','1234','HOT & DELICIOUS '),('b1001','10.2.1.161','2011-06-21','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-24','1234','HOT & DELICIOUS '),('b1001','10.2.1.161','2011-06-24','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-27','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-27','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-27','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-27','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-29','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-29','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','219.136.88.251','2011-07-11','1234','HOT & DELICIOUS '),('B1001','219.136.88.251','2011-07-11','1234','HOT & DELICIOUS '),('B1001','219.136.88.251','2011-07-11','1234','HOT & DELICIOUS '),('B1001','219.136.81.195','2011-07-11','1234','HOT & DELICIOUS '),('B1001','113.68.195.157','2011-07-12','1234','HOT & DELICIOUS '),('B9999','113.68.197.150','2011-07-18','1234','BUYER(TEST)'),('B9998','113.68.197.150','2011-07-18','1111','BAESANGGAB_TEST'),('B9999','113.68.197.150','2011-07-18','1234','BUYER(TEST)'),('B9998','113.68.197.150','2011-07-18','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.197.150','2011-07-18','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.197.150','2011-07-18','gavi1004','BAESANGGAB_TEST'),('B1001','115.64.22.118','2011-07-20','1234','HOT & DELICIOUS '),('B9998','113.68.193.93','2011-07-21','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.93','2011-07-21','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.192.146','2011-07-21','gavi1004','BAESANGGAB_TEST'),('B9998','60.242.24.38','2011-07-21','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.93','2011-07-22','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.192.146','2011-07-22','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.93','2011-07-22','gavi1004','BAESANGGAB_TEST'),('B9998','60.242.24.38','2011-07-22','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.188.191','2011-07-23','gavi1004','BAESANGGAB_TEST'),('B9998','60.240.34.201','2011-07-25','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.217.55','2011-07-25','gavi1004','BAESANGGAB_TEST'),('B9998','60.242.24.38','2011-07-25','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.195.145','2011-07-26','gavi1004','BAESANGGAB_TEST'),('B9998','115.64.22.118','2011-07-26','gavi1004','BAESANGGAB_TEST'),('B9998','115.64.22.72','2011-07-26','gavi1004','BAESANGGAB_TEST'),('B9998','60.240.34.201','2011-07-26','gavi1004','BAESANGGAB_TEST'),('B9999','115.64.22.72','2011-07-27','1234','BUYER(TEST)'),('B9999','60.242.24.38','2011-07-27','1234','BUYER(TEST)'),('B9999','115.64.22.118','2011-07-27','1234','BUYER(TEST)'),('B9999','115.64.22.118','2011-07-27','1234','BUYER(TEST)'),('B9999','60.242.24.38','2011-07-27','1234','BUYER(TEST)'),('B9998','60.242.24.38','2011-07-27','gavi1004','BAESANGGAB_TEST'),('B9998','115.64.22.72','2011-07-27','gavi1004','BAESANGGAB_TEST'),('b9999','60.242.24.38','2011-07-27','1234','BUYER(TEST)'),('B9998','60.242.24.38','2011-07-27','gavi1004','BAESANGGAB_TEST'),('B1002','60.242.24.38','2011-07-27','1234','LIT LIMITED GUANGZHOU'),('B9998','113.68.198.239','2011-07-29','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.198.239','2011-07-29','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.218.131','2011-08-01','gavi1004','BAESANGGAB_TEST'),('B9998','115.64.22.72','2011-08-01','gavi1004','BAESANGGAB_TEST'),('B9998','113.66.46.114','2011-08-02','gavi1004','BAESANGGAB_TEST'),('B9998','115.64.22.72','2011-08-02','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.189.184','2011-08-03','gavi1004','BAESANGGAB_TEST'),('B9998','60.240.34.201','2011-08-03','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.203.169','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9997','113.68.189.184','2011-08-04','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.203.169','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.189.184','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9997','113.68.189.184','2011-08-04','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.189.184','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9997','113.68.203.169','2011-08-04','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9998','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9997','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9998','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9997','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_ARGENTINA '),('B9997','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_ARGENTINA '),('B9999','115.64.22.239','2011-08-08','1234','BUYER(TEST)'),('B9999','115.64.22.239','2011-08-08','1234','BUYER(TEST)'),('B9997','113.68.193.109','2011-08-08','gavi1004','BAESANGGAB_ARGENTINA '),('B9997','113.68.193.109','2011-08-08','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.193.109','2011-08-08','gavi1004','BAESANGGAB_TEST'),('B9997','113.68.193.109','2011-08-08','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.193.109','2011-08-08','gavi1004','BAESANGGAB_TEST'),('B9997','113.68.193.109','2011-08-08','gavi1004','BAESANGGAB_ARGENTINA '),('B9997','112.90.147.30','2011-08-09','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','112.90.147.30','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9998','112.90.147.30','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9999','115.64.22.72','2011-08-09','1234','BUYER(TEST)'),('B9998','115.64.22.72','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9999','115.64.22.72','2011-08-09','1234','BUYER(TEST)'),('B9999','115.64.22.239','2011-08-09','1234','BUYER(TEST)'),('B9997','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9999','115.64.22.239','2011-08-09','1234','BUYER(TEST)'),('B9997','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9999','115.64.22.118','2011-08-09','1234','BUYER(TEST)'),('B9997','113.68.202.35','2011-08-09','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.202.35','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-10','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-10','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-10','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-10','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.197.13','2011-08-10','gavi1004','BAESANGGAB_TEST'),('B9998','60.240.34.201','2011-08-10','gavi1004','BAESANGGAB_TEST'),('B1001','113.68.192.255','2011-08-16','1234','HOT & DELICIOUS '),('B1001','113.68.192.255','2011-08-16','1111','HOT & DELICIOUS '),('B1001','113.68.192.255','2011-08-16','1234','HOT & DELICIOUS '),('B1001','115.64.22.72','2011-08-16','1234','HOT & DELICIOUS '),('B9999','115.64.22.72','2011-08-16','1234','BUYER(TEST)'),('B9999','115.64.22.72','2011-08-16','1111','BUYER(TEST)'),('B9997','113.68.202.98','2011-08-17','gavi1004','BAESANGGAB_ARGENTINA '),('B1001','113.68.202.98','2011-08-17','1234','HOT & DELICIOUS '),('B1001','113.68.202.98','2011-08-17','1234','HOT & DELICIOUS '),('B1001','113.68.202.98','2011-08-17','1234','HOT & DELICIOUS '),('B1001','112.90.147.27','2011-08-17','1234','HOT & DELICIOUS '),('B1001','113.68.202.98','2011-08-17','1234','HOT & DELICIOUS '),('B1001','113.68.202.98','2011-08-17','1234','HOT & DELICIOUS '),('B1001','113.68.202.98','2011-08-18','1234','HOT & DELICIOUS '),('B1001','113.66.46.200','2011-08-19','1234','HOT & DELICIOUS '),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B1001','115.64.22.239','2011-08-23','1234','HOT & DELICIOUS '),('B9997','113.68.205.168','2011-08-24','gavi1004','ARGENTIN_TEMPORARY'),('B9998','113.68.205.168','2011-08-24','gavi1004','H&D_TEMPORARY'),('B9997','113.68.205.168','2011-08-24','gavi1004','ARGENTIN_TEMPORARY'),('B1001','113.68.219.177','2011-09-15','1234','HOT & DELICIOUS '),('B1001','113.68.219.177','2011-09-15','1234','HOT & DELICIOUS '),('B9998','113.68.219.177','2011-09-15','gavi1004','H&D_TEMPORARY'),('B9997','113.68.219.177','2011-09-15','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.219.177','2011-09-15','gavi1004','ARGENTIN_TEMPORARY'),('B1001','113.68.219.177','2011-09-15','1234','HOT & DELICIOUS '),('B9997','113.68.219.177','2011-09-15','gavi1004','ARGENTIN_TEMPORARY'),('B1001','113.68.219.177','2011-09-15','1234','HOT & DELICIOUS '),('B1001','113.68.219.177','2011-09-17','1234','HOT & DELICIOUS '),('B1001','76.170.253.116','2011-09-24','1234','HOT & DELICIOUS '),('B1001','76.170.253.116','2011-09-27','1234','HOT & DELICIOUS '),('B1001','76.170.253.116','2011-09-27','1234','HOT & DELICIOUS '),('B9999','117.120.18.132','2012-04-04','1234','BUYER(TEST)'),('B9999','123.98.136.31','2012-06-02','1111','BUYER(TEST)'),('B1001','60.242.24.38','2012-06-04','1234','HOT & DELICIOUS '),('B9999','58.179.206.67','2012-06-07','sb369','BUYER(TEST)'),('B9999','58.179.206.67','2012-06-10','sb369','BUYER(TEST)'),('B9999','58.179.207.208','2012-06-10','sb369','BUYER(TEST)'),('b1001','61.97.255.45','2012-06-15','1234','HOT & DELICIOUS '),('B9999','210.50.232.217','2012-06-16','sb369','BUYER(TEST)'),('B9999','210.50.232.217','2012-06-16','sb369','BUYER(TEST)'),('B9999','210.50.232.217','2012-06-16','sb369','BUYER(TEST)'),('B9999','210.50.232.217','2012-06-19','sb369','BUYER(TEST)'),('B9999','210.50.232.217','2012-06-20','sb369','BUYER(TEST)'),('B9999','210.50.232.217','2012-06-21','sb369','BUYER(TEST)'),('B9999','210.50.232.217','2012-06-23','sb369','BUYER(TEST)'),('B9999','116.240.136.160','2012-06-26','sb369','BUYER(TEST)'),('B9999','116.240.136.160','2012-06-28','sb369','BUYER(TEST)'),('B9999','116.240.136.160','2012-07-03','sb369','BUYER(TEST)'),('B9999','116.240.136.160','2012-07-03','sb369','BUYER(TEST)'),('B9999','116.240.136.160','2012-07-04','sb369','BUYER(TEST)'),('B9999','116.240.136.160','2012-07-05','sb369','BUYER(TEST)'),('B9999','58.106.225.162','2012-07-15','sb369','BUYER(TEST)'),('B9999','116.240.136.185','2012-07-24','sb369','BUYER(TEST)'),('B3308','116.240.136.185','2012-07-24','1111','MELBOURNE'),('B0326','58.106.240.38','2012-07-24','1111','HIKARU'),('B0326','58.106.240.38','2012-07-24','0326','HIKARU'),('B0326','58.106.249.254','2012-08-03','0326','HIKARU'),('B0326','58.106.249.254','2012-08-03','0326','HIKARU'),('B9999','58.179.174.241','2012-08-14','sb369','BUYER(TEST)'),('B9998','58.106.238.88','2012-08-19','gavi1004','H&D_TEMPORARY'),('B0326','58.106.238.88','2012-08-19','0326','HIKARU'),('B1001','58.106.238.88','2012-08-19','1234','HOT & DELICIOUS '),('b0326','101.115.78.44','2012-08-25','0326','HIKARU'),('b0326','101.115.78.44','2012-08-25','0326','HIKARU'),('b0326','101.115.78.44','2012-08-25','0326','HIKARU'),('b0326','101.115.78.44','2012-08-25','0326','HIKARU'),('b0326','101.115.78.44','2012-08-25','0326','HIKARU'),('b0326','101.115.78.44','2012-08-25','0326','HIKARU'),('b0326','101.115.78.44','2012-08-27','0326','HIKARU'),('B0326','101.119.26.183','2012-08-27','0326','HIKARU'),('B9999','183.3.60.81','2012-09-13','sb369','BUYER(TEST)'),('B9999','183.3.60.81','2012-09-13','sb369','BUYER(TEST)'),('B9999','183.3.62.18','2012-09-22','sb369','BUYER(TEST)'),('B9999','220.86.222.136','2012-10-07','sb369','BUYER(TEST)'),('B9999','220.86.222.136','2012-10-09','sb369','BUYER(TEST)'),('B0326','183.1.107.244','2013-04-16','0326','HIKARU'),('B0326','183.1.107.244','2013-04-16','0326','HIKARU'),('B1000','183.1.107.244','2013-04-16','1111','TEST'),('b1000','183.1.107.244','2013-04-16','1234','TEST'),('b1000','183.1.107.244','2013-04-16','1234','TEST'),('B1000','183.1.114.237','2013-04-20','1234','TEST'),('b1000','183.1.114.237','2013-04-20','1234','TEST'),('b1000','183.1.114.237','2013-04-20','1234','TEST'),('b1000','183.1.113.248','2013-04-22','1234','TEST'),('b1000','183.1.113.248','2013-04-22','1234','TEST'),('b1000','183.1.113.248','2013-04-22','1234','TEST'),('b1000','183.1.113.248','2013-04-22','1234','TEST'),('b1000','183.1.102.25','2013-04-24','1234','TEST'),('b1000','183.1.102.25','2013-04-24','1234','TEST'),('b1000','183.1.102.25','2013-04-24','1234','TEST'),('b1000','183.1.115.118','2013-04-26','1234','TEST'),('b1000','183.1.100.59','2013-05-02','1234','TEST'),('b1000','183.1.100.59','2013-05-02','1234','TEST'),('b1007','183.1.100.59','2013-05-02','1234','JAEHWAN'),('B1007','183.1.100.59','2013-05-02','1234','JAEHWAN'),('b1007','183.1.100.59','2013-05-02','1234','JAEHWAN'),('b1007','183.1.100.59','2013-05-02','1234','JAEHWAN'),('B0326','183.1.100.59','2013-05-02','0326','HIKARU'),('b1007','183.1.100.59','2013-05-02','1234','JAEHWAN'),('b1007','183.1.100.59','2013-05-02','1234','JAEHWAN'),('b1007','183.1.100.59','2013-05-02','1234','JAEHWAN'),('b1007','183.1.100.59','2013-05-02','1234','JAEHWAN'),('b1007','183.1.107.239','2013-05-03','1234','JAEHWAN'),('b1000','183.1.107.239','2013-05-03','1234','TEST'),('b1007','183.1.109.58','2013-05-04','1234','JAEHWAN'),('b1007','183.1.109.58','2013-05-04','1111','JAEHWAN'),('b1007','183.1.109.58','2013-05-04','1111','JAEHWAN'),('b1007','183.1.109.58','2013-05-04','1234','JAEHWAN'),('b1007','183.1.109.58','2013-05-04','1234','JAEHWAN'),('B1007','183.1.109.58','2013-05-04','1234','JAEHWAN'),('b1007','183.1.109.58','2013-05-04','1234','JAEHWAN'),('b1001','183.1.101.27','2013-05-07','1234','TEST BUYER'),('b1001','183.1.101.27','2013-05-07','1234','TEST BUYER'),('b1000','183.1.103.228','2013-05-08','1234','JAEHWAN'),('b1000','183.1.100.185','2013-05-09','1234','JAEHWAN'),('b1000','183.1.101.249','2013-05-11','1234','JAEHWAN'),('b1000','183.1.107.195','2013-05-14','1234','JAEHWAN'),('b1000','183.1.126.81','2013-05-17','1234','JAEHWAN'),('b1000','183.1.126.81','2013-05-17','1234','JAEHWAN'),('b1000','183.1.126.81','2013-05-17','1234','JAEHWAN'),('b1000','183.1.126.81','2013-05-17','1234','JAEHWAN'),('b1000','183.1.126.81','2013-05-17','1234','JAEHWAN'),('b1000 ','183.1.123.102','2013-05-20','1234','JAEHWAN'),('b1000','202.104.65.2','2013-05-26','1234','JAEHWAN'),('b1000','183.1.110.7','2013-06-07','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('B1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('B1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('b1000','183.1.111.196','2013-06-28','1234','JAEHWAN'),('B1000','183.1.114.170','2013-06-29','1234','JAEHWAN'),('b1000','183.1.114.170','2013-06-29','1234','JAEHWAN'),('b1000','183.1.114.170','2013-06-29','1234','JAEHWAN');
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
INSERT INTO `vg_common_code` VALUES ('COUNTRY_CODE','Country Code','0',NULL,'Y',NULL,NULL,NULL,NULL),('CURRENCY','CURRENCY TYPE','0',NULL,'Y',NULL,NULL,NULL,NULL),('FORWARDER','Nominated Forwarder','0',NULL,'Y',NULL,NULL,NULL,NULL),('MATERIAL','Marerial','0',NULL,NULL,NULL,NULL,NULL,NULL),('ORDER_STATUS','Order Status','0',NULL,'Y',NULL,NULL,NULL,NULL),('PGR','Product Group','0',NULL,'Y',NULL,NULL,NULL,NULL),('SAMPLE','Sample Manager','0',NULL,NULL,NULL,NULL,NULL,NULL),('SEASON','SEASON','0',NULL,'Y',NULL,NULL,NULL,NULL),('SGR','Product Sub group','0',NULL,'Y',NULL,NULL,NULL,NULL),('SHIPPING_PORT','Shipping Port','0',NULL,'Y',NULL,NULL,NULL,NULL),('SHIP_TYPE','Ship Type','0',NULL,'Y',NULL,NULL,NULL,NULL),('SUB_MAT','Sub-Material','0','원가관리용','Y',NULL,NULL,NULL,NULL),('TRANS_TYPE','Shipping Type','0',NULL,NULL,NULL,NULL,NULL,NULL),('USER_CLASS','User Class','0',NULL,'Y',NULL,NULL,NULL,NULL),('USER_GROUP','User Group','0',NULL,'Y',NULL,NULL,NULL,NULL),('USER_TYPE','User Type','0',NULL,'Y',NULL,NULL,NULL,NULL),('AU','Australia','COUNTRY_CODE',NULL,'Y','9144',NULL,6,NULL),('BD','Bangladesh','COUNTRY_CODE',NULL,'Y','9144',NULL,8,NULL),('BR','BRAZILE','COUNTRY_CODE','new one!!','Y','2000','2013-05-11',13,''),('CN','CHINA','COUNTRY_CODE','','Y','9144','2011-05-23',2,''),('HK','Hongkong','COUNTRY_CODE',NULL,'Y','9144',NULL,3,NULL),('IN','India','COUNTRY_CODE',NULL,'Y','9144',NULL,7,NULL),('KR','KOREA','COUNTRY_CODE',NULL,'Y','9144',NULL,4,NULL),('MN','Mongolia','COUNTRY_CODE',NULL,'Y','9144',NULL,9,NULL),('PH','Philippines','COUNTRY_CODE',NULL,'Y','9144',NULL,10,NULL),('PK','Pakistan','COUNTRY_CODE',NULL,'Y','9144',NULL,11,NULL),('TW','Taiwan','COUNTRY_CODE',NULL,'Y','9144',NULL,12,NULL),('US','USA','COUNTRY_CODE',NULL,'Y','9144',NULL,1,NULL),('VN','Vietnam','COUNTRY_CODE',NULL,'Y','9144',NULL,5,NULL),('AUD','AUD','CURRENCY','','Y','2000','2012-07-24',7,''),('CNY','CNY','CURRENCY',NULL,'Y','9144',NULL,6,NULL),('EUR','EUR','CURRENCY',NULL,'Y','9144',NULL,3,NULL),('GBP','GBP','CURRENCY',NULL,'Y','9144',NULL,5,NULL),('HKD','HKD','CURRENCY',NULL,'Y','9144',NULL,NULL,NULL),('JPY','JPY','CURRENCY',NULL,'Y','9144',NULL,2,NULL),('KRW','KRW','CURRENCY',NULL,'Y','9144',NULL,4,NULL),('USD','USD','CURRENCY',NULL,'Y','9144',NULL,1,NULL),('01','Capricon Logistics','FORWARDER',NULL,'Y',NULL,NULL,NULL,'IN'),('02','Coreana Co','FORWARDER',NULL,'Y',NULL,NULL,NULL,'CN'),('03','SGL Universal Co','FORWARDER',NULL,'Y',NULL,NULL,NULL,'CN'),('04','Alliance','FORWARDER',NULL,'Y',NULL,NULL,NULL,'IN'),('05','Wings Air Cargo Co','FORWARDER',NULL,'Y',NULL,NULL,NULL,'BD'),('06','TNT China','FORWARDER',NULL,'Y',NULL,NULL,NULL,'CN'),('07','TNT India','FORWARDER',NULL,'Y',NULL,NULL,NULL,'IN'),('08','Explorer Freight Co','FORWARDER',NULL,'Y',NULL,NULL,NULL,'PH'),('10','WOVEN-Xlylon','MATERIAL','','Y','2000','2011-07-29',10,''),('00','CREATED','ORDER_STATUS',NULL,'Y','9144',NULL,10,NULL),('10','1st SAMPLE','ORDER_STATUS','','Y','2000','2012-08-20',11,''),('20','Sent Sample','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','2000','2012-06-16',12,''),('22','RECEIVED SAMPLE','ORDER_STATUS','','Y','2000','2012-06-19',13,''),('24','REQUEST TO MODIFY DESIGN','ORDER_STATUS','바이어로 부터 세빈담당자에게 e-mail발송됨','Y','2000','2012-06-19',14,''),('26','Edit Sample','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','9144','2011-06-03',15,''),('30','Confirm Design','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','9144','2011-06-03',16,''),('35','Request Order','ORDER_STATUS','Supplier에게 e-mail발송됨','Y','9144','2011-07-29',17,''),('40','Requested PO-Confirm','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','2000','2012-06-16',18,''),('45','PO-Confirm & Produce','ORDER_STATUS','바이어로 부터 세빈담당자에게 e-mail발송됨','Y','2000','2012-06-19',19,''),('50','PP SAMPLE','ORDER_STATUS',NULL,'Y','9144',NULL,20,NULL),('55','PP CONFIRM','ORDER_STATUS',NULL,'Y','9144',NULL,21,NULL),('60','Request Production','ORDER_STATUS',NULL,'Y','9144',NULL,22,NULL),('65','Request to Contractor','ORDER_STATUS',NULL,'Y','9144',NULL,23,NULL),('70','Produce TOP','ORDER_STATUS',NULL,'Y','9144',NULL,24,NULL),('73','Complete Production','ORDER_STATUS',NULL,'Y','9144',NULL,24,NULL),('75','Create Shipment','ORDER_STATUS',NULL,'Y','9144',NULL,24,NULL),('80','Shipping Out','ORDER_STATUS',NULL,'Y','9144',NULL,25,NULL),('85','STORED IN WAREHOUSE','ORDER_STATUS','','Y','2000','2012-06-19',26,''),('90','Create Invoice','ORDER_STATUS',NULL,'Y','9144',NULL,27,NULL),('92','Issue Invoice','ORDER_STATUS',NULL,'Y','9144',NULL,28,NULL),('94','Receive Invoice','ORDER_STATUS',NULL,'Y','9144',NULL,29,NULL),('96','Payment','ORDER_STATUS',NULL,'Y','9144',NULL,30,NULL),('98','Confirm Deposit','ORDER_STATUS',NULL,'Y','9144',NULL,31,NULL),('99','Payment Complete','ORDER_STATUS',NULL,'Y','9144',NULL,32,NULL),('999','CANCEL ORDER','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','2000','2013-05-14',33,''),('1','WOVEN','PGR',NULL,'Y','9144',NULL,5,NULL),('2','KNIT','PGR',NULL,'Y',NULL,NULL,10,NULL),('3','ACCESSORY','PGR',NULL,'Y',NULL,NULL,20,NULL),('2000','Sample Manager','SAMPLE','scm@sebin2098.com','Y','2000','2013-05-02',20,''),('AUTUMN','AUTUMN','SEASON',NULL,'Y','9144',NULL,30,NULL),('SPRING','SPRING','SEASON',NULL,'Y','9144',NULL,10,NULL),('SUMMER','SUMMER','SEASON',NULL,'Y','9144',NULL,20,NULL),('WINTER','WINTER','SEASON',NULL,'Y','9144',NULL,40,NULL),('KCRD','Knit-Cardigan','SGR',NULL,'Y',NULL,NULL,540,'2'),('KDRS','Knit-Dress','SGR',NULL,'Y',NULL,NULL,560,'2'),('KJKT','Knit-Jacket','SGR',NULL,'Y',NULL,NULL,570,'2'),('KPNT','Knit-Pants','SGR','','Y','2000','2011-08-17',580,'1'),('KTOP','Knit-Top','SGR',NULL,'Y',NULL,NULL,520,'2'),('WBLS','Woven-Blouse','SGR',NULL,'Y',NULL,NULL,360,'1'),('WDRS','Woven-Dress','SGR',NULL,'Y',NULL,NULL,310,'1'),('WJKT','Woven-Jacket','SGR',NULL,'Y',NULL,NULL,370,'1'),('WPNT','Woven-Pants','SGR',NULL,'Y',NULL,NULL,490,'1'),('WSHT','Woven-Shirt','SGR',NULL,'Y',NULL,NULL,340,'1'),('WSKT','Woven-Skirt','SGR',NULL,'Y',NULL,NULL,450,'1'),('WTOP','Woven-Top','SGR',NULL,'Y',NULL,NULL,280,'1'),('01','Bangladesh','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'BD'),('02','Chennai','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'IN'),('03','Dalian','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('04','Hangzhou','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('05','Guangzhou','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('06','Hanoi','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'VN'),('07','Hochimin','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'VN'),('08','Honkong','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'HK'),('09','Incheon','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'KR'),('10','Jaipur','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'IN'),('11','KICT','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'PK'),('12','Mongolia','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'MN'),('13','Mumbai','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'IN'),('14','New Delhi','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'IN'),('15','PICT','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'PK'),('16','Pusan','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'KR'),('17','Qingdao','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('18','Shanghai','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('19','Shenzhen','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('20','Taipei','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'TW'),('21','Manila','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'PH'),('CIF','CIF','SHIP_TYPE','','Y','2000','2011-08-23',30,''),('CMT','CMT','SHIP_TYPE',NULL,'Y','9144',NULL,20,NULL),('EXWORK','EX-WARK','SHIP_TYPE','','Y','2000','2013-06-29',40,''),('FOB','FOB','SHIP_TYPE',NULL,'Y','9144',NULL,10,NULL),('S10','Button','SUB_MAT','','Y','9144','2011-05-27',10,''),('S20','Rubber Band','SUB_MAT','','Y','9144','2011-05-27',20,''),('S30','Zipper','SUB_MAT','','Y','9144','2011-05-27',30,''),('S40','Hanger Loop','SUB_MAT','','Y','9144','2011-05-27',40,''),('AIR','AIR','TRANS_TYPE',NULL,'Y','9144',NULL,20,NULL),('SEA','SEA','TRANS_TYPE',NULL,'Y','9144',NULL,10,NULL),('1','Apparel','USER_CLASS',NULL,'Y',NULL,NULL,10,NULL),('2','Non-Apparel','USER_CLASS',NULL,'Y',NULL,NULL,20,NULL),('A','System Admin Group','USER_GROUP',NULL,'Y','9144',NULL,10,'0'),('B','PO Admin Group','USER_GROUP',NULL,'Y','9144',NULL,30,'H'),('C','Account','USER_GROUP',NULL,'Y',NULL,NULL,60,'C'),('D','PO INUPT=YES','USER_GROUP','','Y','9144','2011-07-27',80,'S'),('F','PO INPUT=NO','USER_GROUP','','Y','9144','2011-07-27',90,'S'),('G','Super Admin','USER_GROUP','','Y','2000','2013-05-04',31,'H'),('M','QC','USER_GROUP',NULL,'Y','9144',NULL,50,'C'),('N','General User Group','USER_GROUP',NULL,'Y','9144',NULL,20,'H'),('S','Shipping','USER_GROUP',NULL,'Y',NULL,NULL,70,'C'),('H','Sebin Staff','USER_TYPE',NULL,'Y','9144',NULL,10,'H'),('S','Buyer','USER_TYPE',NULL,'Y','9144',NULL,20,'S');
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
  `designer` varchar(45) default NULL,
  PRIMARY KEY  (`SEQUENCE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vg_sample_in_out`
--

LOCK TABLES `vg_sample_in_out` WRITE;
/*!40000 ALTER TABLE `vg_sample_in_out` DISABLE KEYS */;
INSERT INTO `vg_sample_in_out` VALUES (7,'HA130517-01','2013-05-17','WDRS',1,NULL,'S1001','0000-00-00','0000-00-00','기본 600장\r\n\r\n오션 $10 입니다.\r\n\r\n코멘트대로 진행하겠습니다.\r\n\r\n확인 후 오더 컨펌 주시면 진행 가능합니다.','2000','2013-05-17',NULL,'b1000',NULL,'scm@sebin2098.com','scm@sebin2098.com','SUMMER','1','ST2552','35','OK. 진행해주세요.',NULL,NULL,NULL,NULL),(8,'AAAAA','2013-06-25','KDRS',1,NULL,'S1001','2013-06-27','2013-06-18','aa','2000','2013-06-25',NULL,'b1000',NULL,'scm@sebin2098.com','scm@sebin2098.com','SUMMER','1','DDF','22','ㅓㅏㅇ리어ㅏ러아',NULL,NULL,NULL,'2000'),(9,'AASDF','2013-06-05','KDRS',1,NULL,'S1001','2013-06-07','2013-06-03','ddf','2000','2013-06-28',NULL,'b1000',NULL,NULL,NULL,'SPRING','2','DDF','00',NULL,NULL,NULL,NULL,'7000'),(10,'123123','2013-06-26','KCRD',1,NULL,'S1001','2013-06-27','0000-00-00','','2000','2013-06-28',NULL,'b1000',NULL,NULL,NULL,'SPRING','1','','00',NULL,NULL,NULL,NULL,'ad'),(11,'20130629','2013-06-29','WDRS',1,NULL,'S1001','0000-00-00','0000-00-00','DESIGNED BY MARC JAKO','2000','2013-06-29',NULL,'b1000',NULL,'scm@sebin2098.com','scm@sebin2098.com','AUTUMN','1','SD9999','10','GOOD JOB',NULL,NULL,NULL,'MARC JAKO');
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

-- Dump completed on 2013-06-29 14:56:48
