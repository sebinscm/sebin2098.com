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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-13 11:57:29
