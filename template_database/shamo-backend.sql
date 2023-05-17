-- Adminer 4.7.6 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2014_10_12_200000_add_two_factor_columns_to_users_table',	1),
(4,	'2019_08_19_000000_create_failed_jobs_table',	1),
(5,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(6,	'2021_01_06_035346_create_sessions_table',	1),
(7,	'2021_01_17_161413_create_products_table',	1),
(8,	'2021_01_17_161417_create_product_categories_table',	1),
(9,	'2021_01_17_161427_create_product_galleries_table',	1),
(10,	'2021_01_17_161441_create_transactions_table',	1),
(11,	'2021_01_18_014436_add_roles_and_username_to_users_table',	1),
(12,	'2021_03_10_095130_create_transaction_items_table',	1);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categories_id` bigint(20) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `name`, `price`, `description`, `tags`, `categories_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	'Adidas NMD',	200.00,	'Ini adalah sepatu sport',	NULL,	1,	NULL,	'2021-04-15 02:16:06',	'2021-04-15 02:16:06'),
(2,	'Ultra 4D 5 Shoes',	285.00,	'When the adidas Ultraboost debuted back\r\nin 2015, it had an impact that spilled beyond\r\nthe world of running. For this version of t...',	NULL,	5,	NULL,	'2021-04-15 10:17:22',	'2021-04-15 10:27:20'),
(3,	'SL 20 Shoes',	123.00,	'These adidas SL20 Shoes will back your play. \r\nLightweight cushioning gives you a faster \r\npush-off and a snappy feel.',	NULL,	5,	NULL,	'2021-04-15 10:18:19',	'2021-04-15 10:39:03'),
(4,	'Ultra 4D 5 Shoes',	285.00,	'When the adidas Ultraboost debuted back \r\nin 2015, it had an impact that spilled beyond \r\nthe world of running.',	NULL,	5,	NULL,	'2021-04-15 10:18:51',	'2021-04-15 10:40:20'),
(5,	'Ultraboots 20 Shoes',	206.00,	'Wear your values on your feet with these adi\r\ndas running shoes. Rocking the wild colours \r\nshows you\'re not shy about standing out.',	NULL,	5,	NULL,	'2021-04-15 10:19:08',	'2021-04-15 10:43:19'),
(6,	'LEGO® SPORT SHOES',	92.00,	'These shoes keep kids comfortable through\r\nplaytime, whether that means running around\r\non building universes out of bricks.',	NULL,	4,	NULL,	'2021-04-15 10:20:03',	'2021-05-04 07:33:37'),
(7,	'Fortarun Running Shoes 2020',	34.00,	'Whether they\'re headed to school, day care\r\nor the playground with friends, send them\r\nout in all-day foot support with these adidas.',	NULL,	4,	NULL,	'2021-04-15 10:21:05',	'2021-05-04 07:36:17'),
(8,	'Supernove Running Shoes',	83.00,	'Two kinds of cushioning in the midsole give\r\nyou flexibility and responsiveness right where\r\nyou need them.',	NULL,	4,	NULL,	'2021-04-15 10:22:10',	'2021-05-04 07:37:14'),
(9,	'Faito Summer.RDY Tokyo Shoes',	76.00,	'Whether you\'re running out the front door to\r\nlog a few miles or want to bring a running-\r\ninspired style statement to your everyday.',	NULL,	4,	NULL,	'2021-04-15 10:22:39',	'2021-05-04 07:38:53'),
(10,	'DAME 7 SHOES',	125.00,	'Show up in big game style whether you\'re trying out for the team or challenging a friend to some one-on-one in the park.',	NULL,	3,	NULL,	'2021-05-04 07:40:05',	'2021-05-04 11:52:12'),
(11,	'Pro boots low shoes',	57.00,	'The superlight midsole features an innovative\r\ndrop-in that provides outstanding energy \r\nreturn every time you plant.',	NULL,	3,	NULL,	'2021-05-04 07:40:30',	'2021-05-04 11:55:13'),
(12,	'D.O.N ISSUE 2.0 Shoes',	111.00,	'These signature shoes from Mitchell and\r\nadidas Basketball feature graphics that\r\nhighlight the young All-Star\'s style.',	NULL,	3,	NULL,	'2021-05-04 11:35:31',	'2021-05-04 11:56:00'),
(13,	'Harden Vol. 4 Shoes',	137.00,	'Most guys are finished by late in the fourth\r\nquarter. That\'s when James Harden is just\r\ngetting started.',	NULL,	3,	NULL,	'2021-05-04 11:36:51',	'2021-05-04 11:56:57'),
(14,	'Terrex urban low  Hiking Shoes',	143.00,	'Unpaved trails and mixed surfaces are easy\r\nwhen you have the traction and support you\r\nneed. Casual enough for the daily commute.',	NULL,	2,	NULL,	'2021-05-04 11:37:22',	'2021-05-04 11:59:49'),
(15,	'TERREX EASTRAIL HIKING SHOES',	54.00,	'Built for a stable feel and confident traction\r\non wet, uneven terrain. Stack up the trail\r\nmiles in these lightweight hiking shoes',	NULL,	2,	NULL,	'2021-05-04 11:38:04',	'2021-05-04 12:10:09'),
(16,	'TERREX AX3 HIKING SHOES',	83.00,	'GORE-TEX Upper Mesh and synthetic uppers\r\nwill encase each foot in durable comfort. \r\nContinental Rubber Outs',	NULL,	2,	NULL,	'2021-05-04 11:38:29',	'2021-05-04 12:14:10'),
(17,	'TERREX TRAILMAKER HIKING SHOES',	34.00,	'The adidas Terrex Trailmaker Hiking Shoes\r\nblend responsive running-shoe design with\r\ntrail-shoe support.',	NULL,	2,	NULL,	'2021-05-04 11:38:53',	'2021-05-04 12:04:09');

DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `product_categories` (`id`, `name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	'Sport',	NULL,	'2021-04-15 02:15:27',	'2021-04-15 02:15:27'),
(2,	'Hiking',	NULL,	'2021-04-15 02:15:33',	'2021-04-15 02:15:33'),
(3,	'Basketball',	NULL,	'2021-04-15 10:09:12',	'2021-04-15 10:09:12'),
(4,	'Training',	NULL,	'2021-04-15 10:12:34',	'2021-04-15 10:21:21'),
(5,	'Running',	NULL,	'2021-04-15 10:12:44',	'2021-04-15 10:12:44'),
(6,	'All Shoes',	NULL,	'2021-04-15 10:14:25',	'2021-04-15 10:14:25');

DROP TABLE IF EXISTS `product_galleries`;
CREATE TABLE `product_galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `products_id` bigint(20) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `product_galleries` (`id`, `products_id`, `url`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	2,	'public/gallery/sW4VtliQPYnwvlbpxL5x6ZhKvbgBWT84OoiDyRsE.png',	NULL,	'2021-04-15 10:30:43',	'2021-04-15 10:30:43'),
(2,	2,	'public/gallery/ESsUP5CCJDFU9M2VENusfqpNTMnTmhaBJ1aXgObY.png',	NULL,	'2021-04-15 10:30:43',	'2021-04-15 10:30:43'),
(3,	2,	'public/gallery/XraXaJ1wpPTxKLiu7aeUNeS6ahKzcbXNDEdaoDhl.png',	NULL,	'2021-04-15 10:30:43',	'2021-04-15 10:30:43'),
(4,	2,	'public/gallery/dZCrPlwJFELXoLijEN54znQEdVHrR5XYJ2JJF9fz.png',	NULL,	'2021-04-15 10:30:43',	'2021-04-15 10:30:43'),
(5,	2,	'public/gallery/aG8N8BxYfrsFCNrS4Dy0dzRFJ8kGSeq0YfcBG5Y1.png',	NULL,	'2021-04-15 10:30:43',	'2021-04-15 10:30:43'),
(6,	2,	'public/gallery/eCb0D1Co2QPkxBgHnNkug8sCPZK4Cqo2pfRxxXbC.png',	NULL,	'2021-04-15 10:30:43',	'2021-04-15 10:30:43'),
(7,	3,	'public/gallery/MUwSao1nhz93t143rnGukQ3n3zsQOzT7bds6LaNL.png',	NULL,	'2021-05-04 07:23:36',	'2021-05-04 07:23:36'),
(8,	3,	'public/gallery/ypjT3Q93S4m4JJZU1AmFSvKGlYkzEozgquMuDlEl.png',	NULL,	'2021-05-04 07:23:36',	'2021-05-04 07:23:36'),
(9,	3,	'public/gallery/TpHwMvS5Qt16ZrWGCNvRig06Hil1KC32nhfytqJr.png',	NULL,	'2021-05-04 07:23:36',	'2021-05-04 07:23:36'),
(10,	3,	'public/gallery/790HDAkKC716Yz3mhY8dLpb1YprJbJcAyFSV9jfj.png',	NULL,	'2021-05-04 07:23:36',	'2021-05-04 07:23:36'),
(11,	3,	'public/gallery/OnoxNehpuncIDkrxLjkIuwvLk5ZhOoA0w7jqPpYo.png',	NULL,	'2021-05-04 07:23:36',	'2021-05-04 07:23:36'),
(12,	3,	'public/gallery/mUgYSLli5dluYD7RN0f0ATJqG3A3JwwWYRP9S0l6.png',	NULL,	'2021-05-04 07:23:36',	'2021-05-04 07:23:36'),
(13,	4,	'public/gallery/qFURuaDw1Q50uD6x4iBY2vSHOCj4J7L2P5kJbj2Q.png',	NULL,	'2021-05-04 07:24:38',	'2021-05-04 07:24:38'),
(14,	4,	'public/gallery/1GdKEYEWsSLWAfPBYA0SadJDiN8mTysVeXlQJdPn.png',	NULL,	'2021-05-04 07:24:38',	'2021-05-04 07:24:38'),
(15,	4,	'public/gallery/X6mVmUz9WJeReWF8VEWSUmGv2FGrsYPRdQjZx2GE.png',	NULL,	'2021-05-04 07:24:38',	'2021-05-04 07:24:38'),
(16,	4,	'public/gallery/Dvx61EybFLptTyacEOsQXUTMIRxv23zKVX0kYOqP.png',	NULL,	'2021-05-04 07:24:38',	'2021-05-04 07:24:38'),
(17,	4,	'public/gallery/Apzm7xatqXoWDCk11BkeifpEc9tJKrQgjTEeY9qN.png',	NULL,	'2021-05-04 07:24:38',	'2021-05-04 07:24:38'),
(18,	4,	'public/gallery/jLfKPCiFi3iamxOfxanObW7o24iHVldFLDjI7RQe.png',	NULL,	'2021-05-04 07:24:38',	'2021-05-04 07:24:38'),
(19,	5,	'public/gallery/c9SCBcdBsTGg0denYuTrUhudkY0TrrXqe3ef5cnk.png',	NULL,	'2021-05-04 07:25:28',	'2021-05-04 07:25:28'),
(20,	5,	'public/gallery/u2yGoCdP1tcu3z5X672fXO8RQKCeXVhiaRvksWQN.png',	NULL,	'2021-05-04 07:25:28',	'2021-05-04 07:25:28'),
(21,	5,	'public/gallery/IzeGtHfVqz4PaCZJQwuZSA4kp7TbZ75SxSKEvLwm.png',	NULL,	'2021-05-04 07:25:28',	'2021-05-04 07:25:28'),
(22,	5,	'public/gallery/Q14TGPSj8xDd3Qdlk4H36kk2XSnneHorALvBibVq.png',	NULL,	'2021-05-04 07:25:28',	'2021-05-04 07:25:28'),
(23,	5,	'public/gallery/kG9M8bitYoL3bklD5WjM8qjl7lyr4iv4YM0Uwd2c.png',	NULL,	'2021-05-04 07:25:28',	'2021-05-04 07:25:28'),
(24,	5,	'public/gallery/EO6AVZfnniMiMlAe3wqkSWKYs9GgrVsnB3NYu5Ag.png',	NULL,	'2021-05-04 07:25:28',	'2021-05-04 07:25:28'),
(25,	6,	'public/gallery/XYbi0Tp87wf5kLvzC5GxJlFKP0YdCi7eh8G5PMjS.png',	NULL,	'2021-05-04 07:26:32',	'2021-05-04 07:26:32'),
(26,	6,	'public/gallery/lVdI2v3PjixwUU8xz8Zqv0yBaPQ2CMCuQHhjuC9K.png',	NULL,	'2021-05-04 07:26:32',	'2021-05-04 07:26:32'),
(27,	6,	'public/gallery/Szl5Nu8oNAUH0l7XldPQxIOKLzGZ827oPHnUOxzB.png',	NULL,	'2021-05-04 07:26:32',	'2021-05-04 07:26:32'),
(28,	6,	'public/gallery/XQVrG0hujZhGILIMzFmma5mZe1Noi3GlWLHo8ImS.png',	NULL,	'2021-05-04 07:26:32',	'2021-05-04 07:26:32'),
(29,	6,	'public/gallery/LAPcmx2zKHS8fiuTncNmaTZxfIxwryaon5A0IKea.png',	'2021-05-04 07:26:39',	'2021-05-04 07:26:32',	'2021-05-04 07:26:39'),
(30,	6,	'public/gallery/w3nUzuGE0HQhT0VwtWQt83XiU6150TXWIKzF9Qrq.png',	NULL,	'2021-05-04 07:26:32',	'2021-05-04 07:26:32'),
(31,	6,	'public/gallery/BtnLPXafDx5MmH1leGM7KyU2rN1MEJBYdtvOZA0k.png',	NULL,	'2021-05-04 07:26:32',	'2021-05-04 07:26:32'),
(32,	7,	'public/gallery/hScbD2WYpPV2Cduxa579cR12xlUWC7260jEVkSzj.png',	'2021-05-04 07:27:51',	'2021-05-04 07:27:11',	'2021-05-04 07:27:51'),
(33,	7,	'public/gallery/1wpSewvlFXFs290PnK4H0y61LxWLtRqUJnCcY2rf.png',	'2021-05-04 07:27:51',	'2021-05-04 07:27:11',	'2021-05-04 07:27:51'),
(34,	7,	'public/gallery/QOcB4MFYLPzBRligBq4sBKCxa5jNPJGGUK845WVR.png',	'2021-05-04 07:27:56',	'2021-05-04 07:27:11',	'2021-05-04 07:27:56'),
(35,	7,	'public/gallery/JBZIm95hybdZz2B6XlJq2v9hfpX1ppnKdjaWazwz.png',	'2021-05-04 07:27:56',	'2021-05-04 07:27:11',	'2021-05-04 07:27:56'),
(36,	7,	'public/gallery/LhdN0uvRM8hb32RYqlxNH4ydvXuBKL3wnQID5VGS.png',	'2021-05-04 07:27:55',	'2021-05-04 07:27:11',	'2021-05-04 07:27:55'),
(37,	7,	'public/gallery/oTmNxsUyB7ByKUoKhhgVNqOP6jK4y64xTqNnbrtg.png',	'2021-05-04 07:27:54',	'2021-05-04 07:27:11',	'2021-05-04 07:27:54'),
(38,	7,	'public/gallery/MzhR0xpvB6zYSXKNksVJ6aIjXDb3CWo6p5egXUUZ.png',	'2021-05-04 07:29:17',	'2021-05-04 07:28:09',	'2021-05-04 07:29:17'),
(39,	7,	'public/gallery/YwW4wNL22f3Hd3jYnZiqpEmfP1qK2Bqm912w4H6E.png',	'2021-05-04 07:29:18',	'2021-05-04 07:28:09',	'2021-05-04 07:29:18'),
(40,	7,	'public/gallery/QR0oz5YUthRsPz1PAW8aJJ7FAvR2dVhA8dDBwMJN.png',	'2021-05-04 07:29:21',	'2021-05-04 07:28:09',	'2021-05-04 07:29:21'),
(41,	7,	'public/gallery/0mZSWCQtXfiGzf1gH5uqI5o4jlyUkSxrOmjPCUbA.png',	'2021-05-04 07:29:21',	'2021-05-04 07:28:09',	'2021-05-04 07:29:21'),
(42,	7,	'public/gallery/CTtoA6xervJUiIvk0E5zmD2JgrbjdCz9OBh2gdBw.png',	'2021-05-04 07:29:20',	'2021-05-04 07:28:09',	'2021-05-04 07:29:20'),
(43,	7,	'public/gallery/JCk5ShoAe2GRlR4Yvn63fyuoze2FXFEM4RobuxQd.png',	'2021-05-04 07:29:20',	'2021-05-04 07:28:09',	'2021-05-04 07:29:20'),
(44,	8,	'public/gallery/gLgH5SDUGrQNP0HkYWTr87LC497EW039LNPCms90.png',	NULL,	'2021-05-04 07:29:36',	'2021-05-04 07:29:36'),
(45,	8,	'public/gallery/645jUMcrYWMhphBRGTsX2ZJzBe7JZhcDcEZMNS4M.png',	NULL,	'2021-05-04 07:29:36',	'2021-05-04 07:29:36'),
(46,	8,	'public/gallery/0YPzKg685DRjvVLsaPumz1t7j1QRMyW5GJbcUdOV.png',	NULL,	'2021-05-04 07:29:36',	'2021-05-04 07:29:36'),
(47,	8,	'public/gallery/UUOeRtPYbwRoyimhZzK0FcEOfeMMbGetuRuY41QY.png',	NULL,	'2021-05-04 07:29:36',	'2021-05-04 07:29:36'),
(48,	8,	'public/gallery/c4BD6bYKpXq5EKhx0pEJLehbzexXToEBk3A6HpOs.png',	NULL,	'2021-05-04 07:29:36',	'2021-05-04 07:29:36'),
(49,	8,	'public/gallery/WAczik636z63hiXK3KyIz9PFGgxTjxMq2fYfR42E.png',	NULL,	'2021-05-04 07:29:36',	'2021-05-04 07:29:36'),
(50,	7,	'public/gallery/3zZbek9csRbVli6YNp6eyprU0AcwtCOUqo8SnvGj.png',	NULL,	'2021-05-04 07:30:16',	'2021-05-04 07:30:16'),
(51,	7,	'public/gallery/l1uCVNTynsM9JlXtJtqNtaFamdbISNRdFN4S8uTM.png',	NULL,	'2021-05-04 07:30:16',	'2021-05-04 07:30:16'),
(52,	7,	'public/gallery/dYrEbp7xexd4LFkCm0cFYdGbt8LUMjlS8v6IDJow.png',	NULL,	'2021-05-04 07:30:16',	'2021-05-04 07:30:16'),
(53,	7,	'public/gallery/jQ59oaXzFUTooQQksfz3YHUChIJwWKhZYdZMSKjO.png',	NULL,	'2021-05-04 07:30:16',	'2021-05-04 07:30:16'),
(54,	7,	'public/gallery/MZB5bUC7ejdyDEeQ9PYhkLmyQgHIfWoM7RL8RyFi.png',	NULL,	'2021-05-04 07:30:16',	'2021-05-04 07:30:16'),
(55,	7,	'public/gallery/jywHbOFNbOn6FlDfRPpZtKG2iXhtL1CW9w94KAry.png',	NULL,	'2021-05-04 07:30:16',	'2021-05-04 07:30:16'),
(56,	9,	'public/gallery/NESrP9wKlmCS71gXGwBaHDZWodXkrBGnNkJsnwjI.png',	NULL,	'2021-05-04 07:30:53',	'2021-05-04 07:30:53'),
(57,	9,	'public/gallery/FmP0uF4O2Cf0NTC9yZpgkBsMXLESo5wd3yfXX7JG.png',	NULL,	'2021-05-04 07:30:53',	'2021-05-04 07:30:53'),
(58,	9,	'public/gallery/c0D9t7RQODbezeIHiAZ1dhlsaMbWcPv8eNfNG1NA.png',	NULL,	'2021-05-04 07:30:53',	'2021-05-04 07:30:53'),
(59,	9,	'public/gallery/Bwlaa32z7XrYPCdyr6fyrHFfPPxsYqgTXLiaxd2X.png',	NULL,	'2021-05-04 07:30:53',	'2021-05-04 07:30:53'),
(60,	9,	'public/gallery/y8ZwOtxTipVnRghgVeCj83S1eXDu8iZIhQoYOQO9.png',	NULL,	'2021-05-04 07:30:53',	'2021-05-04 07:30:53'),
(61,	9,	'public/gallery/IDAKMX25RuNmqqLkHIunbTHo1ouS72rtHBJZImSx.png',	NULL,	'2021-05-04 07:30:53',	'2021-05-04 07:30:53'),
(62,	10,	'public/gallery/YQHYOz4y5NRrDm8r6ngF7ssVMEUTdPb30mFq2dLm.png',	NULL,	'2021-05-04 11:43:14',	'2021-05-04 11:43:14'),
(63,	10,	'public/gallery/M4h5l656VhQKR64bgRyIeux1yZpLDxGOpM5gpgPA.png',	NULL,	'2021-05-04 11:43:14',	'2021-05-04 11:43:14'),
(64,	10,	'public/gallery/88aLFwFs4JoxQjdYydbpkJ9wpAS7azZVuQaBEY43.png',	NULL,	'2021-05-04 11:43:14',	'2021-05-04 11:43:14'),
(65,	10,	'public/gallery/Z20EKmAKx6FRD6DDR1om2jAv8We8wjY5QwQo5TzA.png',	NULL,	'2021-05-04 11:43:14',	'2021-05-04 11:43:14'),
(66,	10,	'public/gallery/5OptzcHlYUBbBFjvnxIaCTWwL3Qmsar2J05IXiLr.png',	NULL,	'2021-05-04 11:43:14',	'2021-05-04 11:43:14'),
(67,	10,	'public/gallery/ePKMdaszrkhK8zVXCFEeqR2cDZebhogO2flpx7Ky.png',	NULL,	'2021-05-04 11:43:14',	'2021-05-04 11:43:14'),
(68,	12,	'public/gallery/dzF9cWN45AWvmvhRpDdoeulXSr45m6lTBB5bDKYS.png',	NULL,	'2021-05-04 11:44:49',	'2021-05-04 11:44:49'),
(69,	12,	'public/gallery/Wew0DogWeaCG0YLwLYzCJi2JIAmnEJhbKBkHoITG.png',	NULL,	'2021-05-04 11:44:49',	'2021-05-04 11:44:49'),
(70,	12,	'public/gallery/4GMLx75LlaGVqae60RCiDvuUxkG5jlEvzzNC3jA7.png',	NULL,	'2021-05-04 11:44:49',	'2021-05-04 11:44:49'),
(71,	12,	'public/gallery/rz1igOAWiyTCaLv8cgMiNdcE66E46xw29Pfbx9po.png',	NULL,	'2021-05-04 11:44:49',	'2021-05-04 11:44:49'),
(72,	12,	'public/gallery/5B5GlsNMHwtEYwKBktMiM5QmD0Y6HxjZT3OtLbeM.png',	NULL,	'2021-05-04 11:44:49',	'2021-05-04 11:44:49'),
(73,	12,	'public/gallery/3kAA8cjoJTOwL6EurjDG3S6BU1tGdBM5aqht3o6P.png',	NULL,	'2021-05-04 11:44:49',	'2021-05-04 11:44:49'),
(74,	11,	'public/gallery/8PgnXVnKdP7CxA9964a471VjLW5w7NebyIIYLxWO.png',	NULL,	'2021-05-04 11:45:34',	'2021-05-04 11:45:34'),
(75,	11,	'public/gallery/lt5vTvAy43qTFwTmtM8oOzRgUC6VBL1NThjBYRmE.png',	NULL,	'2021-05-04 11:45:34',	'2021-05-04 11:45:34'),
(76,	11,	'public/gallery/SvbtpI8FRwn1WcPHatgANVdwsuWGWMHlph3fF0Vg.png',	NULL,	'2021-05-04 11:45:34',	'2021-05-04 11:45:34'),
(77,	11,	'public/gallery/dpyuy0z2X0sQbkpEQ6xtmluhDBGztFGhPGHmD3RG.png',	NULL,	'2021-05-04 11:45:34',	'2021-05-04 11:45:34'),
(78,	11,	'public/gallery/YqmGv70Th5htQoVvYX9fhPJrhwpi1GAZ1ntycKmr.png',	NULL,	'2021-05-04 11:45:34',	'2021-05-04 11:45:34'),
(79,	11,	'public/gallery/7R55a60B9hRvsThaA1B4GtyxunvPHq1LimvK6kFq.png',	NULL,	'2021-05-04 11:45:34',	'2021-05-04 11:45:34'),
(80,	13,	'public/gallery/UB6Hud677C0XcZRb9GXcJZLhkkkXtSI8QIOvMDzO.png',	NULL,	'2021-05-04 11:46:41',	'2021-05-04 11:46:41'),
(81,	13,	'public/gallery/oVsmhP6fqoDcwgIrv0N7dGDxv8gISDbH8Oq9sPGX.png',	NULL,	'2021-05-04 11:46:41',	'2021-05-04 11:46:41'),
(82,	13,	'public/gallery/84sfU4r74fjqtUgBFWU5YH511MsmqtfGWS0A8TzZ.png',	NULL,	'2021-05-04 11:46:41',	'2021-05-04 11:46:41'),
(83,	13,	'public/gallery/64xbpGIm62Lparx8wOwMOIZupCoVoUgDeQs89aWX.png',	NULL,	'2021-05-04 11:46:41',	'2021-05-04 11:46:41'),
(84,	13,	'public/gallery/6GN1PAGdU0ntATOe0OEgLvFUPeqF4ADbs7tcciXs.png',	NULL,	'2021-05-04 11:46:41',	'2021-05-04 11:46:41'),
(85,	13,	'public/gallery/Tj9dASovJQO17dELPYToBuzWMmnvFbdOJEvXfvpS.png',	NULL,	'2021-05-04 11:46:41',	'2021-05-04 11:46:41'),
(86,	14,	'public/gallery/b96xpO10KGYt6dW6vYIQfr7QOJmbvXQo8iQI16vj.png',	NULL,	'2021-05-04 11:48:15',	'2021-05-04 11:48:15'),
(87,	14,	'public/gallery/IfFaceaymXMzPBhYpe7kwFFHdRzG4Oao7L80lxjF.png',	NULL,	'2021-05-04 11:48:15',	'2021-05-04 11:48:15'),
(88,	14,	'public/gallery/TGaMlw7PXNsQqTwXVxk6bRdbwwLN8Cr1dUWhwY5p.png',	NULL,	'2021-05-04 11:48:15',	'2021-05-04 11:48:15'),
(89,	14,	'public/gallery/qN80yZuZSH0ttmbWcjuxe5x9EX6PCVS1NmJSzyHm.png',	NULL,	'2021-05-04 11:48:15',	'2021-05-04 11:48:15'),
(90,	14,	'public/gallery/oSKGFne9QnmnxHRasn6HgVXqzODQpw3P0wZeCcSC.png',	NULL,	'2021-05-04 11:48:15',	'2021-05-04 11:48:15'),
(91,	14,	'public/gallery/fyM8v6IxoZetItazb5TD44fJLyHmd938PP9kUxM9.png',	NULL,	'2021-05-04 11:48:15',	'2021-05-04 11:48:15'),
(92,	15,	'public/gallery/SqUULXkmKLu40B4cVnfnYiCFnw44TR1PmZOgWWvf.png',	NULL,	'2021-05-04 11:49:21',	'2021-05-04 11:49:21'),
(93,	15,	'public/gallery/NNwXNbpRtHc5Cbczw1Y2iwbZIERAXtM2BhjUxDhc.png',	NULL,	'2021-05-04 11:49:21',	'2021-05-04 11:49:21'),
(94,	15,	'public/gallery/KXhNCNdbPCNTjbgQX29f7myTL1LnvkzW2zM2vWwm.png',	NULL,	'2021-05-04 11:49:21',	'2021-05-04 11:49:21'),
(95,	15,	'public/gallery/Ga6KcCukUNWmNM5kArfZNi9uqHhaeoUcFUNPZoDZ.png',	NULL,	'2021-05-04 11:49:21',	'2021-05-04 11:49:21'),
(96,	15,	'public/gallery/0uQYkvALkdYdQY7OTmLbDQJIoVL044iqWCGEoCkh.png',	NULL,	'2021-05-04 11:49:21',	'2021-05-04 11:49:21'),
(97,	15,	'public/gallery/UZc0qDBNsKqYHJI4v9adCLKaH3NmFoFaM6FXDbcT.png',	NULL,	'2021-05-04 11:49:21',	'2021-05-04 11:49:21'),
(98,	17,	'public/gallery/w9DhdAdrh5BjTHZawMvonKTzLR9bUWRfUynbeslT.png',	NULL,	'2021-05-04 11:49:46',	'2021-05-04 11:49:46'),
(99,	17,	'public/gallery/YYsmpkkuXNSkxc9lE2JKG64TXY3LgZ72dBhlBrRP.png',	NULL,	'2021-05-04 11:49:46',	'2021-05-04 11:49:46'),
(100,	17,	'public/gallery/JqWUVUrwC8dHm0Kv2hMo6yNdTIrxVtSJqLVDcXOt.png',	NULL,	'2021-05-04 11:49:46',	'2021-05-04 11:49:46'),
(101,	17,	'public/gallery/FwYy22FBuCJMBzg4TTbHZz0LLjYiVsQLhzfB4omC.png',	NULL,	'2021-05-04 11:49:46',	'2021-05-04 11:49:46'),
(102,	17,	'public/gallery/MGRkzQDllJefDpXXBmUE8IxAfe0HAdQzzs3XbkXK.png',	NULL,	'2021-05-04 11:49:46',	'2021-05-04 11:49:46'),
(103,	17,	'public/gallery/MHoxHNpcxGDZTG8f5vlutBG8mxAya0YeDVSqwTfo.png',	NULL,	'2021-05-04 11:49:46',	'2021-05-04 11:49:46'),
(104,	16,	'public/gallery/YfkNtUQcTkiYrjI1NsxbY27Qb0UjchQX0jQeZtym.png',	NULL,	'2021-05-04 11:50:13',	'2021-05-04 11:50:13'),
(105,	16,	'public/gallery/fgwNZHBIaCeWJKCtv7CgibNTQgBXi5FPbJF84O9A.png',	NULL,	'2021-05-04 11:50:13',	'2021-05-04 11:50:13'),
(106,	16,	'public/gallery/QMGe9BsqcOq1UO2qCtj3PuvmpNI3PRPYGM2qf7R1.png',	NULL,	'2021-05-04 11:50:13',	'2021-05-04 11:50:13'),
(107,	16,	'public/gallery/j64FbXsWKJVHyMpZ7TBhxlXme2eKSZ8ETRlfDVuC.png',	NULL,	'2021-05-04 11:50:13',	'2021-05-04 11:50:13'),
(108,	16,	'public/gallery/E5PH9qPFVzKhfKmSeCz70VWCUZjGhl9uF4gXD0l4.png',	NULL,	'2021-05-04 11:50:13',	'2021-05-04 11:50:13'),
(109,	16,	'public/gallery/1CVv4vw7NfXvUPpWsWAvx41KlR1FNKmNT7Nt5Qyu.png',	NULL,	'2021-05-04 11:50:13',	'2021-05-04 11:50:13');

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `total_price` double(8,2) NOT NULL DEFAULT '0.00',
  `shipping_price` double(8,2) NOT NULL DEFAULT '0.00',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `payment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'MANUAL',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `transactions` (`id`, `users_id`, `address`, `total_price`, `shipping_price`, `status`, `payment`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1,	2,	'Kota Cimahi',	2000.00,	100.00,	'SUCCESS',	'MANUAL',	NULL,	'2021-04-15 02:11:14',	'2021-04-15 02:11:52'),
(2,	2,	'Kota Cimahi',	2000.00,	100.00,	'PENDING',	'MANUAL',	NULL,	'2021-04-15 02:30:45',	'2021-04-15 02:30:45'),
(3,	2,	'Kota Cimahi',	2000.00,	100.00,	'PENDING',	'MANUAL',	NULL,	'2021-04-15 02:32:37',	'2021-04-15 02:32:37'),
(4,	3,	'Marsemoon',	206.00,	0.00,	'PENDING',	'MANUAL',	NULL,	'2021-05-05 04:53:30',	'2021-05-05 04:53:30'),
(5,	3,	'Marsemoon',	200.00,	0.00,	'PENDING',	'MANUAL',	NULL,	'2021-05-05 04:54:07',	'2021-05-05 04:54:07'),
(6,	3,	'Marsemoon',	285.00,	0.00,	'PENDING',	'MANUAL',	NULL,	'2021-05-05 05:19:05',	'2021-05-05 05:19:05'),
(7,	3,	'Marsemoon',	215.00,	0.00,	'PENDING',	'MANUAL',	NULL,	'2021-05-05 05:44:39',	'2021-05-05 05:44:39'),
(8,	3,	'Marsemoon',	285.00,	0.00,	'PENDING',	'MANUAL',	NULL,	'2021-05-05 05:48:44',	'2021-05-05 05:48:44');

DROP TABLE IF EXISTS `transaction_items`;
CREATE TABLE `transaction_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` bigint(20) NOT NULL,
  `products_id` bigint(20) NOT NULL,
  `transactions_id` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `transaction_items` (`id`, `users_id`, `products_id`, `transactions_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1,	2,	1,	1,	2,	'2021-04-15 02:11:14',	'2021-04-15 02:11:14'),
