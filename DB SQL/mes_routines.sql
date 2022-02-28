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
-- Temporary view structure for view `daily_work`
--

DROP TABLE IF EXISTS `daily_work`;
/*!50001 DROP VIEW IF EXISTS `daily_work`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `daily_work` AS SELECT 
 1 AS `worker`,
 1 AS `dwtype`,
 1 AS `order_name`,
 1 AS `regdate`,
 1 AS `part_name`,
 1 AS `process`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `faulty`,
 1 AS `company`,
 1 AS `price`,
 1 AS `warehousing_exp_date`,
 1 AS `facilities`,
 1 AS `status`,
 1 AS `work_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `daily_work`
--

/*!50001 DROP VIEW IF EXISTS `daily_work`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Usera`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `daily_work` AS select `outsourcing`.`worker` AS `worker`,'외주' AS `dwtype`,`outsourcing`.`orders_name` AS `order_name`,`outsourcing`.`reg_date` AS `regdate`,`outsourcing`.`prod_name` AS `part_name`,`outsourcing`.`process` AS `process`,`outsourcing`.`outstart_date` AS `start_date`,`outsourcing`.`outend_date` AS `end_date`,`outsourcing`.`faulty` AS `faulty`,`outsourcing`.`company` AS `company`,`outsourcing`.`price` AS `price`,`outsourcing`.`warehousing_exp_date` AS `warehousing_exp_date`,NULL AS `facilities`,NULL AS `status`,NULL AS `work_id` from `outsourcing` where (`outsourcing`.`status` = 0) union select `my_work`.`worker` AS `worker`,'사내' AS `dwtype`,`my_work`.`order_name` AS `order_name`,`my_work`.`regdate` AS `regdate`,`my_work`.`part_name` AS `part_name`,`my_work`.`process` AS `process`,`my_work`.`work_start` AS `start_date`,`my_work`.`work_end` AS `end_date`,`my_work`.`faulty` AS `faulty`,NULL AS `company`,NULL AS `price`,NULL AS `warehousing_exp_date`,`my_work`.`facilities` AS `facilities`,`my_work`.`status` AS `status`,`my_work`.`work_id` AS `work_id` from `my_work` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'mes'
--

--
-- Dumping routines for database 'mes'
--
/*!50003 DROP PROCEDURE IF EXISTS `decid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Usera`@`%` PROCEDURE `decid`(
	IN ID_NUM INT,
    IN T_NAME VARCHAR(30),
    IN C_NAME VARCHAR(30)
)
BEGIN
	declare _sql VARCHAR(500);

	SET _sql = CONCAT('UPDATE ', T_NAME, ' SET ');
    SET _sql = CONCAT(_sql, C_NAME, ' = ');
    SET _sql = CONCAT(_sql, C_NAME, '-1 WHERE ', C_NAME, ' > ', ID_NUM);
    SET @statement = _sql;
    
    PREPARE DYNQUERY FROM @statement;
    EXECUTE DYNQUERY;
    DEALLOCATE PREPARE DYNQUERY;
    
END ;;
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

-- Dump completed on 2022-02-28 16:10:16
