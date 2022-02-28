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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(45) NOT NULL,
  `user_pw` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `first_position` varchar(45) DEFAULT NULL,
  `second_position` varchar(45) DEFAULT NULL,
  `third_position` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `state` tinyint NOT NULL,
  `use_yn` tinyint NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','1234','admin_name','직위','직책','직급','전화번호','이메일','비고',0,0),('admin10','1234','admin_name10','직위','직책','직급','010-0000-0001','이메일','비고',1,1),('admin11','1234','admin_name11','직위11','','','','','',1,1),('admin12','1234','1212','','','','','','',1,1),('admin13','1212','1212','','','','','','',1,1),('admin14','1212','1212','','','','','','',1,1),('admin15','1212','1212','','','','','','',1,1),('admin16','1212','1212','','','','','','',1,1),('admin17','1212','1212','','','','','','',1,1),('admin18','18','1212','','','','','','',1,1),('admin19','1212','1212','','','','','','',1,1),('admin2','1234','admin_name2','','','','','','',1,1),('admin20','1212','1212','','','','','','',1,1),('admin21','1212','1212','','','','','','',1,1),('admin22','1234','admin_name22','','','','','','',1,1),('admin3','1234','admin_name3','','','','','','',1,1),('admin4','1234','admin_name4','직위4','직책4','직급4','전화번호4','이메일4','비고4',0,1),('admin5','1234','admin_name5','','','','','','',1,1),('admin6','1234','admin_name6','','','','','','',1,1),('admin7','1234','admin_name7','','','','','','',1,1),('admin8','1234','admin_name8','','','','','','',1,1),('admin9','1234','admin_name9','','','','','','',1,1),('adminyes','1234','adminyes','','','','','','',1,1),('asdds','1234','ADMINNAME',NULL,NULL,NULL,NULL,NULL,'비고',1,1),('TEST','1234','test',NULL,NULL,NULL,NULL,NULL,'비고',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`Usera`@`%`*/ /*!50003 TRIGGER `update_user` BEFORE INSERT ON `user` FOR EACH ROW BEGIN 
	insert into mes.user_menu(user_id, user_name) values(new.user_id, new.user_name);
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

-- Dump completed on 2022-02-28 16:10:16
