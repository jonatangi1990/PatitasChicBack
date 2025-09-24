CREATE DATABASE  IF NOT EXISTS `patitaschic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `patitaschic`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: patitaschic
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `species` enum('perro','gato') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` enum('pequeño','mediano','grande') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` date NOT NULL,
  `time` time NOT NULL,
  `status` enum('pendiente','confirmada','cancelada') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pendiente',
  `clients_id` int NOT NULL,
  `Service_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_UNIQUE` (`time`),
  KEY `fk_appointments_clients_idx` (`clients_id`),
  KEY `fk_appointments_Service1_idx` (`Service_id`),
  CONSTRAINT `fk_appointments_clients` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `fk_appointments_Service1` FOREIGN KEY (`Service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (17,'perro','mediano','2025-09-25','10:00:00','pendiente',1,1),(18,'gato','pequeño','2025-09-25','11:30:00','confirmada',2,2),(19,'perro','grande','2025-09-26','09:00:00','pendiente',3,3),(20,'gato','mediano','2025-09-26','12:00:00','cancelada',4,4);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` enum('admin','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `phone_number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Juan','Pérez','juan1@mail.com','123456789','user',123456789),(2,'María','Gómez','maria2@mail.com','123456789','user',123456780),(3,'Luis','Rodríguez','luis3@mail.com','123456789','user',123456781),(4,'Ana','Martínez','ana4@mail.com','123456789','user',123456782),(5,'Carlos','López','carlos5@mail.com','123456789','user',123456783),(6,'Lucía','Fernández','lucia6@mail.com','123456789','user',123456784),(7,'Jorge','García','jorge7@mail.com','123456789','user',123456785),(8,'Sofía','Sánchez','sofia8@mail.com','123456789','user',123456786),(9,'Diego','Ramírez','diego9@mail.com','123456789','user',123456787),(10,'Laura','Torres','laura10@mail.com','123456789','user',123456788),(11,'Pedro','Flores','pedro11@mail.com','123456789','user',1234567890),(12,'Elena','Vega','elena12@mail.com','123456789','user',1234567891),(13,'Mario','Cruz','mario13@mail.com','123456789','user',1234567892),(14,'Clara','Ortiz','clara14@mail.com','123456789','user',1234567893),(15,'Fernando','Morales','fernando15@mail.com','123456789','user',1234567894),(16,'Valeria','Rojas','valeria16@mail.com','123456789','user',1234567895),(17,'Andrés','Silva','andres17@mail.com','123456789','user',1234567896),(18,'Isabel','Castro','isabel18@mail.com','123456789','user',1234567897),(19,'Ricardo','Mendoza','ricardo19@mail.com','123456789','user',1234567898),(20,'Admin','Principal','admin@mail.com','123456789','admin',1234567899);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `species` enum('perro','gato') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` enum('pequeño','mediano','grande') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `Service_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prices_Service1_idx` (`Service_id`),
  CONSTRAINT `fk_prices_Service1` FOREIGN KEY (`Service_id`) REFERENCES `service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (85,'perro','pequeño',15.00,1),(86,'perro','mediano',20.00,1),(87,'perro','grande',25.00,1),(88,'gato','pequeño',18.00,1),(89,'gato','mediano',22.00,1),(90,'gato','grande',26.00,1),(91,'perro','pequeño',25.00,2),(92,'perro','mediano',30.00,2),(93,'perro','grande',35.00,2),(94,'gato','pequeño',28.00,2),(95,'gato','mediano',32.00,2),(96,'gato','grande',36.00,2),(97,'perro','pequeño',30.00,3),(98,'perro','mediano',35.00,3),(99,'perro','grande',40.00,3),(100,'perro','pequeño',35.00,4),(101,'perro','mediano',40.00,4),(102,'perro','grande',45.00,4),(103,'gato','pequeño',38.00,4),(104,'gato','mediano',42.00,4),(105,'gato','grande',47.00,4);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `duration` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'Baño','Baño completo con shampoo especializado y secado',60),(2,'Baño y corte','Baño completo más corte de pelo estándar',90),(3,'Baño y stripping','Baño completo más stripping para razas de pelo duro',100),(4,'Baño y corte a tijera','Baño completo más corte detallado a tijera',120);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-24 17:13:47
