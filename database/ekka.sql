-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ekka
DROP DATABASE IF EXISTS `ekka`;
CREATE DATABASE IF NOT EXISTS `ekka` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `ekka`;

-- Dumping structure for table ekka.brand
DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGO` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME_BRAND` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.brand: ~0 rows (approximately)
DELETE FROM `brand`;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;

-- Dumping structure for table ekka.category
DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GENDER_CATEGORY_ID` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.category: ~0 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table ekka.gender_category
DROP TABLE IF EXISTS `gender_category`;
CREATE TABLE IF NOT EXISTS `gender_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GENDER_CATEGORY_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.gender_category: ~0 rows (approximately)
DELETE FROM `gender_category`;
/*!40000 ALTER TABLE `gender_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `gender_category` ENABLE KEYS */;

-- Dumping structure for table ekka.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESTAIL` text COLLATE utf8mb4_unicode_ci,
  `MORE_INFORMATION` text COLLATE utf8mb4_unicode_ci,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  `GENDER_CATEGORY_ID` int(11) DEFAULT NULL,
  `TOTAL_PRODUCT` int(11) NOT NULL DEFAULT '0',
  `PRICE_PRODUCT` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product: ~0 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table ekka.product_color
DROP TABLE IF EXISTS `product_color`;
CREATE TABLE IF NOT EXISTS `product_color` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COLOR_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product_color: ~0 rows (approximately)
DELETE FROM `product_color`;
/*!40000 ALTER TABLE `product_color` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_color` ENABLE KEYS */;

-- Dumping structure for table ekka.product_image
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE IF NOT EXISTS `product_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IMAGE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `COLOR_ID` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product_image: ~0 rows (approximately)
DELETE FROM `product_image`;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;

-- Dumping structure for table ekka.product_size
DROP TABLE IF EXISTS `product_size`;
CREATE TABLE IF NOT EXISTS `product_size` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SIZE_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRODUCT_COLOR_ID` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product_size: ~0 rows (approximately)
DELETE FROM `product_size`;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;

