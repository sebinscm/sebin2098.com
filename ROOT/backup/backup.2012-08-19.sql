-- MySQL dump 10.10
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
-- Table structure for table `admin_01t`
--

DROP TABLE IF EXISTS `admin_01t`;
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

--
-- Dumping data for table `admin_01t`
--


/*!40000 ALTER TABLE `admin_01t` DISABLE KEYS */;
LOCK TABLES `admin_01t` WRITE;
INSERT INTO `admin_01t` VALUES ('1000','CEO','y504','H','A',NULL,NULL,'1','ceo@sebin2098.com',NULL,'Y'),('2000','Sebin SCM','sb369','H','A','2012-06-02',NULL,'1','wp1968@sebin2098.com',NULL,'Y'),('3000','Tae.Y Won','5856wty','H','B',NULL,NULL,'1','taeyeon@sebin2098.com',NULL,'Y'),('3001','Peter Ho','0326','H','N','2012-07-24',NULL,'2','hikaruoxford@hotmail.com',NULL,'N'),('3100',' Park Ewn Hwa','erica77','H','B',NULL,NULL,'1','pyh77cn@hotmail.com',NULL,'Y'),('7000','Jay Lee','1111','H','B',NULL,NULL,'1','jay.lee@sebin2098.com',NULL,'Y'),('9100','Su.J Jang','jang100','H','A',NULL,NULL,'1','su-jin@sebin2098.com',NULL,'Y'),('9144','Jeffrey H Song','1234','H','A','2011-05-26','1','1','jeffrey.song@ffb.net.au',NULL,'Y'),('9301','박금화','park123','H','B',NULL,NULL,'1','kuemhwa@sebin2098.com',NULL,'Y');
UNLOCK TABLES;
/*!40000 ALTER TABLE `admin_01t` ENABLE KEYS */;

--
-- Table structure for table `cost_01t`
--

DROP TABLE IF EXISTS `cost_01t`;
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

--
-- Dumping data for table `cost_01t`
--


