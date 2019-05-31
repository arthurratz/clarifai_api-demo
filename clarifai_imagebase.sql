CREATE DATABASE  IF NOT EXISTS `clrfai_imagebase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clrfai_imagebase`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.0.1    Database: clrfai_imagebase
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classes` (
  `class_id` varchar(40) DEFAULT NULL,
  `class_name` varchar(45) NOT NULL,
  UNIQUE KEY `class_name_UNIQUE` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('8bf4f5c4-820c-11e9-8859-40b0765cfedf','Luxury Cars'),('89669200-820b-11e9-8859-40b0765cfedf','Trucks');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `classes_BEFORE_INSERT` BEFORE INSERT ON `classes` FOR EACH ROW BEGIN
    SET new.class_id = uuid();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `images` (
  `image_id` varchar(40) DEFAULT NULL,
  `class_id` varchar(40) NOT NULL,
  `image_url` varchar(266) NOT NULL,
  UNIQUE KEY `image_url_UNIQUE` (`image_url`),
  UNIQUE KEY `image_id_UNIQUE` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('ff7c7ab6-820b-11e9-8859-40b0765cfedf','89669200-820b-11e9-8859-40b0765cfedf','http://www.eprzewoznik.pl/wp-content/uploads/2017/02/DAF-euro-6-range-940.jpg'),('ff7c79d8-820b-11e9-8859-40b0765cfedf','89669200-820b-11e9-8859-40b0765cfedf','http://www.truckphoto.net/New_Scania_Trucks.jpg'),('adefcedd-820c-11e9-8859-40b0765cfedf','8bf4f5c4-820c-11e9-8859-40b0765cfedf','https://cdn.images.express.co.uk/img/dynamic/24/590x/Ford-Mustang-951456.jpg'),('adefce4a-820c-11e9-8859-40b0765cfedf','8bf4f5c4-820c-11e9-8859-40b0765cfedf','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQheJ2-BDSFQaG5WtXXGb-H3_3WY5acEE_GQel-zGcBVB3DHsCi'),('adefcd6d-820c-11e9-8859-40b0765cfedf','8bf4f5c4-820c-11e9-8859-40b0765cfedf','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgHmxqGU5pt2X7Od7gbheIDfnkR5EvgByHCjQ083rtHYUYGDaI'),('adefca11-820c-11e9-8859-40b0765cfedf','8bf4f5c4-820c-11e9-8859-40b0765cfedf','https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/roa080118dpt-drives-continentalgt-06-1534221675.jpg?crop=0.754xw:0.779xh;0,0.221xh&resize=480:*'),('ff7c7b35-820b-11e9-8859-40b0765cfedf','89669200-820b-11e9-8859-40b0765cfedf','https://kancelaria-w-poznaniu.pl/wp-content/uploads/2018/09/rejestr-kreptd-uruchomiony.jpg'),('ff7c75a6-820b-11e9-8859-40b0765cfedf','89669200-820b-11e9-8859-40b0765cfedf','https://media.wired.com/photos/5b9c3d5e7d9d332cf364ad66/master/pass/AV-Trucks-187479297.jpg'),('adefcf5b-820c-11e9-8859-40b0765cfedf','8bf4f5c4-820c-11e9-8859-40b0765cfedf','https://picolio.auto123.com/auto123-media/articles/2019/2/65613/bmw_m2_competition_coupefr.jpeg?scaledown=450'),('ff7c782a-820b-11e9-8859-40b0765cfedf','89669200-820b-11e9-8859-40b0765cfedf','https://televizijastar.com/wp-content/uploads/2019/02/kamioni.jpg'),('adefd001-820c-11e9-8859-40b0765cfedf','8bf4f5c4-820c-11e9-8859-40b0765cfedf','https://topluxurytravellers.com/_files/200000344-61fb962f43/Rolls-Royce-Ghost-ppcorn.jpg\n'),('ff7c794b-820b-11e9-8859-40b0765cfedf','89669200-820b-11e9-8859-40b0765cfedf','https://www.biznisvesti.mk/wp-content/uploads/2014/06/kamion2.jpg');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `images_BEFORE_INSERT` BEFORE INSERT ON `images` FOR EACH ROW BEGIN
   SET new.image_id = uuid();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'clrfai_imagebase'
--

--
-- Dumping routines for database 'clrfai_imagebase'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-29 15:26:31
