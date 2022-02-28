-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 192.168.0.115    Database: mes
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `code_sub`
--

DROP TABLE IF EXISTS `code_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code_sub` (
  `main_code` varchar(45) NOT NULL,
  `sub_code` varchar(45) NOT NULL,
  `using` tinyint DEFAULT NULL,
  PRIMARY KEY (`sub_code`,`main_code`),
  KEY `main_code_idx` (`main_code`),
  CONSTRAINT `main_code` FOREIGN KEY (`main_code`) REFERENCES `code_main` (`main_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_sub`
--

LOCK TABLES `code_sub` WRITE;
/*!40000 ALTER TABLE `code_sub` DISABLE KEYS */;
INSERT INTO `code_sub` VALUES ('수주유형','1 완제품',1),('년도','2020',1),('년도','2021',1),('소재구분','A/S',1),('부품구분','CORE',1),('maincode3','subcode2',1),('설비현황','가동',1),('고객사구분','고객사',1),('설비현황','고장',1),('불량유형','공정',1),('수주유형','금형 수정',1),('기타견적','기타비용1',1),('기타견적','기타비용2',1),('수주참여자 구분','발주담당자',1),('불량유형','불량유형임',1),('설비현황','비가동',1),('수주참여자 구분','설계담당자',1),('또또바꾼메인코드이름','섭코드',0),('또또바꾼메인코드이름','섭코드2',0),('또또바꾼메인코드이름','섭코드3',1),('또또바꾼메인코드이름','섭코드4',1),('소재구분','소모품',1),('수주유형','수리',1),('불량유형','수주',1),('소재구분','엔드밀',1),('수주참여자 구분','영업담당자',1),('부품구분','완제품',1),('고객사구분','외주사',1),('불량원인','원인1',1),('불량원인','원인2',1),('불량원인','원인3',1),('불량원인','원인4',1),('부품구분','원자재',1),('수주유형','일반 가공품',1),('부품구분','임시서브코드',1),('불량유형','자재 입고',1),('소재구분','전극',1),('수주참여자 구분','조립담당자',1),('설비현황','중단',1),('설비현황','테스트운용',1);
/*!40000 ALTER TABLE `code_sub` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-28 16:10:14
