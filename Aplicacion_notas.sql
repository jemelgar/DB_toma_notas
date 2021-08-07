-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: note_taking_db
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Música'),(2,'Varios'),(3,'Tecnología'),(4,'Estilo de vida'),(5,'Carros'),(6,'Salud'),(7,'Moda'),(8,'Mundial'),(9,'Deportes'),(10,'Celebridades');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_has_notas`
--

DROP TABLE IF EXISTS `categorias_has_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_has_notas` (
  `categorias_id_categoria` int NOT NULL,
  `notas_id_nota` int NOT NULL,
  PRIMARY KEY (`categorias_id_categoria`,`notas_id_nota`),
  KEY `fk_categorias_has_notas_notas1_idx` (`notas_id_nota`),
  KEY `fk_categorias_has_notas_categorias1_idx` (`categorias_id_categoria`),
  CONSTRAINT `fk_categorias_has_notas_categorias1` FOREIGN KEY (`categorias_id_categoria`) REFERENCES `categorias` (`id_categoria`),
  CONSTRAINT `fk_categorias_has_notas_notas1` FOREIGN KEY (`notas_id_nota`) REFERENCES `notas` (`id_nota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_has_notas`
--

LOCK TABLES `categorias_has_notas` WRITE;
/*!40000 ALTER TABLE `categorias_has_notas` DISABLE KEYS */;
INSERT INTO `categorias_has_notas` VALUES (1,1),(2,1),(3,1),(3,2),(1,3),(5,4),(6,5),(7,5),(7,6),(7,7),(1,8),(7,8),(8,8),(1,9),(1,10),(3,10);
/*!40000 ALTER TABLE `categorias_has_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas` (
  `id_nota` int NOT NULL AUTO_INCREMENT,
  `contenido` text NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `fecha_eliminación` datetime DEFAULT NULL,
  `es_eliminable` tinyint NOT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `id_usuario_idx` (`id_usuario`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'Lorem ipsum','nota 1','2021-08-07 13:52:24',NULL,NULL,1,1),(2,'Lorem ipsum 2','nota 2','2021-08-07 13:52:24',NULL,NULL,1,2),(3,'Lorem ipsum 3','nota 3','2021-08-07 13:52:24',NULL,NULL,1,3),(4,'Lorem ipsum 4','nota 4','2021-08-07 13:52:24',NULL,NULL,1,4),(5,'Lorem ipsum 5','nota 5','2021-08-07 13:52:24',NULL,NULL,1,5),(6,'Lorem ipsum 6','nota 6','2021-08-07 13:52:24',NULL,NULL,1,6),(7,'Lorem ipsum 7','nota 7','2021-08-07 13:52:24',NULL,NULL,1,7),(8,'Lorem ipsum 8','nota 8','2021-08-07 13:52:24',NULL,NULL,1,8),(9,'Lorem ipsum 9','nota 9','2021-08-07 13:52:24',NULL,NULL,1,9),(10,'Lorem ipsum 10','nota 10','2021-08-07 13:52:24',NULL,NULL,1,10);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `todas_notas`
--

DROP TABLE IF EXISTS `todas_notas`;
/*!50001 DROP VIEW IF EXISTS `todas_notas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `todas_notas` AS SELECT 
 1 AS `first_name`,
 1 AS `titulo`,
 1 AS `contenido`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Enrique','Melgar','e.melgar','j_enriquem@hotmail.com'),(2,'usuario 1','apellido 1','user1','user1q@mail.com'),(3,'usuario 2','apellido 2','user2','user2q@mail.com'),(4,'usuario 3','apellido 3','user3','user3q@mail.com'),(5,'usuario 4','apellido 4','user4','user4q@mail.com'),(6,'usuario 5','apellido 5','user5','user5q@mail.com'),(7,'usuario 6','apellido 6','user6','user6q@mail.com'),(8,'usuario 7','apellido 7','user1','user7q@mail.com'),(9,'usuario 8','apellido 8','user1','user8q@mail.com'),(10,'usuario 9','apellido 9','user9','user9q@mail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `todas_notas`
--

/*!50001 DROP VIEW IF EXISTS `todas_notas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `todas_notas` AS select `usuarios`.`first_name` AS `first_name`,`notas`.`titulo` AS `titulo`,`notas`.`contenido` AS `contenido`,`categorias`.`nombre` AS `nombre` from (((`usuarios` join `notas` on((`usuarios`.`id_usuario` = `notas`.`id_usuario`))) join `categorias_has_notas` on((`notas`.`id_nota` = `categorias_has_notas`.`notas_id_nota`))) join `categorias` on((`categorias`.`id_categoria` = `categorias_has_notas`.`categorias_id_categoria`))) */;
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

-- Dump completed on 2021-08-07 14:13:00
