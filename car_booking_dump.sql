-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: car_booking
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `car_type` varchar(255) NOT NULL,
  `pickup_date` date NOT NULL,
  `return_date` date NOT NULL,
  `pickup_location` varchar(255) NOT NULL,
  `return_location` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `booking_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'sam ham','small','2023-03-30','2023-03-31','smouha','miami',9.00,'','2023-03-25'),(2,'nat pat','small','2023-03-30','2023-03-31','smouha','miami',100.00,'','2023-03-25'),(3,'nat pat','family','2023-03-30','2023-03-31','smouha','miami',160.00,'','2023-03-25'),(4,'kim mon','family','2023-03-30','2023-03-31','smouha','miami',160.00,'','2023-03-25'),(5,'kim mon','family','2023-03-30','2023-03-31','smouha','smouha',160.00,'','2023-03-25'),(6,'kim mon','van','2023-03-30','2023-03-31','smouha','miami',240.00,'','2023-03-25'),(7,'joe bar','family','2023-03-30','2023-03-31','smouha','miami',160.00,'','2023-03-25'),(8,'jan pam','van','2023-03-30','2023-03-31','smouha','miami',240.00,'','2023-03-25'),(9,'nat pat','family','2023-03-30','2023-03-31','smouha','miami',160.00,'Credit Card','2023-03-25'),(10,'nat pat','van','2023-03-30','2023-03-31','smouha','miami',240.00,'Credit Card','2023-03-25'),(11,'sam ham','family','2023-03-30','2023-03-31','smouha','miami',160.00,'Credit Card','2023-03-25'),(12,'joe bar','small','2023-03-30','2023-03-31','smouha','miami',100.00,'Credit Card','2023-03-25'),(13,'yo gh','family','2023-03-30','2023-03-31','smouha','miami',160.00,'Credit Card','2023-03-25'),(14,'nat pat','van','2023-03-30','2023-03-31','smouha','miami',240.00,'Credit Card','2023-03-25'),(15,'kim mon','small','2023-03-30','2023-03-31','smouha','miami',100.00,'Credit Card','2023-03-25'),(16,'yo gh','family','2023-03-30','2023-03-31','smouha','miami',160.00,'Credit Card','2023-03-25'),(17,'sam ham','van','2023-03-30','2023-03-31','smouha','miami',240.00,'Credit Card','2023-03-25'),(18,'nat pat','small','2023-03-30','2023-03-31','smouha','miami',100.00,'Credit Card','2023-03-25'),(19,'joe bar','small','2023-03-30','2023-03-31','smouha','miami',100.00,'Credit Card','2023-03-25'),(20,'nat pat','family','2023-03-30','2023-03-31','smouha','miami',160.00,'Credit Card','2023-03-25'),(21,'kim mon','family','2023-03-30','2023-03-31','smouha','miami',160.00,'Credit Card','2023-03-25'),(22,'sam ham','family','2023-03-30','2023-03-31','smouha','miami',160.00,'Credit Card','2023-03-25'),(23,'nat pat','family','2023-03-30','2023-03-31','smouha','miami',160.00,'Credit Card','2023-03-25'),(24,'nat pat','small','2023-03-30','2023-03-31','smouha','miami',100.00,'Credit Card','2023-03-25'),(25,'kim mon','van','2023-03-30','2023-03-31','smouha','miami',240.00,'Credit Card','2023-03-25'),(26,'joe bar','van','2023-03-30','2023-03-31','smouha','miami',240.00,'Credit Card','2023-03-25'),(27,'nat pat','small','2023-03-30','2023-03-31','smouha','miami',100.00,'Credit Card','2023-03-25'),(28,'kim mon','family','2023-03-30','2023-03-31','smouha','miami',160.00,'Credit Card','2023-03-25'),(29,'kim mon','family','2023-03-30','2023-03-31','smouha','miami',160.00,'Credit Card','2023-03-25'),(30,'John Doe','family car','2023-04-01','2023-04-05','London','Manchester',200.00,'credit card','2023-03-25'),(31,'kim mon','family','2023-03-28','2023-03-29','smouha','miami',160.00,'Credit Card','2023-03-25'),(32,'joe bar','small','2023-03-28','2023-03-29','smouha','miami',100.00,'Credit Card','2023-03-25'),(33,'kim mon','family','2023-03-28','2023-03-29','smouha','miami',160.00,'Credit Card','2023-03-25'),(34,'sam lam','small','2023-03-28','2023-03-29','smouha','miami',100.00,'Credit Card','2023-03-25'),(35,'jan pam','family','2023-03-28','2023-03-30','smouha','miami',240.00,'Credit Card','2023-03-25'),(36,'sam lam','small','2023-03-28','2023-03-29','smouha','miami',100.00,'Credit Card','2023-03-25'),(37,'joe bar','small','2023-03-29','2023-03-30','smouha','miami',100.00,'Credit Card','2023-03-28');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_cars_list` AFTER INSERT ON `bookings` FOR EACH ROW BEGIN
    UPDATE cars_list SET availability = 'booked'
    WHERE type = NEW.car_type;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `car_id` int NOT NULL AUTO_INCREMENT,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `year` year NOT NULL,
  `mileage` int NOT NULL,
  `fuel_type` varchar(50) NOT NULL,
  `seats` int NOT NULL,
  `price_per_day` decimal(10,2) NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'Honda','Civic',2022,1000,'gasoline',5,50.00,'small'),(2,'Toyota','Camry',2021,5000,'gasoline',5,60.00,'medium'),(3,'Ford','Transit',2022,1000,'Diesel',12,100.00,'large');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars_list`
--

DROP TABLE IF EXISTS `cars_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_list` (
  `id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `availability` enum('available','booked') DEFAULT 'available',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_list`
--

LOCK TABLES `cars_list` WRITE;
/*!40000 ALTER TABLE `cars_list` DISABLE KEYS */;
INSERT INTO `cars_list` VALUES (1,'van','available'),(2,'van','available'),(3,'family car','booked'),(4,'family car','booked'),(5,'small car','available'),(6,'small car','available');
/*!40000 ALTER TABLE `cars_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (2,'yo','fa','fares_yomna@yahoo.com','01014337232'),(3,'ko','lim','lim.moe@hotmail.com','020237356'),(4,'so','fo','prjct.ibm3@gmail.com','007782633899'),(5,'gh','mm','easytolive640@gmail.com','347458596960'),(8,'yo','gh','kat.nin81@gmail.com','347458596961'),(9,'nat','pat','prjct.ibm4@gmail.com','347458596963'),(10,'kim','mon','prjct.ibm2@gmail.com','01014337231'),(11,'joe','bar','prjct.ibm1@gmail.com','347458596965'),(12,'jan','pam','prjct.ibm6@gmail.com','01014337237'),(13,'sam','ham','prjct44.ibm@gmail.com','347458596969');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-28 11:49:38
