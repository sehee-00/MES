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
-- Table structure for table `faulty`
--

DROP TABLE IF EXISTS `faulty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faulty` (
  `faulty_no` int NOT NULL AUTO_INCREMENT,
  `link_info` int DEFAULT NULL,
  `faulty_type` varchar(45) DEFAULT NULL,
  `cause_of_defect` varchar(45) DEFAULT NULL,
  `date_of_occurrence` datetime NOT NULL,
  `materials_cost` int DEFAULT NULL,
  `cost` int DEFAULT NULL,
  `faulty_title` varchar(45) DEFAULT NULL,
  `faulty_content` varchar(45) DEFAULT NULL,
  `solution` varchar(45) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `proc_date` datetime DEFAULT NULL,
  `part_name` varchar(45) DEFAULT NULL,
  `process` varchar(45) DEFAULT NULL,
  `order_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`faulty_no`),
  KEY `ftype_idx` (`faulty_type`),
  KEY `fcause_idx` (`cause_of_defect`),
  CONSTRAINT `fcause` FOREIGN KEY (`cause_of_defect`) REFERENCES `code_sub` (`sub_code`),
  CONSTRAINT `ftype` FOREIGN KEY (`faulty_type`) REFERENCES `code_sub` (`sub_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faulty`
--

LOCK TABLES `faulty` WRITE;
/*!40000 ALTER TABLE `faulty` DISABLE KEYS */;
INSERT INTO `faulty` VALUES (1,NULL,'공정',NULL,'2022-02-28 15:21:39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,131,'공정',NULL,'2022-02-28 15:29:33',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'part_name7','CAM','MES016'),(141,2,'공정',NULL,'2022-02-28 16:01:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'part_name11','CAM','MES008'),(142,4,'공정',NULL,'2022-02-28 16:01:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'part_name1','CAM','MES008'),(143,8,'공정',NULL,'2022-02-28 16:01:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'part_name1','CAM','MES008');
/*!40000 ALTER TABLE `faulty` ENABLE KEYS */;
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
