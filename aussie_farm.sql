-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: aussie_farm
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB-1:10.4.12+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (5,'2014_10_12_000000_create_users_table',1),(6,'2014_10_12_100000_create_password_resets_table',1),(7,'2021_09_13_083712_create_pet_types_table',1),(8,'2021_09_13_084653_create_pets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_types`
--

DROP TABLE IF EXISTS `pet_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pet_types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_types`
--

LOCK TABLES `pet_types` WRITE;
/*!40000 ALTER TABLE `pet_types` DISABLE KEYS */;
INSERT INTO `pet_types` VALUES (1,'Kangaroo','2021-09-13 07:29:11','2021-09-13 07:29:11');
/*!40000 ALTER TABLE `pet_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pet_type_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `gender` enum('Male','Female','') COLLATE utf8mb4_unicode_ci DEFAULT '',
  `birthday` date NOT NULL,
  `weight` double(8,2) unsigned NOT NULL,
  `height` double(8,2) unsigned NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `friendly` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pets_name_unique` (`name`),
  KEY `pets_pet_type_id_foreign` (`pet_type_id`),
  CONSTRAINT `pets_pet_type_id_foreign` FOREIGN KEY (`pet_type_id`) REFERENCES `pets` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,1,'Autumn','Wolff','Female','2005-06-27',121.00,64.00,'Lime',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(2,1,'Mya','Reichel','Male','1993-12-17',242.00,244.00,'IndianRed',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(3,1,'Dereck','Howell','Female','2000-05-28',101.00,97.00,'Violet',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(4,1,'Alysson','Goyette','Female','1999-04-01',193.00,216.00,'Cyan',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(5,1,'Samanta','Bergstrom','Female','1984-12-23',235.00,142.00,'LightGray',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(6,1,'Peggie','Luettgen','Female','2020-06-01',95.00,227.00,'DarkGoldenRod',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(7,1,'Guadalupe','Hahn','Male','2000-06-22',103.00,83.00,'Yellow',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(8,1,'Kyra','Nicolas','Female','1991-12-20',76.00,101.00,'Orange',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(9,1,'Adah','Hettinger','Male','2001-04-08',110.00,106.00,'DarkMagenta',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(10,1,'Deshaun','Skiles','Female','1981-03-02',76.00,64.00,'LightSteelBlue',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(11,1,'Leda','Prohaska','Male','2013-06-09',151.00,152.00,'FireBrick',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(12,1,'Tyrel','Legros','Female','1987-08-20',186.00,154.00,'Cyan',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(13,1,'Delta','Hermiston','Female','1985-04-19',184.00,215.00,'SlateBlue',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(14,1,'Coleman','Lakin','Male','1976-02-26',213.00,210.00,'Indigo',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(15,1,'Kane','Lockman','Female','1981-02-08',240.00,107.00,'SaddleBrown',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(16,1,'Merle','Schulist','Male','1995-11-09',58.00,98.00,'AliceBlue',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(17,1,'Jensen','Sporer','Female','2018-09-15',224.00,80.00,'AliceBlue',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(18,1,'Barton','Jenkins','Male','2014-11-23',214.00,145.00,'DarkViolet',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(19,1,'Gregory','Wunsch','Female','1979-10-15',244.00,61.00,'DarkCyan',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(20,1,'Patricia','Lubowitz','Male','2017-07-27',57.00,95.00,'DarkViolet',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(21,1,'Merritt','Dickinson','Male','1998-10-19',179.00,71.00,'RosyBrown',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(22,1,'Darrin','Huel','Female','1987-11-25',96.00,68.00,'Peru',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(23,1,'Braden','Koepp','Female','1989-12-09',205.00,173.00,'Navy',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(24,1,'Eliza','Conroy','Male','1995-03-29',236.00,233.00,'Peru',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(25,1,'Khalil','Kling','Female','2001-11-28',245.00,169.00,'SpringGreen',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(26,1,'Amiya','Sporer','Male','1972-10-18',50.00,139.00,'Pink',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(27,1,'Brendan','Lowe','Female','1978-02-17',56.00,202.00,'DarkGoldenRod',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(28,1,'Eveline','Collins','Male','1991-01-16',100.00,126.00,'LavenderBlush',0,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(29,1,'Lexus','Dietrich','Male','2021-05-04',124.00,144.00,'DarkGray',1,'2021-09-13 07:29:11','2021-09-13 07:29:11'),(30,1,'Emmie','Lynch','Female','1980-01-11',198.00,58.00,'Linen',0,'2021-09-13 07:29:11','2021-09-13 07:29:11');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-13 23:29:41
