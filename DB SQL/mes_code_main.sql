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
-- Table structure for table `code_main`
--

DROP TABLE IF EXISTS `code_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code_main` (
  `group_code` varchar(45) NOT NULL,
  `main_code` varchar(45) NOT NULL,
  `using` tinyint DEFAULT NULL,
  `contents` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`main_code`,`group_code`),
  KEY `group_idx` (`group_code`),
  CONSTRAINT `group` FOREIGN KEY (`group_code`) REFERENCES `code_group` (`group_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code_main`
--

LOCK TABLES `code_main` WRITE;
/*!40000 ALTER TABLE `code_main` DISABLE KEYS */;
INSERT INTO `code_main` VALUES ('불량관리','maincode2',1,'explain'),('불량관리','maincode3',1,'explain'),('업체관리','고객사구분',1,'설명란'),('영업관리','기타견적',1,'설명란'),('표준관리','년도',1,'설명란'),('자재관리','또또바꾼메인코드이름',1,'테스트입\r\n니\r\n다'),('자재관리','부품구분',1,'설명란'),('불량관리','불량원인',1,'설명란'),('불량관리','불량유형',1,'설명란'),('표준관리','설비현황',1,'설명란'),('자재관리','소재구분',1,'설명란'),('영업관리','수주유형',1,'설명란'),('영업관리','수주참여자 구분',1,'설명란');
/*!40000 ALTER TABLE `code_main` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-28 16:10:12
