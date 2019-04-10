-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: aggregator
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(255) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` char(255) CHARACTER SET utf8 NOT NULL,
  `image_path` char(255) COLLATE utf8_bin DEFAULT NULL,
  `average_price` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,'Apples','2018-11-15 05:39:07','Jeka',NULL,NULL),(2,'Bananas','2018-11-15 05:39:22','Jeka',NULL,NULL),(3,'Potato','2018-11-15 05:39:33','Vladimir',NULL,NULL),(4,'Kiwi','2018-11-15 05:39:44','Vladimir',NULL,NULL),(6,'hello','2018-11-16 19:01:59','YEvgen','',NULL),(7,'Johny','2018-11-16 19:03:23','YEvgen','',NULL),(8,'Pizza','2018-11-16 19:04:52','Yevgen','',NULL),(9,'Pizza','2018-11-16 19:06:29','Yevgen','https://i.allo.ua/media/catalog/product/cache/1/image/425x295/799896e5c6c37e11608b9f8e1d047d15/a/p/apple_iphone_xr_red_1_1.jpg',NULL),(10,'Johny','2018-11-16 20:57:27','YEvgen','/pictures/Yandex-Images-2016-12-26.jpg',NULL),(11,'ÐšÑ€Ð°ÑÐ½Ñ‹Ð¹ Ð°Ð¹Ñ„Ð¾Ð½','2018-11-17 08:50:20','Ð’Ð¾Ð²Ð°Ð½','https://i.allo.ua/media/catalog/product/cache/1/image/425x295/799896e5c6c37e11608b9f8e1d047d15/a/p/apple_iphone_xr_red_1_1.jpg',NULL),(12,'Ð¨Ð°ÑƒÑ€Ð¼Ð°','2018-11-17 09:08:09','Ð”Ð¸Ð¼Ð¾Ð½','https://s2.eda.ru/StaticContent/Photos/121120172110/121123130033/p_O.jpg',NULL),(13,'Ð¨Ð°ÑƒÑ€Ð¼Ð°','2018-11-17 09:08:52','Ð”Ð¸Ð¼Ð¾Ð½','https://s2.eda.ru/StaticContent/Photos/121120172110/121123130033/p_O.jpg',NULL),(14,'Ñ‚ÐµÑÑ‚Ð¾','2018-11-18 10:32:18','Ð’Ð¾Ð²Ð°Ð½','pictures/Yandex-Images-2016-12-29.jpg',NULL),(15,'Ñ‚ÐµÑÑ‚Ð¾','2018-11-18 10:32:42','Ð’Ð¾Ð²Ð°Ð½','pictures/Yandex-Images-2016-12-29.jpg',NULL),(16,'ÐšÐ²Ð°Ð´Ñ€Ð¾ÐºÐ¾Ð¿Ñ‚ÐµÑ€','2018-11-18 11:41:31','Ð•Ð²Ð³ÐµÐ½Ð¸Ð¹','https://i1.rozetka.ua/goods/7044357/dji_6958265174445_images_7044357804.jpg',NULL),(17,'Ð“ÐµÐ»Ð¸ÐºÐ¾Ð¿Ñ‚ÐµÑ€','2018-11-18 11:49:15','Ð’Ð¾Ð²Ð°Ð½','https://i1.rozetka.ua/goods/7044359/dji_6958265174445_images_7044359352.jpg',NULL),(18,'Ð“ÐµÐ»Ð¸ÐºÐ¾Ð¿Ñ‚ÐµÑ€','2018-11-18 11:50:02','Ð’Ð¾Ð²Ð°Ð½','https://i1.rozetka.ua/goods/7044359/dji_6958265174445_images_7044359352.jpg',NULL),(19,'ÐšÐ½Ð¸Ð³Ð° Ð¿Ð¾ ÑˆÐ°Ð±Ð»Ð¾Ð½Ð°Ð¼ Ð¿Ñ€Ð¾ÐµÐºÑ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ñ','2018-11-18 12:09:31','Ð•Ð²Ð³ÐµÐ½Ð¸Ð¹','pictures/1000281214.jpg',NULL),(20,'Xiaomi Redmi 2','2018-11-18 12:57:06','','https://i2.rozetka.ua/goods/1273488/xiaomi_redmi_2_1_8black_images_1273488761.jpg',2000);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-18 15:03:44
