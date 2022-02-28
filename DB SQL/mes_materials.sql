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
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materials` (
  `materials_id` int NOT NULL,
  `materials_name` varchar(45) DEFAULT NULL,
  `unit_price` int NOT NULL,
  `materials_type` varchar(45) NOT NULL,
  `materials_proc` varchar(45) NOT NULL,
  `stock` int NOT NULL,
  `safety_stock` int NOT NULL,
  PRIMARY KEY (`materials_id`),
  UNIQUE KEY `materials_name_UNIQUE` (`materials_name`),
  KEY `materials_proc_idx` (`materials_proc`),
  KEY `m_foreign_idx` (`materials_type`),
  CONSTRAINT `m_foreign` FOREIGN KEY (`materials_type`) REFERENCES `code_sub` (`sub_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `materials_proc` FOREIGN KEY (`materials_proc`) REFERENCES `process` (`process_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES (1,'실린더',10000,'소모품','MCT황삭',88,789),(2,'자재1',5000,'소모품','용접',10,10),(3,'자재2',2000,'소모품','용접',20,10),(6,'자재5',1500,'소모품','MCT황삭',1,8),(7,'자재6',1000,'A/S','MCT황삭',2,7),(8,'자재7',1500,'전극','용접',3,6),(10,'자재9',500,'소모품','검사',5,4),(11,'자재10',900,'A/S','검사',6,3),(12,'자재11',400,'엔드밀','밀링',7,2),(13,'자재12',800,'엔드밀','밀링',8,1),(14,'자재13',5000,'소모품','용접',10,10),(15,'자재14',2000,'소모품','용접',20,10),(18,'자재17',1500,'소모품','MCT황삭',1,8),(19,'자재18',1000,'A/S','MCT황삭',2,7),(20,'자재19',1500,'전극','용접',3,6),(22,'자재21',500,'소모품','검사',5,4),(23,'자재22',900,'A/S','검사',6,3),(24,'자재23',400,'엔드밀','밀링',7,2),(25,'자재24',800,'엔드밀','밀링',8,1),(26,'자재25',5000,'소모품','용접',10,10),(27,'자재26',2000,'소모품','용접',20,10),(30,'자재29',1500,'소모품','MCT황삭',1,8),(31,'자재30',1000,'A/S','MCT황삭',2,7),(32,'자재31',1500,'전극','용접',3,6),(34,'자재33',500,'소모품','검사',5,4),(35,'자재34',900,'A/S','검사',6,3),(36,'자재35',400,'엔드밀','밀링',7,2),(37,'자재36',800,'엔드밀','밀링',8,1),(38,'자재37',5000,'소모품','용접',10,10),(39,'자재38',2000,'소모품','용접',20,10),(42,'자재41',1500,'소모품','MCT황삭',1,8),(43,'자재42',1000,'A/S','MCT황삭',2,7),(44,'자재43',1500,'전극','용접',3,6),(46,'자재45',500,'소모품','검사',5,4),(47,'자재46',900,'A/S','검사',6,3),(48,'자재47',400,'엔드밀','밀링',7,2),(49,'자재48',800,'엔드밀','밀링',8,1),(50,'자재49',5000,'소모품','용접',10,10),(51,'자재50',2000,'소모품','용접',20,10),(54,'자재53',1500,'소모품','MCT황삭',1,8),(55,'자재54',1000,'A/S','MCT황삭',2,7),(56,'자재55',1500,'전극','용접',3,6),(58,'자재57',500,'소모품','검사',5,4),(59,'자재58',900,'A/S','검사',6,3),(60,'자재59',400,'엔드밀','밀링',7,2),(61,'자재60',800,'엔드밀','밀링',8,1),(62,'자재61',5000,'소모품','용접',10,10),(63,'자재62',2000,'소모품','용접',20,10),(66,'자재65',1500,'소모품','MCT황삭',1,8),(67,'자재66',1000,'A/S','MCT황삭',2,7),(68,'자재67',1500,'전극','용접',3,6),(70,'자재69',500,'소모품','검사',5,4),(71,'자재70',900,'A/S','검사',6,3),(72,'자재71',400,'엔드밀','밀링',7,2),(73,'자재72',800,'엔드밀','밀링',8,1),(74,'자재73',5000,'소모품','용접',10,10),(75,'자재74',2000,'소모품','용접',20,10),(78,'자재77',1500,'소모품','MCT황삭',1,8),(79,'자재78',1000,'A/S','MCT황삭',2,7),(80,'자재79',1500,'전극','용접',3,6),(82,'자재81',500,'소모품','검사',5,4),(83,'자재82',900,'A/S','검사',6,3),(84,'자재83',400,'엔드밀','밀링',7,2),(85,'자재84',800,'엔드밀','밀링',8,1),(86,'자재85',5000,'소모품','용접',10,10),(87,'자재86',2000,'소모품','용접',20,10),(90,'자재89',1500,'소모품','MCT황삭',1,8),(91,'자재90',1000,'A/S','MCT황삭',2,7),(92,'자재91',1500,'전극','용접',3,6),(94,'자재93',500,'소모품','검사',5,4),(95,'자재94',900,'A/S','검사',6,3),(96,'자재95',400,'엔드밀','밀링',7,2),(97,'자재96',800,'엔드밀','밀링',8,1),(98,'자재97',5000,'소모품','용접',10,10),(99,'자재98',2000,'소모품','용접',20,10),(102,'자재101',1500,'소모품','MCT황삭',1,8),(103,'자재102',1000,'A/S','MCT황삭',2,7),(104,'자재103',1500,'전극','용접',3,6),(106,'자재105',500,'소모품','검사',5,6),(107,'자재106',900,'A/S','검사',6,3),(108,'자재107',400,'엔드밀','밀링',7,2),(109,'자재108',800,'엔드밀','밀링',8,1);
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-28 16:10:15
