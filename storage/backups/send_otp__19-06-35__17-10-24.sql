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
  `weight` double(8,2) NOT NULL,
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
INSERT INTO `diet_plans` VALUES (1,5,0.00,'{}',1,'2024-07-12','2024-07-16 04:53:17','2024-07-16 05:01:08','2024-07-16 05:01:08'),(2,15,0.00,'\"{}\"',3,'2024-07-08','2024-07-16 05:21:26','2024-07-19 15:19:07','2024-07-19 15:19:07'),(3,5,100.23,'[{\"data\": {\"keto_day\": [{\"lunch\": [{\"food_id\": null, \"quantity\": \"1\", \"recipe_id\": \"1\"}], \"snack\": [], \"dinner\": [{\"food_id\": null, \"quantity\": \"1\", \"recipe_id\": \"1\"}], \"snack_1\": [{\"food_id\": null, \"quantity\": null}], \"snack_2\": [{\"food_id\": null, \"quantity\": null}], \"day_date\": \"2024-09-01\", \"breakfast\": [{\"food_id\": \"1\", \"quantity\": \"23423\", \"recipe_id\": \"1\"}]}]}, \"type\": \"Keto\"}]',1,'2024-07-12','2024-07-16 05:25:31','2024-10-15 18:14:52',NULL),(4,5,0.00,'[{\"lunch\": [{\"food_id\": \"3\", \"quantity\": \"4\"}], \"dinner\": [{\"food_id\": \"3\", \"quantity\": \"4\"}], \"snack_1\": [{\"food_id\": \"2\", \"quantity\": \"4\"}], \"snack_2\": [{\"food_id\": \"4\", \"quantity\": \"4\"}], \"day_date\": \"2024-07-20\", \"breakfast\": [{\"food_id\": \"2\", \"quantity\": \"4\"}]}, {\"lunch\": [], \"dinner\": [], \"snack_1\": [], \"snack_2\": [], \"day_date\": \"2024-08-03\", \"breakfast\": []}]',2,'2024-07-30','2024-07-16 05:29:13','2024-07-19 15:09:19',NULL),(5,5,0.00,'[{\"day_date\": \"2024-07-25\"}, {\"day_date\": \"2024-07-06\"}]',1,'2024-07-04','2024-07-16 05:34:56','2024-07-16 05:34:56',NULL),(6,15,0.00,'[{\"lunch\": [], \"dinner\": [], \"snack_1\": [], \"snack_2\": [], \"day_date\": \"2024-07-25\", \"breakfast\": [{\"food_id\": \"3\", \"quantity\": \"432423\"}]}]',4,'2024-07-10','2024-07-16 05:43:30','2024-07-19 15:10:13',NULL),(7,5,0.00,'[{\"lunch\": [{\"food_id\": \"5\", \"quantity\": \"324\"}], \"dinner\": [{\"food_id\": \"3\", \"quantity\": \"234\"}], \"snack_1\": [{\"food_id\": \"1\", \"quantity\": \"234\"}, {\"food_id\": \"4\", \"quantity\": \"324\"}], \"snack_2\": [{\"food_id\": \"3\", \"quantity\": \"234\"}], \"day_date\": \"2024-07-17\", \"breakfast\": [{\"food_id\": \"1\", \"quantity\": \"342\"}, {\"food_id\": \"2\", \"quantity\": \"324\"}]}]',1,'2024-08-01','2024-07-19 14:59:47','2024-07-19 14:59:47',NULL),(8,5,0.00,'[{\"lunch\": [{\"food_id\": \"3\", \"quantity\": \"234\"}], \"dinner\": [{\"food_id\": \"5\", \"quantity\": \"234\"}], \"snack_1\": [{\"food_id\": \"3\", \"quantity\": \"234\"}], \"snack_2\": [{\"food_id\": \"4\", \"quantity\": \"23\"}], \"day_date\": \"2024-07-13\", \"breakfast\": [{\"food_id\": \"2\", \"quantity\": \"234\"}]}]',4,'2024-07-23','2024-07-19 15:02:14','2024-07-19 15:02:14',NULL),(9,5,0.00,'[{\"lunch\": [{\"food_id\": \"4\", \"quantity\": \"345\"}], \"dinner\": [{\"food_id\": \"6\", \"quantity\": \"345\"}], \"snack_1\": [{\"food_id\": \"3\", \"quantity\": \"43\"}], \"snack_2\": [{\"food_id\": \"5\", \"quantity\": \"345\"}], \"day_date\": \"2024-07-31\", \"breakfast\": [{\"food_id\": \"4\", \"quantity\": \"45\"}]}]',3,'2024-07-16','2024-07-19 15:03:07','2024-07-19 15:03:07',NULL),(10,16,0.00,'[{\"lunch\": [{\"food_id\": \"3\", \"quantity\": \"234\"}], \"dinner\": [{\"food_id\": \"4\", \"quantity\": \"23\"}], \"snack_1\": [{\"food_id\": \"3\", \"quantity\": \"23\"}], \"snack_2\": [{\"food_id\": \"4\", \"quantity\": \"234\"}], \"day_date\": \"2024-07-25\", \"breakfast\": [{\"food_id\": \"3\", \"quantity\": \"23\"}]}]',1,'2024-07-31','2024-07-19 15:05:07','2024-07-19 15:05:07',NULL),(11,14,0.00,'[{\"lunch\": [{\"food_id\": \"4\", \"quantity\": \"345\"}], \"dinner\": [{\"food_id\": \"3\", \"quantity\": \"435\"}], \"snack_1\": [{\"food_id\": \"1\", \"quantity\": \"435\"}], \"snack_2\": [{\"food_id\": \"4\", \"quantity\": \"34\"}], \"day_date\": \"2024-07-11\", \"breakfast\": [{\"food_id\": \"1\", \"quantity\": \"34\"}]}]',1,'2024-07-25','2024-07-19 15:08:37','2024-07-19 15:08:37',NULL);
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
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` bigint unsigned NOT NULL,
  `quantity` double(8,2) NOT NULL,
  `calories` double(8,2) NOT NULL,
  `fats` double(8,2) NOT NULL,
  `protein` double(8,2) NOT NULL,
  `carbohydrates` double(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ingredients_unit_id_foreign` (`unit_id`),
  CONSTRAINT `ingredients_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'أفخاد دجاج مشوية',1,220.00,300.00,70.00,50.00,0.00),(2,'بندورة كرزية',1,55.00,20.00,4.00,0.00,5.00),(3,'زيتون اسود منزوع النوي',1,18.00,10.00,2.00,10.00,0.00),(4,'زيت زيتون',3,0.50,25.00,1.00,5.00,0.00),(5,'ثوم',9,0.25,5.00,0.00,0.00,1.00),(6,'زعتر مجفف',4,0.25,0.00,0.00,0.00,0.00),(7,'فلفل أسود',14,1.00,0.00,0.00,0.00,0.00),(8,'ملح',14,1.00,0.00,0.00,0.00,0.00),(9,'خس',1,35.00,10.00,0.00,0.00,0.00),(10,'مايونيز',3,2.00,45.00,0.00,0.00,0.00),(11,'ببريكا',3,1.00,0.00,0.00,0.00,0.00),(12,'تونة',7,2.00,90.00,40.00,20.00,5.00),(13,'خيار',2,0.25,20.00,0.00,0.00,0.00),(14,'بصلة متوسطة الحجم',15,1.00,20.00,0.00,0.00,0.00),(15,'زيت زيتون',4,1.00,45.00,0.00,0.00,0.00),(16,'ليمون ( عصير )',15,0.25,45.00,0.00,0.00,0.00);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2024_07_15_045901_add_fields_to_users_table',2),(6,'2024_07_15_055731_create_user_quizzes_table',3),(7,'2024_07_15_070210_create_packages_table',4),(8,'2024_07_16_060923_create_payments_table',5),(9,'2024_07_16_061508_add_user_id_to_payments_table',6),(10,'2024_07_16_062704_create_food_categories_table',7),(11,'2024_07_16_063350_create_food_table',8),(12,'2024_07_16_063750_create_food_restrictions_table',9),(13,'2024_07_16_070157_drop_foods_table',10),(14,'2024_07_16_070443_drop_food_table',11),(15,'2024_07_16_070538_create_foods_table',12),(16,'2024_07_16_073709_create_diet_plan_statuses_table',13),(17,'2024_07_16_074731_create_diet_plans_table',14),(18,'2024_07_16_094701_create_user_restrictions_table',15),(19,'2024_07_16_105217_create_user_preferences_table',16),(20,'2024_07_16_110931_create_subscription_statuses_table',17),(21,'2024_07_16_111838_create_subscriptions_table',18),(22,'2024_07_16_074731_create_diet_plans_table',14),(23,'2024_07_16_094701_create_user_restrictions_table',15),(24,'2024_07_16_105217_create_user_preferences_table',16),(25,'2024_07_16_110931_create_subscription_statuses_table',17),(26,'2024_07_16_111838_create_subscriptions_table',18),(27,'2024_09_22_235209_create_units_table',19),(28,'2024_09_23_002834_create_ingredients_table',20),(29,'2024_09_23_004320_add_nutritional_columns_to_ingredients_table',21),(30,'2024_09_23_165031_create_recipes_table',22),(31,'2024_09_26_001712_add_weight_to_diet_plans_table',23),(32,'2024_10_15_152816_rename_food_id_to_recipe_id_in_user_preferences_table',24),(33,'2024_10_15_154905_drop_foreign_key_on_recipe_id_in_user_preferences_table',25),(34,'2024_10_15_155000_add_foreign_key_to_recipe_id_in_user_preferences_table',26),(35,'2024_10_15_161945_update_user_preferences_recipe_relation',27);
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
INSERT INTO `password_reset_tokens` VALUES ('admin@admin.com','eee','2024-10-06 13:59:16'),('apiuser82@users.com','4999','2024-10-17 13:03:13'),('mhmd.yassin07@gmail.com','kyfjksnm,sd','2024-10-22 16:17:31');
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',8,'API Token','908c6a2b9772c3f9adddee3d6d697eeaf3a4e8ef535528cf1791e9ff21b1ac5d','[\"*\"]','2024-07-17 04:08:16',NULL,'2024-07-17 03:31:54','2024-07-17 04:08:16'),(2,'App\\Models\\User',6,'API Token','aca1004656edebbc042b5d15a889b8b5231b354fd96210ab109d19235911cd9c','[\"*\"]',NULL,NULL,'2024-07-17 03:35:13','2024-07-17 03:35:13'),(3,'App\\Models\\User',9,'API Token','b2fe263bb8c1c78874dfdb01ea9181469248e86acfbc4779ab34286732efe450','[\"*\"]',NULL,NULL,'2024-07-17 03:37:47','2024-07-17 03:37:47'),(4,'App\\Models\\User',6,'API Token','2db22252eb33683853ecee5c105d1f5d0348ba7ca763dd38371dd18b1edc7079','[\"*\"]',NULL,NULL,'2024-07-17 03:46:11','2024-07-17 03:46:11'),(5,'App\\Models\\User',6,'API Token','89a7d7efcd698bffdfe76a123de1ee5b3b03056c68d4276102a4f93852adeb2f','[\"*\"]',NULL,NULL,'2024-07-17 03:47:09','2024-07-17 03:47:09'),(6,'App\\Models\\User',10,'API Token','cf5a57cb6192b9325afa775173adde801e8a654492e64cbb93a1b484f3b818a7','[\"*\"]',NULL,NULL,'2024-07-17 03:47:59','2024-07-17 03:47:59'),(7,'App\\Models\\User',11,'API Token','85bcbfdae5818203e97c79d1399d8b627da42836479e9a8099bb088bcd76a29a','[\"*\"]',NULL,NULL,'2024-07-17 03:49:02','2024-07-17 03:49:02'),(8,'App\\Models\\User',12,'API Token','2948f99c11dbedd5e168000cc8789c1d86b1499316f236e6c84f38de0135c9da','[\"*\"]',NULL,NULL,'2024-07-17 03:56:09','2024-07-17 03:56:09'),(9,'App\\Models\\User',12,'API Token','4af30b53e0391886d638f2f61a20bfa30763993b0931d746feebd075ff83f071','[\"*\"]',NULL,NULL,'2024-07-17 03:56:53','2024-07-17 03:56:53'),(10,'App\\Models\\User',14,'API Token','2ef3b020601ec8904c49d1618f5ca5f77ac2c52a09b6ac6367391d2c43d91023','[\"*\"]','2024-07-17 06:18:48',NULL,'2024-07-17 06:13:12','2024-07-17 06:18:48'),(11,'App\\Models\\User',14,'API Token','6b9e4f69ff2413b962cf2792eb4b0c9d81dd5cd78775e39b04b9893e8a485cc9','[\"*\"]',NULL,NULL,'2024-07-17 06:22:51','2024-07-17 06:22:51'),(12,'App\\Models\\User',14,'API Token','97bdda3f8d7438d59a4e3a895f502129ea0fdc1721166eb26718ae071239de56','[\"*\"]',NULL,NULL,'2024-07-17 06:27:03','2024-07-17 06:27:03'),(13,'App\\Models\\User',14,'API Token','336cfca3344162c27bcee0b65aa0598a79c7e649919468e499455200d27588c3','[\"*\"]','2024-07-17 08:55:35',NULL,'2024-07-17 06:28:16','2024-07-17 08:55:35'),(14,'App\\Models\\User',16,'API Token','1b8f6abea89faad4645142028e0fe5172f4891c08ef1e1f8ac4f6465e0a6e52e','[\"*\"]',NULL,NULL,'2024-07-17 15:48:57','2024-07-17 15:48:57'),(15,'App\\Models\\User',17,'API Token','4bfd4b2dc93ac54f244e09de8724751887815aa6b4299a702ec3b6ca6c2ee945','[\"*\"]',NULL,NULL,'2024-07-18 12:46:17','2024-07-18 12:46:17'),(16,'App\\Models\\User',17,'API Token','a9e16f269b2d944b371a35b773a205036b8b6a297d7d27183551f00f987e5b85','[\"*\"]',NULL,NULL,'2024-07-18 12:49:53','2024-07-18 12:49:53'),(17,'App\\Models\\User',18,'authToken','82fcdda0c48b2682390d43a278dbe95cb5a28f7fab18a4be7004ef9598e53f8d','[\"*\"]',NULL,NULL,'2024-09-30 16:59:47','2024-09-30 16:59:47'),(18,'App\\Models\\User',21,'auth_token','685ad0a8a469598c57d989ac3a8f1c4d27eabd006789cce3a19426a46e715ecd','[\"*\"]',NULL,NULL,'2024-10-02 03:38:56','2024-10-02 03:38:56'),(19,'App\\Models\\User',22,'auth_token','9d1fcb7dd6183cc5a309b029adc65d23621451fc47f2f10b5d2a914e2983f0ce','[\"*\"]',NULL,NULL,'2024-10-02 03:39:36','2024-10-02 03:39:36'),(20,'App\\Models\\User',23,'auth_token','f60e3e0518e3255f718ee1b579badf8466e1f18fa95da771f9266b497f40b6df','[\"*\"]',NULL,NULL,'2024-10-02 03:41:18','2024-10-02 03:41:18'),(21,'App\\Models\\User',28,'auth_token','a6333764900d6345baeaa65b9210076effc933aa903574b98c896ef31353d586','[\"*\"]',NULL,NULL,'2024-10-02 03:53:40','2024-10-02 03:53:40'),(22,'App\\Models\\User',29,'auth_token','8993ca3ccea7035c4367f8b9b85e1c4f3995ca6b83dc77dd70bb22921ff8904b','[\"*\"]',NULL,NULL,'2024-10-02 03:54:07','2024-10-02 03:54:07'),(23,'App\\Models\\User',30,'auth_token','02273269b6aaf131a214f879d6ac288e23ec2af486263f4f52c3fc2c21883632','[\"*\"]',NULL,NULL,'2024-10-02 03:55:27','2024-10-02 03:55:27'),(24,'App\\Models\\User',31,'auth_token','f9b2c2b7210abaf84221ec41cbd61a60d5b7a479cbeedba4efe64b34e5dd97cb','[\"*\"]',NULL,NULL,'2024-10-02 04:23:32','2024-10-02 04:23:32'),(25,'App\\Models\\User',31,'auth_token','034fffec8c7874b2e1b54bbc140d3cedefb76a62eb576fd8f9ff022a871222d9','[\"*\"]',NULL,NULL,'2024-10-02 04:23:59','2024-10-02 04:23:59'),(26,'App\\Models\\User',31,'auth_token','981cd0ee309b72a8fd777a4906012ceca78c9ce6be4584855953ad44ea246803','[\"*\"]',NULL,NULL,'2024-10-02 04:24:13','2024-10-02 04:24:13'),(27,'App\\Models\\User',31,'auth_token','fa30b63cb357503e35731455ada5ff477aceac87e02748712534d12571998518','[\"*\"]',NULL,NULL,'2024-10-02 04:24:22','2024-10-02 04:24:22'),(28,'App\\Models\\User',31,'auth_token','45edd66a6b9d2e4dce916a3b7856305f7975a58becdcdef9cbb2e96809f23167','[\"*\"]',NULL,NULL,'2024-10-02 04:25:21','2024-10-02 04:25:21'),(29,'App\\Models\\User',34,'auth_token','89f4eb5c3c4b106bb64a55937dcb907fa165ffae6bfc33ce48b46c7938a466a3','[\"*\"]',NULL,NULL,'2024-10-02 04:38:26','2024-10-02 04:38:26'),(30,'App\\Models\\User',35,'auth_token','55310b7acf1473da7e183c4e45f66be3bc5ef75067e56ad2de005a810aaaf0a1','[\"*\"]',NULL,NULL,'2024-10-02 04:42:33','2024-10-02 04:42:33'),(31,'App\\Models\\User',35,'auth_token','6ed7d5df822f482eb086c00094dd2fb03c86cac08973e9f1a41a63b612375850','[\"*\"]',NULL,NULL,'2024-10-02 04:43:18','2024-10-02 04:43:18'),(32,'App\\Models\\User',35,'auth_token','c64330afe5ceaec95268d645d9294839499319b9d8a8523099144de493ae0ba0','[\"*\"]',NULL,NULL,'2024-10-02 04:43:38','2024-10-02 04:43:38'),(33,'App\\Models\\User',35,'auth_token','21a71138153014afc4b7800a9aead30904e930600251b31f9fb073d29f8817bb','[\"*\"]',NULL,NULL,'2024-10-02 04:52:28','2024-10-02 04:52:28'),(34,'App\\Models\\User',35,'auth_token','39cb3427037b2810fdaaf7380e7076de1be326c44f4b1a5af212f669ced81199','[\"*\"]',NULL,NULL,'2024-10-03 15:14:09','2024-10-03 15:14:09'),(35,'App\\Models\\User',35,'auth_token','17e3cd793105bda1b9c41951a3a7d0eb05d8edd7bb1c3e0c79f52fe5642fa0a9','[\"*\"]',NULL,NULL,'2024-10-03 15:14:39','2024-10-03 15:14:39'),(36,'App\\Models\\User',35,'auth_token','70916a1828d395b27a279818082bb943602eb65126a0adda705477b357262366','[\"*\"]',NULL,NULL,'2024-10-03 15:17:39','2024-10-03 15:17:39'),(37,'App\\Models\\User',35,'auth_token','1e3bca22a4b4f86ee27556ae08509b65d49cf264bf5edd1697f84033bdb597fe','[\"*\"]',NULL,NULL,'2024-10-17 12:28:05','2024-10-17 12:28:05');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `calories` double(8,2) NOT NULL,
  `fats` double(8,2) NOT NULL,
  `protein` double(8,2) NOT NULL,
  `carbohydrates` double(8,2) NOT NULL,
  `ingredients` json DEFAULT NULL,
  `preparation_method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'أفخاذ الدجاج المشوية مع الخضار','lunch',330.00,76.00,60.00,5.00,'[{\"quantity\": \"220.5\", \"ingredient_id\": \"1\"}, {\"quantity\": \"55\", \"ingredient_id\": \"2\"}, {\"quantity\": \"18\", \"ingredient_id\": \"3\"}, {\"quantity\": \".5\", \"ingredient_id\": \"6\"}]','<h2 dir=\"rtl\">عنوان رئيسي</h2><h3 dir=\"rtl\">عنوان فرعي 1</h3><ul dir=\"rtl\"><li>نسخن الفرن مسبقا إلى <strong>200 درجة مئوية</strong></li><li>نضع الدجاج في نضيف طبق الفرن&nbsp; الثوم والزيتون والبندورة فوق الدجاج وحوله.</li></ul><h3 dir=\"rtl\">عنوان فرعي 2</h3><ol dir=\"rtl\"><li>نرش زيت الزيتون واألوريجانو والملح والفلفل على خليط الدجاج ونضعها في الفرن حوالي 45 دقيقة حتى ينضج الدجاج بالكامل.</li><li>&nbsp;نقدم الدجاج مع الخس والمايونيز واضافة الملح والفلفل والبابريكا.&nbsp;</li></ol><p dir=\"rtl\">ملحوظة اضف اي من البهارات الاضافيه بجانب الطعام</p><p><br></p>','01J8J58JX6CPVPYXHQ62KZHE9T.png');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
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
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'جرام'),(2,'كوب'),(3,'ملعقة صغيرة'),(4,'ملعقة كبيرة'),(6,'ملي ميتر'),(7,'علبة'),(8,'قطعة'),(9,'فص'),(10,'رشة'),(11,'اوقية'),(12,'حصة'),(14,'حفتة'),(15,'حبة'),(16,'ملعقة طعام');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
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
  `recipe_id` bigint unsigned NOT NULL,
  `preference_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_preferences_user_id_foreign` (`user_id`),
  KEY `user_preferences_food_id_foreign` (`recipe_id`),
  CONSTRAINT `user_preferences_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_preferences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,17,1,'3','2024-10-15 12:39:41','2024-10-15 12:39:41',NULL),(2,5,1,'1','2024-10-15 18:28:48','2024-10-15 18:28:48',NULL),(3,5,1,'2','2024-10-15 18:28:48','2024-10-15 18:29:26','2024-10-15 18:29:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_quizzes`
