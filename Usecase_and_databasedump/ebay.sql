-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: ebay
-- ------------------------------------------------------
-- Server version	5.5.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bank_details`
--

DROP TABLE IF EXISTS `bank_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_details` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `available_balance` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_details`
--

LOCK TABLES `bank_details` WRITE;
/*!40000 ALTER TABLE `bank_details` DISABLE KEYS */;
INSERT INTO `bank_details` VALUES (1,'Axis Bank','Bangalore',20000),(2,'State Bank of India','New Delhi',30000);
/*!40000 ALTER TABLE `bank_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidding_check`
--

DROP TABLE IF EXISTS `bidding_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bidding_check` (
  `product_id` int(11) NOT NULL,
  `bidding_value` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidding_check`
--

LOCK TABLES `bidding_check` WRITE;
/*!40000 ALTER TABLE `bidding_check` DISABLE KEYS */;
INSERT INTO `bidding_check` VALUES (4,0,'2011-04-01','2011-04-09');
/*!40000 ALTER TABLE `bidding_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidding_detail`
--

DROP TABLE IF EXISTS `bidding_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bidding_detail` (
  `user_name` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `bidding_price` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidding_detail`
--

LOCK TABLES `bidding_detail` WRITE;
/*!40000 ALTER TABLE `bidding_detail` DISABLE KEYS */;
INSERT INTO `bidding_detail` VALUES ('samrat',4,2390,'Pending'),('rohit',12,7000,'Pending');
/*!40000 ALTER TABLE `bidding_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_details`
--

DROP TABLE IF EXISTS `book_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_details` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `author` varchar(30) NOT NULL,
  `department` varchar(20) DEFAULT NULL,
  `shipping_charge` int(11) DEFAULT NULL,
  `sellers_name` varchar(50) NOT NULL,
  `edition` varchar(20) DEFAULT NULL,
  `condition` varchar(20) NOT NULL,
  `category` varchar(30) NOT NULL,
  `buying_format` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_details`
--

LOCK TABLES `book_details` WRITE;
/*!40000 ALTER TABLE `book_details` DISABLE KEYS */;
INSERT INTO `book_details` VALUES (1,'Advanced Inorganic Chemistry','Cotton','Chemistry',45,'Rohit','1st Edition','New','Education','Buy It Now',390,10,'images/advanced_organic_chemistry_COTTON'),(2,'Be An Enterpreneur','Mahesh Danannavar','Personality Developm',56,'Sumit','2nd Edition','Used','Management','Auction',300,10,''),(3,'Contemporary Mathematics','V K Murthy','Mathematics',NULL,'','3rd Edition','New','Engineering','Buy It Now',285,0,''),(4,'Anatomy of Seed Plants','ESAU','Biology',NULL,'','4th Edition','Used','Medical','Auction',185,0,''),(5,'Till We Meet Again','Judith Krantz','Romance',NULL,'','2nd Edition','New','Fiction','Buy It Now',500,0,''),(6,'The Afghans','Frederick Forsyth','Action',NULL,'','3rd Edition','New','Non Fiction','Buy It Now',475,0,''),(7,'Pyramid of Virgin Dreams','Vipul Mittra','Classic',NULL,'','1st Edition','Used','Inspiration','Auction',275,0,''),(8,'Mistress of the Game','Sidney Shelton','Play',NULL,'','1st Edition','New','Drama','Buy It Now',670,0,''),(10,'dsfdsf','sdfdsf','dfsd',34,'samrat','dsfds','new','fgfdd','buyitnow',323,1,'null'),(11,'sdfdsf','dsfds','dsfdsf',23,'samrat','fdsfdsf','new','dsfdsfd','buyitnow',234,1,'null'),(12,'dsfds','dfsfgdsg','dfsdsf',22,'samrat','dsgvfsd','new','dsfdsf','buyitnow',233,2,'null'),(13,'hbjhjb','ugyugu','ygyutu',43,'samrat','uyuhi','new','uygyugu','buyitnow',4545,1,'null'),(14,'gfgygy','yutyu','ytty',43,'samrat','yty','new','hfygvhg','buyitnow',434,1,'null');
/*!40000 ALTER TABLE `book_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer_payment_details`
--

DROP TABLE IF EXISTS `buyer_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer_payment_details` (
  `buyer_id` varchar(50) NOT NULL,
  `item_id` int(11) NOT NULL,
  `purchase_charge` int(11) NOT NULL,
  `purchase_date` varchar(50) NOT NULL,
  `seller_id` varchar(50) NOT NULL,
  `previous_balancce` int(11) NOT NULL,
  `available_balance` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer_payment_details`
--

LOCK TABLES `buyer_payment_details` WRITE;
/*!40000 ALTER TABLE `buyer_payment_details` DISABLE KEYS */;
INSERT INTO `buyer_payment_details` VALUES ('samrat',1,74250,'2011/04/06','Rohit Sharma',-204098,-278348);
/*!40000 ALTER TABLE `buyer_payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camera_details`
--

DROP TABLE IF EXISTS `camera_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `camera_details` (
  `camera_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `memory` varchar(20) DEFAULT NULL,
  `pixel` varchar(20) NOT NULL,
  `condition` varchar(20) NOT NULL,
  `sellers_name` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `category` varchar(40) NOT NULL,
  `buying_format` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `shipping_price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`camera_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera_details`
--

LOCK TABLES `camera_details` WRITE;
/*!40000 ALTER TABLE `camera_details` DISABLE KEYS */;
INSERT INTO `camera_details` VALUES (1,'Kodak','CD14','Upto 5GB','5 Megapixel','New','Samrat Dutta',0,'Compact','images/bin.gif',7055,25,7080,'images/cameras/Kodak_CD14'),(2,'Sony','14x Cyber Shot','8GB','7 Megapixel','New','Pooja Sinha',0,'Digital','images/bin.gif',9080,35,10115,'images/cameras/sony.jpg'),(3,'Fuji','AV100-12MP',NULL,'4 Megapixel','Used','Sarika Hablani',0,'Long Zoom','Auction',7500,0,7500,'images/cameras/fujifilm.jpg'),(4,'Canon','EOS 500D 55mm','3GB','5 Megapixel','New','Sumit Anand',0,'Camcoder','images/bin.gif',5090,27,5117,'images/cameras/canon.jpg'),(5,'Olympus','','6GB','6.2 Meapixel','Used','',0,'SLR','Auction',4000,0,4000,''),(6,'Nikon','L22-12MP','4GB','3.8 Megapixel','Used','Rohit Sharma',0,'Flash','images/bin.gif',6645,32,6677,'images/cameras/nikon.jpg');
/*!40000 ALTER TABLE `camera_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_details` (
  `user_id` varchar(50) NOT NULL,
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_details`
--

LOCK TABLES `cart_details` WRITE;
/*!40000 ALTER TABLE `cart_details` DISABLE KEYS */;
INSERT INTO `cart_details` VALUES ('samrat',1,'Sony Ericsson',18,4095,4125),('samrat',4,'Sony Ericsson',3,2300,2325),('samrat',2,'Sony Ericsson',6,4995,5070);
/*!40000 ALTER TABLE `cart_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_details`
--

DROP TABLE IF EXISTS `category_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_details` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_details`
--

LOCK TABLES `category_details` WRITE;
/*!40000 ALTER TABLE `category_details` DISABLE KEYS */;
INSERT INTO `category_details` VALUES (1,'book'),(2,'camera'),(3,'clothing'),(4,'computer'),(5,'electric'),(6,'jewellery'),(7,'mobile'),(8,'storage_device');
/*!40000 ALTER TABLE `category_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clothing_details`
--

DROP TABLE IF EXISTS `clothing_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clothing_details` (
  `clothing_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(40) NOT NULL,
  `condition` varchar(20) NOT NULL,
  `apparel` varchar(30) NOT NULL,
  `clothing_type` varchar(30) NOT NULL,
  `sellers_name` varchar(50) NOT NULL,
  `color` varchar(20) NOT NULL,
  `fabric` varchar(30) NOT NULL,
  `buying_format` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `shipping__price` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image` blob NOT NULL,
  PRIMARY KEY (`clothing_id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clothing_details`
--

LOCK TABLES `clothing_details` WRITE;
/*!40000 ALTER TABLE `clothing_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `clothing_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer_details`
--

DROP TABLE IF EXISTS `computer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computer_details` (
  `computer_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `condition` varchar(20) NOT NULL,
  `processor_speed` varchar(20) DEFAULT NULL,
  `memory` varchar(20) DEFAULT NULL,
  `processor` varchar(30) DEFAULT NULL,
  `ram` varchar(20) DEFAULT NULL,
  `primary_drive` varchar(30) DEFAULT NULL,
  `category` varchar(40) NOT NULL,
  `sellers_name` varchar(50) NOT NULL,
  `buying_format` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `shipping_price` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `total_price` int(11) NOT NULL,
  `feature` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`computer_id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer_details`
--

LOCK TABLES `computer_details` WRITE;
/*!40000 ALTER TABLE `computer_details` DISABLE KEYS */;
INSERT INTO `computer_details` VALUES (1,'Acer','Aspire-IE3540_c3b79','New','1600','160 GB','Intel Dual Core','2 GB','DVD +/- RW','Desktop','Sarika Hablani','images/bin.gif',0,60,19000,'images/computers/laptops/Compaq-CQ3340IX_9219a.jpg',19060,'Web Cam, Altec Lansac Speakers, 4 USB ports, W-Lan, Carrying Case'),(2,'Asus','R105D-BLK009S_6aa77','New','1400','160 GB','Intel Core 2 Duo','3 GB','DVD +/- RW','Laptop','Samrat Dutta','images/bin.gif',0,54,18056,'images/computers/laptops/Asus_R105D-BLK009S_6aa77.jpg',18110,'9 cell Batery, Web Cam, W-Lan, Carrying Case'),(3,'Apple','Mac_DHGS65SHDG-dd','New','1900','320 GB','Intel Core 2 Duo','4 GB','DVD +/- RW','Ipad','Sumit Anand','images/bin.gif',0,70,20800,'images/computers/laptops/Toshiba_AC100-T1A10_36d02.jpg',20870,'15\" screen, Bose Speakers, Web Cam, WLan Supported'),(4,'HCL','p-ca-d-hcl-ezeebee-dl1-front-1_wm','New','1700','320 GB','i3','3 GB','CD RW','ThinkPad','Megha Agarwal','Auction',0,300,21365,'images/computers/laptops/p-ca-d-hcl-ezeebee-dl1-front-1_wm.jpg',21395,'!5\" screen, WLan Supported, Web Cam, Long Battery backup, 6 cell battery'),(5,'Compaq','CQ1-1020IX_56cd9','New','1500','180 GB','Intel Celeron Core','3 GB','DVD RW','NetBook','Pooja Sinha','images/bin.gif',0,65,26000,'images/computers/laptops/Compaq-CQ1-1020IX_56cd9.jpg',26065,'Web Cam, Carrying Case, 3 USB ports, Extended Warranty, 9 cell battery');
/*!40000 ALTER TABLE `computer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ebay_payment_details`
--

DROP TABLE IF EXISTS `ebay_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ebay_payment_details` (
  `item_id` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `seller_id` varchar(50) NOT NULL,
  `buyer_id` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_to_be_made` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ebay_payment_details`
--

LOCK TABLES `ebay_payment_details` WRITE;
/*!40000 ALTER TABLE `ebay_payment_details` DISABLE KEYS */;
INSERT INTO `ebay_payment_details` VALUES (5,4200,'2011-04-01','Pooja Sinha','samrat',1,4200),(7,3055,'2011-04-01','Romika Gupta','rohit',1,3055),(8,3130,'2011-04-04','Sumit Anand','rohit',1,3130),(8,3130,'2011-04-04','Sumit Anand','rohit',1,3130),(8,3130,'2011-04-04','Sumit Anand','rohit',1,3130),(8,3130,'2011-04-04','Sumit Anand','rohit',1,3130),(8,3130,'2011-04-04','Sumit Anand','rohit',1,3130),(8,3130,'2011-04-04','Sumit Anand','rohit',1,3130),(8,3130,'2011-04-04','Sumit Anand','rohit',1,3130),(2,5070,'2011-04-04','Samrat Dutta','rohit',1,5070),(7,3055,'2011-04-04','Romika Gupta','rohit',1,3055),(8,3130,'2011-04-04','Sumit Anand','rohit',1,3130),(2,5070,'2011-04-04','Samrat Dutta','rohit',1,5070),(0,0,'2011-04-05','null','samrat',0,0),(6,2927,'2011-04-05','Sarika Hablani','samrat',1,2927),(1,4125,'2011-04-05','Rohit Sharma','samrat',1,4125),(4,9300,'2011-04-05','Megha Agarwal','samrat',1,9300),(4,9300,'2011-04-05','Megha Agarwal','samrat',1,9300),(1,8250,'2011-04-06','Rohit Sharma','samrat',1,8250),(1,20625,'2011-04-06','Rohit Sharma','samrat',1,20625),(1,41250,'2011-04-06','Rohit Sharma','rohit',1,41250),(1,41250,'2011-04-06','Rohit Sharma','samrat',1,41250),(6,8781,'2011-04-06','Sarika Hablani','samrat',1,8781),(5,16800,'2011-04-06','Pooja Sinha','samrat',1,16800),(1,8250,'2011-04-06','Rohit Sharma','samrat',1,8250),(2,30420,'2011-04-06','Samrat Dutta','rohit',1,30420),(2,30420,'2011-04-06','Samrat Dutta','samrat',1,30420),(1,16500,'2011-04-06','Rohit Sharma','rohit',1,16500),(1,74250,'2011-04-06','Rohit Sharma','samrat',1,74250),(1,4125,'2011-04-10','Rohit Sharma','rohit',0,4125),(1,4125,'2011-04-10','Rohit Sharma','rohit',0,4125),(8,3130000,'2011-04-10','Sumit Anand','rohit',-28,3130000);
/*!40000 ALTER TABLE `ebay_payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electric_details`
--

DROP TABLE IF EXISTS `electric_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `electric_details` (
  `electric_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(20) NOT NULL,
  `name` varchar(40) NOT NULL,
  `condition` varchar(20) NOT NULL,
  `category` varchar(40) NOT NULL,
  `buying_format` varchar(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sellers_name` varchar(50) NOT NULL,
  `shipping_price` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `feature` varchar(300) NOT NULL,
  PRIMARY KEY (`electric_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electric_details`
--

LOCK TABLES `electric_details` WRITE;
/*!40000 ALTER TABLE `electric_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `electric_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jewellery_details`
--

DROP TABLE IF EXISTS `jewellery_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jewellery_details` (
  `jewellery_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `metal` varchar(20) NOT NULL,
  `gemstone` varchar(20) DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `condition` varchar(20) NOT NULL,
  `category` varchar(30) NOT NULL,
  `sellers_name` varchar(50) NOT NULL,
  `shipping_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `buying_format` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`jewellery_id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jewellery_details`
--

LOCK TABLES `jewellery_details` WRITE;
/*!40000 ALTER TABLE `jewellery_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `jewellery_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_details`
--

DROP TABLE IF EXISTS `login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_details` (
  `user_id` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `secret_question` varchar(50) NOT NULL,
  `secret_answer` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_details`
--

LOCK TABLES `login_details` WRITE;
/*!40000 ALTER TABLE `login_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_details`
--

DROP TABLE IF EXISTS `mobile_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobile_details` (
  `mobile_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(20) NOT NULL,
  `model_number` varchar(10) NOT NULL,
  `sim_option` varchar(20) NOT NULL,
  `type` varchar(30) DEFAULT NULL,
  `condition` varchar(30) NOT NULL,
  `network_standard` varchar(20) DEFAULT NULL,
  `camera` varchar(30) DEFAULT NULL,
  `buying_format` varchar(50) NOT NULL,
  `sellers_name` varchar(50) NOT NULL,
  `shipping_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `feature` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`mobile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_details`
--

LOCK TABLES `mobile_details` WRITE;
/*!40000 ALTER TABLE `mobile_details` DISABLE KEYS */;
INSERT INTO `mobile_details` VALUES (1,'Sony Ericsson','Aspen','Dual Sim','Standard','New','GSM','2.3 Megapixel','images/bin.gif','Rohit Sharma',30,0,'images/mobiles/sonyericsson/SonyEricsson-Aspen.jpg',4095,4125,'Touchpad, Bluetooth, Infrared, GPRS'),(2,'Sony Ericsson','Cedar','Single Sim','Standard','New','GSM','2.2 Megapixel','images/bin.gif','Samrat Dutta',75,-6,'images/mobiles/sonyericsson/SonyEricsson-Cedar.jpg',4995,5070,'Feather touch, Bluetooth, Infrared, MP3, MMS'),(3,'Sony Ericsson','Hazel','Single Sim','Flipphone','New','CDMA','1 Megapixel','images/bin.gif','Rohit Sharma',20,6,'images/mobiles/sonyericsson/sony-ericsson-hazel.jpg',2105,2125,'MMS, MP3, Wireless, Infrared'),(4,'Sony Ericsson','Jalou','Dual Sim','Slide','Used','GSM','1.2 Megapixel','images/bid.jpg','Megha Agarwal',25,1,'images/mobiles/sonyericsson/sony-ericsson-jalou.jpg',2300,2325,'Bluetooth, Infrared, MP3'),(5,'Sony Ericsson','Satio','Dual Sim','Standard','New','GSM','2.3 Megapixel','images/bin.gif','Pooja Sinha',40,-4,'images/mobiles/sonyericsson/sony-ericsson-satio.jpg',4120,4200,'Bluetooth, Infrared, MP3, MMS, GPS'),(6,'Nokia','2730','Single Sim','Standard','Used','GSM','1 Megapixel','images/bid.jpg','Sarika Hablani',27,6,'images/mobiles/nokia/nokia-2730.jpg',2900,2927,'MP3, Bluetooth, MMS'),(7,'Nokia','5030','Single Sim','Standard','Used','GSM','2 Megapixel','images/bid.jpg','Romika Gupta',55,5,'images/mobiles/nokia/nokia-5030.jpg',3000,3055,'MP3, Bluetooth, WAP, GPS'),(8,'Nokia','5230','Single Sim','Standard','New','GSM','1.3 Megapixel','images/bin.gif','Sumit Anand',40,0,'images/mobiles/nokia/nokia-5230.jpg',3090,3130,'Bluetooth, Infrared, MP3, WAP, MMS'),(9,'Nokia','5330','Dual Sim','Standard','New','GSM','2.1 Megapixel','images/bin.gif','Sarika Hablani',70,6,'images/mobiles/nokia/nokia-5330.jpg',5900,5970,'Bluetooth, Infrared, MMS, MP3, WAP'),(10,'Samsung','Corbyplus','Single Sim','Flipphone','Usd','GSM','1.2 Megapixel','images/bin.gif','Sumit Anand',60,6,'images/mobiles/samsung/samsung-corbyplus-b3410.jpg',10000,10060,'MP3, MMS, WAP, Bluetooth, Infrared, Extended Memory Card, Touch pad, GPS'),(11,'Samsung','i8000','Dual Sim','Smartphone','Used','GSM','2.3 Megapixel','images/bid.jpg','Samrat Dutta',80,6,'images/mobiles/samsung/samsung-i8000.jpg',10450,10530,'Bluetooth, MP3, MMS, USB connector, WAP, GPS'),(12,'B100','Test','Dual sim','new','new','CDMA','1 megapixel','images/bid.jpg','dinesha',60,6,'images/mobiles/nokia/nokia-c3.jpg',6000,6060,'Bluetooth'),(14,'Nokia','Nokia 3090','Dual','Flip','new','GSM','3.2 MP','buyitnow','Rohit',50,10,'',10000,10050,'');
/*!40000 ALTER TABLE `mobile_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paisa_pay`
--

DROP TABLE IF EXISTS `paisa_pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paisa_pay` (
  `account_holder_name` varchar(30) NOT NULL,
  `buyer_account_number` varchar(30) NOT NULL,
  `micr_code` varchar(30) NOT NULL,
  `bank_account_number` varchar(30) NOT NULL,
  `bank_name` varchar(30) NOT NULL,
  PRIMARY KEY (`bank_account_number`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paisa_pay`
--

LOCK TABLES `paisa_pay` WRITE;
/*!40000 ALTER TABLE `paisa_pay` DISABLE KEYS */;
INSERT INTO `paisa_pay` VALUES ('Sumit','null','673476','734783684637278','b3');
/*!40000 ALTER TABLE `paisa_pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_details` (
  `payee_name` varchar(50) NOT NULL,
  `transaction_details` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `available_balance` int(11) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `date` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_details`
--

LOCK TABLES `payment_details` WRITE;
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
INSERT INTO `payment_details` VALUES ('samrat','Sony Ericsson',4095,0,'null','','2011/03/18 02:41:14'),('samrat','Sony Ericsson',4095,0,'null','','2011/03/18 02:42:03'),('samrat','Sony Ericsson',4095,0,'null','','2011/03/18 02:59:50'),('samrat','Sony Ericsson',4995,0,'null','','2011/03/18 03:02:52'),('samrat','Sony Ericsson',4995,0,'null','','2011/03/18 03:05:36'),('samrat','Sony Ericsson',4095,0,'null','','2011/03/18 03:10:31'),('rohit','Sony Ericsson',4095,0,'null','','2011/03/18 03:22:23'),('rohit','Sony Ericsson',4095,0,'null','','2011/03/18 03:24:30'),('rohit','Sony Ericsson',4095,0,'null','','2011/03/18 03:25:53'),('rohit','Sony Ericsson',4095,0,'null','','2011/03/18 03:33:28'),('rohit','Sony Ericsson',4095,0,'null','','2011/03/18 03:41:11'),('rohit','Sony Ericsson',4095,0,'null','','2011/03/18');
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_payment_details`
--

DROP TABLE IF EXISTS `seller_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_payment_details` (
  `seller_id` varchar(50) NOT NULL,
  `item_id` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `dispatch_date` date NOT NULL,
  `receive_date` date NOT NULL,
  `buyer_id` varchar(50) NOT NULL,
  `available_balance` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_payment_details`
--

LOCK TABLES `seller_payment_details` WRITE;
/*!40000 ALTER TABLE `seller_payment_details` DISABLE KEYS */;
INSERT INTO `seller_payment_details` VALUES ('Pooja Sinha',5,2000,'2011-04-05','2011-04-03','samrat',73700),('Romika Gupta',7,1000,'2011-04-01','2011-04-08','samrat',9110);
/*!40000 ALTER TABLE `seller_payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_device_details`
--

DROP TABLE IF EXISTS `storage_device_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage_device_details` (
  `storage_device_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `memory` varchar(20) DEFAULT NULL,
  `condition` varchar(20) NOT NULL,
  `sellers_name` varchar(50) NOT NULL,
  `category` varchar(40) NOT NULL,
  `shipping_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `buying_format` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`storage_device_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_device_details`
--

LOCK TABLES `storage_device_details` WRITE;
/*!40000 ALTER TABLE `storage_device_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_device_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `user_id` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `home_address` varchar(100) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `pin_code` varchar(20) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `secret_question` varchar(100) NOT NULL,
  `secret_answer` varchar(100) NOT NULL,
  `cid` bigint(10) DEFAULT NULL,
  `cstatus` int(2) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `home_address` (`home_address`,`phone_no`,`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES ('samrat','Samrat','Dutta','Salt Lake','Kolkata','WB','India','700064','8880517858','samrat.dutta@iiitb.org','5-1-1988','delhiites','1','sachin',NULL,NULL),('rohit','Rohit','Sharma','Nehrunagar','Bhopal','MP','India','565654','9887678678','rohit.sharma@iiitb.org','9-4-1986','rohit','1','yuvraj',NULL,NULL),('mohit187','Mohit','Chawda','electronics city','Bangalore','KA','India','560100','8951071951','mohit187@yahoo.co.in','18-7-1988','mohit','3','aamir khan',NULL,NULL),('shatakirti','shatakirti','reddy','electronics city IIITB','Bangalore','KA','India','560100','9329419903','mohitchawda@gmail.com','2-4-1988','shata','1','sachin',9822881790,1);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-04-02 16:44:43
