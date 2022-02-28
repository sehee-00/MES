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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_id` int NOT NULL,
  `board_num` int DEFAULT NULL,
  `regdate` datetime DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `contents` varchar(1024) NOT NULL,
  `writer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,1,'2022-02-04 00:00:00','안녕하세요','게시판 테스트입니다','admin'),(2,13,'2022-02-03 00:00:00','게시판 두번째 테스트입니다','두번째 테스트','admin'),(3,14,'2022-02-04 00:00:00','ㅁ','ㅁ','admin'),(4,15,'2022-02-04 00:00:00','ㅁ','ㅁ','admin'),(5,16,'2022-02-04 00:00:00','ㅁ','ㅁ','admin'),(6,17,'2022-02-04 00:00:00','ㅁ','ㅁ','admin'),(7,18,'2022-02-04 00:00:00','ㅁ','ㅁ','admin'),(8,19,'2022-02-04 00:00:00','ㅁ','ㅁ','admin'),(9,20,'2022-02-04 00:00:00','ㅁ','ㅁ','admin'),(10,21,'2022-02-04 00:00:00','ㅁ','ㅁ','admin'),(11,22,'2022-02-04 00:00:00','ㅁ','ㅁ','admin'),(12,24,'2022-02-11 00:00:00','계세요?','네\n사랑해요','admin'),(13,25,'2022-02-17 00:00:00','여기 사장님 여론조작하네','여기 초기화 버튼 밖에 안뜨고 화면도 이상하다고 글 남긴 사람인데요 \n사장님 왜 제 글만 쏙 지우세요? 어이업네요;;;','admin'),(14,444,'2022-02-17 00:00:00','저 공차먹고싶어요','같이 시켜먹을 사람 있나요?','admin'),(15,445,'2022-02-17 00:00:00','공차 공구에 참여합니다','ㅈㄱㄴ','admin'),(16,446,'2022-02-17 00:00:00','저도 공차 공구에 참여합니다','저도욤 ^^','admin7'),(17,25,'2022-02-17 00:00:00','여기 사장님 여론조작하네','여기 초기화 버튼 밖에 안뜨고 화면도 이상하다고 글 남긴 사람인데요 \n사장님 왜 제 글만 쏙 지우세요? 어이업네요;;;\n하지만 사장님 머싯어요!','admin7'),(18,444,'2022-02-18 00:00:00','게시판 번호가 똑같아도 되나요?','이래도 되냐 이말입니다!! 코딩을 잘못했네!','admin'),(19,444,'2022-02-18 00:00:00','ㄴㄴ RE : 게시판 번호가 똑같아도 되나요?','네 됩니다. \n감사합니다. ','admin'),(20,59,'2022-02-17 00:00:00','하루만에 100억 버는 법','감사합니다.','admin13'),(21,444,'2022-02-18 00:00:00','주식 투자 잘하는 법','노오오력을 하면 뭐든 됩니다. \n그리고 잘 하려면 여기 이 글을 보시면 안되죠.. 빨리 시장 분석하러 가세요!','admin'),(22,59,'2022-02-17 00:00:00','하루만에 100억 버는 법','감사합니다. 꿀꺽','admin7'),(23,4444,'2022-02-17 00:00:00','나만의 김치찌개 레시피','준비물 : 돼지고기, 김치, 양파, 대파 , (두부), 라면\n1. 식용유를 두른다\n2. 고기를 볶는다\n3. 고기가 반쯤 익으면 김치를 넣는다.\n4. 김치와 고기가 다 볶아지면 라면스프를 취향껏 (반개~한개) 넣는다.\n5. 라면스프가 싫으면 간장이나 설탕을 넣는다. 근데 라면스프가 더 맛있음\n6. 양파를 대충 잘라서 넣는다.\n7. 스프를 빼서 면만 남은 라면을 사리로 쓴다.\n완성','admin'),(24,5210,'2022-02-20 00:00:00','끝장나게 맛있는 카레 만들기','준비물 : 돼지고기 적당히, 카레가루, 양파, 그 외 야채 준비, 버터 \n\n1. 비계있는 돼지고기의 비계부터 잘라서 볶는다. \n2. 적당한 크기로 자른 돼지고기를 비계와 함께 볶는다. \n3. 단단한 순으로 야채를 볶는다. \n4. 물을 넣고 모든 야채와 고기가 푸욱 익을때까지 40분이상 끓인다. \n5. 카레가루를 넣고 뭉치지 않게 잘 섞어준다. \n6. 마지막에 버터를 넣고 잘 섞어준다. \n7. 밥과 함께 맛있게 먹는다. \n8. 끝짱나게 맛있는 카레 둘이 먹다 한 명 죽어도 걔꺼 뺏아서 먹는다. ','admin');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
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
