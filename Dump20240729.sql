-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project01
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('test','test','황길동','moyasemi02@gmail.com');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cat_num` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `cat_name` varchar(20) NOT NULL,
  PRIMARY KEY (`cat_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'100','Keyrings'),(2,'200','Living'),(3,'300','Fashion'),(5,'400','ETC');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_member`
--

DROP TABLE IF EXISTS `p_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_member` (
  `no` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `pw` varchar(200) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int NOT NULL,
  `tel` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_member`
--

LOCK TABLES `p_member` WRITE;
/*!40000 ALTER TABLE `p_member` DISABLE KEYS */;
INSERT INTO `p_member` VALUES (1,'user','1212','project01',1,'010-1111-1111','moyasemi02@gmail.com'),(2,'test1212','$2a$10$xqovfZGOyUizTZxaVMZCpucJX.3JVSOjL7uvarB3XQMjDVitShnDC','신짱구',20,'01011111111','moyasemi@naver.com'),(3,'test1313','$2a$10$LhcH6gFwcroWTZBorWVaqu4W4GRkEcEjiR8pZMwCWFeW5z8UQSb6q','일삼이',13,'01012341234','moyasemi@naver.com');
/*!40000 ALTER TABLE `p_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_board`
--

DROP TABLE IF EXISTS `tbl_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_board` (
  `bid` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(100) NOT NULL,
  `contents` varchar(3000) NOT NULL,
  `hit` int DEFAULT '0',
  `writer` varchar(50) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `replyCnt` int DEFAULT '0',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_board`
--

LOCK TABLES `tbl_board` WRITE;
/*!40000 ALTER TABLE `tbl_board` DISABLE KEYS */;
INSERT INTO `tbl_board` VALUES (1,'테스트!~~','테스트',6,'아무개','2024-07-17 16:03:01',0),(2,'두번째 글','글내용ㅎ',39,'아무개','2024-07-22 15:12:45',1);
/*!40000 ALTER TABLE `tbl_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cart`
--

DROP TABLE IF EXISTS `tbl_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cart` (
  `cart_num` int NOT NULL AUTO_INCREMENT,
  `id` varchar(20) DEFAULT NULL,
  `pnum` int DEFAULT NULL,
  `pqty` int DEFAULT '1',
  `indate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_num`),
  KEY `id` (`id`),
  KEY `pnum` (`pnum`),
  CONSTRAINT `tbl_cart_ibfk_1` FOREIGN KEY (`id`) REFERENCES `p_member` (`id`),
  CONSTRAINT `tbl_cart_ibfk_2` FOREIGN KEY (`pnum`) REFERENCES `tbl_product` (`pnum`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cart`
--

LOCK TABLES `tbl_cart` WRITE;
/*!40000 ALTER TABLE `tbl_cart` DISABLE KEYS */;
INSERT INTO `tbl_cart` VALUES (4,'test1313',5,1,'2024-07-26 06:57:47'),(5,'test1313',2,1,'2024-07-26 07:01:36'),(6,'test1313',6,1,'2024-07-26 07:01:39'),(7,'test1313',3,1,'2024-07-29 04:05:00');
/*!40000 ALTER TABLE `tbl_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product` (
  `pnum` int NOT NULL AUTO_INCREMENT,
  `pname` varchar(50) NOT NULL,
  `pcategory_fk` varchar(20) NOT NULL,
  `pcompany` varchar(50) DEFAULT NULL,
  `pimage` varchar(50) DEFAULT NULL,
  `pqty` int DEFAULT '0',
  `price` int DEFAULT '0',
  `pspec` varchar(20) DEFAULT NULL,
  `pcontent` varchar(300) DEFAULT NULL,
  `point` int DEFAULT '0',
  `pinput_date` date DEFAULT NULL,
  PRIMARY KEY (`pnum`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (2,'2','100',NULL,'1721878323159_8.jpg',100,10000,'RECOMMEND','kerying',100,'2024-07-25'),(3,'3','100',NULL,'5.jpg',100,10000,'NEW','keyring',100,'2024-07-19'),(4,'fashion001','300',NULL,'11.jpg',100,65654,'RECOMMEND','fwefwe',100,'2024-07-25'),(5,'fashion002','300','','22.jpg',100,60000,'RECOMMEND','sdfsdf',100,NULL),(6,'living001','200',NULL,'toothpaste.jpg',100,100000,'HIT','living',10000,'2024-07-25'),(7,'ETC001','400',NULL,'111.jpg',654,968464,'HIT','etc',51641,'2024-07-25'),(8,'How Sweet T-shirt','400',NULL,'222.jpg',100,50000,'NEW','500',500,'2024-07-25'),(9,'fashion006','300','','66.jpg',600,60000,'HIT','fashion006',60,NULL),(10,'Bunnies_Attention','400',NULL,'1721878314927_333.jpg',100,10000,'NEW','10000',500,'2024-07-25'),(11,'1','100',NULL,'1721878296829_3.jpg',100,15000,'NEW','키링',20,'2024-07-25'),(12,'RED KEYRING','100','','6.jpg',100,15000,'NEW','HI',150,NULL);
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reply`
--

DROP TABLE IF EXISTS `tbl_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reply` (
  `rno` int NOT NULL AUTO_INCREMENT,
  `bid` int DEFAULT NULL,
  `r_contents` varchar(1000) NOT NULL,
  `replyer` varchar(20) NOT NULL,
  `r_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rno`),
  KEY `bid` (`bid`),
  CONSTRAINT `tbl_reply_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `tbl_board` (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reply`
--

LOCK TABLES `tbl_reply` WRITE;
/*!40000 ALTER TABLE `tbl_reply` DISABLE KEYS */;
INSERT INTO `tbl_reply` VALUES (2,1,'댓글 테스트','홍길동','2024-07-17 16:13:55','2024-07-17 16:13:55'),(3,2,'댓글','댓글테스트','2024-07-29 15:48:55','2024-07-29 15:48:55');
/*!40000 ALTER TABLE `tbl_reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-29 17:43:38
