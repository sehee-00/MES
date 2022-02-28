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
-- Table structure for table `other_cost`
--

DROP TABLE IF EXISTS `other_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `other_cost` (
  `et_id` varchar(45) NOT NULL,
  `degree` int NOT NULL,
  `other_et_id` varchar(45) NOT NULL,
  `cost` int DEFAULT NULL,
  PRIMARY KEY (`et_id`,`degree`,`other_et_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_cost`
--

LOCK TABLES `other_cost` WRITE;
/*!40000 ALTER TABLE `other_cost` DISABLE KEYS */;
INSERT INTO `other_cost` VALUES ('53',2,'기타비용1',43534),('53',3,'기타비용1',43534),('53',4,'기타비용1',43534),('53',4,'기타비용2',324324),('53',9,'기타비용1',33),('53',9,'기타비용2',33),('54',1,'기타비용1',324324),('54',2,'기타비용1',324324),('56',1,'기타비용1',535353),('56',1,'기타비용2',3535),('56',2,'기타비용1',535353),('56',2,'기타비용2',3535),('56',3,'기타비용1',535353),('56',3,'기타비용2',3535),('56',4,'기타비용1',535353),('56',4,'기타비용2',3535),('56',5,'기타비용1',535353),('56',5,'기타비용2',3535),('57',1,'기타비용1',3535),('63',1,'기타비용1',24),('63',1,'기타비용2',24),('63',2,'기타비용2',24),('63',3,'기타비용2',24),('63',5,'기타비용1',33),('63',6,'기타비용1',33),('63',6,'기타비용2',34),('66',3,'기타비용1',32),('66',3,'기타비용2',3232),('70',1,'기타비용1',124),('70',1,'기타비용2',412124),('70',2,'기타비용1',124),('70',2,'기타비용2',412124),('70',3,'기타비용1',124),('70',3,'기타비용2',412124);
/*!40000 ALTER TABLE `other_cost` ENABLE KEYS */;
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
