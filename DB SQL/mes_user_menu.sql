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
-- Table structure for table `user_menu`
--

DROP TABLE IF EXISTS `user_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_menu` (
  `user_id` varchar(45) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `sales` varchar(45) DEFAULT NULL,
  `prod` varchar(45) DEFAULT NULL,
  `work` varchar(45) DEFAULT NULL,
  `material_prod` varchar(45) DEFAULT NULL,
  `order_warehousing` varchar(45) DEFAULT NULL,
  `dashboard` varchar(1024) DEFAULT NULL,
  `info_manage` varchar(45) DEFAULT NULL,
  `admin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `u_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_menu`
--

LOCK TABLES `user_menu` WRITE;
/*!40000 ALTER TABLE `user_menu` DISABLE KEYS */;
INSERT INTO `user_menu` VALUES ('Admin','admin_name','견적서 관리,수주 관리','생산 진행 관리,진척 현황','전체작업일보,나의작업일보,외주작업일보,불량 관리,게시판','부품 관리,자재 관리,자재 현황 조회','발주 관리,외주 관리,입출고 관리','작업자별 실적 현황,수주별 작업공수표,계획대비 실적원가분석,불량현황,PQCD 현황,설비 가동 현황,외주 비용 현황,소모품 현황','공통코드 관리,업체 관리,표준공정 관리,설비 관리','사용자 관리,사용자 메뉴 관리'),('admin10','admin_name10','견적서 관리,수주 관리','진척 현황','게시판',NULL,'발주 관리,외주 관리',NULL,NULL,NULL),('admin11','1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin12','1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin13','1212','수주 관리',NULL,'전체작업일보,나의작업일보,외주작업일보,불량 관리,게시판',NULL,NULL,NULL,NULL,NULL),('admin14','1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin15','1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin16','1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin17','1212','견적서 관리,수주 관리','생산 진행 관리,진척 현황','전체작업일보,나의작업일보,외주작업일보,불량 관리,게시판',NULL,'발주 관리,외주 관리,입출고 관리','작업자별 실적 현황,수주별 작업공수표,계획대비 실적원가분석,불량현황,PQCD 현황,설비 가동 현황,외주 비용 현황,소모품 현황','공통코드 관리,업체 관리,표준공정 관리,설비 관리','사용자 관리,사용자 메뉴 관리'),('admin18','1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin19','1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin2','admin_name2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin20','1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin21','1212',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin22','admin_name22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin3','admin_name3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin4','admin_name4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin5','admin_name5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin6','admin_name6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin7','admin_name7','견적서 관리,수주 관리','생산 진행 관리,진척 현황','전체작업일보,나의작업일보,외주작업일보,불량 관리,게시판',NULL,'발주 관리,외주 관리,입출고 관리','작업자별 실적 현황,수주별 작업공수표,계획대비 실적원가분석,불량현황,PQCD 현황,설비 가동 현황,외주 비용 현황,소모품 현황','공통코드 관리,업체 관리,표준공정 관리,설비 관리','사용자 관리,사용자 메뉴 관리'),('admin8','admin_name8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('admin9','admin_name9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('adminyes','adminyes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('asdds','ADMINNAME',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('TEST','test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_menu` ENABLE KEYS */;
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
