CREATE DATABASE  IF NOT EXISTS `villagebayanihan` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `villagebayanihan`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: villagebayanihan
-- ------------------------------------------------------
-- Server version	8.0.18

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
INSERT INTO `approvals` VALUES ('Y','','htarge1@tinyurl.com','cwallas2@wikia.com\r'),('Y','','htarge1@tinyurl.com','ksparry0@guardian.co.uk\r'),('Y','','ksparry0@guardian.co.uk','cbriant4@berkeley.edu\r'),('N','Stand-alone','ksparry0@guardian.co.uk','tsmithyman3@ovh.net\r');
/*!40000 ALTER TABLE `approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `businesses`
--

DROP TABLE IF EXISTS `businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `businesses` (
  `businessID` int(8) NOT NULL,
  `company_email` varchar(45) NOT NULL,
  `business_type` varchar(45) NOT NULL,
  `company_name` varchar(45) NOT NULL,
  `blockNo` int(8) DEFAULT NULL,
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
INSERT INTO `businesses` VALUES (427,'tlaurand8@nba.com','Restaurant','Zieme and Sons',9,'3 Welch Place','0 Mockingbird Crossing','10:00:00','20:00:00','N',1.09,'N','ndachs1@furl.net\r'),(1897,'bmuldowney0@sakura.ne.jp','Hardware','Jones, Thompson and Kris',1,'79 Prentice Plaza','','08:00:00','17:00:00','Y',0.00,'O','ajerrolt0@wunderground.com\r'),(2912,'llewsey4@over-blog.com','Cart','Labadie, Heaney and Jerde',5,'09705 Hoepker Place','','10:00:00','18:00:00','Y',0.00,'N','ndachs1@furl.net\r'),(5122,'astiggles3@narod.ru','Cart','Parker, Kuhlman and Mueller',4,'884 Ridgeview Avenue','','09:00:00','18:00:00','N',1.37,'O','ajerrolt0@wunderground.com\r'),(5439,'tpadrick1@blinklist.com','Gardening Supplies','Wunsch Group',2,'6 Pine View Hill','','08:00:00','17:00:00','N',3.76,'N','ndachs1@furl.net\r'),(5536,'hscoffins6@miibeian.gov.cn','Household Essentials','Sauer-Ortiz',7,'4 Manufacturers Parkway','','08:00:00','19:00:00','Y',0.00,'N','dhammell3@wordpress.org\r'),(5640,'mloud2@ibm.com','Convenience Store','Keebler-Ryan',3,'1 Crowley Way','6671 Parkside Alley','08:00:00','16:00:00','N',3.65,'O','dhammell3@wordpress.org\r'),(6436,'nharpur5@about.me','Cart','Romaguera Group',6,'4 Magdeline Junction','','09:00:00','20:00:00','Y',0.00,'O','dcreese2@hp.com\r'),(7954,'boakeshott7@plala.or.jp','Gardening Supplies','Grant, Grimes and Schumm',8,'9 Scott Alley','7221 Graedel Way','10:00:00','18:00:00','Y',0.00,'O','elobb4@phpbb.com\r'),(8107,'ygarrood9@cloudflare.com','Hardware','Fisher Group',10,'09030 Chinook Center','25 Dayton Lane','07:00:00','17:00:00','Y',0.00,'O','dhammell3@wordpress.org\r');
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
  `vendorID` int(8) NOT NULL,
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
INSERT INTO `cart_passed_days` VALUES ('1990-02-08',302),('2000-12-06',302),('2002-09-10',302),('2003-04-01',302),('2006-06-29',302),('2013-06-06',302),('2014-12-12',302),('2016-07-22',302),('1994-08-15',1523),('2016-06-29',1523),('2019-01-10',1523),('1993-12-10',1601),('2003-02-26',1601),('2003-03-26',1601),('2006-04-25',1601),('2007-07-24',1601),('2017-11-12',1601),('1991-07-23',1640),('1996-10-13',1640),('1997-06-10',1640),('1998-11-05',1640),('2003-06-02',1640),('2010-08-15',1640),('2012-06-02',1640),('2012-07-11',1640),('2014-04-30',1640),('2016-09-16',1640),('2016-12-08',1640),('1990-07-30',2333),('1998-07-02',2333),('2001-03-11',2333),('2001-12-14',2333),('2007-01-18',2333),('2018-01-31',2333),('2018-02-14',2333),('1994-01-20',2457),('1994-05-31',2457),('1996-06-28',2457),('1997-05-05',2457),('1998-02-08',2457),('1999-02-19',2457),('2006-12-27',2457),('2012-09-20',2457),('2014-07-09',2457),('1992-06-08',2754),('1999-01-18',2754),('1999-11-10',2754),('2003-05-19',2754),('2004-02-15',2754),('2004-11-16',2754),('2006-02-16',2754),('2008-04-21',2754),('2012-01-22',2754),('2014-05-08',2754),('2015-04-04',2754),('2015-10-02',2754),('2016-04-18',2754),('2017-01-15',2754),('2018-04-23',2754),('2018-06-02',2754),('1991-04-06',2989),('1993-03-17',2989),('1995-05-10',2989),('1996-12-23',2989),('2003-04-12',2989),('2003-11-16',2989),('2008-01-21',2989),('2010-06-25',2989),('2011-11-15',2989),('2013-10-12',2989),('2015-04-28',2989),('2017-03-03',2989),('1998-03-16',3429),('1999-10-20',3429),('2001-04-27',3429),('2003-04-18',3429),('2005-10-09',3429),('2014-01-03',3429),('1990-11-21',4670),('1992-05-15',4670),('1994-06-11',4670),('1995-03-10',4670),('1995-05-06',4670),('1999-04-22',4670),('2001-08-17',4670),('2002-10-18',4670),('2003-07-11',4670),('2006-03-04',4670),('2007-08-29',4670),('2009-02-15',4670),('2014-03-30',4670),('2017-02-08',4670),('2007-05-10',5332),('2012-11-26',5332),('2018-08-08',5332),('1991-01-26',6011),('1994-12-11',6011),('1995-03-07',6011),('1996-02-03',6011),('2001-03-19',6011),('2001-10-05',6011),('2004-11-01',6011),('2011-04-07',6011),('2013-10-28',6011),('2013-11-22',6011),('2015-12-09',6011),('2019-10-08',6011),('1990-09-30',6429),('1999-09-30',6429),('2001-04-03',6429),('2006-03-12',6429),('2006-04-26',6429),('2007-04-16',6429),('2009-02-14',6429),('2013-07-02',6429),('1992-07-02',7085),('1999-06-04',7085),('1999-09-09',7085),('2000-06-04',7085),('2007-01-21',7085),('2015-08-06',7085),('2019-04-08',7085),('2019-05-15',7085),('1990-07-15',7655),('1996-09-10',7655),('1991-09-20',7698),('1994-07-15',7698),('1997-03-10',7698),('2007-07-26',7698),('2010-03-01',7698),('2011-06-10',7698),('2014-12-25',7698),('2016-01-02',7698),('2016-06-09',7698),('2016-06-21',7698),('2019-11-22',7698),('1990-01-10',8514),('1993-12-18',8514),('1994-05-25',8514),('1996-10-18',8514),('2000-05-13',8514),('2001-11-11',8514),('2002-10-04',8514),('2004-09-17',8514),('2010-01-01',8514),('2012-02-03',8514),('2012-07-17',8514),('2014-05-01',8514),('2014-07-22',8514),('2016-02-22',8514),('2017-12-11',8514),('1990-07-18',8922),('1999-10-03',8922),('2003-04-02',8922),('2007-06-09',8922),('2008-10-24',8922),('2015-11-21',8922),('1998-11-17',9027),('2004-11-10',9027),('2016-05-27',9027);
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
  `vendorID` int(8) NOT NULL,
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
INSERT INTO `cart_passed_times` VALUES ('02:37:00',176),('05:42:00',176),('19:29:00',176),('23:53:00',176),('08:08:00',959),('11:51:00',959),('14:55:00',959),('21:28:00',959),('03:33:00',1526),('03:53:00',1526),('05:04:00',1526),('12:48:00',1526),('14:37:00',1526),('19:24:00',1526),('05:18:00',1687),('09:39:00',1687),('18:20:00',1687),('10:19:00',2478),('06:48:00',2499),('20:17:00',2499),('13:26:00',2565),('19:10:00',2565),('19:45:00',2565),('20:05:00',2565),('03:24:00',2806),('05:14:00',2806),('09:13:00',2806),('12:11:00',2806),('13:25:00',2806),('17:24:00',2806),('22:51:00',2806),('02:56:00',2953),('06:23:00',2953),('08:07:00',2953),('15:15:00',2953),('17:39:00',2953),('07:35:00',3275),('08:16:00',3275),('08:25:00',3275),('12:04:00',3275),('12:21:00',3275),('12:37:00',3275),('15:17:00',3275),('02:51:00',3508),('04:20:00',3508),('13:10:00',3508),('19:19:00',3508),('05:30:00',3563),('08:18:00',3563),('17:18:00',3563),('18:25:00',3578),('22:50:00',3578),('00:59:00',3640),('04:32:00',3640),('08:11:00',3640),('09:25:00',3640),('10:55:00',3640),('02:09:00',3974),('14:16:00',3974),('17:43:00',3974),('20:42:00',3974),('21:02:00',3974),('21:42:00',3974),('00:54:00',4031),('06:31:00',4031),('12:22:00',4031),('14:27:00',4031),('05:51:00',4639),('06:21:00',4639),('09:01:00',4639),('12:34:00',4639),('18:43:00',4639),('23:10:00',4639),('23:18:00',4639),('05:47:00',5179),('11:23:00',5179),('19:32:00',5179),('04:40:00',5318),('10:18:00',5318),('20:53:00',5318),('22:56:00',5318),('07:29:00',5322),('13:35:00',5322),('13:42:00',5322),('15:36:00',5322),('18:26:00',5322),('23:23:00',5322),('07:14:00',5389),('09:04:00',5389),('14:05:00',5389),('17:19:00',5389),('21:24:00',5389),('02:36:00',5983),('17:00:00',5983),('17:07:00',5983),('18:13:00',5983),('22:33:00',5983),('23:38:00',5983),('23:40:00',5983),('01:15:00',6125),('18:33:00',6125),('22:46:00',6125),('04:28:00',6244),('13:41:00',6244),('15:58:00',6244),('20:22:00',6244),('00:45:00',6307),('18:45:00',6307),('23:05:00',6307),('04:36:00',7056),('11:18:00',7056),('11:52:00',7056),('13:50:00',7056),('10:34:00',7130),('15:18:00',7130),('18:08:00',7130),('20:38:00',7130),('01:31:00',7238),('02:21:00',7238),('18:15:00',7238),('18:49:00',7238),('04:52:00',7260),('12:14:00',7260),('22:01:00',7260),('16:35:00',7295),('09:00:00',7631),('09:36:00',7631),('08:19:00',8359),('13:44:00',8359),('05:40:00',8539),('06:24:00',8539),('06:58:00',8539),('17:02:00',8539),('17:15:00',8539),('03:04:00',9289),('04:11:00',9289),('04:51:00',9289),('22:00:00',9289),('22:55:00',9289),('04:33:00',9492),('17:52:00',9492),('07:57:00',9546),('20:43:00',9546),('20:49:00',9546),('05:27:00',9646),('05:49:00',9646),('16:46:00',9646),('07:45:00',9684),('08:14:00',9684),('09:14:00',9684),('16:10:00',9684),('19:34:00',9684),('21:43:00',9684),('07:18:00',9836),('08:41:00',9836),('11:07:00',9836),('13:19:00',9836),('19:36:00',9836),('00:17:00',9852),('15:50:00',9852);
/*!40000 ALTER TABLE `cart_passed_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartvendors`
--

DROP TABLE IF EXISTS `cartvendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartvendors` (
  `vendorID` int(8) NOT NULL,
  `businessID` int(8) NOT NULL,
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
INSERT INTO `cartvendors` VALUES (302,2912),(1523,2912),(1640,2912),(2333,2912),(6429,2912),(7085,2912),(7655,2912),(9027,2912),(1601,5122),(2754,5122),(2989,5122),(4670,5122),(6011,5122),(8514,5122),(8922,5122),(195,6436),(2457,6436),(3429,6436),(5332,6436),(7698,6436);
/*!40000 ALTER TABLE `cartvendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_phonenumbers`
--

DROP TABLE IF EXISTS `company_phonenumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_phonenumbers` (
  `phone_number` int(11) NOT NULL,
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
INSERT INTO `company_phonenumbers` VALUES (764862672,'astiggles3@narod.ru\r'),(771573445,'astiggles3@narod.ru\r'),(424644540,'bmuldowney0@sakura.ne.jp\r'),(485840650,'bmuldowney0@sakura.ne.jp\r'),(169985364,'boakeshott7@plala.or.jp\r'),(599577259,'boakeshott7@plala.or.jp\r'),(197864994,'hscoffins6@miibeian.gov.cn\r'),(766999952,'hscoffins6@miibeian.gov.cn\r'),(357106975,'llewsey4@over-blog.com\r'),(636974400,'llewsey4@over-blog.com\r'),(376533515,'mloud2@ibm.com\r'),(796736754,'mloud2@ibm.com\r'),(440716364,'nharpur5@about.me\r'),(824547163,'nharpur5@about.me\r'),(362918093,'tlaurand8@nba.com\r'),(786417398,'tlaurand8@nba.com\r'),(358345858,'tpadrick1@blinklist.com\r'),(547568307,'tpadrick1@blinklist.com\r'),(610355029,'ygarrood9@cloudflare.com\r'),(984424351,'ygarrood9@cloudflare.com\r');
/*!40000 ALTER TABLE `company_phonenumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_services`
--

DROP TABLE IF EXISTS `delivery_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_services` (
  `distance` int(4) NOT NULL,
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
INSERT INTO `delivery_services` VALUES (9899,74.34,'llewsey4@over-blog.com',805),(9544,23.11,'bmuldowney0@sakura.ne.jp',851),(6939,33.44,'tlaurand8@nba.com',1738),(1204,43.25,'ygarrood9@cloudflare.com',2172),(7999,51.23,'nharpur5@about.me',2315),(6581,63.22,'tpadrick1@blinklist.com',2593),(5228,40.45,'mloud2@ibm.com',3114),(4577,54.23,'astiggles3@narod.ru',3917),(9524,56.12,'hscoffins6@miibeian.gov.cn',3973),(2424,26.23,'tpadrick1@blinklist.com',4476),(2246,23.44,'astiggles3@narod.ru',4677),(3156,50.00,'boakeshott7@plala.or.jp',4857),(8820,23.43,'nharpur5@about.me',5442),(4122,23.46,'tpadrick1@blinklist.com',5715),(6034,23.12,'astiggles3@narod.ru',5960),(3538,25.33,'bmuldowney0@sakura.ne.jp',6003),(7817,17.34,'hscoffins6@miibeian.gov.cn',7298),(5201,20.25,'nharpur5@about.me',8255),(2584,77.33,'nharpur5@about.me',9539),(9283,30.35,'tlaurand8@nba.com',9606);
/*!40000 ALTER TABLE `delivery_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `fileID` int(8) NOT NULL,
  `file_name` varchar(45) NOT NULL,
  `folder` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  `file_type` int(2) NOT NULL,
  `requirement_type` int(2) NOT NULL,
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
INSERT INTO `files` VALUES (88,'ggrigorushkin1','oiannelli1','java.com',22,12,'2014-05-29','ksparry0@guardian.co.uk\r'),(671,'cpeepallm','eolivam','psu.edu',22,17,'2015-06-09','cbriant4@berkeley.edu\r'),(1144,'mmonnoyer3','mmcturley3','google.de',22,17,'2003-06-16','cwallas2@wikia.com\r'),(1870,'lthatcherh','ekohterh','goo.gl',91,17,'2008-09-06','cbriant4@berkeley.edu\r'),(2915,'hbrodeur5','rfryd5','quantcast.com',2,5,'1997-03-30','htarge1@tinyurl.com\r'),(2952,'mtixall8','lschieferstein8','linkedin.com',3,17,'1992-02-10','ksparry0@guardian.co.uk\r'),(3226,'mpridgeon6','teverwin6','delicious.com',91,39,'2013-03-12','cbriant4@berkeley.edu\r'),(3462,'mrothonr','pcudworthr','squarespace.com',95,5,'2016-12-26','htarge1@tinyurl.com\r'),(3539,'lgrestel','ssedgemanl','examiner.com',3,14,'2011-12-10','cwallas2@wikia.com\r'),(4269,'eguilloton0','jmaccauley0','chronoengine.com',91,14,'2011-01-16','ksparry0@guardian.co.uk\r'),(5118,'nwhittakert','rkingabyt','buzzfeed.com',91,39,'2015-07-08','cwallas2@wikia.com\r'),(5900,'ngobelld','abodegad','google.co.jp',2,39,'1993-01-23','cwallas2@wikia.com\r'),(6023,'dmcinnesn','rgoughn','jugem.jp',3,39,'2009-06-08','htarge1@tinyurl.com\r'),(6143,'ogeddise','rmurise','nbcnews.com',95,12,'2013-10-18','ksparry0@guardian.co.uk\r'),(6161,'lstuehmeiero','jmclareno','yandex.ru',95,12,'2007-05-09','htarge1@tinyurl.com\r'),(6638,'lmaffeip','jdreghornp','amazon.co.jp',22,14,'2017-12-13','cbriant4@berkeley.edu\r'),(6741,'dpovalla','cwacklya','disqus.com',91,12,'2012-10-23','htarge1@tinyurl.com\r'),(6901,'mbaudinelliq','dreedq','pbs.org',91,5,'2008-08-16','htarge1@tinyurl.com\r'),(7308,'dwiltshaw4','ljobbings4','mapy.cz',22,5,'1997-02-13','cbriant4@berkeley.edu\r'),(7821,'dlorrowayi','smaclaigi','blogs.com',91,39,'1997-08-17','ksparry0@guardian.co.uk\r'),(8183,'zincej','hharbottlej','issuu.com',3,39,'1998-01-20','ksparry0@guardian.co.uk\r'),(8261,'ostruysf','jbrabynf','jigsy.com',2,12,'1997-01-15','cwallas2@wikia.com\r'),(8762,'mcornickb','cdessaurb','baidu.com',2,12,'2000-07-13','cwallas2@wikia.com\r'),(8796,'epoolton9','slitzmann9','spiegel.de',91,5,'2013-04-24','cwallas2@wikia.com\r'),(8954,'rcolquitts','jheddans','npr.org',91,12,'2011-10-22','tsmithyman3@ovh.net\r'),(9686,'tattrydek','nhaglingtonk','nymag.com',91,5,'2005-09-16','htarge1@tinyurl.com\r'),(9762,'mcraddy7','jbessett7','sciencedaily.com',22,17,'2008-01-18','cwallas2@wikia.com\r'),(9786,'emaria2','jstribbling2','washington.edu',95,5,'2002-05-08','tsmithyman3@ovh.net\r'),(9840,'cpuntonc','mpolakc','huffingtonpost.com',22,39,'1995-09-04','cwallas2@wikia.com\r'),(9954,'cgalletyg','bguyeg','cnn.com',95,5,'2007-08-16','tsmithyman3@ovh.net\r');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `households`
--

DROP TABLE IF EXISTS `households`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `households` (
  `householdID` int(4) NOT NULL,
  `block_no` int(8) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`householdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `households`
--

LOCK TABLES `households` WRITE;
/*!40000 ALTER TABLE `households` DISABLE KEYS */;
INSERT INTO `households` VALUES (1954,36,'Quincy'),(2649,200,'Service'),(6193,1043,'Comanche'),(8633,5206,'Farragut'),(8986,4,'Packers');
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
  `groupID` int(8) NOT NULL,
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
INSERT INTO `invitations` VALUES ('N',NULL,'bvelti4@wunderground.com',2411),('Y','2002-10-04','emelby8@wired.com',2411),('Y','2004-04-19','ethorowgood7@ox.ac.uk',9470),('Y','1996-03-26','hhasney1@opensource.org',9622),('Y','1995-08-18','pclemencon0@ezinearticles.com',2544),('N',NULL,'rteape2@digg.com',9797),('Y','2019-09-04','sbrookfield3@weibo.com',8771),('N',NULL,'sburd9@spiegel.de',8771),('Y','1994-08-16','zstrong6@macromedia.com',7521);
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `issueNo` int(4) NOT NULL,
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
INSERT INTO `issues` VALUES (330,'Molorbis','1993-02-11','jsapsforde8@uol.com.br','mparade9@github.io\r'),(435,'Annoying','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(896,'Weird','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(987,'Incompetent','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(1047,'Incompetent','2009-03-01','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(1079,'Weird','2009-02-15','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(1405,'Difficult','1999-01-12','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(1500,'Difficult','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(1863,'Mauris','1996-04-12','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(1874,'Lazy','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(2056,'Incompetent','1993-02-11','jsapsforde8@uol.com.br','mparade9@github.io\r'),(2099,'Unfriendly','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(2355,'Lazy','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(2506,'Annoying','2009-02-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(2563,'Unfriendly','1999-01-12','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(2604,'Praesent','1996-04-12','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(2668,'Weird','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(2678,'Quisque','2009-03-01','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(3078,'Blandit','1996-04-12','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(3084,'Praecantus','1993-02-11','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(3101,'Slow','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(3338,'Slow','1993-02-11','jsapsforde8@uol.com.br','mparade9@github.io\r'),(3676,'Annoying','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(3715,'Cultura','2009-03-01','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(3734,'Vestibulum','1996-04-12','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(3879,'Lazy','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(3880,'Annoying','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(4063,'Difficult','2009-03-01','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(4096,'Religio','2009-02-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(4291,'Blandit','2009-03-01','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(4394,'Difficult','2009-02-15','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(4482,'Difficult','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(4748,'Cultura','1996-04-12','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(5012,'Slow','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(5016,'Morbi','2009-02-25','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(5025,'Unfriendly','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(5247,'Weird','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(5288,'Religio','2009-03-01','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(5475,'Praesent','1993-02-11','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(5536,'Annoying','2009-03-01','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(5652,'Lazy','2009-02-15','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(5703,'Unfriendly','1999-01-12','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(5904,'Weird','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(5942,'Cultura','1999-01-12','jsapsforde8@uol.com.br','mparade9@github.io\r'),(5976,'Mores','1999-01-12','jsapsforde8@uol.com.br','mparade9@github.io\r'),(5992,'Quisque','1999-01-12','jsapsforde8@uol.com.br','mparade9@github.io\r'),(6099,'Quisque','2009-02-25','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(6146,'Mauris','1993-02-11','jsapsforde8@uol.com.br','mparade9@github.io\r'),(6186,'Incompetent','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(6267,'Molorbis','2009-03-01','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(6418,'Mores','2009-03-01','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(6509,'Molorbis','2009-02-25','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(6565,'Mauris','1993-02-11','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(6695,'Praesent','1993-02-11','jsapsforde8@uol.com.br','mparade9@github.io\r'),(6744,'Slow','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(6897,'Blandit','1999-01-12','jsapsforde8@uol.com.br','mparade9@github.io\r'),(7172,'Religio','2009-02-19','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(7173,'Vestibulum','1993-02-11','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(7252,'Vestibulum','1999-01-12','jsapsforde8@uol.com.br','mparade9@github.io\r'),(7542,'Praecantus','1999-01-12','jsapsforde8@uol.com.br','mparade9@github.io\r'),(7627,'Annoying','2009-02-19','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(7670,'Difficult','2009-02-15','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(7736,'Lazy','1999-01-12','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(7862,'Unfriendly','1993-02-11','jsapsforde8@uol.com.br','mparade9@github.io\r'),(7923,'Lazy','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(7989,'Incompetent','1993-02-11','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(8527,'Morbi','1993-02-11','jsapsforde8@uol.com.br','mparade9@github.io\r'),(8716,'Difficult','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(8871,'Weird','2019-12-01','jjemmison5@ebay.com','rdoolerg@alibaba.com\r'),(8907,'Slow','2009-02-19','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(9021,'Lazy','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(9139,'Slow','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(9373,'Mores','2009-02-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(9374,'Slow','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(9406,'Unfriendly','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(9604,'Unfriendly','2009-03-01','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(9631,'Morbi','1993-02-11','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(9822,'Weird','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r'),(9942,'Praecantus','1996-04-12','jsapsforde8@uol.com.br','loxby2@springer.com\r'),(9994,'Incompetent','2008-08-25','tgratrix0@cdc.gov','tridgewella@google.com.au\r');
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `orderID` int(8) NOT NULL,
  `quantity_ordered` int(3) NOT NULL,
  `price_each` decimal(6,2) NOT NULL,
  `product_quality` int(1) NOT NULL,
  `prodID` int(8) NOT NULL,
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
INSERT INTO `order_details` VALUES (262,483,182.25,3,1645),(324,1,371.72,5,5331),(360,910,855.04,4,9340),(373,1,947.72,5,3315),(467,365,463.27,1,1990),(543,186,487.96,1,8919),(567,178,487.96,1,8919),(922,8,2457.65,5,6677),(1079,98,113.43,1,4172),(1103,147,487.96,1,8919),(1209,663,1378.55,5,3337),(1300,263,1257.99,3,6303),(1315,217,629.55,3,6053),(1324,478,463.27,1,1990),(1343,204,629.55,4,6053),(1463,203,629.55,2,6053),(1613,8,371.72,2,5331),(1673,91,6561.60,4,9845),(1674,636,1378.55,1,3337),(1726,122,463.27,2,1990),(1727,6,371.72,1,5331),(1750,175,2237.13,5,5777),(2037,30,497.93,4,6771),(2051,235,592.84,4,4329),(2200,366,1257.99,3,6303),(2206,396,113.43,2,4172),(2307,518,463.27,4,1990),(2379,331,252.28,5,8876),(2391,278,465.29,2,6119),(2425,579,497.93,5,6771),(2442,546,855.04,1,9340),(2474,7,947.72,1,3315),(2668,123,629.55,3,6053),(2736,370,946.94,1,8339),(2745,73,629.55,1,6053),(2796,7,487.96,4,8919),(2946,5,371.72,2,5331),(2984,268,1378.55,4,3337),(3134,615,863.99,3,7970),(3207,205,629.55,3,6053),(3214,329,863.99,1,7970),(3608,419,1257.99,2,6303),(3760,26,1257.99,3,6303),(3837,322,182.25,3,1645),(3862,5,371.72,3,5331),(4217,48,487.96,1,8919),(4370,179,463.27,3,1990),(4490,287,2457.65,4,6677),(4567,4,947.72,1,3315),(4714,640,497.93,3,6771),(4772,191,863.99,3,7970),(4978,259,465.29,2,6119),(5043,5,371.72,5,5331),(5109,35,6561.60,4,9845),(5190,12,371.72,4,5331),(5474,54,2457.65,1,6677),(5586,142,979.96,2,853),(5639,847,946.94,4,8339),(5845,81,979.96,1,853),(5914,8,947.72,3,3315),(5986,350,465.29,2,6119),(5992,37,6561.60,5,9845),(6003,25,592.84,1,4329),(6123,242,592.84,5,4329),(6191,1,947.72,5,3315),(6317,255,182.25,1,1645),(6338,1,371.72,5,5331),(6393,853,855.04,2,9340),(6574,294,252.28,1,8876),(6697,546,863.99,2,7970),(6750,12,371.72,5,5331),(6767,600,252.28,1,8876),(6775,601,1378.55,2,3337),(6848,6,947.72,1,3315),(6870,3,629.55,4,6053),(6874,255,463.27,1,1990),(6947,442,855.04,3,9340),(7115,32,6561.60,4,9845),(7437,59,979.96,4,853),(7470,4,371.72,4,5331),(7776,68,629.55,1,6053),(7779,61,979.96,1,853),(8006,55,497.93,2,6771),(8275,111,6561.60,4,9845),(8296,621,946.94,4,8339),(8465,122,487.96,5,8919),(8481,176,252.28,4,8876),(8628,312,2457.65,4,6677),(8642,183,487.96,2,8919),(8730,349,2457.65,4,6677),(8821,12,487.96,4,8919),(8882,537,463.27,5,1990),(8919,160,465.29,2,6119),(9033,107,463.27,3,1990),(9221,36,946.94,2,8339),(9244,340,113.43,1,4172),(9253,486,855.04,2,9340),(9597,129,6561.60,5,9845),(9615,11,371.72,2,5331),(9837,274,2237.13,3,5777);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderID` int(8) NOT NULL,
  `order_date` date NOT NULL,
  `payment_type` enum('P','D') NOT NULL,
  `status` enum('D','P','C') NOT NULL,
  `cancelled_by` enum('U','S') DEFAULT NULL,
  `cancel_date` date DEFAULT NULL,
  `cancel_reason` varchar(45) DEFAULT NULL,
  `location` varchar(45) NOT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `timeliness` int(1) DEFAULT NULL,
  `politeness` int(1) DEFAULT NULL,
  `cust_satisfaction` int(1) DEFAULT NULL,
  `total_rating` int(1) DEFAULT NULL,
  `supplier_email` varchar(45) NOT NULL,
  `resident_email` varchar(45) DEFAULT NULL,
  `resegroup_ID` int(8) DEFAULT NULL,
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
INSERT INTO `orders` VALUES (262,'2006-02-06','D','P',NULL,NULL,NULL,'Starling',NULL,NULL,NULL,NULL,NULL,'mreeme1@nydailynews.com','sbrookfield3@weibo.com',4998),(324,'2019-10-07','P','P',NULL,NULL,NULL,'Victoria',NULL,NULL,NULL,NULL,NULL,'rdoolerg@alibaba.com','hhasney1@opensource.org',9470),(360,'2005-02-23','D','C','S','2005-03-05','fresh-thinking','Coleman',NULL,NULL,NULL,NULL,NULL,'jjemmison5@ebay.com','pclemencon0@ezinearticles.com',8308),(373,'2005-09-22','P','C','S','2005-09-27','Function-based','Mandrake',NULL,NULL,NULL,NULL,NULL,'mparade9@github.io','bvelti4@wunderground.com',2489),(467,'2019-06-16','P','C','S','2019-06-20','parallelism','Goodland',NULL,NULL,NULL,NULL,NULL,'hsterrei@51.la','bpalatino5@un.org',9797),(543,'1997-04-03','P','C','U','1997-04-04','Focused','Bay',NULL,NULL,NULL,NULL,NULL,'jsapsforde8@uol.com.br','sburd9@spiegel.de',4998),(567,'2009-08-20','P','D',NULL,NULL,NULL,'Duke','moderator',4,2,1,2,'rmccorryd@miibeian.gov.cn','hhasney1@opensource.org',7521),(922,'1991-02-10','D','C','U','1991-02-16','multi-tasking','Calypso',NULL,NULL,NULL,NULL,NULL,'mjosupeitf@go.com','bvelti4@wunderground.com',4998),(1079,'2004-04-07','D','D',NULL,NULL,NULL,'Elgar','Enhanced',1,4,3,2,'imartinsc@exblog.jp','rteape2@digg.com',9575),(1103,'1996-01-26','D','C','S','1996-01-29','Universal','Leroy',NULL,NULL,NULL,NULL,NULL,'tgratrix0@cdc.gov','bvelti4@wunderground.com',2577),(1209,'2012-08-09','D','C','S','2012-08-16','non-volatile','Pierstorff',NULL,NULL,NULL,NULL,NULL,'imartinsc@exblog.jp','zstrong6@macromedia.com',2181),(1300,'2010-11-24','P','P',NULL,NULL,NULL,'Washington',NULL,NULL,NULL,NULL,NULL,'hsterrei@51.la','pclemencon0@ezinearticles.com',2577),(1315,'2011-09-08','D','D',NULL,NULL,NULL,'Garrison','task-force',4,5,5,4,'loxby2@springer.com','hhasney1@opensource.org',9470),(1324,'1994-06-16','P','C','S','1994-06-19','Synergistic','Weeping Birch',NULL,NULL,NULL,NULL,NULL,'adorken3@purevolume.com','rteape2@digg.com',1093),(1343,'2001-06-11','D','C','S','2001-06-17','function','Oak',NULL,NULL,NULL,NULL,NULL,'hsterrei@51.la','bpalatino5@un.org',2181),(1463,'2019-08-20','P','P',NULL,NULL,NULL,'Nova',NULL,NULL,NULL,NULL,NULL,'lkennicottb@furl.net','bvelti4@wunderground.com',2757),(1613,'2005-01-05','D','C','U','2005-01-14','firmware','Myrtle',NULL,NULL,NULL,NULL,NULL,'lduddanh@unesco.org','emelby8@wired.com',2489),(1673,'2016-02-12','D','D',NULL,NULL,NULL,'Parkside','array',2,2,4,2,'acockram4@mapy.cz','emelby8@wired.com',2577),(1674,'2000-09-13','P','C','U','2000-09-22','utilisation','Atwood',NULL,NULL,NULL,NULL,NULL,'htamblingson6@blogtalkradio.com','emelby8@wired.com',8308),(1726,'2001-09-24','D','D',NULL,NULL,NULL,'Myrtle','leverage',3,1,2,2,'sleleuj@pen.io','pclemencon0@ezinearticles.com',2544),(1727,'2001-12-14','D','P',NULL,NULL,NULL,'Waywood',NULL,NULL,NULL,NULL,NULL,'tridgewella@google.com.au','ethorowgood7@ox.ac.uk',609),(1750,'2019-01-29','P','C','U','2019-02-03','conglomeration','Vidon',NULL,NULL,NULL,NULL,NULL,'lduddanh@unesco.org','pclemencon0@ezinearticles.com',4998),(2037,'2015-01-19','P','D',NULL,NULL,NULL,'Sutteridge','disintermediate',5,4,3,4,'pkleinfelde@usnews.com','ethorowgood7@ox.ac.uk',9386),(2051,'1996-02-06','P','D',NULL,NULL,NULL,'Hovde','Quality-focused',2,4,3,3,'imartinsc@exblog.jp','sburd9@spiegel.de',5099),(2200,'1995-07-09','P','D',NULL,NULL,NULL,'Anthes','tangible',3,5,5,4,'imartinsc@exblog.jp','emelby8@wired.com',1093),(2206,'2002-11-06','D','C','U','2002-11-13','toolset','Colorado',NULL,NULL,NULL,NULL,NULL,'adorken3@purevolume.com','ethorowgood7@ox.ac.uk',5099),(2307,'2014-11-10','D','D',NULL,NULL,NULL,'Burning Wood','Decentralized',2,2,4,2,'lkennicottb@furl.net','rteape2@digg.com',9575),(2379,'1999-12-17','D','D',NULL,NULL,NULL,'Starling','analyzing',2,1,4,2,'mreeme1@nydailynews.com','pclemencon0@ezinearticles.com',7223),(2391,'2013-07-20','P','P',NULL,NULL,NULL,'Russell',NULL,NULL,NULL,NULL,NULL,'lscatchard7@bigcartel.com','ethorowgood7@ox.ac.uk',609),(2425,'1995-03-10','D','C','S','1995-03-18','capability','Prentice',NULL,NULL,NULL,NULL,NULL,'jsapsforde8@uol.com.br','rteape2@digg.com',9622),(2442,'2017-06-06','P','C','U','2017-06-13','demand-driven','Vermont',NULL,NULL,NULL,NULL,NULL,'tgratrix0@cdc.gov','bvelti4@wunderground.com',9386),(2474,'2003-05-24','D','D',NULL,NULL,NULL,'Kingsford','Customer-focused',5,3,3,3,'htamblingson6@blogtalkradio.com','pclemencon0@ezinearticles.com',9575),(2668,'1993-05-02','P','P',NULL,NULL,NULL,'Farmco',NULL,NULL,NULL,NULL,NULL,'tridgewella@google.com.au','bvelti4@wunderground.com',2411),(2736,'1997-01-05','D','P',NULL,NULL,NULL,'Clemons',NULL,NULL,NULL,NULL,NULL,'rmccorryd@miibeian.gov.cn','zstrong6@macromedia.com',5099),(2745,'2002-09-04','D','C','S','2002-09-06','user-facing','Ronald Regan',NULL,NULL,NULL,NULL,NULL,'mparade9@github.io','ethorowgood7@ox.ac.uk',4998),(2796,'2009-11-27','P','D',NULL,NULL,NULL,'Hoffman','Team-oriented',2,5,5,4,'rmccorryd@miibeian.gov.cn','emelby8@wired.com',2577),(2946,'2009-09-28','D','C','S','2009-09-30','superstructure','Crownhardt',NULL,NULL,NULL,NULL,NULL,'mjosupeitf@go.com','emelby8@wired.com',9797),(2984,'2002-10-14','D','D',NULL,NULL,NULL,'Muir','responsive',5,1,2,2,'pkleinfelde@usnews.com','emelby8@wired.com',7521),(3134,'1990-06-28','D','D',NULL,NULL,NULL,'Bayside','Public-key',1,4,2,2,'mjosupeitf@go.com','ethorowgood7@ox.ac.uk',9470),(3207,'2000-01-27','P','C','U','2000-01-30','encompassing','Utah',NULL,NULL,NULL,NULL,NULL,'tgratrix0@cdc.gov','sburd9@spiegel.de',2181),(3214,'1996-10-17','D','P',NULL,NULL,NULL,'Hauk',NULL,NULL,NULL,NULL,NULL,'jjemmison5@ebay.com','ethorowgood7@ox.ac.uk',5099),(3608,'2011-04-22','P','P',NULL,NULL,NULL,'New Castle',NULL,NULL,NULL,NULL,NULL,'tgratrix0@cdc.gov','bpalatino5@un.org',9797),(3760,'1998-09-17','D','C','U','1998-09-18','zero tolerance','Lukken',NULL,NULL,NULL,NULL,NULL,'mreeme1@nydailynews.com','bvelti4@wunderground.com',9386),(3837,'1999-07-04','P','D',NULL,NULL,NULL,'Anzinger','Optional',2,2,4,2,'mjosupeitf@go.com','bvelti4@wunderground.com',2544),(3862,'2017-12-16','P','D',NULL,NULL,NULL,'Valley Edge','6th generation',3,2,4,3,'hsterrei@51.la','zstrong6@macromedia.com',9470),(4217,'2013-10-29','D','C','S','2013-10-31','Up-sized','Sauthoff',NULL,NULL,NULL,NULL,NULL,'adorken3@purevolume.com','hhasney1@opensource.org',2757),(4370,'2006-07-12','P','P',NULL,NULL,NULL,'Village Green',NULL,NULL,NULL,NULL,NULL,'rmccorryd@miibeian.gov.cn','emelby8@wired.com',2489),(4490,'1996-02-29','D','C','S','1996-03-05','Programmable','Stoughton',NULL,NULL,NULL,NULL,NULL,'adorken3@purevolume.com','zstrong6@macromedia.com',7521),(4567,'2016-10-26','D','P',NULL,NULL,NULL,'Ridgeway',NULL,NULL,NULL,NULL,NULL,'rmccorryd@miibeian.gov.cn','sbrookfield3@weibo.com',2544),(4714,'1991-02-08','P','D',NULL,NULL,NULL,'Little Fleur','info-mediaries',4,4,5,4,'mparade9@github.io','sburd9@spiegel.de',7521),(4772,'1995-07-16','D','P',NULL,NULL,NULL,'Spohn',NULL,NULL,NULL,NULL,NULL,'jsapsforde8@uol.com.br','sburd9@spiegel.de',609),(4978,'2016-08-15','D','D',NULL,NULL,NULL,'Prairieview','next generation',1,5,3,3,'lduddanh@unesco.org','bvelti4@wunderground.com',2757),(5043,'2009-04-22','D','C','S','2009-04-23','policy','Helena',NULL,NULL,NULL,NULL,NULL,'jsapsforde8@uol.com.br','bpalatino5@un.org',9622),(5109,'2005-01-04','D','C','U','2005-01-09','focus group','Debs',NULL,NULL,NULL,NULL,NULL,'lkennicottb@furl.net','emelby8@wired.com',7223),(5190,'2015-01-25','D','D',NULL,NULL,NULL,'Comanche','Grass-roots',5,4,5,4,'mreeme1@nydailynews.com','bpalatino5@un.org',2577),(5474,'2019-12-11','D','C','U','2019-12-17','web-enabled','Melby',NULL,NULL,NULL,NULL,NULL,'pkleinfelde@usnews.com','pclemencon0@ezinearticles.com',9470),(5586,'2011-04-17','D','D',NULL,NULL,NULL,'Pawling','object-oriented',5,3,4,4,'rdoolerg@alibaba.com','sbrookfield3@weibo.com',7521),(5639,'1999-08-05','P','D',NULL,NULL,NULL,'Hollow Ridge','even-keeled',3,3,1,2,'pkleinfelde@usnews.com','sburd9@spiegel.de',2577),(5845,'2001-02-21','D','C','U','2001-02-23','Intuitive','Superior',NULL,NULL,NULL,NULL,NULL,'htamblingson6@blogtalkradio.com','zstrong6@macromedia.com',2757),(5914,'1998-05-26','D','D',NULL,NULL,NULL,'Maywood','initiative',1,4,2,2,'imartinsc@exblog.jp','rteape2@digg.com',9622),(5986,'2004-06-12','D','D',NULL,NULL,NULL,'Bluejay','mobile',5,2,5,4,'hsterrei@51.la','rteape2@digg.com',9622),(5992,'2010-07-28','P','P',NULL,NULL,NULL,'Garrison',NULL,NULL,NULL,NULL,NULL,'mparade9@github.io','ethorowgood7@ox.ac.uk',2411),(6003,'1994-07-23','P','D',NULL,NULL,NULL,'Anthes','frame',4,4,3,3,'adorken3@purevolume.com','sbrookfield3@weibo.com',2489),(6123,'2000-01-14','P','D',NULL,NULL,NULL,'Welch','portal',3,3,5,3,'lduddanh@unesco.org','ethorowgood7@ox.ac.uk',8771),(6191,'2010-09-07','D','D',NULL,NULL,NULL,'Russell','holistic',1,2,5,2,'imartinsc@exblog.jp','pclemencon0@ezinearticles.com',8771),(6317,'2005-11-27','P','D',NULL,NULL,NULL,'Dayton','algorithm',2,4,4,3,'lduddanh@unesco.org','sburd9@spiegel.de',7223),(6338,'2012-05-29','D','D',NULL,NULL,NULL,'Melrose','Enhanced',5,4,4,4,'sleleuj@pen.io','bpalatino5@un.org',8308),(6393,'2009-11-24','D','C','S','2009-11-30','Customer-focused','Katie',NULL,NULL,NULL,NULL,NULL,'jjemmison5@ebay.com','zstrong6@macromedia.com',2181),(6574,'1999-05-24','D','C','S','1999-05-28','time-frame','Orin',NULL,NULL,NULL,NULL,NULL,'mreeme1@nydailynews.com','bvelti4@wunderground.com',5099),(6697,'2006-01-27','P','D',NULL,NULL,NULL,'Prairieview','object-oriented',3,1,1,1,'mreeme1@nydailynews.com','ethorowgood7@ox.ac.uk',2181),(6750,'1993-04-04','P','P',NULL,NULL,NULL,'Mitchell',NULL,NULL,NULL,NULL,NULL,'hsterrei@51.la','ethorowgood7@ox.ac.uk',5099),(6767,'1990-01-09','P','D',NULL,NULL,NULL,'Towne','Distributed',3,2,3,2,'mjosupeitf@go.com','pclemencon0@ezinearticles.com',9575),(6775,'2012-05-18','P','C','S','2012-05-25','zero tolerance','Londonderry',NULL,NULL,NULL,NULL,NULL,'htamblingson6@blogtalkradio.com','bpalatino5@un.org',6147),(6848,'1992-02-23','D','D',NULL,NULL,NULL,'Truax','monitoring',4,4,2,3,'mjosupeitf@go.com','sbrookfield3@weibo.com',2411),(6870,'2009-01-06','P','D',NULL,NULL,NULL,'American Ash','Customizable',1,1,1,1,'lduddanh@unesco.org','hhasney1@opensource.org',2411),(6874,'2000-12-05','D','D',NULL,NULL,NULL,'Meadow Vale','Integrated',1,5,5,3,'sleleuj@pen.io','sbrookfield3@weibo.com',1093),(6947,'1991-03-12','P','D',NULL,NULL,NULL,'Orin','Streamlined',2,2,3,2,'loxby2@springer.com','sburd9@spiegel.de',2181),(7115,'1992-04-14','D','C','U','1992-04-21','Adaptive','Hermina',NULL,NULL,NULL,NULL,NULL,'mjosupeitf@go.com','bvelti4@wunderground.com',9575),(7437,'1997-12-18','P','D',NULL,NULL,NULL,'Nancy','human-resource',3,2,2,2,'adorken3@purevolume.com','sbrookfield3@weibo.com',9797),(7470,'1994-07-21','D','P',NULL,NULL,NULL,'Brickson Park',NULL,NULL,NULL,NULL,NULL,'loxby2@springer.com','rteape2@digg.com',9386),(7776,'2011-04-29','P','C','U','2011-05-01','incremental','Waubesa',NULL,NULL,NULL,NULL,NULL,'tgratrix0@cdc.gov','rteape2@digg.com',1093),(7779,'2006-02-07','P','C','S','2006-02-08','secured line','Milwaukee',NULL,NULL,NULL,NULL,NULL,'mparade9@github.io','sbrookfield3@weibo.com',5099),(8006,'2007-05-30','P','P',NULL,NULL,NULL,'Menomonie',NULL,NULL,NULL,NULL,NULL,'loxby2@springer.com','zstrong6@macromedia.com',9575),(8275,'2009-05-16','D','P',NULL,NULL,NULL,'Di Loreto',NULL,NULL,NULL,NULL,NULL,'loxby2@springer.com','bvelti4@wunderground.com',9797),(8296,'2010-01-08','D','D',NULL,NULL,NULL,'Mayfield','Synchronised',5,3,5,4,'hsterrei@51.la','bvelti4@wunderground.com',4998),(8465,'2004-11-27','P','C','S','2004-12-07','Re-contextualized','David',NULL,NULL,NULL,NULL,NULL,'hsterrei@51.la','bpalatino5@un.org',5099),(8481,'2014-03-31','P','P',NULL,NULL,NULL,'Cascade',NULL,NULL,NULL,NULL,NULL,'lscatchard7@bigcartel.com','rteape2@digg.com',2181),(8628,'1990-10-09','P','P',NULL,NULL,NULL,'Red Cloud',NULL,NULL,NULL,NULL,NULL,'jjemmison5@ebay.com','pclemencon0@ezinearticles.com',2577),(8642,'2017-10-18','D','D',NULL,NULL,NULL,'Brickson Park','Intuitive',4,5,3,4,'mparade9@github.io','sbrookfield3@weibo.com',2181),(8730,'2004-10-24','D','D',NULL,NULL,NULL,'Ilene','matrix',2,5,4,3,'pkleinfelde@usnews.com','ethorowgood7@ox.ac.uk',2181),(8821,'2006-05-09','D','D',NULL,NULL,NULL,'Warbler','Exclusive',2,1,2,1,'acockram4@mapy.cz','pclemencon0@ezinearticles.com',609),(8882,'2003-06-16','P','C','U','2003-06-23','national','Oriole',NULL,NULL,NULL,NULL,NULL,'loxby2@springer.com','rteape2@digg.com',6147),(8919,'1992-03-31','D','P',NULL,NULL,NULL,'Morning',NULL,NULL,NULL,NULL,NULL,'mparade9@github.io','hhasney1@opensource.org',9575),(9033,'2006-11-24','D','D',NULL,NULL,NULL,'Forest','Integrated',5,3,4,4,'lduddanh@unesco.org','hhasney1@opensource.org',609),(9221,'1994-06-19','D','D',NULL,NULL,NULL,'Anthes','internet solution',1,4,1,2,'jsapsforde8@uol.com.br','sbrookfield3@weibo.com',5099),(9244,'2011-04-27','P','P',NULL,NULL,NULL,'Butterfield',NULL,NULL,NULL,NULL,NULL,'imartinsc@exblog.jp','ethorowgood7@ox.ac.uk',5099),(9253,'1998-11-26','P','C','U','1998-12-02','asynchronous','Mallard',NULL,NULL,NULL,NULL,NULL,'mreeme1@nydailynews.com','rteape2@digg.com',2181),(9597,'2009-11-23','D','P',NULL,NULL,NULL,'Crest Line',NULL,NULL,NULL,NULL,NULL,'imartinsc@exblog.jp','emelby8@wired.com',9470),(9615,'2015-09-08','D','P',NULL,NULL,NULL,'Weeping Birch',NULL,NULL,NULL,NULL,NULL,'lkennicottb@furl.net','hhasney1@opensource.org',2181),(9837,'2005-01-11','D','D',NULL,NULL,NULL,'Cody','De-engineered',1,5,1,2,'mreeme1@nydailynews.com','hhasney1@opensource.org',9575);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parks`
--

DROP TABLE IF EXISTS `parks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parks` (
  `parkID` int(8) NOT NULL,
  `location` varchar(45) NOT NULL,
  `park_name` varchar(45) NOT NULL,
  `vendorID` int(8) NOT NULL,
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
INSERT INTO `parks` VALUES (176,'7205 Forster Circle','Red Cloud',2754),(959,'3 Larry Place','Veith',6011),(1526,'392 Dunning Street','Paget',2457),(1687,'4 Northview Place','Brentwood',7085),(2478,'20 Delladonna Crossing','Crescent Oaks',1523),(2499,'6 Vermont Point','Forster',2457),(2565,'30167 Johnson Terrace','Cody',2754),(2806,'92223 Bartelt Avenue','Gerald',7698),(2953,'00 Fuller Street','Fulton',7698),(3275,'941 Harper Alley','Anzinger',5332),(3508,'0 East Point','Onsgard',1640),(3563,'66 Oriole Center','Muir',302),(3578,'228 Ridge Oak Junction','Di Loreto',1640),(3640,'93 Eastlawn Street','Lukken',302),(3974,'7 La Follette Lane','Bowman',8514),(4031,'62 Mallory Parkway','Kings',2989),(4639,'11 Talisman Junction','Redwing',9027),(5179,'5401 Ruskin Avenue','Monument',3429),(5318,'87698 Vermont Avenue','Warbler',7085),(5322,'18 Schiller Junction','Memorial',2754),(5389,'16 Muir Court','Lien',6011),(5983,'12 Colorado Lane','Washington',8514),(6125,'29 Schiller Terrace','Blaine',2989),(6244,'1 Bartillon Alley','Becker',1640),(6307,'12998 Summer Ridge Plaza','Comanche',6429),(7056,'67931 Bellgrove Point','Dakota',6011),(7130,'25 Eliot Hill','Dayton',7655),(7238,'1 Autumn Leaf Pass','Texas',4670),(7260,'94967 Mariners Cove Circle','Veith',4670),(7295,'2 Esker Plaza','Northport',8514),(7631,'69739 Sutteridge Court','Blackbird',2457),(8359,'90329 Green Ridge Circle','Mcguire',2754),(8539,'932 Towne Pass','Lien',2333),(9289,'88411 Anthes Parkway','Eagan',8514),(9492,'53 Little Fleur Pass','Fordem',2333),(9546,'428 Warbler Park','Division',2989),(9646,'59862 Mallory Way','Fuller',6011),(9684,'35 Pepper Wood Point','Kedzie',1601),(9836,'879 Spohn Junction','North',1601),(9852,'901 Eagle Crest Circle','Roth',8922);
/*!40000 ALTER TABLE `parks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_details` (
  `payment_no` int(8) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `amount_paid` decimal(6,2) NOT NULL,
  `penalty` decimal(6,2) DEFAULT NULL,
  `orderID` int(8) DEFAULT NULL,
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
INSERT INTO `payment_details` VALUES (60,'2016-08-15','21:27:00',538.76,NULL,4978),(99,'1991-02-08','16:09:00',8678.74,NULL,4714),(241,'2000-12-05','12:17:00',3170.54,NULL,6874),(299,'1992-04-14','18:54:00',8260.29,2065.07,7115),(370,'2004-04-07','05:10:00',4405.27,NULL,1079),(388,'2006-02-06','12:23:00',4215.10,NULL,262),(455,'2001-09-24','15:35:00',1388.34,NULL,1726),(473,'1996-01-26','04:27:00',5974.20,1493.55,1103),(565,'2009-11-23','03:44:00',3909.76,NULL,9597),(785,'2003-06-16','07:02:00',7578.80,1894.70,8882),(903,'1995-03-10','18:01:00',9364.38,2341.10,2425),(961,'2005-02-23','15:32:00',9834.78,2458.70,360),(978,'2006-01-27','06:57:00',8171.19,NULL,6697),(1071,'2012-05-18','18:16:00',1153.21,288.30,6775),(1190,'2015-09-08','15:25:00',6008.11,NULL,9615),(1195,'1999-07-04','10:06:00',7115.82,NULL,3837),(1451,'2005-09-22','14:46:00',2095.26,523.82,373),(1524,'2006-02-07','13:06:00',4042.11,1010.53,7779),(1715,'1998-09-17','06:17:00',3104.24,776.06,3760),(1883,'2007-05-30','08:24:00',6947.53,NULL,8006),(1905,'2010-11-24','15:22:00',945.45,NULL,1300),(2027,'2013-07-20','05:58:00',520.18,NULL,2391),(2173,'2016-02-12','09:17:00',829.86,NULL,1673),(2194,'1991-02-10','15:57:00',6476.23,1619.06,922),(2240,'1992-02-23','05:06:00',7496.82,NULL,6848),(2335,'2005-01-04','12:25:00',8253.86,2063.47,5109),(2447,'2019-12-11','03:55:00',171.79,42.95,5474),(2497,'2011-04-29','05:34:00',3207.70,801.93,7776),(2577,'2004-10-24','06:24:00',6219.81,NULL,8730),(2790,'1994-06-16','17:11:00',4315.94,1078.99,1324),(3257,'1996-02-29','22:41:00',5618.52,1404.63,4490),(3268,'1993-05-02','22:50:00',790.72,NULL,2668),(3316,'2011-04-17','06:35:00',5616.05,NULL,5586),(3324,'1995-07-09','01:39:00',8484.66,NULL,2200),(3465,'2001-06-11','19:41:00',9667.59,2416.90,1343),(3477,'2010-07-28','11:30:00',6875.46,NULL,5992),(3576,'2002-11-06','08:39:00',8807.20,2201.80,2206),(3650,'2009-08-20','19:28:00',6154.11,NULL,567),(3695,'1993-04-04','15:00:00',5697.46,NULL,6750),(3717,'1991-03-12','16:23:00',9555.23,NULL,6947),(3823,'2017-10-18','04:08:00',148.71,NULL,8642),(3854,'2009-11-24','10:46:00',5651.02,1412.76,6393),(3973,'1997-01-05','14:16:00',4012.22,NULL,2736),(4010,'2009-09-28','22:32:00',7778.70,1944.68,2946),(4095,'2002-10-14','18:13:00',9462.43,NULL,2984),(4118,'2001-02-21','15:47:00',5348.40,1337.10,5845),(4314,'2009-11-27','15:26:00',5434.09,NULL,2796),(4315,'2004-11-27','20:44:00',6199.49,1549.87,8465),(4414,'1999-12-17','02:11:00',4484.27,NULL,2379),(4461,'1997-04-03','06:13:00',736.04,184.01,543),(4528,'2010-01-08','05:47:00',3152.17,NULL,8296),(4544,'2019-08-20','05:01:00',5563.87,NULL,1463),(4581,'2014-03-31','22:15:00',9046.05,NULL,8481),(4682,'1996-10-17','22:16:00',8176.43,NULL,3214),(4723,'2000-01-14','14:44:00',9251.93,NULL,6123),(4876,'1996-02-06','05:50:00',7780.57,NULL,2051),(5001,'2009-04-22','08:32:00',1779.06,444.77,5043),(5034,'2017-06-06','17:06:00',325.71,81.43,2442),(5067,'1994-07-21','15:12:00',923.17,NULL,7470),(5115,'2015-01-25','06:09:00',1158.98,NULL,5190),(5152,'2005-11-27','15:40:00',9128.64,NULL,6317),(5200,'2013-10-29','10:33:00',1169.36,292.34,4217),(5250,'2003-05-24','02:57:00',908.00,NULL,2474),(5578,'2009-01-06','00:37:00',6769.13,NULL,6870),(5866,'1995-07-16','17:26:00',4833.69,NULL,4772),(6119,'2012-08-09','09:44:00',5371.82,1342.96,1209),(6309,'1997-12-18','15:49:00',4239.18,NULL,7437),(6352,'2012-05-29','06:48:00',9396.60,NULL,6338),(6653,'2002-09-04','05:44:00',3454.54,863.64,2745),(6894,'2011-09-08','06:53:00',7431.11,NULL,1315),(6960,'2019-01-29','14:08:00',4227.38,1056.85,1750),(7020,'1992-03-31','00:22:00',9362.37,NULL,8919),(7031,'2011-04-27','06:47:00',6457.09,NULL,9244),(7116,'2016-10-26','04:29:00',6771.71,NULL,4567),(7317,'2019-06-16','16:11:00',7605.30,1901.33,467),(7350,'1990-01-09','12:15:00',1547.49,NULL,6767),(7458,'2015-01-19','15:02:00',5349.82,NULL,2037),(7486,'1990-06-28','04:52:00',7863.84,NULL,3134),(7650,'2004-06-12','01:13:00',6084.45,NULL,5986),(7665,'1994-06-19','21:09:00',1514.69,NULL,9221),(7673,'2009-05-16','18:16:00',2261.60,NULL,8275),(7725,'1998-05-26','01:49:00',4227.24,NULL,5914),(7984,'2017-12-16','15:41:00',7810.13,NULL,3862),(7999,'2019-10-07','13:32:00',8391.33,NULL,324),(8192,'1999-05-24','15:11:00',4533.51,1133.38,6574),(8267,'1999-08-05','22:15:00',8035.27,NULL,5639),(8365,'2011-04-22','07:06:00',993.54,NULL,3608),(8496,'2000-01-27','08:28:00',2497.90,624.48,3207),(8518,'1994-07-23','09:51:00',4862.40,NULL,6003),(8603,'2006-07-12','04:49:00',1493.11,NULL,4370),(8964,'2006-11-24','16:43:00',4252.90,NULL,9033),(9031,'1990-10-09','21:22:00',8416.29,NULL,8628),(9176,'2014-11-10','22:45:00',1265.17,NULL,2307),(9366,'1998-11-26','14:15:00',7710.96,1927.74,9253),(9472,'2010-09-07','17:24:00',559.92,NULL,6191),(9581,'2006-05-09','20:55:00',2096.37,NULL,8821),(9669,'2000-09-13','04:10:00',5118.32,1279.58,1674),(9711,'2005-01-11','03:00:00',3320.27,NULL,9837),(9940,'2005-01-05','06:25:00',4641.11,1160.28,1613),(9984,'2001-12-14','04:10:00',8915.43,NULL,1727);
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_pictures`
--

DROP TABLE IF EXISTS `product_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_pictures` (
  `fileID` int(8) NOT NULL,
  `filename` varchar(45) NOT NULL,
  `folder` varchar(45) NOT NULL,
  `link` varchar(45) NOT NULL,
  `file_type` int(2) NOT NULL,
  `requirement` int(2) NOT NULL,
  `date_submitted` date NOT NULL,
  `productID` int(8) NOT NULL,
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
INSERT INTO `product_pictures` VALUES (487,'Shurville','Clemo','discovery.com',73,63,'1993-02-27',3315),(882,'Batey','Dilleston','princeton.edu',37,15,'2016-11-29',9845),(974,'Goff','Huxton','wp.com',9,47,'2002-09-16',6053),(1022,'Olivetti','Sykes','columbia.edu',99,78,'2003-03-16',6771),(1035,'Sinnat','Gold','jalbum.net',95,16,'2004-05-28',6677),(1119,'Ottley','Casassa','cmu.edu',34,58,'1990-10-23',8876),(1518,'Drewet','Todarini','prnewswire.com',23,34,'1996-12-07',6119),(1720,'De L\'Isle','Littlecote','businessinsider.com',82,46,'2007-11-13',9340),(1751,'McGruar','Cissell','weibo.com',82,30,'2009-04-17',5777),(1898,'Dufty','Feast','tamu.edu',70,25,'2012-06-08',9845),(1930,'Deboy','Tampen','theglobeandmail.com',83,35,'2016-04-14',3337),(2036,'Waszkiewicz','Doherty','linkedin.com',44,73,'2009-02-11',9845),(2105,'Ox','Janjusevic','ameblo.jp',24,48,'2009-10-02',8919),(2713,'Pearne','Kinworthy','unc.edu',55,51,'2001-09-19',3337),(2803,'Bernadzki','Fosken','uiuc.edu',96,94,'2017-11-19',8339),(2957,'Perryman','Gammack','amazon.co.jp',26,63,'1998-12-22',9340),(3029,'Setch','Byron','bloglovin.com',5,50,'1995-08-19',6677),(3038,'Fried','Shimony','disqus.com',71,11,'1990-05-04',7970),(3163,'Kelley','D\'Errico','japanpost.jp',6,42,'1996-11-01',3337),(3312,'Borrott','Sullens','bizjournals.com',84,5,'2005-09-22',9845),(3833,'Pattemore','Westwick','miitbeian.gov.cn',4,94,'1995-12-31',853),(4388,'Jennaroy','Stares','cafepress.com',40,4,'2012-09-30',3337),(4404,'Slessar','Blamphin','zimbio.com',99,92,'2005-09-27',1645),(4416,'Jenteau','Simmen','chicagotribune.com',3,54,'1995-11-06',853),(4502,'Elph','Worcs','networksolutions.com',40,94,'2017-02-12',7970),(5187,'Sambles','Bothams','hatena.ne.jp',39,23,'2010-01-19',9340),(5250,'Guinane','Menico','si.edu',10,50,'2001-04-21',8919),(5359,'Gowdridge','Hearse','nationalgeographic.com',85,74,'2012-08-26',5331),(5912,'Ludvigsen','Willoughby','prweb.com',9,46,'1998-08-18',1990),(5968,'Ludwig','Paulsson','qq.com',23,25,'2008-11-06',5331),(6044,'Patrickson','Titford','symantec.com',24,13,'2012-02-13',853),(6151,'Narrie','Hierro','wunderground.com',97,59,'2011-09-15',3315),(6183,'Harly','Wogan','businessweek.com',40,64,'2005-12-15',6119),(6918,'Godilington','Luckin','usa.gov',21,94,'2000-08-30',3315),(7982,'Pennycock','Greste','chronoengine.com',32,79,'2008-12-13',6771),(8957,'McCahey','Joules','businessweek.com',78,51,'1995-04-23',6053),(9150,'Struthers','Bellson','aol.com',15,54,'1990-06-06',4329),(9307,'Scartifield','Asman','cam.ac.uk',86,88,'2002-12-22',9845),(9652,'Matterdace','Slaight','php.net',62,42,'2004-02-27',6677),(9659,'Marton','Sandaver','shinystat.com',93,49,'2015-12-05',6303);
/*!40000 ALTER TABLE `product_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productID` int(8) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `quantity_in_stock` int(3) NOT NULL,
  `date_added` date NOT NULL,
  `date_uploaded` date NOT NULL,
  `businessID` int(8) NOT NULL,
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
INSERT INTO `products` VALUES (853,'Citalopram Hydrobromide',979.96,307,'1997-01-11','2017-11-29',6436),(1645,'CVS PHARMACY',182.25,654,'2007-12-21','2012-01-15',5439),(1990,'Jane Seymour Natural Advantage',463.27,607,'1990-12-22','2006-04-18',5439),(3315,'Curity Povidone-Iodine Scrub',947.72,11,'2013-06-05','2014-01-07',5439),(3337,'In Control Nicotine',1378.55,898,'1997-11-14','2008-08-09',5122),(4172,'70% Rubbing',113.43,729,'1993-02-05','2000-05-04',5536),(4329,'LISINOPRIL',592.84,459,'2018-11-23','2019-07-14',2912),(5331,'Medi-First Plus Cold Relief',371.72,12,'1997-11-06','2007-05-11',8107),(5777,'Restless Legs Relief',2237.13,345,'2013-07-23','2016-02-11',5122),(6053,'Furosemide',629.55,225,'2006-06-29','2016-07-08',5640),(6119,'Patch',465.29,353,'2019-06-15','2019-10-25',427),(6303,'Doxycycline',1257.99,470,'2008-01-19','2011-11-16',8107),(6677,'Methylphenidate Hydrochloride',2457.65,453,'2013-12-02','2018-01-16',5536),(6771,'SHISEIDO SHEER MATIFYING COMPACT (REFILL)',497.93,903,'1995-08-03','1999-02-21',427),(7970,'Equaline Hair Regrowth Treatment',863.99,763,'2008-11-18','2010-11-09',2912),(8339,'Virginia Live Oak',946.94,923,'2004-11-19','2016-11-18',5640),(8876,'Alprazolam',252.28,683,'2016-06-21','2019-06-17',1897),(8919,'ALL FLU',487.96,242,'1995-04-30','2008-03-27',7954),(9340,'Antibacterial Hand Soap',855.04,910,'1994-05-20','2005-06-17',5439),(9845,'Cefaclor',6561.60,145,'2014-03-07','2019-11-16',5536);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_filetypes`
--

DROP TABLE IF EXISTS `ref_filetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_filetypes` (
  `file_type` int(2) NOT NULL,
  PRIMARY KEY (`file_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_filetypes`
--

LOCK TABLES `ref_filetypes` WRITE;
/*!40000 ALTER TABLE `ref_filetypes` DISABLE KEYS */;
INSERT INTO `ref_filetypes` VALUES (2),(3),(22),(91),(95);
/*!40000 ALTER TABLE `ref_filetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_requirementtypes`
--

DROP TABLE IF EXISTS `ref_requirementtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ref_requirementtypes` (
  `requirement_type` int(2) NOT NULL,
  PRIMARY KEY (`requirement_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_requirementtypes`
--

LOCK TABLES `ref_requirementtypes` WRITE;
/*!40000 ALTER TABLE `ref_requirementtypes` DISABLE KEYS */;
INSERT INTO `ref_requirementtypes` VALUES (5),(12),(14),(17),(39);
/*!40000 ALTER TABLE `ref_requirementtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residentgroups`
--

DROP TABLE IF EXISTS `residentgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `residentgroups` (
  `groupID` int(4) NOT NULL,
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
INSERT INTO `residentgroups` VALUES (609,'Packers','Albatross, galapagos','Y','zstrong6@macromedia.com\r'),(1093,'Comanche','Meerkat','N','zstrong6@macromedia.com\r'),(2181,'Comanche','Hartebeest, coke\'s','N','zstrong6@macromedia.com\r'),(2411,'Service','Malay squirrel (unidentified)','Y','bpalatino5@un.org\r'),(2489,'Packers','Jackal, indian','Y','ethorowgood7@ox.ac.uk\r'),(2544,'Comanche','Heron, gray','Y','hhasney1@opensource.org\r'),(2577,'Service','Common turkey','N','bpalatino5@un.org\r'),(2757,'Service','Olive baboon','N','hhasney1@opensource.org\r'),(4998,'Farragut','Fat-tailed dunnart','Y','zstrong6@macromedia.com\r'),(5099,'Comanche','Dove, white-winged','N','hhasney1@opensource.org\r'),(6147,'Comanche','Blue fox','N','zstrong6@macromedia.com\r'),(7223,'Farragut','Bahama pintail','Y','bvelti4@wunderground.com\r'),(7521,'Quincy','Javanese cormorant','Y','bvelti4@wunderground.com\r'),(8308,'Quincy','Yellow mongoose','Y','bpalatino5@un.org\r'),(8771,'Comanche','Grant\'s gazelle','N','ethorowgood7@ox.ac.uk\r'),(9386,'Packers','Beaver, american','N','ethorowgood7@ox.ac.uk\r'),(9470,'Service','Sugar glider','N','pclemencon0@ezinearticles.com\r'),(9575,'Service','Albatross, waved','Y','bvelti4@wunderground.com\r'),(9622,'Service','Squirrel, uinta ground','N','bvelti4@wunderground.com\r'),(9797,'Comanche','Monitor, two-banded','N','hhasney1@opensource.org\r');
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
  `householdID` int(4) NOT NULL,
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
INSERT INTO `residents` VALUES ('bpalatino5@un.org','A','ksparry0@guardian.co.uk',2649),('bvelti4@wunderground.com','A','htarge1@tinyurl.com',8986),('emelby8@wired.com','P','cbriant4@berkeley.edu',8633),('ethorowgood7@ox.ac.uk','A','tsmithyman3@ovh.net',1954),('hhasney1@opensource.org','A','htarge1@tinyurl.com',6193),('pclemencon0@ezinearticles.com','A','tsmithyman3@ovh.net',2649),('rteape2@digg.com','P','cbriant4@berkeley.edu',1954),('sbrookfield3@weibo.com','P','htarge1@tinyurl.com',8633),('sburd9@spiegel.de','A','cwallas2@wikia.com',8986),('zstrong6@macromedia.com','A','tsmithyman3@ovh.net',6193);
/*!40000 ALTER TABLE `residents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `routeID` int(8) NOT NULL,
  `location` varchar(45) NOT NULL,
  `vendorID` int(8) NOT NULL,
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
INSERT INTO `routes` VALUES (21,'Burrows',1640),(319,'6th',7655),(701,'Fuller',9027),(827,'Manley',9027),(907,'Judy',6011),(1533,'Pine View',9027),(1851,'Esch',302),(1936,'Beilfuss',1601),(2177,'Straubel',7655),(2308,'Carberry',3429),(2871,'Hooker',3429),(2873,'Pleasure',4670),(3025,'Tennessee',4670),(3662,'Grover',1523),(3812,'Paget',2333),(3952,'Veith',2754),(4635,'Westport',1640),(4748,'Fordem',8922),(4952,'Dottie',2333),(5715,'Bunting',8922),(5764,'Nova',2333),(5972,'Lakewood',302),(6210,'Pleasure',9027),(6253,'Brown',3429),(6547,'Farmco',5332),(6966,'Vernon',2754),(7854,'Dawn',302),(7911,'Moland',2754),(8242,'Pleasure',4670),(8249,'Eagan',7655),(8279,'Nancy',8514),(8652,'Graceland',1640),(8681,'Marcy',5332),(8782,'Stephen',3429),(8872,'Stang',7085),(8906,'Katie',195),(9029,'Delaware',3429),(9433,'Wayridge',6011),(9508,'Merry',2989),(9872,'Birchwood',195);
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
  `blockNo` int(8) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` int(11) NOT NULL,
  `position` enum('M','S') NOT NULL COMMENT 'M = Manager\nS = Staff',
  `active` enum('Y','N') NOT NULL,
  `hire_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `businessID` int(8) NOT NULL,
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
INSERT INTO `supplierusers` VALUES ('acockram4@mapy.cz',6335,'4 Fieldstone Junction',928642733,'M','N','2008-09-04','2009-10-27',2912),('adorken3@purevolume.com',7497,'2 Forster Plaza',329491390,'M','Y','1995-02-25','2002-05-31',5640),('hsterrei@51.la',1811,'6 Del Mar Pass',322729583,'M','Y','2014-02-20',NULL,8107),('htamblingson6@blogtalkradio.com',7540,'85426 West Avenue',955116555,'S','N','1991-11-19','2000-01-12',5439),('imartinsc@exblog.jp',2850,'3381 Ohio Center',905465062,'M','Y','2010-05-23',NULL,6436),('jjemmison5@ebay.com',8126,'7 Oakridge Circle',427337611,'M','Y','2003-07-07',NULL,7954),('jsapsforde8@uol.com.br',4166,'747 Red Cloud Parkway',672324912,'M','N','1991-04-19','2000-01-12',5439),('lduddanh@unesco.org',3845,'96457 Banding Parkway',374535355,'M','Y','2006-02-26',NULL,1897),('lkennicottb@furl.net',5990,'27 Corry Junction',787871047,'M','Y','2019-02-04',NULL,5640),('loxby2@springer.com',7631,'95879 East Parkway',364565501,'S','N','1991-04-19','2000-01-12',5439),('lscatchard7@bigcartel.com',8587,'83276 Sutherland Place',950944749,'M','N','2018-02-26','2018-05-22',5536),('mjosupeitf@go.com',5351,'9 Sommers Pass',650760593,'M','Y','2012-08-26',NULL,5122),('mparade9@github.io',1970,'86914 Forest Dale Court',264148079,'S','N','1991-04-19','2000-01-12',5439),('mreeme1@nydailynews.com',2906,'1 Gale Avenue',197914939,'S','N','2001-01-10','2014-10-08',1897),('pkleinfelde@usnews.com',9043,'53346 Superior Street',960288795,'M','N','2002-05-31','2019-02-04',5640),('rdoolerg@alibaba.com',1008,'44 Nevada Street',575550502,'S','N','2010-03-15','2018-05-22',5536),('rmccorryd@miibeian.gov.cn',1750,'1215 High Crossing Pass',954939820,'S','Y','2007-02-22',NULL,5122),('sleleuj@pen.io',2765,'37 Kenwood Avenue',117842797,'S','N','1990-02-27','2018-05-22',5536),('tgratrix0@cdc.gov',793,'26094 Carpenter Crossing',675491402,'M','N','2002-05-11','2009-03-02',427),('tridgewella@google.com.au',331,'8 Fremont Point',492460261,'S','N','2008-07-20','2009-03-02',427);
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
INSERT INTO `sysadmins` VALUES ('htarge1@tinyurl.com','1997-01-07','2006-08-24'),('ksparry0@guardian.co.uk','2005-03-02','2019-12-14');
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
INSERT INTO `sysadminships` VALUES ('ksparry0@guardian.co.uk','htarge1@tinyurl.com\r');
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
INSERT INTO `users` VALUES ('cbriant4@berkeley.edu','R','cbriant4','m6UPGL','F','Briant','Carleen','1977-02-14',NULL,NULL),('cwallas2@wikia.com','R','cwallas2','rdevh0LuXW','F','Wallas','Calla','1992-08-15',NULL,NULL),('htarge1@tinyurl.com','O','htarge1','djb60bBb','M','Targe','Horatius','1972-12-01','1997-01-07','2006-08-24'),('ksparry0@guardian.co.uk','O','ksparry0','X7pVviUBOaOt','M','Sparry','Kinnie','1994-02-16','2005-03-02',NULL),('tsmithyman3@ovh.net','R','tsmithyman3','GpuQ7ke9','M','Smithyman','Tye','1998-12-17',NULL,NULL);
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
  `dayID` int(1) NOT NULL,
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
INSERT INTO `workday_assignments` VALUES ('acockram4@mapy.cz','2019-11-14',3),('acockram4@mapy.cz','2005-07-25',4),('acockram4@mapy.cz','1996-06-03',5),('adorken3@purevolume.com','2018-12-20',2),('adorken3@purevolume.com','2017-03-08',3),('adorken3@purevolume.com','2016-02-19',4),('hsterrei@51.la','2004-10-29',4),('hsterrei@51.la','1994-09-02',5),('htamblingson6@blogtalkradio.com','2009-01-10',5),('htamblingson6@blogtalkradio.com','1999-10-08',6),('htamblingson6@blogtalkradio.com','2011-09-27',7),('imartinsc@exblog.jp','2018-12-14',5),('imartinsc@exblog.jp','1996-05-03',6),('jjemmison5@ebay.com','2016-06-19',4),('jjemmison5@ebay.com','2003-05-01',5),('jjemmison5@ebay.com','1993-08-10',6),('jsapsforde8@uol.com.br','2012-04-01',1),('jsapsforde8@uol.com.br','2004-04-28',2),('jsapsforde8@uol.com.br','2005-02-09',7),('lduddanh@unesco.org','2008-10-20',3),('lduddanh@unesco.org','2011-05-12',4),('lkennicottb@furl.net','1990-02-23',4),('lkennicottb@furl.net','2016-05-16',5),('loxby2@springer.com','1997-03-09',1),('loxby2@springer.com','1995-12-09',2),('loxby2@springer.com','2004-11-08',3),('lscatchard7@bigcartel.com','2015-08-26',1),('lscatchard7@bigcartel.com','2016-12-29',6),('lscatchard7@bigcartel.com','2012-05-02',7),('mjosupeitf@go.com','2013-04-27',1),('mjosupeitf@go.com','2009-03-31',2),('mparade9@github.io','2002-07-12',1),('mparade9@github.io','2017-04-02',2),('mparade9@github.io','2009-07-10',3),('mreeme1@nydailynews.com','1996-03-13',1),('mreeme1@nydailynews.com','2005-03-28',2),('mreeme1@nydailynews.com','2011-10-19',7),('pkleinfelde@usnews.com','2011-02-21',1),('pkleinfelde@usnews.com','2001-10-02',7),('rdoolerg@alibaba.com','2004-04-15',2),('rdoolerg@alibaba.com','1991-07-27',3),('rmccorryd@miibeian.gov.cn','1995-11-03',6),('rmccorryd@miibeian.gov.cn','2004-07-16',7),('sleleuj@pen.io','2011-11-29',5),('sleleuj@pen.io','1997-12-25',6),('tgratrix0@cdc.gov','2002-06-17',1),('tgratrix0@cdc.gov','1996-10-04',6),('tgratrix0@cdc.gov','2001-01-21',7),('tridgewella@google.com.au','2015-08-15',3),('tridgewella@google.com.au','2001-10-06',4);
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
  `dayID` int(1) NOT NULL,
  PRIMARY KEY (`dayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workdays`
--

LOCK TABLES `workdays` WRITE;
/*!40000 ALTER TABLE `workdays` DISABLE KEYS */;
INSERT INTO `workdays` VALUES ('M',1),('T',2),('W',3),('H',4),('F',5),('S',6),('L',7);
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

-- Dump completed on 2019-12-15 22:40:27
