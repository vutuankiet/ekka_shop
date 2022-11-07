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

-- Dumping structure for table ekka.bill
CREATE TABLE IF NOT EXISTS `bill` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `ORDER_CODE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DELIVERY_ADDRESS` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME_CONSIGNEE` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DELIVERY_PHONE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRICE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PAYMENT` int(11) DEFAULT NULL,
  `STATE` int(11) DEFAULT '0',
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.bill: ~4 rows (approximately)
DELETE FROM `bill`;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` (`ID`, `USER_ID`, `ORDER_CODE`, `DELIVERY_ADDRESS`, `NAME_CONSIGNEE`, `DELIVERY_PHONE`, `PRICE`, `PAYMENT`, `STATE`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(1, 10, 'FpeghatZ9fA', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', '126.56', 0, 4, '2022-11-05 09:39:58', '2022-11-06 11:42:09'),
	(3, 23, 'fHEyQzaQihk', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', '87.52', 0, 4, '2022-11-06 11:24:35', '2022-11-06 11:32:20'),
	(4, 14, 'nGRMoqUiPrB', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', '49.2', 0, 1, '2022-11-07 16:09:05', '2022-11-07 16:09:05'),
	(5, 14, 'EgUGnu5yxEN', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', '88.8', 0, 1, '2022-11-07 16:13:15', '2022-11-07 16:13:15');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;

-- Dumping structure for table ekka.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGO` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME_BRAND` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) DEFAULT '1',
  `ITEM` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.brand: ~10 rows (approximately)
DELETE FROM `brand`;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` (`ID`, `LOGO`, `NAME_BRAND`, `CREATED_AT`, `UPDATED_AT`, `STATE`, `ITEM`) VALUES
	(9, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/aa91047f-9fe2-4e9b-ae4a-2b13ff5cc482png', 'CHANEL', '2022-10-31 18:31:07', '2022-10-31 18:31:07', 1, 0),
	(10, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9b2d02ed-4b63-450b-87c1-d5a396ab95cbjpg', 'GUCCI', '2022-10-31 18:31:31', '2022-10-31 18:31:31', 1, 0),
	(11, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/53436388-2efb-49a5-ae85-07af8b585085png', 'LOUIS VUITTON', '2022-10-31 18:31:52', '2022-10-31 18:31:52', 1, 0),
	(12, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/c79ee114-18fd-4bea-a9e8-ebf713fecaafpng', 'DIOR', '2022-10-31 18:32:14', '2022-10-31 18:32:14', 1, 0),
	(13, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/582bc993-43f4-42ee-8482-6bd23ed3c4abpng', 'HERMÈS', '2022-10-31 18:32:27', '2022-10-31 18:32:27', 1, 0),
	(14, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/5ea0e329-1814-4c2c-bb2d-c33d7b3480a7jpg', 'DOLCE & GABBANA', '2022-10-31 18:33:05', '2022-10-31 18:33:05', 1, 0),
	(15, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/b405fca0-e485-44cc-9a9b-5b64a81e54ebpng', 'VERSACE', '2022-10-31 18:33:20', '2022-10-31 18:33:20', 1, 0),
	(16, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/c0e6f899-004f-436d-8ccd-f6d8a3c4aed4jpg', 'PRADA', '2022-10-31 18:33:36', '2022-10-31 18:33:36', 1, 0),
	(17, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/18ccd251-88f0-4857-bc45-2d24c79724d7jpg', 'ADIDAS', '2022-10-31 19:18:04', '2022-11-07 09:17:32', 1, 7),
	(18, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/af3850f4-ec16-4101-995d-ee6575a94173png', 'BandAll1', '2022-11-06 11:35:57', '2022-11-06 11:36:25', 1, 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.cart: ~1 rows (approximately)
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`ID`, `PRODUCT_ID`, `USER_ID`, `COLOR_PRODUCT`, `SIZE_PRODUCT`, `ITEM`, `PRICE`, `STATE`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(5, 24, 15, '#3b6b00', 'S', 24, '384.0', 1, '2022-11-02 20:43:45', '2022-11-02 20:43:45');
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
  `ITEM` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GENDER_CATEGORY_ID` (`GENDER_CATEGORY_ID`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`GENDER_CATEGORY_ID`) REFERENCES `gender_category` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.category: ~18 rows (approximately)
DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`ID`, `CATEGORY_NAME`, `CATEGORY_LOGO`, `GENDER_CATEGORY_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`, `ITEM`) VALUES
	(7, 'TOPS', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/8bd20564-b7d2-40c8-80da-718946164db0png', 7, '2022-10-31 18:35:17', '2022-10-31 18:35:17', 1, 0),
	(8, 'BOTTOMS', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/fba8a787-e7b5-4d5b-bec1-5f52fcd30d06png', 7, '2022-10-31 18:36:04', '2022-10-31 18:36:04', 1, 0),
	(9, 'HOODIE', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/b6086de4-c75b-4a2d-be25-2077e57b7d3cwebp', 7, '2022-10-31 18:36:51', '2022-10-31 18:36:51', 1, 0),
	(10, 'OUTERWEAR', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/77535142-0d14-4b94-88ed-a0509eff5029png', 7, '2022-10-31 18:37:48', '2022-10-31 18:37:48', 1, 0),
	(11, 'SHOES', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/ebf49956-32ab-4dc8-bf47-8515c8f3520epng', 7, '2022-10-31 18:38:17', '2022-11-07 09:17:32', 1, 2),
	(12, 'TOPS', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/75597500-abfe-4791-96c0-e8706ede9e89png', 8, '2022-10-31 18:38:57', '2022-10-31 18:38:57', 1, 0),
	(13, 'BOTTOMS', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/c44331c8-0f68-4539-9e42-e1599db4baa1png', 8, '2022-10-31 18:39:14', '2022-10-31 18:39:14', 1, 0),
	(14, 'DENIM', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/404332e8-b6a6-4570-a4ba-497d802a88aepng', 8, '2022-10-31 18:39:50', '2022-10-31 18:39:50', 1, 0),
	(15, 'OUTERWEAR', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9f0e7c9c-58c2-47a0-9d07-6718a754d150png', 8, '2022-10-31 18:40:16', '2022-11-07 09:17:20', 1, 3),
	(16, 'SWEATPANTS', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/33bd3741-03c4-4e55-bd51-ac9428d6c3ddpng', 8, '2022-10-31 18:40:43', '2022-10-31 18:40:43', 1, 0),
	(17, 'DRESSES', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9910fb6d-fc82-4963-af3a-72a414d46c72png', 8, '2022-10-31 18:41:12', '2022-10-31 18:41:12', 1, 0),
	(18, 'TOPS', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/37148f80-cd72-4db3-8054-dfc8d58a3a94png', 9, '2022-10-31 18:42:47', '2022-10-31 18:42:47', 1, 0),
	(19, 'BOTTOMS', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/401d7210-edcc-4bd0-be95-077d0e7c0196png', 9, '2022-10-31 18:42:58', '2022-10-31 18:42:58', 1, 0),
	(20, 'OUTERWEAR', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/7c4edcec-59a7-4a7e-bac0-a8c9318d08a1jpg', 9, '2022-10-31 18:43:13', '2022-11-07 09:17:15', 1, 1),
	(21, 'KNITWEAR', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/e83bd9ec-845b-4628-b28f-5c7e43f3f71fpng', 9, '2022-10-31 18:43:48', '2022-10-31 18:43:48', 1, 0),
	(22, 'HOODIE', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/3627a9c0-b1cd-4f2a-a128-55579b62ac9cpng', 9, '2022-10-31 19:06:21', '2022-11-07 09:17:18', 1, 1),
	(23, 'DENIM', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d78fbd0d-bb43-4b5c-994a-31e0bece2ec0png', 9, '2022-10-31 19:06:44', '2022-10-31 19:06:44', 1, 0),
	(24, 'CO-ORDS', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/7d158b86-3c8a-4418-b977-859560ce1b64png', 9, '2022-10-31 19:07:44', '2022-11-06 11:37:19', 1, 0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table ekka.contact
CREATE TABLE IF NOT EXISTS `contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `FIRST_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENT` text COLLATE utf8mb4_unicode_ci,
  `CREATED_AT` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) DEFAULT '1',
  `REPLY` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.contact: ~1 rows (approximately)
DELETE FROM `contact`;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` (`ID`, `USER_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE`, `COMMENT`, `CREATED_AT`, `UPDATED_AT`, `STATE`, `REPLY`) VALUES
	(1, 14, 'Vu', 'Tuan Kiet', 'vutuankiet2411@gmail.com', '0338497516', 'hi', '2022-11-05 13:51:05', '2022-11-05 14:05:01', 1, NULL),
	(2, 23, 'Vu', 'Tuan Kiet', 'vutuankiet899@gmail.com', '0338497516', 'Giá cả hơi đắt nha!', '2022-11-06 11:45:51', '2022-11-06 11:53:51', 2, 'Hàng đắt chất lượng cao nha =))');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;

-- Dumping structure for table ekka.gender_category
CREATE TABLE IF NOT EXISTS `gender_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GENDER_CATEGORY_NAME` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GENDER_CATEGORY_LOGO` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '1',
  `ITEM` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.gender_category: ~3 rows (approximately)
DELETE FROM `gender_category`;
/*!40000 ALTER TABLE `gender_category` DISABLE KEYS */;
INSERT INTO `gender_category` (`ID`, `GENDER_CATEGORY_NAME`, `GENDER_CATEGORY_LOGO`, `CREATED_AT`, `UPDATED_AT`, `STATE`, `ITEM`) VALUES
	(7, 'KIDS', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/92abb915-bcbc-46aa-8cd0-697910bb9a2bpng', '2022-10-31 18:30:23', '2022-11-07 09:17:32', 1, 2),
	(8, 'WOMEN', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9b57613b-6f7f-4e3d-b846-1fd2b4d6b053png', '2022-10-31 18:30:39', '2022-11-07 09:17:20', 1, 3),
	(9, 'MEN', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/6695ecaf-b78b-48c3-8cd1-f23d674d62a5png', '2022-10-31 18:30:48', '2022-11-07 09:17:18', 1, 2);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.orders: ~15 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`ID`, `PRODUCT_ID`, `USER_ID`, `ORDER_CODE`, `COLOR_PRODUCT`, `SIZE_PRODUCT`, `DELIVERY_ADDRESS`, `NAME_CONSIGNEE`, `DELIVERY_PHONE`, `ITEM`, `PRICE`, `PAYMENT`, `STATE`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(1, 19, 10, '3Kz8hbaOjpG', 'rgb(255', 'S', 'Dai Dong, Thach That, Ha Noi', 'Kieu Tri Lang', '0987654321', 10, '216', 0, 4, '2022-11-01 08:51:45', '2022-11-01 08:56:18'),
	(2, 20, 10, 'evimy41uztI', '#ffc800', 'S', 'Dai Dong, Thach That, Ha Noi', 'Kieu Tri Lang', '0987654321', 1, '22.0', 0, 4, '2022-11-01 08:59:03', '2022-11-01 09:06:16'),
	(3, 19, 10, 'evimy41uztI', '#ffea00', 'S', 'Dai Dong, Thach That, Ha Noi', 'Kieu Tri Lang', '0987654321', 1, '21.6', 0, 4, '2022-11-01 08:59:03', '2022-11-01 09:06:16'),
	(4, 19, 15, '99wReoPuo9x', 'rgb(0', 'L', 'Dai Dong, Thach That, Ha Noi', 'Kieu Xuan Truong', '0987654321', 988, '21340.800000000003', 0, 4, '2022-11-02 20:36:51', '2022-11-02 20:39:52'),
	(5, 21, 10, 'FpeghatZ9fA', 'rgb(0, 0, 0)', 'S', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', 3, '63.36', 0, 4, '2022-11-05 09:39:46', '2022-11-06 11:42:09'),
	(6, 22, 10, 'FpeghatZ9fA', '#000000', 'S', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', 1, '25.2', 0, 4, '2022-11-05 09:39:57', '2022-11-06 11:42:09'),
	(7, 24, 10, 'FpeghatZ9fA', '#3b6b00', 'S', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', 1, '16.0', 0, 4, '2022-11-05 09:39:58', '2022-11-06 11:42:09'),
	(8, 20, 10, 'FpeghatZ9fA', '#ffc800', 'S', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', 1, '22.0', 0, 4, '2022-11-05 09:39:58', '2022-11-06 11:42:09'),
	(11, 24, 23, 'fHEyQzaQihk', '#3b6b00', 'XL', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', 2, '16.0', 0, 4, '2022-11-06 11:24:34', '2022-11-06 11:32:20'),
	(12, 21, 23, 'fHEyQzaQihk', '#000000', 'XL', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', 2, '21.12', 0, 4, '2022-11-06 11:24:35', '2022-11-06 11:32:20'),
	(13, 22, 23, 'fHEyQzaQihk', '#000000', 'XL', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', 3, '50.4', 0, 4, '2022-11-06 11:24:35', '2022-11-06 11:32:20'),
	(14, 22, 14, 'nGRMoqUiPrB', '#000000', 'S', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', 3, '25.2', 0, 1, '2022-11-07 16:09:05', '2022-11-07 16:09:05'),
	(15, 23, 14, 'nGRMoqUiPrB', '#ffffff', 'S', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', 3, '24.0', 0, 1, '2022-11-07 16:09:05', '2022-11-07 16:09:05'),
	(16, 24, 14, 'EgUGnu5yxEN', '#3b6b00', 'S', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', 3, '48', 0, 1, '2022-11-07 16:13:15', '2022-11-07 16:13:15'),
	(17, 25, 14, 'EgUGnu5yxEN', '#e6e389', 'S', 'Dai Dong, Thach That, Ha Noi', 'Vu Tuan Kiet', '0987654321', 2, '40.8', 0, 1, '2022-11-07 16:13:15', '2022-11-07 16:13:15');
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
  `PRICE_PRODUCT` float DEFAULT '0',
  `DISCOUNT` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RATING` float DEFAULT '0',
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NULL DEFAULT NULL,
  `STATE` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `CATEGORY_ID` (`CATEGORY_ID`),
  KEY `BRAND_ID` (`BRAND_ID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`BRAND_ID`) REFERENCES `brand` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product: ~6 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`ID`, `PRODUCT_NAME`, `PRODUCT_IMAGE`, `DETAILS`, `MORE_INFORMATION`, `CATEGORY_ID`, `BRAND_ID`, `TOTAL_PRODUCT`, `PRICE_PRODUCT`, `DISCOUNT`, `RATING`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(19, 'Boys Chevron Pattern Hook-and-loop Fastener Sneakers', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/906eca07-f1d5-4faf-bac5-5a0d5ad27d83png', 'Color:	                Multicolor\r\nPattern Type:	Colorblock\r\nToe:	                Round Toe\r\nDetails:	                Lace Up\r\nInsole Material:	Mesh\r\nOutsole Material:	MD\r\nUpper Material:	Fabric\r\nLining Material:	Mesh\r\nGender:	                Boys\r\nType:	                Chunky Sneakers', 'Boys Chevron Pattern Hook-and-loop Fastener Sneakers\r\nColor:	                Multicolor\r\nPattern Type:	Colorblock\r\nToe:	                Round Toe\r\nDetails:	                Lace Up\r\nInsole Material:	Mesh\r\nOutsole Material:	MD\r\nUpper Material:	Fabric\r\nLining Material:	Mesh\r\nGender:	                Boys\r\nType:	                Chunky Sneakers', 11, 17, 0, 24, '10', 4, '2022-10-31 19:21:51', '2022-11-07 09:17:28', 1),
	(20, 'Boys Color Block Hook-and-loop Fastener Running Shoes', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/73d58e36-f674-4a10-a245-7d53c7e6ef4dpng', 'Color:	                Multicolor\r\nPattern Type:	Colorblock\r\nToe:	                Round Toe\r\nDetails:	                Lace Up\r\nInsole Material:	Mesh\r\nOutsole Material:	MD\r\nUpper Material:	Fabric\r\nLining Material:	Mesh\r\nGender:	                Boys\r\nType:	                Running Shoes', 'Boys Color Block Hook-and-loop Fastener Running Shoes\r\nColor:	                Multicolor\r\nPattern Type:	Colorblock\r\nToe:	                Round Toe\r\nDetails:	                Lace Up\r\nInsole Material:	Mesh\r\nOutsole Material:	MD\r\nUpper Material:	Fabric\r\nLining Material:	Mesh\r\nGender:	                Boys\r\nType:	                Running Shoes', 11, 17, 997, 22, '0', 5, '2022-10-31 19:28:02', '2022-11-07 09:17:32', 1),
	(21, 'Men Letter Graphic Color-block Drawstring Hoodie', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d700ae26-bc88-488e-8819-94a79de0e787png', 'Color:	                  Khaki\r\nStyle:	                  Casual\r\nPattern Type:	  Letter, Colorblock\r\nDetails:	                  Drawstring, Pocket\r\nType:	                  Pullovers\r\nNeckline:	          Hooded\r\nSleeve Length:	  Long Sleeve\r\nSleeve Type:	          Regular Sleeve\r\nLength:	                  Regular\r\nFit Type:	                  Slim Fit\r\nFabric:	                  Slight Stretch\r\nMaterial:	          Fabric\r\nComposition:	  95% Polyester, 5% Elastane\r\nCare Instructions:  Machine wash or professional dry clean\r\nSheer:	                  No', 'Men Letter Graphic Color-block Drawstring Hoodie\r\nColor:	                  Khaki\r\nStyle:	                  Casual\r\nPattern Type:	  Letter, Colorblock\r\nDetails:	                  Drawstring, Pocket\r\nType:	                  Pullovers\r\nNeckline:	          Hooded\r\nSleeve Length:	  Long Sleeve\r\nSleeve Type:	          Regular Sleeve\r\nLength:	                  Regular\r\nFit Type:	                  Slim Fit\r\nFabric:	                  Slight Stretch\r\nMaterial:	          Fabric\r\nComposition:	  95% Polyester, 5% Elastane\r\nCare Instructions:  Machine wash or professional dry clean\r\nSheer:	                  No', 22, 17, 982, 24, '12', 0, '2022-10-31 19:34:24', '2022-11-07 09:17:18', 1),
	(22, 'Men Plaid Print Pocket Patched Overcoat Without Hoodie', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/7c1847a9-bbf5-41b6-9ae1-ca938edd08c4png', 'Style:	                        Casual\r\nColor:	                        Black and White\r\nPattern Type:	        Plaid\r\nDetails:	                        Pocket, Button Front\r\nType:	                        Regular\r\nNeckline:	                Collar\r\nSleeve Length:	        Long Sleeve\r\nSleeve Type:	                Regular Sleeve\r\nLength:	                        Regular\r\nPlacket:	                        Single Breasted\r\nFit Type:	                        Regular Fit\r\nFabric:	                        Non-Stretch\r\nWaterproof:	                No\r\nMaterial:	                Wool-Like Fabric\r\nComposition:	        90% Polyester, 10% Wool\r\nCare Instructions:	Hand wash or professionally dry clean\r\nSheer:	                         No', 'Men Plaid Print Pocket Patched Overcoat Without Hoodie\r\nStyle:	                        Casual\r\nColor:	                        Black and White\r\nPattern Type:	        Plaid\r\nDetails:	                        Pocket, Button Front\r\nType:	                        Regular\r\nNeckline:	                Collar\r\nSleeve Length:	        Long Sleeve\r\nSleeve Type:	                Regular Sleeve\r\nLength:	                        Regular\r\nPlacket:	                        Single Breasted\r\nFit Type:	                        Regular Fit\r\nFabric:	                        Non-Stretch\r\nWaterproof:	                No\r\nMaterial:	                Wool-Like Fabric\r\nComposition:	        90% Polyester, 10% Wool\r\nCare Instructions:	Hand wash or professionally dry clean\r\nSheer:	                         No', 20, 17, 990, 28, '10', 5, '2022-10-31 19:41:25', '2022-11-07 16:09:05', 1),
	(23, 'Plaid Print Teddy Lined Snap Button Drawstring Hooded Coat', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/cdc8fb01-349e-4da0-91c1-71c98aef6db0png', 'Color:	                        Dark Green\r\nStyle:	                        Casual\r\nPattern Type:	        Plaid\r\nType:	                        Other\r\nDetails:	                        Drawstring, Button Front\r\nNeckline:	                Hooded\r\nSleeve Length:	        Long Sleeve\r\nSleeve Type:	                Regular Sleeve\r\nLength:	                        Regular\r\nPlacket:	                        Single Breasted\r\nFit Type:	                        Regular Fit\r\nFabric:	                        Non-Stretch\r\nMaterial:	                Fabric\r\nComposition:	        100% Polyester\r\nCare Instructions:	Machine wash or professional dry clean\r\nSheer:	                        No', 'Plaid Print Teddy Lined Snap Button Drawstring Hooded Coat\r\nColor:	                        Dark Green\r\nStyle:	                        Casual\r\nPattern Type:	        Plaid\r\nType:	                        Other\r\nDetails:	                        Drawstring, Button Front\r\nNeckline:	                Hooded\r\nSleeve Length:	        Long Sleeve\r\nSleeve Type:	                Regular Sleeve\r\nLength:	                        Regular\r\nPlacket:	                        Single Breasted\r\nFit Type:	                        Regular Fit\r\nFabric:	                        Non-Stretch\r\nMaterial:	                Fabric\r\nComposition:	        100% Polyester\r\nCare Instructions:	Machine wash or professional dry clean\r\nSheer:	                        No', 15, 17, 994, 24, '0', 0, '2022-10-31 19:46:39', '2022-11-07 16:09:05', 1),
	(24, 'Reflective Expression Print Zipper Hooded Jacket', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9b282533-4209-44e0-a4e4-b5201a807ddbpng', 'Color:	                        Black\r\nStyle:	                        Casual\r\nPattern Type:	        Cartoon\r\nType:	                        Other\r\nNeckline:	                Hooded\r\nDetails:	                        Zipper\r\nSleeve Length:	        Long Sleeve\r\nSleeve Type:	                Regular Sleeve\r\nLength:	                        Regular\r\nPlacket:	                        Zipper\r\nFit Type:	                        Regular Fit\r\nFabric:	                        Non-Stretch\r\nMaterial:	                Fabric\r\nComposition:	        100% Polyester\r\nCare Instructions:	Machine wash or professional dry clean\r\nSheer:	                        No', 'Reflective Expression Print Zipper Hooded Jacket\r\nColor:	                        Black\r\nStyle:	                        Casual\r\nPattern Type:	        Cartoon\r\nType:	                        Other\r\nNeckline:	                Hooded\r\nDetails:	                        Zipper\r\nSleeve Length:	        Long Sleeve\r\nSleeve Type:	                Regular Sleeve\r\nLength:	                        Regular\r\nPlacket:	                        Zipper\r\nFit Type:	                        Regular Fit\r\nFabric:	                        Non-Stretch\r\nMaterial:	                Fabric\r\nComposition:	        100% Polyester\r\nCare Instructions:	Machine wash or professional dry clean\r\nSheer:	                        No', 15, 17, 993, 16, '0', 1, '2022-10-31 19:52:15', '2022-11-07 16:13:15', 1),
	(25, 'Test product 1', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/df16baac-3e02-49e9-90b2-ddf0c2703e74png', 'Test Description 1', 'test detail 1', 15, 17, 997, 24, '15', 0, '2022-11-06 11:40:45', '2022-11-07 16:13:15', 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product_color: ~8 rows (approximately)
DELETE FROM `product_color`;
/*!40000 ALTER TABLE `product_color` DISABLE KEYS */;
INSERT INTO `product_color` (`ID`, `COLOR_NAME`, `PRODUCT_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(47, '#ffea00', 19, '2022-10-31 19:21:51', NULL, 1),
	(48, '#000000', 19, '2022-10-31 19:21:51', NULL, 1),
	(49, '#ffc800', 20, '2022-10-31 19:34:24', NULL, 1),
	(50, '#000000', 21, '2022-10-31 19:34:24', NULL, 1),
	(51, '#666666', 21, '2022-10-31 19:34:24', NULL, 1),
	(52, '#000000', 22, '2022-10-31 19:41:25', NULL, 1),
	(53, '#ffffff', 23, '2022-10-31 19:41:25', NULL, 1),
	(54, '#3b6b00', 24, '2022-10-31 19:46:39', NULL, 1),
	(58, '#e6e389', 25, '2022-11-06 11:41:29', NULL, 1),
	(59, '#000000', 25, '2022-11-06 11:41:29', NULL, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product_image: ~49 rows (approximately)
DELETE FROM `product_image`;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` (`ID`, `IMAGE`, `PRODUCT_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(127, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/906eca07-f1d5-4faf-bac5-5a0d5ad27d83png', 19, '2022-10-31 19:21:51', NULL, 1),
	(128, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/b4b970c2-10f2-41a0-bfa4-2ffea498cbc3png', 19, '2022-10-31 19:21:51', NULL, 1),
	(129, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/834d6d3c-e789-46bc-89f2-6879fa53ffa0png', 19, '2022-10-31 19:21:51', NULL, 1),
	(130, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/921b3b2b-e442-4b70-9e94-d03e84ab1a0apng', 19, '2022-10-31 19:21:51', NULL, 1),
	(131, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/f90c8dcf-9268-4ee8-89d8-a78e3d873581png', 19, '2022-10-31 19:21:51', NULL, 1),
	(132, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/849717a8-3f07-484b-8d8a-3ecbe162ae34png', 19, '2022-10-31 19:21:51', NULL, 1),
	(133, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/63e02588-28cd-43d7-aa77-bd2dde0e48c3png', 19, '2022-10-31 19:21:51', NULL, 1),
	(134, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/73d58e36-f674-4a10-a245-7d53c7e6ef4dpng', 20, '2022-10-31 19:28:02', NULL, 1),
	(135, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/5b054483-1caa-4ea1-bbd0-540956ad2fbcpng', 20, '2022-10-31 19:28:02', NULL, 1),
	(136, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/90be314b-cf6f-4aad-a807-2f8c269c7e8apng', 20, '2022-10-31 19:28:02', NULL, 1),
	(137, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/39aca2e3-85ce-45e3-bf85-662e3ef7e775png', 20, '2022-10-31 19:28:02', NULL, 1),
	(138, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/4b6b0ead-2329-46b2-9c70-ac6c624b99e6png', 20, '2022-10-31 19:28:02', NULL, 1),
	(139, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/5238e93a-dd3f-4ca4-bb7c-cbafbdf3aafepng', 20, '2022-10-31 19:28:02', NULL, 1),
	(140, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/aa312bc3-3da1-469c-800c-8c4afedc174dpng', 20, '2022-10-31 19:28:02', NULL, 1),
	(141, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d700ae26-bc88-488e-8819-94a79de0e787png', 21, '2022-10-31 19:34:24', NULL, 1),
	(142, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/634fffb6-7901-4504-bdf5-0d2a971cab09png', 21, '2022-10-31 19:34:24', NULL, 1),
	(143, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/c9db7c40-9a0e-4874-a5fc-7543304cf23apng', 21, '2022-10-31 19:34:24', NULL, 1),
	(144, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/f737cd3e-d052-4500-baca-5256d19a18edpng', 21, '2022-10-31 19:34:24', NULL, 1),
	(145, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/8da60a46-c7b2-4c3b-b6be-30a701dc50bapng', 21, '2022-10-31 19:34:24', NULL, 1),
	(146, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9b0f1242-1032-4b00-b94f-82bc2e597b41png', 21, '2022-10-31 19:34:24', NULL, 1),
	(147, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/e2234810-d241-4e93-8e42-e37ba73f6ca1png', 21, '2022-10-31 19:34:24', NULL, 1),
	(148, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/7c1847a9-bbf5-41b6-9ae1-ca938edd08c4png', 22, '2022-10-31 19:41:25', NULL, 1),
	(149, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/62f28f4f-6f5a-4c00-a271-4c702b250258png', 22, '2022-10-31 19:41:25', NULL, 1),
	(150, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/4406b55f-eb01-4489-bcfe-ce20dda05a01png', 22, '2022-10-31 19:41:25', NULL, 1),
	(151, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/57fd7495-4802-4b98-af4a-e1663377fa10png', 22, '2022-10-31 19:41:25', NULL, 1),
	(152, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/da1cb813-c00f-4782-ac20-2809557270a2png', 22, '2022-10-31 19:41:25', NULL, 1),
	(153, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/581a36b0-affc-434d-ae5c-12aa2854f8c7png', 22, '2022-10-31 19:41:25', NULL, 1),
	(154, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/6a1c6158-0090-494f-beb5-f832adc2e7dbpng', 22, '2022-10-31 19:41:25', NULL, 1),
	(155, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/cdc8fb01-349e-4da0-91c1-71c98aef6db0png', 23, '2022-10-31 19:46:39', NULL, 1),
	(156, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/27456ce7-f2cc-42b8-803d-0ad57c16265cpng', 23, '2022-10-31 19:46:39', NULL, 1),
	(157, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/f6019839-6ba0-4214-9205-81173d6f615fpng', 23, '2022-10-31 19:46:39', NULL, 1),
	(158, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/49003508-4521-4331-9863-aab376bb8568png', 23, '2022-10-31 19:46:39', NULL, 1),
	(159, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9eaac884-de39-4b3a-81b6-cd77126a1f91png', 23, '2022-10-31 19:46:39', NULL, 1),
	(160, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/c0abbf45-84c7-49bb-8d9c-d4836e0cef3epng', 23, '2022-10-31 19:46:39', NULL, 1),
	(161, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/b9a592aa-a7ae-4638-b0e4-07574cd0b8e8png', 23, '2022-10-31 19:46:39', NULL, 1),
	(162, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9b282533-4209-44e0-a4e4-b5201a807ddbpng', 24, '2022-10-31 19:52:15', NULL, 1),
	(163, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/45bb4f66-e706-4ab8-882b-566200372098png', 24, '2022-10-31 19:52:15', NULL, 1),
	(164, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/2182fac1-af52-4456-82be-efb0182d77c6png', 24, '2022-10-31 19:52:15', NULL, 1),
	(165, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d552fef1-ed64-4bfe-937d-8e9618c558e1png', 24, '2022-10-31 19:52:15', NULL, 1),
	(166, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/db5df0d9-c3a9-486c-bba5-168080179eadpng', 24, '2022-10-31 19:52:15', NULL, 1),
	(167, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/5c264928-24aa-43a1-9fdf-d7d48c2a18d6png', 24, '2022-10-31 19:52:15', NULL, 1),
	(168, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/6339e569-1ed2-4d42-9d39-8f9f4ab4124dpng', 24, '2022-10-31 19:52:15', NULL, 1),
	(176, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/df16baac-3e02-49e9-90b2-ddf0c2703e74png', 25, '2022-11-06 11:41:29', NULL, 1),
	(177, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/565e19a6-eedb-4d52-872f-2dfa876db9f7png', 25, '2022-11-06 11:41:29', NULL, 1),
	(178, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/e7049803-92ae-4330-a01a-7986ce34ef0fpng', 25, '2022-11-06 11:41:29', NULL, 1),
	(179, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/20d6bb96-0f31-4d31-8be0-f3e7450e7d3epng', 25, '2022-11-06 11:41:29', NULL, 1),
	(180, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d9e40844-25f7-4c46-98db-404efb018d54png', 25, '2022-11-06 11:41:29', NULL, 1),
	(181, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/2f743311-82f9-44b0-bc28-a1451b59ec79png', 25, '2022-11-06 11:41:29', NULL, 1),
	(182, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d305d67c-89e3-4ba7-9412-4a1fd4f7cba3png', 25, '2022-11-06 11:41:29', NULL, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.product_size: ~32 rows (approximately)
DELETE FROM `product_size`;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
INSERT INTO `product_size` (`ID`, `SIZE_NAME`, `PRODUCT_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(58, 'S', 19, '2022-10-31 19:21:51', NULL, 1),
	(59, 'M', 19, '2022-10-31 19:21:51', NULL, 1),
	(60, 'L', 19, '2022-10-31 19:21:51', NULL, 1),
	(61, 'XL', 19, '2022-10-31 19:21:51', NULL, 1),
	(62, 'XXL', 19, '2022-10-31 19:21:51', NULL, 1),
	(63, 'S', 20, '2022-10-31 19:28:02', NULL, 1),
	(64, 'M', 20, '2022-10-31 19:28:02', NULL, 1),
	(65, 'L', 20, '2022-10-31 19:28:02', NULL, 1),
	(66, 'XL', 20, '2022-10-31 19:28:02', NULL, 1),
	(67, 'XXL', 20, '2022-10-31 19:28:02', NULL, 1),
	(68, 'S', 21, '2022-10-31 19:34:24', NULL, 1),
	(69, 'M', 21, '2022-10-31 19:34:24', NULL, 1),
	(70, 'L', 21, '2022-10-31 19:34:24', NULL, 1),
	(71, 'XL', 21, '2022-10-31 19:34:24', NULL, 1),
	(72, 'XXL', 21, '2022-10-31 19:34:24', NULL, 1),
	(73, 'S', 22, '2022-10-31 19:41:25', NULL, 1),
	(74, 'M', 22, '2022-10-31 19:41:25', NULL, 1),
	(75, 'L', 22, '2022-10-31 19:41:25', NULL, 1),
	(76, 'XL', 22, '2022-10-31 19:41:25', NULL, 1),
	(77, 'XXL', 22, '2022-10-31 19:41:25', NULL, 1),
	(78, 'S', 24, '2022-10-31 19:52:15', NULL, 1),
	(79, 'M', 24, '2022-10-31 19:52:15', NULL, 1),
	(80, 'L', 24, '2022-10-31 19:52:15', NULL, 1),
	(81, 'XL', 24, '2022-10-31 19:52:15', NULL, 1),
	(82, 'XXL', 24, '2022-10-31 19:52:15', NULL, 1),
	(83, 'S', 23, '2022-11-05 11:38:54', NULL, 1),
	(84, 'M', 23, '2022-11-05 11:39:30', NULL, 1),
	(90, 'S', 25, '2022-11-06 11:41:29', NULL, 1),
	(91, 'M', 25, '2022-11-06 11:41:29', NULL, 1),
	(92, 'L', 25, '2022-11-06 11:41:29', NULL, 1),
	(93, 'XL', 25, '2022-11-06 11:41:29', NULL, 1),
	(94, 'XXL', 25, '2022-11-06 11:41:29', NULL, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.review: ~3 rows (approximately)
DELETE FROM `review`;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` (`ID`, `PRODUCT_ID`, `USER_ID`, `COMMENT`, `RATING`, `STATE`, `CREATED_AT`, `UPDATED_AT`) VALUES
	(2, 20, 15, 'oke', 5, 1, '2022-11-02 20:41:12', '2022-11-05 12:56:47'),
	(3, 24, 14, 'f*ck!', 1, 1, '2022-11-05 16:31:38', '2022-11-05 16:31:38'),
	(5, 19, 23, 'good!', 4, 1, '2022-11-06 11:22:57', '2022-11-06 11:22:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.user: ~19 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`ID`, `AVATAR`, `BACKGROUND_PROFILE`, `ROLE`, `FULLNAME`, `EMAIL`, `PHONE`, `PASSWORD`, `ADDRESS`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(1, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/5b505544-e467-43ef-a45b-2c47dd78d1d9jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/12756efb-1431-4102-ad69-a975d61743b6jpg', 'ADMIN', 'Vu Tuan Kiet', 'admin@gmail.com', '0338497516', '$2a$10$VdiwVTx3sQuWgEZBPXTpVeYNGUQ/retvHZqsp/Y.jGWBh6O3cLiGi', 'Ha Noi', '2022-10-08 07:20:46', '2022-11-06 11:44:04', 1),
	(2, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/cdd3fda0-4908-4ba9-a88c-9058c554d0d8jpg', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Vu Tuan Kiet', 'user@gmail.com', '1234556789', '$2a$10$Owe92aGWiQTmu8xeVRRRzu8yVnDqHegxNPAJQREeMwgP75/ag/PEi', 'Ha Noi', '2022-10-10 09:28:21', '2022-10-13 11:29:56', 1),
	(3, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/fe029911-3386-4276-bf0e-d4b997745719jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/8fa98b3c-d5d6-43c2-a644-4226b933d863jpg', 'USER', 'Nguyen Van Duy', 'vutuankiet242002@gmail.com', '0338497516', '$2a$10$/W/cjQYxWdXUqRioM1mKGOXps3oXuUQVbfYEOqnHBok3ni/ALsDLa', 'Ha Noi', '2022-10-10 16:06:52', '2022-10-18 07:44:15', 1),
	(4, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/pull-shark-default.png?alt=media&token=d8a867e5-8560-4b47-892b-01511d4b82b9', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Kieu Tri Lang', 'lang@gmail.com', '0338497516', '$2a$10$PkNBkIh5L.hUhOj71bScgufjsSgeiQjYRKZx0lJ9zal.Sr3.9JOzu', 'Ha Noi', '2022-10-10 19:32:50', '2022-10-14 11:12:31', 1),
	(5, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/7.png?alt=media&token=1820f2f9-f4fa-4b3b-96b8-acd92cce8216', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/62990426-bcee-4279-a93f-03be99203e67jpg', 'USER', 'Dang Duy Khanh', 'khanh@gmail.com', '0338497516', '$2a$10$yaRj1SZhTwqNYXlQJKpA5OSP1csDnbpRni5.SzRI4FXYJUAwie2LS', 'Ha Noi', '2022-10-10 22:01:35', '2022-10-13 11:31:07', 1),
	(6, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/5.png?alt=media&token=a08475a1-b557-4453-af45-7b0878f577c1', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Kieu Tri Lang', 'lang1412@gmail.com', NULL, '$2a$10$c4caC8Q540WZxJVCQl4a.ealhW24MzSqN7xTmjXR/6u9RGvfyVqTe', NULL, '2022-10-10 22:08:41', '2022-10-13 22:34:28', 1),
	(7, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/2.png?alt=media&token=1b86cbf8-9616-4cd2-9381-d99aff22736b', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/c706c734-0e14-4406-99f8-3e5914370f80jpg', 'USER', 'Kieu Tri Lang', '2414lq@gmail.com', '0987654321', '$2a$10$AhtSfELZw3wObClp2RZ6AedhWHIYgxHU3fcGhmRPOqEKH07hWutau', 'Ha Noi', '2022-10-11 07:33:48', '2022-10-20 23:13:36', 1),
	(8, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/75593060.png?alt=media&token=eb6d943e-b849-4c61-9bfc-f3a5ac0197e9', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Nguyen Van Duy', 'nguyenduy27092002@gmail.com', NULL, '$2a$10$ve1dKu6QqjAYMYedgvLfM.ZjCIldgINd7MJhJh3oTmavY920MUrIu', NULL, '2022-10-11 11:46:27', '2022-10-20 23:21:14', 1),
	(9, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/2a9405e8-0982-4326-a086-29d949304377jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d72e0144-d699-4470-b603-c192dd6fe940jpg', 'USER', 'Nguyen Van Duy', 'jhjjhjjhh3@gmail.com', '0338497516', '$2a$10$Pv2zF3NWIuhl8sZyL0ALwu48FO1xMWIuhJ4PLAeTt1tDwiFKZ4136', 'Ha Noi', '2022-10-11 11:49:35', '2022-10-27 08:49:35', 1),
	(10, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/485ce92c-4dde-4f1f-acd6-59de933efec7png', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/d74f0086-7a2d-4746-8974-29293e19fe24jpg', 'USER', 'Kiều Trí Lăng', 'vutuankiet2411@gmail.com', '0338497516', '$2a$10$dY9qVbm.TXfGKFLV4qqdpuhTQmOc3DoKJUa1aqmLvvJoZyGmqxEea', 'Ha Noi', '2022-10-11 14:52:15', '2022-11-01 08:53:33', 1),
	(11, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/9a570d9c-33f7-4ad6-b58f-2ac67600e53ajpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/dd6d4716-f624-4a58-a630-c39587afccd2jpg', 'USER', 'Kieu Tri Lang', 'lang22@gmail.com', '0338497515', '$2a$10$HZjJbQXDEHyjT66tOvHS/uDn2L/DQatgJysDBEpKSiQZPD9np1yGq', 'Ha Noi', '2022-10-11 19:04:01', '2022-10-11 22:39:05', 1),
	(12, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/73fda591-499b-4ff3-a3b3-ffd1d3e144afjpg', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/8.jpg?alt=media&token=466bb2c7-a4dc-40b7-9e33-05f2506435cf', 'USER', 'Vu Tuan Kiet', 'vutuankiet11@gmail.com', '0338497516', '$2a$10$bPqNmiIGWDkFV9H7DUyeUeyAsOkFqm0HOsxsfu2/geimcGTNBZ8OK', 'Ha Noi', '2022-10-12 23:05:26', '2022-10-19 14:09:57', 1),
	(13, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/26841fc2-896c-496b-86bc-cc45097aaa91jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/eb07b9ba-9eb2-4206-baaa-e3dcaf719e1cjpg', 'USER', 'Kieu Tri Lang', 'ktlang1212@gmail.com', '0336704581', '$2a$10$qTKAeSH6g2oUpG8KXYQFEeFBZNoX6gNE7kZK.tqCqz8.JlHIt8wDC', 'Ha Noi', '2022-10-13 08:16:42', '2022-10-13 08:18:02', 1),
	(14, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/3.png?alt=media&token=6fffe950-4ced-475f-a11a-5945854435a5', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/8.jpg?alt=media&token=466bb2c7-a4dc-40b7-9e33-05f2506435cf', 'USER', 'Kieu Tri Lang', 'kieutrilang@gmail.com', NULL, '$2a$10$ozPPWur5FSotSauJVDoUXe4Gv0o4WVQ5K1bcGXzNC1lth2JQ2j8La', NULL, '2022-10-30 13:52:13', '2022-10-30 13:52:13', 1),
	(15, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/quickdraw-default.png?alt=media&token=3e24e12b-99d1-44d7-a0a8-e5b4f67a5284', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/8.jpg?alt=media&token=466bb2c7-a4dc-40b7-9e33-05f2506435cf', 'USER', 'Kieu Xuan Truong', 'kieuxuantruongkst@gmail.com', NULL, '$2a$10$w.6zQAcqm6Chj12aZ6iFFuUOrIYQpDTd.pRyd8GyM6yoFXuAmbXtS', NULL, '2022-11-02 20:35:57', '2022-11-02 20:35:57', 1),
	(18, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/7.png?alt=media&token=1820f2f9-f4fa-4b3b-96b8-acd92cce8216', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/7.jpg?alt=media&token=fc622850-1f91-48d6-ba94-443e5c59bf9c', 'USER', 'Vu Tuan Kiet', 'vutuankiet24112002@gmail.com', NULL, '$2a$10$GJKJhWSPAgyBEcFU4xcp.enVs1NdkVjp/FqOinE6fsHmzHuVrxUm6', NULL, '2022-11-03 11:42:06', '2022-11-03 12:56:59', 1),
	(19, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/75593060.png?alt=media&token=eb6d943e-b849-4c61-9bfc-f3a5ac0197e9', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/9.jpg?alt=media&token=07e42795-0838-4801-b395-d1b40a7e3584', 'USER', 'Vu Tuan Kiet', 'kieutrilang11@gmail.com', NULL, '$2a$10$xS8iOqZ/D1j8/9mp.gDeUu6tIq9y1uW5YOeQIsLlH95aw9X1RTetK', NULL, '2022-11-05 16:55:41', '2022-11-05 16:55:41', 2),
	(20, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/75593060.png?alt=media&token=eb6d943e-b849-4c61-9bfc-f3a5ac0197e9', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/8.jpg?alt=media&token=466bb2c7-a4dc-40b7-9e33-05f2506435cf', 'USER', 'Kieu Tri Lang', 'nitendo062002@gmail.com', NULL, '$2a$10$yuuG6CxO7hCTInql2reP/O5k9C99BogQBmOedPbZiQ6ZLOW7U//AO', NULL, '2022-11-05 16:56:56', '2022-11-05 16:57:13', 1),
	(21, 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/5.png?alt=media&token=a08475a1-b557-4453-af45-7b0878f577c1', 'https://firebasestorage.googleapis.com/v0/b/k34dl-8e937.appspot.com/o/8.jpg?alt=media&token=466bb2c7-a4dc-40b7-9e33-05f2506435cf', 'USER', 'Vu Tuan Kiet', 'vutuankiet889@gmail.com', NULL, '$2a$10$4DrBzzdBGvLEpGIHJAhCH.zYvclZIhqgnrNDUi5LsZ0g0IPQsrMfS', NULL, '2022-11-06 10:23:21', '2022-11-06 10:23:21', 2),
	(23, 'https://storage.googleapis.com/k34dl-8e937.appspot.com/1148fbe9-3034-4276-a790-bae64fec3d49jpg', 'https://storage.googleapis.com/k34dl-8e937.appspot.com/f4fd6ea4-f02b-4f6b-b69a-6669f5c3add5jpg', 'USER', 'Vu Tuan Kiet', 'vutuankiet899@gmail.com', '0336704581', '$2a$10$axbFc4gLxsv74sVi39IbL.EQjMME1c4N1KrHrdgBXxyuE.TT1ijlK', 'Ha Noi', '2022-11-06 11:20:52', '2022-11-06 11:31:24', 1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.user_token: ~0 rows (approximately)
DELETE FROM `user_token`;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table ekka.wish_list: ~4 rows (approximately)
DELETE FROM `wish_list`;
/*!40000 ALTER TABLE `wish_list` DISABLE KEYS */;
INSERT INTO `wish_list` (`ID`, `USER_ID`, `PRODUCT_ID`, `CREATED_AT`, `UPDATED_AT`, `STATE`) VALUES
	(1, 15, 20, '2022-11-02 20:41:02', '2022-11-02 20:41:02', 1),
	(2, 15, 24, '2022-11-02 20:43:38', '2022-11-02 20:43:38', 1),
	(5, 23, 24, '2022-11-06 11:21:29', '2022-11-06 11:21:29', 1),
	(7, 23, 19, '2022-11-06 11:23:13', '2022-11-06 11:23:13', 1);
/*!40000 ALTER TABLE `wish_list` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
