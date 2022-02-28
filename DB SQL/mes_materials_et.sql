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
-- Table structure for table `materials_et`
--

DROP TABLE IF EXISTS `materials_et`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materials_et` (
  `et_id` varchar(45) NOT NULL,
  `degree` int NOT NULL,
  `materials_no` varchar(45) NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`et_id`,`degree`,`materials_no`),
  KEY `materials_no_idx` (`materials_no`),
  CONSTRAINT `et_foreign` FOREIGN KEY (`et_id`, `degree`) REFERENCES `estimate` (`et_id`, `degree`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materials_no` FOREIGN KEY (`materials_no`) REFERENCES `materials` (`materials_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials_et`
--

LOCK TABLES `materials_et` WRITE;
/*!40000 ALTER TABLE `materials_et` DISABLE KEYS */;
INSERT INTO `materials_et` VALUES ('1',3,'자재1',2),('54',24,'실린더',3),('54',25,'실린더',3),('54',26,'실린더',3),('54',27,'실린더',3),('54',28,'실린더',3),('56',1,'자재103',33),('56',2,'자재103',33),('56',3,'자재103',33),('56',4,'자재103',33),('56',5,'자재103',33),('57',1,'실린더',33),('62',2,'실린더',2),('63',1,'실린더',2),('63',2,'실린더',2),('63',3,'실린더',2),('63',4,'실린더',2),('63',5,'실린더',2),('63',6,'실린더',2),('64',1,'실린더',34),('64',2,'실린더',34),('65',1,'실린더',34),('70',1,'실린더',3),('70',2,'실린더',3),('70',3,'실린더',3),('70',5,'실린더',3),('70',6,'실린더',3),('70',8,'실린더',2),('70',8,'자재1',2),('70',9,'실린더',2),('70',9,'자재1',2),('70',9,'자재103',44),('70',10,'실린더',2),('70',10,'자재103',44),('70',10,'자재105',22),('70',11,'실린더',2),('70',11,'자재103',44),('70',11,'자재105',22),('70',12,'실린더',2),('70',12,'자재103',44),('70',12,'자재105',22),('73',1,'실린더',5),('73',2,'실린더',5),('73',3,'실린더',5),('73',4,'실린더',5),('73',5,'실린더',5),('73',6,'실린더',5),('76',4,'자재1',5),('76',4,'자재10',4),('76',5,'자재1',5),('76',5,'자재10',4),('76',6,'자재1',5),('76',6,'자재10',4);
/*!40000 ALTER TABLE `materials_et` ENABLE KEYS */;
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
