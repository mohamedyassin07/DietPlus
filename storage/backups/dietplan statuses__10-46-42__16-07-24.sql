-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dietplus
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `diet_plan_statuses`
--

DROP TABLE IF EXISTS `diet_plan_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet_plan_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_plan_statuses`
--

LOCK TABLES `diet_plan_statuses` WRITE;
/*!40000 ALTER TABLE `diet_plan_statuses` DISABLE KEYS */;
INSERT INTO `diet_plan_statuses` VALUES (1,'Active','2024-07-16 04:43:59','2024-07-16 04:43:59',NULL),(2,'Pending','2024-07-16 04:44:07','2024-07-16 04:44:07',NULL),(3,'Expired','2024-07-16 04:44:20','2024-07-16 04:44:20',NULL),(4,'Paused','2024-07-16 04:44:30','2024-07-16 04:45:38',NULL);
/*!40000 ALTER TABLE `diet_plan_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_categories`
--

DROP TABLE IF EXISTS `food_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_categories`
--

LOCK TABLES `food_categories` WRITE;
/*!40000 ALTER TABLE `food_categories` DISABLE KEYS */;
INSERT INTO `food_categories` VALUES (1,'Fruits','2024-07-16 03:30:58','2024-07-16 03:30:58',NULL),(2,'Vegetables','2024-07-16 03:31:15','2024-07-16 03:31:15',NULL),(3,'Meats','2024-07-16 03:31:26','2024-07-16 03:31:26',NULL),(4,'Grains and Legumes','2024-07-16 03:32:01','2024-07-16 03:32:01',NULL),(5,'Dairy Products','2024-07-16 03:32:08','2024-07-16 03:32:08',NULL),(6,'Nuts and Seeds','2024-07-16 03:32:15','2024-07-16 03:32:15',NULL),(7,'Beverages','2024-07-16 03:32:23','2024-07-16 03:32:23',NULL),(8,'Sweets ','2024-07-16 03:32:35','2024-07-16 03:32:35',NULL);
/*!40000 ALTER TABLE `food_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_restrictions`
--

DROP TABLE IF EXISTS `food_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_restrictions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_restrictions`
--

LOCK TABLES `food_restrictions` WRITE;
/*!40000 ALTER TABLE `food_restrictions` DISABLE KEYS */;
INSERT INTO `food_restrictions` VALUES (1,'Gluten Free','الوصف: نظام غذائي يستبعد الجلوتين، وهو بروتين موجود في القمح، الشعير، والجاودار.\nأسباب الشيوع: يُستخدم للأشخاص الذين يعانون من مرض السيلياك أو حساسية الجلوتين.\n','medium','2024-07-16 03:45:20','2024-07-16 03:53:44',NULL),(2,'Lactose Free','الوصف: نظام غذائي يستبعد اللاكتوز، وهو السكر الموجود في منتجات الألبان.\nأسباب الشيوع: يُستخدم للأشخاص الذين يعانون من عدم تحمل اللاكتوز.\n','medium','2024-07-16 03:45:39','2024-07-16 03:53:32',NULL),(3,'Vegetarian','الوصف: نظام غذائي يستبعد اللحوم والأسماك، ولكنه قد يشمل منتجات الألبان والبيض.\nأسباب الشيوع: يُتبنى لأسباب صحية، أخلاقية، أو بيئية.\n','medium','2024-07-16 03:45:54','2024-07-16 03:45:54',NULL),(4,'Low Sodium','الوصف: نظام غذائي يحد من تناول الصوديوم (الملح) للمساعدة في إدارة ضغط الدم وصحة القلب.\nأسباب الشيوع: يُستخدم للأشخاص الذين يعانون من ارتفاع ضغط الدم أو أمراض القلب.\n','medium','2024-07-16 03:46:31','2024-07-16 03:46:31',NULL),(5,'Vegan','الوصف: نظام غذائي يستبعد جميع المنتجات الحيوانية، بما في ذلك اللحوم، الأسماك، منتجات الألبان، البيض، والعسل.\nأسباب الشيوع: يُتبنى لأسباب صحية، أخلاقية، أو بيئية.\n','low','2024-07-16 03:46:48','2024-07-16 03:46:56',NULL);
/*!40000 ALTER TABLE `food_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `unit` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restriction_id` bigint unsigned DEFAULT NULL,
  `calories` double(8,2) NOT NULL,
  `fats` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foods_category_id_foreign` (`category_id`),
  KEY `foods_restriction_id_foreign` (`restriction_id`),
  CONSTRAINT `foods_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `food_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `foods_restriction_id_foreign` FOREIGN KEY (`restriction_id`) REFERENCES `food_restrictions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'Apple',1,'Piece',3,95.00,0.30,'2024-07-16 04:23:50','2024-07-16 04:23:50',NULL),(2,'Grilled Chicken',3,'100 gram',1,165.00,3.60,'2024-07-16 04:25:29','2024-07-16 04:25:29',NULL),(3,'Brown Rice',4,'Cup',5,218.00,1.60,'2024-07-16 04:26:48','2024-07-16 04:26:48',NULL),(4,'Almonds',6,'piece',5,161.00,14.00,'2024-07-16 04:27:23','2024-07-16 04:27:23',NULL),(5,'Yogurt',5,'cup',4,150.00,8.00,'2024-07-16 04:28:23','2024-07-16 04:28:23',NULL),(6,'Spinach',2,'cup',5,23.00,0.40,'2024-07-16 04:29:17','2024-07-16 04:29:17',NULL),(7,'Banana',1,'piece',1,105.00,0.30,'2024-07-16 04:29:56','2024-07-16 04:29:56',NULL);
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2024_07_15_045901_add_fields_to_users_table',2),(6,'2024_07_15_055731_create_user_quizzes_table',3),(7,'2024_07_15_070210_create_packages_table',4),(8,'2024_07_16_060923_create_payments_table',5),(9,'2024_07_16_061508_add_user_id_to_payments_table',6),(10,'2024_07_16_062704_create_food_categories_table',7),(11,'2024_07_16_063350_create_food_table',8),(12,'2024_07_16_063750_create_food_restrictions_table',9),(13,'2024_07_16_070157_drop_foods_table',10),(14,'2024_07_16_070443_drop_food_table',11),(15,'2024_07_16_070538_create_foods_table',12),(16,'2024_07_16_073709_create_diet_plan_statuses_table',13);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration_in_days` int DEFAULT NULL,
  `duration_as_string` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `sale_price_deadline` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
INSERT INTO `packages` VALUES (1,'Bronze',30,'Month',100.00,90.00,'2024-07-17','2024-07-16 02:49:03','2024-07-16 02:49:03',NULL),(2,'Gold',30,'Month',200.00,180.00,'2024-07-12','2024-07-16 02:57:18','2024-07-16 02:57:18',NULL),(3,'Platinum',30,'Month',300.00,NULL,NULL,'2024-07-16 02:57:56','2024-07-16 03:02:48',NULL);
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_user_id_foreign` (`user_id`),
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,5,30.50,'usd','stripe','2024-07-05 09:17:55','completed','2024-07-16 03:18:21','2024-07-16 03:23:04',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_quizzes`
--

DROP TABLE IF EXISTS `user_quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_quizzes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `quiz_data` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_quizzes_user_id_foreign` (`user_id`),
  CONSTRAINT `user_quizzes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_quizzes`
--

LOCK TABLES `user_quizzes` WRITE;
/*!40000 ALTER TABLE `user_quizzes` DISABLE KEYS */;
INSERT INTO `user_quizzes` VALUES (1,5,'[{\"data\": {\"sex\": null, \"height\": null, \"weight\": null, \"birth_year\": \"oiui\", \"eating_habits\": null, \"health_status\": null, \"weight_targeted\": null, \"nutritional_goals\": null, \"physical_activity\": null, \"psychological_state\": null}, \"type\": \"template_2\"}]','2024-07-15 03:07:27','2024-07-15 03:18:22',NULL);
/*!40000 ALTER TABLE `user_quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Mohamed Yassin','admin@admin.com','2024-07-14 05:38:22','$2y$12$He5wjb41RluoAvkDgwREuO5E4MxbIWZOrLY1N41dVewHoCNqJC4EC',NULL,'2024-07-15 02:06:18','2024-07-15 03:57:02',NULL,'Admin','01J2TE6R71199YH2M3E7DZR5GB.png'),(3,'Admin 3','admin2@admins.com','2026-06-06 05:34:07','$2y$12$L7TeBYAVzDXCrp7CLEseNOQ4vhf4dekz9TTv5wLzhFSUPqJV14X0S',NULL,'2024-07-15 02:10:57','2024-07-15 02:38:35','2024-07-15 02:38:35','Admin','01J2TDPM4PSDNMNCFPDCA95XG3.png'),(4,'Admin 2','admin2@admin.com','2024-07-13 06:08:23','$2y$12$G7M7fZCijAUH.dlXqCxbJulQuDPkn355O0bqxi.WsENkuaiomG3gK',NULL,'2024-07-15 03:05:48','2024-07-15 03:05:48',NULL,'Admin','01J2TFYJDWBF4XATZEG1N8PF55.png'),(5,'customer 1','customer@customer.com','2024-07-06 06:09:37','$2y$12$QRfgMUviuuxhp3N/SMyuOeBCtLzh6.wcGy91NoobQp0kOlTYrFDTi',NULL,'2024-07-15 03:06:58','2024-07-15 03:13:17',NULL,'Customer','01J2TG0Q8D7XHK5QS2G2AKVYC6.png');
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

-- Dump completed on 2024-07-16 10:46:43
