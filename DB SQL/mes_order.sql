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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `item_no` varchar(45) NOT NULL,
  `order_com_id` varchar(45) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_status` varchar(45) NOT NULL,
  `part_status` varchar(45) NOT NULL,
  `car_name` varchar(45) NOT NULL,
  `prod_name` varchar(45) NOT NULL,
  `order_price` int DEFAULT NULL,
  `nego_price` int DEFAULT NULL,
  `del_date` datetime DEFAULT NULL,
  `proc_end_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `order_note` varchar(100) DEFAULT NULL,
  `item_img` varchar(1024) DEFAULT NULL,
  `order_et_id` varchar(45) DEFAULT NULL,
  `order_num` int DEFAULT NULL,
  PRIMARY KEY (`item_no`),
  KEY `order_com_id_idx` (`order_com_id`),
  KEY `order_et_id_idx` (`order_et_id`),
  KEY `car_name_idx` (`car_name`),
  KEY `o_foreign_idx` (`order_status`),
  KEY `p_foreign_idx` (`part_status`),
  CONSTRAINT `car_name` FOREIGN KEY (`car_name`) REFERENCES `materials` (`materials_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `o_foreign` FOREIGN KEY (`order_status`) REFERENCES `code_sub` (`sub_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_com_id` FOREIGN KEY (`order_com_id`) REFERENCES `company` (`com_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_et_id` FOREIGN KEY (`order_et_id`) REFERENCES `estimate` (`et_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `p_foreign` FOREIGN KEY (`part_status`) REFERENCES `code_sub` (`sub_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('MES001','재영','2022-01-01 00:00:00','수리','원자재','자재1','MES001',3333,0,'2022-02-09 00:00:00',NULL,'2022-02-09 00:00:00','테스트한다구 넣어봤어욤^^',NULL,'53',1),('MES002','삼성전기','2022-01-02 00:00:00','1 완제품','CORE','실린더','MES002',3333,0,NULL,NULL,NULL,NULL,NULL,'53',2),('MES003','삼성전기','2022-01-03 00:00:00','1 완제품','CORE','실린더','MES003',3333,0,NULL,NULL,NULL,NULL,NULL,'53',3),('MES004','재영','2022-01-04 00:00:00','1 완제품','CORE','실린더','MES004',21,0,NULL,NULL,NULL,NULL,NULL,'54',4),('MES006','재영','2022-01-06 00:00:00','1 완제품','완제품','실린더','MES006',21,0,NULL,NULL,NULL,NULL,NULL,'54',5),('MES008','디팜스','2022-01-08 00:00:00','1 완제품','CORE','실린더','MES008',300000,0,NULL,NULL,NULL,NULL,NULL,'1',6),('MES009','삼성전기','2022-01-09 00:00:00','수리','CORE','실린더','MES009',3333,0,'2022-02-09 00:00:00',NULL,NULL,'null',NULL,'53',7),('MES010','재영','2022-01-10 00:00:00','금형 수정','완제품','실린더','MES010',21,0,'2022-02-09 00:00:00',NULL,NULL,NULL,NULL,'54',8),('MES011','삼성전기','2022-01-11 00:00:00','1 완제품','원자재','실린더','MES011',3333,0,NULL,NULL,'2022-02-08 00:00:00','null',NULL,'53',9),('MES013','삼성전기','2022-01-13 00:00:00','수리','CORE','실린더','MES013',3333,0,'2022-01-14 00:00:00',NULL,'2022-02-08 00:00:00','null',NULL,'53',10),('MES014','삼성전기','2022-01-14 00:00:00','수리','완제품','실린더','MES014',3333,0,'2022-01-16 00:00:00',NULL,NULL,NULL,NULL,'53',11),('MES014 - 임시','삼성전기','2022-02-11 00:00:00','수리','완제품','실린더','MES014',3333,0,NULL,NULL,NULL,'야',NULL,'53',18),('MES015','재영','2022-01-15 00:00:00','1 완제품','원자재','실린더','MES015',21,0,NULL,NULL,NULL,NULL,NULL,'54',12),('MES016','삼성전기','2022-01-16 00:00:00','수리','CORE','실린더','MES016',111111,0,NULL,NULL,NULL,NULL,NULL,'56',13),('MES017','재영','2022-01-17 00:00:00','금형 수정','원자재','실린더','MES017',21,0,NULL,NULL,'2022-02-11 00:00:00',NULL,NULL,'54',14),('MES018','디팜스','2022-01-18 00:00:00','금형 수정','원자재','실린더','MES018',555,0,'2022-01-17 00:00:00',NULL,NULL,NULL,NULL,'55',15),('MES018 - 임시','디팜스','2022-02-11 00:00:00','금형 수정','원자재','실린더','MES018',555,0,NULL,NULL,'2022-02-11 00:00:00',NULL,NULL,'55',17),('MES020','디팜스','2022-01-20 00:00:00','금형 수정','원자재','자재13','MES020',3,0,NULL,NULL,NULL,'유진아 메롱',NULL,'60',19);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-28 16:10:13
