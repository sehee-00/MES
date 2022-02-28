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
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process` (
  `process_name` varchar(45) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `pay` int DEFAULT NULL,
  `load_factor` int DEFAULT NULL,
  `using` tinyint DEFAULT NULL,
  `process_manager` varchar(1024) DEFAULT NULL,
  `lowerlevel` tinyint DEFAULT '0',
  PRIMARY KEY (`process_name`),
  KEY `process_manager_idx` (`process_manager`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
INSERT INTO `process` VALUES ('CAM','공정',2000,40,1,'admin15,admin17,admin21,admin9',1),('MCT정식','공정',5000,20,1,NULL,1),('MCT황삭','공정',5000,30,1,NULL,0),('test01','공정',2000,40,0,'admin13,admin16,admin2,admin22',1),('test04','공정',2000,40,0,NULL,0),('test10','공정',1,10,1,NULL,0),('건드릴','공정',5000,40,1,'admin14',1),('검사','공정',5000,10,1,NULL,0),('밀링','공정',5000,50,1,NULL,0),('습함(조립)','공정',5000,30,1,NULL,0),('용접','공정',5000,40,1,NULL,1);
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`Usera`@`%`*/ /*!50003 TRIGGER `updateprocessmulti` BEFORE DELETE ON `process` FOR EACH ROW BEGIN
	DECLARE procn VARCHAR(45);
    DECLARE endOfRow BOOLEAN DEFAULT FALSE;
	DECLARE pcursor CURSOR FOR
		SELECT proc_name FROM mes.process_multi WHERE sub_proc = old.process_name;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET endOfRow = TRUE;
    OPEN pcursor;
		cloop: WHILE TRUE DO
			FETCH pcursor INTO procn;
            DELETE FROM process_multi WHERE sub_proc = old.process_name AND proc_name = procn;
            IF endOfRow THEN
				LEAVE cloop;
			END IF;
		END WHILE;
	CLOSE pcursor;
    
    DELETE FROM process_multi WHERE proc_name = old.process_name AND sortation = 'f';
    DELETE FROM process_time WHERE p_name = old.process_name;
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

-- Dump completed on 2022-02-28 16:10:14
