-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: doc_appointment
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Temporary view structure for view `app_fee`
--

DROP TABLE IF EXISTS `app_fee`;
/*!50001 DROP VIEW IF EXISTS `app_fee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `app_fee` AS SELECT 
 1 AS `hospital_name`,
 1 AS `state`,
 1 AS `first_appointment_fee`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `appointment_details`
--

DROP TABLE IF EXISTS `appointment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_details` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `office_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `status_id` int NOT NULL,
  `appointment_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `office_id` (`office_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `appointment_details_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `office_details` (`office_id`),
  CONSTRAINT `appointment_details_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient_details` (`patient_id`),
  CONSTRAINT `appointment_details_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_details` (`doctor_id`),
  CONSTRAINT `appointment_details_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `appointment_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_details`
--

LOCK TABLES `appointment_details` WRITE;
/*!40000 ALTER TABLE `appointment_details` DISABLE KEYS */;
INSERT INTO `appointment_details` VALUES (1,50,10000,1000,1,'2022-04-15','12:00:00','13:00:00'),(2,51,10001,1001,2,'2022-04-12','14:30:00','15:00:00'),(3,50,10002,1002,3,'2022-05-02','11:00:00','12:00:00'),(4,52,10003,1003,4,'2022-05-03','09:00:00','11:00:00'),(5,52,10004,1004,5,'2022-06-03','14:00:00','16:00:00'),(6,53,10005,1005,6,'2022-03-23','11:00:00','14:00:00');
/*!40000 ALTER TABLE `appointment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `appointment_fee`
--

DROP TABLE IF EXISTS `appointment_fee`;
/*!50001 DROP VIEW IF EXISTS `appointment_fee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `appointment_fee` AS SELECT 
 1 AS `hospital_name`,
 1 AS `state`,
 1 AS `first_appointment_fee`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `appointment_status`
--

DROP TABLE IF EXISTS `appointment_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `appointment_status` varchar(10) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_status`
--

LOCK TABLES `appointment_status` WRITE;
/*!40000 ALTER TABLE `appointment_status` DISABLE KEYS */;
INSERT INTO `appointment_status` VALUES (1,'Confirmed'),(2,'Confirmed'),(3,'Waiting'),(4,'Waiting'),(5,'Not Avail'),(6,'Waiting'),(7,'Waiting'),(8,'Waiting');
/*!40000 ALTER TABLE `appointment_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_availability`
--

DROP TABLE IF EXISTS `doctor_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_availability` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `days_of_week` varchar(100) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `is_available` char(1) NOT NULL,
  `reason_for_unavailability` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `office_id` (`office_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `doctor_availability_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `office_details` (`office_id`),
  CONSTRAINT `doctor_availability_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_details` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_availability`
--

LOCK TABLES `doctor_availability` WRITE;
/*!40000 ALTER TABLE `doctor_availability` DISABLE KEYS */;
INSERT INTO `doctor_availability` VALUES (1,50,1000,'Monday','08:00:00','17:00:00','Y',NULL),(2,50,1000,'Wednesday','08:00:00','17:00:00','Y',NULL),(3,51,1001,'Tuesday','08:00:00','17:00:00','Y',NULL),(4,51,1001,'Wednesday','08:00:00','17:00:00','Y',NULL),(5,50,1002,'Thursday','08:00:00','17:00:00','Y',NULL),(6,52,1003,'Friday','08:00:00','17:00:00','Y',NULL),(7,52,1003,'Saturday','08:00:00','17:00:00','Y',NULL),(8,52,1004,'Sunday','08:00:00','17:00:00','Y',NULL),(9,52,1004,'Not Available','00:00:00','00:00:00','N','Vacation'),(10,53,1005,'Monday','08:00:00','17:00:00','Y',NULL),(11,54,1006,'Monday','08:00:00','17:00:00','Y',NULL),(12,51,1007,'Wednesday','08:00:00','17:00:00','Y',NULL),(13,51,1007,'Thursday','08:00:00','17:00:00','Y',NULL),(14,50,1008,'Monday','08:00:00','17:00:00','Y',NULL),(15,51,1009,'Tuesday','08:00:00','17:00:00','Y',NULL),(16,50,1010,'Thursday','08:00:00','17:00:00','Y',NULL),(17,52,1011,'Thursday','08:00:00','17:00:00','Y',NULL),(18,52,1012,'Tuesday','08:00:00','17:00:00','Y',NULL),(19,53,1013,'Friday','08:00:00','17:00:00','Y',NULL),(20,54,1014,'Saturday','08:00:00','17:00:00','Y',NULL),(21,51,1015,'Saturday',NULL,NULL,'N','Vacation'),(22,53,1016,'Sunday','08:00:00','17:00:00','Y',NULL),(23,54,1017,'Wednesday','08:00:00','17:00:00','Y',NULL),(24,51,1018,'Thursday','08:00:00','17:00:00','Y',NULL),(25,50,1019,'Tuesday',NULL,NULL,'N','Business Tour');
/*!40000 ALTER TABLE `doctor_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `doctor_availability_view`
--

DROP TABLE IF EXISTS `doctor_availability_view`;
/*!50001 DROP VIEW IF EXISTS `doctor_availability_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `doctor_availability_view` AS SELECT 
 1 AS `appointment_id`,
 1 AS `patient_id`,
 1 AS `doctor_id`,
 1 AS `days_of_week`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `is_available`,
 1 AS `reason_for_unavailability`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `doctor_details`
--

DROP TABLE IF EXISTS `doctor_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_details` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `doctor_fname` varchar(100) NOT NULL,
  `doctor_lname` varchar(100) NOT NULL,
  `doctor_dob` date NOT NULL,
  `doctor_practicing_from` date NOT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_details`
--

LOCK TABLES `doctor_details` WRITE;
/*!40000 ALTER TABLE `doctor_details` DISABLE KEYS */;
INSERT INTO `doctor_details` VALUES (1000,'Raj','Sharma','1976-04-12','2000-01-01'),(1001,'Robert','Zane','1984-02-11','2010-01-01'),(1002,'Emily','Anderson','1982-07-22','2008-01-01'),(1003,'John','Smith','1975-09-17','2003-01-01'),(1004,'Maria','Garcia','1988-05-31','2015-01-01'),(1005,'Michael','Brown','1980-12-01','2006-01-01'),(1006,'Catherine','Wilson','1979-06-05','2001-01-01'),(1007,'James','Johnson','1972-11-11','1998-01-01'),(1008,'Sarah','Taylor','1990-03-15','2018-01-01'),(1009,'Daniel','Davis','1978-01-22','2004-01-01'),(1010,'Karen','Jackson','1985-08-10','2011-01-01'),(1011,'Mark','Wilson','1974-06-19','2002-01-01'),(1012,'Jessica','Lee','1983-04-29','2009-01-01'),(1013,'David','Gonzalez','1987-09-02','2014-01-01'),(1014,'Amy','Clark','1981-11-15','2007-01-01'),(1015,'Kevin','Lopez','1977-02-28','2000-01-01'),(1016,'Julie','Green','1989-07-06','2017-01-01'),(1017,'Steven','Campbell','1973-03-25','1999-01-01'),(1018,'Lauren','Rodriguez','1992-05-12','2020-01-01'),(1019,'Andrew','Thomas','1971-12-07','1997-01-01'),(1020,'Harvey','Paulsen','1989-12-04','2022-03-23');
/*!40000 ALTER TABLE `doctor_details` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `doctor_details_insert_trigger` BEFORE INSERT ON `doctor_details` FOR EACH ROW BEGIN
  IF NEW.doctor_id IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in doctor_id';
  END IF;
  IF NEW.doctor_fname IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in doctor_fname';
  END IF;
  IF NEW.doctor_lname IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in doctor_lname';
  END IF;
  IF NEW.doctor_dob IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in doctor_dob';
  END IF;
  IF NEW.doctor_practicing_from IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in doctor_practicing_from';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `doctor_hospital_view`
--

DROP TABLE IF EXISTS `doctor_hospital_view`;
/*!50001 DROP VIEW IF EXISTS `doctor_hospital_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `doctor_hospital_view` AS SELECT 
 1 AS `doctor_id`,
 1 AS `doctor_fname`,
 1 AS `doctor_lname`,
 1 AS `hospital_name`,
 1 AS `city`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `doctor_schedule`
--

DROP TABLE IF EXISTS `doctor_schedule`;
/*!50001 DROP VIEW IF EXISTS `doctor_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `doctor_schedule` AS SELECT 
 1 AS `doctor_id`,
 1 AS `days_of_week`,
 1 AS `start_time`,
 1 AS `end_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `doctor_speciality`
--

DROP TABLE IF EXISTS `doctor_speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_speciality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int NOT NULL,
  `speciality_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `speciality_id` (`speciality_id`),
  CONSTRAINT `doctor_speciality_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_details` (`doctor_id`),
  CONSTRAINT `doctor_speciality_ibfk_2` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`speciality_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_speciality`
--

LOCK TABLES `doctor_speciality` WRITE;
/*!40000 ALTER TABLE `doctor_speciality` DISABLE KEYS */;
INSERT INTO `doctor_speciality` VALUES (1,1000,1),(2,1001,2),(3,1002,5),(4,1003,6),(5,1004,3),(6,1005,4),(7,1006,9),(8,1007,8),(9,1008,7),(10,1009,10),(11,1010,11),(12,1011,12),(13,1012,13),(14,1013,14),(15,1014,15),(16,1015,16),(17,1016,17),(18,1017,18),(19,1018,19),(20,1019,18);
/*!40000 ALTER TABLE `doctor_speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `first_appointment_fee_by_state_and_hospital`
--

DROP TABLE IF EXISTS `first_appointment_fee_by_state_and_hospital`;
/*!50001 DROP VIEW IF EXISTS `first_appointment_fee_by_state_and_hospital`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `first_appointment_fee_by_state_and_hospital` AS SELECT 
 1 AS `hospital_name`,
 1 AS `state`,
 1 AS `first_appointment_fee`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hospital_affiliation`
--

DROP TABLE IF EXISTS `hospital_affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_affiliation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hospital_affiliation_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `hospital_name` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` int NOT NULL,
  `doctor_start_date` date NOT NULL,
  `doctor_end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `idx_hospital_affiliation_id` (`hospital_affiliation_id`),
  CONSTRAINT `hospital_affiliation_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_details` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_affiliation`
--

LOCK TABLES `hospital_affiliation` WRITE;
/*!40000 ALTER TABLE `hospital_affiliation` DISABLE KEYS */;
INSERT INTO `hospital_affiliation` VALUES (1,5000,1000,'Oceanview Medical Center','SanDiego','California',22120,'2010-01-01',NULL),(2,5001,1001,'Brighter Days Hospital','Dallas','Texas',34521,'2009-02-01',NULL),(3,5000,1002,'Oceanview Medical Center','SanDiego','California',22120,'2010-03-01',NULL),(4,5002,1003,'Summit Health and Wellness','Orlando','Florida',43256,'2009-04-01',NULL),(5,5002,1004,'Summit Health and Wellness','Orlando','Florida',43256,'2007-05-01',NULL),(6,5003,1005,'Valley Medical Center','Rochester','New York',23453,'2012-06-01',NULL),(7,5004,1006,'Harmony General Hospital','Springfield','Illinois',56321,'2003-07-01',NULL),(8,5001,1007,'Brighter Days Hospital','Dallas','Texas',34521,'2009-08-01',NULL),(9,5000,1008,'Oceanview Medical Center','SanDiego','California',22120,'2012-09-01',NULL),(10,5001,1009,'Brighter Days Hospital','Dallas','Texas',34521,'2011-10-01',NULL),(11,5000,1010,'Oceanview Medical Center','SanDiego','California',22120,'2003-11-01',NULL),(12,5002,1011,'Summit Health and Wellness','Orlando','Florida',43256,'2014-12-01',NULL),(13,5002,1012,'Summit Health and Wellness','Orlando','Florida',43256,'2015-01-01','2020-12-12'),(14,5003,1013,'Valley Medical Center','Rochester','New York',23453,'2012-02-01',NULL),(15,5004,1014,'Harmony General Hospital','Springfield','Illinois',56321,'2003-03-01',NULL),(16,5001,1015,'Brighter Days Hospital','Dallas','Texas',34521,'2021-04-01',NULL),(17,5003,1016,'Valley Medical Center','Rochester','New York',23453,'2021-05-01',NULL),(18,5004,1017,'Harmony General Hospital','Springfield','Illinois',56321,'2015-06-01','2022-03-04'),(19,5001,1018,'Brighter Days Hospital','Dallas','Texas',34521,'2019-07-01',NULL),(20,5000,1019,'Oceanview Medical Center','SanDiego','California',22120,'2019-03-04',NULL);
/*!40000 ALTER TABLE `hospital_affiliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `hospital_office_fee`
--

DROP TABLE IF EXISTS `hospital_office_fee`;
/*!50001 DROP VIEW IF EXISTS `hospital_office_fee`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `hospital_office_fee` AS SELECT 
 1 AS `first_appointment_fee`,
 1 AS `hospital_name`,
 1 AS `state`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `office_details`
--

DROP TABLE IF EXISTS `office_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `office_id` int NOT NULL,
  `hospital_affiliation_id` int NOT NULL,
  `doctor_id` int DEFAULT NULL,
  `first_appointment_fee` decimal(10,2) DEFAULT NULL,
  `followup_appointment_fee` decimal(10,2) DEFAULT NULL,
  `contact_no` bigint DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_affiliation_id` (`hospital_affiliation_id`),
  KEY `doctor_id` (`doctor_id`),
  KEY `idx_office_id` (`office_id`),
  CONSTRAINT `office_details_ibfk_1` FOREIGN KEY (`hospital_affiliation_id`) REFERENCES `hospital_affiliation` (`hospital_affiliation_id`),
  CONSTRAINT `office_details_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_details` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_details`
--

LOCK TABLES `office_details` WRITE;
/*!40000 ALTER TABLE `office_details` DISABLE KEYS */;
INSERT INTO `office_details` VALUES (1,50,5000,1000,100.00,80.00,9238473265,'SanDiego','California',22120),(2,51,5001,1001,75.00,55.00,6172134627,'Dallas','Texas',34521),(3,50,5000,1002,100.00,80.00,9238473265,'SanDiego','California',22120),(4,52,5002,1003,90.00,70.00,4137652345,'Orlando','Florida',43256),(5,52,5002,1004,90.00,70.00,4137652345,'Orlando','Florida',43256),(6,53,5003,1005,90.00,70.00,7861234245,'Rochester','New York',23453),(7,54,5004,1006,80.00,60.00,6662124444,'Springfield','Illinois',56321),(8,51,5001,1007,75.00,55.00,6172134627,'Dallas','Texas',34521),(9,50,5000,1008,100.00,80.00,9238473265,'SanDiego','California',22120),(10,51,5001,1009,75.00,55.00,6172134627,'Dallas','Texas',34521),(11,50,5000,1010,100.00,80.00,9238473265,'SanDiego','California',22120),(12,52,5002,1011,90.00,70.00,4137652345,'Orlando','Florida',43256),(13,52,5002,1012,90.00,70.00,4137652345,'Orlando','Florida',43256),(14,53,5003,1013,90.00,70.00,7861234245,'Rochester','New York',23453),(15,54,5004,1014,80.00,60.00,6662124444,'Springfield','Illinois',56321),(16,51,5001,1015,75.00,55.00,6172134627,'Dallas','Texas',34521),(17,53,5003,1016,90.00,70.00,7861234245,'Rochester','New York',23453),(18,54,5004,1017,80.00,60.00,6662124444,'Springfield','Illinois',56321),(19,51,5001,1018,75.00,55.00,6172134627,'Dallas','Texas',34521),(20,50,5000,1019,100.00,80.00,9238473265,'SanDiego','California',22120);
/*!40000 ALTER TABLE `office_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_details`
--

DROP TABLE IF EXISTS `patient_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_details` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `patient_fname` varchar(100) NOT NULL,
  `patient_lname` varchar(100) NOT NULL,
  `patient_insurance_no` int DEFAULT NULL,
  `contact_no` bigint NOT NULL,
  `email_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10010 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_details`
--

LOCK TABLES `patient_details` WRITE;
/*!40000 ALTER TABLE `patient_details` DISABLE KEYS */;
INSERT INTO `patient_details` VALUES (10000,'John','Doe',123456,9876543210,'john.doe@example.com'),(10001,'Jane','Smith',234567,8765432109,'jane.smith@example.com'),(10002,'David','Brown',345678,7654321098,'david.brown@example.com'),(10003,'Emily','Jones',456789,6543210987,'emily.jones@example.com'),(10004,'Sarah','Davis',567890,5432109876,'sarah.davis@example.com'),(10005,'Michael','Miller',678901,4321098765,'michael.miller@example.com'),(10006,'Jessica','Wilson',789012,3210987654,'jessica.wilson@example.com'),(10007,'Christopher','Taylor',890123,2109876543,'christopher.taylor@example.com'),(10008,'Amanda','Anderson',901234,1098765432,'amanda.anderson@example.com'),(10009,'Daniel','Thomas',102345,987654321,'daniel.thomas@example.com');
/*!40000 ALTER TABLE `patient_details` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `patient_details_null_check` BEFORE INSERT ON `patient_details` FOR EACH ROW BEGIN
    IF NEW.patient_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in patient_id';
    END IF;
    IF NEW.patient_fname IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in patient_fname';
    END IF;
    IF NEW.patient_lname IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in patient_lname';
    END IF;
    IF NEW.patient_insurance_no IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in patient_insurance_no';
    END IF;
    IF NEW.contact_no IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in contact_no';
    END IF;
    IF NEW.email_id IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Null value not allowed in email_id';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `patient_record`
--

DROP TABLE IF EXISTS `patient_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_record` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `office_id` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `previous_appointment_date` date DEFAULT NULL,
  `previous_appointment_time` time NOT NULL,
  `previous_medical_history` varchar(500) DEFAULT NULL,
  `previous_bill_amount` float DEFAULT NULL,
  `doctors_comments` varchar(500) DEFAULT NULL,
  `office_comments` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `office_id` (`office_id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `patient_record_ibfk_1` FOREIGN KEY (`office_id`) REFERENCES `office_details` (`office_id`),
  CONSTRAINT `patient_record_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient_details` (`patient_id`),
  CONSTRAINT `patient_record_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_details` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_record`
--

LOCK TABLES `patient_record` WRITE;
/*!40000 ALTER TABLE `patient_record` DISABLE KEYS */;
INSERT INTO `patient_record` VALUES (1,50,10000,1000,'2022-01-12','14:00:00',NULL,120,'Regular Checkup','All dues clear'),(2,51,10001,1001,'2022-01-29','12:00:00','Diabetes stage 1',100,'Under Observation','Amount Pending'),(3,50,10002,1002,'2021-12-12','11:00:00',NULL,90,'Regular Checkup','All dues clear'),(4,52,10003,1000,'2021-12-23','09:00:00','Lung Cancer stage 1',200,'Under Observation','All dues clear'),(5,52,10004,1001,'2022-02-12','13:00:00','Diabetes stage 1',100,'Under Observation','Amount Pending'),(6,53,10005,1004,'2022-03-22','12:00:00',NULL,80,'Regular Checkup','All dues clear');
/*!40000 ALTER TABLE `patient_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qualification_of_doctor`
--

DROP TABLE IF EXISTS `qualification_of_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qualification_of_doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int NOT NULL,
  `qualification_name` varchar(100) NOT NULL,
  `university_name` varchar(100) NOT NULL,
  `pass_out_year` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `doctor_id` (`doctor_id`),
  CONSTRAINT `qualification_of_doctor_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor_details` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qualification_of_doctor`
--

LOCK TABLES `qualification_of_doctor` WRITE;
/*!40000 ALTER TABLE `qualification_of_doctor` DISABLE KEYS */;
INSERT INTO `qualification_of_doctor` VALUES (100,1000,'MD','Harvard University','2000-05-30'),(101,1001,'MBBS','Johns Hopkins University','2010-03-15'),(102,1002,'PhD','Columbia University','2008-06-20'),(103,1003,'MD','Stanford University','2003-02-28'),(104,1004,'MBBS','University of California, San Francisco','2014-08-10'),(105,1005,'MS','Yale University','2004-11-25'),(106,1006,'MD','Duke University','1999-12-02'),(107,1007,'PhD','University of Pennsylvania','1998-05-05'),(108,1008,'MD','Johns Hopkins University','2007-09-12'),(109,1009,'MBBS','Columbia University','2003-10-01'),(110,1010,'MD','Harvard University','2009-07-08'),(111,1011,'MS','University of California, Los Angeles','2001-01-16'),(112,1012,'MD','University of Chicago','2006-04-21'),(113,1013,'PhD','New York University','2013-06-11'),(114,1014,'MD','University of Michigan','2006-09-27'),(115,1015,'MS','Columbia University','2017-03-09'),(116,1016,'MD','University of Pittsburgh','2008-08-06'),(117,1017,'PhD','University of California, San Diego','2014-12-14'),(118,1018,'MBBS','University of California, Los Angeles','2016-05-18'),(119,1019,'MD','University of California, San Francisco','2007-11-23');
/*!40000 ALTER TABLE `qualification_of_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speciality`
--

DROP TABLE IF EXISTS `speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speciality` (
  `speciality_id` int NOT NULL AUTO_INCREMENT,
  `speciality_name` varchar(100) NOT NULL,
  PRIMARY KEY (`speciality_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciality`
--

LOCK TABLES `speciality` WRITE;
/*!40000 ALTER TABLE `speciality` DISABLE KEYS */;
INSERT INTO `speciality` VALUES (1,'Allergy and immunology'),(2,'Anesthesiology'),(3,'Dermatology'),(4,'Diagnostic Radiology'),(5,'Emergency Medicine'),(6,'Internal Medicine'),(7,'Medical Genetics'),(8,'Neurology'),(9,'Nuclear Medicine'),(10,'Obstetrics and Gynecology'),(11,'Ophthalmology'),(12,'Pathology'),(13,'Pediatrics'),(14,'Physical Medicine and Rehabilitation'),(15,'Preventive Medicine'),(16,'Psychiatry'),(17,'Radiation Oncology'),(18,'Surgery'),(19,'Urology');
/*!40000 ALTER TABLE `speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'doc_appointment'
--

--
-- Dumping routines for database 'doc_appointment'
--
/*!50003 DROP FUNCTION IF EXISTS `get_allpatients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_allpatients`() RETURNS int
    READS SQL DATA
BEGIN
DECLARE total INT;
SELECT COUNT(*) INTO total FROM patient_details;
RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_all_patients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_all_patients`() RETURNS int
    READS SQL DATA
BEGIN
DECLARE total INT;
SELECT COUNT(*) INTO total FROM patient_details;
RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ALLRECORDS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ALLRECORDS`()
BEGIN
  SELECT * FROM patient_record;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `app_fee`
--

/*!50001 DROP VIEW IF EXISTS `app_fee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `app_fee` AS select distinct `h`.`hospital_name` AS `hospital_name`,`h`.`state` AS `state`,`o`.`first_appointment_fee` AS `first_appointment_fee` from (`hospital_affiliation` `h` left join `office_details` `o` on((`o`.`hospital_affiliation_id` = `h`.`id`))) order by `o`.`first_appointment_fee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `appointment_fee`
--

/*!50001 DROP VIEW IF EXISTS `appointment_fee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `appointment_fee` AS select distinct `h`.`hospital_name` AS `hospital_name`,`h`.`state` AS `state`,`o`.`first_appointment_fee` AS `first_appointment_fee` from (`hospital_affiliation` `h` join `office_details` `o` on((`o`.`hospital_affiliation_id` = `h`.`id`))) order by `o`.`first_appointment_fee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `doctor_availability_view`
--

/*!50001 DROP VIEW IF EXISTS `doctor_availability_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `doctor_availability_view` AS select `a`.`appointment_id` AS `appointment_id`,`a`.`patient_id` AS `patient_id`,`d`.`doctor_id` AS `doctor_id`,`d`.`days_of_week` AS `days_of_week`,`d`.`start_time` AS `start_time`,`d`.`end_time` AS `end_time`,`d`.`is_available` AS `is_available`,`d`.`reason_for_unavailability` AS `reason_for_unavailability` from (`appointment_details` `a` join `doctor_availability` `d` on(((`a`.`doctor_id` = `d`.`doctor_id`) and (`a`.`appointment_date` = `d`.`days_of_week`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `doctor_hospital_view`
--

/*!50001 DROP VIEW IF EXISTS `doctor_hospital_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `doctor_hospital_view` AS select `d`.`doctor_id` AS `doctor_id`,`d`.`doctor_fname` AS `doctor_fname`,`d`.`doctor_lname` AS `doctor_lname`,`h`.`hospital_name` AS `hospital_name`,`h`.`city` AS `city`,`h`.`state` AS `state` from (`doctor_details` `d` join `hospital_affiliation` `h` on((`d`.`doctor_id` = `h`.`doctor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `doctor_schedule`
--

/*!50001 DROP VIEW IF EXISTS `doctor_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `doctor_schedule` AS select `doctor_availability`.`doctor_id` AS `doctor_id`,`doctor_availability`.`days_of_week` AS `days_of_week`,`doctor_availability`.`start_time` AS `start_time`,`doctor_availability`.`end_time` AS `end_time` from `doctor_availability` where ((`doctor_availability`.`is_available` = 1) or ((`doctor_availability`.`is_available` = 0) and (`doctor_availability`.`reason_for_unavailability` is null))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `first_appointment_fee_by_state_and_hospital`
--

/*!50001 DROP VIEW IF EXISTS `first_appointment_fee_by_state_and_hospital`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `first_appointment_fee_by_state_and_hospital` AS select distinct `h`.`hospital_name` AS `hospital_name`,`h`.`state` AS `state`,`o`.`first_appointment_fee` AS `first_appointment_fee` from (`hospital_affiliation` `h` join `office_details` `o` on((`o`.`hospital_affiliation_id` = `h`.`id`))) order by `o`.`first_appointment_fee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `hospital_office_fee`
--

/*!50001 DROP VIEW IF EXISTS `hospital_office_fee`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `hospital_office_fee` AS select `o`.`first_appointment_fee` AS `first_appointment_fee`,`h`.`hospital_name` AS `hospital_name`,`o`.`state` AS `state` from (`hospital_affiliation` `h` join `office_details` `o` on((`h`.`hospital_affiliation_id` = `o`.`hospital_affiliation_id`))) order by `o`.`first_appointment_fee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-29  0:09:34
