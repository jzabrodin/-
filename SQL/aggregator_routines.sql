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
-- Temporary table structure for view `goods_average_rating`
--

DROP TABLE IF EXISTS `goods_average_rating`;
/*!50001 DROP VIEW IF EXISTS `goods_average_rating`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `goods_average_rating` AS SELECT 
 1 AS `good_id`,
 1 AS `average_rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `goods_comments`
--

DROP TABLE IF EXISTS `goods_comments`;
/*!50001 DROP VIEW IF EXISTS `goods_comments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `goods_comments` AS SELECT 
 1 AS `ID`,
 1 AS `name`,
 1 AS `image_path`,
 1 AS `comment`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `goods_rating`
--

DROP TABLE IF EXISTS `goods_rating`;
/*!50001 DROP VIEW IF EXISTS `goods_rating`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `goods_rating` AS SELECT 
 1 AS `good_id`,
 1 AS `comments_quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `goods_average_rating`
--

/*!50001 DROP VIEW IF EXISTS `goods_average_rating`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sem`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `goods_average_rating` AS select `reviews`.`good_id` AS `good_id`,avg(`reviews`.`rating`) AS `average_rating` from `reviews` group by `reviews`.`good_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goods_comments`
--

/*!50001 DROP VIEW IF EXISTS `goods_comments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sem`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `goods_comments` AS select `goods`.`ID` AS `ID`,`goods`.`name` AS `name`,`goods`.`image_path` AS `image_path`,`reviews`.`comment` AS `comment` from (`reviews` left join `goods` on((`goods`.`ID` = `reviews`.`good_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goods_rating`
--

/*!50001 DROP VIEW IF EXISTS `goods_rating`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sem`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `goods_rating` AS select `reviews`.`good_id` AS `good_id`,count(`reviews`.`comment`) AS `comments_quantity` from `reviews` group by `reviews`.`good_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-18 15:03:44
