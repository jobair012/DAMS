-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dams_db
-- ------------------------------------------------------
-- Server version	5.6.26

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
INSERT INTO `area` VALUES ('Chittagong'),('Dhaka'),('Narshingdi');
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
  `fullAddress` varchar(100) DEFAULT NULL,
  `area` varchar(45) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `nationalId_UNIQUE` (`nationalId`),
  UNIQUE KEY `doctorsRegistrationNumber_UNIQUE` (`doctorsRegistrationNumber`),
  KEY `fk_doctors_specializedSection1_idx` (`specializedSection_speciality`),
  KEY `fk_doctors_area1_idx` (`area`),
  CONSTRAINT `fk_doctors_area1` FOREIGN KEY (`area`) REFERENCES `area` (`areaName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_doctors_specializedSection1` FOREIGN KEY (`specializedSection_speciality`) REFERENCES `specializedsection` (`speciality`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES ('jobair012','jobair012@gmail.com','Jobair Hossain','male','85746566789','1993-01-08','0998876756678','78656789','Dr.',NULL,'Medicine','161/7, Middle Paikpara, Tajlane, Mirpur, Dhaka - 1216','Dhaka');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorsdegree`
--

DROP TABLE IF EXISTS `doctorsdegree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorsdegree` (
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
-- Dumping data for table `doctorsdegree`
--

LOCK TABLES `doctorsdegree` WRITE;
/*!40000 ALTER TABLE `doctorsdegree` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctorsdegree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorsrating`
--

DROP TABLE IF EXISTS `doctorsrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorsrating` (
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
-- Dumping data for table `doctorsrating`
--

LOCK TABLES `doctorsrating` WRITE;
/*!40000 ALTER TABLE `doctorsrating` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctorsrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorsworktime`
--

DROP TABLE IF EXISTS `doctorsworktime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorsworktime` (
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
-- Dumping data for table `doctorsworktime`
--

LOCK TABLES `doctorsworktime` WRITE;
/*!40000 ALTER TABLE `doctorsworktime` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctorsworktime` ENABLE KEYS */;
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
-- Table structure for table `specializedsection`
--

DROP TABLE IF EXISTS `specializedsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specializedsection` (
  `speciality` varchar(60) NOT NULL,
  PRIMARY KEY (`speciality`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializedsection`
--

LOCK TABLES `specializedsection` WRITE;
/*!40000 ALTER TABLE `specializedsection` DISABLE KEYS */;
INSERT INTO `specializedsection` VALUES ('Cardiac'),('Diabatelogy'),('Medicine');
/*!40000 ALTER TABLE `specializedsection` ENABLE KEYS */;
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
INSERT INTO `users` VALUES ('jobair012','408f9f8e406bc07caead4399ff80ff19c3a3edf37cf620bb00dbc9e16b9b6f7f3ce8156b686b394d','ROLE_DOCTOR',0);
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

-- Dump completed on 2016-07-17  2:48:40
