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
CREATE DATABASE IF NOT EXISTS `ekka` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `ekka`;

-- Dumping structure for table ekka.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGO` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME_BRAND` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.brand: ~8 rows (approximately)
DELETE FROM `brand`;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` (`ID`, `LOGO`, `NAME_BRAND`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(1, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/1.jpg?alt=media&token=86295c57-eb4f-4d80-8060-f5b69caa3421', 'CHANEL', '2022-10-13 20:38:13', '2022-10-14 08:32:23', 1),
	(2, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/2.jpg?alt=media&token=0c617fab-3dda-4b15-9fd8-bb74c81b2462', 'GUCCI', '2022-10-13 20:38:23', '2022-10-14 08:35:08', 1),
	(3, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/3.jpg?alt=media&token=4aa0d6ec-6156-4085-844b-e2d50e45368f', 'LOUIS VUITTON', '2022-10-14 11:15:51', '2022-10-14 11:16:42', 1),
	(4, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/4.jpg?alt=media&token=f1fb446d-c308-426d-8957-2e951d2f9dc7', 'DIOR', '2022-10-13 20:38:48', NULL, 1),
	(5, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/5.jpg?alt=media&token=1a01028b-96bd-4307-b967-8c5d1e0a1d5b', 'VERSACE', '2022-10-13 20:38:52', NULL, 1),
	(6, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/916e0e87-e45f-4a1d-a50f-9d7910d47ec5jpg', 'ADIDAS', '2022-10-13 20:37:37', NULL, 1),
	(7, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/2.jpg?alt=media&token=0c617fab-3dda-4b15-9fd8-bb74c81b2462', 'POKEMON', '2022-10-14 09:23:29', '2022-10-14 09:24:29', 1),
	(8, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/2.jpg?alt=media&token=0c617fab-3dda-4b15-9fd8-bb74c81b2462', 'GUCCI1', '2022-10-14 09:23:30', '2022-10-14 09:25:12', 1);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;

-- Dumping structure for table ekka.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `COLOR_PRODUCT` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SIZE_PRODUCT` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ITEM` int(11) DEFAULT NULL,
  `PRICE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE` int(11) DEFAULT '0',
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.cart: ~1 rows (approximately)
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`ID`, `PRODUCT_ID`, `USER_ID`, `COLOR_PRODUCT`, `SIZE_PRODUCT`, `ITEM`, `PRICE`, `STATE`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(29, 16, 9, '#e60000', 'S', 1, '10.8', 1, '2022-10-29 00:05:03', '2022-10-29 00:05:03');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Dumping structure for table ekka.category
CREATE TABLE IF NOT EXISTS `category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CATEGORY_LOGO` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GENDER_CATEGORY_ID` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `GENDER_CATEGORY_ID` (`GENDER_CATEGORY_ID`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`GENDER_CATEGORY_ID`) REFERENCES `gender_category` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.category: ~5 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`ID`, `CATEGORY_NAME`, `CATEGORY_LOGO`, `GENDER_CATEGORY_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(1, 'Vay', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/e01b3738-4bd9-469a-a182-86704c41bab4jpg', 1, '2022-10-14 16:02:30', '2022-10-15 07:31:37', 1),
	(2, 'Ao Da', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/eb8a81fe-e969-4818-8d51-35df76ceeed2jpg', 1, '2022-10-14 16:55:18', '2022-10-15 07:49:04', 1),
	(3, 'Quan', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/74a38b0d-6c8a-459c-b4f4-b160eb826d88jpg', 1, '2022-10-14 17:35:37', '2022-10-15 07:12:40', 1),
	(4, 'Mu', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/8882203e-f91e-4a3a-b6ec-e39f526622f8jpg', 1, '2022-10-14 21:49:17', NULL, 1),
	(5, 'Ao Da', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/eb8a81fe-e969-4818-8d51-35df76ceeed2jpg', 2, '2022-10-14 16:55:18', '2022-10-15 08:59:59', 0),
	(6, 'category1', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/4cda4b82-7a1e-4acd-a6e1-b474d9b3d974jpg', 2, '2022-10-18 07:45:07', NULL, 1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table ekka.gender_category
CREATE TABLE IF NOT EXISTS `gender_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GENDER_CATEGORY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GENDER_CATEGORY_LOGO` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.gender_category: ~0 rows (approximately)
DELETE FROM `gender_category`;
/*!40000 ALTER TABLE `gender_category` DISABLE KEYS */;
INSERT INTO `gender_category` (`ID`, `GENDER_CATEGORY_NAME`, `GENDER_CATEGORY_LOGO`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(1, 'FEMALE', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/3f825bcc-1512-44de-a74f-4f2ec6179e17jpg', '2022-10-14 10:21:33', '2022-10-14 11:20:58', 1),
	(2, 'MALE', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/2e72fd08-a0e7-4213-8397-1532fc0f4ca1jpg', '2022-10-15 07:52:23', NULL, 1);
/*!40000 ALTER TABLE `gender_category` ENABLE KEYS */;

-- Dumping structure for table ekka.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ORDER_CODE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COLOR_PRODUCT` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SIZE_PRODUCT` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DELIVERY_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME_CONSIGNEE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DELIVERY_PHONE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ITEM` int(11) DEFAULT NULL,
  `PRICE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PAYMENT` int(11) DEFAULT NULL,
  `STATE` int(11) DEFAULT '0',
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.orders: ~0 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table ekka.product
CREATE TABLE IF NOT EXISTS `product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DETAILS` text COLLATE utf8mb4_unicode_ci,
  `MORE_INFORMATION` text COLLATE utf8mb4_unicode_ci,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  `BRAND_ID` int(11) DEFAULT NULL,
  `TOTAL_PRODUCT` int(11) NOT NULL DEFAULT '0',
  `PRICE_PRODUCT` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DISCOUNT` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `CATEGORY_ID` (`CATEGORY_ID`),
  KEY `BRAND_ID` (`BRAND_ID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`BRAND_ID`) REFERENCES `brand` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product: ~0 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`ID`, `PRODUCT_NAME`, `PRODUCT_IMAGE`, `DETAILS`, `MORE_INFORMATION`, `CATEGORY_ID`, `BRAND_ID`, `TOTAL_PRODUCT`, `PRICE_PRODUCT`, `DISCOUNT`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(16, 'Tui Xach', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/b125b73d-40ca-4a2e-85c8-50743d97195bjpg', 'Day la tui xach', 'Day la tui xach', 4, 2, 128, '12', '10', '2022-10-29 00:04:23', '2022-10-29 00:04:23', 1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Dumping structure for table ekka.product_color
CREATE TABLE IF NOT EXISTS `product_color` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COLOR_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product_color: ~2 rows (approximately)
DELETE FROM `product_color`;
/*!40000 ALTER TABLE `product_color` DISABLE KEYS */;
INSERT INTO `product_color` (`ID`, `COLOR_NAME`, `PRODUCT_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(36, '#e60000', 16, '2022-10-29 00:04:23', NULL, 1),
	(37, '#00ff11', 16, '2022-10-29 00:04:23', NULL, 1),
	(38, '#eeff6b', 16, '2022-10-29 00:04:23', NULL, 1);
/*!40000 ALTER TABLE `product_color` ENABLE KEYS */;

-- Dumping structure for table ekka.product_image
CREATE TABLE IF NOT EXISTS `product_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IMAGE` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product_image: ~7 rows (approximately)
DELETE FROM `product_image`;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` (`ID`, `IMAGE`, `PRODUCT_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(106, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/b125b73d-40ca-4a2e-85c8-50743d97195bjpg', 16, '2022-10-29 00:04:23', NULL, 1),
	(107, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/b246c16e-c5c0-4459-84bf-f3c35b6d77cejpg', 16, '2022-10-29 00:04:23', NULL, 1),
	(108, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/b12939e2-bb7b-449d-bb9a-b79a3b94b264jpg', 16, '2022-10-29 00:04:23', NULL, 1),
	(109, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/4660ca51-ba75-437b-abe0-b3fab55247b7jpg', 16, '2022-10-29 00:04:23', NULL, 1),
	(110, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/c60bd16f-edc3-4f30-8015-222d3186ee49jpg', 16, '2022-10-29 00:04:23', NULL, 1),
	(111, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/862dc5c3-36c3-4f4e-b6b1-5fecac957591jpg', 16, '2022-10-29 00:04:23', NULL, 1),
	(112, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/e3e4df18-1156-46e8-a92e-38372308ae68jpg', 16, '2022-10-29 00:04:23', NULL, 1);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;

-- Dumping structure for table ekka.product_size
CREATE TABLE IF NOT EXISTS `product_size` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SIZE_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product_size: ~5 rows (approximately)
DELETE FROM `product_size`;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
INSERT INTO `product_size` (`ID`, `SIZE_NAME`, `PRODUCT_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(43, 'S', 16, '2022-10-29 00:04:23', NULL, 1),
	(44, 'M', 16, '2022-10-29 00:04:23', NULL, 1),
	(45, 'L', 16, '2022-10-29 00:04:23', NULL, 1),
	(46, 'XL', 16, '2022-10-29 00:04:23', NULL, 1),
	(47, 'XXL', 16, '2022-10-29 00:04:23', NULL, 1);
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;

-- Dumping structure for table ekka.review
CREATE TABLE IF NOT EXISTS `review` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `COMMENT` text COLLATE utf8mb4_unicode_ci,
  `RATING` int(11) DEFAULT '5',
  `STATE` int(11) DEFAULT '1',
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.review: ~0 rows (approximately)
DELETE FROM `review`;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` (`ID`, `PRODUCT_ID`, `USER_ID`, `COMMENT`, `RATING`, `STATE`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(8, 16, 9, 'oke!', 5, 1, '2022-10-29 00:05:19', '2022-10-29 00:05:19');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- Dumping structure for table ekka.user
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

-- Dumping data for table ekka.user: ~9 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`, `AVATAR`, `BACKGROUND_PROFILE`, `ROLE`, `FULLNAME`, `EMAIL`, `PHONE`, `PASSWORD`, `ADDRESS`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(1, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/5b505544-e467-43ef-a45b-2c47dd78d1d9jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/12756efb-1431-4102-ad69-a975d61743b6jpg', 'ADMIN', 'Nguyen Van Duy', 'admin@gmail.com', '0338497516', '$2a$10$VdiwVTx3sQuWgEZBPXTpVeYNGUQ/retvHZqsp/Y.jGWBh6O3cLiGi', 'Ha Noi', '2022-10-08 07:20:46', '2022-10-13 22:34:22', 1),
	(2, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/cdd3fda0-4908-4ba9-a88c-9058c554d0d8jpg', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Vu Tuan Kiet', 'user@gmail.com', '1234556789', '$2a$10$Owe92aGWiQTmu8xeVRRRzu8yVnDqHegxNPAJQREeMwgP75/ag/PEi', 'Ha Noi', '2022-10-10 09:28:21', '2022-10-13 11:29:56', 1),
	(3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/fe029911-3386-4276-bf0e-d4b997745719jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/8fa98b3c-d5d6-43c2-a644-4226b933d863jpg', 'USER', 'Nguyen Van Duy', 'vutuankiet242002@gmail.com', '0338497516', '$2a$10$/W/cjQYxWdXUqRioM1mKGOXps3oXuUQVbfYEOqnHBok3ni/ALsDLa', 'Ha Noi', '2022-10-10 16:06:52', '2022-10-18 07:44:15', 1),
	(4, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/pull-shark-default.png?alt=media&token=d8a867e5-8560-4b47-892b-01511d4b82b9', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Kieu Tri Lang', 'lang@gmail.com', '0338497516', '$2a$10$PkNBkIh5L.hUhOj71bScgufjsSgeiQjYRKZx0lJ9zal.Sr3.9JOzu', 'Ha Noi', '2022-10-10 19:32:50', '2022-10-14 11:12:31', 1),
	(5, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/7.png?alt=media&token=1820f2f9-f4fa-4b3b-96b8-acd92cce8216', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/62990426-bcee-4279-a93f-03be99203e67jpg', 'USER', 'Dang Duy Khanh', 'khanh@gmail.com', '0338497516', '$2a$10$yaRj1SZhTwqNYXlQJKpA5OSP1csDnbpRni5.SzRI4FXYJUAwie2LS', 'Ha Noi', '2022-10-10 22:01:35', '2022-10-13 11:31:07', 1),
	(6, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/5.png?alt=media&token=a08475a1-b557-4453-af45-7b0878f577c1', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Kieu Tri Lang', 'lang1412@gmail.com', NULL, '$2a$10$c4caC8Q540WZxJVCQl4a.ealhW24MzSqN7xTmjXR/6u9RGvfyVqTe', NULL, '2022-10-10 22:08:41', '2022-10-13 22:34:28', 1),
	(7, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/2.png?alt=media&token=1b86cbf8-9616-4cd2-9381-d99aff22736b', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/c706c734-0e14-4406-99f8-3e5914370f80jpg', 'USER', 'Kieu Tri Lang', '2414lq@gmail.com', '0987654321', '$2a$10$AhtSfELZw3wObClp2RZ6AedhWHIYgxHU3fcGhmRPOqEKH07hWutau', 'Ha Noi', '2022-10-11 07:33:48', '2022-10-20 23:13:36', 1),
	(8, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/75593060.png?alt=media&token=eb6d943e-b849-4c61-9bfc-f3a5ac0197e9', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Nguyen Van Duy', 'nguyenduy27092002@gmail.com', NULL, '$2a$10$ve1dKu6QqjAYMYedgvLfM.ZjCIldgINd7MJhJh3oTmavY920MUrIu', NULL, '2022-10-11 11:46:27', '2022-10-20 23:21:14', 1),
	(9, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/2a9405e8-0982-4326-a086-29d949304377jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d72e0144-d699-4470-b603-c192dd6fe940jpg', 'USER', 'Nguyen Van Duy', 'jhjjhjjhh3@gmail.com', '0338497516', '$2a$10$Pv2zF3NWIuhl8sZyL0ALwu48FO1xMWIuhJ4PLAeTt1tDwiFKZ4136', 'Ha Noi', '2022-10-11 11:49:35', '2022-10-27 08:49:35', 1),
	(10, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/1f9829ff-45ae-493d-bf7a-85ecbef7d906jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d74f0086-7a2d-4746-8974-29293e19fe24jpg', 'USER', 'Vu Tuan Kiet', 'vutuankiet2411@gmail.com', '0338497516', '$2a$10$dY9qVbm.TXfGKFLV4qqdpuhTQmOc3DoKJUa1aqmLvvJoZyGmqxEea', 'Ha Noi 1', '2022-10-11 14:52:15', '2022-10-11 19:00:45', 1),
	(11, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9a570d9c-33f7-4ad6-b58f-2ac67600e53ajpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/dd6d4716-f624-4a58-a630-c39587afccd2jpg', 'USER', 'Kieu Tri Lang', 'lang22@gmail.com', '0338497515', '$2a$10$HZjJbQXDEHyjT66tOvHS/uDn2L/DQatgJysDBEpKSiQZPD9np1yGq', 'Ha Noi', '2022-10-11 19:04:01', '2022-10-11 22:39:05', 1),
	(12, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/73fda591-499b-4ff3-a3b3-ffd1d3e144afjpg', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/8.jpg?alt=media&token=466bb2c7-a4dc-40b7-9e33-05f2506435cf', 'USER', 'Vu Tuan Kiet', 'vutuankiet11@gmail.com', '0338497516', '$2a$10$bPqNmiIGWDkFV9H7DUyeUeyAsOkFqm0HOsxsfu2/geimcGTNBZ8OK', 'Ha Noi', '2022-10-12 23:05:26', '2022-10-19 14:09:57', 1),
	(13, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/26841fc2-896c-496b-86bc-cc45097aaa91jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/eb07b9ba-9eb2-4206-baaa-e3dcaf719e1cjpg', 'USER', 'Kieu Tri Lang', 'ktlang1212@gmail.com', '0336704581', '$2a$10$qTKAeSH6g2oUpG8KXYQFEeFBZNoX6gNE7kZK.tqCqz8.JlHIt8wDC', 'Ha Noi', '2022-10-13 08:16:42', '2022-10-13 08:18:02', 1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for table ekka.user_token
CREATE TABLE IF NOT EXISTS `user_token` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.user_token: ~4 rows (approximately)
DELETE FROM `user_token`;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
INSERT INTO `user_token` (`ID`, `USER_ID`, `EMAIL`, `TOKEN`, `TYPE`, `CREATED_TIME`) VALUES
	(1, 7, '2414lq@gmail.com', '4f8b0aaa-7ba7-424e-b62d-538b5443d773', 0, '2022-10-11 07:34:03'),
	(2, 8, 'nguyenduy27092002@gmail.com', '5e5e9ccc-e5d9-4542-b741-309dcbb79431', 0, '2022-10-11 11:47:21'),
	(3, 4, 'lang@gmail.com', 'c23d3097-06a7-440d-99b7-3ad036bd3af6', 0, '2022-10-21 18:04:58'),
	(4, 3, 'vutuankiet242002@gmail.com', '14867f85-cd0e-4c8c-a807-7bd3bfe742e8', 0, '2022-10-21 18:05:12'),
	(5, 10, 'vutuankiet2411@gmail.com', 'faa6b804-5083-4268-bcea-7b0e7e1ed62f', 0, '2022-10-21 18:05:47');
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;

-- Dumping structure for table ekka.wish_list
CREATE TABLE IF NOT EXISTS `wish_list` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `PRODUCT_ID` int(11) DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `wish_list_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`),
  CONSTRAINT `wish_list_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.wish_list: ~0 rows (approximately)
DELETE FROM `wish_list`;
/*!40000 ALTER TABLE `wish_list` DISABLE KEYS */;
INSERT INTO `wish_list` (`ID`, `USER_ID`, `PRODUCT_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(40, 9, 16, '2022-10-29 00:04:59', '2022-10-29 00:04:59', 1);
/*!40000 ALTER TABLE `wish_list` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