--

LOCK TABLES `user_quizzes` WRITE;
/*!40000 ALTER TABLE `user_quizzes` DISABLE KEYS */;
INSERT INTO `user_quizzes` VALUES (1,5,'[{\"data\": {\"sex\": null, \"height\": null, \"weight\": null, \"birth_year\": \"oiui\", \"eating_habits\": null, \"health_status\": null, \"weight_targeted\": null, \"nutritional_goals\": null, \"physical_activity\": null, \"psychological_state\": null}, \"type\": \"template_2\"}]','2024-07-15 03:07:27','2024-09-04 09:53:21','2024-09-04 09:53:21'),(2,5,'[{\"data\": {\"sex\": \"male\", \"date\": \"2024-09-01 03:43:18\", \"meats\": [\"poultry\", \"lamb\", \"fish\", \"seafood\", \"beef\"], \"height\": \"152\", \"weight\": \"150\", \"diet_goal\": \"lose_weight\", \"birth_year\": \"1991\", \"vegetables\": [\"mushroom\", \"broccoli\", \"eggplant\", \"tomato\", \"spinach\", \"cabbage\", \"cauliflower\"], \"other_foods\": [\"cheese\", \"egg\", \"olive\", \"coconut\", \"milk\", \"yogurt\", \"avocado\", \"nuts_seeds\"], \"sleep_hours\": \"5_to_6\", \"exit_message\": null, \"water_intake\": \"2_to_6_cups\", \"daily_routine\": \"office\", \"eating_habits\": \"needs_improvement\", \"food_allergies\": [\"fish\", \"peanut\"], \"weight_targeted\": \"151\", \"health_conditions\": [\"pcos\", \"cancer\", \"kidney_disease\", \"liver_gallbladder_disease\"], \"physical_activity\": \"no_activity\", \"weight_gain_factors\": \"work_lifestyle\", \"weight_loss_motivation\": \"curiosity\"}, \"type\": \"keto\"}]','2024-09-03 18:10:53','2024-09-25 19:11:00','2024-09-25 19:11:00'),(3,5,'[{\"data\": {\"sex\": null, \"date\": \"2024-09-26 00:29:34\", \"meats\": [\"beef\", \"seafood\", \"turkey\"], \"height\": \"187\", \"weight\": null, \"diet_goal\": null, \"birth_year\": null, \"vegetables\": [\"eggplant\", \"mushroom\", \"tomato\", \"cabbage\", \"cauliflower\", \"zucchini\", \"green_vegetables\"], \"other_foods\": [\"olive\", \"cheese\", \"coconut\", \"yogurt\", \"avocado\", \"nuts_seeds\"], \"sleep_hours\": null, \"exit_message\": null, \"water_intake\": null, \"daily_routine\": null, \"eating_habits\": null, \"food_allergies\": [], \"weight_targeted\": null, \"health_conditions\": [], \"physical_activity\": null, \"weight_gain_factors\": null, \"weight_loss_motivation\": null}, \"type\": \"keto\"}]','2024-09-25 21:30:42','2024-09-25 21:51:08','2024-09-25 21:51:08'),(4,5,'[{\"data\": {\"sex\": \"female\", \"date\": \"2024-09-26 00:53:35\", \"meats\": [\"lamb\", \"beef\", \"veal\", \"fish\", \"seafood\", \"turkey\"], \"height\": \"160\", \"weight\": null, \"diet_goal\": null, \"birth_year\": \"1960\", \"vegetables\": [\"broccoli\", \"green_vegetables\", \"mushroom\", \"eggplant\", \"tomato\", \"spinach\", \"cauliflower\", \"cabbage\", \"zucchini\"], \"other_foods\": [\"egg\", \"olive\", \"coconut\", \"milk\", \"yogurt\", \"avocado\", \"nuts_seeds\"], \"sleep_hours\": null, \"exit_message\": null, \"water_intake\": null, \"daily_routine\": null, \"eating_habits\": null, \"food_allergies\": [], \"weight_targeted\": null, \"health_conditions\": [], \"physical_activity\": \"lightly_active\", \"weight_gain_factors\": null, \"weight_loss_motivation\": null}, \"type\": \"keto\"}]','2024-09-25 21:54:39','2024-09-25 23:23:45',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_restrictions`
--

LOCK TABLES `user_restrictions` WRITE;
/*!40000 ALTER TABLE `user_restrictions` DISABLE KEYS */;
INSERT INTO `user_restrictions` VALUES (1,5,4,'2024-07-16 06:56:22','2024-09-24 13:24:25','2024-09-24 13:24:25'),(2,6,4,'2024-07-16 07:10:12','2024-07-16 07:10:31',NULL),(3,5,1,'2024-07-16 07:10:49','2024-09-25 18:47:48','2024-09-25 18:47:48'),(4,6,3,'2024-07-16 07:10:57','2024-07-16 07:10:57',NULL),(5,6,2,'2024-07-16 07:14:21','2024-07-16 07:14:21',NULL),(6,5,2,'2024-09-24 13:28:36','2024-09-25 18:47:48','2024-09-25 18:47:48'),(7,5,5,'2024-09-25 18:47:48','2024-09-25 18:51:26','2024-09-25 18:51:26'),(8,5,5,'2024-09-25 18:51:26','2024-09-25 18:51:44','2024-09-25 18:51:44'),(9,5,5,'2024-09-25 18:51:44','2024-09-25 18:52:39','2024-09-25 18:52:39'),(10,5,5,'2024-09-25 18:52:39','2024-09-25 18:52:39',NULL),(11,5,1,'2024-09-25 18:53:47','2024-09-25 18:53:47',NULL),(12,5,4,'2024-09-25 18:53:47','2024-09-25 18:53:47',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Mohamed Yassin','admin@admin.com','2024-07-14 05:38:22','$2y$12$He5wjb41RluoAvkDgwREuO5E4MxbIWZOrLY1N41dVewHoCNqJC4EC',NULL,'2024-07-15 02:06:18','2024-10-17 10:56:34',NULL,'Admin',NULL),(3,'Admin 3','admin2@admins.com','2026-06-06 05:34:07','$2y$12$L7TeBYAVzDXCrp7CLEseNOQ4vhf4dekz9TTv5wLzhFSUPqJV14X0S',NULL,'2024-07-15 02:10:57','2024-07-15 02:38:35','2024-07-15 02:38:35','Admin','01J2TDPM4PSDNMNCFPDCA95XG3.png'),(4,'Admin 2','admin2@admin.com','2024-07-13 06:08:23','$2y$12$G7M7fZCijAUH.dlXqCxbJulQuDPkn355O0bqxi.WsENkuaiomG3gK',NULL,'2024-07-15 03:05:48','2024-07-17 05:27:20',NULL,'Admin','01J2ZWV5KH3Y2S5V94BY38NR7P.png'),(5,'Madam 1960','customer@customer.com','2024-07-06 06:09:37','$2y$12$QRfgMUviuuxhp3N/SMyuOeBCtLzh6.wcGy91NoobQp0kOlTYrFDTi',NULL,'2024-07-15 03:06:58','2024-10-16 11:42:39',NULL,'Customer','01JAAWFSW0BPTPR24N1M5XNC8A.jpg'),(6,'John Doe','john@example.com',NULL,'$2y$12$GX/ok7zzmgL2LL.YQK/q8eQrnYU1fPRCNjXxRmn3/iJYP3.lpqLQW',NULL,'2024-07-17 03:25:07','2024-07-17 03:52:32','2024-07-17 03:52:32',NULL,NULL),(7,'user','user1@users.com',NULL,'$2y$12$mVpin84mevBH9lC8Ved07u1IbEOdtqGq5m3SiFrTonOm6H95kh99i',NULL,'2024-07-17 03:31:30','2024-07-17 05:23:55','2024-07-17 05:23:55',NULL,NULL),(8,'user','user2@users.com',NULL,'$2y$12$FoO8XedmJu/Ekeff118FAO6Otqwy0MpgJLathvq3tCdMpvDL0dWEm',NULL,'2024-07-17 03:31:54','2024-07-17 05:24:04','2024-07-17 05:24:04',NULL,NULL),(9,'user4','user3@users.com',NULL,'$2y$12$aYCXMZeJwDj3hcf7W420Keyai8urGjHFbmF30rcMPIrJhHMAu3dWe',NULL,'2024-07-17 03:37:47','2024-07-17 05:24:15','2024-07-17 05:24:15',NULL,NULL),(10,'user4','user4@users.com',NULL,'$2y$12$0RhfSinAjv6nNw4d1SrDiuSvKzQE41/TLaJzJUptjCFIy4UVc3MnO',NULL,'2024-07-17 03:47:59','2024-07-17 05:24:24','2024-07-17 05:24:24',NULL,NULL),(11,'user5','user5@users.com',NULL,'$2y$12$mx4r6lVHKpUjqrn8z2XMm.WbXYPs93xcohbi2UmjKv4IMd1vfgRGa',NULL,'2024-07-17 03:49:02','2024-07-17 05:24:36','2024-07-17 05:24:36',NULL,NULL),(12,'user6','user6@users.com',NULL,'$2y$12$i2lYUVO3fQc6BZhqhMrcauwgUHvXop9AnFs9fdKmwg5.mjnUGag3C',NULL,'2024-07-17 03:56:09','2024-07-17 05:24:45','2024-07-17 05:24:45',NULL,NULL),(13,'admin5@admin.com','admin5@admin.com','2024-07-14 11:20:19','$2y$12$Tx/IMbqTYK/GjGAu6KfzBuo6zRq00Mw6eVCMZGy.p1pPdCzli0G.2',NULL,'2024-07-17 05:20:55','2024-07-17 05:24:53','2024-07-17 05:24:53','tru','01J2ZWFDZ1FB0CZXW6APN916P1.png'),(14,'API Customer2','apicustomer2@users.com','2024-07-27 18:16:41','$2y$12$yfvK.5nDmPshtsMC6dAJbu2AhS0eURvQnwaJR2etzQ3ISjPEa5sae',NULL,'2024-07-17 06:13:11','2024-07-19 15:12:47',NULL,'Customer',NULL),(15,'customer 4','customer4@cus.com','2024-07-12 21:16:58','$2y$12$xSrEPLUQFdGvY8xiPs0wBeECyU2m8I4qC9WaR/5.05/DHxKUghzaK',NULL,'2024-07-17 15:17:49','2024-07-17 15:17:49',NULL,'Customer','01J30YMC7GP1GNSQJ2MYZPFGFZ.png'),(16,'customer 6','apicustomer1@users.com','2024-07-13 18:11:24','$2y$12$lzDCfLiG5HbVWZGX20BKDeW4I5O9.ihxkupGr2uiSv2ObCQLLVRCS',NULL,'2024-07-17 15:48:57','2024-09-25 23:11:40',NULL,'Customer',NULL),(17,'API Customer 5','apicustomer5@users.com',NULL,'$2y$12$RWewCItjL6LseLQcq5ZjDetzJDw4xtQTG7qWBo9CbPKkyzZfE2o.O',NULL,'2024-07-18 12:46:17','2024-07-19 15:14:27',NULL,'Customer','01J3637MGVH0A62414FRZYSDY2.png'),(18,'apiuser','apiuser@users.com',NULL,'$2y$12$njrdkx0g6LWUcklYXV4WyupSc3UB1WVCTfVn.SEUDwrhrCvqEQGE.',NULL,'2024-09-30 16:59:47','2024-09-30 16:59:47',NULL,NULL,NULL),(19,'apiuser 1','apiuser1@users.com',NULL,'$2y$12$MmOf0wHATtGKnKKYxt8qyOZpN/xwZ.9C5rwybUVagoODQuVgy9et2',NULL,'2024-10-02 03:35:25','2024-10-02 03:35:25',NULL,'Customer',NULL),(20,'apiuser 1','apiuser2@users.com',NULL,'$2y$12$1A4JqvToohCFGkGAmulweewPpXaIz6EwBPSv2F5JTjy5dFzbHvpWy',NULL,'2024-10-02 03:37:47','2024-10-02 03:37:47',NULL,'Customer',NULL),(21,'apiuser 1','apiuser3@users.com',NULL,'$2y$12$wIRnZWaAbqSC8pRvR5IyV.oM5DjXdf8hc8CvMRzx7kg1jj7FOZ5SS',NULL,'2024-10-02 03:38:56','2024-10-02 03:38:56',NULL,'Customer',NULL),(22,'apiuser 1','apiuser5@users.com',NULL,'$2y$12$W/OszMfbxyYVe8mTbaTUoOpzKzgpgoO2USpV60MGNuh3IiTMF51NO',NULL,'2024-10-02 03:39:36','2024-10-02 03:39:36',NULL,'Customer',NULL),(23,'apiuser 1','apiuser6@users.com',NULL,'$2y$12$xXNJIGX/MsL8OvyisaIrgOBaLL6JHPcmjIglH4YzyAPZCzNv0iU1m',NULL,'2024-10-02 03:41:18','2024-10-02 03:41:18',NULL,'Customer',NULL),(24,'apiuser 1','apiuser7@users.com',NULL,'$2y$12$jAt.n6THqQTw4iQPDyFO2.U5i6nKeEqV4mmyEAxo54yJ5lXZeBeBm',NULL,'2024-10-02 03:44:25','2024-10-02 03:44:25',NULL,'Customer',NULL),(25,'apiuser 1','apiuser8@users.com',NULL,'$2y$12$UeSZG82rWP2uH098l84piefRPwmeR5ZL7elxgOsg7UiMOLSxGj2ym',NULL,'2024-10-02 03:45:29','2024-10-02 03:45:29',NULL,'Customer',NULL),(26,'apiuser 1','apiuser9@users.com',NULL,'$2y$12$bMUr1lyX3z2aQ.9.ewz/OujCn3doQQj.apDHcpQ.VsP7NNFl5eTUO',NULL,'2024-10-02 03:46:52','2024-10-02 03:46:52',NULL,'Customer',NULL),(27,'apiuser 1','apiuser91@users.com',NULL,'$2y$12$KQDRxMXXQhlwLMPg6NNP6.D3OxOiwVIyL3vOteekNyO5/oElhBLCS',NULL,'2024-10-02 03:49:26','2024-10-02 03:49:26',NULL,'Customer',NULL),(28,'apiuser 1','apiuser92@users.com',NULL,'$2y$12$NJprPpPxbLsg1K99bozQteMrakcJFufMhzhkzPWaqYoE5Csj4IWp6',NULL,'2024-10-02 03:53:40','2024-10-02 03:53:40',NULL,'Customer',NULL),(29,'apiuser 1','apiuser93@users.com',NULL,'$2y$12$uhY/8S5gdBbty6V19gwpZOmBTvDYlaSxvdIDVFkGWeGdK6myOFel6',NULL,'2024-10-02 03:54:07','2024-10-02 03:54:07',NULL,'Customer',NULL),(30,'apiuser 1','apiuser94@users.com',NULL,'$2y$12$CQq/Mids1lZQ/7koHMJfsOkR3Hf/7J.KBcY630Dh9QDBMKAUCLFQG',NULL,'2024-10-02 03:55:26','2024-10-02 03:55:26',NULL,'Customer',NULL),(31,'apiuser 1','apiuser95@users.com',NULL,'$2y$12$IGGYZnTw6wiR3NrKt3Atb.nt.xzPbk7uqrR4vg0h0CBSGOWtVfv9a',NULL,'2024-10-02 03:59:08','2024-10-02 03:59:08',NULL,'Customer',NULL),(32,'apiuser 1','apiuser96@users.com',NULL,'$2y$12$7W0GpQ9qrT8GzjkmxbBW6.AHPPlica7t7YQpGUO.ROz1SrQoH8vha',NULL,'2024-10-02 04:01:34','2024-10-02 04:01:34',NULL,'Customer',NULL),(33,'apiuser 1','apiuser97@users.com',NULL,'$2y$12$t/Nb1bUTN1GJa64l0DcYl.ZhSyh5UaGMTeaJ1IZAidYe6YwjzFJWG',NULL,'2024-10-02 04:30:39','2024-10-02 04:30:39',NULL,'Customer',NULL),(34,'apiuser 1','apiuser81@users.com',NULL,'$2y$12$rx3gO9OtfIhJ2fBJj8nzbO6k1gcEutzMKR.Ssj8mRl5jI8.5luI.G',NULL,'2024-10-02 04:38:26','2024-10-02 04:38:26',NULL,'Customer',NULL),(35,'apiuser 1','apiuser82@users.com',NULL,'$2y$12$0kaez.OyVX4On39c8yD12eNDvLqSPW44bpQw6oC6xM76bc6PWaLPu',NULL,'2024-10-02 04:42:12','2024-10-02 04:42:12',NULL,'Customer',NULL);
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

-- Dump completed on 2024-10-17 19:06:42