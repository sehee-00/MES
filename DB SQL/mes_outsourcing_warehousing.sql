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
-- Table structure for table `outsourcing_warehousing`
--

DROP TABLE IF EXISTS `outsourcing_warehousing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outsourcing_warehousing` (
  `outsourcing_no` int NOT NULL,
  `orders_name` varchar(45) DEFAULT NULL,
  `prod_name` varchar(45) DEFAULT NULL,
  `process` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `warehousing_exp_date` date DEFAULT NULL,
  `faulty` varchar(45) DEFAULT NULL,
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
  KEY `worker_idx` (`worker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outsourcing_warehousing`
--

LOCK TABLES `outsourcing_warehousing` WRITE;
/*!40000 ALTER TABLE `outsourcing_warehousing` DISABLE KEYS */;
/*!40000 ALTER TABLE `outsourcing_warehousing` ENABLE KEYS */;
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
