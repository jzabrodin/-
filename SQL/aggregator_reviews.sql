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
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `rating` tinyint(4) NOT NULL,
  `comment` text CHARACTER SET utf8,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` char(255) CHARACTER SET utf8 NOT NULL,
  `good_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `reviews_fk_good_id` (`good_id`),
  CONSTRAINT `reviews_fk_good_id` FOREIGN KEY (`good_id`) REFERENCES `goods` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (2,8,'wonderfull apples!','2018-11-15 05:42:03','Jeka',1),(3,5,'wonderfull apples!','2018-11-15 05:42:03','Jeka',1),(4,8,'yellow','2018-11-15 05:42:03','Jeka',1),(5,5,'wonderfull apples!','2018-11-15 05:42:03','Jeka',1),(6,8,'wonderfull apples!','2018-11-15 05:42:03','Jeka',1),(7,6,'wonderfull apples!','2018-11-15 05:42:03','Jeka',1),(8,8,'wonderfull apples!','2018-11-15 05:42:03','Jeka',1),(9,7,'wonderfull apples!','2018-11-15 05:42:03','Jeka',1),(10,9,'wonderfull apples!','2018-11-15 05:42:03','Jeka',1),(11,7,'ÐžÑ‡ÐµÐ½ÑŒ ÐºÑ€ÑƒÑ‚Ð¾!','2018-11-17 14:42:14','Johny',11),(12,6,'Ð¢ÑƒÐ¿Ð¾Ð¹ Ñ‚ÐµÐ»ÐµÑ„Ð¾Ð½ Ð¸ Ð´Ð¾Ñ€Ð¾Ð³Ð¾Ð¹','2018-11-17 14:45:15','Ð¨Ð°ÑƒÑ€Ð¼Ð°',11),(13,6,'Ð¢ÑƒÐ¿Ð¾Ð¹ Ñ‚ÐµÐ»ÐµÑ„Ð¾Ð½ Ð¸ Ð´Ð¾Ñ€Ð¾Ð³Ð¾Ð¹','2018-11-17 14:45:37','Ð¨Ð°ÑƒÑ€Ð¼Ð°',11),(14,6,'Ð¢ÑƒÐ¿Ð¾Ð¹ Ñ‚ÐµÐ»ÐµÑ„Ð¾Ð½ Ð¸ Ð´Ð¾Ñ€Ð¾Ð³Ð¾Ð¹','2018-11-17 14:46:29','Ð¨Ð°ÑƒÑ€Ð¼Ð°',11),(15,9,'ÐžÑ‡ÐµÐ½ÑŒ ÐºÑ€ÑƒÑ‚Ð¾!','2018-11-18 10:34:08','Ð¨Ð°ÑƒÑ€Ð¼Ð°',6),(16,5,'Ð­Ñ‚Ð° Ñ…ÑƒÐ¹Ð½Ñ ÑƒÐ»ÐµÑ‚ÐµÐ»Ð° Ð² ÐšÐ¸Ñ‚Ð°Ð¹! Ð§Ñ‚Ð¾ Ñ‚ÐµÐ¿ÐµÑ€ÑŒ Ð´ÐµÐ»Ð°Ñ‚ÑŒ?','2018-11-18 11:43:42','Ð’Ð¾Ð»Ð¾Ð´Ñ',16),(17,10,'ÐŸÑ€Ð¸Ð²ÐµÑ‚ Ð²ÑÐµÐ¼!','2018-11-18 11:56:09','Ð’Ð¾Ð»Ð¾Ð´Ñ',11);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-18 15:03:43
