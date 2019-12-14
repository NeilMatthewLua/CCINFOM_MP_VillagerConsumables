CREATE DATABASE  IF NOT EXISTS `villagebayanihan` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `villagebayanihan`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: villagebayanihan
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `approvals`
--

DROP TABLE IF EXISTS `approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approvals` (
  `approved` enum('Y','N') NOT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `admin_email` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  PRIMARY KEY (`admin_email`,`user_email`),
  KEY `FK0002_idx` (`user_email`),
  CONSTRAINT `FK0001` FOREIGN KEY (`admin_email`) REFERENCES `sysadmins` (`admin_email`),
  CONSTRAINT `FK0002` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approvals`
--

LOCK TABLES `approvals` WRITE;
/*!40000 ALTER TABLE `approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `businesses`
--

DROP TABLE IF EXISTS `businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `businesses` (
  `businessID` int(8) unsigned NOT NULL,
  `company_email` varchar(45) NOT NULL,
  `business_type` varchar(45) NOT NULL,
  `company_name` varchar(45) NOT NULL,
  `blockNo` int(8) unsigned DEFAULT NULL,
  `company_address_line1` varchar(45) NOT NULL,
  `company_address_line2` varchar(45) NOT NULL,
  `operation_start_time` time NOT NULL,
  `operation_end_time` time NOT NULL,
  `in_village` enum('Y','N') NOT NULL,
  `distance_village` decimal(6,2) NOT NULL,
  `business_status` enum('O','N') NOT NULL COMMENT 'O = operational\nN = non-operational',
  `owner_email` varchar(45) NOT NULL,
  PRIMARY KEY (`businessID`),
  UNIQUE KEY `company_email_UNIQUE` (`company_email`),
  KEY `FK0015_idx` (`owner_email`) /*!80000 INVISIBLE */,
  CONSTRAINT `FK0015` FOREIGN KEY (`owner_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `businesses`
--

LOCK TABLES `businesses` WRITE;
/*!40000 ALTER TABLE `businesses` DISABLE KEYS */;
/*!40000 ALTER TABLE `businesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_passed_days`
--

DROP TABLE IF EXISTS `cart_passed_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_passed_days` (
  `days_passed` date NOT NULL,
  `vendorID` int(8) unsigned NOT NULL,
  PRIMARY KEY (`days_passed`),
  KEY `FK0037_idx` (`vendorID`),
  CONSTRAINT `FK0037` FOREIGN KEY (`vendorID`) REFERENCES `parks` (`vendorID`),
  CONSTRAINT `FK0049` FOREIGN KEY (`vendorID`) REFERENCES `routes` (`vendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_passed_days`
--

LOCK TABLES `cart_passed_days` WRITE;
/*!40000 ALTER TABLE `cart_passed_days` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_passed_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_passed_times`
--

DROP TABLE IF EXISTS `cart_passed_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_passed_times` (
  `times_passed` time NOT NULL,
  `vendorID` int(8) unsigned NOT NULL,
  PRIMARY KEY (`times_passed`),
  KEY `FK0037_idx` (`vendorID`),
  CONSTRAINT `FK0038` FOREIGN KEY (`vendorID`) REFERENCES `parks` (`vendorID`),
  CONSTRAINT `Fk0039` FOREIGN KEY (`vendorID`) REFERENCES `routes` (`vendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_passed_times`
--

LOCK TABLES `cart_passed_times` WRITE;
/*!40000 ALTER TABLE `cart_passed_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_passed_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartvendors`
--

DROP TABLE IF EXISTS `cartvendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartvendors` (
  `vendorID` int(8) unsigned NOT NULL,
  `businessID` int(8) unsigned NOT NULL,
  PRIMARY KEY (`vendorID`),
  KEY `FK0035_idx` (`businessID`),
  CONSTRAINT `FK0035` FOREIGN KEY (`businessID`) REFERENCES `businesses` (`businessID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartvendors`
--

LOCK TABLES `cartvendors` WRITE;
/*!40000 ALTER TABLE `cartvendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartvendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_phonenumbers`
--

DROP TABLE IF EXISTS `company_phonenumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_phonenumbers` (
  `phone_number` int(11) unsigned NOT NULL,
  `company_email` varchar(45) NOT NULL,
  PRIMARY KEY (`phone_number`),
  KEY `FK0016` (`company_email`),
  CONSTRAINT `FK0016` FOREIGN KEY (`company_email`) REFERENCES `businesses` (`company_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_phonenumbers`
--

LOCK TABLES `company_phonenumbers` WRITE;
/*!40000 ALTER TABLE `company_phonenumbers` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_phonenumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_services`
--

DROP TABLE IF EXISTS `delivery_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_services` (
  `distance` int(4) unsigned NOT NULL,
  `fee` decimal(4,2) NOT NULL,
  `company_email` varchar(45) NOT NULL,
  `deliveryID` int(4) NOT NULL,
  PRIMARY KEY (`deliveryID`),
  KEY `FK0017` (`company_email`),
  CONSTRAINT `FK0017` FOREIGN KEY (`company_email`) REFERENCES `businesses` (`company_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_services`
--

LOCK TABLES `delivery_services` WRITE;
/*!40000 ALTER TABLE `delivery_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `fileID` int(8) unsigned NOT NULL,
  `file_name` varchar(45) NOT NULL,
  `folder` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  `file_type` int(2) unsigned NOT NULL,
  `requirement_type` int(2) unsigned NOT NULL,
  `date_submitted` date NOT NULL,
  `owner_email` varchar(45) NOT NULL,
  PRIMARY KEY (`fileID`),
  KEY `FK0005_idx` (`file_type`),
  KEY `FK0006_idx` (`requirement_type`),
  KEY `FK0007_idx` (`owner_email`),
  CONSTRAINT `FK0005` FOREIGN KEY (`file_type`) REFERENCES `ref_filetypes` (`file_type`),
  CONSTRAINT `FK0006` FOREIGN KEY (`requirement_type`) REFERENCES `ref_requirementtypes` (`requirement_type`),
  CONSTRAINT `FK0007` FOREIGN KEY (`owner_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `households`
--

DROP TABLE IF EXISTS `households`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `households` (
  `householdID` int(4) unsigned NOT NULL,
  `block_no` int(8) unsigned NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`householdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `households`
--

LOCK TABLES `households` WRITE;
/*!40000 ALTER TABLE `households` DISABLE KEYS */;
/*!40000 ALTER TABLE `households` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitations` (
  `accepted` enum('Y','N') NOT NULL,
  `join_date` date DEFAULT NULL,
  `resident_email` varchar(45) NOT NULL,
  `groupID` int(8) unsigned NOT NULL,
  PRIMARY KEY (`resident_email`,`groupID`),
  KEY `FK0010_idx` (`resident_email`),
  KEY `FK0011_idx` (`groupID`),
  CONSTRAINT `FK0010` FOREIGN KEY (`resident_email`) REFERENCES `residents` (`resident_email`),
  CONSTRAINT `FK0011` FOREIGN KEY (`groupID`) REFERENCES `residentgroups` (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `issueNo` int(4) unsigned NOT NULL,
  `issue_desc` varchar(100) NOT NULL,
  `issue_date` date NOT NULL,
  `manager_email` varchar(45) DEFAULT NULL,
  `staff_email` varchar(45) NOT NULL,
  PRIMARY KEY (`issueNo`),
  KEY `FK0020_idx` (`manager_email`),
  KEY `FK0021_idx` (`staff_email`),
  CONSTRAINT `FK0020` FOREIGN KEY (`manager_email`) REFERENCES `supplierusers` (`supplier_email`),
  CONSTRAINT `FK0021` FOREIGN KEY (`staff_email`) REFERENCES `supplierusers` (`supplier_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `orderID` int(8) unsigned NOT NULL,
  `quantity_ordered` int(3) unsigned NOT NULL,
  `price_each` decimal(6,2) unsigned NOT NULL,
  `product_quality` int(1) unsigned NOT NULL,
  `prodID` int(8) unsigned NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `Fk0047_idx` (`prodID`),
  CONSTRAINT `FK0046` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`),
  CONSTRAINT `Fk0047` FOREIGN KEY (`prodID`) REFERENCES `products` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderID` int(8) unsigned NOT NULL,
  `order_date` date NOT NULL,
  `payment_type` enum('P','D') NOT NULL,
  `status` enum('D','P','C') NOT NULL,
  `cancelled_by` enum('U','S') DEFAULT NULL,
  `cancel_date` date DEFAULT NULL,
  `cancel_reason` varchar(45) DEFAULT NULL,
  `location` varchar(45) NOT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `timeliness` int(1) unsigned DEFAULT NULL,
  `politeness` int(1) unsigned DEFAULT NULL,
  `cust_satisfaction` int(1) unsigned DEFAULT NULL,
  `total_rating` int(1) unsigned DEFAULT NULL,
  `supplier_email` varchar(45) NOT NULL,
  `resident_email` varchar(45) DEFAULT NULL,
  `resegroup_ID` int(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `FK0043_idx` (`resident_email`),
  KEY `FK0044_idx` (`supplier_email`),
  KEY `FK0045_idx` (`resegroup_ID`),
  CONSTRAINT `FK0043` FOREIGN KEY (`resident_email`) REFERENCES `residents` (`resident_email`),
  CONSTRAINT `FK0044` FOREIGN KEY (`supplier_email`) REFERENCES `supplierusers` (`supplier_email`),
  CONSTRAINT `FK0045` FOREIGN KEY (`resegroup_ID`) REFERENCES `residentgroups` (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2234,'1989-12-13','P','C',NULL,NULL,NULL,'Albuquerque',NULL,5,5,5,5,'amazon@gmail.com','halaman@dlsu.edu.ph',4473),(2235,'1989-12-13','P','C',NULL,NULL,NULL,'Albuquerque',NULL,5,5,5,5,'amazon@gmail.com','halaman@dlsu.edu.ph',4473),(2236,'1989-12-13','P','C','U','2000-12-13','Out of Stock','Albuquerque',NULL,5,5,5,5,'amazon@gmail.com','halaman@dlsu.edu.ph',4473),(2237,'1989-12-13','P','C','S','2000-12-22','Out of Stock','Albuquerque',NULL,5,5,5,4,'amazon@gmail.com','halaman@dlsu.edu.ph',4473),(2238,'2004-01-30','D','D',NULL,NULL,NULL,'Amazon',NULL,1,1,3,4,'ensaymada@dlsu.edu.ph','notNeil@gmail.com',4498),(2239,'2000-12-02','D','P',NULL,NULL,NULL,'Miami',NULL,3,3,4,2,'peter_smith@gmail.com','christmas_baby@gmail.com',NULL),(2240,'1989-12-13','D','D',NULL,NULL,NULL,'Jump Street','Never Ordering Again',2,3,1,2,'boomer@rocketmail.com','jennifer@gmail.com',9872),(2241,'1989-12-13','D','D',NULL,NULL,NULL,'Jump Street',NULL,2,3,1,2,'boomer@rocketmail.com','jennifer@gmail.com',9872);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parks`
--

DROP TABLE IF EXISTS `parks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parks` (
  `parkID` int(8) unsigned NOT NULL,
  `location` varchar(45) NOT NULL,
  `park_name` varchar(45) NOT NULL,
  `vendorID` int(8) unsigned NOT NULL,
  PRIMARY KEY (`parkID`),
  KEY `FK0036_idx` (`vendorID`),
  CONSTRAINT `FK0036` FOREIGN KEY (`vendorID`) REFERENCES `cartvendors` (`vendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parks`
--

LOCK TABLES `parks` WRITE;
/*!40000 ALTER TABLE `parks` DISABLE KEYS */;
/*!40000 ALTER TABLE `parks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `payment_no` int(8) unsigned NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `amount_paid` decimal(6,2) unsigned NOT NULL,
  `penalty` decimal(6,2) unsigned DEFAULT NULL,
  `orderID` int(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`payment_no`),
  KEY `FK0048_idx` (`orderID`),
  CONSTRAINT `FK0048` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES (2135,'2000-03-12','11:00:01',80.00,0.00,2240),(2136,'1989-10-01','12:12:12',240.00,0.00,2234);
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_pictures`
--

DROP TABLE IF EXISTS `product_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_pictures` (
  `fileID` int(8) unsigned NOT NULL,
  `filename` varchar(45) NOT NULL,
  `folder` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  `file_type` int(2) unsigned NOT NULL,
  `requirement` int(2) unsigned NOT NULL,
  `date_submitted` date NOT NULL,
  `productID` int(8) unsigned NOT NULL,
  PRIMARY KEY (`fileID`),
  KEY `Fk0042_idx` (`productID`),
  CONSTRAINT `Fk0042` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_pictures`
--

LOCK TABLES `product_pictures` WRITE;
/*!40000 ALTER TABLE `product_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productID` int(8) unsigned NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `price` decimal(6,2) unsigned NOT NULL,
  `quantity_in_stock` int(3) unsigned NOT NULL,
  `date_added` date NOT NULL,
  `date_uploaded` date NOT NULL,
  `businessID` int(8) unsigned NOT NULL,
  PRIMARY KEY (`productID`),
  KEY `FK0041_idx` (`businessID`),
  CONSTRAINT `FK0041` FOREIGN KEY (`businessID`) REFERENCES `businesses` (`businessID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_filetypes`
--

DROP TABLE IF EXISTS `ref_filetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_filetypes` (
  `file_type` int(2) unsigned NOT NULL,
  PRIMARY KEY (`file_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_filetypes`
--

LOCK TABLES `ref_filetypes` WRITE;
/*!40000 ALTER TABLE `ref_filetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_filetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_requirementtypes`
--

DROP TABLE IF EXISTS `ref_requirementtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_requirementtypes` (
  `requirement_type` int(2) unsigned NOT NULL,
  PRIMARY KEY (`requirement_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_requirementtypes`
--

LOCK TABLES `ref_requirementtypes` WRITE;
/*!40000 ALTER TABLE `ref_requirementtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_requirementtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residentgroups`
--

DROP TABLE IF EXISTS `residentgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `residentgroups` (
  `groupID` int(4) unsigned NOT NULL,
  `block` varchar(45) NOT NULL,
  `group_name` varchar(45) NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `rep_email` varchar(45) NOT NULL,
  PRIMARY KEY (`groupID`),
  KEY `FK0012_idx` (`rep_email`),
  CONSTRAINT `FK0012` FOREIGN KEY (`rep_email`) REFERENCES `residents` (`resident_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residentgroups`
--

LOCK TABLES `residentgroups` WRITE;
/*!40000 ALTER TABLE `residentgroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `residentgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residents`
--

DROP TABLE IF EXISTS `residents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `residents` (
  `resident_email` varchar(45) NOT NULL,
  `application_status` enum('A','P') NOT NULL COMMENT 'A = approved\nP = For approval',
  `user_email` varchar(45) NOT NULL,
  `householdID` int(4) unsigned NOT NULL,
  PRIMARY KEY (`resident_email`),
  KEY `FK0009_idx` (`user_email`),
  KEY `FK0014_idx` (`householdID`),
  CONSTRAINT `FK0009` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`),
  CONSTRAINT `FK0014` FOREIGN KEY (`householdID`) REFERENCES `households` (`householdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residents`
--

LOCK TABLES `residents` WRITE;
/*!40000 ALTER TABLE `residents` DISABLE KEYS */;
INSERT INTO `residents` VALUES ('christmas_baby@gmail.com','P','mandalorian@disney.com',3778),('halaman@dlsu.edu.ph','A','mandalorian@disney.com',7778),('jesus_christ@gmail.com','P','jerusalem@yahoo.com',7777);
/*!40000 ALTER TABLE `residents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `routeID` int(8) unsigned NOT NULL,
  `location` varchar(45) NOT NULL,
  `vendorID` int(8) unsigned NOT NULL,
  PRIMARY KEY (`routeID`),
  KEY `FK0036_idx` (`vendorID`),
  CONSTRAINT `FK00360` FOREIGN KEY (`vendorID`) REFERENCES `cartvendors` (`vendorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplierusers`
--

DROP TABLE IF EXISTS `supplierusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplierusers` (
  `supplier_email` varchar(45) NOT NULL,
  `blockNo` int(8) unsigned NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` int(11) unsigned NOT NULL,
  `position` enum('M','S') NOT NULL COMMENT 'M = Manager\nS = Staff',
  `active` enum('Y','N') NOT NULL,
  `hire_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `businessID` int(8) unsigned NOT NULL,
  PRIMARY KEY (`supplier_email`),
  KEY `FK0018_idx` (`businessID`),
  CONSTRAINT `FK0018` FOREIGN KEY (`businessID`) REFERENCES `businesses` (`businessID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplierusers`
--

LOCK TABLES `supplierusers` WRITE;
/*!40000 ALTER TABLE `supplierusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplierusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysadmins`
--

DROP TABLE IF EXISTS `sysadmins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysadmins` (
  `admin_email` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`admin_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysadmins`
--

LOCK TABLES `sysadmins` WRITE;
/*!40000 ALTER TABLE `sysadmins` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysadmins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysadminships`
--

DROP TABLE IF EXISTS `sysadminships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysadminships` (
  `admin_email` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  PRIMARY KEY (`admin_email`,`user_email`),
  KEY `FK0002_idx` (`user_email`),
  CONSTRAINT `FK00002` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`),
  CONSTRAINT `FK0003` FOREIGN KEY (`admin_email`) REFERENCES `sysadmins` (`admin_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysadminships`
--

LOCK TABLES `sysadminships` WRITE;
/*!40000 ALTER TABLE `sysadminships` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysadminships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(45) NOT NULL,
  `user_type` enum('O','R') NOT NULL COMMENT 'O = Officer / Staff\nR = Resident',
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `sex` enum('M','F') NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `birthday` date NOT NULL,
  `office_start_date` date DEFAULT NULL,
  `office_end_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workday_assignments`
--

DROP TABLE IF EXISTS `workday_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workday_assignments` (
  `supplier_email` varchar(45) NOT NULL,
  `assign_date` date NOT NULL,
  `dayID` int(1) unsigned NOT NULL,
  PRIMARY KEY (`supplier_email`,`dayID`),
  KEY `FK0029_idx` (`dayID`),
  CONSTRAINT `FK0028` FOREIGN KEY (`supplier_email`) REFERENCES `supplierusers` (`supplier_email`),
  CONSTRAINT `FK0029` FOREIGN KEY (`dayID`) REFERENCES `workdays` (`dayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workday_assignments`
--

LOCK TABLES `workday_assignments` WRITE;
/*!40000 ALTER TABLE `workday_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `workday_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workdays`
--

DROP TABLE IF EXISTS `workdays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workdays` (
  `work_days` enum('M','T','W','H','F','S','L') NOT NULL,
  `dayID` int(1) unsigned NOT NULL,
  PRIMARY KEY (`dayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workdays`
--

LOCK TABLES `workdays` WRITE;
/*!40000 ALTER TABLE `workdays` DISABLE KEYS */;
/*!40000 ALTER TABLE `workdays` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-12 11:21:39
