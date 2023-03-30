-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hrtest
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `вакансии`
--

DROP TABLE IF EXISTS `вакансии`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `вакансии` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Название_Вакансии` varchar(45) DEFAULT NULL,
  `Описание_Вакансии` varchar(1000) DEFAULT NULL,
  `Требуемый уровень образования` varchar(45) DEFAULT NULL,
  `Обязательные навыки` varchar(500) DEFAULT NULL,
  `Желательные навыки` varchar(500) DEFAULT NULL,
  `Дата выставления` date DEFAULT NULL,
  `Дата закрытия вакансии` date DEFAULT NULL,
  `id_Компании` int DEFAULT NULL,
  `Диапозон зарплаты` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `4_idx` (`id_Компании`),
  CONSTRAINT `4` FOREIGN KEY (`id_Компании`) REFERENCES `компания` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `вакансии`
--

LOCK TABLES `вакансии` WRITE;
/*!40000 ALTER TABLE `вакансии` DISABLE KEYS */;
/*!40000 ALTER TABLE `вакансии` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `компания`
--

DROP TABLE IF EXISTS `компания`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `компания` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Название` varchar(45) DEFAULT NULL,
  `Адрес` varchar(45) DEFAULT NULL,
  `Телефон` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `компания`
--

LOCK TABLES `компания` WRITE;
/*!40000 ALTER TABLE `компания` DISABLE KEYS */;
/*!40000 ALTER TABLE `компания` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `найм`
--

DROP TABLE IF EXISTS `найм`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `найм` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Дата собеседования` date DEFAULT NULL,
  `Дата начала работы` date DEFAULT NULL,
  `Статус` varchar(45) DEFAULT NULL,
  `id_вакансии` int DEFAULT NULL,
  `id_соискатель` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `5_idx` (`id_вакансии`),
  KEY `6_idx` (`id_соискатель`),
  CONSTRAINT `5` FOREIGN KEY (`id_вакансии`) REFERENCES `вакансии` (`id`),
  CONSTRAINT `6` FOREIGN KEY (`id_соискатель`) REFERENCES `соискатель` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `найм`
--

LOCK TABLES `найм` WRITE;
/*!40000 ALTER TABLE `найм` DISABLE KEYS */;
/*!40000 ALTER TABLE `найм` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `пользователи`
--

DROP TABLE IF EXISTS `пользователи`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `пользователи` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Фамилия` varchar(45) DEFAULT NULL,
  `Имя` varchar(45) DEFAULT NULL,
  `Отчество` varchar(45) DEFAULT NULL,
  `Роль` varchar(45) DEFAULT NULL,
  `Пароль` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `пользователи`
--

LOCK TABLES `пользователи` WRITE;
/*!40000 ALTER TABLE `пользователи` DISABLE KEYS */;
/*!40000 ALTER TABLE `пользователи` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `соискатель`
--

DROP TABLE IF EXISTS `соискатель`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `соискатель` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Фамилия` varchar(45) DEFAULT NULL,
  `Имя` varchar(45) DEFAULT NULL,
  `Отчество` varchar(45) DEFAULT NULL,
  `Желаемая заработная плата` varchar(45) DEFAULT NULL,
  `id_текущая_вакансия` int DEFAULT NULL,
  `id_желаемая_вакансия` int DEFAULT NULL,
  `id_компании` int DEFAULT NULL,
  `Образование` varchar(150) DEFAULT NULL,
  `Навыки` varchar(500) DEFAULT NULL,
  `Дата начала работы` date DEFAULT NULL,
  `Дата окончания работы` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_желаемая_вакансия_idx` (`id_текущая_вакансия`,`id_желаемая_вакансия`),
  KEY `id_компании_idx` (`id_компании`),
  KEY `1_idx` (`id_желаемая_вакансия`),
  CONSTRAINT `1` FOREIGN KEY (`id_желаемая_вакансия`) REFERENCES `вакансии` (`id`),
  CONSTRAINT `2` FOREIGN KEY (`id_текущая_вакансия`) REFERENCES `вакансии` (`id`),
  CONSTRAINT `3` FOREIGN KEY (`id_компании`) REFERENCES `компания` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `соискатель`
--

LOCK TABLES `соискатель` WRITE;
/*!40000 ALTER TABLE `соискатель` DISABLE KEYS */;
/*!40000 ALTER TABLE `соискатель` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-30 13:35:52
