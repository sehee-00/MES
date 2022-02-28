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
-- Table structure for table `outsourcing`
--

DROP TABLE IF EXISTS `outsourcing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outsourcing` (
  `outsourcing_no` int NOT NULL,
  `orders_name` varchar(45) DEFAULT NULL,
  `prod_name` varchar(45) DEFAULT NULL,
  `process` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `warehousing_exp_date` date DEFAULT NULL,
  `faulty` varchar(10) DEFAULT NULL,
  `outstart_date` date DEFAULT NULL,
  `outend_date` date DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `warehousing_date` date DEFAULT NULL,
  `worker` varchar(100) DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`outsourcing_no`),
  KEY `orders_name_idx` (`orders_name`),
  KEY `prod_name_idx` (`prod_name`),
  KEY `process_idx` (`process`),
  KEY `company_idx` (`company`),
  KEY `worker_idx` (`worker`),
  CONSTRAINT `company` FOREIGN KEY (`company`) REFERENCES `company` (`com_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orders_name` FOREIGN KEY (`orders_name`) REFERENCES `order` (`item_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `process` FOREIGN KEY (`process`) REFERENCES `process` (`process_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prod_name` FOREIGN KEY (`prod_name`) REFERENCES `part` (`part_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `worker` FOREIGN KEY (`worker`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outsourcing`
--

LOCK TABLES `outsourcing` WRITE;
/*!40000 ALTER TABLE `outsourcing` DISABLE KEYS */;
INSERT INTO `outsourcing` VALUES (1,'MES008','part_name11','CAM','시작대기','(주)유진전자',20000,NULL,'N',NULL,NULL,0,NULL,NULL,'2022-02-28'),(2,'MES008','part_name11','CAM','시작대기','(주)유진전자',0,NULL,'Y',NULL,NULL,0,NULL,NULL,'2022-02-28'),(4,'MES008','part_name1','CAM','시작대기','(주)유진전자',0,NULL,'Y',NULL,NULL,0,NULL,NULL,'2022-02-28'),(5,'MES008','part_name1','CAM','시작대기','(주)유진전자',0,NULL,'N',NULL,NULL,0,NULL,NULL,'2022-02-28'),(8,'MES008','part_name1','CAM','시작대기','(주)유진전자',0,NULL,'Y',NULL,NULL,0,NULL,NULL,'2022-02-28'),(11,'MES008','part_name1','CAM','시작대기','(주)유진전자',0,NULL,'N',NULL,NULL,0,NULL,NULL,'2022-02-28'),(12,'MES001','part_name1','CAM','시작대기','(주)유진전자',0,NULL,'N',NULL,NULL,0,NULL,'admin','2022-02-28'),(13,'MES001','part_name1','CAM','시작대기','(주)유진전자',0,NULL,'N',NULL,NULL,0,NULL,'admin','2022-02-28'),(14,'MES001','part_name1','CAM','시작대기','(주)유진전자',0,NULL,'N',NULL,NULL,0,NULL,'admin','2022-02-28');
/*!40000 ALTER TABLE `outsourcing` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`Usera`@`%`*/ /*!50003 TRIGGER `fIST` AFTER INSERT ON `outsourcing` FOR EACH ROW BEGIN
	DECLARE outN INT;
    DECLARE orN varchar(45);
    DECLARE ptN varchar(45);
    DECLARE proc varchar(45);
    DECLARE faul varchar(45);
    DECLARE fdate varchar(45);
    SET faul = NEW.faulty;
    
    IF faul = "Y" THEN 
		SET outN = new.outsourcing_no;
		SET orN = new.orders_name;
		SET ptN = new.prod_name;
		SET proc = new.process;
        SET fdate = CURRENT_TIMESTAMP;
		insert into mes.faulty (link_info, part_name, process, order_name, date_of_occurrence, faulty_type) values (outN, ptN, proc, orN, fdate, '공정');
	END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Usera`@`%`*/ /*!50003 TRIGGER `fUP` AFTER UPDATE ON `outsourcing` FOR EACH ROW BEGIN
	DECLARE outN INT;
    DECLARE orN varchar(45);
    DECLARE ptN varchar(45);
    DECLARE proc varchar(45);
    DECLARE faul varchar(45);
    DECLARE fdate varchar(45);
	    SET faul = NEW.faulty;
    
    IF 	faul = 'Y' and faul != old.faulty THEN
		SET outN = new.outsourcing_no;
		SET orN = new.orders_name;
		SET ptN = new.prod_name;
		SET proc = new.process;
        SET fdate = CURRENT_TIMESTAMP;
		insert into mes.faulty (link_info, part_name, process, order_name, date_of_occurrence, faulty_type) values (outN, ptN, proc, orN, fdate, '공정');
		ELSE IF faul = 'N' then
		SET outN = old.outsourcing_no;
        SET SQL_SAFE_UPDATES = 0;
        delete from mes.faulty where link_info = outN;
	END IF;
    
    END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Usera`@`%`*/ /*!50003 TRIGGER `fDEL` AFTER DELETE ON `outsourcing` FOR EACH ROW BEGIN
	DECLARE outN INT;
    
    SET outN = old.outsourcing_no;
	SET SQL_SAFE_UPDATES = 0;
	delete from mes.faulty where link_info = outN;
    
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

-- Dump completed on 2022-02-28 16:10:15
