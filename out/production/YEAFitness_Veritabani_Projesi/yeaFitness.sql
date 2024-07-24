CREATE DATABASE  IF NOT EXISTS `yeafitness` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `yeafitness`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: yeafitness
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
-- Table structure for table `egitmen`
--

DROP TABLE IF EXISTS `egitmen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `egitmen` (
  `egitmen_id` int NOT NULL,
  `isim` varchar(45) DEFAULT NULL,
  `calisma_saatleri` varchar(45) DEFAULT NULL,
  `saha_ismi_eg` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`egitmen_id`),
  KEY `saha_ismi_id` (`saha_ismi_eg`),
  CONSTRAINT `saha_ismi_cons` FOREIGN KEY (`saha_ismi_eg`) REFERENCES `spor_sahasi` (`saha_ismi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egitmen`
--

LOCK TABLES `egitmen` WRITE;
/*!40000 ALTER TABLE `egitmen` DISABLE KEYS */;
INSERT INTO `egitmen` VALUES (1,'Murat','10-16','pilates'),(2,'Ahmet','12-18','basketbol'),(3,'Aylin','8-14','fitness'),(4,'Yusuf','9-15','tenis'),(5,'Acelya','7-14','voleybol'),(6,'Ferit','7-15','yuzme');
/*!40000 ALTER TABLE `egitmen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egitmen_brans`
--

DROP TABLE IF EXISTS `egitmen_brans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `egitmen_brans` (
  `egitmen_ID` int NOT NULL,
  `brans` varchar(45) NOT NULL,
  PRIMARY KEY (`egitmen_ID`,`Brans`),
  CONSTRAINT `egitmen_id_cons` FOREIGN KEY (`egitmen_ID`) REFERENCES `egitmen` (`egitmen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egitmen_brans`
--

LOCK TABLES `egitmen_brans` WRITE;
/*!40000 ALTER TABLE `egitmen_brans` DISABLE KEYS */;
INSERT INTO `egitmen_brans` VALUES (1,'pilates'),(2,'basketbol'),(3,'fitness'),(4,'tenis'),(5,'voleybol'),(6,'voleybol'),(6,'yüzme');
/*!40000 ALTER TABLE `egitmen_brans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egzersiz_programi`
--

DROP TABLE IF EXISTS `egzersiz_programi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `egzersiz_programi` (
  `kullanici_ID` int NOT NULL,
  `egzersiz_ismi` varchar(45) DEFAULT NULL,
  `zorluk_seviyesi` varchar(45) DEFAULT NULL,
  `ortalama_kalori_yakimi` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`kullanici_ID`),
  CONSTRAINT `Kullanici_IDcons` FOREIGN KEY (`kullanici_ID`) REFERENCES `kullanici` (`kullanici_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egzersiz_programi`
--

LOCK TABLES `egzersiz_programi` WRITE;
/*!40000 ALTER TABLE `egzersiz_programi` DISABLE KEYS */;
INSERT INTO `egzersiz_programi` VALUES (1,'squat','orta',660);
/*!40000 ALTER TABLE `egzersiz_programi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanici` (
  `kullanici_id` int NOT NULL,
  `isim` varchar(45) DEFAULT NULL,
  `hedef` varchar(45) DEFAULT NULL,
  `boy` int DEFAULT NULL,
  `kilo` decimal(10,2) DEFAULT NULL,
  `bazal_metabolizma` decimal(10,2) DEFAULT NULL,
  `cinsiyet` varchar(45) DEFAULT NULL,
  `dogum_tarihi` date DEFAULT NULL,
  `telefon_numarasi` varchar(15) DEFAULT NULL,
  `egitmen_ID` int DEFAULT NULL,
  PRIMARY KEY (`kullanici_id`),
  UNIQUE KEY (`kullanici_id`),
  KEY `Eğitmen ID_idx` (`egitmen_ID`),
  CONSTRAINT `egitmen_IDcons` FOREIGN KEY (`egitmen_ID`) REFERENCES `egitmen` (`egitmen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanici`
--

LOCK TABLES `kullanici` WRITE;
/*!40000 ALTER TABLE `kullanici` DISABLE KEYS */;
INSERT INTO `kullanici` VALUES (1,'Can','80',175,90.00,NULL,'erkek','1998-02-15','05350625898',NULL),(2,'Elif','55',165,70.00,NULL,'kiz','2003-10-02','05476830715',1),(3,'Arif',NULL,187,92.00,NULL,'erkek','1996-04-02','05968657213',4),(4,'Melek','65',167,82.00,NULL,'kiz','2003-08-10','05375525812',5),(5,'Ali',NULL,180,85.00,NULL,'erkek','2004-01-24','05342347895',NULL),(6,'Ada','65',168,75.00,NULL,'kız','2004-02-14','05270119916',6);
/*!40000 ALTER TABLE `kullanici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `randevu_alir`
--

DROP TABLE IF EXISTS `randevu_alir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `randevu_alir` (
  `kullanici_id_rand` int NOT NULL,
  `saha_ismi_rand` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`kullanici_id_rand`),
  CONSTRAINT `kullanici_id_rand_cons` FOREIGN KEY (`kullanici_id_rand`) REFERENCES `kullanici` (`kullanici_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `randevu_alir`
--

LOCK TABLES `randevu_alir` WRITE;
/*!40000 ALTER TABLE `randevu_alir` DISABLE KEYS */;
INSERT INTO `randevu_alir` VALUES (1,NULL),(2,'pilates'),(3,'tenis'),(4,'voleybol'),(5,'basketbol'),(6,'yuzme');
/*!40000 ALTER TABLE `randevu_alir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spor_sahasi`
--

DROP TABLE IF EXISTS `spor_sahasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spor_sahasi` (
  `saha_ismi` varchar(45) NOT NULL,
  `kontenjan` int DEFAULT NULL,
  `hizmet_saatleri` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`saha_ismi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spor_sahasi`
--

LOCK TABLES `spor_sahasi` WRITE;
/*!40000 ALTER TABLE `spor_sahasi` DISABLE KEYS */;
INSERT INTO `spor_sahasi` VALUES ('basketbol',10,'9-21'),('fitness',80,'9-21'),('pilates',30,'16-21'),('tenis',6,'9-21'),('voleybol',12,'9-21'),('yüzme',16,'10-19');
/*!40000 ALTER TABLE `spor_sahasi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-07 18:44:38kullanici`Kullanici ID`