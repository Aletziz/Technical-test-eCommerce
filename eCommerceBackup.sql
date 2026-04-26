-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `register_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'alexis.glez@example.com','Alexis Glez','+53 12345679','2026-04-25 10:55:53.713582'),(2,'carlos.mendoza@example.com','Carlos Alberto Mendoza','+53 555-6789','2026-04-25 10:57:55.193981'),(3,'luisa.rojas@example.com','Luisa Fernanda Rojas','+53 555-7890','2026-04-25 10:58:11.566893'),(4,'andres.herrera@example.com','Andrés Felipe Herrera','+53 555-8901','2026-04-25 10:58:39.260419'),(5,'claudia.mora@example.com','Claudia Patricia Mora','+53 555-9012','2026-04-25 10:58:53.833283'),(6,'juan.perez@example.com','Juan Pérez','+53 12345678','2026-04-25 12:49:13.231949');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdhs1mfl2idhy7idq8i2e3ftgb` (`product_id`),
  KEY `FKhnsosbuy7bhpqpnt3bjr7sh8x` (`order_id`),
  CONSTRAINT `FKdhs1mfl2idhy7idq8i2e3ftgb` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKhnsosbuy7bhpqpnt3bjr7sh8x` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,899.99,1,1,2),(2,29.99,2,1,5),(3,899.99,1,2,1),(4,149.5,1,2,3),(8,899.99,2,4,1),(9,79.9,1,4,4),(10,119.99,1,4,5);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `register_date` datetime(6) DEFAULT NULL,
  `state` enum('CANCELADO','ENTREGADO','ENVIADO','PENDIENTE') DEFAULT NULL,
  `client_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK17yo6gry2nuwg2erwhbaxqbs9` (`client_id`),
  CONSTRAINT `FK17yo6gry2nuwg2erwhbaxqbs9` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2026-04-25 12:40:16.996620','PENDIENTE',1),(2,'2026-04-25 12:42:01.305079','PENDIENTE',2),(4,'2026-04-25 14:20:25.734633','ENVIADO',3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Laptop de alto rendimiento con 16GB RAM y 512GB SSD','Laptop Gamer GTX',899.99,22),(2,'Monitor de ritmo cardíaco, GPS, notificaciones y resistencia al agua','Smartwatch Xiaomi Mi Band 7',39.9,200),(3,'Monitor IPS de 24 pulgadas, 75Hz, puertos HDMI y VGA','Monitor 24\" Full HD',149.5,44),(4,'Teclado mecánico con switches azules, retroiluminación RGB','Teclado Mecánico RGB',79.9,77),(5,'Almacenamiento portátil USB 3.0, compatible con PC y Mac','Disco Duro Externo 1TB',59.99,116);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-25 14:38:42
