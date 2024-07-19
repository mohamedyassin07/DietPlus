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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `diet_plans`
--

DROP TABLE IF EXISTS `diet_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `meals_schedule` json NOT NULL,
  `status_id` bigint unsigned NOT NULL,
  `deadline` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `diet_plans_user_id_foreign` (`user_id`),
  KEY `diet_plans_status_id_foreign` (`status_id`),
  CONSTRAINT `diet_plans_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `diet_plan_statuses` (`id`),
  CONSTRAINT `diet_plans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_plans`
--

LOCK TABLES `diet_plans` WRITE;
/*!40000 ALTER TABLE `diet_plans` DISABLE KEYS */;
INSERT INTO `diet_plans` VALUES (1,5,'{}',1,'2024-07-12','2024-07-16 04:53:17','2024-07-16 05:01:08','2024-07-16 05:01:08'),(2,15,'\"{}\"',3,'2024-07-08','2024-07-16 05:21:26','2024-07-19 15:19:07','2024-07-19 15:19:07'),(3,16,'[{\"lunch\": [{\"food_id\": \"2\", \"quantity\": \"234\"}], \"dinner\": [{\"food_id\": \"3\", \"quantity\": \"234\"}], \"snack_1\": [{\"food_id\": \"2\", \"quantity\": \"234\"}], \"snack_2\": [{\"food_id\": \"3\", \"quantity\": \"233\"}], \"day_date\": \"2024-07-14\", \"breakfast\": [{\"food_id\": \"4\", \"quantity\": \"34\"}]}, {\"lunch\": [{\"food_id\": \"2\", \"quantity\": \"234\"}], \"dinner\": [{\"food_id\": \"3\", \"quantity\": \"234\"}], \"snack_1\": [{\"food_id\": \"2\", \"quantity\": \"234\"}], \"snack_2\": [{\"food_id\": \"3\", \"quantity\": \"233\"}], \"day_date\": \"2024-07-14\", \"breakfast\": [{\"food_id\": \"4\", \"quantity\": \"34\"}]}]',1,'2024-07-10','2024-07-16 05:25:31','2024-07-19 15:27:29',NULL),(4,5,'[{\"lunch\": [{\"food_id\": \"3\", \"quantity\": \"4\"}], \"dinner\": [{\"food_id\": \"3\", \"quantity\": \"4\"}], \"snack_1\": [{\"food_id\": \"2\", \"quantity\": \"4\"}], \"snack_2\": [{\"food_id\": \"4\", \"quantity\": \"4\"}], \"day_date\": \"2024-07-20\", \"breakfast\": [{\"food_id\": \"2\", \"quantity\": \"4\"}]}, {\"lunch\": [], \"dinner\": [], \"snack_1\": [], \"snack_2\": [], \"day_date\": \"2024-08-03\", \"breakfast\": []}]',2,'2024-07-30','2024-07-16 05:29:13','2024-07-19 15:09:19',NULL),(5,5,'[{\"day_date\": \"2024-07-25\"}, {\"day_date\": \"2024-07-06\"}]',1,'2024-07-04','2024-07-16 05:34:56','2024-07-16 05:34:56',NULL),(6,15,'[{\"lunch\": [], \"dinner\": [], \"snack_1\": [], \"snack_2\": [], \"day_date\": \"2024-07-25\", \"breakfast\": [{\"food_id\": \"3\", \"quantity\": \"432423\"}]}]',4,'2024-07-10','2024-07-16 05:43:30','2024-07-19 15:10:13',NULL),(7,5,'[{\"lunch\": [{\"food_id\": \"5\", \"quantity\": \"324\"}], \"dinner\": [{\"food_id\": \"3\", \"quantity\": \"234\"}], \"snack_1\": [{\"food_id\": \"1\", \"quantity\": \"234\"}, {\"food_id\": \"4\", \"quantity\": \"324\"}], \"snack_2\": [{\"food_id\": \"3\", \"quantity\": \"234\"}], \"day_date\": \"2024-07-17\", \"breakfast\": [{\"food_id\": \"1\", \"quantity\": \"342\"}, {\"food_id\": \"2\", \"quantity\": \"324\"}]}]',1,'2024-08-01','2024-07-19 14:59:47','2024-07-19 14:59:47',NULL),(8,5,'[{\"lunch\": [{\"food_id\": \"3\", \"quantity\": \"234\"}], \"dinner\": [{\"food_id\": \"5\", \"quantity\": \"234\"}], \"snack_1\": [{\"food_id\": \"3\", \"quantity\": \"234\"}], \"snack_2\": [{\"food_id\": \"4\", \"quantity\": \"23\"}], \"day_date\": \"2024-07-13\", \"breakfast\": [{\"food_id\": \"2\", \"quantity\": \"234\"}]}]',4,'2024-07-23','2024-07-19 15:02:14','2024-07-19 15:02:14',NULL),(9,5,'[{\"lunch\": [{\"food_id\": \"4\", \"quantity\": \"345\"}], \"dinner\": [{\"food_id\": \"6\", \"quantity\": \"345\"}], \"snack_1\": [{\"food_id\": \"3\", \"quantity\": \"43\"}], \"snack_2\": [{\"food_id\": \"5\", \"quantity\": \"345\"}], \"day_date\": \"2024-07-31\", \"breakfast\": [{\"food_id\": \"4\", \"quantity\": \"45\"}]}]',3,'2024-07-16','2024-07-19 15:03:07','2024-07-19 15:03:07',NULL),(10,16,'[{\"lunch\": [{\"food_id\": \"3\", \"quantity\": \"234\"}], \"dinner\": [{\"food_id\": \"4\", \"quantity\": \"23\"}], \"snack_1\": [{\"food_id\": \"3\", \"quantity\": \"23\"}], \"snack_2\": [{\"food_id\": \"4\", \"quantity\": \"234\"}], \"day_date\": \"2024-07-25\", \"breakfast\": [{\"food_id\": \"3\", \"quantity\": \"23\"}]}]',1,'2024-07-31','2024-07-19 15:05:07','2024-07-19 15:05:07',NULL),(11,14,'[{\"lunch\": [{\"food_id\": \"4\", \"quantity\": \"345\"}], \"dinner\": [{\"food_id\": \"3\", \"quantity\": \"435\"}], \"snack_1\": [{\"food_id\": \"1\", \"quantity\": \"435\"}], \"snack_2\": [{\"food_id\": \"4\", \"quantity\": \"34\"}], \"day_date\": \"2024-07-11\", \"breakfast\": [{\"food_id\": \"1\", \"quantity\": \"34\"}]}]',1,'2024-07-25','2024-07-19 15:08:37','2024-07-19 15:08:37',NULL);
/*!40000 ALTER TABLE `diet_plans` ENABLE KEYS */;
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',8,'API Token','908c6a2b9772c3f9adddee3d6d697eeaf3a4e8ef535528cf1791e9ff21b1ac5d','[\"*\"]','2024-07-17 04:08:16',NULL,'2024-07-17 03:31:54','2024-07-17 04:08:16'),(2,'App\\Models\\User',6,'API Token','aca1004656edebbc042b5d15a889b8b5231b354fd96210ab109d19235911cd9c','[\"*\"]',NULL,NULL,'2024-07-17 03:35:13','2024-07-17 03:35:13'),(3,'App\\Models\\User',9,'API Token','b2fe263bb8c1c78874dfdb01ea9181469248e86acfbc4779ab34286732efe450','[\"*\"]',NULL,NULL,'2024-07-17 03:37:47','2024-07-17 03:37:47'),(4,'App\\Models\\User',6,'API Token','2db22252eb33683853ecee5c105d1f5d0348ba7ca763dd38371dd18b1edc7079','[\"*\"]',NULL,NULL,'2024-07-17 03:46:11','2024-07-17 03:46:11'),(5,'App\\Models\\User',6,'API Token','89a7d7efcd698bffdfe76a123de1ee5b3b03056c68d4276102a4f93852adeb2f','[\"*\"]',NULL,NULL,'2024-07-17 03:47:09','2024-07-17 03:47:09'),(6,'App\\Models\\User',10,'API Token','cf5a57cb6192b9325afa775173adde801e8a654492e64cbb93a1b484f3b818a7','[\"*\"]',NULL,NULL,'2024-07-17 03:47:59','2024-07-17 03:47:59'),(7,'App\\Models\\User',11,'API Token','85bcbfdae5818203e97c79d1399d8b627da42836479e9a8099bb088bcd76a29a','[\"*\"]',NULL,NULL,'2024-07-17 03:49:02','2024-07-17 03:49:02'),(8,'App\\Models\\User',12,'API Token','2948f99c11dbedd5e168000cc8789c1d86b1499316f236e6c84f38de0135c9da','[\"*\"]',NULL,NULL,'2024-07-17 03:56:09','2024-07-17 03:56:09'),(9,'App\\Models\\User',12,'API Token','4af30b53e0391886d638f2f61a20bfa30763993b0931d746feebd075ff83f071','[\"*\"]',NULL,NULL,'2024-07-17 03:56:53','2024-07-17 03:56:53'),(10,'App\\Models\\User',14,'API Token','2ef3b020601ec8904c49d1618f5ca5f77ac2c52a09b6ac6367391d2c43d91023','[\"*\"]','2024-07-17 06:18:48',NULL,'2024-07-17 06:13:12','2024-07-17 06:18:48'),(11,'App\\Models\\User',14,'API Token','6b9e4f69ff2413b962cf2792eb4b0c9d81dd5cd78775e39b04b9893e8a485cc9','[\"*\"]',NULL,NULL,'2024-07-17 06:22:51','2024-07-17 06:22:51'),(12,'App\\Models\\User',14,'API Token','97bdda3f8d7438d59a4e3a895f502129ea0fdc1721166eb26718ae071239de56','[\"*\"]',NULL,NULL,'2024-07-17 06:27:03','2024-07-17 06:27:03'),(13,'App\\Models\\User',14,'API Token','336cfca3344162c27bcee0b65aa0598a79c7e649919468e499455200d27588c3','[\"*\"]','2024-07-17 08:55:35',NULL,'2024-07-17 06:28:16','2024-07-17 08:55:35'),(14,'App\\Models\\User',16,'API Token','1b8f6abea89faad4645142028e0fe5172f4891c08ef1e1f8ac4f6465e0a6e52e','[\"*\"]',NULL,NULL,'2024-07-17 15:48:57','2024-07-17 15:48:57'),(15,'App\\Models\\User',17,'API Token','4bfd4b2dc93ac54f244e09de8724751887815aa6b4299a702ec3b6ca6c2ee945','[\"*\"]',NULL,NULL,'2024-07-18 12:46:17','2024-07-18 12:46:17'),(16,'App\\Models\\User',17,'API Token','a9e16f269b2d944b371a35b773a205036b8b6a297d7d27183551f00f987e5b85','[\"*\"]',NULL,NULL,'2024-07-18 12:49:53','2024-07-18 12:49:53');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_statuses`
--

DROP TABLE IF EXISTS `subscription_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_statuses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_statuses`
--

LOCK TABLES `subscription_statuses` WRITE;
/*!40000 ALTER TABLE `subscription_statuses` DISABLE KEYS */;
INSERT INTO `subscription_statuses` VALUES (1,'Active','2024-07-16 08:15:08','2024-07-16 08:15:08',NULL),(2,'Pending','2024-07-16 08:15:13','2024-07-16 08:15:13',NULL),(3,'Expired','2024-07-16 08:15:21','2024-07-16 08:15:21',NULL),(4,'delete1 ','2024-07-16 08:15:56','2024-07-16 08:16:29','2024-07-16 08:16:29'),(5,'delete 2','2024-07-16 08:16:02','2024-07-16 08:16:41','2024-07-16 08:16:41'),(6,'deete 4','2024-07-16 08:16:10','2024-07-16 08:16:41','2024-07-16 08:16:41');
/*!40000 ALTER TABLE `subscription_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `diet_plan_id` bigint unsigned DEFAULT NULL,
  `status_id` bigint unsigned NOT NULL,
  `deadline` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_user_id_foreign` (`user_id`),
  KEY `subscriptions_package_id_foreign` (`package_id`),
  KEY `subscriptions_payment_id_foreign` (`payment_id`),
  KEY `subscriptions_diet_plan_id_foreign` (`diet_plan_id`),
  KEY `subscriptions_status_id_foreign` (`status_id`),
  CONSTRAINT `subscriptions_diet_plan_id_foreign` FOREIGN KEY (`diet_plan_id`) REFERENCES `diet_plans` (`id`),
  CONSTRAINT `subscriptions_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`),
  CONSTRAINT `subscriptions_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  CONSTRAINT `subscriptions_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `subscription_statuses` (`id`),
  CONSTRAINT `subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (2,5,1,2,2,1,'2024-08-16','2024-07-16 20:25:04','2024-07-16 20:27:06',NULL),(3,6,3,2,6,1,'2024-07-23','2024-07-16 20:26:35','2024-07-16 20:26:35',NULL);
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `food_id` bigint unsigned NOT NULL,
  `preference_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_preferences_user_id_foreign` (`user_id`),
  KEY `user_preferences_food_id_foreign` (`food_id`),
  CONSTRAINT `user_preferences_food_id_foreign` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_preferences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,5,1,'3','2024-07-16 07:54:57','2024-07-16 08:01:05','2024-07-16 08:01:05'),(2,6,3,'5','2024-07-16 07:55:09','2024-07-16 08:01:05','2024-07-16 08:01:05'),(3,5,1,'3','2024-07-16 08:02:02','2024-07-16 08:02:02',NULL),(4,5,6,'4','2024-07-16 08:02:10','2024-07-16 08:02:10',NULL),(5,5,5,'2','2024-07-16 08:02:20','2024-07-16 08:02:20',NULL),(6,6,4,'1','2024-07-16 08:02:28','2024-07-16 08:02:28',NULL),(7,6,1,'2','2024-07-16 08:02:36','2024-07-16 08:02:36',NULL),(8,6,7,'3','2024-07-16 08:02:44','2024-07-16 08:02:44',NULL);
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
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
-- Table structure for table `user_restrictions`
--

DROP TABLE IF EXISTS `user_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_restrictions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `restriction_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_restrictions_user_id_foreign` (`user_id`),
  KEY `user_restrictions_restriction_id_foreign` (`restriction_id`),
  CONSTRAINT `user_restrictions_restriction_id_foreign` FOREIGN KEY (`restriction_id`) REFERENCES `food_restrictions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_restrictions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_restrictions`
--

LOCK TABLES `user_restrictions` WRITE;
/*!40000 ALTER TABLE `user_restrictions` DISABLE KEYS */;
INSERT INTO `user_restrictions` VALUES (1,5,4,'2024-07-16 06:56:22','2024-07-16 07:09:52',NULL),(2,6,4,'2024-07-16 07:10:12','2024-07-16 07:10:31',NULL),(3,5,1,'2024-07-16 07:10:49','2024-07-16 07:10:49',NULL),(4,6,3,'2024-07-16 07:10:57','2024-07-16 07:10:57',NULL),(5,6,2,'2024-07-16 07:14:21','2024-07-16 07:14:21',NULL);
/*!40000 ALTER TABLE `user_restrictions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Mohamed Yassin','admin@admin.com','2024-07-14 05:38:22','$2y$12$He5wjb41RluoAvkDgwREuO5E4MxbIWZOrLY1N41dVewHoCNqJC4EC',NULL,'2024-07-15 02:06:18','2024-07-17 05:26:18',NULL,'Admin','01J2ZWS97QJS55Z6HP9P71XD4X.png'),(3,'Admin 3','admin2@admins.com','2026-06-06 05:34:07','$2y$12$L7TeBYAVzDXCrp7CLEseNOQ4vhf4dekz9TTv5wLzhFSUPqJV14X0S',NULL,'2024-07-15 02:10:57','2024-07-15 02:38:35','2024-07-15 02:38:35','Admin','01J2TDPM4PSDNMNCFPDCA95XG3.png'),(4,'Admin 2','admin2@admin.com','2024-07-13 06:08:23','$2y$12$G7M7fZCijAUH.dlXqCxbJulQuDPkn355O0bqxi.WsENkuaiomG3gK',NULL,'2024-07-15 03:05:48','2024-07-17 05:27:20',NULL,'Admin','01J2ZWV5KH3Y2S5V94BY38NR7P.png'),(5,'customer 1','customer@customer.com','2024-07-06 06:09:37','$2y$12$QRfgMUviuuxhp3N/SMyuOeBCtLzh6.wcGy91NoobQp0kOlTYrFDTi',NULL,'2024-07-15 03:06:58','2024-07-17 05:28:14',NULL,'Customer','01J2ZWWTFZQ34H0J6PA42RJ69B.png'),(6,'John Doe','john@example.com',NULL,'$2y$12$GX/ok7zzmgL2LL.YQK/q8eQrnYU1fPRCNjXxRmn3/iJYP3.lpqLQW',NULL,'2024-07-17 03:25:07','2024-07-17 03:52:32','2024-07-17 03:52:32',NULL,NULL),(7,'user','user1@users.com',NULL,'$2y$12$mVpin84mevBH9lC8Ved07u1IbEOdtqGq5m3SiFrTonOm6H95kh99i',NULL,'2024-07-17 03:31:30','2024-07-17 05:23:55','2024-07-17 05:23:55',NULL,NULL),(8,'user','user2@users.com',NULL,'$2y$12$FoO8XedmJu/Ekeff118FAO6Otqwy0MpgJLathvq3tCdMpvDL0dWEm',NULL,'2024-07-17 03:31:54','2024-07-17 05:24:04','2024-07-17 05:24:04',NULL,NULL),(9,'user4','user3@users.com',NULL,'$2y$12$aYCXMZeJwDj3hcf7W420Keyai8urGjHFbmF30rcMPIrJhHMAu3dWe',NULL,'2024-07-17 03:37:47','2024-07-17 05:24:15','2024-07-17 05:24:15',NULL,NULL),(10,'user4','user4@users.com',NULL,'$2y$12$0RhfSinAjv6nNw4d1SrDiuSvKzQE41/TLaJzJUptjCFIy4UVc3MnO',NULL,'2024-07-17 03:47:59','2024-07-17 05:24:24','2024-07-17 05:24:24',NULL,NULL),(11,'user5','user5@users.com',NULL,'$2y$12$mx4r6lVHKpUjqrn8z2XMm.WbXYPs93xcohbi2UmjKv4IMd1vfgRGa',NULL,'2024-07-17 03:49:02','2024-07-17 05:24:36','2024-07-17 05:24:36',NULL,NULL),(12,'user6','user6@users.com',NULL,'$2y$12$i2lYUVO3fQc6BZhqhMrcauwgUHvXop9AnFs9fdKmwg5.mjnUGag3C',NULL,'2024-07-17 03:56:09','2024-07-17 05:24:45','2024-07-17 05:24:45',NULL,NULL),(13,'admin5@admin.com','admin5@admin.com','2024-07-14 11:20:19','$2y$12$Tx/IMbqTYK/GjGAu6KfzBuo6zRq00Mw6eVCMZGy.p1pPdCzli0G.2',NULL,'2024-07-17 05:20:55','2024-07-17 05:24:53','2024-07-17 05:24:53','tru','01J2ZWFDZ1FB0CZXW6APN916P1.png'),(14,'API Customer2','apicustomer2@users.com','2024-07-27 18:16:41','$2y$12$yfvK.5nDmPshtsMC6dAJbu2AhS0eURvQnwaJR2etzQ3ISjPEa5sae',NULL,'2024-07-17 06:13:11','2024-07-19 15:12:47',NULL,'Customer',NULL),(15,'customer 4','customer4@cus.com','2024-07-12 21:16:58','$2y$12$xSrEPLUQFdGvY8xiPs0wBeECyU2m8I4qC9WaR/5.05/DHxKUghzaK',NULL,'2024-07-17 15:17:49','2024-07-17 15:17:49',NULL,'Customer','01J30YMC7GP1GNSQJ2MYZPFGFZ.png'),(16,'api customer 1','apicustomer1@users.com','2024-07-13 18:11:24','$2y$12$lzDCfLiG5HbVWZGX20BKDeW4I5O9.ihxkupGr2uiSv2ObCQLLVRCS',NULL,'2024-07-17 15:48:57','2024-07-19 15:11:28',NULL,'Customer',NULL),(17,'API Customer 5','apicustomer5@users.com',NULL,'$2y$12$RWewCItjL6LseLQcq5ZjDetzJDw4xtQTG7qWBo9CbPKkyzZfE2o.O',NULL,'2024-07-18 12:46:17','2024-07-19 15:14:27',NULL,'Customer','01J3637MGVH0A62414FRZYSDY2.png');
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

-- Dump completed on 2024-07-19 21:28:55
