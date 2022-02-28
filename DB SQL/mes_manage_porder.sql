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
-- Table structure for table `manage_porder`
--

DROP TABLE IF EXISTS `manage_porder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manage_porder` (
  `m_no` int NOT NULL AUTO_INCREMENT,
  `part_name` varchar(45) DEFAULT NULL,
  `order_name` varchar(45) DEFAULT NULL,
  `number_of_request` int DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`m_no`),
  KEY `manage_part_idx` (`part_name`),
  KEY `manage_order_idx` (`order_name`),
  CONSTRAINT `manage_order` FOREIGN KEY (`order_name`) REFERENCES `order` (`item_no`),
  CONSTRAINT `manage_part` FOREIGN KEY (`part_name`) REFERENCES `part` (`part_name`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manage_porder`
--

LOCK TABLES `manage_porder` WRITE;
/*!40000 ALTER TABLE `manage_porder` DISABLE KEYS */;
INSERT INTO `manage_porder` VALUES (11,'part_name6',NULL,5,'CORE'),(13,'part_name9',NULL,5,'CORE'),(14,'part_name8',NULL,5,'CORE'),(15,'part_name8',NULL,5,'CORE'),(16,'part_name8',NULL,5,'CORE'),(17,'part_name8',NULL,5,'CORE'),(18,'part_name9',NULL,5,'CORE'),(19,'part_name9',NULL,5,'CORE'),(20,'part_name9',NULL,5,'CORE'),(22,'part_name8',NULL,5,'CORE'),(23,'part_name8',NULL,5,'CORE'),(24,'part_name8',NULL,5,'CORE'),(25,'part_name8',NULL,5,'CORE'),(26,'part_name2',NULL,5,'CORE'),(27,'part_name2',NULL,5,'CORE'),(28,'part_name2',NULL,5,'CORE'),(29,'part_name2',NULL,5,'CORE'),(30,'part_name2',NULL,5,'CORE'),(31,'part_name2',NULL,5,'CORE'),(32,'part_name2',NULL,5,'CORE'),(33,'part_name2',NULL,5,'CORE'),(34,'part_name2',NULL,5,'CORE'),(35,'part_name2',NULL,5,'CORE'),(36,'part_name2',NULL,5,'CORE'),(37,'part_name2',NULL,5,'CORE'),(38,'part_name2',NULL,5,'CORE'),(39,'part_name2',NULL,5,'CORE'),(40,'part_name2',NULL,5,'CORE'),(41,'part_name2',NULL,5,'CORE');
/*!40000 ALTER TABLE `manage_porder` ENABLE KEYS */;
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
