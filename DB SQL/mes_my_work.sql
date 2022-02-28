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
-- Table structure for table `my_work`
--

DROP TABLE IF EXISTS `my_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_work` (
  `work_id` int NOT NULL AUTO_INCREMENT,
  `order_name` varchar(45) NOT NULL,
  `part_name` varchar(45) DEFAULT NULL,
  `process` varchar(45) NOT NULL,
  `facilities` varchar(45) DEFAULT NULL,
  `work_start` datetime DEFAULT NULL,
  `work_end` datetime DEFAULT NULL,
  `faulty` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `client` varchar(45) DEFAULT NULL,
  `regdate` date NOT NULL,
  `dobun` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `core` varchar(45) DEFAULT NULL,
  `work_time` int DEFAULT NULL,
  `real_processing_time` int DEFAULT NULL,
  `no_men_processing_time` int DEFAULT NULL,
  `un_processing_time` int DEFAULT NULL,
  `total_work_time` int DEFAULT NULL,
  `total_processing_time` int DEFAULT NULL,
  `worker` varchar(45) NOT NULL,
  PRIMARY KEY (`work_id`),
  KEY `work_process_idx` (`process`),
  KEY `work_order_idx` (`order_name`),
  KEY `work_facilities_idx` (`facilities`),
  CONSTRAINT `work_facilities` FOREIGN KEY (`facilities`) REFERENCES `facilities` (`facilities_name`),
  CONSTRAINT `work_order` FOREIGN KEY (`order_name`) REFERENCES `order` (`item_no`),
  CONSTRAINT `work_process` FOREIGN KEY (`process`) REFERENCES `process` (`process_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_work`
--

LOCK TABLES `my_work` WRITE;
/*!40000 ALTER TABLE `my_work` DISABLE KEYS */;
INSERT INTO `my_work` VALUES (114,'MES001','part_name1','CAM','고속가공기1(전극)','2022-02-01 14:51:00','2022-02-02 14:51:00','Y','완료','null','2022-02-28','',0,'',24,0,0,0,24,0,'admin_name'),(115,'MES001','part_name1','MCT정식','고속가공기2(전극)','2022-02-01 14:52:00',NULL,'N','진행','null','2022-02-28','',0,'',0,10,20,30,20,30,'admin'),(118,'MES001','part_name1','CAM','고속가공기1(전극)',NULL,NULL,'N','시작','null','2022-02-28','',0,'',0,0,0,0,0,0,'admin_name'),(123,'MES001','part_name1','CAM','고속가공기1(전극)','2022-02-28 15:11:00',NULL,'Y','진행','null','2022-02-28',NULL,0,NULL,0,0,0,0,0,0,'admin_name'),(126,'MES016','','밀링','와이어가공기3',NULL,NULL,'N','시작','삼성전기','2022-02-28','',0,'',0,0,0,0,0,0,'로그인안하고값넣은사용자'),(127,'MES002','part_name2','CAM','고속가공기1(전극)',NULL,NULL,'Y','진행',NULL,'2022-02-28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin_name'),(128,'MES011','','검사','와이어가공기3','2022-02-28 15:20:00',NULL,'Y','진행','삼성전기','2022-02-28','',0,'',0,0,0,0,0,0,'로그인안하고값넣은사용자'),(129,'MES016','part_name7','검사','테스트','2022-02-28 15:24:00',NULL,'Y','진행','삼성전기','2022-02-28','',0,'',0,0,0,0,0,0,'로그인안하고값넣은사용자'),(131,'MES016','part_name7','CAM','와이어가공기3',NULL,NULL,'Y',NULL,NULL,'2022-02-28',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'로그인안하고값넣은사용자');
/*!40000 ALTER TABLE `my_work` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`Usera`@`%`*/ /*!50003 TRIGGER `faultycheck` AFTER INSERT ON `my_work` FOR EACH ROW BEGIN
	DECLARE wi INT;
    DECLARE orN varchar(45);
    DECLARE ptN varchar(45);
    DECLARE proc varchar(45);
    DECLARE faul varchar(45);
    DECLARE fdate varchar(45);
    SET faul = NEW.faulty;
    
    IF faul = "Y" THEN 
		SET wi = new.work_id;
		SET orN = new.order_name;
		SET ptN = new.part_name;
		SET proc = new.process;
        SET fdate = CURRENT_TIMESTAMP;
		insert into mes.faulty (link_info, part_name, process, order_name, date_of_occurrence, faulty_type) values (wi, ptN, proc, orN, fdate, '공정');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`Usera`@`%`*/ /*!50003 TRIGGER `faultyupdate` AFTER UPDATE ON `my_work` FOR EACH ROW BEGIN
	DECLARE wi INT;
    DECLARE orN varchar(45);
    DECLARE ptN varchar(45);
    DECLARE proc varchar(45);
    DECLARE faul varchar(45);
    SET faul = NEW.faulty;
    
    IF faul = "Y" THEN 
		SET wi = new.work_id;
		SET orN = new.order_name;
		SET ptN = new.part_name;
		SET proc = new.process;
		insert into mes.faulty (link_info, part_name, process, order_name, date_of_occurrence, faulty_type) values (wi, ptN, proc, orN, fdate, '공정');
	ELSE 
		SET wi = old.work_id;
        SET SQL_SAFE_UPDATES = 0;
        delete from mes.faulty where link_info = wi;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`Usera`@`%`*/ /*!50003 TRIGGER `faultydelete` AFTER DELETE ON `my_work` FOR EACH ROW BEGIN
	DECLARE wi INT;
    
    SET wi = old.work_id;
	SET SQL_SAFE_UPDATES = 0;
	delete from mes.faulty where link_info = wi;
    
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

-- Dump completed on 2022-02-28 16:10:11
