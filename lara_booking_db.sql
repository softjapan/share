-- --------------------------------------------------------
-- ホスト:                          192.168.11.13
-- サーバーのバージョン:                   10.3.10-MariaDB - mariadb.org binary distribution
-- サーバー OS:                      Win32
-- HeidiSQL バージョン:               10.2.0.5740
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

--  テーブル lara_booking_db.admin の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.admin: ~0 rows (約) のデータをダンプしています
DELETE FROM `bk_admin`;
/*!40000 ALTER TABLE `bk_admin` DISABLE KEYS */;
INSERT INTO `bk_admin` (`id`, `firstname`, `lastname`, `email`, `username`, `password`, `remember_token`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'System', 'Admin', 'softbase@outlook.com', 'admin', '$2y$10$dwEhwoB3HNjcSenfx17y7O5HLrtbbBM6o9Gw0qpD5/2u96i1r3Zh2', 'YgXyGTkSpE9A7wNXZxMHyj63aDIbNmAsGFKjo3QeomtjVWspop4nEEXih00E', 'admin.png', '2017-07-03 01:44:03', '2019-08-03 00:08:18');
/*!40000 ALTER TABLE `bk_admin` ENABLE KEYS */;

--  テーブル lara_booking_db.bookings の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_bookings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `service_id` int(10) unsigned DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(11,2) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_user_id_foreign` (`user_id`),
  KEY `bookings_service_id_foreign` (`service_id`),
  CONSTRAINT `bookings_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.bookings: ~8 rows (約) のデータをダンプしています
DELETE FROM `bk_bookings`;
/*!40000 ALTER TABLE `bk_bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk_bookings` ENABLE KEYS */;

--  テーブル lara_booking_db.bookings_details の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_bookings_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `booking_id` int(10) unsigned DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_details_booking_id_foreign` (`booking_id`),
  CONSTRAINT `bookings_details_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.bookings_details: ~9 rows (約) のデータをダンプしています
DELETE FROM `bk_bookings_details`;
/*!40000 ALTER TABLE `bk_bookings_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk_bookings_details` ENABLE KEYS */;

--  テーブル lara_booking_db.currencies の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.currencies: ~24 rows (約) のデータをダンプしています
DELETE FROM `bk_currencies`;
/*!40000 ALTER TABLE `bk_currencies` DISABLE KEYS */;
INSERT INTO `bk_currencies` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Australian dollar', 'AUD', '1', '2017-08-21 10:36:41', '2017-09-12 10:34:24'),
	(2, 'Brazilian real', 'BRL', '1', '2017-08-21 10:36:54', '2017-08-21 10:58:40'),
	(3, 'Canadian dollar', 'CAD', '1', '2017-08-21 10:37:06', '2017-08-21 10:46:33'),
	(4, 'Czech koruna', 'CZK', '1', '2017-08-21 10:37:17', '2021-01-04 04:11:02'),
	(5, 'Danish krone', 'DKK', '1', '2017-08-21 10:37:32', '2021-01-04 04:11:01'),
	(6, 'Euro', 'EUR', '1', '2017-08-21 10:37:46', '2017-08-21 10:37:46'),
	(7, 'Hong Kong dollar', 'HKD', '1', '2017-08-21 10:37:58', '2021-01-04 04:10:58'),
	(8, 'Hungarian forint', 'HUF', '1', '2017-08-21 10:38:09', '2017-08-21 10:38:09'),
	(9, 'Israeli new shekel', 'ILS', '1', '2017-08-21 10:38:21', '2021-01-04 04:10:53'),
	(10, 'Japanese yen', 'JPY', '0', '2017-08-21 10:38:38', '2021-01-04 04:10:45'),
	(11, 'Malaysian ringgit', 'MYR', '1', '2017-08-21 10:38:49', '2017-08-21 10:38:49'),
	(12, 'Mexican peso', 'MXN', '1', '2017-08-21 10:38:58', '2017-08-21 10:38:58'),
	(13, 'New Taiwan dollar', 'TWD', '1', '2017-08-21 10:39:11', '2017-08-21 10:39:11'),
	(14, 'New Zealand dollar', 'NZD', '1', '2017-08-21 10:39:22', '2017-08-21 10:39:22'),
	(15, 'Norwegian krone', 'NOK', '1', '2017-08-21 10:39:30', '2017-08-21 10:39:30'),
	(16, 'Philippine peso', 'PHP', '1', '2017-08-21 10:39:52', '2017-08-21 10:39:52'),
	(17, 'Polish złoty', 'PLN', '1', '2017-08-21 10:40:04', '2017-08-21 10:40:04'),
	(18, 'Pound sterling', 'GBP', '1', '2017-08-21 10:42:21', '2017-08-21 10:42:21'),
	(19, 'Russian ruble', 'RUB', '1', '2017-08-21 10:42:32', '2017-08-21 10:42:32'),
	(20, 'Singapore dollar', 'SGD', '1', '2017-08-21 10:42:46', '2017-08-21 10:42:46'),
	(21, 'Swedish krona', 'SEK', '1', '2017-08-21 10:43:03', '2017-08-21 10:43:03'),
	(22, 'Swiss franc', 'CHF', '1', '2017-08-21 10:43:15', '2017-08-21 10:43:15'),
	(23, 'Thai baht', 'THB', '1', '2017-08-21 10:43:25', '2017-08-21 10:43:25'),
	(24, 'United States dollar', 'USD', '1', '2017-08-21 10:43:39', '2017-08-21 10:43:39');