(2,	2,	2,	1,	2,	'2021-04-15 02:11:14',	'2021-04-15 02:11:14'),
(3,	2,	3,	1,	2,	'2021-04-15 02:11:14',	'2021-04-15 02:11:14'),
(4,	2,	1,	2,	2,	'2021-04-15 02:30:45',	'2021-04-15 02:30:45'),
(5,	2,	2,	2,	2,	'2021-04-15 02:30:45',	'2021-04-15 02:30:45'),
(6,	2,	3,	2,	2,	'2021-04-15 02:30:45',	'2021-04-15 02:30:45'),
(7,	2,	1,	3,	2,	'2021-04-15 02:32:37',	'2021-04-15 02:32:37'),
(8,	3,	5,	4,	1,	'2021-05-05 04:53:30',	'2021-05-05 04:53:30'),
(9,	3,	1,	5,	1,	'2021-05-05 04:54:07',	'2021-05-05 04:54:07'),
(10,	3,	2,	6,	1,	'2021-05-05 05:19:05',	'2021-05-05 05:19:05'),
(11,	3,	6,	7,	1,	'2021-05-05 05:44:39',	'2021-05-05 05:44:39'),
(12,	3,	3,	7,	1,	'2021-05-05 05:44:39',	'2021-05-05 05:44:39'),
(13,	3,	2,	8,	1,	'2021-05-05 05:48:44',	'2021-05-05 05:48:44');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2021-05-09 07:28:39