-- Dumping structure for table ekka.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AVATAR` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BACKGROUND_PROFILE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ROLE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'USER',
  `FULLNAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.user: ~13 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`, `AVATAR`, `BACKGROUND_PROFILE`, `ROLE`, `FULLNAME`, `EMAIL`, `PHONE`, `PASSWORD`, `ADDRESS`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(1, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/5b505544-e467-43ef-a45b-2c47dd78d1d9jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/12756efb-1431-4102-ad69-a975d61743b6jpg', 'ADMIN', 'Nguyen Van Duy', 'admin@gmail.com', '0338497516', '$2a$10$VdiwVTx3sQuWgEZBPXTpVeYNGUQ/retvHZqsp/Y.jGWBh6O3cLiGi', 'Ha Noi', '2022-10-08 07:20:46', '2022-10-12 11:48:59', 1),
	(2, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/cdd3fda0-4908-4ba9-a88c-9058c554d0d8jpg', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Vu Tuan Kiet', 'user@gmail.com', '1234556789', '$2a$10$Owe92aGWiQTmu8xeVRRRzu8yVnDqHegxNPAJQREeMwgP75/ag/PEi', 'Ha Noi', '2022-10-10 09:28:21', '2022-10-13 08:48:40', 1),
	(3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/e6c59820-30cd-4ef4-8978-2d9b93060336jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/8fa98b3c-d5d6-43c2-a644-4226b933d863jpg', 'USER', 'Vu Tuan Kiet', 'vutuankiet242002@gmail.com', '0338497516', '$2a$10$/W/cjQYxWdXUqRioM1mKGOXps3oXuUQVbfYEOqnHBok3ni/ALsDLa', 'Ha Noi', '2022-10-10 16:06:52', '2022-10-13 08:15:16', 0),
	(4, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/pull-shark-default.png?alt=media&token=d8a867e5-8560-4b47-892b-01511d4b82b9', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Kieu Tri Lang', 'lang@gmail.com', NULL, '$2a$10$PkNBkIh5L.hUhOj71bScgufjsSgeiQjYRKZx0lJ9zal.Sr3.9JOzu', NULL, '2022-10-10 19:32:50', '2022-10-13 08:15:25', 1),
	(5, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/7.png?alt=media&token=1820f2f9-f4fa-4b3b-96b8-acd92cce8216', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Dang Duy Khanh', 'khanh@gmail.com', NULL, '$2a$10$yaRj1SZhTwqNYXlQJKpA5OSP1csDnbpRni5.SzRI4FXYJUAwie2LS', NULL, '2022-10-10 22:01:35', NULL, 1),
	(6, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/5.png?alt=media&token=a08475a1-b557-4453-af45-7b0878f577c1', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Kieu Tri Lang', 'lang1412@gmail.com', NULL, '$2a$10$c4caC8Q540WZxJVCQl4a.ealhW24MzSqN7xTmjXR/6u9RGvfyVqTe', NULL, '2022-10-10 22:08:41', NULL, 1),
	(7, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/2.png?alt=media&token=1b86cbf8-9616-4cd2-9381-d99aff22736b', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/c706c734-0e14-4406-99f8-3e5914370f80jpg', 'USER', 'Kieu Tri Lang', '2414lq@gmail.com', '0987654321', '$2a$10$AhtSfELZw3wObClp2RZ6AedhWHIYgxHU3fcGhmRPOqEKH07hWutau', 'Ha Noi', '2022-10-11 07:33:48', '2022-10-12 12:16:37', 1),
	(8, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/75593060.png?alt=media&token=eb6d943e-b849-4c61-9bfc-f3a5ac0197e9', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Nguyen Van Duy', 'nguyenduy27092002@gmail.com', NULL, '$2a$10$ve1dKu6QqjAYMYedgvLfM.ZjCIldgINd7MJhJh3oTmavY920MUrIu', NULL, '2022-10-11 11:46:27', NULL, 1),
	(9, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/quickdraw-default.png?alt=media&token=3e24e12b-99d1-44d7-a0a8-e5b4f67a5284', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Nguyen Van Duy', 'jhjjhjjhh3@gmail.com', NULL, '$2a$10$Pv2zF3NWIuhl8sZyL0ALwu48FO1xMWIuhJ4PLAeTt1tDwiFKZ4136', NULL, '2022-10-11 11:49:35', NULL, 1),
	(10, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/1f9829ff-45ae-493d-bf7a-85ecbef7d906jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d74f0086-7a2d-4746-8974-29293e19fe24jpg', 'USER', 'Vu Tuan Kiet', 'vutuankiet2411@gmail.com', '0338497516', '$2a$10$dY9qVbm.TXfGKFLV4qqdpuhTQmOc3DoKJUa1aqmLvvJoZyGmqxEea', 'Ha Noi 1', '2022-10-11 14:52:15', '2022-10-11 19:00:45', 1),
	(11, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9a570d9c-33f7-4ad6-b58f-2ac67600e53ajpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/dd6d4716-f624-4a58-a630-c39587afccd2jpg', 'USER', 'Kieu Tri Lang', 'lang22@gmail.com', '0338497515', '$2a$10$HZjJbQXDEHyjT66tOvHS/uDn2L/DQatgJysDBEpKSiQZPD9np1yGq', 'Ha Noi', '2022-10-11 19:04:01', '2022-10-11 22:39:05', 1),
	(12, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/7.png?alt=media&token=1820f2f9-f4fa-4b3b-96b8-acd92cce8216', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/8.jpg?alt=media&token=466bb2c7-a4dc-40b7-9e33-05f2506435cf', 'USER', 'Vu Tuan Kiet', 'vutuankiet11@gmail.com', '0338497516', '$2a$10$bPqNmiIGWDkFV9H7DUyeUeyAsOkFqm0HOsxsfu2/geimcGTNBZ8OK', 'Ha Noi', '2022-10-12 23:05:26', NULL, 1),
	(13, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/26841fc2-896c-496b-86bc-cc45097aaa91jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/eb07b9ba-9eb2-4206-baaa-e3dcaf719e1cjpg', 'USER', 'Kieu Tri Lang', 'ktlang1212@gmail.com', '0336704581', '$2a$10$qTKAeSH6g2oUpG8KXYQFEeFBZNoX6gNE7kZK.tqCqz8.JlHIt8wDC', 'Ha Noi', '2022-10-13 08:16:42', '2022-10-13 08:18:02', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table ekka.user_token
DROP TABLE IF EXISTS `user_token`;
CREATE TABLE IF NOT EXISTS `user_token` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.user_token: ~2 rows (approximately)
DELETE FROM `user_token`;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
INSERT INTO `user_token` (`ID`, `USER_ID`, `EMAIL`, `TOKEN`, `TYPE`, `CREATED_TIME`) VALUES
	(1, 7, '2414lq@gmail.com', '4f8b0aaa-7ba7-424e-b62d-538b5443d773', 0, '2022-10-11 07:34:03'),
	(2, 8, 'nguyenduy27092002@gmail.com', '5e5e9ccc-e5d9-4542-b741-309dcbb79431', 0, '2022-10-11 11:47:21');
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