/*!40000 ALTER TABLE `bk_currencies` ENABLE KEYS */;

--  テーブル lara_booking_db.enquiries の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_enquiries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','answered') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.enquiries: ~0 rows (約) のデータをダンプしています
DELETE FROM `bk_enquiries`;
/*!40000 ALTER TABLE `bk_enquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk_enquiries` ENABLE KEYS */;

--  テーブル lara_booking_db.bk_migrations の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.bk_migrations: ~19 rows (約) のデータをダンプしています
DELETE FROM `bk_migrations`;
/*!40000 ALTER TABLE `bk_migrations` DISABLE KEYS */;
INSERT INTO `bk_migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2015_10_10_104728_create_admin_table', 1),
	(2, '2015_10_13_124512_create_password_resets_table', 1),
	(3, '2015_11_18_112049_create_settings_table', 1),
	(7, '2017_07_03_110311_create_users_table', 2),
	(8, '2017_07_04_101042_create_user_chat_messages_table', 3),
	(15, '2017_07_13_065710_create_services_table', 4),
	(16, '2017_07_13_113430_create_schedule_table', 4),
	(17, '2017_07_27_063122_create_bookings_table', 5),
	(18, '2017_07_27_063612_create_bookings_details_table', 5),
	(19, '2017_08_12_110251_create_transactions_table', 6),
	(20, '2017_08_21_104640_create_paypal_settings_table', 7),
	(21, '2017_08_21_122213_create_currencies_table', 8),
	(22, '2017_08_21_130350_create_payment_settings_table', 9),
	(23, '2017_09_02_163231_create_enquiries_table', 10),
	(24, '2016_06_01_000001_create_oauth_auth_codes_table', 11),
	(25, '2016_06_01_000002_create_oauth_access_tokens_table', 11),
	(26, '2016_06_01_000003_create_oauth_refresh_tokens_table', 11),
	(27, '2016_06_01_000004_create_oauth_clients_table', 11),
	(28, '2016_06_01_000005_create_oauth_personal_access_clients_table', 11);
/*!40000 ALTER TABLE `bk_migrations` ENABLE KEYS */;

--  テーブル lara_booking_db.bk_oauth_access_tokens の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- テーブル lara_booking_db.bk_oauth_access_tokens: ~0 rows (約) のデータをダンプしています
DELETE FROM `bk_oauth_access_tokens`;
/*!40000 ALTER TABLE `bk_oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk_oauth_access_tokens` ENABLE KEYS */;

--  テーブル lara_booking_db.oauth_auth_codes の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- テーブル lara_booking_db.oauth_auth_codes: ~0 rows (約) のデータをダンプしています
DELETE FROM `bk_oauth_auth_codes`;
/*!40000 ALTER TABLE `bk_oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk_oauth_auth_codes` ENABLE KEYS */;

--  テーブル lara_booking_db.oauth_clients の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- テーブル lara_booking_db.bk_oauth_clients: ~2 rows (約) のデータをダンプしています
DELETE FROM `bk_oauth_clients`;
/*!40000 ALTER TABLE `bk_oauth_clients` DISABLE KEYS */;
INSERT INTO `bk_oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Booking Personal Access Client', 'Yub2tAaxeoLNxrL77zjqVHGbpe12U45xyJe0Q4S8', 'http://localhost', 1, 0, 0, '2018-05-25 11:29:45', '2018-05-25 11:29:45'),
	(2, NULL, 'Laravel Booking Password Grant Client', 'wILog6wDJ23hFwuDJjpGphugH0dFtzBY5KO2L9wC', 'http://localhost', 0, 1, 0, '2018-05-25 11:29:46', '2018-05-25 11:29:46');
