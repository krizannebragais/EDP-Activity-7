-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bragais_database_edp
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `idadmin` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `confirm_password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'useruser','password','password'),(2,'range','range','range');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `afforable_laptops`
--

DROP TABLE IF EXISTS `afforable_laptops`;
/*!50001 DROP VIEW IF EXISTS `afforable_laptops`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `afforable_laptops` AS SELECT 
 1 AS `brand`,
 1 AS `series`,
 1 AS `l_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_list`
--

DROP TABLE IF EXISTS `employee_list`;
/*!50001 DROP VIEW IF EXISTS `employee_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_list` AS SELECT 
 1 AS `fname`,
 1 AS `lname`,
 1 AS `branch`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `branch` int DEFAULT NULL,
  `salary` double DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `branch_assigned_idx` (`branch`),
  CONSTRAINT `branch_assigned` FOREIGN KEY (`branch`) REFERENCES `stores` (`stored_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Ellis','Calma',1,15000),(2,'Bonifacio','Beverly',2,15000),(3,'Alizeé','Velazquez',3,18000),(4,'Aquene','Gonzales',4,15000),(5,'Sunday','Rosales',5,20000),(6,'Avis','Salinas',6,15000),(7,'Katrice','Gomez',7,18000),(8,'Kimberly','Castor',8,15000),(9,'Nora','Paras',9,15000),(10,'Eloise','Dominguez',10,15000);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laptop_stock`
--

DROP TABLE IF EXISTS `laptop_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laptop_stock` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) DEFAULT NULL,
  `series` varchar(45) DEFAULT NULL,
  `l_price` double DEFAULT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laptop_stock`
--

LOCK TABLES `laptop_stock` WRITE;
/*!40000 ALTER TABLE `laptop_stock` DISABLE KEYS */;
INSERT INTO `laptop_stock` VALUES (1,'Acer','x',35000),(2,'Lenovo','e',20000),(3,'Microsoft','d',30000),(4,'Asus','f',35000),(5,'MSI','y',50000),(6,'Samsung','s',24000),(7,'Dell','p',24000),(8,'Apple','z',59000),(9,'Razer','r',60000),(10,'HP','h',30000);
/*!40000 ALTER TABLE `laptop_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peripherals_stock`
--

DROP TABLE IF EXISTS `peripherals_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peripherals_stock` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(45) DEFAULT NULL,
  `prod_type` varchar(45) DEFAULT NULL,
  `p_price` double DEFAULT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peripherals_stock`
--