/*!40000 ALTER TABLE `cost_01t` DISABLE KEYS */;
LOCK TABLES `cost_01t` WRITE;
INSERT INTO `cost_01t` VALUES ('PO201210002','12345','SPRING','WTOP','1',NULL,'P1001','B1001','S1001','','0.0000','0.0000','0.0000','','0.0000','','0.0000','0.0000','','0.0000','','0.0000','','0.0000','0.0000','','','','0.0000','0.0000','0.0000','','','','0.0000','0.0000','0.0000','','','','0.0000','0.0000','0.0000','','','','0.0000','0.0000','0.0000','','','','0.0000','0.0000','0.0000','','','','0.0000','0.0000','0.0000','','','0.0000','0.0000','0.0000','','','0.0000','0.0000','0.0000','','','0.0000','0.0000','0.0000','','0.0000','0.0000','0.0000','','N','2012-06-28','2000',NULL,NULL),('PO201210004','78910','SPRING','WTOP','1',NULL,'','B9999','S1001','1.2','160.0000','12.0000','45.0000','','0.0000','12','0.0000','0.0000','','0.0000','12','0.0000','','0.0000','25.0000','','S10','6','0.0000','0.0000','0.0000','','S30','2','0.0000','0.0000','0.0000','','','','0.0000','0.0000','0.0000','','','','0.0000','0.0000','0.0000','','','','0.0000','0.0000','0.0000','','','','0.0000','0.0000','0.0000','','3','0.0000','0.0000','0.0000','','5','0.0000','0.0000','0.0000','','1','0.0000','0.0000','0.0000','','10.0000','5.0000','5.0000','','N','2012-08-19','2000',NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `cost_01t` ENABLE KEYS */;

--
-- Table structure for table `gp_input`
--

DROP TABLE IF EXISTS `gp_input`;
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

--
-- Dumping data for table `gp_input`
--


/*!40000 ALTER TABLE `gp_input` DISABLE KEYS */;
LOCK TABLES `gp_input` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `gp_input` ENABLE KEYS */;

--
-- Table structure for table `invoice_01t`
--

DROP TABLE IF EXISTS `invoice_01t`;
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

--
-- Dumping data for table `invoice_01t`
--


/*!40000 ALTER TABLE `invoice_01t` DISABLE KEYS */;
LOCK TABLES `invoice_01t` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `invoice_01t` ENABLE KEYS */;

--
-- Table structure for table `invoice_02t`
--

DROP TABLE IF EXISTS `invoice_02t`;
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

--
-- Dumping data for table `invoice_02t`
--


/*!40000 ALTER TABLE `invoice_02t` DISABLE KEYS */;
LOCK TABLES `invoice_02t` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `invoice_02t` ENABLE KEYS */;

--
-- Table structure for table `login_01t`
--

DROP TABLE IF EXISTS `login_01t`;
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

--
-- Dumping data for table `login_01t`
--


/*!40000 ALTER TABLE `login_01t` DISABLE KEYS */;
LOCK TABLES `login_01t` WRITE;
INSERT INTO `login_01t` VALUES ('B0326','0326','Hikaru','hikaruoxford@hotmail.com','0433567338','','','Peter Ho','','','2216','Rockdale','','2012-07-24','B','D','N','2012-07-24','USD','2012-07-24','AU','01','N'),('B1001','1234','HOT & Delicious ','jenstylez@gmail.com','213-748-0320','213-748-2282','213-748-0920','Jenny hun','1015S, Crocker st, suite Q-9','','CA90021','LOS Angeles','LA','2011-08-15','B','F','N','2011-08-16','USD',NULL,'US','05','N'),('B1002','1234','LIT LIMITED GUANGZHOU','jeffrey.song@ffb.net.au','86-20-8445-5342','86-134-5036-0905','86-20-8420-1346','GWANGWOO NAM','107# XiangXingShangwuZhongXin, 66-68Hao','XiaDulu','','HaizhouQu','Guangzhou','2011-05-31','B','F','N','2011-04-13','USD','2011-03-07','CN','05','N'),('B1003','1234','PANAMTEX INT\'L.,LTD','by-ellen@naver.com','86-20-2860-7139','86-159-1319-2623','86-20-2860-7169','Ellen Song','#No.4 HePanDongLu,SanDongDaDaoDong','FengHuangCun','','HuaduDistrict','Guangzhou','2011-05-31','B','F','N',NULL,'USD','2011-05-31','CN','05','N'),('B1005','1234','PANAMTEX INT\'L.,LTD','benite@naver.com','86-20-2860-7139','86-137-1034-4506','86-20-2860-7169','Ming Sung Hee','#No.4 HePanDongLu,SanDongDaDaoDong','FengHuangCun','','HuaduDistrict','Guangzhou','2012-07-24','B','F','Y',NULL,'USD','2011-05-31','CN','05','N'),('B1006','1234','PANAMTEX INT\'L.,LTD','khurta@naver.com','86-20-2860-7139','86-237-5186-2388','86-20-2860-7169','Amy Sohn','#No.4 HePanDongLu,SanDongDaDaoDong','FengHuangCun','','HuaduDistrict','',NULL,'B','F','N',NULL,'USD','2011-05-31','CN','05','N'),('B3308','3308','Melbourne','spar3308@gmail.com','0450390939','','','Sungchan','','','3130','Blackburn','','2012-07-24','B','D','N','2012-07-24','USD','2012-07-24','AU','05','N'),('B9997','gavi1004','Argentin_temporary','bwing05@naver.com','13580408063','13580408063','13580408063','Argentina Temp Account','guangzhou','guangzhou','','','guangzhou','2011-08-23','B','D','N',NULL,'HKD','2011-08-04','CN','05','N'),('B9998','gavi1004','H&D_temporary','bwing05@naver.com','13580408063','13580408063','13580408063','H&D temp acc','GUANGZHOU','GUANGZHOU','','','','2011-08-23','B','F','N','2011-07-18','HKD','2011-07-18','US','01','N'),('B9999','sb369','Buyer(Test)','jeffrey.h.song@gmail.com','+612 9748 2286','+61417 566 450','','Jeffrey H Song','13 Blue Gum Pl.','','2127','Newington','NSW','2011-08-15','B','D','N','2012-06-02','USD','2011-06-03','AU','05',''),('P1001',NULL,'Local Contractor','email@email.com','1234-45678','1234-45678','1234-45678','James Lee','street','','2123','surburb','state','2011-05-23','P',NULL,'N',NULL,'USD','2011-05-05','CN',NULL,'N'),('P1002',NULL,'錤惡','liangjinhao111@yahoo.com.cn','13503097108','13925101873','22809095','公平無私','改過遷善','','','','','2011-07-25','P',NULL,'Y',NULL,'CNY','2011-07-23','CN',NULL,'N'),('P1003',NULL,'TAI HE','scm@sebin2098.com','13713161888','13113170888','','LIN SHENG','dongguanshi humenzhen taixinlu hangdi si，wu，badong','','','','','2011-07-25','P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1004',NULL,'YONG HONG','1920702826@QQ.COM','13726456543','0769-85190291','0769-85190291','TANG SHENG','dongguan humenzhen jiumen saihuandaolu xi5hang6hao','','','','',NULL,'P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1005',NULL,'OU HUI','scm@sebin2098.com','18688209218','15323350356','36194187','HU LAOBAN','baiyunqu changhongcun shuanghegongyequ 4lu17hao','','','','',NULL,'P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1006',NULL,'XIN JIN YANG','605069712@QQ.COM','13060884968','33781668','33781688','LI LAOBAN','baiyunqu tangxidawei 10she9dong2lou','','','','',NULL,'P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1007',NULL,'PENG HUI ','scm@sebin2098.com','13717454068','020-23379913','','FENGLAOBAN ','BAIYUNQU XINSHI DAPU SHIYISHE JIUDONG ERLOU','','','','','2011-07-25','P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1008',NULL,'FENGLU ','scm@sebin2098.com','020-22241791','15975458965','','WANGLAOBAN ','BAIYUNQU TANGXI JIUSHE SNADUANGONGYEQU B DONG 4','','','','','2011-07-25','P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1009',NULL,'WEIJUN','scm@sebin2098.com','13710618546','','','','BAIYUNQU HEBIANYUANCUN JIE ZHONGXIANG DONGLU 2HAO','','','','','2011-07-25','P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1010',NULL,'DACHENG','scm@sebin2098.com','15917433867','13751860280','','HUANGDESHENG','XINSHI DAPU SHIYISHE ','','','','',NULL,'P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1011',NULL,'HONGSHENG ','491629547@QQ.COM','020-88224379','13711264858','62730036','WUHUAMING ','BAIYUNQU TANGXI DATIE JI SISHE GONGYEYUAN NANSANDO','','','','',NULL,'P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1012',NULL,'MIJIA','MIJIA919@GMIAL.COM','13660518183','020-3420-5826','020-3420-5826','TIANCHANGZHANG','HAIZHUQU CHIGANGXILU 301 BADONG 2LOU','','','','',NULL,'P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1013',NULL,'MINGDA','scm@sebin2098.com','13826479009','13660518183','020-8430-1957','HUANGLAOBAN','GONGYEDADAO ZHONGQUANTANGLU 38HAODAYUAN ZUOCE 2LOU','','','','',NULL,'P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1014',NULL,'JIAQI','scm@sebin2098.com','15989137335','18922483635','020-3431-5610','SHIJINSHAN','HAIZHUQU CHIGANGXILU 301HAO 5DONG 3LOU','','','','',NULL,'P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1015',NULL,'JINGUO','CHEN3238@126.COM','13642750946','13560364045','020-8414-9257','CHENJIANQING','TUHUA HONGFU XINCUN ERJIE YIHAOYILOU','','','','',NULL,'P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1016',NULL,'MEIJIA','KIN@DAIRIHK.COM','15202018666','','020-3431-5928','JINDONGJUN','HAIZHUQU CHIGANGXILU 301HAO ZHANYINGGONGYEYUAN 12D','','','','',NULL,'P',NULL,'N',NULL,'CNY','2011-07-25','CN',NULL,'N'),('P1017',NULL,'TEST','TEST@TEST.COM','1234','1234','1234','STET','QASTER','ASDF','3333','ASDF','',NULL,'P',NULL,'N',NULL,'HKD','2012-06-02','CN',NULL,'N'),('S1001',NULL,'SEBIN DESIGN Co,Ltd','ceo@sebin2098.com','86.20.3410.4659','86.20.3410.4781','86.20.3410.4707','Jang Su Jin','Room#201. Han Lin Shui an Building, #341 ','Jiang Yi Road','','HaiZhu District','Guangzhou','2011-09-14','S',NULL,'N',NULL,'USD','2011-04-08','CN',NULL,'N');
UNLOCK TABLES;
/*!40000 ALTER TABLE `login_01t` ENABLE KEYS */;

--
-- Table structure for table `login_02t`
--

DROP TABLE IF EXISTS `login_02t`;
CREATE TABLE `login_02t` (
  `ID` varchar(6) NOT NULL,
  `MODIFYID` varchar(10) default NULL,
  `MODIFY_DATE` date default NULL,
  `SUPPLY_NAME` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_02t`
--


/*!40000 ALTER TABLE `login_02t` DISABLE KEYS */;
LOCK TABLES `login_02t` WRITE;
INSERT INTO `login_02t` VALUES ('10000','9144','2011-04-07','SEBIN DESIGN');
UNLOCK TABLES;
/*!40000 ALTER TABLE `login_02t` ENABLE KEYS */;

--
-- Table structure for table `menu_t`
--

DROP TABLE IF EXISTS `menu_t`;
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

--
-- Dumping data for table `menu_t`
--


/*!40000 ALTER TABLE `menu_t` DISABLE KEYS */;
LOCK TABLES `menu_t` WRITE;
INSERT INTO `menu_t` VALUES (1,'Z','Z','Home',NULL,'000',1,'3',NULL,'3',NULL),(43,'H','N','My Account',NULL,'100',1,'3',NULL,'3',NULL),(44,'H','N','Notice for Buyers','/admin/memo/','110',43,'3',NULL,'9144',NULL),(48,'H','N','Order','','300',1,'3',NULL,'9144','2011-05-31'),(49,'H','N','Edit PPO','/ordermanagement/admin_order_list.jsp','310',48,'3',NULL,'9144',NULL),(50,'H','N','Order Amendment','/ordermanagement/order_amend_list.jsp','320',48,'3',NULL,'9144',NULL),(52,'H','N','Create Shipment','/ordermanagement/shipment_issue_list.jsp','510',528,'3',NULL,'9144',NULL),(54,'H','N','Search Invoice','/order/admin_invoice_search.jsp','360',48,'3',NULL,'3',NULL),(55,'H','N','Bulletin Board/PDS',NULL,'900',1,'3',NULL,'9144',NULL),(56,'H','N','Item History','/ordermanagementr/product_info.jsp','910',55,'3',NULL,'9144',NULL),(61,'H','N','Password Change','/admin/resetAdminPasswdForm.jsp?fromURL=menu','160',43,'9240',NULL,'9240',NULL),(101,'H','B','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(102,'H','B','Sample',NULL,'200',1,NULL,NULL,'9144',NULL),(103,'H','B','Password Change','/admin/resetAdminPasswdForm.jsp?fromURL=menu','150',101,NULL,NULL,NULL,NULL),(110,'H','B','Bulletin Board/PDS',NULL,'900',1,NULL,NULL,'9144',NULL),(111,'H','B','Item History','/ordermanagement/product_info.jsp','910',110,NULL,NULL,'9144',NULL),(114,'H','N','Sample',NULL,'200',1,NULL,NULL,'9144',NULL),(115,'H','N','Sample Image','/admin/buyer/style_image_upload_form.jsp','210',114,NULL,NULL,'9144',NULL),(116,'H','B','Sample Image','/admin/buyer/style_image_upload_form.jsp','240',102,NULL,NULL,'9144','2011-06-02'),(117,'H','N','Original Sample','/admin/buyer/original_sample_in_out_list.jsp','220',114,NULL,NULL,'9144',NULL),(118,'H','B','Original Sample','/admin/buyer/original_sample_in_out_list.jsp','220',102,NULL,NULL,'9144',NULL),(201,'C','M','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(202,'C','M','Memorandum','/memo/memo.jsp','110',201,NULL,NULL,NULL,NULL),(203,'C','M','Profile','/account/','120',201,NULL,NULL,NULL,NULL),(205,'C','M','Order Management',NULL,'300',1,NULL,NULL,NULL,NULL),(206,'C','M','PO Confirmation','/order/dsk_po_confirm_search.jsp','310',205,NULL,NULL,'9240',NULL),(207,'C','M','PO History','/order/dsk_po_status.jsp','320',205,NULL,NULL,NULL,NULL),(208,'C','M','Order Amendment','/order/po_amend.jsp','330',205,NULL,NULL,NULL,NULL),(209,'C','M','Barcode Files','/order/barcode.jsp','340',205,NULL,NULL,NULL,NULL),(211,'C','M','Packing List','/order/packing.jsp','361',205,NULL,NULL,NULL,NULL),(213,'C','M','Q.C Roster','/order/qc_report.jsp','380',205,NULL,NULL,NULL,NULL),(214,'C','M','Q.C Analysis','/order/qc_analysis.jsp','390',205,NULL,NULL,NULL,NULL),(216,'C','M','GI Packing List','/order/invoice_confirm_search_dsk.jsp','362',205,NULL,NULL,NULL,NULL),(220,'C','M','Services & Support',NULL,'500',1,NULL,NULL,NULL,NULL),(221,'C','M','Product Info.','/order/product_info.jsp','510',220,NULL,NULL,NULL,NULL),(222,'C','M','Manuals','/notice/list.jsp?table_name=notice','530',220,NULL,NULL,'9240',NULL),(224,'C','M','Password Change','/apess/resetPasswdForm.jsp?fromURL=menu','140',201,NULL,NULL,NULL,NULL),(226,'C','C','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(227,'C','C','Memorandum','/memo/memo.jsp','110',226,NULL,NULL,NULL,NULL),(228,'C','C','Password Change','/apess/resetPasswdForm.jsp?fromURL=menu','140',226,NULL,NULL,NULL,NULL),(229,'C','C','Payment Management',NULL,'300',1,NULL,NULL,NULL,NULL),(230,'C','C','PO History','/order/dsk_po_status.jsp','320',229,NULL,NULL,NULL,NULL),(233,'C','C','GI Packing List','/order/invoice_confirm_search_dsk.jsp','362',229,NULL,NULL,NULL,NULL),(237,'C','C','Search Invoice','/apess/invoice_list.jsp','351',229,NULL,NULL,NULL,NULL),(238,'C','C','Services & Support',NULL,'600',1,NULL,NULL,NULL,NULL),(239,'C','C','Product Info.','/order/product_info.jsp','610',238,NULL,NULL,NULL,NULL),(240,'C','C','Manuals','/notice/list.jsp?table_name=notice','630',238,NULL,NULL,'9240',NULL),(242,'C','S','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(243,'C','S','Memorandum','/memo/memo.jsp','110',242,NULL,NULL,NULL,NULL),(244,'C','S','Password Change','/apess/resetPasswdForm.jsp?fromURL=menu','140',242,NULL,NULL,NULL,NULL),(245,'C','S','Shipment Management',NULL,'300',1,NULL,NULL,NULL,NULL),(247,'C','S','Packing Form Creation','/order/packing_create.jsp','350',245,NULL,NULL,NULL,NULL),(248,'C','S','Packing List','/order/packing.jsp','351',245,NULL,NULL,NULL,NULL),(252,'C','S','Create Invoice','/apess/invoice_issue_list.jsp','360',245,NULL,NULL,NULL,NULL),(253,'C','S','Search Invoice','/apess/invoice_list.jsp','361',245,NULL,NULL,NULL,NULL),(257,'C','A','My Account',NULL,'100',1,NULL,NULL,NULL,NULL),(258,'C','A','Memorandum','/memo/memo.jsp','110',257,NULL,NULL,'9240',NULL),(259,'C','A','Password Change','/apess/resetPasswdForm.jsp?fromURL=menu','140',257,NULL,NULL,NULL,NULL),(260,'C','A','Shipment Management',NULL,'300',1,NULL,NULL,NULL,NULL),(261,'C','A','PO History','/order/dsk_po_status.jsp','320',260,NULL,NULL,NULL,NULL),(262,'C','A','Packing List','/order/packing.jsp','351',260,NULL,NULL,NULL,NULL),(263,'C','A','Received Qty List','/order/invoice_confirm_search_dsk.jsp','352',260,NULL,NULL,'9240',NULL),(265,'C','A','Search Invoice','/apess/invoice_list.jsp','361',260,NULL,NULL,NULL,NULL),(268,'C','A','Services & Support',NULL,'600',1,NULL,NULL,NULL,NULL),(269,'C','A','Product Info.','/order/product_info.jsp','610',268,NULL,NULL,NULL,NULL),(270,'C','A','Manuals','/notice/list.jsp?table_name=notice','630',268,NULL,NULL,'9240',NULL),(272,'C','A','Packing Form Creation','/order/packing_create.jsp','350',260,NULL,NULL,NULL,NULL),(273,'C','A','Create Invoice','/apess/invoice_issue_list.jsp','360',260,NULL,NULL,NULL,NULL),(274,'C','A','PO History+','/order/dsk_po_status.jsp?M=Y','321',260,NULL,NULL,'9240',NULL),(275,'C','A','Search Invoice+','/apess/invoice_list.jsp?M=Y','362',260,NULL,NULL,'9240',NULL),(276,'C','A','Apess User List','/admin/apessuser/list.jsp','120',257,NULL,NULL,'9240',NULL),(277,'C','A','Inspector Management','/apess/inspector_list.jsp','130',257,NULL,NULL,NULL,NULL),(286,'H','A','My Account','','050',1,NULL,NULL,'9144','2011-05-23'),(287,'H','A','Sample',NULL,'200',1,NULL,NULL,'9144',NULL),(288,'H','A','Order',NULL,'300',1,NULL,NULL,'9144',NULL),(289,'H','A','Bulletin Board/PDS',NULL,'900',1,NULL,NULL,'9144',NULL),(290,'H','A','Notice for Buyers','/admin/memo/','110',494,NULL,NULL,'9144',NULL),(291,'H','A','Buyer','/account/supplier.jsp','120',494,NULL,NULL,'9144',NULL),(293,'H','A','Sebin User','/admin/adminuser/list.jsp','140',494,NULL,NULL,'9144',NULL),(296,'H','A','User Screen Menu','/admin/menu/menu_list.jsp?menuType=H','150',494,NULL,NULL,'9144','2011-06-03'),(297,'H','A','Buyer Screen Menu','/admin/menu/menu_list.jsp?menuType=S','151',494,NULL,NULL,'9144','2011-06-03'),(299,'H','A','Edit Password','/admin/resetAdminPasswdForm.jsp?fromURL=menu','060',286,NULL,NULL,'9144',NULL),(300,'H','A','Sample Image','/admin/buyer/style_image_upload_form.jsp','250',287,NULL,NULL,'9144','2011-06-02'),(301,'H','A','Original Sample','/admin/buyer/original_sample_in_out_list.jsp','220',287,NULL,NULL,'9144',NULL),(302,'H','A','Edit PPO','/ordermanagement/admin_order_list.jsp','310',288,NULL,NULL,'9144',NULL),(303,'H','A','Order Amendment','/ordermanagement/order_amend_list.jsp','320',288,NULL,NULL,'9144',NULL),(305,'H','A','Create Shipment','/ordermanagement/shipment_issue_list.jsp','510',525,NULL,NULL,'9144',NULL),(308,'H','A','Search Invoices','/payment/invoice_search.jsp','740',527,NULL,NULL,'9144',NULL),(311,'H','A','Item History','/ordermanagement/admin_item_history_list.jsp','910',289,NULL,NULL,'9144',NULL),(351,'C','S','PO History','/order/dsk_po_status.jsp','320',245,'9240',NULL,'9240',NULL),(353,'C','A','Q.C Roster','/order/qc_report.jsp','380',260,'9240',NULL,'9240',NULL),(354,'C','A','Q.C Analysis','/order/qc_analysis.jsp','381',260,'9240',NULL,'9240',NULL),(355,'C','A','Barcode Files','/order/barcode.jsp','340',260,'9240',NULL,'9240',NULL),(356,'C','S','Barcode Files','/order/barcode.jsp','340',245,'9240',NULL,'9240',NULL),(359,'C','A','Barcode Check','/pda.jsp','390',260,'9240',NULL,'9240',NULL),(360,'C','C','Barcode Check','/pda.jsp','390',229,'9240',NULL,'9240',NULL),(361,'C','M','Barcode Check','/pda.jsp','395',205,'9240',NULL,'9240',NULL),(362,'C','S','Barcode Check','/pda.jsp','390',245,'9240',NULL,'9240',NULL),(364,'H','N','Buyer','/account/supplier.jsp','120',43,'9240',NULL,'9144',NULL),(391,'H','A','PDS','/notice_new/list.jsp?noticeType=2','940',289,'9240',NULL,'9144','2011-06-29'),(392,'H','N','PDS','/notice_new/list.jsp?noticeType=2','940',55,'9240',NULL,'9144','2011-06-29'),(393,'H','B','PDS','/notice_new/list.jsp?noticeType=2','940',110,'9240',NULL,'9144','2011-06-29'),(400,'S','F','My Account','','100',1,'9240',NULL,'9144','2011-05-23'),(401,'S','F','Order Management',NULL,'300',1,'9240',NULL,'9144',NULL),(402,'S','F','Invoices',NULL,'400',1,'9240',NULL,'9144',NULL),(403,'S','F','Support & Services','','500',1,'9240',NULL,'9144','2011-07-27'),(404,'S','F','Announcement','/memo/index.jsp','110',400,'9240',NULL,'9144','2011-07-27'),(405,'S','F','Profile','/account/view_profile.jsp','120',400,'9240',NULL,'9144',NULL),(406,'S','F','PO Confirmation','/ordermanagement/buyer_order_confirm_list.jsp','310',401,'9240',NULL,'9144',NULL),(407,'S','F','PO History','/ordermanagement/buyer_order_list.jsp','320',401,'9240',NULL,'9144',NULL),(408,'S','F','Order Amendment','/ordermanagement/buyer_order_amend_list.jsp','330',401,'9240',NULL,'9144',NULL),(412,'S','F','Invoice list','/payment/buyer_invoice_search.jsp','405',402,'9240',NULL,'9144','2011-07-27'),(415,'S','F','Payment','/payment/buyer_payment_search.jsp','425',402,'9240',NULL,'9144','2011-07-27'),(417,'S','F','Product Search','/ordermanagement/buyer_item_history_list.jsp','510',403,'9240',NULL,'9144','2011-07-27'),(418,'S','F','Bulletin board','/notice_new/buyer_list.jsp?noticeType=1','530',403,'9240',NULL,'9144','2011-07-27'),(419,'S','F','Download','/notice_new/buyer_list.jsp?noticeType=2','540',403,'9240',NULL,'9144','2011-07-27'),(447,'C','A','Tag Specs','/notice/list.jsp?table_name=notice2','640',268,'9240',NULL,'9240',NULL),(448,'C','C','Tag Specs','/notice/list.jsp?table_name=notice2','640',238,'9240',NULL,'9240',NULL),(449,'C','M','Tag Specs','/notice/list.jsp?table_name=notice2','540',220,'9240',NULL,'9240',NULL),(453,'H','A','Order Status','/ordermanagement/admin_order_status_list.jsp','315',288,'9240',NULL,'9144',NULL),(454,'H','B','Order',NULL,'300',1,'9240',NULL,'9144',NULL),(455,'H','B','Order Status','/ordermanagement/admin_order_status_list.jsp','315',454,'9240',NULL,'9144',NULL),(457,'S','F','Shipment List','/ordermanagement/buyer_shipment_list.jsp','375',401,'9240',NULL,'9144',NULL),(458,'H','A','Shipment List','/ordermanagement/admin_shipment_list.jsp','520',525,'9240',NULL,'9144',NULL),(459,'H','N','Shipment List','/ordermanagement/admin_shipment_list.jsp','520',528,'9240',NULL,'9144',NULL),(460,'C','A','Profile','/account/','135',257,'9240',NULL,'9240',NULL),(461,'H','N','Order Status','/ordermanagement/admin_order_status_list.jsp','315',48,'9240',NULL,'9144',NULL),(485,'C','A','Shipment Creation','/order/shipment_issue_list.jsp','355',260,'9240',NULL,'9240',NULL),(486,'C','A','Shipment List','/order/shipment_list.jsp','356',260,'9240',NULL,'9240',NULL),(487,'C','A','Credit/Debit Note','/order/dsk_note.jsp','363',260,'9240',NULL,'9240',NULL),(488,'C','S','Shipment Creation','/order/shipment_issue_list.jsp','355',245,'9240',NULL,'9240',NULL),(489,'C','S','Shipment List','/order/shipment_list.jsp','356',245,'9240',NULL,'9240',NULL),(490,'C','S','Credit/Debit Note','/order/dsk_note.jsp','363',245,'9240',NULL,'9240',NULL),(491,'C','C','Credit/Debit Note','/order/dsk_note.jsp','363',229,'9240',NULL,'9240',NULL),(492,'H','A','Code Management','/admin/codes/code_list.jsp','125',494,'9144',NULL,'9144',NULL),(494,'H','A','System Administration','','100',1,'9144',NULL,'9144','2011-05-23'),(496,'H','A','Notice for Sebin Users','/admin/notice/list.jsp','155',494,'9144',NULL,'9144',NULL),(497,'H','A','Manufacturer','/account/sub_list.jsp','130',494,'9144',NULL,'9144',NULL),(498,'H','A','Create PPO','/ordermanagement/PurchaseOrder.jsp','305',288,'9144',NULL,'9144',NULL),(500,'H','A','Upload Style Image','/ordermanagement/image_upload.jsp','313',288,'9144',NULL,'9144',NULL),(502,'H','A','Company CI','/admin/codes/companyci_upload.jsp','160',494,'9144',NULL,'9144',NULL),(504,'H','A','Upload Style Images (Batch)','/ordermanagement/style_image_upload_form.jsp','314',288,'9144',NULL,'9144',NULL),(505,'H','B','Upload Style Images (Batch)','/ordermanagement/style_image_upload_form.jsp','321',454,'9144',NULL,'9144','2011-06-08'),(506,'H','N','Upload Style Images (Batch)','/ordermanagement/style_image_upload_form.jsp','305',48,'9144',NULL,'9144',NULL),(508,'S','F','SAMPLE Management','','200',1,'9144',NULL,'9144','2011-07-27'),(509,'S','F','Original Sample','/sample/original_sample_list.jsp','210',508,'9144',NULL,'9144','2011-07-27'),(510,'H','A','Company Profile','/account/company_list.jsp','135',494,'9144',NULL,'9144',NULL),(511,'H','A','Production',NULL,'400',1,'9144',NULL,'9144',NULL),(512,'H','A','Production Status','/admin/product/product_management.jsp','410',511,'9144',NULL,'9144',NULL),(515,'H','B','Order Amendment','/ordermanagement/order_amend_list.jsp','317',454,'9144',NULL,'9144',NULL),(516,'H','B','Create PPO','/ordermanagement/PurchaseOrder.jsp','312',454,'9144',NULL,'9144','2011-06-08'),(517,'H','B','Edit PPO','/ordermanagement/admin_order_list.jsp','313',454,'9144',NULL,'9144','2011-06-08'),(518,'H','B','Upload Style Image','/ordermanagement/image_upload.jsp','320',454,'9144',NULL,'9144','2011-06-08'),(520,'H','B','Create Shipment','/ordermanagement/shipment_issue_list.jsp','510',529,'9144',NULL,'9144',NULL),(522,'H','B','Production',NULL,'400',1,'9144',NULL,'9144',NULL),(523,'H','B','Production Status','/admin/product/product_management.jsp','410',522,'9144',NULL,'9144',NULL),(524,'H','B','Notice for Buyers','/admin/memo/','151',101,'9144',NULL,'9144',NULL),(525,'H','A','Shipment',NULL,'500',1,'9144',NULL,'9144',NULL),(526,'H','A','Create Invoice','/payment/invoice_confirm_search.jsp','730',527,'9144',NULL,'9144',NULL),(527,'H','A','Payment','','700',1,'9144',NULL,'9144','2011-05-31'),(528,'H','N','Shipment',NULL,'500',1,'9144',NULL,'9144',NULL),(529,'H','B','Shipment',NULL,'500',1,'9144',NULL,'9144',NULL),(530,'H','B','Shipment list','/ordermanagement/admin_shipment_list.jsp','520',529,'9144',NULL,'9144',NULL),(531,'H','B','Payment','','700',1,'9144',NULL,'9144','2011-05-31'),(532,'H','B','Create Invoice','/payment/invoice_confirm_search.jsp','710',531,'9144',NULL,'9144',NULL),(533,'H','B','Search Invoices','/payment/invoice_search.jsp','720',531,'9144',NULL,'9144',NULL),(534,'H','A','Contractor Payment','/payment/sub_payment_list.jsp','710',527,'9144',NULL,'9144','2011-05-31'),(535,'H','A','PO History','/ordermanagement/admin_order_history_list.jsp','311',288,'9144',NULL,'9144',NULL),(536,'H','N','PO History','/ordermanagement/admin_order_history_list.jsp','316',48,'9144',NULL,'9144',NULL),(537,'H','B','PO History','/ordermanagement/admin_order_history_list.jsp','314',454,'9144',NULL,'9144','2011-06-08'),(538,'H','A','Buyer Payment','/payment/admin_payment_list.jsp','750',527,'9144',NULL,'9144',NULL),(539,'H','A','Payment Record','/payment/admin_payment_search.jsp','760',527,'9144',NULL,'9144',NULL),(540,'H','A','Cost','/admin/product/cost_management.jsp','420',511,'9144','2011-05-26','9144','2011-05-26'),(541,'H','A','Sample Spec Sheet','/admin/buyer/original_sample_list.jsp','230',287,'9144','2011-06-02','9144','2011-06-02'),(542,'H','B','Sample Spec Sheet','/admin/buyer/original_sample_list.jsp','230',102,'9144','2011-06-02','9144','2011-06-02'),(543,'S','F','Sample Sheet','/sample/sample_sheet_list.jsp','220',508,'9144','2011-06-03','9144','2011-07-27'),(544,'H','B','Buyer','/account/supplier.jsp','311',454,'9144','2011-06-08','9144','2011-06-08'),(545,'H','B','Manufacturer','/account/sub_list.jsp','310',454,'9144','2011-06-08','9144','2011-06-08'),(546,'H','B','Cost','/admin/product/cost_management.jsp','420',522,'1001','2011-06-08','1001','2011-06-08'),(547,'H','B','Contractor Payment','/admin/product/cost_management.jsp','705',531,'1001','2011-06-08','1001','2011-06-08'),(548,'H','B','Buyer Payment','/payment/admin_payment_list.jsp','730',531,'1001','2011-06-08','1001','2011-06-08'),(549,'H','B','Payment Record','/payment/admin_payment_search.jsp','740',531,'1001','2011-06-08','1001','2011-06-08'),(550,'H','A','Contractor Order','/admin/product/admin_suborder_list.jsp','415',511,'9144','2011-06-17','9144','2011-06-17'),(551,'H','B','Contractor Order','/admin/product/admin_suborder_list.jsp','415',522,'9144','2011-06-20','9144','2011-06-20'),(552,'H','A','Bulletin Board','/notice_new/list.jsp?noticeType=1','920',289,'9144','2011-06-29','9144','2011-06-29'),(553,'H','B','Bulletin Board','/notice_new/list.jsp?noticeType=1','920',110,'9144','2011-06-29','9144','2011-06-29'),(554,'H','N','Bulletin Board','/notice_new/list.jsp?noticeType=1','920',55,'9144','2011-06-29','9144','2011-06-29'),(555,'H','A','DB Layout','/admin/SystemAdmin/Table_Layout.html','190',494,'9144','2011-07-05','9144','2011-07-05'),(556,'S','D','My Account','','100',1,'9144','2011-07-27','9144','2011-07-27'),(557,'S','D','Announcement','/memo/index.jsp','110',556,'9144','2011-07-27','9144','2011-07-27'),(558,'S','D','Profile','/account/view_profile.jsp','120',556,'9144','2011-07-27','9144','2011-07-27'),(559,'S','D','SAMPLE Management','','200',1,'9144','2011-07-27','9144','2011-07-27'),(560,'S','D','Original Sample list','/sample/original_sample_list.jsp','210',559,'9144','2011-07-27','9144','2011-07-27'),(561,'S','D','Sample Sheet','/sample/sample_sheet_list.jsp','220',559,'9144','2011-07-27','9144','2011-07-27'),(562,'S','D','Order Management','','300',1,'9144','2011-07-27','9144','2011-07-27'),(563,'S','D','Purchase Order','/ordermanagement/buyer_purchase_order.jsp','310',562,'9144','2011-07-27','9144','2011-07-27'),(564,'S','D','PO Edit','/ordermanagement/buyer_order_edit_list.jsp','320',562,'9144','2011-07-27','9144','2011-07-27'),(565,'S','D','PO Confirmation','/ordermanagement/buyer_order_confirm_list.jsp','330',562,'9144','2011-07-27','9144','2011-07-27'),(566,'S','D','PO History','/ordermanagement/buyer_order_list.jsp','340',562,'9144','2011-07-27','9144','2011-07-27'),(567,'S','D','Order Amendment report','/ordermanagement/buyer_order_amend_list.jsp','350',562,'9144','2011-07-27','9144','2011-08-09'),(568,'S','D','Shipment List','/ordermanagement/buyer_shipment_list.jsp','360',562,'9144','2011-07-27','9144','2011-07-27'),(569,'S','D','Invoices','','400',1,'9144','2011-07-27','9144','2011-07-27'),(570,'S','D','Invoice list','/payment/buyer_invoice_search.jsp','410',569,'9144','2011-07-27','9144','2011-07-27'),(571,'S','D','Payment','/payment/buyer_payment_search.jsp','420',569,'9144','2011-07-27','9144','2011-07-27'),(572,'S','D','Support & Services','','500',1,'9144','2011-07-27','9144','2011-07-27'),(573,'S','D','Product Search','/ordermanagement/buyer_item_history_list.jsp','510',572,'9144','2011-07-27','9144','2011-07-27'),(574,'S','D','Bulletin board','/notice_new/buyer_list.jsp?noticeType=1','530',1,'9144','2011-07-27','9144','2011-07-27'),(575,'S','D','Download','/notice_new/buyer_list.jsp?noticeType=2','540',572,'9144','2011-07-27','9144','2011-07-27'),(576,'H','A','Browse Style Image','Browser.jsp?sort=1&dir=C%3A%5CSCM_MYSQL%5CROOT%5Cimages','950',289,'9144','2011-08-02','9144','2011-08-02'),(577,'S','D','Product photo upload','/ordermanagement/buyer_image_upload.jsp','305',562,'9144','2011-08-08','9144','2011-08-08'),(579,'S','D','Order Amendment','/ordermanagement/buyer_order_amend_input.jsp','345',562,'9144','2011-08-09','9144','2011-08-09'),(580,'S','D','PO Status update','/ordermanagement/buyer_order_status_list.jsp','342',562,'9144','2011-08-09','9144','2011-08-09');
UNLOCK TABLES;
/*!40000 ALTER TABLE `menu_t` ENABLE KEYS */;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
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

--
-- Dumping data for table `notice`
--


/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
LOCK TABLES `notice` WRITE;
INSERT INTO `notice` VALUES (1,'게시판입니다.','Jeffrey','1234','jeffrey.song@ffb.net.au','null','2011-05-10','자유로운 질문 답변 게시판 입니다.\n이곳에 자유롭게 게시를 할 수 있습니다. \n*주의사항: 작성을 위해서는 필히 제목,작성자,비밀번호를 입력해야 합니다!','null',0,34,1,0,0,'9144'),(2,'게시판 테스트입니다.','홍길동','1234','null','null','2011-05-24','게시판 테스트입니다.게시판 테스트입니다.게시판 테스트입니다.게시판 테스트입니다.게시판 테스트입니다.게시판 테스트입니다.게시판 테스트입니다.게시판 테스트입니다.','null',0,26,2,0,0,'9144');
UNLOCK TABLES;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

--
-- Table structure for table `notice2`
--

DROP TABLE IF EXISTS `notice2`;
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

--
-- Dumping data for table `notice2`
--


/*!40000 ALTER TABLE `notice2` DISABLE KEYS */;
LOCK TABLES `notice2` WRITE;
INSERT INTO `notice2` VALUES (1,'세빈SCM 관리자 및 사용자 메뉴얼','System Admin','1234','jeffrey.song@ffb.net.au','null','2011-06-28','안녕하세요,\r\n\r\nSebin SCM에 대한 시스템 관리자 및 사용자 메뉴얼입니다.\r\n첨부화일을 다운로드 하시기 바랍니다.\r\n','/upload/scm/SCM_Admin & Users_Manual.pdf',10520193,3,1,0,0,'9144'),(2,'Sebin SCM Buyers 메뉴얼','System Admin','1234','jeffrey.song@ffb.net.au','null','2011-06-28','Sebin SCM에 대한 Buyer를 위한 메뉴얼입니다.\r\n첨부된 문서를 읽기 위해서는 반드시 Adobe PDF Reader가 설치 되어 있어야 합니다.\r\n\r\n기타 문의사항에 대해서는 세빈 본사에 문의하여 주세요.','/upload/scm/SCM_Buyers_Manual.pdf',3921366,2,2,0,0,'9144');
UNLOCK TABLES;
/*!40000 ALTER TABLE `notice2` ENABLE KEYS */;

--
-- Table structure for table `notice_01t`
--

DROP TABLE IF EXISTS `notice_01t`;
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

--
-- Dumping data for table `notice_01t`
--


/*!40000 ALTER TABLE `notice_01t` DISABLE KEYS */;
LOCK TABLES `notice_01t` WRITE;
INSERT INTO `notice_01t` VALUES (3,'2011-06-29','9144','Jeffrey H Song',2,'바이어용 메뉴얼입니다.','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">바이어용 사용자 메뉴얼입니다.</font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">첨부된 문서를 다운로드하여 사용하시면 됩니다.</font></p>\r\n\r\n</body>\r\n',18,'2011-06-29'),(7,'2011-08-17','2000','배상갑',2,'바이어용 중요요약 메뉴얼V1.0 입니다. ','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">바이어용 중요 요약 메뉴얼입니다..</font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;</p>\r\n\r\n</body>\r\n',12,'2012-06-02');
UNLOCK TABLES;
/*!40000 ALTER TABLE `notice_01t` ENABLE KEYS */;

--
-- Table structure for table `notice_02t`
--

DROP TABLE IF EXISTS `notice_02t`;
CREATE TABLE `notice_02t` (
  `SEQNO` int(10) unsigned NOT NULL auto_increment,
  `NOTICE_SEQNO` int(10) unsigned NOT NULL,
  `ATTACH_FILE` varchar(300) default NULL,
  `ATTACH_REAL_FILE` varchar(300) default NULL,
  PRIMARY KEY  (`SEQNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notice_02t`
--


/*!40000 ALTER TABLE `notice_02t` DISABLE KEYS */;
LOCK TABLES `notice_02t` WRITE;
INSERT INTO `notice_02t` VALUES (3,3,'SCM_Buyers_Manual.pdf','SCM_Buyers_Manual.pdf'),(7,7,'20110809_SEBIN_요약scm.ppt','20110809_SEBIN_요약scm.ppt');
UNLOCK TABLES;
/*!40000 ALTER TABLE `notice_02t` ENABLE KEYS */;

--
-- Table structure for table `payment_01t`
--

DROP TABLE IF EXISTS `payment_01t`;
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

--
-- Dumping data for table `payment_01t`
--


/*!40000 ALTER TABLE `payment_01t` DISABLE KEYS */;
LOCK TABLES `payment_01t` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `payment_01t` ENABLE KEYS */;

--
-- Table structure for table `pbcatcol`
--

DROP TABLE IF EXISTS `pbcatcol`;
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

--
-- Dumping data for table `pbcatcol`
--


/*!40000 ALTER TABLE `pbcatcol` DISABLE KEYS */;
LOCK TABLES `pbcatcol` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `pbcatcol` ENABLE KEYS */;

--
-- Table structure for table `pbcatedt`
--

DROP TABLE IF EXISTS `pbcatedt`;
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

--
-- Dumping data for table `pbcatedt`
--


/*!40000 ALTER TABLE `pbcatedt` DISABLE KEYS */;
LOCK TABLES `pbcatedt` WRITE;
INSERT INTO `pbcatedt` VALUES ('#####','#####',90,1,1,32,'10'),('###,###.00','###,###.00',90,1,1,32,'10'),('###-##-####','###-##-####',90,1,1,32,'00'),('DD/MM/YY','DD/MM/YY',90,1,1,32,'20'),('DD/MM/YY HH:MM:SS','DD/MM/YY HH:MM:SS',90,1,1,32,'40'),('DD/MM/YY HH:MM:SS:FFFFFF','DD/MM/YY HH:MM:SS:FFFFFF',90,1,1,32,'40'),('DD/MM/YYYY','DD/MM/YYYY',90,1,1,32,'20'),('DD/MM/YYYY HH:MM:SS','DD/MM/YYYY HH:MM:SS',90,1,1,32,'40'),('DD/MMM/YY','DD/MMM/YY',90,1,1,32,'20'),('DD/MMM/YY HH:MM:SS','DD/MMM/YY HH:MM:SS',90,1,1,32,'40'),('HH:MM:SS','HH:MM:SS',90,1,1,32,'30'),('HH:MM:SS:FFF','HH:MM:SS:FFF',90,1,1,32,'30'),('HH:MM:SS:FFFFFF','HH:MM:SS:FFFFFF',90,1,1,32,'30'),('JJJ/YY','JJJ/YY',90,1,1,32,'20'),('JJJ/YY HH:MM:SS','JJJ/YY HH:MM:SS',90,1,1,32,'40'),('JJJ/YYYY','JJJ/YYYY',90,1,1,32,'20'),('JJJ/YYYY HH:MM:SS','JJJ/YYYY HH:MM:SS',90,1,1,32,'40'),('MM/DD/YY','MM/DD/YY',90,1,1,32,'20'),('MM/DD/YY HH:MM:SS','MM/DD/YY HH:MM:SS',90,1,1,32,'40'),('MM/DD/YYYY','MM/DD/YYYY',90,1,1,32,'20'),('MM/DD/YYYY HH:MM:SS','MM/DD/YYYY HH:MM:SS',90,1,1,32,'40');
UNLOCK TABLES;
/*!40000 ALTER TABLE `pbcatedt` ENABLE KEYS */;

--
-- Table structure for table `pbcatfmt`
--

DROP TABLE IF EXISTS `pbcatfmt`;
CREATE TABLE `pbcatfmt` (
  `pbf_name` varchar(30) NOT NULL,
  `pbf_frmt` varchar(254) default NULL,
  `pbf_type` smallint(6) default NULL,
  `pbf_cntr` int(11) default NULL,
  UNIQUE KEY `pbcatf_x` (`pbf_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pbcatfmt`
--


/*!40000 ALTER TABLE `pbcatfmt` DISABLE KEYS */;
LOCK TABLES `pbcatfmt` WRITE;
INSERT INTO `pbcatfmt` VALUES ('#,##0','#,##0',81,0),('#,##0.00','#,##0.00',81,0),('$#,##0.00;($#,##0.00)','$#,##0.00;($#,##0.00)',81,0),('$#,##0.00;[RED]($#,##0.00)','$#,##0.00;[RED]($#,##0.00)',81,0),('$#,##0;($#,##0)','$#,##0;($#,##0)',81,0),('$#,##0;[RED]($#,##0)','$#,##0;[RED]($#,##0)',81,0),('0','0',81,0),('0%','0%',81,0),('0.00','0.00',81,0),('0.00%','0.00%',81,0),('0.00E+00','0.00E+00',81,0),('d-mmm','d-mmm',84,0),('d-mmm-yy','d-mmm-yy',84,0),('h:mm AM/PM','h:mm AM/PM',84,0),('h:mm:ss','h:mm:ss',84,0),('h:mm:ss AM/PM','h:mm:ss AM/PM',84,0),('m/d/yy','m/d/yy',84,0),('m/d/yy h:mm','m/d/yy h:mm',84,0),('mmm-yy','mmm-yy',84,0),('[General]','[General]',81,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `pbcatfmt` ENABLE KEYS */;

--
-- Table structure for table `pbcattbl`
--

DROP TABLE IF EXISTS `pbcattbl`;
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

--
-- Dumping data for table `pbcattbl`
--


/*!40000 ALTER TABLE `pbcattbl` DISABLE KEYS */;
LOCK TABLES `pbcattbl` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `pbcattbl` ENABLE KEYS */;

--
-- Table structure for table `pbcatvld`
--

DROP TABLE IF EXISTS `pbcatvld`;
CREATE TABLE `pbcatvld` (
  `pbv_name` varchar(30) NOT NULL,
  `pbv_vald` varchar(254) default NULL,
  `pbv_type` smallint(6) default NULL,
  `pbv_cntr` int(11) default NULL,
  `pbv_msg` varchar(254) default NULL,
  UNIQUE KEY `pbcatv_x` (`pbv_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pbcatvld`
--


/*!40000 ALTER TABLE `pbcatvld` DISABLE KEYS */;
LOCK TABLES `pbcatvld` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `pbcatvld` ENABLE KEYS */;

--
-- Table structure for table `po_comments`
--

DROP TABLE IF EXISTS `po_comments`;
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

--
-- Dumping data for table `po_comments`
--


/*!40000 ALTER TABLE `po_comments` DISABLE KEYS */;
LOCK TABLES `po_comments` WRITE;
INSERT INTO `po_comments` VALUES (1,'PO201210001','임시용입니다. 테스트용 \r\n\r\n칼라 애드 orange',NULL,'2000','2012-04-06',NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `po_comments` ENABLE KEYS */;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
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

--
-- Dumping data for table `purchase_order`
--


/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
LOCK TABLES `purchase_order` WRITE;
INSERT INTO `purchase_order` VALUES ('PO201110000','N','BHS86301','SPRING','WSKT','1','10','1',NULL,NULL,'BHS8630','',NULL,'4.2500','S','M','L','','','',NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-25','0000-00-00','FOB','AIR','2011-08-25','0000-00-00','0000-00-00','40','USD',NULL,NULL,'7000','H&D',NULL,'B1001','S1001','P1006','2011-09-15','2011-09-25',NULL,'2011-09-15','HOT & Delicious ','SEBIN DESIGN Co,Ltd','XIN JIN YANG','Bandush Order\r\n\r\nOcean:$4.85\r\nAir: $5.35',372,'2012-08-03','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110001','N','BHJ8287A','SPRING','WDRS','1','10','1',NULL,NULL,'BHJ8287A','',NULL,'4.2000','S','M','L','','','',NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','0000-00-00','FOB','AIR','2011-09-06','0000-00-00','0000-00-00','40','USD',NULL,NULL,'7000','H&D',NULL,'B1001','S1001','P1011','2011-09-15','0000-00-00',NULL,'2011-09-15','HOT & Delicious ','SEBIN DESIGN Co,Ltd','HONGSHENG ','Ocean:$5.20\r\nAir:$5.85',840,'2012-08-03','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110002','N','BHS86302','SPRING','WSKT','1','10','1',NULL,NULL,'BHS8630','',NULL,'4.2500','S','M','L','','','',NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','0000-00-00','FOB','AIR','2011-09-01','0000-00-00','0000-00-00','40','HKD',NULL,NULL,'7000','H&D',NULL,'B1001','S1001','P1006','2011-09-15','0000-00-00',NULL,'2011-09-15','HOT & Delicious ','SEBIN DESIGN Co,Ltd','XIN JIN YANG','Mix&Match Order\r\n\r\nOcean:$4.85\r\nAir: $5.35',144,'2012-08-03','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110003','N','BHS86303','SPRING','WSKT','1','10','1',NULL,NULL,'BHS8630','',NULL,'4.2500','S','M','L','','','',NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','0000-00-00','FOB','AIR','2011-09-02','0000-00-00','0000-00-00','40','HKD',NULL,NULL,'7000','H&D',NULL,'B1001','S1001','P1006','2011-09-15','0000-00-00',NULL,'2011-09-15','HOT & Delicious ','SEBIN DESIGN Co,Ltd','XIN JIN YANG','Foreign Exchange Order',360,'2012-08-03','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110004','N','BHD8745','SPRING','WTOP','1','10','2',NULL,NULL,'BHD8745','',NULL,'7.5000','S','M','L','','','',NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-20','0000-00-00','FOB','AIR','2011-08-27','0000-00-00','0000-00-00','40','USD',NULL,NULL,'7000','H&D',NULL,'B1001','S1001','P1003','2011-09-15','2011-09-20',NULL,'2011-09-15','HOT & Delicious ','SEBIN DESIGN Co,Ltd','TAI HE','H&D, Mix&Match Order\r\n\r\nOcean: $8.50\r\nAir: $9.38',600,'2012-08-03','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110005','N','SHD8981','SPRING','KDRS','1','10','0',NULL,NULL,'SHD8981','',NULL,'8.7000','S','M','L','','','',NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL,NULL,NULL,NULL,'2011-09-30','0000-00-00','FOB','AIR','2011-09-02','0000-00-00','0000-00-00','40','USD',NULL,NULL,'7000','H&D',NULL,'B1001','S1001','P1010','2011-09-15','2011-09-30',NULL,'2011-09-15','HOT & Delicious ','SEBIN DESIGN Co,Ltd','DACHENG','Ocean: $9.75\r\nAir: $11.46',900,'2012-08-03','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201110006','N','SHT8995A','SPRING','WTOP','1','10','0',NULL,NULL,'SHT8995A','',NULL,'3.6000','S','M','L','','','',NULL,NULL,NULL,NULL,'0.0000',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','0000-00-00','FOB','AIR','2011-08-28','0000-00-00','0000-00-00','40','USD',NULL,NULL,'7000','H&D',NULL,'B1001','S1001','P1001','2011-09-15','0000-00-00',NULL,'2011-09-15','HOT & Delicious ','SEBIN DESIGN Co,Ltd','Local하청업체','Ocean: $4.75\r\nAir: $5.55',570,'2012-08-03','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210001','N','1135A','SPRING','WTOP','1','10','0',NULL,NULL,'dress','',NULL,'6.0000','s','m','l','','','',NULL,NULL,NULL,NULL,'30.0000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','FOB','SEA','2012-04-06','0000-00-00','0000-00-00','75','USD',NULL,NULL,'2000','M&D',NULL,'B1001','S1001','P1003','2012-04-06','2012-05-31',NULL,'2012-04-06','HOT & Delicious ','SEBIN DESIGN Co,Ltd','TAI HE','임시용입니다. 테스트용 \r\n\r\n칼라 애드 orange',600,'2012-08-03','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210002','N','12345','SPRING','WTOP','1','10','0',NULL,NULL,'Item','#1234',NULL,'12.3400','S','M','','','','',NULL,NULL,NULL,NULL,'235.3400',NULL,NULL,NULL,NULL,NULL,NULL,'2012-06-18','0000-00-00','FOB','SEA','2012-06-01','0000-00-00','0000-00-00','40','HKD',NULL,NULL,'9144','Brand',NULL,'B1001','S1001','P1001','2012-06-01','2012-06-18',NULL,'2012-06-01','HOT & Delicious ','SEBIN DESIGN Co,Ltd','Local하청업체','Comments',20,'2012-08-03','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0.0000','0000-00-00','0.0000',NULL,'0.0000','  ',NULL,NULL,'0000-00-00','0.0000','0000-00-00','0.0000'),('PO201210003','N','	78910 ','SPRING','WDRS','1','10','2',NULL,NULL,'ttt',NULL,NULL,'20.0000','s','l','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','FOB','SEA','2012-06-11','0000-00-00','0000-00-00','80','HKD',NULL,NULL,'B9999','tt',NULL,'B9999','S1001',NULL,'2012-06-11','2012-06-12',NULL,'2012-06-11','Buyer(Test)','SEBIN DESIGN Co,Ltd',NULL,'tttfdsfsdfasdfasdfasdfasdfasdfasdf',6,'2012-08-03','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210004','N','78910','SPRING','WTOP','1','10','1',NULL,' ','asdfa',NULL,NULL,'444.0000','s','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','FOB','SHIP','2012-06-28','0000-00-00','0000-00-00','73','HKD',NULL,NULL,'B9999','',NULL,'B9999','S1001',NULL,'2012-06-28','2012-06-29','2012-06-28','2012-06-28','Buyer(Test)','SEBIN DESIGN Co,Ltd',NULL,'sdfasdf',3,'2012-08-14','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210005','N','SD2000','SPRING','WTOP','1','10','0',NULL,NULL,'dress','',NULL,'5.0000','s','m','L','XL','','',NULL,NULL,NULL,NULL,'15.0000',NULL,NULL,NULL,NULL,NULL,NULL,'2012-07-31','0000-00-00','FOB','SEA','2012-07-24','0000-00-00','0000-00-00','80','HKD',NULL,NULL,'B0326','hot & delicious',NULL,'B0326','S1001','P1001','2012-08-03','2012-07-31',NULL,'2012-07-24','Hikaru','SEBIN DESIGN Co,Ltd','Local Contractor','this is new sample\r\n\r\n\r\ncan you make it 4doller',170,'2012-08-03','2000',NULL,NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210006','N','232442','SPRING','WTOP','1','10','0',NULL,NULL,'dress','',NULL,'10.0000','s','m','','','','',NULL,NULL,NULL,NULL,'2000.0000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00','FOB','SHIP','2012-08-19','2012-08-07','0000-00-00','75','HKD',NULL,NULL,'2000','fghfg',NULL,'B0326','S1001','P1001','2012-08-19','2012-08-21',NULL,'2012-08-19','Hikaru','SEBIN DESIGN Co,Ltd','Local Contractor','',300,'2012-08-19','2000','125522',NULL,'0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;

--
-- Table structure for table `purchase_order_history`
--

DROP TABLE IF EXISTS `purchase_order_history`;
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

--
-- Dumping data for table `purchase_order_history`
--


/*!40000 ALTER TABLE `purchase_order_history` DISABLE KEYS */;
LOCK TABLES `purchase_order_history` WRITE;
INSERT INTO `purchase_order_history` VALUES ('PO201210001','N','1135A','SPRING','WTOP','1','10','0',NULL,NULL,'dress','',NULL,'6.0000','s','m','l','','','',NULL,NULL,NULL,NULL,'30.00',NULL,NULL,NULL,NULL,NULL,NULL,'2012-05-31',NULL,'FOB','SEA','2012-04-06',NULL,NULL,'40','USD',NULL,NULL,'2000','M&D',NULL,'B1001','S1001','P1003','2012-04-06','2012-05-31',NULL,'2012-04-06','HOT & Delicious ','SEBIN DESIGN Co,Ltd','TAI HE','임시용입니다. 테스트용 \r\n\r\n칼라 애드 orange',600,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210001','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'55',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2012-06-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210001','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'75',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2012-06-02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210003','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'55',NULL,NULL,NULL,'B9999',NULL,NULL,NULL,NULL,NULL,'2012-06-19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210003','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'80',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2012-06-28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210005','N','SD2000','SPRING','WTOP','1','10','0',NULL,NULL,'dress',NULL,NULL,'4.0000','s','m','L','XL','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-07-31',NULL,'FOB','SEA','2012-07-24',NULL,NULL,'40','HKD',NULL,NULL,'B0326','hot & delicious',NULL,'B0326','S1001',NULL,'2012-07-24','2012-07-31',NULL,'2012-07-24','Hikaru','SEBIN DESIGN Co,Ltd',NULL,'this is new sample\r\n',170,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210005','N','SD2000','SPRING','WTOP','1','10','0',NULL,NULL,'dress','',NULL,'5.0000','s','m','L','XL','','',NULL,NULL,NULL,NULL,'15.00',NULL,NULL,NULL,NULL,NULL,NULL,'2012-07-31',NULL,'FOB','SEA','2012-07-24',NULL,NULL,'40','HKD',NULL,NULL,'2000','hot & delicious',NULL,'B0326','S1001','P1001','2012-07-24','2012-07-31',NULL,'2012-07-24','Hikaru','SEBIN DESIGN Co,Ltd','Local Contractor','this is new sample\r\n',170,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210005','N','SD2000','SPRING','WTOP','1','10','0',NULL,NULL,'dress',NULL,NULL,'5.0000','s','m','L','XL','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-07-31',NULL,'FOB','SEA','2012-07-24',NULL,NULL,'40','HKD',NULL,NULL,'B0326','hot & delicious',NULL,'B0326','S1001',NULL,'2012-07-24','2012-07-31',NULL,'2012-07-24','Hikaru','SEBIN DESIGN Co,Ltd',NULL,'this is new sample\r\n\r\n\r\ncan you make it 4doller',170,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210005','N','SD2000','SPRING','WTOP','1','10','0',NULL,NULL,'dress',NULL,NULL,'5.0000','s','m','L','XL','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2012-07-31',NULL,'FOB','SEA','2012-07-24',NULL,NULL,'40','HKD',NULL,NULL,'B0326','hot & delicious',NULL,'B0326','S1001',NULL,'2012-08-03','2012-07-31',NULL,'2012-08-03','Hikaru','SEBIN DESIGN Co,Ltd',NULL,'this is new sample\r\n\r\n\r\ncan you make it 4doller',170,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210004','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'73',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2012-08-14',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('PO201210006','N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'73',NULL,NULL,NULL,'2000',NULL,NULL,NULL,NULL,NULL,'2012-08-19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `purchase_order_history` ENABLE KEYS */;

--
-- Table structure for table `purchase_order_line`
--

DROP TABLE IF EXISTS `purchase_order_line`;
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

--
-- Dumping data for table `purchase_order_line`
--


/*!40000 ALTER TABLE `purchase_order_line` DISABLE KEYS */;
LOCK TABLES `purchase_order_line` WRITE;
INSERT INTO `purchase_order_line` VALUES ('PO201110000','N','Black',NULL,126,42,42,42,0,0,0,NULL,NULL,NULL,NULL),('PO201110000','N','Gold',NULL,126,42,42,42,0,0,0,NULL,NULL,NULL,NULL),('PO201110000','N','Grey',NULL,120,40,40,40,0,0,0,NULL,NULL,NULL,NULL),('PO201110001','N','Black',NULL,450,150,150,150,0,0,0,NULL,NULL,NULL,NULL),('PO201110001','N','Ivory',NULL,342,112,112,118,0,0,0,NULL,NULL,NULL,NULL),('PO201110001','N','Ivory[Mix&Match',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL),('PO201110002','N','Black',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL),('PO201110002','N','Gold',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL),('PO201110002','N','Silver',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL),('PO201110003','N','Black',NULL,180,90,60,30,0,0,0,NULL,NULL,NULL,NULL),('PO201110003','N','Silver',NULL,180,90,60,30,0,0,0,NULL,NULL,NULL,NULL),('PO201110004','N','Cocoa',NULL,252,82,82,88,0,0,0,NULL,NULL,NULL,NULL),('PO201110004','N','Cocoa[Mix&Match',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL),('PO201110004','N','Red',NULL,252,82,82,88,0,0,0,NULL,NULL,NULL,NULL),('PO201110004','N','Red[Mix&Match]',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL),('PO201110005','N','Antique Gold',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL),('PO201110005','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL),('PO201110005','N','Silver',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL),('PO201110006','N','Orange/Green',NULL,285,95,95,95,0,0,0,NULL,NULL,NULL,NULL),('PO201110006','N','Pink/Blue',NULL,285,95,95,95,0,0,0,NULL,NULL,NULL,NULL),('PO201210001','N','black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL),('PO201210001','N','orange',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL),('PO201210002','N','Black',NULL,20,10,10,0,0,0,0,NULL,NULL,NULL,NULL),('PO201210003','N','b',NULL,6,3,3,0,0,0,0,NULL,NULL,NULL,NULL),('PO201210004','N','4',NULL,3,3,0,0,0,0,0,NULL,NULL,NULL,NULL),('PO201210005','N','Blue',NULL,155,55,50,50,0,0,0,NULL,NULL,NULL,NULL),('PO201210005','N','red',NULL,15,5,10,0,0,0,0,NULL,NULL,NULL,NULL),('PO201210006','N','blue',NULL,300,100,200,0,0,0,0,NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `purchase_order_line` ENABLE KEYS */;

--
-- Table structure for table `purchase_order_line_history`
--

DROP TABLE IF EXISTS `purchase_order_line_history`;
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

--
-- Dumping data for table `purchase_order_line_history`
--


/*!40000 ALTER TABLE `purchase_order_line_history` DISABLE KEYS */;
LOCK TABLES `purchase_order_line_history` WRITE;
INSERT INTO `purchase_order_line_history` VALUES ('PO201110000','N','IVORY',NULL,300,75,75,75,75,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:13:55',NULL),('PO201110000','N','ANTIQUE',NULL,200,50,50,50,50,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:13:55',NULL),('PO201110000','N','MOONLIGHT',NULL,200,50,50,50,50,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:13:55',NULL),('PO201110000','N','BLANCO',NULL,300,75,75,75,75,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:13:55',NULL),('PO201110000','N','ANTIQUE',NULL,200,50,50,50,50,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:16:48',NULL),('PO201110000','N','BLANCO',NULL,300,75,75,75,75,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:16:48',NULL),('PO201110000','N','IVORY',NULL,300,75,75,75,75,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:16:48',NULL),('PO201110000','N','MOONLIGHT',NULL,200,50,50,50,50,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:16:48',NULL),('PO201110001','N','IVORY',NULL,300,75,75,75,75,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:20:48',NULL),('PO201110001','N','ANTIQUE',NULL,200,50,50,50,50,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:20:48',NULL),('PO201110001','N','MOONLIGHT',NULL,200,50,50,50,50,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:20:48',NULL),('PO201110001','N','BLANCO',NULL,300,75,75,75,75,0,0,NULL,NULL,NULL,NULL,'2011-08-23 12:20:48',NULL),('PO201110002','N','Brown #4',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-08-24 10:18:23',NULL),('PO201110002','N','Teal #25',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-08-24 10:18:23',NULL),('PO201110002','N','Brown #4',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-08-24 10:24:47',NULL),('PO201110002','N','Teal #25',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-08-24 10:24:47',NULL),('PO201110003','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 12:52:45',NULL),('PO201110003','N','Silver',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 12:52:45',NULL),('PO201110003','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 12:54:45',NULL),('PO201110003','N','Silver',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 12:54:45',NULL),('PO201110003','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 13:09:57',NULL),('PO201110003','N','Silver',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 13:09:57',NULL),('PO201110003','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 13:10:28',NULL),('PO201110003','N','Silver',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-01 13:10:28',NULL),('PO201110000','N','Black',NULL,126,42,42,42,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 14:55:21',NULL),('PO201110000','N','Grey',NULL,120,40,40,40,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 14:55:21',NULL),('PO201110000','N','Gold',NULL,126,42,42,42,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 14:55:21',NULL),('PO201110001','N','Ivory',NULL,342,112,112,118,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:20:37',NULL),('PO201110001','N','Ivory[Mix&Match',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:20:37',NULL),('PO201110001','N','Black',NULL,450,150,150,150,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:20:37',NULL),('PO201110002','N','Black',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:42:31',NULL),('PO201110002','N','Silver',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:42:31',NULL),('PO201110002','N','Gold',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:42:31',NULL),('PO201110003','N','Black',NULL,180,90,60,30,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:45:10',NULL),('PO201110003','N','Silver',NULL,180,90,60,30,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:45:10',NULL),('PO201110004','N','Red',NULL,252,82,82,88,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:59:57',NULL),('PO201110004','N','Cocoa',NULL,252,82,82,88,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:59:57',NULL),('PO201110004','N','Red[Mix&Match]',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:59:57',NULL),('PO201110004','N','Cocoa[Mix&Match',NULL,48,18,18,12,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 15:59:57',NULL),('PO201110005','N','Black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 16:08:24',NULL),('PO201110005','N','Silver',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 16:08:24',NULL),('PO201110005','N','Antique Gold',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 16:08:24',NULL),('PO201110006','N','Orange/Green',NULL,285,95,95,95,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 16:13:49',NULL),('PO201110006','N','Pink/Blue',NULL,285,95,95,95,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 16:13:49',NULL),('PO201110007','N','BLUE',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 18:01:30',NULL),('PO201110007','N','BLACK',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 18:01:30',NULL),('PO201110007','N','WHITE',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2011-09-15 18:01:30',NULL),('PO201210001','N','black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2012-04-06 20:26:43',NULL),('PO201210001','N','black',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2012-04-06 20:36:38',NULL),('PO201210001','N','orange',NULL,300,100,100,100,0,0,0,NULL,NULL,NULL,NULL,'2012-04-06 20:36:38',NULL),('PO201210002','N','Black',NULL,20,10,10,0,0,0,0,NULL,NULL,NULL,NULL,'2012-06-01 09:39:15',NULL),('PO201210003','N','A',NULL,6,1,3,2,0,0,0,NULL,NULL,NULL,NULL,'2012-06-02 14:48:50',NULL),('PO201210003','N','A',NULL,6,1,3,2,0,0,0,NULL,NULL,NULL,NULL,'2012-06-02 14:49:30',NULL),('PO201210003','N','b',NULL,6,3,3,0,0,0,0,NULL,NULL,NULL,NULL,'2012-06-11 10:52:22',NULL),('PO201210004','N','4',NULL,3,3,0,0,0,0,0,NULL,NULL,NULL,NULL,'2012-06-28 22:12:02',NULL),('PO201210005','N','red',NULL,15,5,10,0,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:36:13',NULL),('PO201210005','N','red',NULL,15,5,10,0,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:43:12',NULL),('PO201210005','N','Blue',NULL,155,55,50,50,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:43:12',NULL),('PO201210005','N','Blue',NULL,155,55,50,50,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:44:48',NULL),('PO201210005','N','red',NULL,15,5,10,0,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:44:48',NULL),('PO201210005','N','Blue',NULL,155,55,50,50,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:46:21',NULL),('PO201210005','N','red',NULL,15,5,10,0,0,0,0,NULL,NULL,NULL,NULL,'2012-07-24 22:46:21',NULL),('PO201210005','N','Blue',NULL,155,55,50,50,0,0,0,NULL,NULL,NULL,NULL,'2012-08-03 21:21:11',NULL),('PO201210005','N','red',NULL,15,5,10,0,0,0,0,NULL,NULL,NULL,NULL,'2012-08-03 21:21:11',NULL),('PO201210006','N','blue',NULL,300,100,200,0,0,0,0,NULL,NULL,NULL,NULL,'2012-08-19 14:03:53',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `purchase_order_line_history` ENABLE KEYS */;

--
-- Table structure for table `s_memo_02t`
--

DROP TABLE IF EXISTS `s_memo_02t`;
CREATE TABLE `s_memo_02t` (
  `SEQNO` int(11) NOT NULL,
  `COMNAME` varchar(50) NOT NULL,
  `STAFFID` varchar(10) NOT NULL,
  `STAFFNAME` varchar(50) NOT NULL,
  `RDATE` date default NULL,
  PRIMARY KEY  (`SEQNO`,`COMNAME`,`STAFFID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `s_memo_02t`
--


/*!40000 ALTER TABLE `s_memo_02t` DISABLE KEYS */;
LOCK TABLES `s_memo_02t` WRITE;
INSERT INTO `s_memo_02t` VALUES (1,'USA RETAIL LIMITED.','B1001','USA RETAIL LIMITED.','2011-05-25'),(4,'BAESANGGAB_TEST','B9998','BAESANGGAB_TEST','2011-08-04'),(8,'BUYER(TEST)','B9999','BUYER(TEST)','2012-07-15'),(9,'BUYER(TEST)','B9999','BUYER(TEST)','2012-06-07'),(10,'HIKARU','B0326','HIKARU','2012-07-24');
UNLOCK TABLES;
/*!40000 ALTER TABLE `s_memo_02t` ENABLE KEYS */;

--
-- Table structure for table `s_memo_03t`
--

DROP TABLE IF EXISTS `s_memo_03t`;
CREATE TABLE `s_memo_03t` (
  `SEQNO` int(11) NOT NULL,
  `COMNAME` varchar(50) NOT NULL,
  `IDATE` date NOT NULL,
  `DFLAG` char(1) NOT NULL,
  `TITLE` varchar(100) default NULL,
  `COMID` varchar(10) default NULL,
  PRIMARY KEY  (`SEQNO`,`COMNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `s_memo_03t`
--


/*!40000 ALTER TABLE `s_memo_03t` DISABLE KEYS */;
LOCK TABLES `s_memo_03t` WRITE;
INSERT INTO `s_memo_03t` VALUES (1,'미국바이어','2011-05-10','1','테스트 한글','B1001'),(2,'미국바이어','2011-05-10','1','이번주 공지사항입니다.','B1001'),(3,'GLOBAL SOURCING USA CO,.LTD.','2011-05-23','1','SEBIN SCM 입니다.','B1002'),(4,'BAESANGGAB_TEST','2011-07-18','1','공지사항 테스트 입니다. ','B9998'),(5,'BAESANGGAB_TEST','2011-08-16','1','테스트 게시판','B9998'),(5,'BUYER(TEST)','2011-08-16','1','테스트 게시판','B9999'),(6,'BAESANGGAB_TEST','2011-08-16','1','공지 테스트','B9998'),(6,'BUYER(TEST)','2011-08-16','1','공지 테스트','B9999'),(7,'BUYER(TEST)','2012-06-01','1','title','B9999'),(8,'BUYER(TEST)','2012-06-02','0','test','B9999'),(9,'BUYER(TEST)','2012-06-02','0','Message from Melbourne','B9999'),(10,'HIKARU','2012-07-24','0','welcome','B0326');
UNLOCK TABLES;
/*!40000 ALTER TABLE `s_memo_03t` ENABLE KEYS */;

--
-- Table structure for table `sample_comments`
--

DROP TABLE IF EXISTS `sample_comments`;
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

--
-- Dumping data for table `sample_comments`
--


/*!40000 ALTER TABLE `sample_comments` DISABLE KEYS */;
LOCK TABLES `sample_comments` WRITE;
INSERT INTO `sample_comments` VALUES (1,1,'12345','주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다','9144','2011-06-14',NULL,NULL),(2,1,'12345','주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다',NULL,NULL,'B1001','2011-06-14'),(3,3,'99999','Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','','9144','2011-06-30',NULL,NULL),(4,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(5,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(6,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(7,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(8,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(9,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(10,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-12',NULL,NULL),(11,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-13',NULL,NULL),(12,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-13',NULL,NULL),(13,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.','','9144','2011-07-13',NULL,NULL),(14,5,'TEST_01','테스트입니다.','','9202','2011-07-19',NULL,NULL),(15,5,'TEST_01','바꿔주세요','','9202','2011-07-19',NULL,NULL),(16,6,'TEST_02','오늘 받은 오리지널입니다.','','2000','2011-07-21',NULL,NULL),(17,9,'TEST_04','New Samsple Image입니다.\r\n오늘 발송하는 Image.','바이어 커멘트입니다.',NULL,NULL,'B9998','2011-07-21'),(18,9,'TEST_04','New Samsple Image입니다.\r\n오늘 발송하는 Image.','바이어 커멘트입니다.',NULL,NULL,'B9998','2011-07-21'),(19,8,'TEST_03','최초샘플입니다.','','9144','2011-07-21',NULL,NULL),(20,5,'TEST_01','바꿔주세요','벨트껀을 조정해 주세요......',NULL,NULL,'B9998','2011-07-22'),(21,7,'TEST_02','오리지널 샘플입니다.','밑에 하단을 수정해 주세요..\r\n수정해 주셨으면 합니다.',NULL,NULL,'B9998','2011-07-22'),(22,5,'TEST_01','벨트껀을 4인치 조정했습니다.','벨트껀을 조정해 주세요......','2000','2011-07-22',NULL,NULL),(23,5,'TEST_01','벨트껀을 4인치 조정했습니다.','벨트껀을 조정해 주세요......',NULL,NULL,'B9998','2011-07-22'),(24,10,'9000','1st Fit Sample\r\nRevised to Buyer Comments','','9202','2011-07-26',NULL,NULL),(25,10,'9000','1st Fit Sample\r\nRevised to Buyer Comments\r\n\r\n2nd Fit Sample\r\nSent by 07/28','','9202','2011-07-26',NULL,NULL),(26,11,'SHD9003','New Sample','','9202','2011-07-27',NULL,NULL),(27,9,'TEST_04','New Samsple Image입니다.\r\n오늘 발송하는 Image.','네..좋습니다. 생산해 주세요.',NULL,NULL,'B9998','2011-07-29'),(28,10,'9000','1st Fit Sample\r\nRevised to Buyer Comments\r\n\r\n2nd Fit Sample\r\nSent by 07/28','하단쪽만 1인찍 늘려 주세요..\r\n디자인 좋습니다.',NULL,NULL,'B9998','2011-07-29'),(29,9,'TEST_04','네..오더관리로 넘겨서 PO 생성 하겠습니다.','네..좋습니다. 생산해 주세요.','2000','2011-07-29',NULL,NULL),(30,7,'TEST_02','오리지널 샘플입니다.','밑에 하단을 수정해 주세요..\r\n수정해 주셨으면 합니다.','9144','2011-08-02',NULL,NULL),(31,9,'TEST_04','네..오더관리로 넘겨서 PO 생성 하겠습니다.','네..좋습니다. 생산해 주세요.','9144','2011-08-02',NULL,NULL),(32,8,'TEST_03','최초샘플입니다.','','9144','2011-08-02',NULL,NULL),(33,14,'SHD9021','New Sample','','9144','2011-08-02',NULL,NULL),(34,15,'SHD8990','New Sample','','9144','2011-08-02',NULL,NULL),(35,10,'9000','1st Fit Sample\r\nRevised to Buyer Comments\r\n\r\n2nd Fit Sample\r\nSent by 07/28','하단쪽만 1인찍 늘려 주세요..\r\n디자인 좋습니다.','9144','2011-08-02',NULL,NULL),(36,5,'TEST_01','벨트껀을 4인치 조정했습니다.','벨트껀을 조정해 주세요......','9144','2011-08-02',NULL,NULL),(37,12,'SHD_9003','Teddy New Sample....','','9144','2011-08-02',NULL,NULL),(38,17,'SHD9023NEW','새로운 샘플입니다.','','2000','2011-08-03',NULL,NULL),(39,5,'TEST_01','벨트껀을 4인치 조정했습니다.','벨트껀을 조정해 주세요......','9144','2011-08-03',NULL,NULL),(40,8,'TEST_03','최초샘플입니다.','','9144','2011-08-04',NULL,NULL),(41,17,'SHD9023NEW','새로운 샘플입니다.','하단을 2인치 줄여 주세요.',NULL,NULL,'B9998','2011-08-04'),(42,15,'SHD8990','New Sample','jdgkfjdfgjkdgjkdjkdfgdfg',NULL,NULL,'B9998','2011-08-09'),(43,16,'8990','New Sample','ㅁㄻㄴㅇㄻㄴㄻㄴㄻㄴㅇㄹㄴㅁㅇㄻㄴㄻㄴㄹㄴㅁㄹㄴㄹㄴㄻㄴㅇㄹ',NULL,NULL,'B9998','2011-08-09'),(44,17,'SHD9023NEW','수정했습니다.','하단을 2인치 줄여 주세요.','2000','2011-08-09',NULL,NULL),(45,8,'TEST_03','최초샘플입니다.','수정요청합니다.',NULL,NULL,'B9998','2011-08-09'),(46,8,'TEST_03','2센티 미터 수정했습니다.','수정요청합니다.','2000','2011-08-09',NULL,NULL),(47,17,'SHD9023NEW','수정했습니다.','네..이 디자인으로 오더 요청합니다',NULL,NULL,'B9998','2011-08-09'),(48,18,'SHD9006','New Sample','','9202','2011-08-15',NULL,NULL),(49,21,'WHD7653J','New Sample','','9202','2011-08-15',NULL,NULL),(50,41,'SHV10014','New Sample','','9202','2011-08-15',NULL,NULL),(51,30,'SHT9029','New Sample','','9202','2011-08-15',NULL,NULL),(52,28,'SHP9024','New Sample','','9202','2011-08-16',NULL,NULL),(53,28,'SHP9024','New Sample','','9202','2011-08-16',NULL,NULL),(54,28,'SHP9024','New Sample','','2000','2011-08-16',NULL,NULL),(55,58,'SHD10045','New Sample','','9202','2011-08-16',NULL,NULL),(56,59,'SHD10045A','New Sample','','9202','2011-08-16',NULL,NULL),(57,60,'SHD10045B','New Sample','','9202','2011-08-16',NULL,NULL),(58,61,'SHD10045C','New Sample','','9202','2011-08-16',NULL,NULL),(59,19,'SHD9013','New Sample','','9202','2011-08-16',NULL,NULL),(60,14,'SHD9021','New Sample','','9202','2011-08-16',NULL,NULL),(61,20,'SHD9023','New Sample','','9202','2011-08-16',NULL,NULL),(62,23,'SHD9009','New Sample','','9202','2011-08-16',NULL,NULL),(63,24,'SHD9016','New Sample','','9202','2011-08-16',NULL,NULL),(64,25,'SHD9017','New Sample','','9202','2011-08-16',NULL,NULL),(65,57,'SHP9024','New Sample','','9202','2011-08-16',NULL,NULL),(66,26,'SHD9025','New Sample','','9202','2011-08-16',NULL,NULL),(67,27,'SHD9027','New Sample','','9202','2011-08-16',NULL,NULL),(68,29,'SHT9028','New Sample','','9202','2011-08-16',NULL,NULL),(69,31,'SHD10001','New Sample','','9202','2011-08-16',NULL,NULL),(70,32,'SHD10003','New Sample','','9202','2011-08-16',NULL,NULL),(71,33,'BHJ8287B','New Sample','','9202','2011-08-16',NULL,NULL),(72,34,'SHJ10012','New Sample','','9202','2011-08-16',NULL,NULL),(73,35,'SHD9011','New Sample','','9202','2011-08-16',NULL,NULL),(74,36,'SHD10002','New Sample','','9202','2011-08-16',NULL,NULL),(75,37,'SHD10004','New Sample','','9202','2011-08-16',NULL,NULL),(76,39,'SHT10011A','New Sample','','9202','2011-08-16',NULL,NULL),(77,38,'SHT10011','New Sample','','9202','2011-08-16',NULL,NULL),(78,40,'SHM10013','New Sample','','9202','2011-08-16',NULL,NULL),(79,42,'SHD10016','New Sample','','9202','2011-08-16',NULL,NULL),(80,43,'SHD10019','New Sample','','9202','2011-08-16',NULL,NULL),(81,44,'SHC10020','New Sample','','9202','2011-08-16',NULL,NULL),(82,45,'SHJ10023','New Sample','','9202','2011-08-16',NULL,NULL),(83,46,'SHD10025','New Sample','','9202','2011-08-16',NULL,NULL),(84,47,'SHD10027','New Sample','','9202','2011-08-16',NULL,NULL),(85,48,'SHD10028','New Sample','','9202','2011-08-16',NULL,NULL),(86,49,'SHD10029','New Sample','','9202','2011-08-16',NULL,NULL),(87,50,'SHD10037','New Sample','','9202','2011-08-16',NULL,NULL),(88,54,'SHD10040','New Sample','','9202','2011-08-16',NULL,NULL),(89,51,'SHD10042','New Sample','','9202','2011-08-16',NULL,NULL),(90,53,'SHD10043A','New Sample','','9202','2011-08-16',NULL,NULL),(91,52,'SHD10043','New Sample','','9202','2011-08-16',NULL,NULL),(92,55,'SHD10041','New Sample','','9202','2011-08-16',NULL,NULL),(93,56,'SHD10046','New Sample','','9202','2011-08-16',NULL,NULL),(94,62,'SHJ10026','New Sample','','9202','2011-08-17',NULL,NULL),(95,71,'WHD7653J','New sample','','9202','2011-08-22',NULL,NULL),(96,70,'ST10062','New Sample','','9202','2011-08-22',NULL,NULL),(97,72,'ST10063','New Sample','','9202','2011-08-22',NULL,NULL),(98,73,'SHD10049','New Sample','','9202','2011-08-22',NULL,NULL),(99,73,'SHD10049','New Sample','','9202','2011-08-22',NULL,NULL),(100,74,'SHJ10031','New Sample','','9202','2011-08-22',NULL,NULL),(101,75,'SHD10052','New Sample','','9202','2011-08-22',NULL,NULL),(102,76,'SHD10032','New Sample','','9202','2011-08-22',NULL,NULL),(103,77,'SD10056','New Sample','','9202','2011-08-22',NULL,NULL),(104,78,'SD10056A','New Sample','','9202','2011-08-22',NULL,NULL),(105,80,'SD10057A','New Sample','','9202','2011-08-22',NULL,NULL),(106,79,'SD10057','New Sample','','9202','2011-08-22',NULL,NULL),(107,81,'SD10059','New Sample','','9202','2011-08-22',NULL,NULL),(108,82,'SD10060','New Sample','','9202','2011-08-22',NULL,NULL),(109,83,'ST10054','New Sample','','9202','2011-08-22',NULL,NULL),(110,84,'SD10061','New Sample','','9202','2011-08-22',NULL,NULL),(111,66,'BHD8973B','New Sample','','9202','2011-08-22',NULL,NULL),(112,69,'SHD10038','New Sample','','9202','2011-08-22',NULL,NULL),(113,65,'SHD10035','New Sample','','9202','2011-08-22',NULL,NULL),(114,64,'SHD10034','New Sample','','9202','2011-08-22',NULL,NULL),(115,63,'SHD10033','New Sample','','9202','2011-08-22',NULL,NULL),(116,68,'SHD10053','New Sample','','9202','2011-08-22',NULL,NULL),(117,67,'SR10055','New Sample','','9202','2011-08-22',NULL,NULL),(118,62,'SHJ10026','New Sample','','9202','2011-08-22',NULL,NULL),(119,22,'SHD9026','New Sample','','9202','2011-08-22',NULL,NULL),(120,85,'SHD10039','New Sample','','9202','2011-08-23',NULL,NULL),(121,86,'SD10058','New Sample','','9202','2011-08-23',NULL,NULL),(122,87,'SD10064','New Sample','','9202','2011-08-23',NULL,NULL),(123,88,'SD10068','New Sample','','9202','2011-08-23',NULL,NULL),(124,89,'SD10058A','New Sample','','9202','2011-08-24',NULL,NULL),(125,90,'SD10067','New Sample','','9202','2011-08-24',NULL,NULL),(126,91,'SD10065','New Sample','','9202','2011-08-24',NULL,NULL),(127,92,'SD10069','New Sample','','9202','2011-08-24',NULL,NULL),(128,93,'SD10070','New Sample','','9202','2011-08-24',NULL,NULL),(129,94,'SHD10072','New Sample','','9202','2011-08-24',NULL,NULL),(130,95,'SD10066','New Sample\r\nOffer Price: $7','','9202','2011-08-25',NULL,NULL),(131,96,'SD10073','New Sample\r\nOffer Price: $7.40','','9202','2011-08-25',NULL,NULL),(132,97,'SD10074','New Sample\r\nOffer Price: $6.80','','9202','2011-08-25',NULL,NULL),(133,98,'SD10075','New Sample\r\nOffer Price:$7','','9202','2011-08-25',NULL,NULL),(134,99,'SHV10047','New Sample\r\nOffer Price:$38.70','','9202','2011-08-27',NULL,NULL),(135,100,'SD10076','New Sample\r\nOffer Price: $10.20','','9202','2011-08-27',NULL,NULL),(136,101,'SD10077','New Sample\r\nOffer Price:$7.75','','9202','2011-08-27',NULL,NULL),(137,102,'SS10082','New Sample\r\nOffer Price:$4.10','','9202','2011-08-27',NULL,NULL),(138,103,'SD10084','New Sample\r\nOffer Price:$7.70','','9202','2011-08-27',NULL,NULL),(139,104,'SHJ10008FIT','Fit Sample\r\nOffer Price:$13.15','','9202','2011-08-27',NULL,NULL),(140,105,'SHD8981','Confirm Sample\r\nOffer Price:$9.20','','9202','2011-08-27',NULL,NULL),(141,106,'SD10078','New Sample\r\nOffer Price:$8.60','','9202','2011-08-29',NULL,NULL),(142,107,'SD10079','New Sample\r\nOffer Price:$6.50','','9202','2011-08-29',NULL,NULL),(143,108,'SD10080','New Sample\r\nOffer Price:$8.60','','9202','2011-08-29',NULL,NULL),(144,109,'SD10081','New Sample\r\nOffer Price:$8.00','','9202','2011-08-29',NULL,NULL),(145,110,'SD10086','New Sample\r\nOffer Price:$7.50','','9202','2011-08-29',NULL,NULL),(146,116,'SD10088','New Sample\r\nOffer Price:$7.40','','9202','2011-08-30',NULL,NULL),(147,115,'SD10083','New Sample\r\nOffer Price:$10','','9202','2011-08-30',NULL,NULL),(148,113,'SD10091','New Sample\r\nOffer Price:$8.45','','9202','2011-08-30',NULL,NULL),(149,112,'SR10089','New Sample\r\nOffer Price:$9.95','','9202','2011-08-30',NULL,NULL),(150,111,'SR10090','New Sample\r\nOffer Price:$8.30','','9202','2011-08-30',NULL,NULL),(151,117,'SJ10099','New Sample\r\nOffer Price:$50','','9202','2011-08-30',NULL,NULL),(152,118,'SJ10100','New Sample\r\nOffer Price:$27','','9202','2011-08-30',NULL,NULL),(153,48,'SHD10028','Aug.12th\r\nNew Sample\r\n\r\n\r\nAug.27th\r\nOrange & Pink: Order 900Pcs.\r\n\r\nAug.31st\r\n소매 & 밑단 뻐치는 부분 -1/2\'씩 줄임\r\nCenter Front: 목 라인 헐렁해서 -1\' 줄임\r\n수정된 샘플 발송.','','9202','2011-08-31',NULL,NULL),(154,120,'WHD7354F','July_21\r\nNew Sample 발송\r\n\r\nAug_03\r\nFit Sample발송\r\n\r\nAug_27\r\nSample Color:Order 700Pcs.\r\n\r\nAug_31\r\n목부분 -1/4\'줄임\r\n수정된샘플 발송','','9202','2011-08-31',NULL,NULL),(155,49,'SHD10029','Aug_12\r\nNew Sample발송\r\n\r\nAug_29\r\nBlue&Brown: Order 450Pcs.\r\n\r\nAug_31\r\n수정된샘플 발송','','9202','2011-08-31',NULL,NULL),(156,65,'SHD10035','Aug_16\r\nNew Sample발송\r\n\r\nAug_27\r\nOrange&Grey: Order 300Pcs.\r\n\r\nAug_31\r\n수정된 샘플 발송','','9202','2011-08-31',NULL,NULL),(157,121,'SHD10030','Aug_12\r\nNew Sample발송\r\n\r\nAug_27\r\nBlack&Brown: Order 900Pcs.\r\n\r\nAug_31\r\nSample 발송','','9202','2011-08-31',NULL,NULL),(158,102,'SS10082','Aug_27\r\nNew Sample발송\r\n\r\nSep_03\r\n수정 후 Fit Sample 발송\r\nOffer Price:$4.10','','9202','2011-09-03',NULL,NULL),(159,60,'SHD10045B','Aug_15\r\nNew Sample발송\r\n\r\nSep_03\r\nOrder Sample 발송','','9202','2011-09-03',NULL,NULL),(160,123,'SD10092','Sep_03\r\nNew Sample 발송\r\nOffer Price:$11','','9202','2011-09-03',NULL,NULL),(161,102,'SS10082','Aug_27\r\nNew Sample발송\r\n\r\nSep_03\r\n수정 후 Fit Sample 발송\r\nOffer Price:$4.10','','9202','2011-09-03',NULL,NULL),(162,124,'SD10085','Sep_03\r\nNew Sample발송\r\nOffer Price:$7.80','','9202','2011-09-03',NULL,NULL),(163,125,'SHC9020','Aug_17\r\nFit Sample 발송\r\n\r\nSep_03\r\nOreder Sample 발송\r\nOffer Price:$18.50','','9202','2011-09-03',NULL,NULL),(164,125,'SHC9020','Aug_17\r\nFit Sample 발송\r\n\r\nOffer Price:$18.50','','7000','2011-09-03',NULL,NULL),(165,60,'SHD10045B','Aug_15\r\nNew Sample발송\r\nOffer Price:$7','','7000','2011-09-03',NULL,NULL),(166,2,'78910','바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.','','2000','2012-06-02',NULL,NULL),(167,71,'WHD7653J','New sample.llll','','2000','2012-08-19',NULL,NULL),(168,71,'WHD7653J','New sample.llll','dgdgdgdg',NULL,NULL,'B9998','2012-08-19');
UNLOCK TABLES;
/*!40000 ALTER TABLE `sample_comments` ENABLE KEYS */;

--
-- Table structure for table `sample_history`
--

DROP TABLE IF EXISTS `sample_history`;
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
  PRIMARY KEY  (`SEQUENCE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

--
-- Dumping data for table `sample_history`
--


/*!40000 ALTER TABLE `sample_history` DISABLE KEYS */;
LOCK TABLES `sample_history` WRITE;
INSERT INTO `sample_history` VALUES (1,'78910','2011-06-20','KJKT',1,NULL,'S1001','2011-06-01','0000-00-00','바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.','9144','2011-07-13',NULL,'B9999',NULL,NULL,NULL,'WINTER','1','78910','10',NULL),(2,'78910','2011-06-20','KJKT',1,NULL,'S1001','2011-06-01','0000-00-00','바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.','9144','2011-07-13',NULL,'B9999',NULL,NULL,NULL,'WINTER','1','78910','20',NULL),(3,'TEST_01','2011-07-19','KCRD',1,NULL,'S1001','2011-07-19','2011-07-19','테스트입니다.','9202','2011-07-19',NULL,'B9998',NULL,NULL,NULL,'FW','2','TEST-01','00',NULL),(4,'TEST_01','2011-07-19','KCRD',1,NULL,'S1001','2011-07-19','2011-07-19','바꿔주세요','9202','2011-07-19',NULL,'B9998',NULL,NULL,NULL,'FW','2','TEST-01','00',NULL),(5,'TEST_02','2011-07-21','KCRD',1,NULL,'S1001','2011-07-22','2011-07-22','오늘 받은 오리지널입니다.','2000','2011-07-21',NULL,'B9998',NULL,NULL,NULL,'W','1','TEST-02','00',NULL),(6,'TEST_03','2011-07-21','KCRD',1,NULL,'S1001','2011-07-21','2011-07-21','최초샘플입니다.','9144','2011-07-21',NULL,'B9998',NULL,NULL,NULL,'F/W','1','TEST_03','20',NULL),(7,'TEST_01','2011-07-19','KCRD',1,NULL,'S1001','2011-07-19','2011-07-19','벨트껀을 4인치 조정했습니다.','2000','2011-07-22',NULL,'B9998',NULL,NULL,NULL,'FW','2','TEST-01','',NULL),(8,'9000','2011-07-26','WDRS',1,NULL,'S1001','2011-07-26','2011-07-28','1st Fit Sample\r\nRevised to Buyer Comments','9202','2011-07-26',NULL,'B9998',NULL,NULL,NULL,'F/W2011','1','9000','26',NULL),(9,'9000','2011-07-26','WDRS',1,NULL,'S1001','2011-07-26','2011-07-28','1st Fit Sample\r\nRevised to Buyer Comments\r\n\r\n2nd Fit Sample\r\nSent by 07/28','9202','2011-07-26',NULL,'B9998',NULL,NULL,NULL,'F/W2011','1','9000','26',NULL),(10,'SHD9003','2011-07-27','WDRS',1,NULL,'S1001','2011-07-27','2011-07-29','New Sample','9202','2011-07-27',NULL,'B9998',NULL,NULL,NULL,'F/W2011','1','SHD-9003','00',NULL),(11,'TEST_04','2011-07-21','KDRS',1,NULL,'S1001','2011-07-21','2011-07-21','네..오더관리로 넘겨서 PO 생성 하겠습니다.','2000','2011-07-29',NULL,'B9998',NULL,NULL,NULL,'F/W','2','TEST_04','30',NULL),(12,'TEST_02','2011-07-21','KCRD',1,NULL,'S1001','2011-07-21','2011-07-22','오리지널 샘플입니다.','9144','2011-08-02',NULL,'B9998',NULL,NULL,NULL,'SPRING','1','TEST-02','30',NULL),(13,'TEST_04','2011-07-21','KDRS',1,NULL,'S1001','2011-07-21','2011-07-21','네..오더관리로 넘겨서 PO 생성 하겠습니다.','9144','2011-08-02',NULL,'B9998',NULL,NULL,NULL,'SPRING','2','TEST_04','30',NULL),(14,'TEST_03','2011-07-21','KCRD',1,NULL,'S1001','2011-07-21','2011-07-21','최초샘플입니다.','9144','2011-08-02',NULL,'B9998',NULL,NULL,NULL,'SUMMER','1','TEST_03','20',NULL),(15,'SHD9021','2011-07-28','KDRS',1,NULL,'S1001','2011-07-28','2011-08-01','New Sample','9144','2011-08-02',NULL,'B9998',NULL,NULL,NULL,'AUTUMN','2','SHD9021','00',NULL),(16,'SHD8990','2011-07-29','KDRS',1,NULL,'S1001','2011-07-29','2011-08-01','New Sample','9144','2011-08-02',NULL,'B9998',NULL,NULL,NULL,'SUMMER','2','SHD8990','00',NULL),(17,'9000','2011-07-26','WDRS',1,NULL,'S1001','2011-07-26','2011-07-28','1st Fit Sample\r\nRevised to Buyer Comments\r\n\r\n2nd Fit Sample\r\nSent by 07/28','9144','2011-08-02',NULL,'B9998',NULL,NULL,NULL,'WINTER','1','9000','',NULL),(18,'TEST_01','2011-07-19','KCRD',1,NULL,'S1001','2011-07-19','2011-07-19','벨트껀을 4인치 조정했습니다.','9144','2011-08-02',NULL,'B9998',NULL,NULL,NULL,'AUTUMN','2','TEST-01','',NULL),(19,'SHD_9003','2011-07-28','KDRS',1,NULL,'S1001','2011-07-29','2011-07-30','Teddy New Sample....','9144','2011-08-02',NULL,'B9998',NULL,NULL,NULL,'SUMMER','2','SHD_9003','00',NULL),(20,'SHD9023NEW','2011-08-03','KCRD',1,NULL,'S1001','2011-08-03','2011-08-04','새로운 샘플입니다.','2000','2011-08-03',NULL,'B9998',NULL,NULL,NULL,'SUMMER','1','SHD9023NEW','00',NULL),(21,'TEST_01','2011-07-19','KCRD',1,NULL,'S1001','2011-07-19','2011-07-19','벨트껀을 4인치 조정했습니다.','9144','2011-08-03',NULL,'B9998',NULL,NULL,NULL,'AUTUMN','2','TEST-01','00',NULL),(22,'TEST_03','2011-07-21','KCRD',1,NULL,'S1001','2011-07-21','2011-07-21','최초샘플입니다.','9144','2011-08-04',NULL,'B9998',NULL,NULL,NULL,'SUMMER','1','TEST_03','20',NULL),(23,'SHD9023NEW','2011-08-03','KCRD',1,NULL,'S1001','2011-08-03','2011-08-04','수정했습니다.','2000','2011-08-09',NULL,'B9998',NULL,NULL,NULL,'SUMMER','1','SHD9023NEW','26',NULL),(24,'TEST_03','2011-07-21','KCRD',1,NULL,'S1001','2011-07-21','2011-07-21','2센티 미터 수정했습니다.','2000','2011-08-09',NULL,'B9998',NULL,NULL,NULL,'SUMMER','1','TEST_03','26',NULL),(25,'SHD9006','2011-08-15','WDRS',1,NULL,'S1001','2011-07-30','2011-08-01','New Sample','9202','2011-08-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD9006','20',NULL),(26,'WHD7653J','2011-08-15','WDRS',1,NULL,'S1001','2011-07-30','2011-08-01','New Sample','9202','2011-08-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','WHD7653J','20',NULL),(27,'SHV10014','2011-08-15','KJKT',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHV10014','20',NULL),(28,'SHT9029','2011-08-15','WDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHT9029','20',NULL),(29,'SHP9024','2011-08-15','WPNT',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHP9024','00',NULL),(30,'SHP9024','2011-08-15','WPNT',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHP9024','00',NULL),(31,'SHP9024','2011-08-15','WPNT',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','2000','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHP9024','00',NULL),(32,'SHD10045','2011-08-15','KDRS',1,NULL,'S1001','2011-08-15','2011-08-18','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10045','20',NULL),(33,'SHD10045A','2011-08-15','WDRS',1,NULL,'S1001','2011-08-15','2011-08-18','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10045A','20',NULL),(34,'SHD10045B','2011-08-15','WDRS',1,NULL,'S1001','2011-08-15','2011-08-18','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10045B','20',NULL),(35,'SHD10045C','2011-08-15','WDRS',1,NULL,'S1001','2011-08-15','2011-08-18','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10045C','20',NULL),(36,'SHD9013','2011-08-15','WDRS',1,NULL,'S1001','2011-07-30','2011-08-01','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD9013','20',NULL),(37,'SHD9021','2011-07-28','KDRS',1,NULL,'S1001','2011-07-28','2011-08-01','New Sample','9202','2011-08-16',NULL,'B9998',NULL,NULL,NULL,'AUTUMN','2','SHD9021','20',NULL),(38,'SHD9023','2011-08-15','KDRS',1,NULL,'S1001','2011-07-30','2011-08-01','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD9023','20',NULL),(39,'SHD9009','2011-08-15','WDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD9009','20',NULL),(40,'SHD9016','2011-08-15','WDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD9016','20',NULL),(41,'SHD9017','2011-08-15','KDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD9017','20',NULL),(42,'SHP9024','2011-08-15','WPNT',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHP9024','20',NULL),(43,'SHD9025','2011-08-15','KDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD9025','20',NULL),(44,'SHD9027','2011-08-15','KDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD9027','20',NULL),(45,'SHT9028','2011-08-15','KCRD',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHT9028','20',NULL),(46,'SHD10001','2011-08-15','KDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10001','20',NULL),(47,'SHD10003','2011-08-15','WDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10003','20',NULL),(48,'BHJ8287B','2011-08-15','WDRS',1,NULL,'S1001','2011-08-11','2011-08-15','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','BHJ8287B','20',NULL),(49,'SHJ10012','2011-08-15','WPNT',1,NULL,'S1001','2011-08-11','2011-08-15','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHJ10012','20',NULL),(50,'SHD9011','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD9011','20',NULL),(51,'SHD10002','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10002','20',NULL),(52,'SHD10004','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10004','20',NULL),(53,'SHT10011A','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHT10011A','20',NULL),(54,'SHT10011','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHT10011','20',NULL),(55,'SHM10013','2011-08-15','WTOP',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','3','SHM10013','20',NULL),(56,'SHD10016','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10016','20',NULL),(57,'SHD10019','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10019','20',NULL),(58,'SHC10020','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHC10020','20',NULL),(59,'SHJ10023','2011-08-15','WPNT',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHJ10023','20',NULL),(60,'SHD10025','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10025','20',NULL),(61,'SHD10027','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10027','20',NULL),(62,'SHD10028','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10028','20',NULL),(63,'SHD10029','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10029','20',NULL),(64,'SHD10037','2011-08-15','WPNT',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10037','20',NULL),(65,'SHD10040','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10040','20',NULL),(66,'SHD10042','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10042','20',NULL),(67,'SHD10043A','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10043A','20',NULL),(68,'SHD10043','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10043','20',NULL),(69,'SHD10041','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10041','20',NULL),(70,'SHD10046','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10046','20',NULL),(71,'SHJ10026','2011-08-17','WPNT',1,NULL,'S1001','2011-08-16','2011-08-19','New Sample','9202','2011-08-17',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHJ10026','00',NULL),(72,'WHD7653J','2011-08-22','WDRS',1,NULL,'S1001','2011-08-18','2011-08-20','New sample','9202','2011-08-22',NULL,'B9998',NULL,NULL,NULL,'WINTER','1','WHD7653J','20',NULL),(73,'ST10062','2011-08-22','KCRD',1,NULL,'S1001','2011-08-18','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','ST10062','20',NULL),(74,'ST10063','2011-08-22','KCRD',1,NULL,'S1001','2011-08-18','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','ST10063','20',NULL),(75,'SHD10049','2011-08-22','WPNT',1,NULL,'S1001','2011-08-18','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10049','20',NULL),(76,'SHD10049','2011-08-22','WDRS',1,NULL,'S1001','2011-08-18','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10049','20',NULL),(77,'SHJ10031','2011-08-22','WPNT',1,NULL,'S1001','2011-08-18','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHJ10031','20',NULL),(78,'SHD10052','2011-08-22','WDRS',1,NULL,'S1001','2011-08-18','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10052','20',NULL),(79,'SHD10032','2011-08-22','KDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10032','20',NULL),(80,'SD10056','2011-08-22','KDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10056','20',NULL),(81,'SD10056A','2011-08-22','WDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10056A','20',NULL),(82,'SD10057A','2011-08-22','KDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10057A','20',NULL),(83,'SD10057','2011-08-22','KDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10057','20',NULL),(84,'SD10059','2011-08-22','WDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10059','20',NULL),(85,'SD10060','2011-08-22','KDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10060','20',NULL),(86,'ST10054','2011-08-22','KTOP',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','ST10054','20',NULL),(87,'SD10061','2011-08-22','WDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10061','20',NULL),(88,'BHD8973B','2011-08-17','WDRS',1,NULL,'S1001','2011-08-17','2011-08-20','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','BHD8973B','20',NULL),(89,'SHD10038','2011-08-17','WDRS',1,NULL,'S1001','2011-08-17','2011-08-20','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10038','20',NULL),(90,'SHD10035','2011-08-17','KDRS',1,NULL,'S1001','2011-08-16','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10035','20',NULL),(91,'SHD10034','2011-08-17','KDRS',1,NULL,'S1001','2011-08-16','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10034','20',NULL),(92,'SHD10033','2011-08-17','KDRS',1,NULL,'S1001','2011-08-16','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10033','20',NULL),(93,'SHD10053','2011-08-17','WDRS',1,NULL,'S1001','2011-08-17','2011-08-20','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10053','20',NULL),(94,'SR10055','2011-08-17','WPNT',1,NULL,'S1001','2011-08-17','2011-08-20','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SR10055','20',NULL),(95,'SHJ10026','2011-08-17','WPNT',1,NULL,'S1001','2011-08-16','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHJ10026','20',NULL),(96,'SHD9026','2011-08-15','KDRS',1,NULL,'S1001','2011-07-30','2011-08-01','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD9026','20',NULL),(97,'SHD10039','2011-08-23','WDRS',1,NULL,'S1001','2011-08-23','2011-08-25','New Sample','9202','2011-08-23',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10039','20',NULL),(98,'SD10058','2011-08-23','WDRS',1,NULL,'S1001','2011-08-23','2011-08-25','New Sample','9202','2011-08-23',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10058','20',NULL),(99,'SD10064','2011-08-23','WDRS',1,NULL,'S1001','2011-08-23','2011-08-25','New Sample','9202','2011-08-23',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10064','20',NULL),(100,'SD10068','2011-08-23','KDRS',1,NULL,'S1001','2011-08-23','2011-08-25','New Sample','9202','2011-08-23',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10068','20',NULL),(101,'SD10058A','2011-08-24','WDRS',1,NULL,'S1001','2011-08-24','2011-08-27','New Sample','9202','2011-08-24',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10058A','20',NULL),(102,'SD10067','2011-08-24','WDRS',1,NULL,'S1001','2011-08-24','2011-08-27','New Sample','9202','2011-08-24',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10067','20',NULL),(103,'SD10065','2011-08-24','KDRS',1,NULL,'S1001','2011-08-24','2011-08-27','New Sample','9202','2011-08-24',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10065','20',NULL),(104,'SD10069','2011-08-24','KDRS',1,NULL,'S1001','2011-08-24','2011-08-27','New Sample','9202','2011-08-24',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10069','20',NULL),(105,'SD10070','2011-08-24','WDRS',1,NULL,'S1001','2011-08-24','2011-08-27','New Sample','9202','2011-08-24',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10070','20',NULL),(106,'SHD10072','2011-08-24','WDRS',1,NULL,'S1001','2011-08-24','2011-08-27','New Sample','9202','2011-08-24',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10072','20',NULL),(107,'SD10066','2011-08-25','KDRS',1,NULL,'S1001','2011-08-25','2011-08-29','New Sample\r\nOffer Price: $7','9202','2011-08-25',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10066','20',NULL),(108,'SD10073','2011-08-25','WDRS',1,NULL,'S1001','2011-08-25','2011-08-29','New Sample\r\nOffer Price: $7.40','9202','2011-08-25',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','7USD','20',NULL),(109,'SD10074','2011-08-25','KDRS',1,NULL,'S1001','2011-08-25','2011-08-29','New Sample\r\nOffer Price: $6.80','9202','2011-08-25',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10074','20',NULL),(110,'SD10075','2011-08-25','WDRS',1,NULL,'S1001','2011-08-25','2011-08-29','New Sample\r\nOffer Price:$7','9202','2011-08-25',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10075','20',NULL),(111,'SHV10047','2011-08-27','WJKT',1,NULL,'S1001','2011-08-27','2011-08-31','New Sample\r\nOffer Price:$38.70','9202','2011-08-27',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHV10047','20',NULL),(112,'SD10076','2011-08-27','KDRS',1,NULL,'S1001','2011-08-27','2011-08-31','New Sample\r\nOffer Price: $10.20','9202','2011-08-27',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10076','20',NULL),(113,'SD10077','2011-08-27','WDRS',1,NULL,'S1001','2011-08-27','2011-08-31','New Sample\r\nOffer Price:$7.75','9202','2011-08-27',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10077','20',NULL),(114,'SS10082','2011-08-27','WSKT',1,NULL,'S1001','2011-08-27','2011-08-31','New Sample\r\nOffer Price:$4.10','9202','2011-08-27',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SS10082','20',NULL),(115,'SD10084','2011-08-27','KDRS',1,NULL,'S1001','2011-08-27','2011-08-31','New Sample\r\nOffer Price:$7.70','9202','2011-08-27',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10084','20',NULL),(116,'SHJ10008FIT','2011-08-27','WJKT',1,NULL,'S1001','2011-08-27','2011-08-31','Fit Sample\r\nOffer Price:$13.15','9202','2011-08-27',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHJ10008FIT','20',NULL),(117,'SHD8981','2011-08-27','KDRS',1,NULL,'S1001','2011-08-27','2011-08-31','Confirm Sample\r\nOffer Price:$9.20','9202','2011-08-27',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD8981','20',NULL),(118,'SD10078','2011-08-29','WDRS',1,NULL,'S1001','2011-08-29','2011-09-01','New Sample\r\nOffer Price:$8.60','9202','2011-08-29',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10078','20',NULL),(119,'SD10079','2011-08-29','KDRS',1,NULL,'S1001','2011-08-29','2011-09-01','New Sample\r\nOffer Price:$6.50','9202','2011-08-29',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10079','20',NULL),(120,'SD10080','2011-08-29','WDRS',1,NULL,'S1001','2011-08-29','2011-09-01','New Sample\r\nOffer Price:$8.60','9202','2011-08-29',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10080','20',NULL),(121,'SD10081','2011-08-29','WPNT',1,NULL,'S1001','2011-08-29','2011-09-01','New Sample\r\nOffer Price:$8.00','9202','2011-08-29',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10081','20',NULL),(122,'SD10086','2011-08-29','KDRS',1,NULL,'S1001','2011-08-29','2011-09-01','New Sample\r\nOffer Price:$7.50','9202','2011-08-29',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10086','20',NULL),(123,'SD10088','2011-08-30','WDRS',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$7.40','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10088','20',NULL),(124,'SD10083','2011-08-30','WDRS',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$10','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10083','20',NULL),(125,'SD10091','2011-08-30','WDRS',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$8.45','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10091','20',NULL),(126,'SR10089','2011-08-30','WPNT',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$9.95','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SR10089','20',NULL),(127,'SR10090','2011-08-30','WPNT',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$8.30','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SR10090','20',NULL),(128,'SJ10099','2011-08-30','KJKT',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$50','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SJ10099','20',NULL),(129,'SJ10100','2011-08-30','KJKT',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$27','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SJ10100','20',NULL),(130,'SHD10028','2011-08-15','KDRS',1,NULL,'S1001','2011-08-31','2011-09-02','Aug.12th\r\nNew Sample\r\n\r\n\r\nAug.27th\r\nOrange & Pink: Order 900Pcs.\r\n\r\nAug.31st\r\n소매 & 밑단 뻐치는 부분 -1/2\'씩 줄임\r\nCenter Front: 목 라인 헐렁해서 -1\' 줄임\r\n수정된 샘플 발송.','9202','2011-08-31',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10028','26',NULL),(131,'WHD7354F','2011-08-31','KDRS',1,NULL,'S1001','2011-08-31','2011-09-02','July_21\r\nNew Sample 발송\r\n\r\nAug_03\r\nFit Sample발송\r\n\r\nAug_27\r\nSample Color:Order 700Pcs.\r\n\r\nAug_31\r\n목부분 -1/4\'줄임\r\n수정된샘플 발송','9202','2011-08-31',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','WHD7354F','26',NULL),(132,'SHD10029','2011-08-15','KDRS',1,NULL,'S1001','2011-08-31','2011-09-02','Aug_12\r\nNew Sample발송\r\n\r\nAug_29\r\nBlue&Brown: Order 450Pcs.\r\n\r\nAug_31\r\n수정된샘플 발송','9202','2011-08-31',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10029','26',NULL),(133,'SHD10035','2011-08-17','KDRS',1,NULL,'S1001','2011-08-31','2011-09-02','Aug_16\r\nNew Sample발송\r\n\r\nAug_27\r\nOrange&Grey: Order 300Pcs.\r\n\r\nAug_31\r\n수정된 샘플 발송','9202','2011-08-31',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10035','26',NULL),(134,'SHD10030','2011-08-31','KDRS',1,NULL,'S1001','2011-08-31','2011-09-02','Aug_12\r\nNew Sample발송\r\n\r\nAug_27\r\nBlack&Brown: Order 900Pcs.\r\n\r\nAug_31\r\nSample 발송','9202','2011-08-31',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10030','26',NULL),(135,'SS10082','2011-08-27','WSKT',1,NULL,'S1001','2011-09-03','2011-08-09','Aug_27\r\nNew Sample발송\r\n\r\nSep_03\r\n수정 후 Fit Sample 발송\r\nOffer Price:$4.10','9202','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SS10082','26',NULL),(136,'SHD10045B','2011-08-15','WDRS',1,NULL,'S1001','2011-09-03','2011-09-06','Aug_15\r\nNew Sample발송\r\n\r\nSep_03\r\nOrder Sample 발송','9202','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10045B','26',NULL),(137,'SD10092','2011-09-03','KDRS',1,NULL,'S1001','2011-09-03','2011-09-06','Sep_03\r\nNew Sample 발송\r\nOffer Price:$11','9202','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10092','20',NULL),(138,'SS10082','2011-08-27','WSKT',1,NULL,'S1001','2011-09-03','2011-08-09','Aug_27\r\nNew Sample발송\r\n\r\nSep_03\r\n수정 후 Fit Sample 발송\r\nOffer Price:$4.10','9202','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SS10082','26',NULL),(139,'SD10085','2011-09-03','WDRS',1,NULL,'S1001','2011-09-03','2011-09-06','Sep_03\r\nNew Sample발송\r\nOffer Price:$7.80','9202','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10085','20',NULL),(140,'SHC9020','2011-08-17','KJKT',1,NULL,'S1001','2011-09-03','2011-09-06','Aug_17\r\nFit Sample 발송\r\n\r\nSep_03\r\nOreder Sample 발송\r\nOffer Price:$18.50','9202','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHC9020','20',NULL),(141,'SHC9020','2011-08-17','KJKT',1,NULL,'S1001','2011-09-03','2011-09-06','Aug_17\r\nFit Sample 발송\r\n\r\nOffer Price:$18.50','7000','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHC9020','20',NULL),(142,'SHD10045B','2011-08-15','WDRS',1,NULL,'S1001','2011-08-15','2011-08-18','Aug_15\r\nNew Sample발송\r\nOffer Price:$7','7000','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10045B','26',NULL),(143,'78910','2011-06-20','KJKT',1,NULL,'S1001','2011-06-01','0000-00-00','바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.','2000','2012-06-02',NULL,'B9998',NULL,NULL,NULL,'WINTER','1','78910','20',NULL),(144,'WHD7653J','2011-08-22','WDRS',1,NULL,'S1001','2011-08-18','2011-08-20','New sample.llll','2000','2012-08-19',NULL,'B9998',NULL,NULL,NULL,'WINTER','1','WHD7653J','26',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `sample_history` ENABLE KEYS */;

--
-- Table structure for table `scm_notice_01t`
--

DROP TABLE IF EXISTS `scm_notice_01t`;
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

--
-- Dumping data for table `scm_notice_01t`
--


/*!40000 ALTER TABLE `scm_notice_01t` DISABLE KEYS */;
LOCK TABLES `scm_notice_01t` WRITE;
INSERT INTO `scm_notice_01t` VALUES (5,'2011-05-10','9144','Jeffrey H Song','관리자 공지사항입니다.','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;</p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"4\" color=\"#004080\"><b>세빈 SCM 오신 것을 환영합니다!</b></font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;</p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"4\" color=\"#0080C0\"><b><img src=\"http://www.sebin2098.com/admin/notice/upload/sbscm.jpg\" border=\"0\"></b></font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;</p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;<font color=\"#FF8000\"><b>SCM( Supply Chain Management ) 이란? </b></font></p>\r\n\r\n<p align=\"left\">Supply-Chain Management </p>\r\n\r\n<p align=\"left\">기업 내 또는 기업 간의 다양한 사업활동의 프로세스와 부문간·부서간에 존재하는 벽을 넘어서 \r\n\r\n수주에서부터 고객 납품에 이르기까지 상품 공급의 흐름을 효율적으로 잘 관리하는 것 </p>\r\n\r\n<p align=\"left\">최적화된 SCM은 제품을 생산하는 기업이 부품의 구매, 제조, 판매까지의 모든 일정을 수립하고 \r\n\r\n고객의 수요계획 및 물류현황을 체계적으로 정리함으로써 제품의 흐름 (부가가치 물자흐름)을 원활하고 효율적으로 수행할 수 있게 한다. </p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;<img src=\"http://www.sebin2098.com/admin/notice/upload/sebin_process.jpg\" border=\"0\"></p>\r\n\r\n</body>\r\n',1301,'9144','2012-06-01');
UNLOCK TABLES;
/*!40000 ALTER TABLE `scm_notice_01t` ENABLE KEYS */;

--
-- Table structure for table `scm_notice_02t`
--

DROP TABLE IF EXISTS `scm_notice_02t`;
CREATE TABLE `scm_notice_02t` (
  `NOTICE_SEQNO` int(10) NOT NULL,
  `SEQNO` int(10) NOT NULL,
  `ATTACH_FILE` varchar(300) default NULL,
  `ATTACH_REAL_FILE` varchar(300) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scm_notice_02t`
--


/*!40000 ALTER TABLE `scm_notice_02t` DISABLE KEYS */;
LOCK TABLES `scm_notice_02t` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `scm_notice_02t` ENABLE KEYS */;

--
-- Table structure for table `shipment_01t`
--

DROP TABLE IF EXISTS `shipment_01t`;
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

--
-- Dumping data for table `shipment_01t`
--


/*!40000 ALTER TABLE `shipment_01t` DISABLE KEYS */;
LOCK TABLES `shipment_01t` WRITE;
INSERT INTO `shipment_01t` VALUES ('125522','B0326','2012-08-19','05','2012-08-30','SEA','02','B0326_BL_125522.pdf','B0326_IV_125522.pdf','B0326_PL_125522.pdf','N',NULL,NULL,NULL,'2012-08-19','S1001','2000');
UNLOCK TABLES;
/*!40000 ALTER TABLE `shipment_01t` ENABLE KEYS */;

--
-- Table structure for table `shipment_02t`
--

DROP TABLE IF EXISTS `shipment_02t`;
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

--
-- Dumping data for table `shipment_02t`
--


/*!40000 ALTER TABLE `shipment_02t` DISABLE KEYS */;
LOCK TABLES `shipment_02t` WRITE;
INSERT INTO `shipment_02t` VALUES ('PO201210006','232442','125522','S1001','SPRING','FOB',300,'3000.0000','2012-08-19','2000','B0326');
UNLOCK TABLES;
/*!40000 ALTER TABLE `shipment_02t` ENABLE KEYS */;

--
-- Table structure for table `subpurchase_order_line`
--

DROP TABLE IF EXISTS `subpurchase_order_line`;
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

--
-- Dumping data for table `subpurchase_order_line`
--


/*!40000 ALTER TABLE `subpurchase_order_line` DISABLE KEYS */;
LOCK TABLES `subpurchase_order_line` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `subpurchase_order_line` ENABLE KEYS */;

--
-- Table structure for table `t1`
--

DROP TABLE IF EXISTS `t1`;
CREATE TABLE `t1` (
  `col1` date default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t1`
--


/*!40000 ALTER TABLE `t1` DISABLE KEYS */;
LOCK TABLES `t1` WRITE;
INSERT INTO `t1` VALUES ('0000-00-00'),('0000-00-00');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t1` ENABLE KEYS */;

--
-- Table structure for table `t_memo_01t`
--

DROP TABLE IF EXISTS `t_memo_01t`;
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

--
-- Dumping data for table `t_memo_01t`
--


/*!40000 ALTER TABLE `t_memo_01t` DISABLE KEYS */;
LOCK TABLES `t_memo_01t` WRITE;
INSERT INTO `t_memo_01t` VALUES (1,'9144','송행렬인가','2011-05-10','1','테스트 한글',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">테스트 한글테스트 한글테스트 한글테스트 한글테스트 한글테스트 한글</font></p>\r\n\r\n</body>\r\n'),(2,'9144','송행렬인가','2011-05-10','1','이번주 공지사항입니다.','anz[0].pdf','<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\n\n\n\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">이번주 공지사항입니다. 업무에 참고히시기 바랍니다.</font></p>\n\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">이번주 공지사항입니다. 업무에 참고히시기 바랍니다.</font></p>\n\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">이번주 공지사항입니다. 업무에 참고히시기 바랍니다.</font></p>\n\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">이번주 공지사항입니다. 업무에 참고히시기 바랍니다.</font></p>\n\n</body>'),(3,'9144','Jeffrey H Song','2011-05-23','1','SEBIN SCM 입니다.',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\"><img src=\"http://www.sebin2098.com/memo/upload/gbn2.gif\" border=\"0\"></font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\"><b>세빈 SCM에 오신 것을 환영합니다!</b></font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\">&nbsp;</p>\r\n\r\n</body>\r\n'),(4,'2000','배상갑','2011-07-18','1','공지사항 테스트 입니다. ',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">내부 테스트를 위한 바이어 공지사항 테스트 입니다. </font></p>\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\"><img src=\"http://www.sebin2098.com/memo/upload/sbscm.jpg\" border=\"0\"></font></p>\r\n\r\n</body>\r\n\r\n'),(5,'9144','Jeffrey H Song','2011-08-16','1','테스트 게시판',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">테스트 게시판테스트 게시판테스트 게시판</font></p>\r\n\r\n</body>\r\n'),(6,'9144','Jeffrey H Song','2011-08-16','1','공지 테스트',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">바이어 공지 테스트 입니다.</font></p>\r\n\r\n</body>\r\n'),(7,'9144','Jeffrey H Song','2012-06-01','1','title',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">testing</font></p>\r\n\r\n</body>\r\n'),(8,'2000','Sebin SCM','2012-06-02','0','test',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">test</font></p>\r\n\r\n</body>\r\n'),(9,'2000','Sebin SCM','2012-06-02','0','Message from Melbourne',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">Melbourne</font></p>\r\n\r\n</body>\r\n'),(10,'2000','Sebin SCM','2012-07-24','0','welcome',NULL,'<body bgcolor=\"white\" text=\"black\" link=\"blue\" vlink=\"purple\" alink=\"red\">\r\n\r\n\r\n\r\n<p style=\"line-height:120%; margin-top:0; margin-bottom:0;\"><font face=\"Arial\" size=\"2\">thank you</font></p>\r\n\r\n</body>\r\n');
UNLOCK TABLES;
/*!40000 ALTER TABLE `t_memo_01t` ENABLE KEYS */;

--
-- Table structure for table `user_02t`
--

DROP TABLE IF EXISTS `user_02t`;
CREATE TABLE `user_02t` (
  `SCMID` varchar(10) NOT NULL,
  `IPADDRESS` varchar(20) default NULL,
  `LOGINTIME` date default NULL,
  `PASSWORD` varchar(40) default NULL,
  `LOGINNAME` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_02t`
--


/*!40000 ALTER TABLE `user_02t` DISABLE KEYS */;
LOCK TABLES `user_02t` WRITE;
INSERT INTO `user_02t` VALUES ('B1001','10.2.1.161','2011-05-25','1234','USA RETAIL LIMITED.'),('b1001','10.2.1.161','2011-05-25','1234','USA RETAIL LIMITED.'),('B1001','10.2.1.161','2011-05-25','1234','USA RETAIL LIMITED.'),('B1001','10.2.1.161','2011-05-25','1234','USA RETAIL LIMITED.'),('B1001','10.2.1.161','2011-05-26','1233','USA RETAIL LIMITED.'),('b1001','58.106.238.45','2011-05-28','1233','USA RETAIL LIMITED.'),('B1002','58.106.238.45','2011-06-03','1234','LIT LIMITED GUANGZHOU'),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-03','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-07','1233','HOT & DELICIOUS '),('B9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('B9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('B9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('b9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('b9999','10.2.1.161','2011-06-08','1234','BUYER(TEST)'),('B1001','175.39.77.33','2011-06-13','1233','HOT & DELICIOUS '),('B1001','175.39.77.33','2011-06-13','1233','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-14','1111','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-14','1111','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-14','1111','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-16','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-16','1234','HOT & DELICIOUS '),('b1001','10.2.1.161','2011-06-16','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-21','1234','HOT & DELICIOUS '),('b1001','10.2.1.161','2011-06-21','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-24','1234','HOT & DELICIOUS '),('b1001','10.2.1.161','2011-06-24','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-27','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-27','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-27','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-27','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-29','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-29','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','10.2.1.161','2011-06-30','1234','HOT & DELICIOUS '),('B1001','219.136.88.251','2011-07-11','1234','HOT & DELICIOUS '),('B1001','219.136.88.251','2011-07-11','1234','HOT & DELICIOUS '),('B1001','219.136.88.251','2011-07-11','1234','HOT & DELICIOUS '),('B1001','219.136.81.195','2011-07-11','1234','HOT & DELICIOUS '),('B1001','113.68.195.157','2011-07-12','1234','HOT & DELICIOUS '),('B9999','113.68.197.150','2011-07-18','1234','BUYER(TEST)'),('B9998','113.68.197.150','2011-07-18','1111','BAESANGGAB_TEST'),('B9999','113.68.197.150','2011-07-18','1234','BUYER(TEST)'),('B9998','113.68.197.150','2011-07-18','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.197.150','2011-07-18','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.197.150','2011-07-18','gavi1004','BAESANGGAB_TEST'),('B1001','115.64.22.118','2011-07-20','1234','HOT & DELICIOUS '),('B9998','113.68.193.93','2011-07-21','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.93','2011-07-21','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.192.146','2011-07-21','gavi1004','BAESANGGAB_TEST'),('B9998','60.242.24.38','2011-07-21','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.93','2011-07-22','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.192.146','2011-07-22','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.93','2011-07-22','gavi1004','BAESANGGAB_TEST'),('B9998','60.242.24.38','2011-07-22','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.188.191','2011-07-23','gavi1004','BAESANGGAB_TEST'),('B9998','60.240.34.201','2011-07-25','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.217.55','2011-07-25','gavi1004','BAESANGGAB_TEST'),('B9998','60.242.24.38','2011-07-25','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.195.145','2011-07-26','gavi1004','BAESANGGAB_TEST'),('B9998','115.64.22.118','2011-07-26','gavi1004','BAESANGGAB_TEST'),('B9998','115.64.22.72','2011-07-26','gavi1004','BAESANGGAB_TEST'),('B9998','60.240.34.201','2011-07-26','gavi1004','BAESANGGAB_TEST'),('B9999','115.64.22.72','2011-07-27','1234','BUYER(TEST)'),('B9999','60.242.24.38','2011-07-27','1234','BUYER(TEST)'),('B9999','115.64.22.118','2011-07-27','1234','BUYER(TEST)'),('B9999','115.64.22.118','2011-07-27','1234','BUYER(TEST)'),('B9999','60.242.24.38','2011-07-27','1234','BUYER(TEST)'),('B9998','60.242.24.38','2011-07-27','gavi1004','BAESANGGAB_TEST'),('B9998','115.64.22.72','2011-07-27','gavi1004','BAESANGGAB_TEST'),('b9999','60.242.24.38','2011-07-27','1234','BUYER(TEST)'),('B9998','60.242.24.38','2011-07-27','gavi1004','BAESANGGAB_TEST'),('B1002','60.242.24.38','2011-07-27','1234','LIT LIMITED GUANGZHOU'),('B9998','113.68.198.239','2011-07-29','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.198.239','2011-07-29','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.218.131','2011-08-01','gavi1004','BAESANGGAB_TEST'),('B9998','115.64.22.72','2011-08-01','gavi1004','BAESANGGAB_TEST'),('B9998','113.66.46.114','2011-08-02','gavi1004','BAESANGGAB_TEST'),('B9998','115.64.22.72','2011-08-02','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.189.184','2011-08-03','gavi1004','BAESANGGAB_TEST'),('B9998','60.240.34.201','2011-08-03','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.203.169','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9997','113.68.189.184','2011-08-04','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.203.169','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.189.184','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9997','113.68.189.184','2011-08-04','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.189.184','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9997','113.68.203.169','2011-08-04','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9998','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9997','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9998','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_TEST'),('B9997','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_ARGENTINA '),('B9997','113.66.47.39','2011-08-04','gavi1004','BAESANGGAB_ARGENTINA '),('B9999','115.64.22.239','2011-08-08','1234','BUYER(TEST)'),('B9999','115.64.22.239','2011-08-08','1234','BUYER(TEST)'),('B9997','113.68.193.109','2011-08-08','gavi1004','BAESANGGAB_ARGENTINA '),('B9997','113.68.193.109','2011-08-08','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.193.109','2011-08-08','gavi1004','BAESANGGAB_TEST'),('B9997','113.68.193.109','2011-08-08','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.193.109','2011-08-08','gavi1004','BAESANGGAB_TEST'),('B9997','113.68.193.109','2011-08-08','gavi1004','BAESANGGAB_ARGENTINA '),('B9997','112.90.147.30','2011-08-09','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','112.90.147.30','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9998','112.90.147.30','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9999','115.64.22.72','2011-08-09','1234','BUYER(TEST)'),('B9998','115.64.22.72','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9999','115.64.22.72','2011-08-09','1234','BUYER(TEST)'),('B9999','115.64.22.239','2011-08-09','1234','BUYER(TEST)'),('B9997','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9999','115.64.22.239','2011-08-09','1234','BUYER(TEST)'),('B9997','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9999','115.64.22.118','2011-08-09','1234','BUYER(TEST)'),('B9997','113.68.202.35','2011-08-09','gavi1004','BAESANGGAB_ARGENTINA '),('B9998','113.68.202.35','2011-08-09','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-10','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-10','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-10','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.193.109','2011-08-10','gavi1004','BAESANGGAB_TEST'),('B9998','113.68.197.13','2011-08-10','gavi1004','BAESANGGAB_TEST'),('B9998','60.240.34.201','2011-08-10','gavi1004','BAESANGGAB_TEST'),('B1001','113.68.192.255','2011-08-16','1234','HOT & DELICIOUS '),('B1001','113.68.192.255','2011-08-16','1111','HOT & DELICIOUS '),('B1001','113.68.192.255','2011-08-16','1234','HOT & DELICIOUS '),('B1001','115.64.22.72','2011-08-16','1234','HOT & DELICIOUS '),('B9999','115.64.22.72','2011-08-16','1234','BUYER(TEST)'),('B9999','115.64.22.72','2011-08-16','1111','BUYER(TEST)'),('B9997','113.68.202.98','2011-08-17','gavi1004','BAESANGGAB_ARGENTINA '),('B1001','113.68.202.98','2011-08-17','1234','HOT & DELICIOUS '),('B1001','113.68.202.98','2011-08-17','1234','HOT & DELICIOUS '),('B1001','113.68.202.98','2011-08-17','1234','HOT & DELICIOUS '),('B1001','112.90.147.27','2011-08-17','1234','HOT & DELICIOUS '),('B1001','113.68.202.98','2011-08-17','1234','HOT & DELICIOUS '),('B1001','113.68.202.98','2011-08-17','1234','HOT & DELICIOUS '),('B1001','113.68.202.98','2011-08-18','1234','HOT & DELICIOUS '),('B1001','113.66.46.200','2011-08-19','1234','HOT & DELICIOUS '),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.200.113','2011-08-23','gavi1004','ARGENTIN_TEMPORARY'),('B1001','115.64.22.239','2011-08-23','1234','HOT & DELICIOUS '),('B9997','113.68.205.168','2011-08-24','gavi1004','ARGENTIN_TEMPORARY'),('B9998','113.68.205.168','2011-08-24','gavi1004','H&D_TEMPORARY'),('B9997','113.68.205.168','2011-08-24','gavi1004','ARGENTIN_TEMPORARY'),('B1001','113.68.219.177','2011-09-15','1234','HOT & DELICIOUS '),('B1001','113.68.219.177','2011-09-15','1234','HOT & DELICIOUS '),('B9998','113.68.219.177','2011-09-15','gavi1004','H&D_TEMPORARY'),('B9997','113.68.219.177','2011-09-15','gavi1004','ARGENTIN_TEMPORARY'),('B9997','113.68.219.177','2011-09-15','gavi1004','ARGENTIN_TEMPORARY'),('B1001','113.68.219.177','2011-09-15','1234','HOT & DELICIOUS '),('B9997','113.68.219.177','2011-09-15','gavi1004','ARGENTIN_TEMPORARY'),('B1001','113.68.219.177','2011-09-15','1234','HOT & DELICIOUS '),('B1001','113.68.219.177','2011-09-17','1234','HOT & DELICIOUS '),('B1001','76.170.253.116','2011-09-24','1234','HOT & DELICIOUS '),('B1001','76.170.253.116','2011-09-27','1234','HOT & DELICIOUS '),('B1001','76.170.253.116','2011-09-27','1234','HOT & DELICIOUS '),('B9999','117.120.18.132','2012-04-04','1234','BUYER(TEST)'),('B9999','123.98.136.31','2012-06-02','1111','BUYER(TEST)'),('B1001','60.242.24.38','2012-06-04','1234','HOT & DELICIOUS '),('B9999','58.179.206.67','2012-06-07','sb369','BUYER(TEST)'),('B9999','58.179.206.67','2012-06-10','sb369','BUYER(TEST)'),('B9999','58.179.207.208','2012-06-10','sb369','BUYER(TEST)'),('b1001','61.97.255.45','2012-06-15','1234','HOT & DELICIOUS '),('B9999','210.50.232.217','2012-06-16','sb369','BUYER(TEST)'),('B9999','210.50.232.217','2012-06-16','sb369','BUYER(TEST)'),('B9999','210.50.232.217','2012-06-16','sb369','BUYER(TEST)'),('B9999','210.50.232.217','2012-06-19','sb369','BUYER(TEST)'),('B9999','210.50.232.217','2012-06-20','sb369','BUYER(TEST)'),('B9999','210.50.232.217','2012-06-21','sb369','BUYER(TEST)'),('B9999','210.50.232.217','2012-06-23','sb369','BUYER(TEST)'),('B9999','116.240.136.160','2012-06-26','sb369','BUYER(TEST)'),('B9999','116.240.136.160','2012-06-28','sb369','BUYER(TEST)'),('B9999','116.240.136.160','2012-07-03','sb369','BUYER(TEST)'),('B9999','116.240.136.160','2012-07-03','sb369','BUYER(TEST)'),('B9999','116.240.136.160','2012-07-04','sb369','BUYER(TEST)'),('B9999','116.240.136.160','2012-07-05','sb369','BUYER(TEST)'),('B9999','58.106.225.162','2012-07-15','sb369','BUYER(TEST)'),('B9999','116.240.136.185','2012-07-24','sb369','BUYER(TEST)'),('B3308','116.240.136.185','2012-07-24','1111','MELBOURNE'),('B0326','58.106.240.38','2012-07-24','1111','HIKARU'),('B0326','58.106.240.38','2012-07-24','0326','HIKARU'),('B0326','58.106.249.254','2012-08-03','0326','HIKARU'),('B0326','58.106.249.254','2012-08-03','0326','HIKARU'),('B9999','58.179.174.241','2012-08-14','sb369','BUYER(TEST)'),('B9998','58.106.238.88','2012-08-19','gavi1004','H&D_TEMPORARY'),('B0326','58.106.238.88','2012-08-19','0326','HIKARU'),('B1001','58.106.238.88','2012-08-19','1234','HOT & DELICIOUS ');
UNLOCK TABLES;
/*!40000 ALTER TABLE `user_02t` ENABLE KEYS */;

--
-- Table structure for table `vg_common_code`
--

DROP TABLE IF EXISTS `vg_common_code`;
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

--
-- Dumping data for table `vg_common_code`
--


/*!40000 ALTER TABLE `vg_common_code` DISABLE KEYS */;
LOCK TABLES `vg_common_code` WRITE;
INSERT INTO `vg_common_code` VALUES ('COUNTRY_CODE','Country Code','0',NULL,'Y',NULL,NULL,NULL,NULL),('CURRENCY','CURRENCY TYPE','0',NULL,'Y',NULL,NULL,NULL,NULL),('FORWARDER','Nominated Forwarder','0',NULL,'Y',NULL,NULL,NULL,NULL),('MATERIAL','Marerial','0',NULL,NULL,NULL,NULL,NULL,NULL),('ORDER_STATUS','Order Status','0',NULL,'Y',NULL,NULL,NULL,NULL),('PGR','Product Group','0',NULL,'Y',NULL,NULL,NULL,NULL),('SAMPLE','Sample Manager','0',NULL,NULL,NULL,NULL,NULL,NULL),('SEASON','SEASON','0',NULL,'Y',NULL,NULL,NULL,NULL),('SGR','Product Sub group','0',NULL,'Y',NULL,NULL,NULL,NULL),('SHIPPING_PORT','Shipping Port','0',NULL,'Y',NULL,NULL,NULL,NULL),('SHIP_TYPE','Ship Type','0',NULL,'Y',NULL,NULL,NULL,NULL),('SUB_MAT','Sub-Material','0','원가관리용','Y',NULL,NULL,NULL,NULL),('TRANS_TYPE','Shipping Type','0',NULL,NULL,NULL,NULL,NULL,NULL),('USER_CLASS','User Class','0',NULL,'Y',NULL,NULL,NULL,NULL),('USER_GROUP','User Group','0',NULL,'Y',NULL,NULL,NULL,NULL),('USER_TYPE','User Type','0',NULL,'Y',NULL,NULL,NULL,NULL),('AU','Australia','COUNTRY_CODE',NULL,'Y','9144',NULL,6,NULL),('BD','Bangladesh','COUNTRY_CODE',NULL,'Y','9144',NULL,8,NULL),('CN','CHINA','COUNTRY_CODE','','Y','9144','2011-05-23',2,''),('HK','Hongkong','COUNTRY_CODE',NULL,'Y','9144',NULL,3,NULL),('IN','India','COUNTRY_CODE',NULL,'Y','9144',NULL,7,NULL),('KR','KOREA','COUNTRY_CODE',NULL,'Y','9144',NULL,4,NULL),('MN','Mongolia','COUNTRY_CODE',NULL,'Y','9144',NULL,9,NULL),('PH','Philippines','COUNTRY_CODE',NULL,'Y','9144',NULL,10,NULL),('PK','Pakistan','COUNTRY_CODE',NULL,'Y','9144',NULL,11,NULL),('TW','Taiwan','COUNTRY_CODE',NULL,'Y','9144',NULL,12,NULL),('US','USA','COUNTRY_CODE',NULL,'Y','9144',NULL,1,NULL),('VN','Vietnam','COUNTRY_CODE',NULL,'Y','9144',NULL,5,NULL),('AUD','AUD','CURRENCY','','Y','2000','2012-07-24',7,''),('CNY','CNY','CURRENCY',NULL,'Y','9144',NULL,6,NULL),('EUR','EUR','CURRENCY',NULL,'Y','9144',NULL,3,NULL),('GBP','GBP','CURRENCY',NULL,'Y','9144',NULL,5,NULL),('HKD','HKD','CURRENCY',NULL,'Y','9144',NULL,NULL,NULL),('JPY','JPY','CURRENCY',NULL,'Y','9144',NULL,2,NULL),('KRW','KRW','CURRENCY',NULL,'Y','9144',NULL,4,NULL),('USD','USD','CURRENCY',NULL,'Y','9144',NULL,1,NULL),('01','Capricon Logistics','FORWARDER',NULL,'Y',NULL,NULL,NULL,'IN'),('02','Coreana Co','FORWARDER',NULL,'Y',NULL,NULL,NULL,'CN'),('03','SGL Universal Co','FORWARDER',NULL,'Y',NULL,NULL,NULL,'CN'),('04','Alliance','FORWARDER',NULL,'Y',NULL,NULL,NULL,'IN'),('05','Wings Air Cargo Co','FORWARDER',NULL,'Y',NULL,NULL,NULL,'BD'),('06','TNT China','FORWARDER',NULL,'Y',NULL,NULL,NULL,'CN'),('07','TNT India','FORWARDER',NULL,'Y',NULL,NULL,NULL,'IN'),('08','Explorer Freight Co','FORWARDER',NULL,'Y',NULL,NULL,NULL,'PH'),('10','WOVEN-Xlylon','MATERIAL','','Y','2000','2011-07-29',10,''),('00','CREATED','ORDER_STATUS',NULL,'Y','9144',NULL,10,NULL),('10','ORIGINAL SAMPLE','ORDER_STATUS',NULL,'Y','9144',NULL,11,NULL),('20','Sent Sample','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','2000','2012-06-16',12,''),('22','RECEIVED SAMPLE','ORDER_STATUS','','Y','2000','2012-06-19',13,''),('24','REQUEST TO MODIFY DESIGN','ORDER_STATUS','바이어로 부터 세빈담당자에게 e-mail발송됨','Y','2000','2012-06-19',14,''),('26','Edit Sample','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','9144','2011-06-03',15,''),('30','Confirm Design','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','9144','2011-06-03',16,''),('35','Request Order','ORDER_STATUS','Supplier에게 e-mail발송됨','Y','9144','2011-07-29',17,''),('40','Requested PO-Confirm','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','2000','2012-06-16',18,''),('45','PO-Confirm & Produce','ORDER_STATUS','바이어로 부터 세빈담당자에게 e-mail발송됨','Y','2000','2012-06-19',19,''),('50','PP SAMPLE','ORDER_STATUS',NULL,'Y','9144',NULL,20,NULL),('55','PP CONFIRM','ORDER_STATUS',NULL,'Y','9144',NULL,21,NULL),('60','Request Production','ORDER_STATUS',NULL,'Y','9144',NULL,22,NULL),('65','Request to Contractor','ORDER_STATUS',NULL,'Y','9144',NULL,23,NULL),('70','Produce TOP','ORDER_STATUS',NULL,'Y','9144',NULL,24,NULL),('73','Complete Production','ORDER_STATUS',NULL,'Y','9144',NULL,24,NULL),('75','Create Shipment','ORDER_STATUS',NULL,'Y','9144',NULL,24,NULL),('80','Shipping Out','ORDER_STATUS',NULL,'Y','9144',NULL,25,NULL),('85','STORED IN WAREHOUSE','ORDER_STATUS','','Y','2000','2012-06-19',26,''),('90','Create Invoice','ORDER_STATUS',NULL,'Y','9144',NULL,27,NULL),('92','Issue Invoice','ORDER_STATUS',NULL,'Y','9144',NULL,28,NULL),('94','Receive Invoice','ORDER_STATUS',NULL,'Y','9144',NULL,29,NULL),('96','Payment','ORDER_STATUS',NULL,'Y','9144',NULL,30,NULL),('98','Confirm Deposit','ORDER_STATUS',NULL,'Y','9144',NULL,31,NULL),('99','Payment Complete','ORDER_STATUS',NULL,'Y','9144',NULL,32,NULL),('999','CANCLE ORDER','ORDER_STATUS','Buyer에게 e-mail발송됨','Y','2000','2012-06-19',33,''),('1','WOVEN','PGR',NULL,'Y','9144',NULL,5,NULL),('2','KNIT','PGR',NULL,'Y',NULL,NULL,10,NULL),('3','ACCESSORY','PGR',NULL,'Y',NULL,NULL,20,NULL),('9144','JEFFREY SONG','SAMPLE','Jeffrey.song@ffb.net.au','Y','9144',NULL,10,NULL),('AUTUMN','AUTUMN','SEASON',NULL,'Y','9144',NULL,30,NULL),('SPRING','SPRING','SEASON',NULL,'Y','9144',NULL,10,NULL),('SUMMER','SUMMER','SEASON',NULL,'Y','9144',NULL,20,NULL),('WINTER','WINTER','SEASON',NULL,'Y','9144',NULL,40,NULL),('KCRD','Knit-Cardigan','SGR',NULL,'Y',NULL,NULL,540,'2'),('KDRS','Knit-Dress','SGR',NULL,'Y',NULL,NULL,560,'2'),('KJKT','Knit-Jacket','SGR',NULL,'Y',NULL,NULL,570,'2'),('KPNT','Knit-Pants','SGR','','Y','2000','2011-08-17',580,'1'),('KTOP','Knit-Top','SGR',NULL,'Y',NULL,NULL,520,'2'),('WBLS','Woven-Blouse','SGR',NULL,'Y',NULL,NULL,360,'1'),('WDRS','Woven-Dress','SGR',NULL,'Y',NULL,NULL,310,'1'),('WJKT','Woven-Jacket','SGR',NULL,'Y',NULL,NULL,370,'1'),('WPNT','Woven-Pants','SGR',NULL,'Y',NULL,NULL,490,'1'),('WSHT','Woven-Shirt','SGR',NULL,'Y',NULL,NULL,340,'1'),('WSKT','Woven-Skirt','SGR',NULL,'Y',NULL,NULL,450,'1'),('WTOP','Woven-Top','SGR',NULL,'Y',NULL,NULL,280,'1'),('01','Bangladesh','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'BD'),('02','Chennai','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'IN'),('03','Dalian','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('04','Hangzhou','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('05','Guangzhou','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('06','Hanoi','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'VN'),('07','Hochimin','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'VN'),('08','Honkong','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'HK'),('09','Incheon','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'KR'),('10','Jaipur','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'IN'),('11','KICT','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'PK'),('12','Mongolia','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'MN'),('13','Mumbai','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'IN'),('14','New Delhi','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'IN'),('15','PICT','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'PK'),('16','Pusan','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'KR'),('17','Qingdao','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('18','Shanghai','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('19','Shenzhen','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'CN'),('20','Taipei','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'TW'),('21','Manila','SHIPPING_PORT',NULL,'Y',NULL,NULL,NULL,'PH'),('CIF','CIF','SHIP_TYPE','','Y','2000','2011-08-23',30,''),('CMT','CMT','SHIP_TYPE',NULL,'Y','9144',NULL,20,NULL),('FOB','FOB','SHIP_TYPE',NULL,'Y','9144',NULL,10,NULL),('S10','Button','SUB_MAT','','Y','9144','2011-05-27',10,''),('S20','Rubber Band','SUB_MAT','','Y','9144','2011-05-27',20,''),('S30','Zipper','SUB_MAT','','Y','9144','2011-05-27',30,''),('S40','Hanger Loop','SUB_MAT','','Y','9144','2011-05-27',40,''),('AIR','AIR','TRANS_TYPE',NULL,'Y','9144',NULL,20,NULL),('SEA','SEA','TRANS_TYPE',NULL,'Y','9144',NULL,10,NULL),('1','Apparel','USER_CLASS',NULL,'Y',NULL,NULL,10,NULL),('2','Non-Apparel','USER_CLASS',NULL,'Y',NULL,NULL,20,NULL),('A','System Admin Group','USER_GROUP',NULL,'Y','9144',NULL,10,'0'),('B','PO Admin Group','USER_GROUP',NULL,'Y','9144',NULL,30,'H'),('C','Account','USER_GROUP',NULL,'Y',NULL,NULL,60,'C'),('D','PO INUPT=YES','USER_GROUP','','Y','9144','2011-07-27',80,'S'),('F','PO INPUT=NO','USER_GROUP','','Y','9144','2011-07-27',90,'S'),('M','QC','USER_GROUP',NULL,'Y','9144',NULL,50,'C'),('N','General User Group','USER_GROUP',NULL,'Y','9144',NULL,20,'H'),('S','Shipping','USER_GROUP',NULL,'Y',NULL,NULL,70,'C'),('H','Sebin Staff','USER_TYPE',NULL,'Y','9144',NULL,10,'H'),('S','Buyer','USER_TYPE',NULL,'Y','9144',NULL,20,'S');
UNLOCK TABLES;
/*!40000 ALTER TABLE `vg_common_code` ENABLE KEYS */;

--
-- Table structure for table `vg_inspector`
--

DROP TABLE IF EXISTS `vg_inspector`;
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

--
-- Dumping data for table `vg_inspector`
--


/*!40000 ALTER TABLE `vg_inspector` DISABLE KEYS */;
LOCK TABLES `vg_inspector` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `vg_inspector` ENABLE KEYS */;

--
-- Table structure for table `vg_sample_in_out`
--

DROP TABLE IF EXISTS `vg_sample_in_out`;
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

--
-- Dumping data for table `vg_sample_in_out`
--


/*!40000 ALTER TABLE `vg_sample_in_out` DISABLE KEYS */;
LOCK TABLES `vg_sample_in_out` WRITE;
INSERT INTO `vg_sample_in_out` VALUES (1,'12345','2011-05-17','KDRS',1,NULL,'S1001','2011-05-24','0000-00-00','주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','9144','2011-06-14',NULL,'B1001',NULL,'jeffrey.song@ffb.net.au','Jeffrey.song@ffb.net.au','SPRING','1','54321','22','바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다 바이어 컨멘트입니다','12345_SAMPLE SHEET.doc','12345_REQUEST SHEET.doc','12345_AMEND SHEET.doc'),(2,'78910','2011-06-20','KJKT',1,NULL,'S1001','2011-06-01','0000-00-00','바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.\r\n바이어에게 주고 받을 내용을 이곳에 기입합니다.','2000','2012-06-02',NULL,'B9998',NULL,NULL,NULL,'WINTER','1','78910','20',NULL,NULL,NULL,NULL),(3,'99999','2011-06-08','WSKT',1,NULL,'S1001','2011-06-10','0000-00-00','Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시\r\n주) Status를 \'Sample발송\', \'Sample수정\',\'디자인 확정\'으로 변경시 해당 Buyer에게 e-mail이 자동으로 발송이 됩니다.','9144','2011-06-30',NULL,'B9999',NULL,NULL,NULL,'SUMMER','1','99999','20',NULL,NULL,NULL,NULL),(5,'TEST_01','2011-07-19','KCRD',1,NULL,'S1001','2011-07-19','2011-07-19','벨트껀을 4인치 조정했습니다.','9144','2011-08-03',NULL,'B9998',NULL,'ceo@sebin2098.com','Jeffrey.song@ffb.net.au','AUTUMN','2','TEST-01','00','벨트껀을 조정해 주세요......',NULL,NULL,NULL),(7,'TEST_02','2011-07-21','KCRD',1,NULL,'S1001','2011-07-21','2011-07-22','오리지널 샘플입니다.','9144','2011-08-02',NULL,'B9998',NULL,'ceo@sebin2098.com','Jeffrey.song@ffb.net.au','SPRING','1','TEST-02','30','밑에 하단을 수정해 주세요..\r\n수정해 주셨으면 합니다.',NULL,NULL,NULL),(8,'TEST_03','2011-07-21','KCRD',1,NULL,'S1001','2011-07-21','2011-07-21','2센티 미터 수정했습니다.','2000','2011-08-09',NULL,'B9998',NULL,'ceo@sebin2098.com','Jeffrey.song@ffb.net.au','SUMMER','1','TEST_03','26','수정요청합니다.',NULL,NULL,NULL),(9,'TEST_04','2011-07-21','KDRS',1,NULL,'S1001','2011-07-21','2011-07-21','네..오더관리로 넘겨서 PO 생성 하겠습니다.','9144','2011-08-02',NULL,'B9998',NULL,'ceo@sebin2098.com','Jeffrey.song@ffb.net.au','SPRING','2','TEST_04','30','네..좋습니다. 생산해 주세요.',NULL,NULL,NULL),(10,'9000','2011-07-26','WDRS',1,NULL,'S1001','2011-07-26','2011-07-28','1st Fit Sample\r\nRevised to Buyer Comments\r\n\r\n2nd Fit Sample\r\nSent by 07/28','9144','2011-08-02',NULL,'B9998',NULL,'ceo@sebin2098.com','Jeffrey.song@ffb.net.au','WINTER','1','9000','','하단쪽만 1인찍 늘려 주세요..\r\n디자인 좋습니다.',NULL,NULL,NULL),(12,'SHD_9003','2011-07-28','KDRS',1,NULL,'S1001','2011-07-29','2011-07-30','Teddy New Sample....','9144','2011-08-02',NULL,'B9998',NULL,NULL,NULL,'SUMMER','2','SHD_9003','00',NULL,NULL,NULL,NULL),(13,'SHD8991','2011-07-28','KDRS',1,NULL,'S1001','2011-07-28','2011-07-30','USA Fabric\r\nNew Sample','9202','2011-07-28',NULL,'B9998',NULL,NULL,NULL,'FW2011','2','SHD8991','00',NULL,NULL,NULL,NULL),(14,'SHD9021','2011-07-28','KDRS',1,NULL,'S1001','2011-07-28','2011-08-01','New Sample','9202','2011-08-16',NULL,'B9998',NULL,NULL,NULL,'AUTUMN','2','SHD9021','20',NULL,NULL,NULL,NULL),(15,'SHD8990','2011-07-29','KDRS',1,NULL,'S1001','2011-07-29','2011-08-01','New Sample','9144','2011-08-02',NULL,'B9998',NULL,'ceo@sebin2098.com','Jeffrey.song@ffb.net.au','SUMMER','2','SHD8990','24','jdgkfjdfgjkdgjkdjkdfgdfg',NULL,NULL,NULL),(16,'8990','2011-07-29','KDRS',1,NULL,'S1001','2011-07-29','2011-07-31','New Sample','9202','2011-07-29',NULL,'B9998',NULL,'ceo@sebin2098.com','Jeffrey.song@ffb.net.au','FW2011','2','8990','24','ㅁㄻㄴㅇㄻㄴㄻㄴㄻㄴㅇㄹㄴㅁㅇㄻㄴㄻㄴㄹㄴㅁㄹㄴㄹㄴㄻㄴㅇㄹ',NULL,NULL,NULL),(17,'SHD9023NEW','2011-08-03','KCRD',1,NULL,'S1001','2011-08-03','2011-08-10','수정했습니다.','2000','2011-08-09',NULL,'B9998',NULL,'ceo@sebin2098.com','Jeffrey.song@ffb.net.au','SUMMER','1','SHD9023NEW','35','네..이 디자인으로 오더 요청합니다',NULL,NULL,NULL),(18,'SHD9006','2011-08-15','WDRS',1,NULL,'S1001','2011-07-30','2011-08-01','New Sample','9202','2011-08-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD9006','20',NULL,NULL,NULL,NULL),(19,'SHD9013','2011-08-15','WDRS',1,NULL,'S1001','2011-07-30','2011-08-01','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD9013','20',NULL,NULL,NULL,NULL),(20,'SHD9023','2011-08-15','KDRS',1,NULL,'S1001','2011-07-30','2011-08-01','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD9023','20',NULL,NULL,NULL,NULL),(21,'WHD7653J','2011-08-15','WDRS',1,NULL,'S1001','2011-07-30','2011-08-01','New Sample','9202','2011-08-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','WHD7653J','20',NULL,NULL,NULL,NULL),(22,'SHD9026','2011-08-15','KDRS',1,NULL,'S1001','2011-07-30','2011-08-01','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD9026','20',NULL,NULL,NULL,NULL),(23,'SHD9009','2011-08-15','WDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD9009','20',NULL,NULL,NULL,NULL),(24,'SHD9016','2011-08-15','WDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD9016','20',NULL,NULL,NULL,NULL),(25,'SHD9017','2011-08-15','KDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD9017','20',NULL,NULL,NULL,NULL),(26,'SHD9025','2011-08-15','KDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD9025','20',NULL,NULL,NULL,NULL),(27,'SHD9027','2011-08-15','KDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD9027','20',NULL,NULL,NULL,NULL),(29,'SHT9028','2011-08-15','KCRD',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHT9028','20',NULL,NULL,NULL,NULL),(30,'SHT9029','2011-08-15','WDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHT9029','20',NULL,NULL,NULL,NULL),(31,'SHD10001','2011-08-15','KDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10001','20',NULL,NULL,NULL,NULL),(32,'SHD10003','2011-08-15','WDRS',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10003','20',NULL,NULL,NULL,NULL),(33,'BHJ8287B','2011-08-15','WDRS',1,NULL,'S1001','2011-08-11','2011-08-15','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','BHJ8287B','20',NULL,NULL,NULL,NULL),(34,'SHJ10012','2011-08-15','WPNT',1,NULL,'S1001','2011-08-11','2011-08-15','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHJ10012','20',NULL,NULL,NULL,NULL),(35,'SHD9011','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD9011','20',NULL,NULL,NULL,NULL),(36,'SHD10002','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10002','20',NULL,NULL,NULL,NULL),(37,'SHD10004','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10004','20',NULL,NULL,NULL,NULL),(38,'SHT10011','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHT10011','20',NULL,NULL,NULL,NULL),(39,'SHT10011A','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHT10011A','20',NULL,NULL,NULL,NULL),(40,'SHM10013','2011-08-15','WTOP',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','3','SHM10013','20',NULL,NULL,NULL,NULL),(41,'SHV10014','2011-08-15','KJKT',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHV10014','20',NULL,NULL,NULL,NULL),(42,'SHD10016','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10016','20',NULL,NULL,NULL,NULL),(43,'SHD10019','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10019','20',NULL,NULL,NULL,NULL),(44,'SHC10020','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHC10020','20',NULL,NULL,NULL,NULL),(45,'SHJ10023','2011-08-15','WPNT',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHJ10023','20',NULL,NULL,NULL,NULL),(46,'SHD10025','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10025','20',NULL,NULL,NULL,NULL),(47,'SHD10027','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10027','20',NULL,NULL,NULL,NULL),(48,'SHD10028','2011-08-15','KDRS',1,NULL,'S1001','2011-08-31','2011-09-02','Aug.12th\r\nNew Sample\r\n\r\n\r\nAug.27th\r\nOrange & Pink: Order 900Pcs.\r\n\r\nAug.31st\r\n소매 & 밑단 뻐치는 부분 -1/2\'씩 줄임\r\nCenter Front: 목 라인 헐렁해서 -1\' 줄임\r\n수정된 샘플 발송.','9202','2011-08-31',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10028','26',NULL,NULL,'SHD10028_10028_Confirm.pdf',NULL),(49,'SHD10029','2011-08-15','KDRS',1,NULL,'S1001','2011-08-31','2011-09-02','Aug_12\r\nNew Sample발송\r\n\r\nAug_29\r\nBlue&Brown: Order 450Pcs.\r\n\r\nAug_31\r\n수정된샘플 발송','9202','2011-08-31',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10029','26',NULL,NULL,NULL,NULL),(50,'SHD10037','2011-08-15','WPNT',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10037','20',NULL,NULL,NULL,NULL),(51,'SHD10042','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10042','20',NULL,NULL,NULL,NULL),(52,'SHD10043','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10043','20',NULL,NULL,NULL,NULL),(53,'SHD10043A','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10043A','20',NULL,NULL,NULL,NULL),(54,'SHD10040','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10040','20',NULL,NULL,NULL,NULL),(55,'SHD10041','2011-08-15','WDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10041','20',NULL,NULL,NULL,NULL),(56,'SHD10046','2011-08-15','KDRS',1,NULL,'S1001','2011-08-12','2011-08-16','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10046','20',NULL,NULL,NULL,NULL),(57,'SHP9024','2011-08-15','WPNT',1,NULL,'S1001','2011-08-03','2011-08-06','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHP9024','20',NULL,NULL,NULL,NULL),(58,'SHD10045','2011-08-15','KDRS',1,NULL,'S1001','2011-08-15','2011-08-18','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10045','20',NULL,NULL,NULL,NULL),(59,'SHD10045A','2011-08-15','WDRS',1,NULL,'S1001','2011-08-15','2011-08-18','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10045A','20',NULL,NULL,NULL,NULL),(60,'SHD10045B','2011-08-15','WDRS',1,NULL,'S1001','2011-08-15','2011-08-18','Aug_15\r\nNew Sample발송\r\nOffer Price:$7','7000','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10045B','26',NULL,NULL,NULL,NULL),(61,'SHD10045C','2011-08-15','WDRS',1,NULL,'S1001','2011-08-15','2011-08-18','New Sample','9202','2011-08-16',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10045C','20',NULL,NULL,NULL,NULL),(62,'SHJ10026','2011-08-17','WPNT',1,NULL,'S1001','2011-08-16','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHJ10026','20',NULL,NULL,NULL,NULL),(63,'SHD10033','2011-08-17','KDRS',1,NULL,'S1001','2011-08-16','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10033','20',NULL,NULL,NULL,NULL),(64,'SHD10034','2011-08-17','KDRS',1,NULL,'S1001','2011-08-16','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10034','20',NULL,NULL,NULL,NULL),(65,'SHD10035','2011-08-17','KDRS',1,NULL,'S1001','2011-08-31','2011-09-02','Aug_16\r\nNew Sample발송\r\n\r\nAug_27\r\nOrange&Grey: Order 300Pcs.\r\n\r\nAug_31\r\n수정된 샘플 발송','9202','2011-08-31',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10035','26',NULL,NULL,NULL,NULL),(66,'BHD8973B','2011-08-17','WDRS',1,NULL,'S1001','2011-08-17','2011-08-20','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','BHD8973B','20',NULL,NULL,NULL,NULL),(67,'SR10055','2011-08-17','WPNT',1,NULL,'S1001','2011-08-17','2011-08-20','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SR10055','20',NULL,NULL,NULL,NULL),(68,'SHD10053','2011-08-17','WDRS',1,NULL,'S1001','2011-08-17','2011-08-20','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10053','20',NULL,NULL,NULL,NULL),(69,'SHD10038','2011-08-17','WDRS',1,NULL,'S1001','2011-08-17','2011-08-20','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10038','20',NULL,NULL,NULL,NULL),(70,'ST10062','2011-08-22','KCRD',1,NULL,'S1001','2011-08-18','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','ST10062','20',NULL,NULL,NULL,NULL),(71,'WHD7653J','2011-08-22','WDRS',1,NULL,'S1001','2011-08-18','2011-08-20','New sample.llll','2000','2012-08-19',NULL,'B9998',NULL,'ceo@sebin2098.com','Jeffrey.song@ffb.net.au','WINTER','1','WHD7653J','24','dgdgdgdg',NULL,NULL,NULL),(72,'ST10063','2011-08-22','KCRD',1,NULL,'S1001','2011-08-18','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','ST10063','20',NULL,NULL,NULL,NULL),(73,'SHD10049','2011-08-22','WDRS',1,NULL,'S1001','2011-08-18','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10049','20',NULL,NULL,NULL,NULL),(74,'SHJ10031','2011-08-22','WPNT',1,NULL,'S1001','2011-08-18','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHJ10031','20',NULL,NULL,NULL,NULL),(75,'SHD10052','2011-08-22','WDRS',1,NULL,'S1001','2011-08-18','2011-08-19','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10052','20',NULL,NULL,NULL,NULL),(76,'SHD10032','2011-08-22','KDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10032','20',NULL,NULL,NULL,NULL),(77,'SD10056','2011-08-22','KDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10056','20',NULL,NULL,NULL,NULL),(78,'SD10056A','2011-08-22','WDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10056A','20',NULL,NULL,NULL,NULL),(79,'SD10057','2011-08-22','KDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10057','20',NULL,NULL,NULL,NULL),(80,'SD10057A','2011-08-22','KDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10057A','20',NULL,NULL,NULL,NULL),(81,'SD10059','2011-08-22','WDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10059','20',NULL,NULL,NULL,NULL),(82,'SD10060','2011-08-22','KDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10060','20',NULL,NULL,NULL,NULL),(83,'ST10054','2011-08-22','KTOP',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','ST10054','20',NULL,NULL,NULL,NULL),(84,'SD10061','2011-08-22','WDRS',1,NULL,'S1001','2011-08-20','2011-08-23','New Sample','9202','2011-08-22',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10061','20',NULL,NULL,NULL,NULL),(85,'SHD10039','2011-08-23','WDRS',1,NULL,'S1001','2011-08-23','2011-08-25','New Sample','9202','2011-08-23',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10039','20',NULL,NULL,NULL,NULL),(86,'SD10058','2011-08-23','WDRS',1,NULL,'S1001','2011-08-23','2011-08-25','New Sample','9202','2011-08-23',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10058','20',NULL,NULL,NULL,NULL),(87,'SD10064','2011-08-23','WDRS',1,NULL,'S1001','2011-08-23','2011-08-25','New Sample','9202','2011-08-23',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10064','20',NULL,NULL,NULL,NULL),(88,'SD10068','2011-08-23','KDRS',1,NULL,'S1001','2011-08-23','2011-08-25','New Sample','9202','2011-08-23',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10068','20',NULL,NULL,NULL,NULL),(89,'SD10058A','2011-08-24','WDRS',1,NULL,'S1001','2011-08-24','2011-08-27','New Sample','9202','2011-08-24',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10058A','20',NULL,NULL,NULL,NULL),(90,'SD10067','2011-08-24','WDRS',1,NULL,'S1001','2011-08-24','2011-08-27','New Sample','9202','2011-08-24',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10067','20',NULL,NULL,NULL,NULL),(91,'SD10065','2011-08-24','KDRS',1,NULL,'S1001','2011-08-24','2011-08-27','New Sample','9202','2011-08-24',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10065','20',NULL,NULL,NULL,NULL),(92,'SD10069','2011-08-24','KDRS',1,NULL,'S1001','2011-08-24','2011-08-27','New Sample','9202','2011-08-24',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10069','20',NULL,NULL,NULL,NULL),(93,'SD10070','2011-08-24','WDRS',1,NULL,'S1001','2011-08-24','2011-08-27','New Sample','9202','2011-08-24',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10070','20',NULL,NULL,NULL,NULL),(94,'SHD10072','2011-08-24','WDRS',1,NULL,'S1001','2011-08-24','2011-08-27','New Sample','9202','2011-08-24',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10072','20',NULL,NULL,NULL,NULL),(95,'SD10066','2011-08-25','KDRS',1,NULL,'S1001','2011-08-25','2011-08-29','New Sample\r\nOffer Price: $7','9202','2011-08-25',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10066','20',NULL,NULL,NULL,NULL),(96,'SD10073','2011-08-25','WDRS',1,NULL,'S1001','2011-08-25','2011-08-29','New Sample\r\nOffer Price: $7.40','9202','2011-08-25',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','7USD','20',NULL,NULL,NULL,NULL),(97,'SD10074','2011-08-25','KDRS',1,NULL,'S1001','2011-08-25','2011-08-29','New Sample\r\nOffer Price: $6.80','9202','2011-08-25',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10074','20',NULL,NULL,NULL,NULL),(98,'SD10075','2011-08-25','WDRS',1,NULL,'S1001','2011-08-25','2011-08-29','New Sample\r\nOffer Price:$7','9202','2011-08-25',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10075','20',NULL,NULL,NULL,NULL),(99,'SHV10047','2011-08-27','WJKT',1,NULL,'S1001','2011-08-27','2011-08-31','New Sample\r\nOffer Price:$38.70','9202','2011-08-27',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHV10047','20',NULL,NULL,NULL,NULL),(100,'SD10076','2011-08-27','KDRS',1,NULL,'S1001','2011-08-27','2011-08-31','New Sample\r\nOffer Price: $10.20','9202','2011-08-27',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10076','20',NULL,NULL,NULL,NULL),(101,'SD10077','2011-08-27','WDRS',1,NULL,'S1001','2011-08-27','2011-08-31','New Sample\r\nOffer Price:$7.75','9202','2011-08-27',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10077','20',NULL,NULL,NULL,NULL),(102,'SS10082','2011-08-27','WSKT',1,NULL,'S1001','2011-09-03','2011-08-09','Aug_27\r\nNew Sample발송\r\n\r\nSep_03\r\n수정 후 Fit Sample 발송\r\nOffer Price:$4.10','9202','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SS10082','26',NULL,NULL,NULL,NULL),(103,'SD10084','2011-08-27','KDRS',1,NULL,'S1001','2011-08-27','2011-08-31','New Sample\r\nOffer Price:$7.70','9202','2011-08-27',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10084','20',NULL,NULL,NULL,NULL),(105,'SHD8981','2011-08-27','KDRS',1,NULL,'S1001','2011-08-27','2011-08-31','Confirm Sample\r\nOffer Price:$9.20','9202','2011-08-27',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD8981','20',NULL,NULL,NULL,NULL),(106,'SD10078','2011-08-29','WDRS',1,NULL,'S1001','2011-08-29','2011-09-01','New Sample\r\nOffer Price:$8.60','9202','2011-08-29',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10078','20',NULL,NULL,NULL,NULL),(107,'SD10079','2011-08-29','KDRS',1,NULL,'S1001','2011-08-29','2011-09-01','New Sample\r\nOffer Price:$6.50','9202','2011-08-29',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10079','20',NULL,NULL,NULL,NULL),(108,'SD10080','2011-08-29','WDRS',1,NULL,'S1001','2011-08-29','2011-09-01','New Sample\r\nOffer Price:$8.60','9202','2011-08-29',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10080','20',NULL,NULL,NULL,NULL),(109,'SD10081','2011-08-29','WPNT',1,NULL,'S1001','2011-08-29','2011-09-01','New Sample\r\nOffer Price:$8.00','9202','2011-08-29',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10081','20',NULL,NULL,NULL,NULL),(110,'SD10086','2011-08-29','KDRS',1,NULL,'S1001','2011-08-29','2011-09-01','New Sample\r\nOffer Price:$7.50','9202','2011-08-29',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10086','20',NULL,NULL,NULL,NULL),(111,'SR10090','2011-08-30','WPNT',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$8.30','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SR10090','20',NULL,NULL,NULL,NULL),(112,'SR10089','2011-08-30','WPNT',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$9.95','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SR10089','20',NULL,NULL,NULL,NULL),(113,'SD10091','2011-08-30','WDRS',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$8.45','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10091','20',NULL,NULL,NULL,NULL),(114,'SD10087','2011-08-30','KDRS',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10087','00',NULL,NULL,NULL,NULL),(115,'SD10083','2011-08-30','WDRS',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$10','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10083','20',NULL,NULL,NULL,NULL),(116,'SD10088','2011-08-30','WDRS',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$7.40','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10088','20',NULL,NULL,NULL,NULL),(117,'SJ10099','2011-08-30','KJKT',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$50','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SJ10099','20',NULL,NULL,NULL,NULL),(118,'SJ10100','2011-08-30','KJKT',1,NULL,'S1001','2011-08-30','2011-09-02','New Sample\r\nOffer Price:$27','9202','2011-08-30',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SJ10100','20',NULL,NULL,NULL,NULL),(120,'WHD7354F','2011-08-31','KDRS',1,NULL,'S1001','2011-08-31','2011-09-02','July_21\r\nNew Sample 발송\r\n\r\nAug_03\r\nFit Sample발송\r\n\r\nAug_27\r\nSample Color:Order 700Pcs.\r\n\r\nAug_31\r\n목부분 -1/4\'줄임\r\n수정된샘플 발송','9202','2011-08-31',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','WHD7354F','26',NULL,NULL,NULL,NULL),(121,'SHD10030','2011-08-31','KDRS',1,NULL,'S1001','2011-08-31','2011-09-02','Aug_12\r\nNew Sample발송\r\n\r\nAug_27\r\nBlack&Brown: Order 900Pcs.\r\n\r\nAug_31\r\nSample 발송','9202','2011-08-31',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10030','26',NULL,NULL,NULL,NULL),(122,'SHJ10008','2011-08-31','KJKT',1,NULL,'S1001','2011-08-27','2011-08-30','Aug_6\r\nNew Sample 발송\r\n\r\nAug_27\r\nFit Sample 발송\r\n\r\nOffer Price:$13.15','9202','2011-08-31',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHJ10008','00',NULL,NULL,NULL,NULL),(123,'SD10092','2011-09-03','KDRS',1,NULL,'S1001','2011-09-03','2011-09-06','Sep_03\r\nNew Sample 발송\r\nOffer Price:$11','9202','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SD10092','20',NULL,NULL,NULL,NULL),(124,'SD10085','2011-09-03','WDRS',1,NULL,'S1001','2011-09-03','2011-09-06','Sep_03\r\nNew Sample발송\r\nOffer Price:$7.80','9202','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10085','20',NULL,NULL,NULL,NULL),(125,'SHC9020','2011-08-17','KJKT',1,NULL,'S1001','2011-09-03','2011-09-06','Aug_17\r\nFit Sample 발송\r\n\r\nOffer Price:$18.50','7000','2011-09-03',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHC9020','20',NULL,NULL,NULL,NULL),(126,'SHD10045F','2011-09-05','KDRS',1,NULL,'S1001','2011-09-05','2011-09-08','Sep_05\r\nNew Sample 발송','7000','2011-09-05',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','SHD10045F','00',NULL,NULL,NULL,NULL),(127,'SHD10045E','2011-09-05','WDRS',1,NULL,'S1001','2011-09-05','2011-09-08','Sep_05\r\nNew Sample발송','7000','2011-09-05',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10045E','00',NULL,NULL,NULL,NULL),(128,'ST10107','2011-09-05','WTOP',1,NULL,'S1001','2011-09-05','2011-09-08','Sep_05\r\nNew Sample발송','7000','2011-09-05',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','ST10107','00',NULL,NULL,NULL,NULL),(129,'SHD10045G','2011-09-05','WDRS',1,NULL,'S1001','2011-09-05','2011-09-08','Sep_05\r\nNew Sample발송','7000','2011-09-05',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10045G','00',NULL,NULL,NULL,NULL),(131,'SHD10045D','2011-09-07','WDRS',1,NULL,'S1001','2011-09-07','2011-09-10','New Sample','7000','2011-09-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SHD10045D','00',NULL,NULL,NULL,NULL),(132,'SD10111','2011-09-14','WDRS',1,NULL,'S1001','2011-09-14','2011-09-17','New Sample','7000','2011-09-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10111','00',NULL,NULL,NULL,NULL),(133,'SD10111A','2011-09-14','WDRS',1,NULL,'S1001','2011-09-14','2011-09-17','New Sample','7000','2011-09-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10111A','00',NULL,NULL,NULL,NULL),(134,'SD10111B','2011-09-14','WDRS',1,NULL,'S1001','2011-09-14','2011-09-17','New Sample','7000','2011-09-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10111B','00',NULL,NULL,NULL,NULL),(135,'SD10112','2011-09-14','WDRS',1,NULL,'S1001','2011-09-14','2011-09-17','New Sample','7000','2011-09-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','1','SD10112','00',NULL,NULL,NULL,NULL),(136,'ST10113','2011-09-14','KTOP',1,NULL,'S1001','2011-09-14','2011-09-17','New Sample','7000','2011-09-15',NULL,'B1001',NULL,NULL,NULL,'WINTER','2','ST10113','00',NULL,NULL,NULL,NULL),(137,'78910','2012-06-04','KDRS',1,NULL,'S1001','2012-06-12','2012-06-19','','2000','2012-06-02',NULL,'B9999',NULL,NULL,NULL,'SPRING','1','78910','00',NULL,NULL,NULL,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `vg_sample_in_out` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