/*!40000 ALTER TABLE `bk_oauth_clients` ENABLE KEYS */;

--  テーブル lara_booking_db.bk_oauth_personal_access_clients の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- テーブル lara_booking_db.oauth_personal_access_clients: ~0 rows (約) のデータをダンプしています
DELETE FROM `bk_oauth_personal_access_clients`;
/*!40000 ALTER TABLE `bk_oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `bk_oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2018-05-25 11:29:46', '2018-05-25 11:29:46');
/*!40000 ALTER TABLE `bk_oauth_personal_access_clients` ENABLE KEYS */;

--  テーブル lara_booking_db.oauth_refresh_tokens の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- テーブル lara_booking_db.oauth_refresh_tokens: ~0 rows (約) のデータをダンプしています
DELETE FROM `bk_oauth_refresh_tokens`;
/*!40000 ALTER TABLE `bk_oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk_oauth_refresh_tokens` ENABLE KEYS */;

--  テーブル lara_booking_db.password_resets の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.password_resets: ~0 rows (約) のデータをダンプしています
DELETE FROM `bk_password_resets`;
/*!40000 ALTER TABLE `bk_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk_password_resets` ENABLE KEYS */;

--  テーブル lara_booking_db.payment_settings の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_payment_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` int(10) unsigned DEFAULT NULL,
  `price` double(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_settings_currency_id_foreign` (`currency_id`),
  CONSTRAINT `payment_settings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.payment_settings: ~0 rows (約) のデータをダンプしています
DELETE FROM `bk_payment_settings`;
/*!40000 ALTER TABLE `bk_payment_settings` DISABLE KEYS */;
INSERT INTO `bk_payment_settings` (`id`, `currency_id`, `price`, `created_at`, `updated_at`) VALUES
	(1, 10, 1.00, '2017-08-21 11:00:08', '2021-01-04 04:10:08');
/*!40000 ALTER TABLE `bk_payment_settings` ENABLE KEYS */;

--  テーブル lara_booking_db.paypal_settings の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_paypal_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id_sandbox` text COLLATE utf8_unicode_ci NOT NULL,
  `secret_sandbox` text COLLATE utf8_unicode_ci NOT NULL,
  `client_id_live` text COLLATE utf8_unicode_ci NOT NULL,
  `secret_live` text COLLATE utf8_unicode_ci NOT NULL,
  `mode` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.paypal_settings: ~0 rows (約) のデータをダンプしています
DELETE FROM `bk_paypal_settings`;
/*!40000 ALTER TABLE `bk_paypal_settings` DISABLE KEYS */;
INSERT INTO `bk_paypal_settings` (`id`, `client_id_sandbox`, `secret_sandbox`, `client_id_live`, `secret_live`, `mode`, `created_at`, `updated_at`) VALUES
	(1, '111111111111111111111111111111111', '111111111111111111111111111111111', '111111111111111111111111111111111', '111111111111111111111111111111111', 'test', '2017-08-21 06:21:34', '2021-01-04 04:58:32');
/*!40000 ALTER TABLE `bk_paypal_settings` ENABLE KEYS */;

