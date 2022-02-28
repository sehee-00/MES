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
-- Table structure for table `place_order`
--

DROP TABLE IF EXISTS `place_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_order` (
  `porder_no` int NOT NULL,
  `part_name` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `number_of_request` int DEFAULT NULL,
  `porder_company` varchar(45) DEFAULT NULL,
  `p_date` date DEFAULT NULL,
  `receiving_day` date DEFAULT NULL,
  `receiving_status` varchar(45) DEFAULT NULL,
  `place_of_delivery` varchar(45) DEFAULT NULL,
  `unit_price` int DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`porder_no`),
  KEY `pcompany_idx` (`porder_company`),
  CONSTRAINT `pcompany` FOREIGN KEY (`porder_company`) REFERENCES `company` (`com_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_order`
--

LOCK TABLES `place_order` WRITE;
/*!40000 ALTER TABLE `place_order` DISABLE KEYS */;
INSERT INTO `place_order` VALUES (4,'part_name1','원자재',10,'디팜스','2022-02-10','2022-02-21','Y','place_of_delievery1',1,'note1'),(5,'part_name1','원자재',10,'디팜스','2022-02-10','2022-02-10','Y','place_of_delievery1',1,'note1'),(6,'part_name20','CORE',4,'(주)유진상사','2022-02-17','2022-02-10','N','',333,''),(7,'part_name20','CORE',4,'(주)유진상사','2022-02-17','2022-02-10','N','',22,''),(8,'part_name21','CORE',5,'(주)유진상사','2022-02-17','2022-02-10','N','',222,''),(9,'part_name6','CORE',5,'(주)유진상사','2022-02-17','2022-02-10','N','d',222,'d'),(10,'part_name20','CORE',5,'(주)유진상사','2022-02-17','2022-02-10','N','d',222,'d'),(11,'part_name6','CORE',5,'(주)유진상사','2022-02-17','2022-02-10','N','',33,''),(12,'part_name6','CORE',5,'(주)유진상사','2022-02-17','2022-02-10','N','',222,''),(13,'part_name6','CORE',5,'(주)유진상사','2022-02-17','2022-02-10','N','',222,''),(14,'part_name20','CORE',5,'(주)유진상사','2022-02-18',NULL,'N','ㅇㅇ',11,'ㅇㅇ'),(15,'part_name6','CORE',5,'(주)유진상사','2022-02-18',NULL,'N','ㅇㅇ',22,'ㅇㅇ'),(16,'part_name6','CORE',5,'(주)유진상사','2022-02-18',NULL,'N','ㅇㅇ',33,'ㅇㅇ'),(17,'part_name20','CORE',5,'(주)유진상사','2022-02-18',NULL,'N','23',2,'2'),(18,'part_name6','CORE',5,'(주)유진상사','2022-02-18',NULL,'N','',2,''),(19,'part_name20','CORE',5,'(주)유진상사','2022-02-18',NULL,'N','',3,''),(20,'part_name20','CORE',5,'(주)유진상사','2022-02-18',NULL,'N','814-1',5000,'비고'),(21,'part_name6','CORE',5,'(주)유진상사','2022-02-18',NULL,'N','814-1',5000,'비고'),(22,'part_name12','CORE',5,'(주)유진상사','2022-02-22',NULL,'N','',2,''),(23,'part_name11','CORE',5,'(주)유진상사','2022-02-22',NULL,'N','',2,''),(24,'part_name1','원자재',2,'(주)유진상사','2022-02-22',NULL,'N','',2,''),(25,'part_name11','CORE',2,'(주)유진상사','2022-02-22',NULL,'N','',2,''),(26,'part_name11','CORE',2,'(주)유진상사','2022-02-22',NULL,'N','',5,''),(27,'part_name12','CORE',2,'(주)유진상사','2022-02-22',NULL,'N','',5,''),(28,'part_name13','CORE',2,'(주)유진상사','2022-02-22',NULL,'N','',5000,''),(29,'실린더','자재',1,'(주)유진상사','2022-02-22',NULL,'N','',10000,''),(30,'자재2','자재',1,'(주)유진상사','2022-02-22',NULL,'N','',2000,''),(31,'자재1','자재',1,'(주)유진상사','2022-02-22',NULL,'N','',5000,''),(32,'part_name13','CORE',251,'(주)유진상사','2022-02-22',NULL,'N','',5000,''),(33,'part_name20','CORE',22,'(주)유진상사','2022-02-22',NULL,'N','',5000,''),(34,'part_name21','CORE',22,'(주)유진상사','2022-02-22',NULL,'N','',5000,''),(35,'part_name11','CORE',5,'TEST10','2022-02-28',NULL,'N','',5,''),(36,'part_name1','원자재',6,'TEST10','2022-02-28',NULL,'N','',1,''),(37,'part_name1','원자재',3,'test000','2022-02-28',NULL,'N','814-1',1,'비고'),(38,'part_name1','원자재',10,'test000','2022-02-28',NULL,'N','',1,'');
/*!40000 ALTER TABLE `place_order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Usera`@`%`*/ /*!50003 TRIGGER `por_no` BEFORE INSERT ON `place_order` FOR EACH ROW BEGIN
	declare pn int;
    select porder_no + 1 into pn from mes.place_order order by porder_no desc limit 1;
	 set new.porder_no = pn;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-28 16:10:12
