CREATE DATABASE  IF NOT EXISTS `ev_db` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ev_db`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ev_db
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `admin_charging_station_list`
--

DROP TABLE IF EXISTS `admin_charging_station_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_charging_station_list` (
  `station_id` int NOT NULL AUTO_INCREMENT,
  `Station_name` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` char(20) NOT NULL,
  `Charger_type` char(20) NOT NULL,
  `Available_ports` varchar(50) NOT NULL,
  `Status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_charging_station_list`
--

LOCK TABLES `admin_charging_station_list` WRITE;
/*!40000 ALTER TABLE `admin_charging_station_list` DISABLE KEYS */;
INSERT INTO `admin_charging_station_list` VALUES (1,'ABC Charging Station','123 Main St','Thiruvananthapuram','AC Level 1 Charging','4','active'),(2,'XYZ Charging Station','456 Elm St','Kollam','AC Level 2 Charging','2',''),(3,'123 Charging Station','789 Oak St','Pathanamthitta','DC Fast Charging','6','active'),(4,'456 Charging Station','1011 Pine St','Alappuzha','AC Level 1 Charging','3',''),(5,'789 Charging Station','1213 Maple St','Kottayam','AC Level 2 Charging','1','active'),(6,'DEF Charging Station','1415 Cedar St','Idukki','DC Fast Charging','5','active'),(7,'GHI Charging Station','1617 Birch St','Ernakulam','AC Level 1 Charging','2',''),(8,'JKL Charging Station','1819 Spruce St','Thrissur','AC Level 2 Charging','4','active'),(9,'MNO Charging Station','2021 Walnut St','Palakkad','DC Fast Charging','3',''),(10,'PQR Charging Station','2223 Pineapple St','Malappuram','AC Level 1 Charging','1','active'),(11,'ABC Charging Station','123 Main St','Kozhikode','AC Level 1 Charging','4','active'),(12,'XYZ Charging Station','456 Elm St','Wayanad','AC Level 2 Charging','2',''),(13,'123 Charging Station','789 Oak St','Kannur','DC Fast Charging','6','active'),(14,'456 Charging Station','1011 Pine St','Kasaragod','AC Level 1 Charging','3',''),(15,'789 Charging Station','1213 Maple St','Thiruvananthapuram','AC Level 2 Charging','1','active'),(16,'DEF Charging Station','1415 Cedar St','Kollam','DC Fast Charging','5','active'),(17,'GHI Charging Station','1617 Birch St','Pathanamthitta','AC Level 1 Charging','2',''),(18,'JKL Charging Station','1819 Spruce St','Alappuzha','AC Level 2 Charging','4','active'),(19,'MNO Charging Station','2021 Walnut St','Kottayam','DC Fast Charging','3',''),(20,'PQR Charging Station','2223 Pineapple St','Idukki','AC Level 1 Charging','1','active'),(21,'ABC Charging Station','123 Main St','Ernakulam','AC Level 1 Charging','4','active'),(51,'KLM Charging Station','3035 Laurel St','Thrissur','AC Level 2 Charging','3','active'),(52,'STU Charging Station','3237 Ash St','Kollam','DC Fast Charging','2',''),(53,'VWX Charging Station','3439 Cedar St','Kottayam','AC Level 1 Charging','4','active'),(54,'YZA Charging Station','3641 Elm St','Ernakulam','AC Level 2 Charging','5','active'),(55,'BCD Charging Station','3843 Birch St','Thiruvananthapuram','DC Fast Charging','2',''),(56,'EFG Charging Station','4045 Oak St','Alappuzha','AC Level 1 Charging','1','active'),(57,'HIJ Charging Station','4247 Pine St','Palakkad','AC Level 2 Charging','3',''),(58,'KLM Charging Station','4449 Walnut St','Malappuram','DC Fast Charging','6','active'),(59,'NOP Charging Station','4651 Maple St','Kannur','AC Level 1 Charging','4','active'),(60,'QRS Charging Station','4853 Pineapple St','Kozhikode','AC Level 2 Charging','2',''),(61,'TUV Charging Station','5055 Oakwood St','Thrissur','DC Fast Charging','3','active'),(62,'WXYZ Charging Station','5257 Chestnut St','Kollam','AC Level 1 Charging','5',''),(63,'ABC2 Charging Station','5459 Walnut St','Kottayam','AC Level 2 Charging','1','active'),(64,'DEF2 Charging Station','5661 Cedar St','Ernakulam','DC Fast Charging','4','active'),(65,'GHI2 Charging Station','5863 Elm St','Thiruvananthapuram','AC Level 1 Charging','2',''),(66,'JKL2 Charging Station','6065 Pine St','Alappuzha','AC Level 2 Charging','3','active'),(67,'MNO2 Charging Station','6267 Oak St','Palakkad','DC Fast Charging','6',''),(68,'PQR2 Charging Station','6469 Pineapple St','Malappuram','AC Level 1 Charging','1','active'),(69,'STU2 Charging Station','6671 Walnut St','Kannur','AC Level 2 Charging','4','');
/*!40000 ALTER TABLE `admin_charging_station_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `Station_name` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Available_ports` varchar(11) NOT NULL,
  `Booking_date` date NOT NULL,
  `Time_from` time NOT NULL,
  `Time_to` time NOT NULL,
  `Created_id` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `login_id` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `login_id` (`login_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (5,'ABC Charging Station','Thiruvananthapuram','4','2024-10-26','14:48:00','18:49:00','2024-10-26 09:19:04',32),(6,'ABC Charging Station','Thiruvananthapuram','4','2024-10-26','14:48:00','18:49:00','2024-10-26 09:19:06',32);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_station_booking`
--

DROP TABLE IF EXISTS `charging_station_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_station_booking` (
  `id` int NOT NULL,
  `charging_station_id` int NOT NULL,
  `user_id` int NOT NULL,
  `booking_start_time` datetime NOT NULL,
  `booking_end_time` datetime NOT NULL,
  `status` enum('Active','Cancelled','Completed') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_station_booking`
--

LOCK TABLES `charging_station_booking` WRITE;
/*!40000 ALTER TABLE `charging_station_booking` DISABLE KEYS */;
INSERT INTO `charging_station_booking` VALUES (1,1,1,'2022-01-01 10:00:00','2022-01-01 12:00:00','Completed'),(2,2,2,'2022-01-02 13:00:00','2022-01-02 15:00:00','Cancelled'),(3,3,3,'2022-01-03 16:00:00','2022-01-03 18:00:00','Active'),(4,4,4,'2022-01-04 19:00:00','2022-01-04 21:00:00','Active'),(5,5,5,'2022-01-05 22:00:00','2022-01-05 23:00:00','Completed'),(6,6,6,'2022-01-06 10:00:00','2022-01-06 11:00:00','Completed'),(7,7,7,'2022-01-07 12:00:00','2022-01-07 13:00:00','Active'),(8,8,8,'2022-01-08 14:00:00','2022-01-08 16:00:00','Cancelled'),(9,9,9,'2022-01-09 17:00:00','2022-01-09 19:00:00','Active'),(10,10,10,'2022-01-10 20:00:00','2022-01-10 22:00:00','Completed');
/*!40000 ALTER TABLE `charging_station_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charging_station_list`
--

DROP TABLE IF EXISTS `charging_station_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charging_station_list` (
  `id` int NOT NULL,
  `station_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` char(100) NOT NULL,
  `charger_type` char(20) NOT NULL,
  `available_ports` int NOT NULL,
  `status` enum('Active','Under Maintenance','Out of Service') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_station_list`
--

LOCK TABLES `charging_station_list` WRITE;
/*!40000 ALTER TABLE `charging_station_list` DISABLE KEYS */;
INSERT INTO `charging_station_list` VALUES (1,'ABC Charging Station','123 Main St','Thiruvananthapuram','AC Level 1 Charging',4,'Active'),(2,'XYZ Charging Station','456 Elm St','Kollam','AC Level 2 Charging',2,'Active'),(3,'123 Charging Station','789 Oak St','Pathanamthitta','DC Fast Charging',6,'Active'),(4,'456 Charging Station','1011 Pine St','Alappuzha','AC Level 1 Charging',3,'Active'),(5,'789 Charging Station','1213 Maple St','Kottayam','AC Level 2 Charging',1,'Active'),(6,'DEF Charging Station','1415 Cedar St','Idukki','DC Fast Charging',5,'Active'),(7,'GHI Charging Station','1617 Birch St','Ernakulam','AC Level 1 Charging',2,'Active'),(8,'JKL Charging Station','1819 Spruce St','Thrissur','AC Level 2 Charging',4,'Active'),(9,'MNO Charging Station','2021 Walnut St','Palakkad','DC Fast Charging',3,'Active'),(10,'PQR Charging Station','2223 Pineapple St','Malappuram','AC Level 1 Charging',1,'Active'),(11,'ABC Charging Station','123 Main St','Kozhikode','AC Level 1 Charging',4,'Active'),(12,'XYZ Charging Station','456 Elm St','Wayanad','AC Level 2 Charging',2,'Active'),(13,'123 Charging Station','789 Oak St','Kannur','DC Fast Charging',6,'Active'),(14,'456 Charging Station','1011 Pine St','Kasaragod','AC Level 1 Charging',3,'Active'),(15,'789 Charging Station','1213 Maple St','Thiruvananthapuram','AC Level 2 Charging',1,'Active'),(16,'DEF Charging Station','1415 Cedar St','Kollam','DC Fast Charging',5,'Active'),(17,'GHI Charging Station','1617 Birch St','Pathanamthitta','AC Level 1 Charging',2,'Active'),(18,'JKL Charging Station','1819 Spruce St','Alappuzha','AC Level 2 Charging',4,'Active'),(19,'MNO Charging Station','2021 Walnut St','Kottayam','DC Fast Charging',3,'Active'),(20,'PQR Charging Station','2223 Pineapple St','Idukki','AC Level 1 Charging',1,'Active'),(21,'ABC Charging Station','123 Main St','Ernakulam','AC Level 1 Charging',4,'Active'),(51,'KLM Charging Station','3035 Laurel St','Thrissur','AC Level 2 Charging',3,'Active'),(52,'STU Charging Station','3237 Ash St','Kollam','DC Fast Charging',2,'Active'),(53,'VWX Charging Station','3439 Cedar St','Kottayam','AC Level 1 Charging',4,'Active'),(54,'YZA Charging Station','3641 Elm St','Ernakulam','AC Level 2 Charging',5,'Active'),(55,'BCD Charging Station','3843 Birch St','Thiruvananthapuram','DC Fast Charging',2,'Active'),(56,'EFG Charging Station','4045 Oak St','Alappuzha','AC Level 1 Charging',1,'Active'),(57,'HIJ Charging Station','4247 Pine St','Palakkad','AC Level 2 Charging',3,'Active'),(58,'KLM Charging Station','4449 Walnut St','Malappuram','DC Fast Charging',6,'Active'),(59,'NOP Charging Station','4651 Maple St','Kannur','AC Level 1 Charging',4,'Active'),(60,'QRS Charging Station','4853 Pineapple St','Kozhikode','AC Level 2 Charging',2,'Active'),(61,'TUV Charging Station','5055 Oakwood St','Thrissur','DC Fast Charging',3,'Active'),(62,'WXYZ Charging Station','5257 Chestnut St','Kollam','AC Level 1 Charging',5,'Active'),(63,'ABC2 Charging Station','5459 Walnut St','Kottayam','AC Level 2 Charging',1,'Active'),(64,'DEF2 Charging Station','5661 Cedar St','Ernakulam','DC Fast Charging',4,'Active'),(65,'GHI2 Charging Station','5863 Elm St','Thiruvananthapuram','AC Level 1 Charging',2,'Active'),(66,'JKL2 Charging Station','6065 Pine St','Alappuzha','AC Level 2 Charging',3,'Active'),(67,'MNO2 Charging Station','6267 Oak St','Palakkad','DC Fast Charging',6,'Active'),(68,'PQR2 Charging Station','6469 Pineapple St','Malappuram','AC Level 1 Charging',1,'Active'),(69,'STU2 Charging Station','6671 Walnut St','Kannur','AC Level 2 Charging',4,'Active'),(70,'VWX2 Charging Station','6873 Cedar St','Kozhikode','DC Fast Charging',5,'Active'),(71,'YZA2 Charging Station','7075 Ash St','Thrissur','AC Level 1 Charging',3,'Active');
/*!40000 ALTER TABLE `charging_station_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_us`
--

DROP TABLE IF EXISTS `contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_us` (
  `Sl_no` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Feedback_date` date NOT NULL,
  `Feedback` varchar(100) NOT NULL,
  PRIMARY KEY (`Sl_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_us`
--

LOCK TABLES `contact_us` WRITE;
/*!40000 ALTER TABLE `contact_us` DISABLE KEYS */;
INSERT INTO `contact_us` VALUES (1,'dummy','dummy@gmail.com','2024-10-26','dummy feedback\r\n');
/*!40000 ALTER TABLE `contact_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `login_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `usertype` enum('admin','user') NOT NULL DEFAULT 'user',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (29,'admin','123','admin'),(32,'user','user','user'),(33,'janedoe','zxcvbnm','user'),(34,'admin','adminpass','user'),(35,'testuser','testpass','user'),(36,'guest','guestpass','user'),(37,'user3','pass789','user');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (29,'John Doe','johndoe@example.com'),(30,'Jane Smith','janesmith@example.com'),(31,'Bob Johnson','bjohnson@example.com'),(32,'Sara Lee','saralee@example.com'),(33,'Maxwell Smart','msmart@example.com'),(34,'Lucy Liu','lucyliu@example.com'),(35,'Jack Black','jblack@example.com'),(36,'Amy Adams','aadams@example.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_dashboard`
--

DROP TABLE IF EXISTS `user_dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_dashboard` (
  `booking_date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `station` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_dashboard`
--

LOCK TABLES `user_dashboard` WRITE;
/*!40000 ALTER TABLE `user_dashboard` DISABLE KEYS */;
INSERT INTO `user_dashboard` VALUES ('2023-04-27','10:00:00','New York','Station A'),('2023-04-27','14:30:00','San Francisco','Station B'),('2023-04-28','09:15:00','London','Station C'),('2023-04-28','16:00:00','Paris','Station D'),('2023-04-29','11:45:00','Sydney','Station E'),('2023-04-29','15:30:00','Tokyo','Station F'),('2023-04-30','13:00:00','Dubai','Station G'),('2023-04-30','18:45:00','Mumbai','Station H'),('2023-05-01','10:30:00','Berlin','Station I'),('2023-05-01','14:15:00','Toronto','Station J'),('2023-05-02','12:00:00','Hong Kong','Station K'),('2023-05-02','17:30:00','Chicago','Station L'),('2023-05-03','08:45:00','Barcelona','Station M'),('2023-05-03','13:15:00','Melbourne','Station N'),('2023-05-04','11:00:00','Seoul','Station O');
/*!40000 ALTER TABLE `user_dashboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `user_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,'admin','admin','admin@example.com','+1-555-555-5555','123 Main St, Anytown, USA'),(2,'Jane','Smith','janesmith@example.com','+1-555-555-5555','456 Elm St, Anytown, USA'),(3,'Bob','Johnson','bobjohnson@example.com','+1-555-555-5555','789 Oak St, Anytown, USA'),(4,'Alice','Williams','alicewilliams@example.com','+1-555-555-5555','321 Pine St, Anytown, USA'),(5,'David','Brown','davidbrown@example.com','+1-555-555-5555','654 Cedar St, Anytown, USA'),(6,'Sarah','Davis','sarahdavis@example.com','+1-555-555-5555','987 Maple St, Anytown, USA'),(7,'Michael','Wilson','michaelwilson@example.com','+1-555-555-5555','456 Birch St, Anytown, USA'),(8,'Amy','Lee','amylee@example.com','+1-555-555-5555','789 Walnut St, Anytown, USA'),(9,'Kevin','Jones','kevinjones@example.com','+1-555-555-5555','123 Oak St, Anytown, USA'),(10,'Emily','Taylor','emilytaylor@example.com','+1-555-555-5555','456 Maple St, Anytown, USA');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-26 15:50:42