--  テーブル lara_booking_db.schedule の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_schedule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_id` int(10) unsigned DEFAULT NULL,
  `week_number` int(11) DEFAULT NULL COMMENT '0=sunday,1=monday,2=tuesday,3=wednesday,4=thursday,5=friday,6=saturday',
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_service_id_foreign` (`service_id`),
  CONSTRAINT `schedule_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.schedule: ~0 rows (約) のデータをダンプしています
DELETE FROM `bk_schedule`;
/*!40000 ALTER TABLE `bk_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk_schedule` ENABLE KEYS */;

--  テーブル lara_booking_db.services の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(11,2) NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'in minutes',
  `max_spot_limit` int(11) DEFAULT 1,
  `close_booking_before_time` int(11) DEFAULT NULL COMMENT 'in minutes',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `service_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'daily' COMMENT 'daily, weekly, monthly, yearly',
  `status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.services: ~2 rows (約) のデータをダンプしています
DELETE FROM `bk_services`;
/*!40000 ALTER TABLE `bk_services` DISABLE KEYS */;
INSERT INTO `bk_services` (`id`, `title`, `description`, `price`, `duration`, `max_spot_limit`, `close_booking_before_time`, `start_date`, `end_date`, `start_time`, `end_time`, `service_type`, `status`, `created_at`, `updated_at`) VALUES
	(8, '全身マッサージ', '全身マッサージ', 1.00, 60, 1, 60, '2021-01-04', '2021-02-10', '00:00:00', '13:00:00', 'daily', '1', '2021-01-04 04:51:17', '2021-01-04 04:51:17'),
	(9, '頭皮マッサージ', '頭皮マッサージ', 1.00, 60, 4, 60, '2021-01-04', '2021-01-28', '09:00:00', '10:00:00', 'daily', '1', '2021-01-04 05:42:24', '2021-01-04 05:42:24');
/*!40000 ALTER TABLE `bk_services` ENABLE KEYS */;

--  テーブル lara_booking_db.settings の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `site_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `map` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `googleplus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.settings: ~0 rows (約) のデータをダンプしています
DELETE FROM `bk_settings`;
/*!40000 ALTER TABLE `bk_settings` DISABLE KEYS */;
INSERT INTO `bk_settings` (`id`, `language`, `site_title`, `logo`, `email`, `phone`, `address`, `map`, `facebook`, `twitter`, `linkedin`, `googleplus`, `created_at`, `updated_at`) VALUES
	(1, 'ja', '予約システム', 'logo.png', 'kohana@gmail.com', '1234567', '東京都新宿区１－２－３－オフィスビル５F', '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25917.68269261916!2d139.69350059392724!3d35.708745108603615!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x60188cfe60162611%3A0x608abad8d2d494fa!2zS29tYWNoaSBUb2t5byBrYWd1cmF6YWthICjnpZ7mpb3lnYLpp4Up!5e0!3m2!1sja!2sjp!4v1609736788980!5m2!1sja!2sjp" width="800" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 'http://facebook.com', 'http://twitter.com', 'http://linkedin.com', 'http://google.com', '2017-07-03 02:02:39', '2021-01-04 05:12:04');
/*!40000 ALTER TABLE `bk_settings` ENABLE KEYS */;

--  テーブル lara_booking_db.transactions の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `trans_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit` double(11,2) NOT NULL,
  `amount` double(11,2) NOT NULL,
  `currency` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.transactions: ~9 rows (約) のデータをダンプしています
DELETE FROM `bk_transactions`;
/*!40000 ALTER TABLE `bk_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk_transactions` ENABLE KEYS */;

--  テーブル lara_booking_db.users の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fb_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credit` float NOT NULL DEFAULT 0,
  `online` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.users: ~16 rows (約) のデータをダンプしています
DELETE FROM `bk_users`;
/*!40000 ALTER TABLE `bk_users` DISABLE KEYS */;
INSERT INTO `bk_users` (`id`, `fb_id`, `firstname`, `lastname`, `email`, `password`, `remember_token`, `image`, `credit`, `online`, `status`, `created_at`, `updated_at`) VALUES
	(26, NULL, '田中', 'みなみ', 'softjapan@outlook.com', '$2y$10$fD6H8tCRcA9JkElE8VMEnORmJx2nYUROvHKeFqm4b8Xwqg8dcC4Sa', NULL, 'user_26.jpg', 0, '1', '1', '2021-01-04 09:39:01', '2021-01-04 10:22:34');
/*!40000 ALTER TABLE `bk_users` ENABLE KEYS */;

--  テーブル lara_booking_db.bk_user_chat_messages の構造をダンプしています
CREATE TABLE IF NOT EXISTS `bk_user_chat_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `message_content` text COLLATE utf8_unicode_ci NOT NULL,
  `message_read` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `message_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'in-msg=incoming message, out-msg=outgoing message for admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_chat_messages_user_id_foreign` (`user_id`),
  CONSTRAINT `user_chat_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- テーブル lara_booking_db.bk_user_chat_messages: ~63 rows (約) のデータをダンプしています
DELETE FROM `bk_user_chat_messages`;
/*!40000 ALTER TABLE `bk_user_chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `bk_user_chat_messages` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
