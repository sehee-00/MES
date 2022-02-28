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
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `facilities_name` varchar(45) NOT NULL,
  `facilities_status` varchar(45) DEFAULT NULL,
  `pay` varchar(45) DEFAULT NULL,
  `using` varchar(45) DEFAULT NULL,
  `using_all_day` varchar(45) DEFAULT NULL,
  `facilities_start` varchar(45) DEFAULT NULL,
  `facilities_end` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`facilities_name`),
  KEY `facilities_status_idx` (`facilities_status`),
  CONSTRAINT `facilities_status` FOREIGN KEY (`facilities_status`) REFERENCES `code_sub` (`sub_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES ('고속가공기1(전극)','가동','null','Y','Y','',''),('고속가공기2(전극)','가동',NULL,'Y',NULL,NULL,NULL),('고속가공기3(전극)','가동',NULL,'Y',NULL,NULL,NULL),('방전가공기1','가동',NULL,'Y',NULL,NULL,NULL),('방전가공기2','가동',NULL,'Y',NULL,NULL,NULL),('방전가공기3','가동',NULL,'Y',NULL,NULL,NULL),('방전가공기4','가동',NULL,'Y',NULL,NULL,NULL),('와이어가공기1','가동',NULL,'Y',NULL,NULL,NULL),('와이어가공기2','가동',NULL,'Y',NULL,NULL,NULL),('와이어가공기3','가동',NULL,'Y',NULL,NULL,NULL),('테스트','가동','100','N','Y','23:51','13:53'),('테스트1','가동','2','Y','Y','',''),('테스트2','비가동','100','Y','N','03:16','07:20'),('테스트3','고장','111','Y','Y','','');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-28 16:10:11
