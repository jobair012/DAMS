-- MySQL dump 10.13  Distrib 5.7.12, for Linux (x86_64)
--
-- Host: localhost    Database: DAMS_DB
-- ------------------------------------------------------
-- Server version	5.7.12-0ubuntu1

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
-- Table structure for table `DoctorsWorkTime`
--

DROP TABLE IF EXISTS `DoctorsWorkTime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorsWorkTime` (
  `doctorsWorkTimeId` int(11) NOT NULL AUTO_INCREMENT,
  `day` varchar(45) DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  `doctors_username` varchar(45) NOT NULL,
  PRIMARY KEY (`doctorsWorkTimeId`),
  KEY `fk_DoctorsWorkTime_doctors1_idx` (`doctors_username`),
  CONSTRAINT `fk_DoctorsWorkTime_doctors1` FOREIGN KEY (`doctors_username`) REFERENCES `doctors` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorsWorkTime`
--

LOCK TABLES `DoctorsWorkTime` WRITE;
/*!40000 ALTER TABLE `DoctorsWorkTime` DISABLE KEYS */;
/*!40000 ALTER TABLE `DoctorsWorkTime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(45) DEFAULT NULL,
  `postCode` int(11) DEFAULT NULL,
  `district_districtName` varchar(45) NOT NULL,
  `area_areaName` varchar(45) NOT NULL,
  `doctors_username` varchar(45) NOT NULL,
  PRIMARY KEY (`addressId`),
  KEY `fk_address_district1_idx` (`district_districtName`),
  KEY `fk_address_area1_idx` (`area_areaName`),
  KEY `fk_address_doctors1_idx` (`doctors_username`),
  CONSTRAINT `fk_address_area1` FOREIGN KEY (`area_areaName`) REFERENCES `area` (`areaName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_district1` FOREIGN KEY (`district_districtName`) REFERENCES `district` (`districtName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_doctors1` FOREIGN KEY (`doctors_username`) REFERENCES `doctors` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `username` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'active',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES ('admin','Admin','admin@admin.com','active'),('jobair012','Jobair Hossain','jobair012@gmail.com','active');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `appointmentId` int(11) NOT NULL AUTO_INCREMENT,
  `requestedDate` date DEFAULT NULL,
  `expectedDate` date DEFAULT NULL,
  `welcomeDate` date DEFAULT NULL,
  `status` varchar(45) DEFAULT 'pending',
  `doctors_username` varchar(45) NOT NULL,
  `patients_username` int(11) NOT NULL,
  PRIMARY KEY (`appointmentId`),
  KEY `fk_appointment_doctors1_idx` (`doctors_username`),
  KEY `fk_appointment_patients1_idx` (`patients_username`),
  CONSTRAINT `fk_appointment_doctors1` FOREIGN KEY (`doctors_username`) REFERENCES `doctors` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_patients1` FOREIGN KEY (`patients_username`) REFERENCES `patients` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `areaName` varchar(45) NOT NULL,
  PRIMARY KEY (`areaName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `countryName` varchar(45) NOT NULL,
  PRIMARY KEY (`countryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('Bangladesh');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `degree` (
  `degreeName` varchar(45) NOT NULL,
  PRIMARY KEY (`degreeName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `districtName` varchar(45) NOT NULL,
  PRIMARY KEY (`districtName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `username` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `nationalId` varchar(45) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `doctorsRegistrationNumber` varchar(45) DEFAULT NULL,
  `contactNumber` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `professionalStatement` text,
  `specializedSection_speciality` varchar(60) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `nationalId_UNIQUE` (`nationalId`),
  UNIQUE KEY `doctorsRegistrationNumber_UNIQUE` (`doctorsRegistrationNumber`),
  KEY `fk_doctors_specializedSection1_idx` (`specializedSection_speciality`),
  CONSTRAINT `fk_doctors_specializedSection1` FOREIGN KEY (`specializedSection_speciality`) REFERENCES `specializedSection` (`speciality`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorsDegree`
--

DROP TABLE IF EXISTS `doctorsDegree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorsDegree` (
  `doctorsDegreeId` int(11) NOT NULL AUTO_INCREMENT,
  `duratoin` varchar(45) DEFAULT NULL,
  `degreeAchievementYear` varchar(45) DEFAULT NULL,
  `institution_instituteName` varchar(45) NOT NULL,
  `degree_degreeName` varchar(45) NOT NULL,
  `doctors_username` varchar(45) NOT NULL,
  PRIMARY KEY (`doctorsDegreeId`),
  KEY `fk_doctorsDegree_institution1_idx` (`institution_instituteName`),
  KEY `fk_doctorsDegree_degree1_idx` (`degree_degreeName`),
  KEY `fk_doctorsDegree_doctors1_idx` (`doctors_username`),
  CONSTRAINT `fk_doctorsDegree_degree1` FOREIGN KEY (`degree_degreeName`) REFERENCES `degree` (`degreeName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctorsDegree_doctors1` FOREIGN KEY (`doctors_username`) REFERENCES `doctors` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctorsDegree_institution1` FOREIGN KEY (`institution_instituteName`) REFERENCES `institution` (`instituteName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctorsDegree`
--

LOCK TABLES `doctorsDegree` WRITE;
/*!40000 ALTER TABLE `doctorsDegree` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctorsDegree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorsRating`
--

DROP TABLE IF EXISTS `doctorsRating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorsRating` (
  `doctorsRatingId` int(11) NOT NULL AUTO_INCREMENT,
  `totalRate` double DEFAULT NULL,
  `rate` varchar(45) DEFAULT NULL,
  `doctors_username` varchar(45) NOT NULL,
  PRIMARY KEY (`doctorsRatingId`),
  KEY `fk_doctorsRating_doctors1_idx` (`doctors_username`),
  CONSTRAINT `fk_doctorsRating_doctors1` FOREIGN KEY (`doctors_username`) REFERENCES `doctors` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctorsRating`
--

LOCK TABLES `doctorsRating` WRITE;
/*!40000 ALTER TABLE `doctorsRating` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctorsRating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution` (
  `instituteName` varchar(45) NOT NULL,
  `institutionsAcronym` varchar(45) DEFAULT NULL,
  `country_countryName` varchar(45) NOT NULL,
  PRIMARY KEY (`instituteName`),
  KEY `fk_institution_country1_idx` (`country_countryName`),
  CONSTRAINT `fk_institution_country1` FOREIGN KEY (`country_countryName`) REFERENCES `country` (`countryName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
INSERT INTO `institution` VALUES ('Dhaka Medical College','DMC','Bangladesh');
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `username` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `nationalId` varchar(45) DEFAULT NULL,
  `birthCertificateId` varchar(45) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `contcatNo` varchar(45) DEFAULT NULL,
  `address_addressId` int(11) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `birthCertificateId_UNIQUE` (`birthCertificateId`),
  UNIQUE KEY `nationalId_UNIQUE` (`nationalId`),
  KEY `fk_patient_address1_idx` (`address_addressId`),
  CONSTRAINT `fk_patient_address1` FOREIGN KEY (`address_addressId`) REFERENCES `address` (`addressId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specializedSection`
--

DROP TABLE IF EXISTS `specializedSection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specializedSection` (
  `speciality` varchar(60) NOT NULL,
  PRIMARY KEY (`speciality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializedSection`
--

LOCK TABLES `specializedSection` WRITE;
/*!40000 ALTER TABLE `specializedSection` DISABLE KEYS */;
/*!40000 ALTER TABLE `specializedSection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','0371adac0fdb52146f67f6d65970ca8884bcd5df619cfd65a5861fe6777a8a3412f34afd81852aa0','ROLE_ADMIN',1),('jobair012','df308abc3f28010b18986f5141beadd7b31fa1063fc7bd8a534bf61ad8e544a82696735e76607dd0','ROLE_ADMIN',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-11 22:42:37
