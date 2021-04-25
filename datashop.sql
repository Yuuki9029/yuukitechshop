-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: datashop
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `line1` varchar(255) DEFAULT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_addresses_users1_idx` (`user_id`),
  CONSTRAINT `fk_addresses_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Address1','Address2','Da Nang','123456789',1),(2,'Address1','Address2','Ha Noi','123456789',2);
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Laptop'),(2,'Phone');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_users1_idx` (`user_id`),
  CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (7,1),(8,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(120,1),(121,1),(122,1),(6,2),(42,2),(43,2),(44,2),(63,2),(104,2),(105,2),(106,2),(107,2),(108,2),(109,2),(110,2),(111,2),(112,2),(113,2),(114,2),(115,2),(116,2),(117,2),(118,2),(119,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_details`
--

DROP TABLE IF EXISTS `orders_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_orders_has_products_products1_idx` (`product_id`),
  KEY `fk_orders_has_products_orders1_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_details`
--

LOCK TABLES `orders_details` WRITE;
/*!40000 ALTER TABLE `orders_details` DISABLE KEYS */;
INSERT INTO `orders_details` VALUES (1,6,27,1),(2,6,26,1),(3,6,49,1),(4,7,4,1),(5,8,38,1),(6,8,5,1),(7,8,53,1),(9,24,26,1),(10,24,49,1),(11,24,38,1),(12,24,27,1),(45,39,1,3),(46,39,13,3),(47,39,18,2),(49,40,1,2),(50,40,18,1),(51,40,38,2),(52,40,13,2),(53,41,31,2),(54,42,1,2),(55,42,18,1),(56,42,38,2),(57,42,13,2),(58,43,13,2),(59,43,1,2),(60,43,18,1),(61,43,38,2),(62,44,1,2),(63,44,32,3),(64,44,13,8),(65,44,18,5),(66,52,4,1),(67,53,7,1),(68,54,1,1),(69,55,3,6),(70,56,1,1),(71,56,4,1),(72,56,7,1),(73,56,6,1),(74,57,2,1),(75,57,3,1),(76,58,3,1),(77,58,2,1),(78,59,2,1),(79,59,3,1),(80,60,2,1),(81,60,3,1),(82,61,2,1),(83,61,3,1),(84,62,1,1),(85,62,4,1),(86,63,1,2),(87,63,18,5),(88,63,32,3),(89,63,13,8),(90,64,1,1),(91,64,2,1),(92,65,2,1),(93,65,3,1),(94,66,2,1),(95,67,3,2),(96,67,2,3),(97,68,8,2),(98,68,7,1),(99,69,5,2),(100,69,6,1),(101,70,2,1),(102,70,3,1),(103,71,2,1),(104,71,1,2),(105,71,4,6),(106,71,3,3),(107,72,1,1),(108,72,3,1),(109,73,6,2),(110,73,4,1),(111,74,5,1),(112,75,6,1),(113,76,2,1),(114,77,2,1),(115,77,3,1),(116,78,1,1),(117,78,2,1),(118,79,6,2),(119,79,8,1),(120,79,7,1),(121,80,1,1),(122,80,2,3),(123,81,4,3),(124,81,2,6),(125,81,3,6),(126,82,2,1),(127,82,3,1),(128,83,5,1),(129,85,3,3),(130,85,6,4),(131,85,4,1),(132,86,2,1),(133,87,4,3),(134,87,6,1),(135,89,7,4),(136,89,4,2),(137,89,5,3),(138,89,6,8),(139,90,4,4),(140,91,2,1),(141,93,2,1),(142,93,3,1),(143,94,2,1),(144,94,3,3),(145,95,5,1),(146,95,3,1),(147,95,2,1),(148,96,2,8),(149,96,4,1),(150,96,3,1),(151,97,6,1),(152,97,5,1),(153,98,3,6),(154,98,4,3),(155,99,2,14),(156,99,5,2),(157,100,2,5),(158,101,3,1),(159,102,3,3),(160,103,2,1),(161,103,4,3),(162,104,1,2),(163,104,32,3),(164,104,13,8),(165,104,18,5),(166,105,1,2),(167,105,32,3),(168,105,18,5),(169,105,13,8),(170,106,13,8),(171,106,1,2),(172,106,32,3),(173,106,18,5),(174,107,1,2),(175,107,18,5),(176,107,32,3),(177,107,13,8),(178,108,2,1),(179,109,2,1),(180,110,5,1),(181,110,4,1),(182,111,6,4),(183,111,7,1),(184,112,5,1),(185,112,2,1),(186,112,3,1),(187,113,2,1),(188,114,3,1),(189,115,2,1),(190,115,3,1),(191,116,3,1),(192,116,5,6),(193,117,4,1),(194,117,5,1),(195,118,2,1),(196,119,3,1),(197,120,2,1),(198,121,2,2),(199,122,3,1);
/*!40000 ALTER TABLE `orders_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `quantity` int NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `cat_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_ibfk_1` (`cat_id`),
  FULLTEXT KEY `description` (`description`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Surface Laptop','https://surfacecu.com.vn/wp-content/uploads/2020/05/surface-laptop-3-a1-1.jpg','https://surfacecu.com.vn/wp-content/uploads/2020/05/surface-laptop-3-a2-1.jpg','3 13.5 inch Core i5 RAM 8GB SSD 256GB',1000,0,'Laptop',1),(2,'Apple MacBook Pro M1 2020','https://news.hanoicomputer.vn/wp-content/uploads/2020/12/GfinEMFXnT42BFxAcDc2rA.jpg','https://news.hanoicomputer.vn/wp-content/uploads/2020/12/GfinEMFXnT42BFxAcDc2rA.jpg','13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display',30000000,48,'MACBOOK',1),(3,'Xiaomi Redmi Note 8','https://cdn.tgdd.vn/Products/Images/42/209535/xiaomi-redmi-note-8-white-1-200x200.jpg','https://cdn.tgdd.vn/Products/Images/42/209535/xiaomi-redmi-note-8-white-1-200x200.jpg','6.3-inch Corning Gorilla Glass 5',3000000,19,'Smart Phone',2),(4,'Laptop Dell Vostro 5581 I5-8265U','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' IPS 15.6-inch FHD (1920x768) i5-8265U ',15000000,20,'Laptop',1),(5,'Laptop Dell Inspiron 7490 N4I5106W','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' 14.0 inch FHD (1920×1080) Truelife 300nits 100%sGRB CPU: Intel® Core™ i5-10210U  ',24000000,20,'Laptop',1),(6,'Laptop ASUS VivoBook X415JA-EK096T','https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-vivobook-14-x415ja-4.jpg','NULL',' Core i3-1005G1/4GB/256GB SSD/14.0 FHD ',10000000,20,'Laptop',1),(7,'Apple MacBook Pro M1 2020','https://news.hanoicomputer.vn/wp-content/uploads/2020/12/GfinEMFXnT42BFxAcDc2rA.jpg','NULL','13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display',30000000,51,'MACBOOK',1),(8,'Xiaomi Redmi Note 8','https://cdn.tgdd.vn/Products/Images/42/209535/xiaomi-redmi-note-8-white-1-200x200.jpg','NULL','6.3-inch Corning Gorilla Glass 5',3000000,20,'Smart Phone',2),(9,'Laptop Dell Vostro 5581 I5-8265U','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' IPS 15.6-inch FHD (1920x768) i5-8265U ',15000000,20,'Laptop',1),(10,'Laptop Dell Inspiron 7490 N4I5106W','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' 14.0 inch FHD (1920×1080) Truelife 300nits 100%sGRB CPU: Intel® Core™ i5-10210U  ',24000000,20,'Laptop',1),(11,'Laptop ASUS VivoBook X415JA-EK096T','https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-vivobook-14-x415ja-4.jpg','NULL',' Core i3-1005G1/4GB/256GB SSD/14.0 FHD ',10000000,20,'Laptop',1),(12,'Apple MacBook Pro M1 2020','https://news.hanoicomputer.vn/wp-content/uploads/2020/12/GfinEMFXnT42BFxAcDc2rA.jpg','NULL','13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display',30000000,51,'MACBOOK',1),(13,'Xiaomi Redmi Note 8','https://cdn.tgdd.vn/Products/Images/42/209535/xiaomi-redmi-note-8-white-1-200x200.jpg','NULL','6.3-inch Corning Gorilla Glass 5',3000000,20,'Smart Phone',2),(14,'Laptop Dell Vostro 5581 I5-8265U','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' IPS 15.6-inch FHD (1920x768) i5-8265U ',15000000,20,'Laptop',1),(15,'Laptop Dell Inspiron 7490 N4I5106W','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' 14.0 inch FHD (1920×1080) Truelife 300nits 100%sGRB CPU: Intel® Core™ i5-10210U  ',24000000,20,'Laptop',1),(16,'Laptop ASUS VivoBook X415JA-EK096T','https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-vivobook-14-x415ja-4.jpg','NULL',' Core i3-1005G1/4GB/256GB SSD/14.0 FHD ',10000000,20,'Laptop',1),(17,'Apple MacBook Pro M1 2020','https://news.hanoicomputer.vn/wp-content/uploads/2020/12/GfinEMFXnT42BFxAcDc2rA.jpg','NULL','13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display',30000000,51,'MACBOOK',1),(18,'Xiaomi Redmi Note 8','https://cdn.tgdd.vn/Products/Images/42/209535/xiaomi-redmi-note-8-white-1-200x200.jpg','NULL','6.3-inch Corning Gorilla Glass 5',3000000,20,'Smart Phone',2),(19,'Laptop Dell Vostro 5581 I5-8265U','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' IPS 15.6-inch FHD (1920x768) i5-8265U ',15000000,20,'Laptop',1),(20,'Laptop Dell Inspiron 7490 N4I5106W','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' 14.0 inch FHD (1920×1080) Truelife 300nits 100%sGRB CPU: Intel® Core™ i5-10210U  ',24000000,20,'Laptop',1),(21,'Laptop ASUS VivoBook X415JA-EK096T','https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-vivobook-14-x415ja-4.jpg','NULL',' Core i3-1005G1/4GB/256GB SSD/14.0 FHD ',10000000,20,'Laptop',1),(22,'Apple MacBook Pro M1 2020','https://news.hanoicomputer.vn/wp-content/uploads/2020/12/GfinEMFXnT42BFxAcDc2rA.jpg','NULL','13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display',30000000,51,'MACBOOK',1),(23,'Xiaomi Redmi Note 8','https://cdn.tgdd.vn/Products/Images/42/209535/xiaomi-redmi-note-8-white-1-200x200.jpg','NULL','6.3-inch Corning Gorilla Glass 5',3000000,20,'Smart Phone',2),(24,'Laptop Dell Vostro 5581 I5-8265U','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' IPS 15.6-inch FHD (1920x768) i5-8265U ',15000000,20,'Laptop',1),(25,'Laptop Dell Inspiron 7490 N4I5106W','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' 14.0 inch FHD (1920×1080) Truelife 300nits 100%sGRB CPU: Intel® Core™ i5-10210U  ',24000000,20,'Laptop',1),(26,'Laptop ASUS VivoBook X415JA-EK096T','https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-vivobook-14-x415ja-4.jpg','NULL',' Core i3-1005G1/4GB/256GB SSD/14.0 FHD ',10000000,20,'Laptop',1),(27,'Apple MacBook Pro M1 2020','https://news.hanoicomputer.vn/wp-content/uploads/2020/12/GfinEMFXnT42BFxAcDc2rA.jpg','NULL','13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display',30000000,51,'MACBOOK',1),(28,'Xiaomi Redmi Note 8','https://cdn.tgdd.vn/Products/Images/42/209535/xiaomi-redmi-note-8-white-1-200x200.jpg','NULL','6.3-inch Corning Gorilla Glass 5',3000000,20,'Smart Phone',2),(29,'Laptop Dell Vostro 5581 I5-8265U','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' IPS 15.6-inch FHD (1920x768) i5-8265U ',15000000,20,'Laptop',1),(30,'Laptop Dell Inspiron 7490 N4I5106W','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' 14.0 inch FHD (1920×1080) Truelife 300nits 100%sGRB CPU: Intel® Core™ i5-10210U  ',24000000,20,'Laptop',1),(31,'Laptop ASUS VivoBook X415JA-EK096T','https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-vivobook-14-x415ja-4.jpg','NULL',' Core i3-1005G1/4GB/256GB SSD/14.0 FHD ',10000000,20,'Laptop',1),(32,'Apple MacBook Pro M1 2020','https://news.hanoicomputer.vn/wp-content/uploads/2020/12/GfinEMFXnT42BFxAcDc2rA.jpg','NULL','13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display',30000000,51,'MACBOOK',1),(33,'Xiaomi Redmi Note 8','https://cdn.tgdd.vn/Products/Images/42/209535/xiaomi-redmi-note-8-white-1-200x200.jpg','NULL','6.3-inch Corning Gorilla Glass 5',3000000,20,'Smart Phone',2),(34,'Laptop Dell Vostro 5581 I5-8265U','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' IPS 15.6-inch FHD (1920x768) i5-8265U ',15000000,20,'Laptop',1),(35,'Laptop Dell Inspiron 7490 N4I5106W','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' 14.0 inch FHD (1920×1080) Truelife 300nits 100%sGRB CPU: Intel® Core™ i5-10210U  ',24000000,20,'Laptop',1),(36,'Laptop ASUS VivoBook X415JA-EK096T','https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-vivobook-14-x415ja-4.jpg','NULL',' Core i3-1005G1/4GB/256GB SSD/14.0 FHD ',10000000,20,'Laptop',1),(37,'Apple MacBook Pro M1 2020','https://news.hanoicomputer.vn/wp-content/uploads/2020/12/GfinEMFXnT42BFxAcDc2rA.jpg','NULL','13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display',30000000,51,'MACBOOK',1),(38,'Xiaomi Redmi Note 8','https://cdn.tgdd.vn/Products/Images/42/209535/xiaomi-redmi-note-8-white-1-200x200.jpg','NULL','6.3-inch Corning Gorilla Glass 5',3000000,20,'Smart Phone',2),(39,'Laptop Dell Vostro 5581 I5-8265U','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' IPS 15.6-inch FHD (1920x768) i5-8265U ',15000000,20,'Laptop',1),(40,'Laptop Dell Inspiron 7490 N4I5106W','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' 14.0 inch FHD (1920×1080) Truelife 300nits 100%sGRB CPU: Intel® Core™ i5-10210U  ',24000000,20,'Laptop',1),(41,'Laptop ASUS VivoBook X415JA-EK096T','https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-vivobook-14-x415ja-4.jpg','NULL',' Core i3-1005G1/4GB/256GB SSD/14.0 FHD ',10000000,20,'Laptop',1),(42,'Apple MacBook Pro M1 2020','https://news.hanoicomputer.vn/wp-content/uploads/2020/12/GfinEMFXnT42BFxAcDc2rA.jpg','NULL','13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display',30000000,51,'MACBOOK',1),(43,'Xiaomi Redmi Note 8','https://cdn.tgdd.vn/Products/Images/42/209535/xiaomi-redmi-note-8-white-1-200x200.jpg','NULL','6.3-inch Corning Gorilla Glass 5',3000000,20,'Smart Phone',2),(44,'Laptop Dell Vostro 5581 I5-8265U','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' IPS 15.6-inch FHD (1920x768) i5-8265U ',15000000,20,'Laptop',1),(45,'Laptop Dell Inspiron 7490 N4I5106W','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' 14.0 inch FHD (1920×1080) Truelife 300nits 100%sGRB CPU: Intel® Core™ i5-10210U  ',24000000,20,'Laptop',1),(46,'Laptop ASUS VivoBook X415JA-EK096T','https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-vivobook-14-x415ja-4.jpg','NULL',' Core i3-1005G1/4GB/256GB SSD/14.0 FHD ',10000000,20,'Laptop',1),(47,'Apple MacBook Pro M1 2020','https://news.hanoicomputer.vn/wp-content/uploads/2020/12/GfinEMFXnT42BFxAcDc2rA.jpg','NULL','13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display',30000000,51,'MACBOOK',1),(48,'Xiaomi Redmi Note 8','https://cdn.tgdd.vn/Products/Images/42/209535/xiaomi-redmi-note-8-white-1-200x200.jpg','NULL','6.3-inch Corning Gorilla Glass 5',3000000,20,'Smart Phone',2),(49,'Laptop Dell Vostro 5581 I5-8265U','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' IPS 15.6-inch FHD (1920x768) i5-8265U ',15000000,20,'Laptop',1),(50,'Laptop Dell Inspiron 7490 N4I5106W','https://gialong.com.vn/wp-content/uploads/2020/08/37180_inspiron_7490_ha2.jpg','NULL',' 14.0 inch FHD (1920×1080) Truelife 300nits 100%sGRB CPU: Intel® Core™ i5-10210U  ',24000000,20,'Laptop',1),(51,'Laptop ASUS VivoBook X415JA-EK096T','https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-vivobook-14-x415ja-4.jpg','NULL',' Core i3-1005G1/4GB/256GB SSD/14.0 FHD ',10000000,20,'Laptop',1),(52,'Apple MacBook Pro M1 2020','https://news.hanoicomputer.vn/wp-content/uploads/2020/12/GfinEMFXnT42BFxAcDc2rA.jpg','NULL','13.3-inch (diagonal) LED-backlit display with IPS technology, Retina display',30000000,51,'MACBOOK',1),(53,'Xiaomi Redmi Note 8','https://cdn.tgdd.vn/Products/Images/42/209535/xiaomi-redmi-note-8-white-1-200x200.jpg','NULL','6.3-inch Corning Gorilla Glass 5',3000000,20,'Smart Phone',2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'not set',
  `lastname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'not set',
  `age` int DEFAULT '18',
  `role` int DEFAULT '555',
  `photoUrl` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `type` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'yuuki','123456','yuuki@gmail.com','Yuuki','Tachi',20,777,'','local'),(2,'azzy','123456','azzy123@gmail.com','Azzy','Azzy',18,555,'','local'),(3,'huyzz','123456','huyzz123@gmail.com','Huy','Quoc',18,555,'','social');
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

-- Dump completed on 2021-04-18 22:17:36
