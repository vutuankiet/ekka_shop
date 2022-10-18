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

-- Dumping structure for table ekka.product
CREATE TABLE IF NOT EXISTS `product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product: ~6 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`ID`, `PRODUCT_NAME`, `DETAILS`, `MORE_INFORMATION`, `CATEGORY_ID`, `BRAND_ID`, `TOTAL_PRODUCT`, `PRICE_PRODUCT`, `DISCOUNT`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(7, '7', '7', '7', 3, 3, 4, '7', NULL, '2022-10-16 10:08:12', '2022-10-16 21:25:46', 1),
	(8, '8', '8', '8', 2, 3, 8, '8', NULL, '2022-10-16 10:10:17', NULL, 1),
	(9, '9', '9', '9', 4, 5, 9, '9', NULL, '2022-10-16 10:58:08', NULL, 1),
	(10, '10', '10', '10', 1, 7, 7, '10', NULL, '2022-10-16 11:07:55', NULL, 1),
	(11, '11', '11', '11', 1, 3, 11, '11', NULL, '2022-10-16 11:11:47', NULL, 1),
	(12, '12', '12', '12', 3, 4, 12, '12', NULL, '2022-10-16 14:58:44', NULL, 1),
	(13, '13', '13', '13', 4, 3, 13, '13', '20', '2022-10-16 15:21:24', NULL, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product_color: ~8 rows (approximately)
DELETE FROM `product_color`;
/*!40000 ALTER TABLE `product_color` DISABLE KEYS */;
INSERT INTO `product_color` (`ID`, `COLOR_NAME`, `PRODUCT_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(12, '#e63d3d', 7, '2022-10-16 10:08:12', NULL, 1),
	(13, '#ffffff', 7, '2022-10-16 10:08:12', NULL, 1),
	(14, '#000000', 7, '2022-10-16 10:08:12', NULL, 1),
	(15, '#000000', 7, '2022-10-16 10:08:12', NULL, 1),
	(16, '#d09595', 8, '2022-10-16 10:10:17', NULL, 1),
	(17, '#000000', 8, '2022-10-16 10:10:17', NULL, 1),
	(18, '#000000', 8, '2022-10-16 10:10:17', NULL, 1),
	(19, '#000000', 8, '2022-10-16 10:10:17', NULL, 1),
	(20, '#fa0000', 9, '2022-10-16 10:58:08', NULL, 1),
	(21, '#e65c5c', 13, '2022-10-16 15:21:24', NULL, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product_image: ~44 rows (approximately)
DELETE FROM `product_image`;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` (`ID`, `IMAGE`, `PRODUCT_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(1, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/a402c5a8-4435-44db-92e7-3dc9765f17f4jpg', 7, '2022-10-16 10:08:12', NULL, 1),
	(2, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/b1b85728-9da0-4ed6-9ac7-9979120e3f20jpg', 7, '2022-10-16 10:08:12', NULL, 1),
	(3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d200f34a-8e4d-4c99-976e-8ec1e9b6015cjpg', 7, '2022-10-16 10:08:12', NULL, 1),
	(4, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/e96271d2-33cc-4112-b715-ec97930c71c5jpg', 7, '2022-10-16 10:08:12', NULL, 1),
	(5, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/8e139cd4-ebcd-4629-a562-b4174ef26671jpg', 7, '2022-10-16 10:08:12', NULL, 1),
	(6, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/4ccdd7fb-814f-4c8b-9cc3-aa36336c9191jpg', 7, '2022-10-16 10:08:12', NULL, 1),
	(7, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/3affaa7e-7662-4684-947b-77b1b27118d3jpg', 7, '2022-10-16 10:08:12', NULL, 1),
	(8, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/1efb8465-eb63-4444-8b0f-a7c1964e4771jpg', 8, '2022-10-16 10:10:17', NULL, 1),
	(9, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/3d9280e5-440a-4c28-ada9-f24f8690a521jpg', 8, '2022-10-16 10:10:17', NULL, 1),
	(10, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/44b443f9-ab45-4e18-8d21-7987fdcf9fa9jpg', 8, '2022-10-16 10:10:17', NULL, 1),
	(11, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/44f58b5b-98b6-43e2-92ca-2c70ee601278jpg', 8, '2022-10-16 10:10:17', NULL, 1),
	(12, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/5514deba-2837-4c4a-bb8f-bab18f6160eajpg', 8, '2022-10-16 10:10:17', NULL, 1),
	(13, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/e8fd48ed-eb7e-4e30-a5ea-822515b99c03jpg', 8, '2022-10-16 10:10:17', NULL, 1),
	(14, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/8f59060d-1691-44db-b925-1c8e9a8183e1jpg', 8, '2022-10-16 10:10:17', NULL, 1),
	(15, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9b4a7b67-faa2-479c-b0d8-a16ace8e131ejpg', 9, '2022-10-16 10:58:08', NULL, 1),
	(16, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9afc7329-0ecd-49f1-b23b-a08ed1f2d64cjpg', 9, '2022-10-16 10:58:08', NULL, 1),
	(17, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/556f60f5-e16f-4859-85c5-d1e6295aff5fjpg', 9, '2022-10-16 10:58:08', NULL, 1),
	(18, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/ab201870-f373-403a-9042-4e7974d9036ejpg', 9, '2022-10-16 10:58:08', NULL, 1),
	(19, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/6c904b2f-555e-48f1-b3be-d431ed396486jpg', 9, '2022-10-16 10:58:08', NULL, 1),
	(20, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/52b18601-ed18-41fb-8855-fc3f858ae7e2jpg', 9, '2022-10-16 10:58:08', NULL, 1),
	(21, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/56865f80-0612-4851-a84b-038928e5e47ejpg', 9, '2022-10-16 10:58:08', NULL, 1),
	(22, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/eda50ce5-d35d-45f2-acce-9dd7d1f640d5jpg', 10, '2022-10-16 11:07:55', NULL, 1),
	(23, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/aaf304f0-af4c-43ba-ad47-25e98406b9b2jpg', 10, '2022-10-16 11:07:55', NULL, 1),
	(24, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/6cba80d4-f81d-45fe-b3b5-54bf2d9162d0jpg', 10, '2022-10-16 11:07:55', NULL, 1),
	(25, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/54f75e48-5799-43b5-98d1-c5b67c0889bcjpg', 10, '2022-10-16 11:07:55', NULL, 1),
	(26, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/b298c87a-b11d-4bc3-a155-99202af079d5jpg', 10, '2022-10-16 11:07:55', NULL, 1),
	(27, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/466fa93b-a785-4276-b8d4-225ec115bb19jpg', 10, '2022-10-16 11:07:55', NULL, 1),
	(28, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/3bc79fad-1ffe-4dd6-bcaa-228cb00b6794jpg', 10, '2022-10-16 11:07:55', NULL, 1),
	(29, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/fa659966-adea-4256-8646-c38a27184eeejpg', 11, '2022-10-16 11:11:47', NULL, 1),
	(30, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/721b53fe-146b-46fe-a1d0-3d454eaec0d7jpg', 11, '2022-10-16 11:11:47', NULL, 1),
	(31, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/ec6abf8b-620b-4bcf-875d-22ba1c134abcjpg', 11, '2022-10-16 11:11:47', NULL, 1),
	(32, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/62580e38-618a-491b-ac2e-103902ec7205jpg', 11, '2022-10-16 11:11:47', NULL, 1),
	(33, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/8b6dd54b-c3b6-4530-b177-0a4f4aa4b206jpg', 11, '2022-10-16 11:11:47', NULL, 1),
	(34, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/dfe1c4ad-8920-40dd-872a-bf3112830c51jpg', 11, '2022-10-16 11:11:47', NULL, 1),
	(35, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/3a69514f-72bd-4524-87be-5d330b6e5029jpg', 11, '2022-10-16 11:11:47', NULL, 1),
	(36, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/52212dfa-f88e-4050-973a-0d51d0c1e21cjpg', 12, '2022-10-16 14:58:44', NULL, 1),
	(37, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/98de7611-502a-4fba-90c7-4876875bb5edjpg', 12, '2022-10-16 14:58:44', NULL, 1),
	(38, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/2fc6e19c-a232-4f44-bc47-38f9007d2099jpg', 12, '2022-10-16 14:58:44', NULL, 1),
	(39, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/ae041897-8567-460c-bf4d-30ad652017cdjpg', 12, '2022-10-16 14:58:44', NULL, 1),
	(40, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/dd93a3dd-281d-4554-916b-053724a65d91jpg', 12, '2022-10-16 14:58:44', NULL, 1),
	(41, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/c8f2d7c9-ff92-4712-a538-b2c136ccb650jpg', 12, '2022-10-16 14:58:44', NULL, 1),
	(42, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/aa806d5d-0695-4770-a558-5b9442674336jpg', 12, '2022-10-16 14:58:44', NULL, 1),
	(43, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/a43b600c-9c77-4dde-9ede-e1eef4947511jpg', 13, '2022-10-16 15:21:24', NULL, 1),
	(44, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/133955c5-8292-48cc-a167-7bdba2a2ebf5jpg', 13, '2022-10-16 15:21:24', NULL, 1),
	(45, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/900603ab-c3f6-47e7-8a34-68bd6408e3e4jpg', 13, '2022-10-16 15:21:24', NULL, 1),
	(46, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/aa8b9bcf-bd99-4ed3-a58f-7c266f98691ejpg', 13, '2022-10-16 15:21:24', NULL, 1),
	(47, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/fb0ff693-9ff2-405d-bbc6-c751c1f2b56fjpg', 13, '2022-10-16 15:21:24', NULL, 1),
	(48, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/71d1c0f6-1459-45f6-852b-0b61f6d8aa00jpg', 13, '2022-10-16 15:21:24', NULL, 1),
	(49, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/0a55c4ce-99be-40e5-9a76-3a0167d72b91jpg', 13, '2022-10-16 15:21:24', NULL, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product_size: ~12 rows (approximately)
DELETE FROM `product_size`;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
INSERT INTO `product_size` (`ID`, `SIZE_NAME`, `PRODUCT_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(4, 'S', 7, '2022-10-16 10:08:12', NULL, 1),
	(5, 'M', 7, '2022-10-16 10:08:12', NULL, 1),
	(6, 'L', 7, '2022-10-16 10:08:12', NULL, 1),
	(7, 'XL', 7, '2022-10-16 10:08:12', NULL, 1),
	(8, 'XXL', 7, '2022-10-16 10:08:12', NULL, 1),
	(9, 'S', 8, '2022-10-16 10:10:17', NULL, 1),
	(10, 'M', 8, '2022-10-16 10:10:17', NULL, 1),
	(11, 'S', 9, '2022-10-16 10:58:08', NULL, 1),
	(12, 'M', 9, '2022-10-16 10:58:08', NULL, 1),
	(13, 'L', 9, '2022-10-16 10:58:08', NULL, 1),
	(14, 'S', 13, '2022-10-16 15:21:24', NULL, 1),
	(15, 'M', 13, '2022-10-16 15:21:24', NULL, 1);
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;

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
	(7, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/2.png?alt=media&token=1b86cbf8-9616-4cd2-9381-d99aff22736b', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/c706c734-0e14-4406-99f8-3e5914370f80jpg', 'USER', 'Kieu Tri Lang', '2414lq@gmail.com', '0987654321', '$2a$10$AhtSfELZw3wObClp2RZ6AedhWHIYgxHU3fcGhmRPOqEKH07hWutau', 'Ha Noi', '2022-10-11 07:33:48', '2022-10-13 09:43:01', 0),
	(8, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/75593060.png?alt=media&token=eb6d943e-b849-4c61-9bfc-f3a5ac0197e9', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Nguyen Van Duy', 'nguyenduy27092002@gmail.com', NULL, '$2a$10$ve1dKu6QqjAYMYedgvLfM.ZjCIldgINd7MJhJh3oTmavY920MUrIu', NULL, '2022-10-11 11:46:27', '2022-10-18 07:42:56', 0),
	(9, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d24c2207-997c-47c1-b3af-132b858d965fjpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/de8b7625-263a-4ea1-9f99-158ede8f78bcjpg', 'USER', 'Nguyen Van Duy', 'jhjjhjjhh3@gmail.com', '0338497516', '$2a$10$Pv2zF3NWIuhl8sZyL0ALwu48FO1xMWIuhJ4PLAeTt1tDwiFKZ4136', 'Ha Noi', '2022-10-11 11:49:35', '2022-10-18 07:59:59', 1),
	(10, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/1f9829ff-45ae-493d-bf7a-85ecbef7d906jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d74f0086-7a2d-4746-8974-29293e19fe24jpg', 'USER', 'Vu Tuan Kiet', 'vutuankiet2411@gmail.com', '0338497516', '$2a$10$dY9qVbm.TXfGKFLV4qqdpuhTQmOc3DoKJUa1aqmLvvJoZyGmqxEea', 'Ha Noi 1', '2022-10-11 14:52:15', '2022-10-11 19:00:45', 1),
	(11, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9a570d9c-33f7-4ad6-b58f-2ac67600e53ajpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/dd6d4716-f624-4a58-a630-c39587afccd2jpg', 'USER', 'Kieu Tri Lang', 'lang22@gmail.com', '0338497515', '$2a$10$HZjJbQXDEHyjT66tOvHS/uDn2L/DQatgJysDBEpKSiQZPD9np1yGq', 'Ha Noi', '2022-10-11 19:04:01', '2022-10-11 22:39:05', 1),
	(12, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/7.png?alt=media&token=1820f2f9-f4fa-4b3b-96b8-acd92cce8216', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/8.jpg?alt=media&token=466bb2c7-a4dc-40b7-9e33-05f2506435cf', 'USER', 'Vu Tuan Kiet', 'vutuankiet11@gmail.com', '0338497516', '$2a$10$bPqNmiIGWDkFV9H7DUyeUeyAsOkFqm0HOsxsfu2/geimcGTNBZ8OK', 'Ha Noi', '2022-10-12 23:05:26', NULL, 1),
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
