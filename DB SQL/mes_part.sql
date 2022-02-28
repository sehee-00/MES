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
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part` (
  `part_name` varchar(45) NOT NULL,
  `part_type` varchar(45) DEFAULT NULL,
  `core` varchar(45) DEFAULT NULL,
  `unit_price` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `safety_stock` int DEFAULT NULL,
  `standard` varchar(45) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  `part_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`part_name`),
  KEY `part_foreign_idx1` (`part_type`),
  KEY `part_foreign_idx` (`part_type`),
  CONSTRAINT `part_foreign` FOREIGN KEY (`part_type`) REFERENCES `code_sub` (`sub_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES ('part_name1','원자재','core1',1,1,1,'1*1*1','개',''),('part_name11','CORE','core5',5,5,5,'5*5*5','개',''),('part_name12','CORE','core5',5,5,12,'5*5*5','개',''),('part_name13','CORE','core2',5000,10,20,'50*50*50','개',''),('part_name2','CORE','core2',2,2,2,'2*2*2','개',''),('part_name20','CORE','CORE',5000,10,20,'50*50*50','개',''),('part_name21','CORE','CORE',5000,10,20,'50*50*50','개',''),('part_name6','CORE','core5',6,5,5,'5*5*5','개',''),('part_name7','CORE','core5',5,5,5,'5*5*5','개',''),('part_name8','CORE','core5',5,5,5,'5*5*5','개',''),('part_name9','CORE','core5',5,5,5,'5*5*5','개',''),('부품명2','완제품','',2,2,2,'2*2*2','개',''),('부품명3','원자재','core3',3333333,3,3,'3*3*3','개',''),('부품명임','CORE','코어임',5,5,5,'','','');
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
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
