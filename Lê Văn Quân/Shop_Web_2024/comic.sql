-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: book
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `book_dtls`
--

DROP TABLE IF EXISTS `book_dtls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_dtls` (
  `bookid` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `bookCategory` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_dtls`
--

LOCK TABLES `book_dtls` WRITE;
/*!40000 ALTER TABLE `book_dtls` DISABLE KEYS */;
INSERT INTO `book_dtls` VALUES (20,'Conan','kudo no','998','New','Active','conan.jpg','admin'),(24,'Jujutsu Kaisen','Akutami Gege','988','Japan','Active','j6.jpeg','admin'),(25,'Attack on Titan','Isayama Hajime','550','Japan','Active','j7.jpeg','admin'),(26,'Dragon Ball','Toriyama Akira','1009','Japan','Active','j1.jpg','admin'),(27,'Naruto','Masashi Kishimoto','462','Japan','Active','j8.jpeg','admin'),(28,'Tokyo Ghoul','Ishida Sui','559','Japan','Active','j9.jpg','admin'),(29,'Bleach','Kubo Taito','889','Japan','Active','j5.jpeg','admin'),(30,'Detective Conan','Aoyama Gōshō','445','Japan','Active','j2.jpg','admin'),(31,'Kimetsu no Yaiba','Koyoharu Gotoge','669','Japan','Active','j3.jpg','admin'),(32,'One Piece ','Oda Eiichiro','1111','Japan','Active','j4.jpg','admin'),(33,'One-Punch Man','ONE','559','Japan','Active','j10.jpg','admin'),(34,'Toàn Chức Pháp Sư','Loạn Loạn','333','China','Active','c1.jpeg','admin'),(35,'Thần Đồng Đất Việt','Phan Thị','999','VietNam','Active','v1.jpeg','admin'),(36,'Đấu La Đại Lục','Đường Gia Tam Thiếu','555','China','Active','c2.jpeg','admin'),(37,'Nguyên Tôn','Thiên Tằm Thổ Đậu','655','China','Active','c3.jpeg','admin'),(38,'Đấu Phá Thương Khung','Thiên Tằm Thổ Đậu','999','China','Active','c4.jpg','admin'),(39,'Tây Du Ký','Tàu Khựa','555','China','Active','c5.jpg','admin'),(40,'Thế Giới Hoàn Mỹ','Thần Đông','669','China','Active','tc6.jpg','admin'),(41,'Già Thiên','Thần Đông','889','China','Active','c7.jpg','admin'),(42,'Thôn Phệ Tinh Không','Ngã Cật Tây Hồng Thị','445','China','Active','c8.jpeg','admin'),(43,'Tru Tiên','Tiêu Đỉnh','666','China','Active','c9.jpeg','admin'),(44,'Phàm Nhân Tu Tiên','Vong Ngữ','889','China','Active','c10.jpg','admin'),(45,'Dũng Sĩ Hesman','Hùng Lân','445','VietNam','Active','v2.jpg','admin'),(46,'Trạng Quỳnh','Kim Khánh','999','VietNam','Active','v3.jpeg','admin'),(47,'Tý Quậy','Đào Hải','559','VietNam','Active','v4.jpg','admin');
/*!40000 ALTER TABLE `book_dtls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_order`
--

DROP TABLE IF EXISTS `book_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(450) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `book_name` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_order`
--

LOCK TABLES `book_order` WRITE;
/*!40000 ALTER TABLE `book_order` DISABLE KEYS */;
INSERT INTO `book_order` VALUES (7,'BOOK-ORD-0064','quandz1','quandz1@gmail.com','ha noi,đsfggsg,aaaa,eeeee,2222','275226785','Conan','kudo no','998.0','COD'),(8,'BOOK-ORD-0064','quandz1','quandz1@gmail.com','ha noi,đsfggsg,aaaa,eeeee,2222','275226785','Conan','kudo no','998.0','COD'),(9,'BOOK-ORD-0064','quandz1','quandz1@gmail.com','ha noi,đsfggsg,aaaa,eeeee,2222','275226785','Conan','kudo no','998.0','COD'),(13,'BOOK-ORD-0054','quandz1','quandz1@gmail.com','ertete,đsfggsg,ererre,ttttt,3546','275226785','bleach','kudo','999.0','OP'),(14,'BOOK-ORD-0062','test1','test1@gmail.com','ha noi,ha noi,ha noi,ha noi,123','12345678','Conan','kudo no','998.0','COD'),(15,'BOOK-ORD-0054','quandz1','quandz1@gmail.com','d,d,d,d,3','275226785','bleach','kudo','999.0','COD'),(16,'BOOK-ORD-0054','quandz1','quandz1@gmail.com','d,d,d,d,3','275226785','one piece','abc','1234.0','COD'),(17,'BOOK-ORD-0010','quandz1','quandz1@gmail.com','rt,r,r,r,9','275226785','Conan','kudo no','998.0','OP'),(25,'BOOK-ORD-0078','quandz1','quandz1@gmail.com','a,a,a,a,2','275226785','Conan','kudo no','998.0','COD'),(26,'BOOK-ORD-0074','quandz1','quandz1@gmail.com','aaa,aaa,aaa,aaa,1','275226785','Tý Quậy','Đào Hải','559.0','COD');
/*!40000 ALTER TABLE `book_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `bid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `bookName` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (8,20,4,'Conan','kudo no',998,998),(9,15,4,'momomo','skhsgjv',6754,6754),(14,20,20,'Conan','kudo no',998,998);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` int NOT NULL,
  `bookid` int NOT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `bookid` (`bookid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `book_dtls` (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,2,20,'1234','2024-07-17 03:58:23'),(2,2,20,'1233123123','2024-07-17 03:58:27'),(3,1,20,'123312','2024-07-17 03:58:50');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `money` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','admin@gmail.com','1234','admin','0',NULL),(2,'quandz1','quandz1@gmail.com','275226785','1234','1','38443'),(3,'quan dep trai','quandz123@gmail.com','29282822','1234','1','10000'),(18,'kakaka','ka@gmail.com','12344544','1234','1','10000'),(19,'hihihih','hi@gmail.com','5468465','1234','1','20000'),(20,'test111','test1@gmail.com','12345678','1234','1','3333'),(21,'test2345','test2@gmail.com','12345','1234','1','22222'),(33,'quanhehe','quanhehe@gmail.com','12345678','1234','1','1111'),(35,'test6','test6@gmail.com','12345','1234','1','3343'),(36,'test7','test7@gmail.com','13454465','1234','0',NULL),(37,'test8','test8@gmail.com','7536323','1234','1','12345'),(38,'test9','test9@gmail.com','123345','1234','1',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-19 22:00:56
