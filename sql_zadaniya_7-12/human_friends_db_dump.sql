-- MySQL dump 10.13  Distrib 8.4.3, for Linux (x86_64)
--
-- Host: localhost    Database: human_friends_db
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `all_animals`
--

DROP TABLE IF EXISTS `all_animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_animals` (
  `type` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `birth_date` date DEFAULT NULL,
  `age_month` bigint DEFAULT NULL,
  `commands` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_animals`
--

LOCK TABLES `all_animals` WRITE;
/*!40000 ALTER TABLE `all_animals` DISABLE KEYS */;
INSERT INTO `all_animals` VALUES ('dog','Reks','2024-01-15',9,'jump, run'),('dog','Tuzik','2023-04-08',19,'sit down'),('dog','Barbos','2022-01-04',34,'lay'),('cat','Barsik','2022-01-15',33,'jump, sit down'),('cat','Matroskin','2024-07-08',4,'lay'),('cat','Korzhik','2020-02-04',57,'run'),('hamster','Boss','2020-01-17',57,'jump, run'),('hamster','Pushok','2024-04-28',6,'sit down'),('hamster','Chernysh','2021-07-03',40,'sit down'),('horse','Morgan','2021-05-25',41,'jump, run, sit down'),('horse','Gnedoy','2020-07-23',51,'sit down'),('donkey','Yuliy','2023-12-15',10,'lay, sit down'),('donkey','Cesar','2023-04-17',18,'sit down'),('donkey','Mul','2023-04-21',18,'lay');
/*!40000 ALTER TABLE `all_animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cats`
--

DROP TABLE IF EXISTS `cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cats` (
  `id_cat` int NOT NULL AUTO_INCREMENT,
  `id_pet` varchar(20) NOT NULL DEFAULT 'cat',
  `name` varchar(30) NOT NULL,
  `birth_date` date DEFAULT NULL,
  PRIMARY KEY (`id_cat`),
  KEY `id_pet` (`id_pet`),
  CONSTRAINT `cats_ibfk_1` FOREIGN KEY (`id_pet`) REFERENCES `pets` (`id_pet`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cats`
--

LOCK TABLES `cats` WRITE;
/*!40000 ALTER TABLE `cats` DISABLE KEYS */;
INSERT INTO `cats` VALUES (1,'cat','Barsik','2022-01-15'),(2,'cat','Matroskin','2024-07-08'),(3,'cat','Korzhik','2020-02-04');
/*!40000 ALTER TABLE `cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commands` (
  `command` varchar(30) NOT NULL,
  PRIMARY KEY (`command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commands`
--

LOCK TABLES `commands` WRITE;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO `commands` VALUES ('jump'),('lay'),('run'),('sit down');
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dogs`
--

DROP TABLE IF EXISTS `dogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dogs` (
  `id_dog` int NOT NULL AUTO_INCREMENT,
  `id_pet` varchar(20) NOT NULL DEFAULT 'dog',
  `name` varchar(30) NOT NULL,
  `birth_date` date DEFAULT NULL,
  PRIMARY KEY (`id_dog`),
  KEY `id_pet` (`id_pet`),
  CONSTRAINT `dogs_ibfk_1` FOREIGN KEY (`id_pet`) REFERENCES `pets` (`id_pet`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dogs`
--

LOCK TABLES `dogs` WRITE;
/*!40000 ALTER TABLE `dogs` DISABLE KEYS */;
INSERT INTO `dogs` VALUES (1,'dog','Reks','2024-01-15'),(2,'dog','Tuzik','2023-04-08'),(3,'dog','Barbos','2022-01-04');
/*!40000 ALTER TABLE `dogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donkeys`
--

DROP TABLE IF EXISTS `donkeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donkeys` (
  `id_donkey` int NOT NULL AUTO_INCREMENT,
  `id_pack_animal` varchar(20) NOT NULL DEFAULT 'donkey',
  `name` varchar(30) NOT NULL,
  `birth_date` date DEFAULT NULL,
  PRIMARY KEY (`id_donkey`),
  KEY `id_pack_animal` (`id_pack_animal`),
  CONSTRAINT `donkeys_ibfk_1` FOREIGN KEY (`id_pack_animal`) REFERENCES `pack_animals` (`id_pack_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donkeys`
--

LOCK TABLES `donkeys` WRITE;
/*!40000 ALTER TABLE `donkeys` DISABLE KEYS */;
INSERT INTO `donkeys` VALUES (1,'donkey','Yuliy','2023-12-15'),(2,'donkey','Cesar','2023-04-17'),(3,'donkey','Mul','2023-04-21');
/*!40000 ALTER TABLE `donkeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hamsters`
--

DROP TABLE IF EXISTS `hamsters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hamsters` (
  `id_hamster` int NOT NULL AUTO_INCREMENT,
  `id_pet` varchar(20) NOT NULL DEFAULT 'hamster',
  `name` varchar(30) NOT NULL,
  `birth_date` date DEFAULT NULL,
  PRIMARY KEY (`id_hamster`),
  KEY `id_pet` (`id_pet`),
  CONSTRAINT `hamsters_ibfk_1` FOREIGN KEY (`id_pet`) REFERENCES `pets` (`id_pet`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hamsters`
--

LOCK TABLES `hamsters` WRITE;
/*!40000 ALTER TABLE `hamsters` DISABLE KEYS */;
INSERT INTO `hamsters` VALUES (1,'hamster','Boss','2020-01-17'),(2,'hamster','Pushok','2024-04-28'),(3,'hamster','Chernysh','2021-07-03');
/*!40000 ALTER TABLE `hamsters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horses`
--

DROP TABLE IF EXISTS `horses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horses` (
  `id_horse` int NOT NULL AUTO_INCREMENT,
  `id_pack_animal` varchar(20) NOT NULL DEFAULT 'horse',
  `name` varchar(30) NOT NULL,
  `birth_date` date DEFAULT NULL,
  PRIMARY KEY (`id_horse`),
  KEY `id_pack_animal` (`id_pack_animal`),
  CONSTRAINT `horses_ibfk_1` FOREIGN KEY (`id_pack_animal`) REFERENCES `pack_animals` (`id_pack_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horses`
--

LOCK TABLES `horses` WRITE;
/*!40000 ALTER TABLE `horses` DISABLE KEYS */;
INSERT INTO `horses` VALUES (1,'horse','Mustang','2021-12-13'),(2,'horse','Morgan','2021-05-25'),(3,'horse','Gnedoy','2020-07-23');
/*!40000 ALTER TABLE `horses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `human_friends`
--

DROP TABLE IF EXISTS `human_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `human_friends` (
  `id_human_friend` varchar(20) NOT NULL,
  PRIMARY KEY (`id_human_friend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `human_friends`
--

LOCK TABLES `human_friends` WRITE;
/*!40000 ALTER TABLE `human_friends` DISABLE KEYS */;
INSERT INTO `human_friends` VALUES ('pack_animal'),('pet');
/*!40000 ALTER TABLE `human_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_cat_commands`
--

DROP TABLE IF EXISTS `id_cat_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_cat_commands` (
  `id_cat` int NOT NULL,
  `command` varchar(30) NOT NULL,
  PRIMARY KEY (`id_cat`,`command`),
  KEY `command` (`command`),
  CONSTRAINT `id_cat_commands_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `cats` (`id_cat`),
  CONSTRAINT `id_cat_commands_ibfk_2` FOREIGN KEY (`command`) REFERENCES `commands` (`command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_cat_commands`
--

LOCK TABLES `id_cat_commands` WRITE;
/*!40000 ALTER TABLE `id_cat_commands` DISABLE KEYS */;
INSERT INTO `id_cat_commands` VALUES (1,'jump'),(2,'lay'),(3,'run'),(1,'sit down');
/*!40000 ALTER TABLE `id_cat_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_cat_commands_concat`
--

DROP TABLE IF EXISTS `id_cat_commands_concat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_cat_commands_concat` (
  `id_cat` int NOT NULL,
  `commands` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_cat_commands_concat`
--

LOCK TABLES `id_cat_commands_concat` WRITE;
/*!40000 ALTER TABLE `id_cat_commands_concat` DISABLE KEYS */;
INSERT INTO `id_cat_commands_concat` VALUES (1,'jump, sit down'),(2,'lay'),(3,'run');
/*!40000 ALTER TABLE `id_cat_commands_concat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_dog_commands`
--

DROP TABLE IF EXISTS `id_dog_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_dog_commands` (
  `id_dog` int NOT NULL,
  `command` varchar(30) NOT NULL,
  PRIMARY KEY (`id_dog`,`command`),
  KEY `command` (`command`),
  CONSTRAINT `id_dog_commands_ibfk_1` FOREIGN KEY (`id_dog`) REFERENCES `dogs` (`id_dog`),
  CONSTRAINT `id_dog_commands_ibfk_2` FOREIGN KEY (`command`) REFERENCES `commands` (`command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_dog_commands`
--

LOCK TABLES `id_dog_commands` WRITE;
/*!40000 ALTER TABLE `id_dog_commands` DISABLE KEYS */;
INSERT INTO `id_dog_commands` VALUES (1,'jump'),(3,'lay'),(1,'run'),(2,'sit down');
/*!40000 ALTER TABLE `id_dog_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_dog_commands_concat`
--

DROP TABLE IF EXISTS `id_dog_commands_concat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_dog_commands_concat` (
  `id_dog` int NOT NULL,
  `commands` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_dog_commands_concat`
--

LOCK TABLES `id_dog_commands_concat` WRITE;
/*!40000 ALTER TABLE `id_dog_commands_concat` DISABLE KEYS */;
INSERT INTO `id_dog_commands_concat` VALUES (1,'jump, run'),(2,'sit down'),(3,'lay');
/*!40000 ALTER TABLE `id_dog_commands_concat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_donkey_commands`
--

DROP TABLE IF EXISTS `id_donkey_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_donkey_commands` (
  `id_donkey` int NOT NULL,
  `command` varchar(30) NOT NULL,
  PRIMARY KEY (`id_donkey`,`command`),
  KEY `command` (`command`),
  CONSTRAINT `id_donkey_commands_ibfk_1` FOREIGN KEY (`id_donkey`) REFERENCES `donkeys` (`id_donkey`),
  CONSTRAINT `id_donkey_commands_ibfk_2` FOREIGN KEY (`command`) REFERENCES `commands` (`command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_donkey_commands`
--

LOCK TABLES `id_donkey_commands` WRITE;
/*!40000 ALTER TABLE `id_donkey_commands` DISABLE KEYS */;
INSERT INTO `id_donkey_commands` VALUES (1,'lay'),(3,'lay'),(1,'sit down'),(2,'sit down');
/*!40000 ALTER TABLE `id_donkey_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_donkey_commands_concat`
--

DROP TABLE IF EXISTS `id_donkey_commands_concat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_donkey_commands_concat` (
  `id_donkey` int NOT NULL,
  `commands` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_donkey_commands_concat`
--

LOCK TABLES `id_donkey_commands_concat` WRITE;
/*!40000 ALTER TABLE `id_donkey_commands_concat` DISABLE KEYS */;
INSERT INTO `id_donkey_commands_concat` VALUES (1,'lay, sit down'),(2,'sit down'),(3,'lay');
/*!40000 ALTER TABLE `id_donkey_commands_concat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_hamster_commands`
--

DROP TABLE IF EXISTS `id_hamster_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_hamster_commands` (
  `id_hamster` int NOT NULL,
  `command` varchar(30) NOT NULL,
  PRIMARY KEY (`id_hamster`,`command`),
  KEY `command` (`command`),
  CONSTRAINT `id_hamster_commands_ibfk_1` FOREIGN KEY (`id_hamster`) REFERENCES `hamsters` (`id_hamster`),
  CONSTRAINT `id_hamster_commands_ibfk_2` FOREIGN KEY (`command`) REFERENCES `commands` (`command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_hamster_commands`
--

LOCK TABLES `id_hamster_commands` WRITE;
/*!40000 ALTER TABLE `id_hamster_commands` DISABLE KEYS */;
INSERT INTO `id_hamster_commands` VALUES (1,'jump'),(1,'run'),(2,'sit down'),(3,'sit down');
/*!40000 ALTER TABLE `id_hamster_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_hamster_commands_concat`
--

DROP TABLE IF EXISTS `id_hamster_commands_concat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_hamster_commands_concat` (
  `id_hamster` int NOT NULL,
  `commands` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_hamster_commands_concat`
--

LOCK TABLES `id_hamster_commands_concat` WRITE;
/*!40000 ALTER TABLE `id_hamster_commands_concat` DISABLE KEYS */;
INSERT INTO `id_hamster_commands_concat` VALUES (1,'jump, run'),(2,'sit down'),(3,'sit down');
/*!40000 ALTER TABLE `id_hamster_commands_concat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_horse_commands`
--

DROP TABLE IF EXISTS `id_horse_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_horse_commands` (
  `id_horse` int NOT NULL,
  `command` varchar(30) NOT NULL,
  PRIMARY KEY (`id_horse`,`command`),
  KEY `command` (`command`),
  CONSTRAINT `id_horse_commands_ibfk_1` FOREIGN KEY (`id_horse`) REFERENCES `horses` (`id_horse`),
  CONSTRAINT `id_horse_commands_ibfk_2` FOREIGN KEY (`command`) REFERENCES `commands` (`command`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_horse_commands`
--

LOCK TABLES `id_horse_commands` WRITE;
/*!40000 ALTER TABLE `id_horse_commands` DISABLE KEYS */;
INSERT INTO `id_horse_commands` VALUES (2,'jump'),(2,'run'),(2,'sit down'),(3,'sit down');
/*!40000 ALTER TABLE `id_horse_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_horse_commands_concat`
--

DROP TABLE IF EXISTS `id_horse_commands_concat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_horse_commands_concat` (
  `id_horse` int NOT NULL,
  `commands` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_horse_commands_concat`
--

LOCK TABLES `id_horse_commands_concat` WRITE;
/*!40000 ALTER TABLE `id_horse_commands_concat` DISABLE KEYS */;
INSERT INTO `id_horse_commands_concat` VALUES (2,'jump, run, sit down'),(3,'sit down');
/*!40000 ALTER TABLE `id_horse_commands_concat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pack_animals`
--

DROP TABLE IF EXISTS `pack_animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pack_animals` (
  `id_pack_animal` varchar(20) NOT NULL,
  `id_human_friend` varchar(20) NOT NULL DEFAULT 'pack_animal',
  PRIMARY KEY (`id_pack_animal`),
  KEY `id_human_friend` (`id_human_friend`),
  CONSTRAINT `pack_animals_ibfk_1` FOREIGN KEY (`id_human_friend`) REFERENCES `human_friends` (`id_human_friend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pack_animals`
--

LOCK TABLES `pack_animals` WRITE;
/*!40000 ALTER TABLE `pack_animals` DISABLE KEYS */;
INSERT INTO `pack_animals` VALUES ('camel','pack_animal'),('donkey','pack_animal'),('horse','pack_animal');
/*!40000 ALTER TABLE `pack_animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pets` (
  `id_pet` varchar(20) NOT NULL,
  `id_human_friend` varchar(20) NOT NULL DEFAULT 'pet',
  PRIMARY KEY (`id_pet`),
  KEY `id_human_friend` (`id_human_friend`),
  CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`id_human_friend`) REFERENCES `human_friends` (`id_human_friend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES ('cat','pet'),('dog','pet'),('hamster','pet');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `young_animals`
--

DROP TABLE IF EXISTS `young_animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `young_animals` (
  `type` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `birth_date` date DEFAULT NULL,
  `age_month` bigint DEFAULT NULL,
  `commands` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `young_animals`
--

LOCK TABLES `young_animals` WRITE;
/*!40000 ALTER TABLE `young_animals` DISABLE KEYS */;
INSERT INTO `young_animals` VALUES ('dog','Tuzik','2023-04-08',19,'sit down'),('dog','Barbos','2022-01-04',34,'lay'),('cat','Barsik','2022-01-15',33,'jump, sit down'),('donkey','Cesar','2023-04-17',18,'sit down'),('donkey','Mul','2023-04-21',18,'lay');
/*!40000 ALTER TABLE `young_animals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-10  8:17:11