LOCK TABLES `peripherals_stock` WRITE;
/*!40000 ALTER TABLE `peripherals_stock` DISABLE KEYS */;
INSERT INTO `peripherals_stock` VALUES (1,'beats_studio_buds','audio_devices',1500),(2,'laptop_sleeve','containers',200),(3,'laptop_bag','containers',400),(4,'pro_webcam,','media_devices',700),(5,'mechanical_keyboard','accessories',2500),(6,'cooling_pad','accessories',850),(7,'lap_desk','furniture',500),(8,'portable_ssd','storage_devices',1000),(9,'usb_32gb','storage_devices',750),(10,'card_reader','accessories',300);
/*!40000 ALTER TABLE `peripherals_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_history`
--

DROP TABLE IF EXISTS `sale_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_history` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `sale_date` date DEFAULT NULL,
  `sale_type` varchar(45) DEFAULT NULL,
  `branch_of_sale` int DEFAULT NULL,
  `laptop_id` int DEFAULT NULL,
  `peripheral_id` int DEFAULT NULL,
  `total_sale` double DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `branch_idx` (`branch_of_sale`),
  KEY `laptop_idx` (`laptop_id`),
  KEY `peripheral_idx` (`peripheral_id`),
  CONSTRAINT `branch` FOREIGN KEY (`branch_of_sale`) REFERENCES `stores` (`stored_id`),
  CONSTRAINT `laptop` FOREIGN KEY (`laptop_id`) REFERENCES `laptop_stock` (`prod_id`),
  CONSTRAINT `peripheral` FOREIGN KEY (`peripheral_id`) REFERENCES `peripherals_stock` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_history`
--

LOCK TABLES `sale_history` WRITE;
/*!40000 ALTER TABLE `sale_history` DISABLE KEYS */;
INSERT INTO `sale_history` VALUES (1,'2024-02-08','laptop_sale',1,1,NULL,2000),(2,'2024-02-07','laptop_sale',2,9,NULL,2000),(3,'2024-02-04','accessory_sale',3,NULL,3,2200),(4,'2024-02-03','accessory_sale',4,NULL,4,3000),(5,'2024-01-26','accessory_sale',5,NULL,5,600),(6,'2024-01-29','laptop_sale',6,7,NULL,24000),(7,'2024-01-29','accessory_sale',7,NULL,6,1050),(8,'2024-01-31','accessory_sale',8,NULL,7,4000),(9,'2024-01-31','laptop_sale',9,8,NULL,59000),(10,'2024-02-03','accessory_sale',10,NULL,1,850),(12,NULL,NULL,NULL,NULL,NULL,2000);
/*!40000 ALTER TABLE `sale_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `stored_id` int NOT NULL AUTO_INCREMENT,
  `store_loc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stored_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Daraga'),(2,'Tiwi'),(3,'Legazpi'),(4,'Camalig'),(5,'Naga'),(6,'Tabaco'),(7,'Sorsogon'),(8,'Gubat'),(9,'Bacacay'),(10,'Malilipot');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_stores`
--

DROP TABLE IF EXISTS `top_stores`;
/*!50001 DROP VIEW IF EXISTS `top_stores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_stores` AS SELECT 
 1 AS `branch_of_sale`,
 1 AS `total_sale`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `total_sale_type`
--

DROP TABLE IF EXISTS `total_sale_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `total_sale_type` (
  `total_laptop_sale` int NOT NULL AUTO_INCREMENT,
  `sale_type` varchar(45) DEFAULT NULL,
  `total` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`total_laptop_sale`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_sale_type`
--

LOCK TABLES `total_sale_type` WRITE;
/*!40000 ALTER TABLE `total_sale_type` DISABLE KEYS */;
INSERT INTO `total_sale_type` VALUES (1,'laptop_sale','83000'),(2,'laptop_sale',NULL),(3,'laptop_sale',NULL);
/*!40000 ALTER TABLE `total_sale_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bragais_database_edp'
--

--
-- Dumping routines for database 'bragais_database_edp'
--
/*!50003 DROP FUNCTION IF EXISTS `calculate_total_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calculate_total_price`(
    laptop_id_param INT,
    peripheral_id_param INT
) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE laptop_price DECIMAL(10, 2);
    DECLARE peripheral_price DECIMAL(10, 2);

    SELECT l_price INTO laptop_price
    FROM laptop_stock
    WHERE prod_id = laptop_id_param;

    SELECT p_price INTO peripheral_price
    FROM peripherals_stock
    WHERE prod_id = peripheral_id_param;

    RETURN laptop_price + peripheral_price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_laptop_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_laptop_price`(
    IN laptop_id_param INT,
    IN new_price DECIMAL(10, 2)
)
BEGIN
    UPDATE laptop_stock
    SET l_price = new_price
    WHERE prod_id = laptop_id_param;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `afforable_laptops`
--

/*!50001 DROP VIEW IF EXISTS `afforable_laptops`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `afforable_laptops` AS select `laptop_stock`.`brand` AS `brand`,`laptop_stock`.`series` AS `series`,`laptop_stock`.`l_price` AS `l_price` from `laptop_stock` where (`laptop_stock`.`l_price` < 25000.00) order by `laptop_stock`.`l_price` desc limit 3 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_list`
--

/*!50001 DROP VIEW IF EXISTS `employee_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_list` AS select `employees`.`fname` AS `fname`,`employees`.`lname` AS `lname`,`employees`.`branch` AS `branch` from `employees` limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_stores`
--

/*!50001 DROP VIEW IF EXISTS `top_stores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_stores` AS select `sale_history`.`branch_of_sale` AS `branch_of_sale`,`sale_history`.`total_sale` AS `total_sale` from `sale_history` order by `sale_history`.`total_sale` desc limit 5 */;
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

-- Dump completed on 2024-04-30  0:12:07
