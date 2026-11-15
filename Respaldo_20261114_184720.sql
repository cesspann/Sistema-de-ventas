-- MySQL dump 10.13  Distrib 26.10.0, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_ventas
-- ------------------------------------------------------
-- Server version	26.10.0

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
-- Current Database: `sistema_ventas`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sistema_ventas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `sistema_ventas`;

--
-- Table structure for table `bitacorafacturacancelada`
--

DROP TABLE IF EXISTS `bitacorafacturacancelada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacorafacturacancelada` (
  `ID_BITACORA_FACTURA` int NOT NULL AUTO_INCREMENT,
  `ID_FACTURA` int NOT NULL,
  `ID_EMPLEADO` int NOT NULL,
  `FECHA_CREACION` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MOTIVO_DE_CANCELACION` varchar(500) NOT NULL,
  PRIMARY KEY (`ID_BITACORA_FACTURA`),
  KEY `FK_PUEDE_REGISTRAR` (`ID_EMPLEADO`),
  KEY `FK_PUEDE_SER_REGISTRADA_COMO` (`ID_FACTURA`),
  CONSTRAINT `FK_PUEDE_REGISTRAR` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PUEDE_SER_REGISTRADA_COMO` FOREIGN KEY (`ID_FACTURA`) REFERENCES `factura` (`ID_FACTURA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CK_MOTIVO_CANCELACION` CHECK ((length(trim(`MOTIVO_DE_CANCELACION`)) > 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacorafacturacancelada`
--

LOCK TABLES `bitacorafacturacancelada` WRITE;
/*!40000 ALTER TABLE `bitacorafacturacancelada` DISABLE KEYS */;
INSERT INTO `bitacorafacturacancelada` VALUES (1,2,11,'2026-10-21 11:14:00','El cliente solicito anular la compra antes de la entrega.'),(2,3,21,'2026-10-22 12:21:00','El cliente solicito anular la compra por cambio de modelo.'),(3,5,11,'2026-10-23 14:35:00','El cliente desistio de la compra antes del despacho.'),(4,6,21,'2026-10-23 15:42:00','El cliente solicito cancelar la compra por error en el modelo.'),(5,20,11,'2026-10-30 11:20:00','El cliente desistio de la compra antes del despacho.'),(6,35,11,'2026-11-07 17:05:00','Se solicito la anulacion por error en los productos seleccionados.'),(7,48,21,'2026-11-13 12:36:00','El cliente solicito cancelar la venta antes de retirar los productos.'),(8,55,11,'2026-11-14 10:03:55','La compra fue anulada por solicitud del cliente antes de la entrega.'),(9,68,21,'2026-11-14 13:54:44','Se anulo la operacion por un error en la cantidad de productos.');
/*!40000 ALTER TABLE `bitacorafacturacancelada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacoraproducto`
--

DROP TABLE IF EXISTS `bitacoraproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacoraproducto` (
  `ID_BITACORA` int NOT NULL AUTO_INCREMENT,
  `ID_PRODUCTO` int NOT NULL,
  `ID_EMPLEADO` int NOT NULL,
  `PRECIO_ANTERIOR` decimal(10,2) NOT NULL,
  `PRECIO_ACTUAL` decimal(10,2) NOT NULL,
  `FECHA_CAMBIO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_BITACORA`),
  KEY `FK_REGISTRA` (`ID_EMPLEADO`),
  KEY `FK_SE_REGISTRA_EN` (`ID_PRODUCTO`),
  CONSTRAINT `FK_REGISTRA` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SE_REGISTRA_EN` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CK_BITA_PROD_PRECIO_ACT` CHECK ((`PRECIO_ACTUAL` > 0)),
  CONSTRAINT `CK_BITA_PROD_PRECIO_ANT` CHECK ((`PRECIO_ANTERIOR` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacoraproducto`
--

LOCK TABLES `bitacoraproducto` WRITE;
/*!40000 ALTER TABLE `bitacoraproducto` DISABLE KEYS */;
INSERT INTO `bitacoraproducto` VALUES (1,1,1,450.00,489.99,'2026-02-10 08:30:00'),(2,3,1,1199.99,1299.99,'2026-02-12 09:15:00'),(3,6,11,329.99,349.99,'2026-02-15 10:00:00'),(4,9,1,399.00,420.00,'2026-02-18 11:20:00'),(5,16,21,329.99,349.99,'2026-02-20 14:10:00'),(6,19,11,850.00,899.99,'2026-02-22 15:30:00'),(7,23,21,390.00,420.00,'2026-02-25 09:45:00'),(8,28,1,1050.00,1100.00,'2026-02-26 16:00:00'),(9,37,11,45.00,49.99,'2026-02-27 10:15:00'),(10,49,21,590.00,620.00,'2026-02-28 11:30:00'),(11,58,1,89.99,99.99,'2026-03-02 13:00:00'),(12,65,11,550.00,580.00,'2026-03-05 14:20:00'),(13,66,21,1100.00,1150.00,'2026-03-08 09:10:00'),(14,69,1,750.00,790.00,'2026-03-10 10:50:00'),(15,83,11,130.00,140.00,'2026-03-12 15:40:00');
/*!40000 ALTER TABLE `bitacoraproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cajero`
--

DROP TABLE IF EXISTS `cajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajero` (
  `ID_EMPLEADO` int NOT NULL,
  `NUMERO_CAJA` int NOT NULL,
  `TURNO` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_EMPLEADO`),
  CONSTRAINT `FK_ES_UN` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CK_CAJERO_NUM_CAJA` CHECK ((`NUMERO_CAJA` > 0)),
  CONSTRAINT `CK_CAJERO_TURNO` CHECK ((`TURNO` in (_utf8mb4'Matutino',_utf8mb4'Vespertino',_utf8mb4'Completo')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajero`
--

LOCK TABLES `cajero` WRITE;
/*!40000 ALTER TABLE `cajero` DISABLE KEYS */;
INSERT INTO `cajero` VALUES (2,1,'Matutino'),(3,2,'Vespertino'),(7,3,'Completo'),(8,4,'Vespertino'),(12,1,'Matutino'),(13,2,'Vespertino'),(16,3,'Completo'),(18,4,'Completo'),(22,1,'Matutino'),(23,2,'Vespertino'),(26,3,'Completo'),(27,4,'Matutino');
/*!40000 ALTER TABLE `cajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `ID_CATEGORIA` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_CATEGORIA` varchar(150) NOT NULL,
  `ESTADO_CATEGORIA` varchar(50) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`ID_CATEGORIA`),
  CONSTRAINT `CK_ESTADO_CATEGORIA` CHECK ((`ESTADO_CATEGORIA` in (_utf8mb4'Activo',_utf8mb4'Inactivo')))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Refrigeración','Activo'),(2,'Línea Blanca','Activo'),(3,'Electrónica','Activo'),(4,'Climatización','Activo'),(5,'Audio y Video','Activo'),(6,'Pequeños Electrodomésticos','Activo'),(7,'Cómputo y Tecnología','Activo'),(8,'Cocina y Repostería','Activo'),(9,'Lavado y Secado','Activo'),(10,'Cuidado Personal','Activo'),(11,'Iluminación y Hogar','Activo'),(12,'Herramientas y Jardín','Activo'),(13,'Muebles de Oficina','Activo'),(14,'Smart Home','Activo'),(15,'Accesorios de Audio','Activo');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_CLIENTE` int NOT NULL AUTO_INCREMENT,
  `CORREO` varchar(100) DEFAULT NULL,
  `TELEFONO_CLIENTE` varchar(20) DEFAULT NULL,
  `ESTADO_CLIENTE` varchar(50) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`ID_CLIENTE`),
  CONSTRAINT `CK_ESTADO_CLIENTE` CHECK ((`ESTADO_CLIENTE` in (_utf8mb4'Activo',_utf8mb4'Inactivo')))
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'carlos.mendoza@gmail.com','7854-1234','Activo'),(2,'ana.guerra@yahoo.com','7234-5678','Activo'),(3,'luis.ramirez@hotmail.com','7987-4321','Activo'),(4,'marta.fuentes@gmail.com','7123-8901','Activo'),(5,'jorge.hernandez@outlook.com','7543-2109','Activo'),(6,'elena.castro@gmail.com','7654-3210','Activo'),(7,'roberto.flores@yahoo.com','7321-6548','Activo'),(8,'sandra.martinez@gmail.com','7456-9871','Activo'),(9,'victor.perez@hotmail.com','7890-1235','Activo'),(10,'claudia.rivas@gmail.com','7111-2233','Activo'),(11,'daniel.cruz@outlook.com','7222-3344','Activo'),(12,'beatriz.gomez@gmail.com','7333-4455','Activo'),(13,'oscar.silva@yahoo.com','7444-5566','Activo'),(14,'patricia.morales@gmail.com','7555-6677','Activo'),(15,'ricardo.ortiz@hotmail.com','7666-7788','Activo'),(16,'gabriela.suarez@gmail.com','7777-8899','Activo'),(17,'fernando.aguilar@outlook.com','7888-9900','Activo'),(18,'sofia.portillo@gmail.com','7999-0011','Activo'),(19,'alejandro.coreas@yahoo.com','7100-1122','Activo'),(20,'daniela.orellana@gmail.com','7200-2233','Activo'),(21,'mauricio.melendez@hotmail.com','7300-3344','Activo'),(22,'carolina.escobar@gmail.com','7400-4455','Activo'),(23,'eduardo.velasquez@outlook.com','7500-5566','Activo'),(24,'katherine.quinteros@gmail.com','7600-6677','Activo'),(25,'hugo.perez@yahoo.com','7700-7788','Activo'),(26,'veronica.ramirez@gmail.com','7800-8899','Activo'),(27,'cesar.romero@hotmail.com','7900-9900','Activo'),(28,'monica.sosa@gmail.com','7123-1111','Activo'),(29,'francisco.amezquita@outlook.com','7234-2222','Activo'),(30,'jessica.guevara@gmail.com','7345-3333','Activo'),(31,'manuel.arevalo@yahoo.com','7456-4444','Activo'),(32,'rocio.navas@gmail.com','7567-5555','Activo'),(33,'alfredo.palacios@hotmail.com','7678-6666','Activo'),(34,'brenda.lara@gmail.com','7789-7777','Activo'),(35,'sergio.bonilla@outlook.com','7890-8888','Activo'),(36,'compras@hotellosrobles.com','2245-1000','Activo'),(37,'adquisiciones@restaurantelaloma.sv','2268-2000','Activo'),(38,'contacto@constructoraaltos.com','2234-3000','Activo'),(39,'admin@hotelorquidea.com','2660-4000','Activo'),(40,'info@cafeterialabenecol.sv','2440-5000','Activo'),(41,'operaciones@inmobiliariacentral.com','2298-6000','Activo'),(42,'gerencia@supermercadoely.com','2332-7000','Activo'),(43,'compras@hotelpalmeras.sv','2661-8000','Activo'),(44,'logistica@industriastecnologicas.com','2279-9000','Activo'),(45,'facturacion@restauranteelsabor.com','2222-1111','Activo'),(46,'admin@residencialessonsonate.com','2451-2222','Activo'),(47,'contacto@hoteltropical.sv','2664-3333','Activo'),(48,'compras@distribuidoramejia.com','2236-4444','Activo'),(49,'ventas@equipamientohogar.com','2272-5555','Activo'),(50,'soporte@constructormontana.sv','2211-6666','Activo'),(51,'admin@hostalcolonial.com','2443-7788','Activo'),(52,'compras@restauranteelfogon.com','2280-9900','Activo'),(53,'finanzas@inversionessanbenito.com','2299-4433','Activo'),(54,'operaciones@corporaciondelnorte.sv','2335-5566','Activo'),(55,'contacto@hotelmiramar.com','2668-7788','Activo'),(56,'admin@cafegourmetsv.com','2225-9988','Activo'),(57,'compras@constructoraorion.com','2244-1122','Activo'),(58,'logistica@multiserviciosglobales.sv','2276-3344','Activo'),(59,'facturacion@hotellapaz.com','2448-5566','Activo'),(60,'admin@comercializadoradelvalle.com','2290-7788','Activo');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientejuridico`
--

DROP TABLE IF EXISTS `clientejuridico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientejuridico` (
  `ID_CLIENTE` int NOT NULL,
  `NOMBRE_REPRESENTANTE_LEGAL` varchar(100) NOT NULL,
  `NIT` varchar(20) NOT NULL,
  `RAZON_SOCIAL` varchar(100) NOT NULL,
  `CUPO_CREDITO_CORPORATIVO` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  UNIQUE KEY `NIT` (`NIT`),
  CONSTRAINT `FK_HEREDA_DE2` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CK_CUPO_CORP` CHECK ((`CUPO_CREDITO_CORPORATIVO` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientejuridico`
--

LOCK TABLES `clientejuridico` WRITE;
/*!40000 ALTER TABLE `clientejuridico` DISABLE KEYS */;
INSERT INTO `clientejuridico` VALUES (36,'Roberto Valdés','0614-120585-101-2','Hoteles y Resorts Los Robles',25000.00),(37,'Mario Benítez','0614-220890-102-5','Restaurantes La Loma',10000.00),(38,'Carmen de Paz','0614-301178-103-8','Constructora Altos de Santa Tecla',50000.00),(39,'Sofia Arévalo','0614-050482-104-1','Hotel Boutique Orquídea',15000.00),(40,'Mauricio Cerna','0614-180995-105-3','Cafetería y Repostería La Benecol',5000.00),(41,'Ricardo Molina','0614-251280-106-7','Inmobiliaria Central',30000.00),(42,'Rosaura Menjívar','0614-090688-107-9','Supermercados Ely',40000.00),(43,'Ernesto Salguero','0614-140275-108-4','Hotel Las Palmeras del Golfo',20000.00),(44,'Marcela Dubón','0614-310191-109-2','Industrias Tecnológicas de C.A.',35000.00),(45,'Humberto Ticas','0614-110783-110-6','Restaurante El Sabor Criollo',8000.00),(46,'Guillermo Portillo','0614-220389-111-8','Inversiones Residenciales Sonsonate',45000.00),(47,'Ana Patricia Rueda','0614-081092-112-1','Hotel Tropical San Miguel',18000.00),(48,'José Luis Mejía','0614-190477-113-5','Distribuidora Mejía e Hijos',22000.00),(49,'Claudia Cárdenas','0614-270884-114-3','Equipamiento del Hogar Moderno',12000.00),(50,'David Sandoval','0614-031290-115-9','Constructora Montaña Alta',60000.00),(51,'Fernando Chinchilla','0614-160586-116-4','Hostal Colonial de Occidente',6000.00),(52,'Gloria Melgar','0614-290993-117-2','Restaurante y Asados El Fogón',9000.00),(53,'Mauricio Interiano','0614-121179-118-8','Inversiones San Benito',28000.00),(54,'Beatriz Orellana','0614-040787-119-1','Corporación del Norte',33000.00),(55,'Roxana Galán','0614-210294-120-5','Hotel y Playa Miramar',24000.00),(56,'Samuel Peraza','0614-150881-121-7','Café Gourmet Salvadoreño',7000.00),(57,'Cristian Landaverde','0614-280689-122-3','Constructora e Inmobiliaria Orión',55000.00),(58,'Walter Espinoza','0614-071092-123-6','Multiservicios Globales de C.A.',15000.00),(59,'Carmen Elena Sosa','0614-130385-124-9','Hotel La Paz de Oriente',17000.00),(60,'Gustavo Adolfo Paz','0614-201276-125-2','Comercializadora del Valle',38000.00);
/*!40000 ALTER TABLE `clientejuridico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientenatural`
--

DROP TABLE IF EXISTS `clientenatural`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientenatural` (
  `ID_CLIENTE` int NOT NULL,
  `NOMBRE_CLIENTE` varchar(150) NOT NULL,
  `DUI_CLIENTE` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  UNIQUE KEY `DUI_CLIENTE` (`DUI_CLIENTE`),
  CONSTRAINT `FK_HEREDA_DE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientenatural`
--

LOCK TABLES `clientenatural` WRITE;
/*!40000 ALTER TABLE `clientenatural` DISABLE KEYS */;
INSERT INTO `clientenatural` VALUES (1,'Carlos Alberto Mendoza','03456789-1'),(2,'Ana María Guerra','04567890-2'),(3,'Luis Alonso Ramírez','05678901-3'),(4,'Marta Alicia Fuentes','06789012-4'),(5,'Jorge Mario Hernández','07890123-5'),(6,'Elena Beatriz Castro','08901234-6'),(7,'Roberto Carlos Flores','09012345-7'),(8,'Sandra Patricia Martínez','01234567-8'),(9,'Víctor Manuel Pérez','02345678-9'),(10,'Claudia Elizabeth Rivas','03456780-1'),(11,'Daniel Enrique Cruz','04567812-2'),(12,'Beatriz Adriana Gómez','05678923-3'),(13,'Óscar Antonio Silva','06789034-4'),(14,'Patricia Guadalupe Morales','07890145-5'),(15,'Ricardo Ernesto Ortiz','08901256-6'),(16,'Gabriela Alejandra Suárez','09012367-7'),(17,'Fernando José Aguilar','01234589-8'),(18,'Sofía Margarita Portillo','02345690-9'),(19,'Alejandro Javier Coreas','03456712-1'),(20,'Daniela Michelle Orellana','04567823-2'),(21,'Mauricio Ernesto Meléndez','05678934-3'),(22,'Carolina del Carmen Escobar','06789045-4'),(23,'Eduardo Rafael Velásquez','07890156-5'),(24,'Katherine Nicole Quinteros','08901267-6'),(25,'Hugo Ernesto Pérez','09012378-7'),(26,'Verónica Alejandra Ramírez','01234590-8'),(27,'César Alejandro Romero','02345601-9'),(28,'Mónica Raquel Sosa','03456723-1'),(29,'Francisco Javier Amézquita','04567834-2'),(30,'Jessica María Guevara','05678945-3'),(31,'Manuel de Jesús Arévalo','06789056-4'),(32,'Rocío del Carmen Navas','07890167-5'),(33,'Alfredo Enrique Palacios','08901278-6'),(34,'Brenda Estefanía Lara','09012389-7'),(35,'Sergio Daniel Bonilla','01234501-8');
/*!40000 ALTER TABLE `clientenatural` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compraproducto`
--

DROP TABLE IF EXISTS `compraproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compraproducto` (
  `ID_PROVEEDOR` int NOT NULL,
  `ID_PRODUCTO` int NOT NULL,
  `FECHA_ENTREGA` date NOT NULL,
  `PRECIO_PACTADO` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_PROVEEDOR`,`ID_PRODUCTO`),
  KEY `FK_ES_ABASTECIDO2` (`ID_PRODUCTO`),
  CONSTRAINT `FK_ES_ABASTECIDO` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `proveedor` (`ID_PROVEEDOR`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ES_ABASTECIDO2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CK_PRECIO_PACTADO` CHECK ((`PRECIO_PACTADO` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compraproducto`
--

LOCK TABLES `compraproducto` WRITE;
/*!40000 ALTER TABLE `compraproducto` DISABLE KEYS */;
INSERT INTO `compraproducto` VALUES (1,1,'2026-01-10',380.00),(1,8,'2026-01-12',128.70),(1,9,'2026-01-12',230.00),(1,14,'2026-01-14',150.00),(1,39,'2026-01-22',70.00),(1,66,'2026-01-31',850.00),(1,106,'2026-02-14',542.10),(1,133,'2026-02-23',386.10),(2,2,'2026-01-10',590.00),(2,16,'2026-01-15',272.99),(2,19,'2026-01-16',710.00),(2,20,'2026-01-16',144.30),(2,21,'2026-01-16',351.00),(2,22,'2026-01-17',171.60),(2,26,'2026-01-18',380.00),(2,30,'2026-01-19',58.50),(2,32,'2026-01-20',240.00),(2,44,'2026-01-24',120.00),(2,49,'2026-01-26',483.60),(2,53,'2026-01-27',120.90),(2,69,'2026-02-01',620.00),(2,108,'2026-02-14',612.30),(2,114,'2026-02-16',300.30),(2,132,'2026-02-22',616.20),(2,159,'2026-09-21',850.00),(3,3,'2026-01-10',1050.00),(3,18,'2026-01-15',210.00),(3,34,'2026-01-21',130.00),(3,111,'2026-02-15',873.60),(3,120,'2026-02-18',144.30),(3,125,'2026-02-20',175.50),(3,131,'2026-02-22',526.50),(3,157,'2026-09-18',175.00),(4,5,'2026-01-11',410.00),(4,10,'2026-01-13',430.00),(4,15,'2026-01-14',480.00),(4,65,'2026-01-31',450.00),(4,70,'2026-02-02',520.00),(4,107,'2026-02-14',222.30),(4,152,'2026-09-11',540.00),(5,4,'2026-01-11',140.00),(5,68,'2026-02-01',210.00),(6,17,'2026-01-15',530.00),(6,31,'2026-01-20',160.00),(6,36,'2026-01-21',85.00),(6,98,'2026-02-11',70.00),(6,116,'2026-02-17',351.00),(6,150,'2026-02-28',50.70),(6,155,'2026-09-15',135.00),(6,165,'2026-09-28',25.00),(7,37,'2026-01-22',35.00),(7,42,'2026-01-23',28.00),(7,46,'2026-01-25',20.00),(7,57,'2026-01-28',65.00),(7,60,'2026-01-29',55.00),(7,62,'2026-01-30',32.00),(7,119,'2026-02-18',42.90),(7,127,'2026-02-21',97.50),(7,129,'2026-02-21',191.10),(8,25,'2026-01-18',30.00),(8,38,'2026-01-22',22.00),(8,41,'2026-01-23',18.00),(8,59,'2026-01-29',45.00),(8,83,'2026-02-06',105.00),(8,85,'2026-02-07',160.00),(9,35,'2026-01-21',200.00),(10,84,'2026-02-06',55.00),(10,87,'2026-02-07',48.00),(10,141,'2026-02-25',128.70),(11,40,'2026-01-23',18.00),(11,43,'2026-01-24',85.00),(11,72,'2026-02-02',38.00),(11,79,'2026-02-05',110.00),(11,110,'2026-02-15',569.40),(11,121,'2026-02-19',50.70),(11,135,'2026-02-23',50.70),(11,138,'2026-02-24',58.50),(12,11,'2026-01-13',25.00),(12,27,'2026-01-18',45.00),(12,45,'2026-01-24',14.00),(12,48,'2026-01-25',17.00),(12,58,'2026-01-29',75.00),(13,12,'2026-01-13',310.00),(14,7,'2026-01-12',340.00),(14,102,'2026-02-12',319.80),(14,105,'2026-02-13',487.50),(15,24,'2026-01-17',560.00),(16,28,'2026-01-19',890.00),(17,6,'2026-01-11',270.00),(17,13,'2026-01-14',370.00),(17,23,'2026-01-17',320.00),(17,29,'2026-01-19',170.00),(17,61,'2026-01-30',80.00),(17,67,'2026-02-01',310.00),(17,78,'2026-02-04',95.00),(17,103,'2026-02-13',694.20),(17,151,'2026-09-10',385.00),(18,153,'2026-09-12',780.00),(20,33,'2026-01-20',311.99),(20,47,'2026-01-25',24.18),(20,50,'2026-01-26',167.70),(20,51,'2026-01-26',265.20),(20,52,'2026-01-27',155.99),(20,54,'2026-01-27',191.10),(20,55,'2026-01-28',62.39),(20,56,'2026-01-28',48.36),(20,63,'2026-01-30',155.99),(20,64,'2026-01-31',95.00),(20,71,'2026-02-02',27.30),(20,73,'2026-02-03',32.76),(20,74,'2026-02-03',37.44),(20,75,'2026-02-03',50.70),(20,76,'2026-02-04',40.56),(20,77,'2026-02-04',31.20),(20,80,'2026-02-05',214.50),(20,81,'2026-02-05',19.11),(20,82,'2026-02-06',24.96),(20,86,'2026-02-07',66.30),(20,88,'2026-02-08',42.90),(20,89,'2026-02-08',101.40),(20,90,'2026-02-08',124.80),(20,91,'2026-02-09',74.10),(20,92,'2026-02-09',42.90),(20,93,'2026-02-09',144.30),(20,94,'2026-02-10',140.40),(20,95,'2026-02-10',14.43),(20,96,'2026-02-10',50.70),(20,97,'2026-02-11',187.20),(20,99,'2026-02-11',50.70),(20,100,'2026-02-12',46.79),(20,101,'2026-02-12',448.50),(20,104,'2026-02-13',175.50),(20,109,'2026-02-15',483.60),(20,112,'2026-02-16',113.10),(20,113,'2026-02-16',144.30),(20,115,'2026-02-17',136.50),(20,117,'2026-02-17',93.60),(20,118,'2026-02-18',105.30),(20,122,'2026-02-19',565.50),(20,123,'2026-02-19',74.10),(20,124,'2026-02-20',85.80),(20,126,'2026-02-20',120.90),(20,128,'2026-02-21',89.70),(20,130,'2026-02-22',66.30),(20,134,'2026-02-23',308.10),(20,136,'2026-02-24',42.90),(20,137,'2026-02-24',269.10),(20,139,'2026-02-25',35.10),(20,140,'2026-02-25',144.30),(20,142,'2026-02-26',27.30),(20,143,'2026-02-26',292.50),(20,144,'2026-02-26',152.10),(20,145,'2026-02-27',66.30),(20,146,'2026-02-27',89.70),(20,147,'2026-02-27',23.39),(20,148,'2026-02-28',31.19),(20,149,'2026-02-28',42.90),(20,154,'2026-09-14',62.00),(20,156,'2026-09-16',118.00),(20,158,'2026-09-19',32.00),(20,160,'2026-09-22',49.00),(20,161,'2026-09-23',62.00),(20,162,'2026-09-24',125.00),(20,163,'2026-09-25',165.00),(20,164,'2026-09-26',43.00);
/*!40000 ALTER TABLE `compraproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito`
--

DROP TABLE IF EXISTS `credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credito` (
  `ID_CREDITO` int NOT NULL AUTO_INCREMENT,
  `ID_FACTURA` int NOT NULL,
  `ESTADO_CREDITO` varchar(50) NOT NULL DEFAULT 'Pendiente',
  `FECHA_OTORGACION` date NOT NULL DEFAULT (curdate()),
  `MONTO_PRIMA` decimal(10,2) NOT NULL DEFAULT '0.00',
  `MONTO_FINANCIADO` decimal(10,2) NOT NULL,
  `SALDO_PENDIENTE` decimal(10,2) NOT NULL,
  `TASA_INTERES` decimal(10,2) NOT NULL,
  `NUMERO_CUOTAS` int NOT NULL,
  PRIMARY KEY (`ID_CREDITO`),
  KEY `FK_SE_REGISTRA` (`ID_FACTURA`),
  KEY `IDX_CREDITO_ESTADO_FECHA` (`ESTADO_CREDITO`,`FECHA_OTORGACION`),
  CONSTRAINT `FK_SE_REGISTRA` FOREIGN KEY (`ID_FACTURA`) REFERENCES `factura` (`ID_FACTURA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CK_CREDITO_MONTO_PRIMA` CHECK ((`MONTO_PRIMA` >= 0)),
  CONSTRAINT `CK_ESTADO_CREDITO` CHECK ((`ESTADO_CREDITO` in (_utf8mb4'Pendiente',_utf8mb4'Pagado',_utf8mb4'Vencido',_utf8mb4'Cancelado'))),
  CONSTRAINT `CK_MONTO_FINANCIADO` CHECK ((`MONTO_FINANCIADO` > 0)),
  CONSTRAINT `CK_NUM_CUOTAS` CHECK ((`NUMERO_CUOTAS` > 0)),
  CONSTRAINT `CK_SALDO_PENDIENTE` CHECK ((`SALDO_PENDIENTE` >= 0)),
  CONSTRAINT `CK_TASA_INTERES` CHECK ((`TASA_INTERES` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito`
--

LOCK TABLES `credito` WRITE;
/*!40000 ALTER TABLE `credito` DISABLE KEYS */;
INSERT INTO `credito` VALUES (1,7,'Pagado','2026-10-23',165.46,1489.14,0.00,0.50,3),(2,8,'Pendiente','2026-10-23',223.50,1266.49,1342.48,1.00,6),(3,9,'Pendiente','2026-10-24',174.00,696.00,821.28,1.50,12),(4,13,'Pendiente','2026-10-26',21.94,65.81,69.76,2.00,3),(5,14,'Pendiente','2026-10-26',25.30,227.70,195.44,0.50,6),(6,15,'Pendiente','2026-10-27',48.00,272.00,253.86,1.00,12),(7,22,'Pendiente','2026-10-30',110.80,443.19,463.13,1.50,3),(8,23,'Pendiente','2026-10-31',151.00,452.99,507.35,2.00,6),(9,24,'Pendiente','2026-10-31',145.80,1312.20,1275.02,0.50,12),(10,28,'Pendiente','2026-11-02',48.18,273.00,281.19,1.00,3),(11,29,'Pendiente','2026-11-03',31.40,125.60,91.26,1.50,6),(12,30,'Pendiente','2026-11-03',54.80,164.40,203.86,2.00,12),(13,37,'Pendiente','2026-11-07',18.50,166.49,112.66,0.50,3),(14,38,'Pendiente','2026-11-07',174.14,986.76,1045.97,1.00,6),(15,39,'Pendiente','2026-11-08',264.02,1056.06,1246.15,1.50,12),(16,43,'Pendiente','2026-11-10',87.30,261.90,92.53,2.00,3),(17,44,'Pendiente','2026-11-10',35.17,316.57,271.72,0.50,6),(18,45,'Pendiente','2026-11-11',17.77,100.72,112.81,1.00,12),(19,60,'Pendiente','2026-11-13',61.98,247.92,259.08,1.50,3),(20,61,'Pendiente','2026-11-13',58.00,174.00,194.88,2.00,6),(21,62,'Pendiente','2026-11-13',74.28,668.47,590.48,0.50,12),(22,63,'Pendiente','2026-11-13',34.42,195.07,200.92,1.00,3),(23,64,'Pendiente','2026-11-13',28.00,112.00,122.08,1.50,6),(24,65,'Pendiente','2026-11-13',37.10,111.30,138.01,2.00,12),(25,75,'Pendiente','2026-11-13',76.74,690.65,467.34,0.50,3),(26,76,'Pendiente','2026-11-14',36.60,207.40,146.56,1.00,6),(27,77,'Pendiente','2026-11-14',114.29,457.15,539.44,1.50,12),(28,78,'Pendiente','2026-11-14',81.75,245.24,259.95,2.00,3),(29,79,'Pendiente','2026-11-14',18.83,169.46,145.45,0.50,6),(30,80,'Pendiente','2026-11-14',39.75,225.25,252.28,1.00,12),(31,90,'Pendiente','2026-11-14',51.24,204.95,71.39,1.50,3),(32,91,'Pendiente','2026-11-14',105.69,317.05,355.10,2.00,6),(33,92,'Pendiente','2026-11-14',46.00,414.00,402.27,0.50,12),(34,93,'Pendiente','2026-11-14',22.05,124.94,128.69,1.00,3),(35,110,'Pendiente','2026-11-14',133.54,534.16,582.23,1.50,6),(36,111,'Pendiente','2026-11-14',87.38,262.12,270.85,2.00,12),(37,112,'Pendiente','2026-11-14',22.00,198.00,133.98,0.50,3),(38,94,'Pendiente','2026-11-14',38.09,215.81,228.76,1.00,6),(39,115,'Pendiente','2026-11-14',52.70,210.78,248.72,1.50,12),(40,113,'Pendiente','2026-11-14',43.06,129.19,136.94,2.00,3),(41,114,'Pendiente','2026-11-14',34.50,310.49,213.20,0.50,6),(42,95,'Pendiente','2026-11-14',48.04,272.20,304.86,1.00,12),(43,126,'Pendiente','2026-11-14',93.80,375.20,392.08,1.50,3),(44,127,'Pendiente','2026-11-14',206.00,618.00,692.16,2.00,6),(45,125,'Pendiente','2026-11-14',27.20,244.80,237.87,0.50,12),(46,128,'Pendiente','2026-11-14',12.84,72.76,24.98,1.00,3),(47,129,'Pendiente','2026-11-14',33.96,135.83,148.05,1.50,6),(48,130,'Pendiente','2026-11-14',74.75,224.24,278.06,2.00,12),(49,142,'Pendiente','2026-11-14',71.93,647.32,438.02,0.50,3),(50,140,'Pendiente','2026-11-14',42.75,242.25,256.79,1.00,6),(51,141,'Pendiente','2026-11-14',85.69,342.78,337.06,1.50,12),(52,143,'Pendiente','2026-11-14',55.82,167.45,177.50,2.00,3),(53,144,'Pendiente','2026-11-14',7.60,68.39,58.70,0.50,6),(54,145,'Pendiente','2026-11-14',38.55,218.45,244.66,1.00,12);
/*!40000 ALTER TABLE `credito` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_VALIDAR_CUPO_CREDITO` BEFORE INSERT ON `credito` FOR EACH ROW BEGIN
    DECLARE V_CLIENTE INT;
    DECLARE V_SUCURSAL INT;
    DECLARE V_METODO VARCHAR(30);
    DECLARE V_LIMITE DECIMAL(12,2);
    DECLARE V_SALDO_ACTUAL DECIMAL(12,2) DEFAULT 0;

    SELECT F.ID_CLIENTE, F.ID_SUCURSAL, F.METODO_PAGO
    INTO V_CLIENTE, V_SUCURSAL, V_METODO
    FROM FACTURA F
    WHERE F.ID_FACTURA = NEW.ID_FACTURA;

    IF V_METODO = 'Credito Corporativo' THEN
        SELECT CUPO_CREDITO_CORPORATIVO INTO V_LIMITE
        FROM CLIENTEJURIDICO
        WHERE ID_CLIENTE = V_CLIENTE;

        SELECT COALESCE(SUM(C.SALDO_PENDIENTE), 0) INTO V_SALDO_ACTUAL
        FROM CREDITO C
        INNER JOIN FACTURA F ON F.ID_FACTURA = C.ID_FACTURA
        WHERE F.ID_CLIENTE = V_CLIENTE
          AND F.METODO_PAGO = 'Credito Corporativo';

    ELSEIF V_METODO = 'Credito Personal' THEN
        SELECT MONTOLIMITE INTO V_LIMITE
        FROM LIMITECREDITOPERSONAL
        WHERE ID_CLIENTE = V_CLIENTE
          AND ID_SUCURSAL = V_SUCURSAL;

        SELECT COALESCE(SUM(C.SALDO_PENDIENTE), 0) INTO V_SALDO_ACTUAL
        FROM CREDITO C
        INNER JOIN FACTURA F ON F.ID_FACTURA = C.ID_FACTURA
        WHERE F.ID_CLIENTE = V_CLIENTE
          AND F.ID_SUCURSAL = V_SUCURSAL
          AND F.METODO_PAGO = 'Credito Personal';
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura no utiliza un método de pago a crédito.';
    END IF;

    IF V_LIMITE IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no tiene un límite de crédito configurado.';
    END IF;

    IF V_SALDO_ACTUAL + NEW.MONTO_FINANCIADO > V_LIMITE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito supera el límite disponible del cliente.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cuota`
--

DROP TABLE IF EXISTS `cuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuota` (
  `ID_CREDITO` int NOT NULL,
  `NUMERO_CUOTA` int NOT NULL,
  `FECHA_VENCIMIENTO` date NOT NULL,
  `FECHA_PAGO` datetime DEFAULT NULL,
  `MONTO_ABONADO` decimal(10,2) NOT NULL DEFAULT '0.00',
  `MONTO_ESPERADO` decimal(10,2) NOT NULL,
  `ESTADO_CUOTA` varchar(50) NOT NULL DEFAULT 'Pendiente',
  PRIMARY KEY (`ID_CREDITO`,`NUMERO_CUOTA`),
  KEY `IDX_CUOTA_ESTADO_VENC` (`ESTADO_CUOTA`,`FECHA_VENCIMIENTO`),
  CONSTRAINT `FK_SE_DIVIDE_EN` FOREIGN KEY (`ID_CREDITO`) REFERENCES `credito` (`ID_CREDITO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CK_ESTADO_CUOTA` CHECK ((`ESTADO_CUOTA` in (_utf8mb4'Pendiente',_utf8mb4'Pagada',_utf8mb4'Vencida',_utf8mb4'Cancelada'))),
  CONSTRAINT `CK_MONTO_ABONADO` CHECK ((`MONTO_ABONADO` >= 0)),
  CONSTRAINT `CK_MONTO_ESPERADO` CHECK ((`MONTO_ESPERADO` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuota`
--

LOCK TABLES `cuota` WRITE;
/*!40000 ALTER TABLE `cuota` DISABLE KEYS */;
INSERT INTO `cuota` VALUES (1,1,'2026-11-23','2026-10-26 12:00:00',503.83,503.83,'Pagada'),(1,2,'2026-12-23','2026-10-27 12:00:00',503.83,503.83,'Pagada'),(1,3,'2027-01-23','2026-10-28 12:00:00',503.82,503.82,'Pagada'),(2,1,'2026-11-23',NULL,0.00,223.75,'Pendiente'),(2,2,'2026-12-23',NULL,0.00,223.75,'Pendiente'),(2,3,'2027-01-23',NULL,0.00,223.75,'Pendiente'),(2,4,'2027-02-23',NULL,0.00,223.75,'Pendiente'),(2,5,'2027-03-23',NULL,0.00,223.75,'Pendiente'),(2,6,'2027-04-23',NULL,0.00,223.73,'Pendiente'),(3,1,'2026-11-24',NULL,0.00,68.44,'Pendiente'),(3,2,'2026-12-24',NULL,0.00,68.44,'Pendiente'),(3,3,'2027-01-24',NULL,0.00,68.44,'Pendiente'),(3,4,'2027-02-24',NULL,0.00,68.44,'Pendiente'),(3,5,'2027-03-24',NULL,0.00,68.44,'Pendiente'),(3,6,'2027-04-24',NULL,0.00,68.44,'Pendiente'),(3,7,'2027-05-24',NULL,0.00,68.44,'Pendiente'),(3,8,'2027-06-24',NULL,0.00,68.44,'Pendiente'),(3,9,'2027-07-24',NULL,0.00,68.44,'Pendiente'),(3,10,'2027-08-24',NULL,0.00,68.44,'Pendiente'),(3,11,'2027-09-24',NULL,0.00,68.44,'Pendiente'),(3,12,'2027-10-24',NULL,0.00,68.44,'Pendiente'),(4,1,'2026-11-26',NULL,0.00,23.25,'Pendiente'),(4,2,'2026-12-26',NULL,0.00,23.25,'Pendiente'),(4,3,'2027-01-26',NULL,0.00,23.26,'Pendiente'),(5,1,'2026-11-26','2026-10-29 12:00:00',39.09,39.09,'Pagada'),(5,2,'2026-12-26',NULL,0.00,39.09,'Pendiente'),(5,3,'2027-01-26',NULL,0.00,39.09,'Pendiente'),(5,4,'2027-02-26',NULL,0.00,39.09,'Pendiente'),(5,5,'2027-03-26',NULL,0.00,39.09,'Pendiente'),(5,6,'2027-04-26',NULL,0.00,39.08,'Pendiente'),(6,1,'2026-11-27','2026-10-30 12:00:00',25.39,25.39,'Pagada'),(6,2,'2026-12-27','2026-10-31 12:00:00',25.39,25.39,'Pagada'),(6,3,'2027-01-27',NULL,0.00,25.39,'Pendiente'),(6,4,'2027-02-27',NULL,0.00,25.39,'Pendiente'),(6,5,'2027-03-27',NULL,0.00,25.39,'Pendiente'),(6,6,'2027-04-27',NULL,0.00,25.39,'Pendiente'),(6,7,'2027-05-27',NULL,0.00,25.39,'Pendiente'),(6,8,'2027-06-27',NULL,0.00,25.39,'Pendiente'),(6,9,'2027-07-27',NULL,0.00,25.39,'Pendiente'),(6,10,'2027-08-27',NULL,0.00,25.39,'Pendiente'),(6,11,'2027-09-27',NULL,0.00,25.39,'Pendiente'),(6,12,'2027-10-27',NULL,0.00,25.35,'Pendiente'),(7,1,'2026-11-30',NULL,0.00,154.38,'Pendiente'),(7,2,'2026-12-30',NULL,0.00,154.38,'Pendiente'),(7,3,'2027-01-30',NULL,0.00,154.37,'Pendiente'),(8,1,'2026-11-30',NULL,0.00,84.56,'Pendiente'),(8,2,'2026-12-31',NULL,0.00,84.56,'Pendiente'),(8,3,'2027-01-31',NULL,0.00,84.56,'Pendiente'),(8,4,'2027-02-28',NULL,0.00,84.56,'Pendiente'),(8,5,'2027-03-31',NULL,0.00,84.56,'Pendiente'),(8,6,'2027-04-30',NULL,0.00,84.55,'Pendiente'),(9,1,'2026-11-30','2026-11-03 12:00:00',115.91,115.91,'Pagada'),(9,2,'2026-12-31',NULL,0.00,115.91,'Pendiente'),(9,3,'2027-01-31',NULL,0.00,115.91,'Pendiente'),(9,4,'2027-02-28',NULL,0.00,115.91,'Pendiente'),(9,5,'2027-03-31',NULL,0.00,115.91,'Pendiente'),(9,6,'2027-04-30',NULL,0.00,115.91,'Pendiente'),(9,7,'2027-05-31',NULL,0.00,115.91,'Pendiente'),(9,8,'2027-06-30',NULL,0.00,115.91,'Pendiente'),(9,9,'2027-07-31',NULL,0.00,115.91,'Pendiente'),(9,10,'2027-08-31',NULL,0.00,115.91,'Pendiente'),(9,11,'2027-09-30',NULL,0.00,115.91,'Pendiente'),(9,12,'2027-10-31',NULL,0.00,115.92,'Pendiente'),(10,1,'2026-12-02',NULL,0.00,93.73,'Pendiente'),(10,2,'2027-01-02',NULL,0.00,93.73,'Pendiente'),(10,3,'2027-02-02',NULL,0.00,93.73,'Pendiente'),(11,1,'2026-12-03','2026-11-06 12:00:00',22.82,22.82,'Pagada'),(11,2,'2027-01-03','2026-11-07 12:00:00',22.82,22.82,'Pagada'),(11,3,'2027-02-03',NULL,0.00,22.82,'Pendiente'),(11,4,'2027-03-03',NULL,0.00,22.82,'Pendiente'),(11,5,'2027-04-03',NULL,0.00,22.82,'Pendiente'),(11,6,'2027-05-03',NULL,0.00,22.80,'Pendiente'),(12,1,'2026-12-03',NULL,0.00,16.99,'Pendiente'),(12,2,'2027-01-03',NULL,0.00,16.99,'Pendiente'),(12,3,'2027-02-03',NULL,0.00,16.99,'Pendiente'),(12,4,'2027-03-03',NULL,0.00,16.99,'Pendiente'),(12,5,'2027-04-03',NULL,0.00,16.99,'Pendiente'),(12,6,'2027-05-03',NULL,0.00,16.99,'Pendiente'),(12,7,'2027-06-03',NULL,0.00,16.99,'Pendiente'),(12,8,'2027-07-03',NULL,0.00,16.99,'Pendiente'),(12,9,'2027-08-03',NULL,0.00,16.99,'Pendiente'),(12,10,'2027-09-03',NULL,0.00,16.99,'Pendiente'),(12,11,'2027-10-03',NULL,0.00,16.99,'Pendiente'),(12,12,'2027-11-03',NULL,0.00,16.97,'Pendiente'),(13,1,'2026-12-07','2026-11-10 12:00:00',56.33,56.33,'Pagada'),(13,2,'2027-01-07',NULL,0.00,56.33,'Pendiente'),(13,3,'2027-02-07',NULL,0.00,56.33,'Pendiente'),(14,1,'2026-12-07',NULL,0.00,174.33,'Pendiente'),(14,2,'2027-01-07',NULL,0.00,174.33,'Pendiente'),(14,3,'2027-02-07',NULL,0.00,174.33,'Pendiente'),(14,4,'2027-03-07',NULL,0.00,174.33,'Pendiente'),(14,5,'2027-04-07',NULL,0.00,174.33,'Pendiente'),(14,6,'2027-05-07',NULL,0.00,174.32,'Pendiente'),(15,1,'2026-12-08',NULL,0.00,103.85,'Pendiente'),(15,2,'2027-01-08',NULL,0.00,103.85,'Pendiente'),(15,3,'2027-02-08',NULL,0.00,103.85,'Pendiente'),(15,4,'2027-03-08',NULL,0.00,103.85,'Pendiente'),(15,5,'2027-04-08',NULL,0.00,103.85,'Pendiente'),(15,6,'2027-05-08',NULL,0.00,103.85,'Pendiente'),(15,7,'2027-06-08',NULL,0.00,103.85,'Pendiente'),(15,8,'2027-07-08',NULL,0.00,103.85,'Pendiente'),(15,9,'2027-08-08',NULL,0.00,103.85,'Pendiente'),(15,10,'2027-09-08',NULL,0.00,103.85,'Pendiente'),(15,11,'2027-10-08',NULL,0.00,103.85,'Pendiente'),(15,12,'2027-11-08',NULL,0.00,103.80,'Pendiente'),(16,1,'2026-12-10','2026-11-13 12:00:00',92.54,92.54,'Pagada'),(16,2,'2027-01-10','2026-11-14 12:00:00',92.54,92.54,'Pagada'),(16,3,'2027-02-10',NULL,0.00,92.53,'Pendiente'),(17,1,'2026-12-10','2026-11-13 12:00:00',54.35,54.35,'Pagada'),(17,2,'2027-01-10',NULL,0.00,54.35,'Pendiente'),(17,3,'2027-02-10',NULL,0.00,54.35,'Pendiente'),(17,4,'2027-03-10',NULL,0.00,54.35,'Pendiente'),(17,5,'2027-04-10',NULL,0.00,54.35,'Pendiente'),(17,6,'2027-05-10',NULL,0.00,54.32,'Pendiente'),(18,1,'2026-12-11',NULL,0.00,9.40,'Pendiente'),(18,2,'2027-01-11',NULL,0.00,9.40,'Pendiente'),(18,3,'2027-02-11',NULL,0.00,9.40,'Pendiente'),(18,4,'2027-03-11',NULL,0.00,9.40,'Pendiente'),(18,5,'2027-04-11',NULL,0.00,9.40,'Pendiente'),(18,6,'2027-05-11',NULL,0.00,9.40,'Pendiente'),(18,7,'2027-06-11',NULL,0.00,9.40,'Pendiente'),(18,8,'2027-07-11',NULL,0.00,9.40,'Pendiente'),(18,9,'2027-08-11',NULL,0.00,9.40,'Pendiente'),(18,10,'2027-09-11',NULL,0.00,9.40,'Pendiente'),(18,11,'2027-10-11',NULL,0.00,9.40,'Pendiente'),(18,12,'2027-11-11',NULL,0.00,9.41,'Pendiente'),(19,1,'2026-12-13',NULL,0.00,86.36,'Pendiente'),(19,2,'2027-01-13',NULL,0.00,86.36,'Pendiente'),(19,3,'2027-02-13',NULL,0.00,86.36,'Pendiente'),(20,1,'2026-12-13',NULL,0.00,32.48,'Pendiente'),(20,2,'2027-01-13',NULL,0.00,32.48,'Pendiente'),(20,3,'2027-02-13',NULL,0.00,32.48,'Pendiente'),(20,4,'2027-03-13',NULL,0.00,32.48,'Pendiente'),(20,5,'2027-04-13',NULL,0.00,32.48,'Pendiente'),(20,6,'2027-05-13',NULL,0.00,32.48,'Pendiente'),(21,1,'2026-12-13','2026-11-14 12:00:00',59.05,59.05,'Pagada'),(21,2,'2027-01-13','2026-11-14 12:00:00',59.05,59.05,'Pagada'),(21,3,'2027-02-13',NULL,0.00,59.05,'Pendiente'),(21,4,'2027-03-13',NULL,0.00,59.05,'Pendiente'),(21,5,'2027-04-13',NULL,0.00,59.05,'Pendiente'),(21,6,'2027-05-13',NULL,0.00,59.05,'Pendiente'),(21,7,'2027-06-13',NULL,0.00,59.05,'Pendiente'),(21,8,'2027-07-13',NULL,0.00,59.05,'Pendiente'),(21,9,'2027-08-13',NULL,0.00,59.05,'Pendiente'),(21,10,'2027-09-13',NULL,0.00,59.05,'Pendiente'),(21,11,'2027-10-13',NULL,0.00,59.05,'Pendiente'),(21,12,'2027-11-13',NULL,0.00,59.03,'Pendiente'),(22,1,'2026-12-13',NULL,0.00,66.97,'Pendiente'),(22,2,'2027-01-13',NULL,0.00,66.97,'Pendiente'),(22,3,'2027-02-13',NULL,0.00,66.98,'Pendiente'),(23,1,'2026-12-13',NULL,0.00,20.35,'Pendiente'),(23,2,'2027-01-13',NULL,0.00,20.35,'Pendiente'),(23,3,'2027-02-13',NULL,0.00,20.35,'Pendiente'),(23,4,'2027-03-13',NULL,0.00,20.35,'Pendiente'),(23,5,'2027-04-13',NULL,0.00,20.35,'Pendiente'),(23,6,'2027-05-13',NULL,0.00,20.33,'Pendiente'),(24,1,'2026-12-13',NULL,0.00,11.50,'Pendiente'),(24,2,'2027-01-13',NULL,0.00,11.50,'Pendiente'),(24,3,'2027-02-13',NULL,0.00,11.50,'Pendiente'),(24,4,'2027-03-13',NULL,0.00,11.50,'Pendiente'),(24,5,'2027-04-13',NULL,0.00,11.50,'Pendiente'),(24,6,'2027-05-13',NULL,0.00,11.50,'Pendiente'),(24,7,'2027-06-13',NULL,0.00,11.50,'Pendiente'),(24,8,'2027-07-13',NULL,0.00,11.50,'Pendiente'),(24,9,'2027-08-13',NULL,0.00,11.50,'Pendiente'),(24,10,'2027-09-13',NULL,0.00,11.50,'Pendiente'),(24,11,'2027-10-13',NULL,0.00,11.50,'Pendiente'),(24,12,'2027-11-13',NULL,0.00,11.51,'Pendiente'),(25,1,'2026-12-13','2026-11-14 12:00:00',233.67,233.67,'Pagada'),(25,2,'2027-01-13',NULL,0.00,233.67,'Pendiente'),(25,3,'2027-02-13',NULL,0.00,233.67,'Pendiente'),(26,1,'2026-12-14','2026-11-14 12:00:00',36.64,36.64,'Pagada'),(26,2,'2027-01-14','2026-11-14 12:00:00',36.64,36.64,'Pagada'),(26,3,'2027-02-14',NULL,0.00,36.64,'Pendiente'),(26,4,'2027-03-14',NULL,0.00,36.64,'Pendiente'),(26,5,'2027-04-14',NULL,0.00,36.64,'Pendiente'),(26,6,'2027-05-14',NULL,0.00,36.64,'Pendiente'),(27,1,'2026-12-14',NULL,0.00,44.95,'Pendiente'),(27,2,'2027-01-14',NULL,0.00,44.95,'Pendiente'),(27,3,'2027-02-14',NULL,0.00,44.95,'Pendiente'),(27,4,'2027-03-14',NULL,0.00,44.95,'Pendiente'),(27,5,'2027-04-14',NULL,0.00,44.95,'Pendiente'),(27,6,'2027-05-14',NULL,0.00,44.95,'Pendiente'),(27,7,'2027-06-14',NULL,0.00,44.95,'Pendiente'),(27,8,'2027-07-14',NULL,0.00,44.95,'Pendiente'),(27,9,'2027-08-14',NULL,0.00,44.95,'Pendiente'),(27,10,'2027-09-14',NULL,0.00,44.95,'Pendiente'),(27,11,'2027-10-14',NULL,0.00,44.95,'Pendiente'),(27,12,'2027-11-14',NULL,0.00,44.99,'Pendiente'),(28,1,'2026-12-14',NULL,0.00,86.65,'Pendiente'),(28,2,'2027-01-14',NULL,0.00,86.65,'Pendiente'),(28,3,'2027-02-14',NULL,0.00,86.65,'Pendiente'),(29,1,'2026-12-14','2026-11-14 12:00:00',29.09,29.09,'Pagada'),(29,2,'2027-01-14',NULL,0.00,29.09,'Pendiente'),(29,3,'2027-02-14',NULL,0.00,29.09,'Pendiente'),(29,4,'2027-03-14',NULL,0.00,29.09,'Pendiente'),(29,5,'2027-04-14',NULL,0.00,29.09,'Pendiente'),(29,6,'2027-05-14',NULL,0.00,29.09,'Pendiente'),(30,1,'2026-12-14',NULL,0.00,21.02,'Pendiente'),(30,2,'2027-01-14',NULL,0.00,21.02,'Pendiente'),(30,3,'2027-02-14',NULL,0.00,21.02,'Pendiente'),(30,4,'2027-03-14',NULL,0.00,21.02,'Pendiente'),(30,5,'2027-04-14',NULL,0.00,21.02,'Pendiente'),(30,6,'2027-05-14',NULL,0.00,21.02,'Pendiente'),(30,7,'2027-06-14',NULL,0.00,21.02,'Pendiente'),(30,8,'2027-07-14',NULL,0.00,21.02,'Pendiente'),(30,9,'2027-08-14',NULL,0.00,21.02,'Pendiente'),(30,10,'2027-09-14',NULL,0.00,21.02,'Pendiente'),(30,11,'2027-10-14',NULL,0.00,21.02,'Pendiente'),(30,12,'2027-11-14',NULL,0.00,21.06,'Pendiente'),(31,1,'2026-12-14','2026-11-14 12:00:00',71.39,71.39,'Pagada'),(31,2,'2027-01-14','2026-11-14 12:00:00',71.39,71.39,'Pagada'),(31,3,'2027-02-14',NULL,0.00,71.39,'Pendiente'),(32,1,'2026-12-14',NULL,0.00,59.18,'Pendiente'),(32,2,'2027-01-14',NULL,0.00,59.18,'Pendiente'),(32,3,'2027-02-14',NULL,0.00,59.18,'Pendiente'),(32,4,'2027-03-14',NULL,0.00,59.18,'Pendiente'),(32,5,'2027-04-14',NULL,0.00,59.18,'Pendiente'),(32,6,'2027-05-14',NULL,0.00,59.20,'Pendiente'),(33,1,'2026-12-14','2026-11-14 12:00:00',36.57,36.57,'Pagada'),(33,2,'2027-01-14',NULL,0.00,36.57,'Pendiente'),(33,3,'2027-02-14',NULL,0.00,36.57,'Pendiente'),(33,4,'2027-03-14',NULL,0.00,36.57,'Pendiente'),(33,5,'2027-04-14',NULL,0.00,36.57,'Pendiente'),(33,6,'2027-05-14',NULL,0.00,36.57,'Pendiente'),(33,7,'2027-06-14',NULL,0.00,36.57,'Pendiente'),(33,8,'2027-07-14',NULL,0.00,36.57,'Pendiente'),(33,9,'2027-08-14',NULL,0.00,36.57,'Pendiente'),(33,10,'2027-09-14',NULL,0.00,36.57,'Pendiente'),(33,11,'2027-10-14',NULL,0.00,36.57,'Pendiente'),(33,12,'2027-11-14',NULL,0.00,36.57,'Pendiente'),(34,1,'2026-12-14',NULL,0.00,42.90,'Pendiente'),(34,2,'2027-01-14',NULL,0.00,42.90,'Pendiente'),(34,3,'2027-02-14',NULL,0.00,42.89,'Pendiente'),(35,1,'2026-12-14',NULL,0.00,97.04,'Pendiente'),(35,2,'2027-01-14',NULL,0.00,97.04,'Pendiente'),(35,3,'2027-02-14',NULL,0.00,97.04,'Pendiente'),(35,4,'2027-03-14',NULL,0.00,97.04,'Pendiente'),(35,5,'2027-04-14',NULL,0.00,97.04,'Pendiente'),(35,6,'2027-05-14',NULL,0.00,97.03,'Pendiente'),(36,1,'2026-12-14','2026-11-14 12:00:00',27.09,27.09,'Pagada'),(36,2,'2027-01-14','2026-11-14 12:00:00',27.09,27.09,'Pagada'),(36,3,'2027-02-14',NULL,0.00,27.09,'Pendiente'),(36,4,'2027-03-14',NULL,0.00,27.09,'Pendiente'),(36,5,'2027-04-14',NULL,0.00,27.09,'Pendiente'),(36,6,'2027-05-14',NULL,0.00,27.09,'Pendiente'),(36,7,'2027-06-14',NULL,0.00,27.09,'Pendiente'),(36,8,'2027-07-14',NULL,0.00,27.09,'Pendiente'),(36,9,'2027-08-14',NULL,0.00,27.09,'Pendiente'),(36,10,'2027-09-14',NULL,0.00,27.09,'Pendiente'),(36,11,'2027-10-14',NULL,0.00,27.09,'Pendiente'),(36,12,'2027-11-14',NULL,0.00,27.04,'Pendiente'),(37,1,'2026-12-14','2026-11-14 12:00:00',66.99,66.99,'Pagada'),(37,2,'2027-01-14',NULL,0.00,66.99,'Pendiente'),(37,3,'2027-02-14',NULL,0.00,66.99,'Pendiente'),(38,1,'2026-12-14',NULL,0.00,38.13,'Pendiente'),(38,2,'2027-01-14',NULL,0.00,38.13,'Pendiente'),(38,3,'2027-02-14',NULL,0.00,38.13,'Pendiente'),(38,4,'2027-03-14',NULL,0.00,38.13,'Pendiente'),(38,5,'2027-04-14',NULL,0.00,38.13,'Pendiente'),(38,6,'2027-05-14',NULL,0.00,38.11,'Pendiente'),(39,1,'2026-12-14',NULL,0.00,20.73,'Pendiente'),(39,2,'2027-01-14',NULL,0.00,20.73,'Pendiente'),(39,3,'2027-02-14',NULL,0.00,20.73,'Pendiente'),(39,4,'2027-03-14',NULL,0.00,20.73,'Pendiente'),(39,5,'2027-04-14',NULL,0.00,20.73,'Pendiente'),(39,6,'2027-05-14',NULL,0.00,20.73,'Pendiente'),(39,7,'2027-06-14',NULL,0.00,20.73,'Pendiente'),(39,8,'2027-07-14',NULL,0.00,20.73,'Pendiente'),(39,9,'2027-08-14',NULL,0.00,20.73,'Pendiente'),(39,10,'2027-09-14',NULL,0.00,20.73,'Pendiente'),(39,11,'2027-10-14',NULL,0.00,20.73,'Pendiente'),(39,12,'2027-11-14',NULL,0.00,20.69,'Pendiente'),(40,1,'2026-12-14',NULL,0.00,45.65,'Pendiente'),(40,2,'2027-01-14',NULL,0.00,45.65,'Pendiente'),(40,3,'2027-02-14',NULL,0.00,45.64,'Pendiente'),(41,1,'2026-12-14','2026-11-14 12:00:00',53.30,53.30,'Pagada'),(41,2,'2027-01-14','2026-11-14 12:00:00',53.30,53.30,'Pagada'),(41,3,'2027-02-14',NULL,0.00,53.30,'Pendiente'),(41,4,'2027-03-14',NULL,0.00,53.30,'Pendiente'),(41,5,'2027-04-14',NULL,0.00,53.30,'Pendiente'),(41,6,'2027-05-14',NULL,0.00,53.30,'Pendiente'),(42,1,'2026-12-14',NULL,0.00,25.41,'Pendiente'),(42,2,'2027-01-14',NULL,0.00,25.41,'Pendiente'),(42,3,'2027-02-14',NULL,0.00,25.41,'Pendiente'),(42,4,'2027-03-14',NULL,0.00,25.41,'Pendiente'),(42,5,'2027-04-14',NULL,0.00,25.41,'Pendiente'),(42,6,'2027-05-14',NULL,0.00,25.41,'Pendiente'),(42,7,'2027-06-14',NULL,0.00,25.41,'Pendiente'),(42,8,'2027-07-14',NULL,0.00,25.41,'Pendiente'),(42,9,'2027-08-14',NULL,0.00,25.41,'Pendiente'),(42,10,'2027-09-14',NULL,0.00,25.41,'Pendiente'),(42,11,'2027-10-14',NULL,0.00,25.41,'Pendiente'),(42,12,'2027-11-14',NULL,0.00,25.35,'Pendiente'),(43,1,'2026-12-14',NULL,0.00,130.69,'Pendiente'),(43,2,'2027-01-14',NULL,0.00,130.69,'Pendiente'),(43,3,'2027-02-14',NULL,0.00,130.70,'Pendiente'),(44,1,'2026-12-14',NULL,0.00,115.36,'Pendiente'),(44,2,'2027-01-14',NULL,0.00,115.36,'Pendiente'),(44,3,'2027-02-14',NULL,0.00,115.36,'Pendiente'),(44,4,'2027-03-14',NULL,0.00,115.36,'Pendiente'),(44,5,'2027-04-14',NULL,0.00,115.36,'Pendiente'),(44,6,'2027-05-14',NULL,0.00,115.36,'Pendiente'),(45,1,'2026-12-14','2026-11-14 12:00:00',21.62,21.62,'Pagada'),(45,2,'2027-01-14',NULL,0.00,21.62,'Pendiente'),(45,3,'2027-02-14',NULL,0.00,21.62,'Pendiente'),(45,4,'2027-03-14',NULL,0.00,21.62,'Pendiente'),(45,5,'2027-04-14',NULL,0.00,21.62,'Pendiente'),(45,6,'2027-05-14',NULL,0.00,21.62,'Pendiente'),(45,7,'2027-06-14',NULL,0.00,21.62,'Pendiente'),(45,8,'2027-07-14',NULL,0.00,21.62,'Pendiente'),(45,9,'2027-08-14',NULL,0.00,21.62,'Pendiente'),(45,10,'2027-09-14',NULL,0.00,21.62,'Pendiente'),(45,11,'2027-10-14',NULL,0.00,21.62,'Pendiente'),(45,12,'2027-11-14',NULL,0.00,21.67,'Pendiente'),(46,1,'2026-12-14','2026-11-14 12:00:00',24.98,24.98,'Pagada'),(46,2,'2027-01-14','2026-11-14 12:00:00',24.98,24.98,'Pagada'),(46,3,'2027-02-14',NULL,0.00,24.98,'Pendiente'),(47,1,'2026-12-14',NULL,0.00,24.68,'Pendiente'),(47,2,'2027-01-14',NULL,0.00,24.68,'Pendiente'),(47,3,'2027-02-14',NULL,0.00,24.68,'Pendiente'),(47,4,'2027-03-14',NULL,0.00,24.68,'Pendiente'),(47,5,'2027-04-14',NULL,0.00,24.68,'Pendiente'),(47,6,'2027-05-14',NULL,0.00,24.65,'Pendiente'),(48,1,'2026-12-14',NULL,0.00,23.17,'Pendiente'),(48,2,'2027-01-14',NULL,0.00,23.17,'Pendiente'),(48,3,'2027-02-14',NULL,0.00,23.17,'Pendiente'),(48,4,'2027-03-14',NULL,0.00,23.17,'Pendiente'),(48,5,'2027-04-14',NULL,0.00,23.17,'Pendiente'),(48,6,'2027-05-14',NULL,0.00,23.17,'Pendiente'),(48,7,'2027-06-14',NULL,0.00,23.17,'Pendiente'),(48,8,'2027-07-14',NULL,0.00,23.17,'Pendiente'),(48,9,'2027-08-14',NULL,0.00,23.17,'Pendiente'),(48,10,'2027-09-14',NULL,0.00,23.17,'Pendiente'),(48,11,'2027-10-14',NULL,0.00,23.17,'Pendiente'),(48,12,'2027-11-14',NULL,0.00,23.19,'Pendiente'),(49,1,'2026-12-14','2026-11-14 12:00:00',219.01,219.01,'Pagada'),(49,2,'2027-01-14',NULL,0.00,219.01,'Pendiente'),(49,3,'2027-02-14',NULL,0.00,219.01,'Pendiente'),(50,1,'2026-12-14',NULL,0.00,42.80,'Pendiente'),(50,2,'2027-01-14',NULL,0.00,42.80,'Pendiente'),(50,3,'2027-02-14',NULL,0.00,42.80,'Pendiente'),(50,4,'2027-03-14',NULL,0.00,42.80,'Pendiente'),(50,5,'2027-04-14',NULL,0.00,42.80,'Pendiente'),(50,6,'2027-05-14',NULL,0.00,42.79,'Pendiente'),(51,1,'2026-12-14','2026-11-14 12:00:00',33.71,33.71,'Pagada'),(51,2,'2027-01-14','2026-11-14 12:00:00',33.71,33.71,'Pagada'),(51,3,'2027-02-14',NULL,0.00,33.71,'Pendiente'),(51,4,'2027-03-14',NULL,0.00,33.71,'Pendiente'),(51,5,'2027-04-14',NULL,0.00,33.71,'Pendiente'),(51,6,'2027-05-14',NULL,0.00,33.71,'Pendiente'),(51,7,'2027-06-14',NULL,0.00,33.71,'Pendiente'),(51,8,'2027-07-14',NULL,0.00,33.71,'Pendiente'),(51,9,'2027-08-14',NULL,0.00,33.71,'Pendiente'),(51,10,'2027-09-14',NULL,0.00,33.71,'Pendiente'),(51,11,'2027-10-14',NULL,0.00,33.71,'Pendiente'),(51,12,'2027-11-14',NULL,0.00,33.67,'Pendiente'),(52,1,'2026-12-14',NULL,0.00,59.17,'Pendiente'),(52,2,'2027-01-14',NULL,0.00,59.17,'Pendiente'),(52,3,'2027-02-14',NULL,0.00,59.16,'Pendiente'),(53,1,'2026-12-14','2026-11-14 12:00:00',11.74,11.74,'Pagada'),(53,2,'2027-01-14',NULL,0.00,11.74,'Pendiente'),(53,3,'2027-02-14',NULL,0.00,11.74,'Pendiente'),(53,4,'2027-03-14',NULL,0.00,11.74,'Pendiente'),(53,5,'2027-04-14',NULL,0.00,11.74,'Pendiente'),(53,6,'2027-05-14',NULL,0.00,11.74,'Pendiente'),(54,1,'2026-12-14',NULL,0.00,20.39,'Pendiente'),(54,2,'2027-01-14',NULL,0.00,20.39,'Pendiente'),(54,3,'2027-02-14',NULL,0.00,20.39,'Pendiente'),(54,4,'2027-03-14',NULL,0.00,20.39,'Pendiente'),(54,5,'2027-04-14',NULL,0.00,20.39,'Pendiente'),(54,6,'2027-05-14',NULL,0.00,20.39,'Pendiente'),(54,7,'2027-06-14',NULL,0.00,20.39,'Pendiente'),(54,8,'2027-07-14',NULL,0.00,20.39,'Pendiente'),(54,9,'2027-08-14',NULL,0.00,20.39,'Pendiente'),(54,10,'2027-09-14',NULL,0.00,20.39,'Pendiente'),(54,11,'2027-10-14',NULL,0.00,20.39,'Pendiente'),(54,12,'2027-11-14',NULL,0.00,20.37,'Pendiente');
/*!40000 ALTER TABLE `cuota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallefactura` (
  `ID_FACTURA` int NOT NULL,
  `NUMERO_CORRELATIVO` int NOT NULL,
  `ID_PRODUCTO` int NOT NULL,
  `CANTIDAD_DE_DETALLE` int NOT NULL,
  `PRECIO_UNITARIO` decimal(10,2) NOT NULL,
  `SUBTOTAL` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_FACTURA`,`NUMERO_CORRELATIVO`),
  KEY `FK_INCLUYE` (`ID_PRODUCTO`),
  CONSTRAINT `FK_INCLUYE` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SE_COMPONE` FOREIGN KEY (`ID_FACTURA`) REFERENCES `factura` (`ID_FACTURA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CK_CANT_DETALLE` CHECK ((`CANTIDAD_DE_DETALLE` > 0)),
  CONSTRAINT `CK_NUM_CORRELATIVO` CHECK ((`NUMERO_CORRELATIVO` > 0)),
  CONSTRAINT `CK_PRECIO_UNIT` CHECK ((`PRECIO_UNITARIO` > 0)),
  CONSTRAINT `CK_SUBTOTAL` CHECK ((`SUBTOTAL` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefactura`
--

LOCK TABLES `detallefactura` WRITE;
/*!40000 ALTER TABLE `detallefactura` DISABLE KEYS */;
INSERT INTO `detallefactura` VALUES (1,1,12,1,395.00,395.00),(1,2,162,1,175.00,175.00),(2,1,85,1,210.00,210.00),(2,2,26,1,490.00,490.00),(2,3,74,1,48.00,48.00),(3,1,61,1,110.00,110.00),(3,2,22,1,220.00,220.00),(3,3,11,1,38.00,38.00),(3,4,140,1,185.00,185.00),(4,1,97,1,240.00,240.00),(4,2,76,1,52.00,52.00),(4,3,8,1,165.00,165.00),(4,4,30,1,75.00,75.00),(4,5,153,1,995.00,995.00),(5,1,47,1,31.00,31.00),(5,2,67,1,410.00,410.00),(6,1,163,1,225.00,225.00),(6,2,31,1,189.00,189.00),(6,3,129,1,245.00,245.00),(7,1,117,1,120.00,120.00),(7,2,111,1,1120.00,1120.00),(7,3,134,1,395.00,395.00),(7,4,40,1,19.60,19.60),(8,1,114,1,385.00,385.00),(8,2,157,1,225.00,225.00),(8,3,145,1,85.00,85.00),(8,4,106,1,695.00,695.00),(8,5,58,1,99.99,99.99),(9,1,106,1,695.00,695.00),(9,2,34,1,175.00,175.00),(10,1,164,1,65.00,65.00),(10,2,70,1,680.00,680.00),(10,3,147,1,29.99,29.99),(11,1,123,1,95.00,95.00),(11,2,84,1,79.99,79.99),(11,3,64,1,108.00,108.00),(11,4,16,1,349.99,349.99),(12,1,133,1,495.00,495.00),(12,2,151,1,485.00,485.00),(12,3,56,1,62.00,62.00),(12,4,40,1,19.60,19.60),(12,5,57,1,85.00,85.00),(13,1,38,1,22.75,22.75),(13,2,75,1,65.00,65.00),(14,1,27,1,65.00,65.00),(14,2,124,1,110.00,110.00),(14,3,60,1,78.00,78.00),(15,1,99,1,65.00,65.00),(15,2,160,1,75.00,75.00),(15,3,164,1,65.00,65.00),(15,4,146,1,115.00,115.00),(16,1,162,1,175.00,175.00),(16,2,129,1,245.00,245.00),(16,3,89,1,130.00,130.00),(16,4,136,1,55.00,55.00),(16,5,40,1,19.60,19.60),(17,1,138,1,75.00,75.00),(17,2,153,1,995.00,995.00),(18,1,8,1,165.00,165.00),(18,2,63,1,199.99,199.99),(18,3,122,1,725.00,725.00),(19,1,128,1,115.00,115.00),(19,2,132,1,790.00,790.00),(19,3,93,1,185.00,185.00),(19,4,86,1,85.00,85.00),(20,1,42,1,42.00,42.00),(20,2,83,1,140.00,140.00),(20,3,75,1,65.00,65.00),(20,4,26,1,490.00,490.00),(20,5,76,1,52.00,52.00),(21,1,94,1,180.00,180.00),(21,2,139,1,45.00,45.00),(22,1,87,1,69.00,69.00),(22,2,12,1,395.00,395.00),(22,3,161,1,89.99,89.99),(23,1,164,1,65.00,65.00),(23,2,87,1,69.00,69.00),(23,3,9,1,420.00,420.00),(23,4,158,1,49.99,49.99),(24,1,133,1,495.00,495.00),(24,2,23,1,420.00,420.00),(24,3,62,1,45.00,45.00),(24,4,21,1,450.00,450.00),(24,5,74,1,48.00,48.00),(25,1,144,1,195.00,195.00),(25,2,129,1,245.00,245.00),(26,1,16,1,349.99,349.99),(26,2,102,1,410.00,410.00),(26,3,33,1,367.99,367.99),(27,1,136,1,55.00,55.00),(27,2,22,1,176.00,176.00),(27,3,108,1,785.00,785.00),(27,4,165,1,39.99,39.99),(28,1,72,1,55.00,55.00),(28,2,48,1,19.88,19.88),(28,3,60,1,66.30,66.30),(28,4,64,1,135.00,135.00),(28,5,139,1,45.00,45.00),(29,1,73,1,42.00,42.00),(29,2,146,1,115.00,115.00),(30,1,77,1,40.00,40.00),(30,2,79,1,145.00,145.00),(30,3,11,1,34.20,34.20),(31,1,37,1,49.99,49.99),(31,2,94,1,180.00,180.00),(31,3,26,1,392.00,392.00),(31,4,106,1,695.00,695.00),(32,1,53,1,155.00,155.00),(32,2,55,1,67.99,67.99),(32,3,164,1,65.00,65.00),(32,4,5,1,338.00,338.00),(32,5,152,1,695.00,695.00),(33,1,76,1,52.00,52.00),(33,2,107,1,285.00,285.00),(34,1,18,1,238.00,238.00),(34,2,93,1,185.00,185.00),(34,3,96,1,65.00,65.00),(35,1,96,1,65.00,65.00),(35,2,41,1,20.49,20.49),(35,3,76,1,52.00,52.00),(35,4,16,1,297.49,297.49),(36,1,129,1,245.00,245.00),(36,2,48,1,19.88,19.88),(36,3,119,1,55.00,55.00),(36,4,53,1,155.00,155.00),(36,5,14,1,189.00,189.00),(37,1,98,1,95.00,95.00),(37,2,161,1,89.99,89.99),(38,1,96,1,65.00,65.00),(38,2,159,1,985.50,985.50),(38,3,36,1,110.40,110.40),(39,1,152,1,695.00,695.00),(39,2,65,1,580.00,580.00),(39,3,46,1,24.59,24.59),(39,4,41,1,20.49,20.49),(40,1,156,1,165.00,165.00),(40,2,162,1,148.75,148.75),(40,3,119,1,55.00,55.00),(40,4,37,1,49.99,49.99),(40,5,30,1,75.00,75.00),(41,1,114,1,385.00,385.00),(41,2,69,1,671.50,671.50),(42,1,5,1,338.00,338.00),(42,2,102,1,410.00,410.00),(42,3,28,1,1100.00,1100.00),(43,1,61,1,110.00,110.00),(43,2,83,1,140.00,140.00),(43,3,11,1,34.20,34.20),(43,4,121,1,65.00,65.00),(44,1,71,1,29.75,29.75),(44,2,154,1,89.99,89.99),(44,3,118,1,135.00,135.00),(44,4,73,1,42.00,42.00),(44,5,136,1,55.00,55.00),(45,1,161,1,76.49,76.49),(45,2,73,1,42.00,42.00),(46,1,127,1,125.00,125.00),(46,2,46,1,24.59,24.59),(46,3,20,1,157.25,157.25),(47,1,163,1,191.25,191.25),(47,2,85,1,210.00,210.00),(47,3,104,1,225.00,225.00),(47,4,6,1,227.49,227.49),(48,1,93,1,185.00,185.00),(48,2,39,1,95.00,95.00),(48,3,98,1,95.00,95.00),(48,4,13,1,432.00,432.00),(48,5,82,1,32.00,32.00),(49,1,159,1,985.50,985.50),(49,2,86,1,85.00,85.00),(50,1,81,1,24.50,24.50),(50,2,74,1,38.40,38.40),(50,3,38,1,32.50,32.50),(51,1,61,1,110.00,110.00),(51,2,6,1,227.49,227.49),(51,3,30,2,66.00,132.00),(51,4,83,1,140.00,140.00),(51,5,63,1,199.99,199.99),(52,1,41,1,20.49,20.49),(52,2,111,2,1120.00,2240.00),(53,1,137,2,345.00,690.00),(53,2,40,1,28.00,28.00),(53,3,109,1,620.00,620.00),(54,1,47,1,23.25,23.25),(54,2,132,1,790.00,790.00),(54,3,38,1,32.50,32.50),(54,4,85,1,210.00,210.00),(55,1,15,1,518.50,518.50),(55,2,65,1,580.00,580.00),(55,3,91,1,95.00,95.00),(55,4,17,1,578.00,578.00),(55,5,125,1,225.00,225.00),(56,1,141,1,165.00,165.00),(56,2,148,1,39.99,39.99),(57,1,34,1,161.00,161.00),(57,2,9,1,378.00,378.00),(57,3,15,1,518.50,518.50),(58,1,127,1,125.00,125.00),(58,2,29,1,202.40,202.40),(58,3,35,1,239.20,239.20),(58,4,98,2,95.00,190.00),(59,1,41,1,20.49,20.49),(59,2,114,1,385.00,385.00),(59,3,136,1,55.00,55.00),(59,4,9,2,378.00,756.00),(59,5,105,1,625.00,625.00),(60,1,54,1,215.60,215.60),(60,2,43,1,94.30,94.30),(61,1,82,1,32.00,32.00),(61,2,121,1,65.00,65.00),(61,3,118,1,135.00,135.00),(62,1,157,1,202.50,202.50),(62,2,119,1,55.00,55.00),(62,3,8,1,107.25,107.25),(62,4,9,1,378.00,378.00),(63,1,150,1,65.00,65.00),(63,2,81,1,24.50,24.50),(63,3,75,1,52.00,52.00),(63,4,41,1,20.49,20.49),(63,5,160,1,67.50,67.50),(64,1,62,1,45.00,45.00),(64,2,123,1,95.00,95.00),(65,1,74,1,38.40,38.40),(65,2,96,1,65.00,65.00),(65,3,62,1,45.00,45.00),(66,1,75,1,52.00,52.00),(66,2,6,2,227.49,454.98),(66,3,132,1,790.00,790.00),(66,4,68,1,265.50,265.50),(67,1,39,1,95.00,95.00),(67,2,112,1,145.00,145.00),(67,3,42,1,34.44,34.44),(67,4,12,2,355.50,711.00),(67,5,153,1,995.00,995.00),(68,1,113,1,185.00,185.00),(68,2,3,1,844.99,844.99),(69,1,132,1,790.00,790.00),(69,2,56,1,52.70,52.70),(69,3,59,1,55.25,55.25),(70,1,89,1,130.00,130.00),(70,2,52,1,149.99,149.99),(70,3,101,1,575.00,575.00),(70,4,31,1,210.00,210.00),(71,1,17,1,578.00,578.00),(71,2,128,1,115.00,115.00),(71,3,48,1,19.88,19.88),(71,4,66,1,1150.00,1150.00),(71,5,117,1,120.00,120.00),(72,1,128,1,115.00,115.00),(72,2,122,1,725.00,725.00),(73,1,45,1,18.04,18.04),(73,2,53,1,136.40,136.40),(73,3,59,1,55.25,55.25),(74,1,132,1,790.00,790.00),(74,2,113,2,185.00,370.00),(74,3,3,1,844.99,844.99),(74,4,114,1,385.00,385.00),(75,1,14,1,189.00,189.00),(75,2,90,1,160.00,160.00),(75,3,94,1,180.00,180.00),(75,4,74,1,38.40,38.40),(75,5,63,1,199.99,199.99),(76,1,115,1,175.00,175.00),(76,2,87,1,69.00,69.00),(77,1,44,1,131.20,131.20),(77,2,57,1,72.25,72.25),(77,3,33,1,367.99,367.99),(78,1,98,1,95.00,95.00),(78,2,165,1,31.99,31.99),(78,3,86,1,85.00,85.00),(78,4,146,1,115.00,115.00),(79,1,149,1,55.00,55.00),(79,2,164,1,52.00,52.00),(79,3,47,1,23.25,23.25),(79,4,45,1,18.04,18.04),(79,5,77,1,40.00,40.00),(80,1,126,1,155.00,155.00),(80,2,61,1,110.00,110.00),(81,1,125,1,225.00,225.00),(81,2,138,1,75.00,75.00),(81,3,32,1,315.00,315.00),(82,1,39,2,95.00,190.00),(82,2,76,1,52.00,52.00),(82,3,58,2,84.99,169.98),(82,4,158,1,44.99,44.99),(83,1,20,1,157.25,157.25),(83,2,131,1,675.00,675.00),(83,3,48,1,19.88,19.88),(83,4,143,1,375.00,375.00),(83,5,155,1,189.99,189.99),(84,1,45,2,18.04,36.08),(84,2,12,1,355.50,355.50),(85,1,91,1,95.00,95.00),(85,2,74,1,38.40,38.40),(85,3,19,1,764.99,764.99),(86,1,47,1,23.25,23.25),(86,2,110,1,730.00,730.00),(86,3,146,1,115.00,115.00),(86,4,35,1,239.20,239.20),(87,1,137,1,345.00,345.00),(87,2,40,1,28.00,28.00),(87,3,6,1,227.49,227.49),(87,4,16,2,297.49,594.98),(87,5,57,2,72.25,144.50),(88,1,110,1,730.00,730.00),(88,2,14,1,189.00,189.00),(89,1,19,2,764.99,1529.98),(89,2,29,1,202.40,202.40),(89,3,124,1,110.00,110.00),(90,1,11,1,34.20,34.20),(90,2,118,1,135.00,135.00),(90,3,165,1,31.99,31.99),(90,4,136,1,55.00,55.00),(91,1,138,1,75.00,75.00),(91,2,31,1,210.00,210.00),(91,3,84,1,79.99,79.99),(91,4,40,1,28.00,28.00),(91,5,71,1,29.75,29.75),(92,1,134,1,395.00,395.00),(92,2,96,1,65.00,65.00),(93,1,96,1,65.00,65.00),(93,2,75,1,52.00,52.00),(93,3,147,1,29.99,29.99),(94,1,60,1,66.30,66.30),(94,2,72,1,44.00,44.00),(94,3,73,1,33.60,33.60),(94,4,124,1,110.00,110.00),(95,1,41,1,20.49,20.49),(95,2,57,1,72.25,72.25),(95,3,150,1,65.00,65.00),(95,4,160,1,67.50,67.50),(95,5,39,1,95.00,95.00),(96,1,157,1,202.50,202.50),(96,2,143,1,375.00,375.00),(97,1,131,1,675.00,675.00),(97,2,33,1,367.99,367.99),(97,3,37,1,49.99,49.99),(98,1,26,1,392.00,392.00),(98,2,141,2,165.00,330.00),(98,3,22,1,176.00,176.00),(98,4,88,1,55.00,55.00),(99,1,102,1,410.00,410.00),(99,2,56,1,52.70,52.70),(99,3,80,1,275.00,275.00),(99,4,6,2,227.49,454.98),(99,5,84,1,79.99,79.99),(100,1,59,1,55.25,55.25),(100,2,7,1,279.50,279.50),(101,1,2,1,487.50,487.50),(101,2,21,1,360.00,360.00),(101,3,155,1,189.99,189.99),(102,1,71,1,29.75,29.75),(102,2,69,1,671.50,671.50),(102,3,52,1,149.99,149.99),(102,4,45,1,18.04,18.04),(103,1,105,1,625.00,625.00),(103,2,116,1,450.00,450.00),(103,3,39,1,95.00,95.00),(103,4,3,1,844.99,844.99),(103,5,159,2,985.50,1971.00),(104,1,52,1,149.99,149.99),(104,2,63,1,199.99,199.99),(105,1,150,1,65.00,65.00),(105,2,54,2,215.60,431.20),(105,3,58,1,84.99,84.99),(106,1,89,1,130.00,130.00),(106,2,161,1,76.49,76.49),(106,3,85,1,210.00,210.00),(106,4,37,1,49.99,49.99),(107,1,49,1,465.00,465.00),(107,2,9,1,378.00,378.00),(107,3,76,1,52.00,52.00),(107,4,58,2,84.99,169.98),(107,5,71,1,29.75,29.75),(108,1,64,1,135.00,135.00),(108,2,80,2,275.00,550.00),(109,1,95,1,18.50,18.50),(109,2,139,1,45.00,45.00),(109,3,143,1,375.00,375.00),(110,1,86,1,85.00,85.00),(110,2,56,1,52.70,52.70),(110,3,151,1,485.00,485.00),(110,4,139,1,45.00,45.00),(111,1,81,1,24.50,24.50),(111,2,136,1,55.00,55.00),(111,3,119,1,55.00,55.00),(111,4,89,1,130.00,130.00),(111,5,145,1,85.00,85.00),(112,1,98,1,95.00,95.00),(112,2,127,1,125.00,125.00),(113,1,160,1,67.50,67.50),(113,2,57,1,72.25,72.25),(113,3,38,1,32.50,32.50),(114,1,146,1,115.00,115.00),(114,2,100,1,59.99,59.99),(114,3,62,1,45.00,45.00),(114,4,78,1,125.00,125.00),(115,1,41,1,20.49,20.49),(115,2,91,1,95.00,95.00),(115,3,74,1,38.40,38.40),(115,4,130,1,85.00,85.00),(115,5,46,1,24.59,24.59),(116,1,18,1,238.00,238.00),(116,2,158,1,44.99,44.99),(117,1,133,1,495.00,495.00),(117,2,100,2,59.99,119.98),(117,3,24,1,576.00,576.00),(118,1,111,1,1120.00,1120.00),(118,2,133,1,495.00,495.00),(118,3,48,1,19.88,19.88),(118,4,90,1,160.00,160.00),(119,1,46,1,24.59,24.59),(119,2,18,1,238.00,238.00),(119,3,28,1,968.00,968.00),(119,4,136,1,55.00,55.00),(119,5,25,1,36.00,36.00),(120,1,154,1,89.99,89.99),(120,2,78,1,125.00,125.00),(121,1,138,1,75.00,75.00),(121,2,164,1,52.00,52.00),(121,3,108,1,785.00,785.00),(122,1,132,1,790.00,790.00),(122,2,21,2,360.00,720.00),(122,3,2,2,487.50,975.00),(122,4,97,1,240.00,240.00),(123,1,159,1,985.50,985.50),(123,2,25,1,36.00,36.00),(123,3,3,1,844.99,844.99),(123,4,161,2,76.49,152.98),(123,5,109,1,620.00,620.00),(124,1,121,1,65.00,65.00),(124,2,41,2,20.49,40.98),(125,1,78,1,125.00,125.00),(125,2,146,1,115.00,115.00),(125,3,82,1,32.00,32.00),(126,1,118,1,135.00,135.00),(126,2,128,1,115.00,115.00),(126,3,115,1,175.00,175.00),(126,4,72,1,44.00,44.00),(127,1,104,1,225.00,225.00),(127,2,72,1,44.00,44.00),(127,3,77,1,40.00,40.00),(127,4,114,1,385.00,385.00),(127,5,89,1,130.00,130.00),(128,1,164,1,52.00,52.00),(128,2,73,1,33.60,33.60),(129,1,43,1,94.30,94.30),(129,2,41,1,20.49,20.49),(129,3,119,1,55.00,55.00),(130,1,37,1,49.99,49.99),(130,2,83,1,140.00,140.00),(130,3,99,1,65.00,65.00),(130,4,72,1,44.00,44.00),(131,1,63,1,199.99,199.99),(131,2,118,1,135.00,135.00),(131,3,33,1,367.99,367.99),(131,4,95,1,18.50,18.50),(131,5,143,1,375.00,375.00),(132,1,7,1,279.50,279.50),(132,2,160,1,67.50,67.50),(133,1,161,1,76.49,76.49),(133,2,52,1,149.99,149.99),(133,3,70,1,578.00,578.00),(134,1,59,2,55.25,110.50),(134,2,93,1,185.00,185.00),(134,3,39,2,95.00,190.00),(134,4,70,1,578.00,578.00),(135,1,118,1,135.00,135.00),(135,2,54,2,215.60,431.20),(135,3,65,1,580.00,580.00),(135,4,133,1,495.00,495.00),(135,5,100,1,59.99,59.99),(136,1,150,1,65.00,65.00),(136,2,89,1,130.00,130.00),(137,1,100,1,59.99,59.99),(137,2,82,1,32.00,32.00),(137,3,115,1,175.00,175.00),(138,1,101,2,575.00,1150.00),(138,2,134,1,395.00,395.00),(138,3,54,1,215.60,215.60),(138,4,110,1,730.00,730.00),(139,1,46,1,24.59,24.59),(139,2,140,1,185.00,185.00),(139,3,104,1,225.00,225.00),(139,4,8,1,107.25,107.25),(139,5,23,1,336.00,336.00),(140,1,85,1,210.00,210.00),(140,2,138,1,75.00,75.00),(141,1,148,1,39.99,39.99),(141,2,33,1,367.99,367.99),(141,3,41,1,20.49,20.49),(142,1,104,1,225.00,225.00),(142,2,163,1,191.25,191.25),(142,3,18,1,238.00,238.00),(142,4,135,1,65.00,65.00),(143,1,45,1,18.04,18.04),(143,2,57,1,72.25,72.25),(143,3,41,1,20.49,20.49),(143,4,38,1,32.50,32.50),(143,5,84,1,79.99,79.99),(144,1,148,1,39.99,39.99),(144,2,25,1,36.00,36.00),(145,1,124,1,110.00,110.00),(145,2,98,1,95.00,95.00),(145,3,164,1,52.00,52.00),(146,1,123,1,95.00,95.00),(146,2,88,1,55.00,55.00),(146,3,122,1,725.00,725.00),(146,4,11,2,34.20,68.40),(147,1,138,1,75.00,75.00),(147,2,129,1,245.00,245.00),(147,3,95,1,18.50,18.50),(147,4,92,1,55.00,55.00),(147,5,93,1,185.00,185.00),(148,1,13,1,432.00,432.00),(148,2,57,1,72.25,72.25),(149,1,128,1,115.00,115.00),(149,2,64,1,135.00,135.00),(149,3,148,1,39.99,39.99),(150,1,67,1,369.00,369.00),(150,2,58,1,84.99,84.99),(150,3,75,1,52.00,52.00),(150,4,12,1,355.50,355.50);
/*!40000 ALTER TABLE `detallefactura` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_VALIDAR_STOCK_PREVIO` BEFORE INSERT ON `detallefactura` FOR EACH ROW BEGIN
    DECLARE V_STOCK INT;
    DECLARE V_ESTADO VARCHAR(50);
    DECLARE V_ID_SUCURSAL INT;

    -- Se obtiene la sucursal donde se realiza la venta
    SELECT ID_SUCURSAL INTO V_ID_SUCURSAL
    FROM FACTURA
    WHERE ID_FACTURA = NEW.ID_FACTURA;

    -- Se valida que la factura exista
    IF V_ID_SUCURSAL IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura no existe.';
    END IF;

    -- Se valida que el producto exista y este activo
    IF NOT EXISTS (SELECT 1 FROM PRODUCTO WHERE ID_PRODUCTO = NEW.ID_PRODUCTO AND ESTADO_PRODUCTO = 'Activo') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no existe o esta inactivo.';
    END IF;

    -- Se valida que la cantidad sea mayor que cero
    IF NEW.CANTIDAD_DE_DETALLE <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad debe ser mayor que cero.';
    END IF;

    -- Se valida que el producto exista en el inventario de la sucursal
    IF NOT EXISTS (SELECT 1 FROM INVENTARIO WHERE ID_PRODUCTO = NEW.ID_PRODUCTO AND ID_SUCURSAL = V_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no esta disponible en esta sucursal.';
    END IF;

    -- Se obtiene el stock disponible de la sucursal
    SELECT STOCK INTO V_STOCK
    FROM INVENTARIO
    WHERE ID_PRODUCTO = NEW.ID_PRODUCTO
      AND ID_SUCURSAL = V_ID_SUCURSAL
    FOR UPDATE;

    -- Se valida que exista suficiente stock
    IF V_STOCK < NEW.CANTIDAD_DE_DETALLE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `ID_EMPLEADO` int NOT NULL AUTO_INCREMENT,
  `ID_SUCURSAL` int NOT NULL,
  `ID_SUPERVISOR` int DEFAULT NULL,
  `ID_USUARIO` int NOT NULL,
  `NOMBRE_EMPLEADO` varchar(150) NOT NULL,
  `DUI_EMPLEADO` varchar(12) NOT NULL,
  `CORREO_ELECTRONICO` varchar(150) DEFAULT NULL,
  `FECHA_CONTRATACION` date NOT NULL DEFAULT (curdate()),
  `DIRECCION_EMPLEADO` varchar(200) DEFAULT NULL,
  `TELEFONO_EMPLEADO` varchar(20) DEFAULT NULL,
  `TIPO_EMPLEADO` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_EMPLEADO`),
  UNIQUE KEY `DUI_EMPLEADO` (`DUI_EMPLEADO`),
  KEY `FK_SUPERVISA` (`ID_SUPERVISOR`),
  KEY `FK_TIENE` (`ID_SUCURSAL`),
  KEY `FK_TIENE_ASOCIADO` (`ID_USUARIO`),
  CONSTRAINT `FK_SUPERVISA` FOREIGN KEY (`ID_SUPERVISOR`) REFERENCES `empleado` (`ID_EMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIENE` FOREIGN KEY (`ID_SUCURSAL`) REFERENCES `sucursal` (`ID_SUCURSAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIENE_ASOCIADO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,1,NULL,1,'Juan Carlos Sánchez','02345678-1','jsanchez@electrohogar.sv','2023-01-15','Colonia Escalón, San Salvador','7911-2233','Supervisor'),(2,1,1,2,'María José Hernández','03456789-2','mhernandez@electrohogar.sv','2023-06-10','Soyapango, San Salvador','7822-3344','Subordinado'),(3,1,1,3,'Luis Alberto Martínez','04567890-3','lmartinez@electrohogar.sv','2024-02-12','Mejicanos, San Salvador','7733-4455','Subordinado'),(4,1,1,4,'Carlos Eduardo Flores','05678901-4','cflores@electrohogar.sv','2024-08-20','San Salvador Centro','7644-5566','Subordinado'),(5,1,1,5,'Ana Raquel Ramírez','06789012-5','aramirez@electrohogar.sv','2025-01-15','Antiguo Cuscatlán','7555-6677','Subordinado'),(6,1,1,6,'Kevin Alexander Gómez','07890123-6','kgomez@electrohogar.sv','2025-04-10','Ilopango, San Salvador','7466-7788','Subordinado'),(7,1,1,7,'Diana Marcela Castillo','08901234-7','dcastillo@electrohogar.sv','2025-09-08','Ciudad Delgado','7377-8899','Subordinado'),(8,1,1,8,'Nelson Ernesto Ortiz','09012345-8','nortiz@electrohogar.sv','2026-01-12','San Salvador Norte','7288-9900','Subordinado'),(9,1,1,9,'Paola Michelle Mendoza','01234567-9','pmendoza@electrohogar.sv','2026-03-16','Apopa, San Salvador','7199-0011','Subordinado'),(10,1,1,10,'Héctor Daniel Suárez','02345679-0','hsuarez@electrohogar.sv','2026-06-01','San Salvador Sur','7011-1122','Subordinado'),(11,2,NULL,11,'José Mauricio Rivas','03456791-1','jrivas@electrohogar.sv','2023-02-01','Colonia El Trébol, Santa Ana','7922-1122','Supervisor'),(12,2,11,12,'Claudia María Morales','04567802-2','cmorales@electrohogar.sv','2023-07-15','Santa Ana Centro','7833-2233','Subordinado'),(13,2,11,13,'Ernesto Antonio Silva','05678913-3','esilva@electrohogar.sv','2024-03-10','Chalchuapa, Santa Ana','7744-3344','Subordinado'),(14,2,11,14,'Fabiola Guadalupe Gaitán','06789024-4','fgaitan@electrohogar.sv','2024-09-22','Metapán, Santa Ana','7655-4455','Subordinado'),(15,2,11,15,'Víctor Manuel Aguilar','07890135-5','vaguilar@electrohogar.sv','2025-02-05','Santa Ana Oeste','7566-5566','Subordinado'),(16,2,11,16,'Brenda Lissette Portillo','08901246-6','bportillo@electrohogar.sv','2025-05-12','El Congo, Santa Ana','7477-6677','Subordinado'),(17,2,11,17,'Mario René Coreas','09012357-7','mcoreas@electrohogar.sv','2025-10-20','Santa Ana Norte','7388-7788','Subordinado'),(18,2,11,18,'Sandra Elizabeth Orellana','01234678-8','sorellana@electrohogar.sv','2026-02-10','Buena Vista, Santa Ana','7299-8899','Subordinado'),(19,2,11,19,'Javier Alejandro Meléndez','02345789-9','jmelendez@electrohogar.sv','2026-04-15','Santa Ana Sur','7100-9900','Subordinado'),(20,2,11,20,'Alejandra Beatriz Escobar','03456890-0','aescobar@electrohogar.sv','2026-07-01','Candelaria de la Frontera','7011-0011','Subordinado'),(21,3,NULL,21,'Roberto Carlos Velásquez','04567901-1','rvelasquez@electrohogar.sv','2023-02-15','Avenida Roosevelt, San Miguel','7933-4455','Supervisor'),(22,3,21,22,'Karen Yessenia Quinteros','05678012-2','kquinteros@electrohogar.sv','2023-08-20','San Miguel Centro','7844-5566','Subordinado'),(23,3,21,23,'Edgar Alonso Pérez','06789123-3','eperez@electrohogar.sv','2024-04-15','Chinameca, San Miguel','7755-6677','Subordinado'),(24,3,21,24,'Nathalie Nicole Ramírez','07890234-4','nramirez@electrohogar.sv','2024-10-10','Moncagua, San Miguel','7666-7788','Subordinado'),(25,3,21,25,'David Alejandro Romero','08901345-5','dromero@electrohogar.sv','2025-03-01','San Miguel Norte','7577-8899','Subordinado'),(26,3,21,26,'Carmen Rosa Sosa','09012456-6','csosa@electrohogar.sv','2025-06-20','Quelepa, San Miguel','7488-9900','Subordinado'),(27,3,21,27,'Marvin Antonio Amézquita','01235678-7','mamezquita@electrohogar.sv','2025-11-05','San Miguel Este','7399-0011','Subordinado'),(28,3,21,28,'Flor de María Guevara','02346789-8','fguevara@electrohogar.sv','2026-03-18','El Tránsito, San Miguel','7100-1122','Subordinado'),(29,3,21,29,'Julio César Arévalo','03457890-9','jarevalo@electrohogar.sv','2026-05-10','San Miguel Sur','7022-2233','Subordinado'),(30,3,21,30,'Olga Marina Admin','04568901-0','oadmin@electrohogar.sv','2026-08-05','Comacarán, San Miguel','7033-3344','Subordinado');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `ID_FACTURA` int NOT NULL AUTO_INCREMENT,
  `ID_CLIENTE` int NOT NULL,
  `ID_EMPLEADO` int NOT NULL,
  `ID_SUCURSAL` int NOT NULL,
  `NUMERO_FACTURA` varchar(20) NOT NULL,
  `FECHA_HORA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MONTO_TOTAL` decimal(10,2) NOT NULL,
  `METODO_PAGO` varchar(30) NOT NULL,
  `ESTADO_FACTURA` varchar(50) NOT NULL DEFAULT 'Activa',
  PRIMARY KEY (`ID_FACTURA`),
  UNIQUE KEY `NUMERO_FACTURA` (`NUMERO_FACTURA`),
  KEY `IDX_FACTURA_FECHA` (`FECHA_HORA`),
  KEY `FK_ES_ATENDIDA_POR` (`ID_EMPLEADO`),
  KEY `FK_ES_GENERADA_POR` (`ID_SUCURSAL`),
  KEY `FK_PERTENECE_A` (`ID_CLIENTE`),
  KEY `IDX_FACTURA_CLIENTE_FECHA` (`ID_CLIENTE`,`FECHA_HORA`),
  KEY `IDX_FACTURA_SUCURSAL_FECHA` (`ID_SUCURSAL`,`FECHA_HORA`),
  CONSTRAINT `FK_ES_ATENDIDA_POR` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ES_GENERADA_POR` FOREIGN KEY (`ID_SUCURSAL`) REFERENCES `sucursal` (`ID_SUCURSAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PERTENECE_A` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CK_ESTADO_FACTURA` CHECK ((`ESTADO_FACTURA` in (_utf8mb4'Activa',_utf8mb4'Anulada'))),
  CONSTRAINT `CK_METODO_PAGO` CHECK ((`METODO_PAGO` in (_utf8mb4'Efectivo',_utf8mb4'Tarjeta',_utf8mb4'Credito Corporativo',_utf8mb4'Credito Personal',_utf8mb4'Transferencia'))),
  CONSTRAINT `CK_MONTO_TOTAL` CHECK ((`MONTO_TOTAL` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,2,4,1,'FAC-000001','2026-10-20 10:07:00',570.00,'Efectivo','Activa'),(2,50,14,2,'FAC-000002','2026-10-20 11:14:00',748.00,'Efectivo','Anulada'),(3,19,24,3,'FAC-000003','2026-10-21 12:21:00',553.00,'Efectivo','Anulada'),(4,39,5,1,'FAC-000004','2026-10-21 13:28:00',1527.00,'Tarjeta','Activa'),(5,14,15,2,'FAC-000005','2026-10-22 14:35:00',441.00,'Tarjeta','Anulada'),(6,53,25,3,'FAC-000006','2026-10-22 15:42:00',659.00,'Tarjeta','Anulada'),(7,60,6,1,'FAC-000007','2026-10-23 16:49:00',1654.60,'Credito Corporativo','Activa'),(8,42,17,2,'FAC-000008','2026-10-23 17:56:00',1489.99,'Credito Corporativo','Activa'),(9,49,28,3,'FAC-000009','2026-10-24 09:03:00',870.00,'Credito Corporativo','Activa'),(10,56,9,1,'FAC-000010','2026-10-24 10:10:00',774.99,'Transferencia','Activa'),(11,12,19,2,'FAC-000011','2026-10-25 11:17:00',632.98,'Transferencia','Activa'),(12,45,29,3,'FAC-000012','2026-10-25 12:24:00',1146.60,'Transferencia','Activa'),(13,1,10,1,'FAC-000013','2026-10-26 13:31:00',87.75,'Credito Personal','Activa'),(14,9,20,2,'FAC-000014','2026-10-26 14:38:00',253.00,'Credito Personal','Activa'),(15,16,30,3,'FAC-000015','2026-10-27 15:45:00',320.00,'Credito Personal','Activa'),(16,48,4,1,'FAC-000016','2026-10-27 16:52:00',624.60,'Efectivo','Activa'),(17,10,14,2,'FAC-000017','2026-10-28 17:59:00',1070.00,'Efectivo','Activa'),(18,37,24,3,'FAC-000018','2026-10-28 09:06:00',1089.99,'Efectivo','Activa'),(19,2,5,1,'FAC-000019','2026-10-29 10:13:00',1175.00,'Tarjeta','Activa'),(20,51,15,2,'FAC-000020','2026-10-29 11:20:00',789.00,'Tarjeta','Anulada'),(21,21,25,3,'FAC-000021','2026-10-30 12:27:00',225.00,'Tarjeta','Activa'),(22,40,6,1,'FAC-000022','2026-10-30 13:34:00',553.99,'Credito Corporativo','Activa'),(23,47,17,2,'FAC-000023','2026-10-31 14:41:00',603.99,'Credito Corporativo','Activa'),(24,54,28,3,'FAC-000024','2026-10-31 15:48:00',1458.00,'Credito Corporativo','Activa'),(25,8,9,1,'FAC-000025','2026-11-01 16:55:00',440.00,'Transferencia','Activa'),(26,43,19,2,'FAC-000026','2026-11-01 17:02:00',1127.98,'Transferencia','Activa'),(27,19,29,3,'FAC-000027','2026-11-02 09:09:00',1055.99,'Transferencia','Activa'),(28,2,10,1,'FAC-000028','2026-11-02 10:16:00',321.18,'Credito Personal','Activa'),(29,10,20,2,'FAC-000029','2026-11-03 11:23:00',157.00,'Credito Personal','Activa'),(30,17,30,3,'FAC-000030','2026-11-03 12:30:00',219.20,'Credito Personal','Activa'),(31,5,4,1,'FAC-000031','2026-11-04 13:37:00',1316.99,'Efectivo','Activa'),(32,60,14,2,'FAC-000032','2026-11-04 14:44:00',1320.99,'Efectivo','Activa'),(33,17,24,3,'FAC-000033','2026-11-05 15:51:00',337.00,'Efectivo','Activa'),(34,49,5,1,'FAC-000034','2026-11-05 16:58:00',488.00,'Tarjeta','Activa'),(35,12,15,2,'FAC-000035','2026-11-06 17:05:00',434.98,'Tarjeta','Anulada'),(36,38,25,3,'FAC-000036','2026-11-06 09:12:00',663.88,'Tarjeta','Activa'),(37,45,6,1,'FAC-000037','2026-11-07 10:19:00',184.99,'Credito Corporativo','Activa'),(38,52,17,2,'FAC-000038','2026-11-07 11:26:00',1160.90,'Credito Corporativo','Activa'),(39,59,28,3,'FAC-000039','2026-11-08 12:33:00',1320.08,'Credito Corporativo','Activa'),(40,41,9,1,'FAC-000040','2026-11-08 13:40:00',493.74,'Transferencia','Activa'),(41,10,19,2,'FAC-000041','2026-11-09 14:47:00',1056.50,'Transferencia','Activa'),(42,55,29,3,'FAC-000042','2026-11-09 15:54:00',1848.00,'Transferencia','Activa'),(43,3,10,1,'FAC-000043','2026-11-10 16:01:00',349.20,'Credito Personal','Activa'),(44,11,20,2,'FAC-000044','2026-11-10 17:08:00',351.74,'Credito Personal','Activa'),(45,18,30,3,'FAC-000045','2026-11-11 09:15:00',118.49,'Credito Personal','Activa'),(46,58,4,1,'FAC-000046','2026-11-11 10:22:00',306.84,'Efectivo','Activa'),(47,24,14,2,'FAC-000047','2026-11-12 11:29:00',853.74,'Efectivo','Activa'),(48,47,24,3,'FAC-000048','2026-11-12 12:36:00',839.00,'Efectivo','Anulada'),(49,5,5,1,'FAC-000049','2026-11-13 13:43:00',1070.50,'Tarjeta','Activa'),(50,36,15,2,'FAC-000050','2026-11-13 14:50:00',95.40,'Tarjeta','Activa'),(51,58,6,1,'FAC-000051','2026-11-13 09:00:03',809.48,'Efectivo','Activa'),(52,5,17,2,'FAC-000052','2026-11-13 09:07:16',2260.49,'Efectivo','Activa'),(53,12,28,3,'FAC-000053','2026-11-13 09:14:29',1338.00,'Efectivo','Activa'),(54,19,9,1,'FAC-000054','2026-11-13 09:56:42',1055.75,'Tarjeta','Activa'),(55,26,19,2,'FAC-000055','2026-11-13 10:03:55',1996.50,'Tarjeta','Anulada'),(56,33,29,3,'FAC-000056','2026-11-13 10:10:08',204.99,'Tarjeta','Activa'),(57,40,10,1,'FAC-000057','2026-11-13 10:52:21',1057.50,'Transferencia','Activa'),(58,47,20,2,'FAC-000058','2026-11-13 10:59:34',756.60,'Transferencia','Activa'),(59,54,30,3,'FAC-000059','2026-11-13 11:06:47',1841.49,'Transferencia','Activa'),(60,45,4,1,'FAC-000060','2026-11-13 11:48:00',309.90,'Credito Corporativo','Activa'),(61,55,14,2,'FAC-000061','2026-11-13 11:55:13',232.00,'Credito Corporativo','Activa'),(62,59,24,3,'FAC-000062','2026-11-13 12:02:26',742.75,'Credito Corporativo','Activa'),(63,1,5,1,'FAC-000063','2026-11-13 12:44:39',229.49,'Credito Personal','Activa'),(64,15,15,2,'FAC-000064','2026-11-13 12:51:52',140.00,'Credito Personal','Activa'),(65,25,25,3,'FAC-000065','2026-11-13 12:58:05',148.40,'Credito Personal','Activa'),(66,43,6,1,'FAC-000066','2026-11-13 13:40:18',1562.48,'Efectivo','Activa'),(67,50,17,2,'FAC-000067','2026-11-13 13:47:31',1980.44,'Efectivo','Activa'),(68,57,28,3,'FAC-000068','2026-11-13 13:54:44',1029.99,'Efectivo','Anulada'),(69,4,9,1,'FAC-000069','2026-11-13 14:36:57',897.95,'Tarjeta','Activa'),(70,11,19,2,'FAC-000070','2026-11-13 14:43:10',1064.99,'Tarjeta','Activa'),(71,18,29,3,'FAC-000071','2026-11-13 14:50:23',1982.88,'Tarjeta','Activa'),(72,25,10,1,'FAC-000072','2026-11-13 15:32:36',840.00,'Transferencia','Activa'),(73,32,20,2,'FAC-000073','2026-11-13 15:39:49',209.69,'Transferencia','Activa'),(74,39,30,3,'FAC-000074','2026-11-13 15:46:02',2389.99,'Transferencia','Activa'),(75,57,4,1,'FAC-000075','2026-11-13 16:28:15',767.39,'Credito Corporativo','Activa'),(76,44,14,2,'FAC-000076','2026-11-14 09:00:28',244.00,'Credito Corporativo','Activa'),(77,59,24,3,'FAC-000077','2026-11-14 09:07:41',571.44,'Credito Corporativo','Activa'),(78,23,5,1,'FAC-000078','2026-11-14 09:14:54',326.99,'Credito Personal','Activa'),(79,12,15,2,'FAC-000079','2026-11-14 09:56:07',188.29,'Credito Personal','Activa'),(80,21,25,3,'FAC-000080','2026-11-14 10:03:20',265.00,'Credito Personal','Activa'),(81,28,6,1,'FAC-000081','2026-11-14 10:10:33',615.00,'Efectivo','Activa'),(82,35,17,2,'FAC-000082','2026-11-14 10:52:46',456.97,'Efectivo','Activa'),(83,42,28,3,'FAC-000083','2026-11-14 10:59:59',1417.12,'Efectivo','Activa'),(84,49,9,1,'FAC-000084','2026-11-14 11:06:12',391.58,'Tarjeta','Activa'),(85,56,19,2,'FAC-000085','2026-11-14 11:48:25',898.39,'Tarjeta','Activa'),(86,3,29,3,'FAC-000086','2026-11-14 11:55:38',1107.45,'Tarjeta','Activa'),(87,10,10,1,'FAC-000087','2026-11-14 12:02:51',1339.97,'Transferencia','Activa'),(88,17,20,2,'FAC-000088','2026-11-14 12:44:04',919.00,'Transferencia','Activa'),(89,24,30,3,'FAC-000089','2026-11-14 12:51:17',1842.38,'Transferencia','Activa'),(90,39,4,1,'FAC-000090','2026-11-14 12:58:30',256.19,'Credito Corporativo','Activa'),(91,57,14,2,'FAC-000091','2026-11-14 13:40:43',422.74,'Credito Corporativo','Activa'),(92,45,24,3,'FAC-000092','2026-11-14 13:47:56',460.00,'Credito Corporativo','Activa'),(93,5,5,1,'FAC-000093','2026-11-14 13:54:09',146.99,'Credito Personal','Activa'),(94,15,15,2,'FAC-000094','2026-11-14 14:36:22',253.90,'Credito Personal','Activa'),(95,25,25,3,'FAC-000095','2026-11-14 14:43:35',320.24,'Credito Personal','Activa'),(96,13,6,1,'FAC-000096','2026-11-14 14:50:48',577.50,'Efectivo','Activa'),(97,20,17,2,'FAC-000097','2026-11-14 15:32:01',1092.98,'Efectivo','Activa'),(98,27,28,3,'FAC-000098','2026-11-14 15:39:14',953.00,'Efectivo','Activa'),(99,34,9,1,'FAC-000099','2026-11-14 15:46:27',1272.67,'Tarjeta','Activa'),(100,41,19,2,'FAC-000100','2026-11-14 16:28:40',334.75,'Tarjeta','Activa'),(101,48,9,1,'FAC-000101','2026-11-14 13:30:31',1037.49,'Efectivo','Activa'),(102,55,20,2,'FAC-000102','2026-11-14 13:30:42',869.28,'Efectivo','Activa'),(103,2,30,3,'FAC-000103','2026-11-14 13:30:53',3985.99,'Efectivo','Activa'),(104,9,10,1,'FAC-000104','2026-11-14 13:47:04',349.98,'Tarjeta','Activa'),(105,16,14,2,'FAC-000105','2026-11-14 13:47:15',581.19,'Tarjeta','Activa'),(106,23,24,3,'FAC-000106','2026-11-14 13:47:26',466.48,'Tarjeta','Activa'),(107,30,4,1,'FAC-000107','2026-11-14 14:04:37',1094.73,'Transferencia','Activa'),(108,37,15,2,'FAC-000108','2026-11-14 14:04:48',685.00,'Transferencia','Activa'),(109,44,25,3,'FAC-000109','2026-11-14 14:04:59',438.50,'Transferencia','Activa'),(110,46,5,1,'FAC-000110','2026-11-14 14:21:10',667.70,'Credito Corporativo','Activa'),(111,60,17,2,'FAC-000111','2026-11-14 14:21:21',349.50,'Credito Corporativo','Activa'),(112,41,28,3,'FAC-000112','2026-11-14 14:21:32',220.00,'Credito Corporativo','Activa'),(113,1,6,1,'FAC-000113','2026-11-14 14:38:43',172.25,'Credito Personal','Activa'),(114,24,19,2,'FAC-000114','2026-11-14 14:38:54',344.99,'Credito Personal','Activa'),(115,21,29,3,'FAC-000115','2026-11-14 14:38:05',263.48,'Credito Personal','Activa'),(116,33,9,1,'FAC-000116','2026-11-14 14:55:16',282.99,'Efectivo','Activa'),(117,40,20,2,'FAC-000117','2026-11-14 14:55:27',1190.98,'Efectivo','Activa'),(118,47,30,3,'FAC-000118','2026-11-14 14:55:38',1794.88,'Efectivo','Activa'),(119,54,10,1,'FAC-000119','2026-11-14 15:12:49',1321.59,'Tarjeta','Activa'),(120,1,14,2,'FAC-000120','2026-11-14 15:12:00',214.99,'Tarjeta','Activa'),(121,8,24,3,'FAC-000121','2026-11-14 15:12:11',912.00,'Tarjeta','Activa'),(122,15,4,1,'FAC-000122','2026-11-14 15:29:22',2725.00,'Transferencia','Activa'),(123,22,15,2,'FAC-000123','2026-11-14 15:29:33',2639.47,'Transferencia','Activa'),(124,29,25,3,'FAC-000124','2026-11-14 15:29:44',105.98,'Transferencia','Activa'),(125,42,5,1,'FAC-000125','2026-11-14 15:46:55',272.00,'Credito Corporativo','Activa'),(126,46,17,2,'FAC-000126','2026-11-14 15:46:06',469.00,'Credito Corporativo','Activa'),(127,45,28,3,'FAC-000127','2026-11-14 15:46:17',824.00,'Credito Corporativo','Activa'),(128,2,6,1,'FAC-000128','2026-11-14 16:03:28',85.60,'Credito Personal','Activa'),(129,12,19,2,'FAC-000129','2026-11-14 16:03:39',169.79,'Credito Personal','Activa'),(130,17,29,3,'FAC-000130','2026-11-14 16:03:50',298.99,'Credito Personal','Activa'),(131,18,9,1,'FAC-000131','2026-11-14 16:20:01',1096.48,'Efectivo','Activa'),(132,25,20,2,'FAC-000132','2026-11-14 16:20:12',347.00,'Efectivo','Activa'),(133,32,30,3,'FAC-000133','2026-11-14 16:20:23',804.48,'Efectivo','Activa'),(134,39,10,1,'FAC-000134','2026-11-14 16:37:34',1063.50,'Tarjeta','Activa'),(135,46,14,2,'FAC-000135','2026-11-14 16:37:45',1701.19,'Tarjeta','Activa'),(136,53,24,3,'FAC-000136','2026-11-14 16:37:56',195.00,'Tarjeta','Activa'),(137,60,4,1,'FAC-000137','2026-11-14 16:54:07',266.99,'Transferencia','Activa'),(138,7,15,2,'FAC-000138','2026-11-14 16:54:18',2490.60,'Transferencia','Activa'),(139,14,25,3,'FAC-000139','2026-11-14 16:54:29',877.84,'Transferencia','Activa'),(140,60,5,1,'FAC-000140','2026-11-14 17:11:40',285.00,'Credito Corporativo','Activa'),(141,45,17,2,'FAC-000141','2026-11-14 17:11:51',428.47,'Credito Corporativo','Activa'),(142,45,28,3,'FAC-000142','2026-11-14 17:11:02',719.25,'Credito Corporativo','Activa'),(143,6,6,1,'FAC-000143','2026-11-14 17:28:13',223.27,'Credito Personal','Activa'),(144,11,19,2,'FAC-000144','2026-11-14 17:28:24',75.99,'Credito Personal','Activa'),(145,22,29,3,'FAC-000145','2026-11-14 17:28:35',257.00,'Credito Personal','Activa'),(146,3,9,1,'FAC-000146','2026-11-14 17:45:46',943.40,'Efectivo','Activa'),(147,10,20,2,'FAC-000147','2026-11-14 17:45:57',578.50,'Efectivo','Activa'),(148,17,30,3,'FAC-000148','2026-11-14 17:45:08',504.25,'Efectivo','Activa'),(149,24,10,1,'FAC-000149','2026-11-14 18:02:19',289.99,'Tarjeta','Activa'),(150,31,14,2,'FAC-000150','2026-11-14 18:02:30',861.49,'Tarjeta','Activa');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_REPONER_INVENTARIO_ANULACION` AFTER UPDATE ON `factura` FOR EACH ROW BEGIN
    -- Se reponen las existencias cuando una factura activa pasa a anulada
    IF OLD.ESTADO_FACTURA = 'Activa' AND NEW.ESTADO_FACTURA = 'Anulada' THEN
        UPDATE INVENTARIO I
        INNER JOIN (
            SELECT ID_PRODUCTO, SUM(CANTIDAD_DE_DETALLE) AS CANTIDAD
            FROM DETALLEFACTURA
            WHERE ID_FACTURA = NEW.ID_FACTURA
            GROUP BY ID_PRODUCTO
        ) D ON D.ID_PRODUCTO = I.ID_PRODUCTO
        SET I.STOCK = I.STOCK + D.CANTIDAD
        WHERE I.ID_SUCURSAL = NEW.ID_SUCURSAL;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `ID_PRODUCTO` int NOT NULL,
  `ID_SUCURSAL` int NOT NULL,
  `STOCK` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_PRODUCTO`,`ID_SUCURSAL`),
  KEY `FK_INVENTARIO_SUCURSAL` (`ID_SUCURSAL`),
  CONSTRAINT `FK_INVENTARIO_PRODUCTO` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`),
  CONSTRAINT `FK_INVENTARIO_SUCURSAL` FOREIGN KEY (`ID_SUCURSAL`) REFERENCES `sucursal` (`ID_SUCURSAL`),
  CONSTRAINT `CK_INVENTARIO_STOCK` CHECK ((`STOCK` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,152),(1,2,222),(1,3,96),(2,1,200),(2,2,85),(2,3,166),(3,1,52),(3,2,144),(3,3,237),(4,1,100),(4,2,203),(4,3,110),(5,1,148),(5,2,66),(5,3,180),(6,1,196),(6,2,125),(6,3,54),(7,1,48),(7,2,184),(7,3,124),(8,1,96),(8,2,47),(8,3,194),(9,1,144),(9,2,106),(9,3,68),(10,1,192),(10,2,165),(10,3,138),(11,1,240),(11,2,224),(11,3,209),(12,1,92),(12,2,87),(12,3,82),(13,1,140),(13,2,146),(13,3,153),(14,1,188),(14,2,205),(14,3,222),(15,1,236),(15,2,69),(15,3,96),(16,1,88),(16,2,128),(16,3,166),(17,1,136),(17,2,187),(17,3,236),(18,1,184),(18,2,49),(18,3,110),(19,1,232),(19,2,108),(19,3,180),(20,1,84),(20,2,167),(20,3,54),(21,1,132),(21,2,226),(21,3,124),(22,1,180),(22,2,89),(22,3,195),(23,1,228),(23,2,148),(23,3,68),(24,1,80),(24,2,207),(24,3,138),(25,1,128),(25,2,70),(25,3,208),(26,1,176),(26,2,131),(26,3,82),(27,1,224),(27,2,188),(27,3,152),(28,1,76),(28,2,51),(28,3,222),(29,1,124),(29,2,110),(29,3,96),(30,1,172),(30,2,169),(30,3,166),(31,1,220),(31,2,228),(31,3,237),(32,1,72),(32,2,91),(32,3,110),(33,1,120),(33,2,150),(33,3,180),(34,1,168),(34,2,209),(34,3,54),(35,1,216),(35,2,72),(35,3,124),(36,1,68),(36,2,131),(36,3,194),(37,1,116),(37,2,190),(37,3,68),(38,1,164),(38,2,53),(38,3,138),(39,1,212),(39,2,112),(39,3,209),(40,1,64),(40,2,171),(40,3,82),(41,1,112),(41,2,231),(41,3,152),(42,1,160),(42,2,94),(42,3,222),(43,1,208),(43,2,152),(43,3,96),(44,1,60),(44,2,211),(44,3,166),(45,1,108),(45,2,74),(45,3,236),(46,1,156),(46,2,133),(46,3,110),(47,1,204),(47,2,193),(47,3,180),(48,1,56),(48,2,55),(48,3,54),(49,1,104),(49,2,114),(49,3,124),(50,1,152),(50,2,173),(50,3,194),(51,1,200),(51,2,232),(51,3,68),(52,1,52),(52,2,95),(52,3,138),(53,1,100),(53,2,154),(53,3,208),(54,1,148),(54,2,213),(54,3,82),(55,1,196),(55,2,76),(55,3,152),(56,1,48),(56,2,135),(56,3,222),(57,1,96),(57,2,194),(57,3,96),(58,1,144),(58,2,57),(58,3,166),(59,1,192),(59,2,116),(59,3,236),(60,1,240),(60,2,175),(60,3,110),(61,1,92),(61,2,234),(61,3,181),(62,1,140),(62,2,97),(62,3,54),(63,1,188),(63,2,156),(63,3,124),(64,1,236),(64,2,215),(64,3,194),(65,1,88),(65,2,79),(65,3,68),(66,1,136),(66,2,137),(66,3,138),(67,1,184),(67,2,197),(67,3,208),(68,1,232),(68,2,59),(68,3,82),(69,1,84),(69,2,118),(69,3,152),(70,1,132),(70,2,177),(70,3,222),(71,1,180),(71,2,236),(71,3,96),(72,1,228),(72,2,99),(72,3,166),(73,1,80),(73,2,158),(73,3,236),(74,1,128),(74,2,218),(74,3,110),(75,1,176),(75,2,81),(75,3,180),(76,1,224),(76,2,141),(76,3,54),(77,1,76),(77,2,198),(77,3,124),(78,1,124),(78,2,61),(78,3,194),(79,1,172),(79,2,120),(79,3,68),(80,1,220),(80,2,179),(80,3,138),(81,1,72),(81,2,238),(81,3,208),(82,1,120),(82,2,101),(82,3,83),(83,1,168),(83,2,161),(83,3,152),(84,1,216),(84,2,219),(84,3,222),(85,1,68),(85,2,83),(85,3,96),(86,1,116),(86,2,141),(86,3,166),(87,1,164),(87,2,200),(87,3,236),(88,1,212),(88,2,63),(88,3,110),(89,1,64),(89,2,122),(89,3,180),(90,1,112),(90,2,181),(90,3,54),(91,1,160),(91,2,241),(91,3,124),(92,1,208),(92,2,103),(92,3,194),(93,1,60),(93,2,162),(93,3,69),(94,1,108),(94,2,221),(94,3,138),(95,1,156),(95,2,84),(95,3,208),(96,1,204),(96,2,144),(96,3,82),(97,1,56),(97,2,202),(97,3,152),(98,1,104),(98,2,65),(98,3,223),(99,1,152),(99,2,124),(99,3,96),(100,1,200),(100,2,183),(100,3,166),(101,1,52),(101,2,46),(101,3,236),(102,1,100),(102,2,105),(102,3,110),(103,1,148),(103,2,164),(103,3,180),(104,1,196),(104,2,223),(104,3,54),(105,1,48),(105,2,86),(105,3,124),(106,1,96),(106,2,145),(106,3,194),(107,1,144),(107,2,204),(107,3,68),(108,1,192),(108,2,67),(108,3,138),(109,1,240),(109,2,126),(109,3,208),(110,1,92),(110,2,185),(110,3,82),(111,1,140),(111,2,48),(111,3,152),(112,1,188),(112,2,107),(112,3,222),(113,1,236),(113,2,166),(113,3,97),(114,1,88),(114,2,225),(114,3,166),(115,1,136),(115,2,88),(115,3,236),(116,1,184),(116,2,147),(116,3,110),(117,1,232),(117,2,206),(117,3,180),(118,1,84),(118,2,69),(118,3,54),(119,1,132),(119,2,128),(119,3,124),(120,1,180),(120,2,187),(120,3,194),(121,1,228),(121,2,50),(121,3,68),(122,1,80),(122,2,109),(122,3,138),(123,1,128),(123,2,168),(123,3,208),(124,1,176),(124,2,227),(124,3,82),(125,1,224),(125,2,91),(125,3,152),(126,1,76),(126,2,149),(126,3,222),(127,1,124),(127,2,208),(127,3,96),(128,1,172),(128,2,71),(128,3,166),(129,1,220),(129,2,130),(129,3,237),(130,1,72),(130,2,189),(130,3,110),(131,1,120),(131,2,52),(131,3,180),(132,1,168),(132,2,111),(132,3,54),(133,1,216),(133,2,170),(133,3,124),(134,1,68),(134,2,229),(134,3,194),(135,1,116),(135,2,92),(135,3,68),(136,1,164),(136,2,151),(136,3,138),(137,1,212),(137,2,210),(137,3,208),(138,1,64),(138,2,73),(138,3,82),(139,1,112),(139,2,132),(139,3,152),(140,1,160),(140,2,191),(140,3,176),(141,1,208),(141,2,54),(141,3,120),(142,1,60),(142,2,113),(142,3,210),(143,1,108),(143,2,172),(143,3,85),(144,1,156),(144,2,231),(144,3,145),(145,1,204),(145,2,94),(145,3,190),(146,1,56),(146,2,153),(146,3,160),(147,1,104),(147,2,212),(147,3,230),(148,1,152),(148,2,75),(148,3,115),(149,1,200),(149,2,134),(149,3,200),(150,1,52),(150,2,193),(150,3,135),(151,1,35),(151,2,24),(151,3,20),(152,1,18),(152,2,12),(152,3,10),(153,1,22),(153,2,16),(153,3,14),(154,1,85),(154,2,60),(154,3,75),(155,1,45),(155,2,30),(155,3,25),(156,1,40),(156,2,28),(156,3,22),(157,1,65),(157,2,48),(157,3,42),(158,1,95),(158,2,70),(158,3,65),(159,1,12),(159,2,8),(159,3,7),(160,1,80),(160,2,55),(160,3,48),(161,1,75),(161,2,52),(161,3,46),(162,1,38),(162,2,45),(162,3,55),(163,1,30),(163,2,22),(163,3,19),(164,1,110),(164,2,75),(164,3,68),(165,1,150),(165,2,105),(165,3,95);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limitecreditopersonal`
--

DROP TABLE IF EXISTS `limitecreditopersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `limitecreditopersonal` (
  `ID_LIMITE` int NOT NULL AUTO_INCREMENT,
  `ID_SUCURSAL` int NOT NULL,
  `ID_CLIENTE` int NOT NULL,
  `MONTOLIMITE` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_LIMITE`),
  UNIQUE KEY `UQ_LIMITE_CLIENTE_SUCURSAL` (`ID_CLIENTE`,`ID_SUCURSAL`),
  KEY `FK_DESIGNA` (`ID_SUCURSAL`),
  CONSTRAINT `FK_DESIGNA` FOREIGN KEY (`ID_SUCURSAL`) REFERENCES `sucursal` (`ID_SUCURSAL`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TIENE_UN` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `clientenatural` (`ID_CLIENTE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CK_MONTO_LIMITE_PER` CHECK ((`MONTOLIMITE` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limitecreditopersonal`
--

LOCK TABLES `limitecreditopersonal` WRITE;
/*!40000 ALTER TABLE `limitecreditopersonal` DISABLE KEYS */;
INSERT INTO `limitecreditopersonal` VALUES (1,1,1,500.00),(2,1,2,750.00),(3,1,3,1000.00),(4,1,4,600.00),(5,1,5,800.00),(6,1,6,1200.00),(7,1,7,450.00),(8,1,8,900.00),(9,2,9,500.00),(10,2,10,650.00),(11,2,11,1100.00),(12,2,12,700.00),(13,2,13,850.00),(14,2,14,1000.00),(15,2,15,550.00),(16,3,16,600.00),(17,3,17,750.00),(18,3,18,900.00),(19,3,19,1200.00),(20,3,20,500.00),(21,3,21,800.00),(22,3,22,1000.00),(23,1,23,1500.00),(24,2,24,950.00),(25,3,25,650.00);
/*!40000 ALTER TABLE `limitecreditopersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `ID_PRODUCTO` int NOT NULL AUTO_INCREMENT,
  `ID_CATEGORIA` int NOT NULL,
  `NOMBRE_PRODUCTO` varchar(150) NOT NULL,
  `PRECIO_VENTA` decimal(10,2) NOT NULL,
  `ESTADO_PRODUCTO` varchar(50) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`ID_PRODUCTO`),
  KEY `FK_CLASIFICA_A` (`ID_CATEGORIA`),
  KEY `IDX_PRODUCTO_NOMBRE` (`NOMBRE_PRODUCTO`),
  CONSTRAINT `FK_CLASIFICA_A` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categoria` (`ID_CATEGORIA`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CK_ESTADO_PRODUCTO` CHECK ((`ESTADO_PRODUCTO` in (_utf8mb4'Activo',_utf8mb4'Inactivo'))),
  CONSTRAINT `CK_PRECIO_VENTA` CHECK ((`PRECIO_VENTA` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,'Refrigerador Mabe 11 Pies Cromado',489.99,'Activo'),(2,1,'Refrigerador LG Inverter 2 Puertas 14 Pies',750.00,'Activo'),(3,1,'Refrigerador Samsung French Door 22 Pies',1299.99,'Activo'),(4,1,'Mini Bar Cetron 3.2 Pies Cúbicos',195.00,'Activo'),(5,1,'Refrigerador Whirlpool Top Mount 12 Pies',520.00,'Activo'),(6,1,'Congelador Horizontal Midea 5 Pies Cúbicos',349.99,'Activo'),(7,1,'Refrigerador Frigidaire 10 Pies Blanco',430.00,'Activo'),(8,1,'Dispensador de Agua Enfriador Mabe',165.00,'Activo'),(9,2,'Cocina a Gas Mabe 4 Quemadores con Horno',420.00,'Activo'),(10,2,'Cocina Whirlpool Vidrio Templado 6 Quemadores',550.00,'Activo'),(11,2,'Estufa de Mesa Eléctrica 2 Hornillas Imaco',38.00,'Activo'),(12,2,'Cocina a Gas Acero Inoxidable Challenger 4 Hornillas',395.00,'Activo'),(13,2,'Cocina Empotrable de Inducción Midea 4 Zonas',480.00,'Activo'),(14,2,'Campana Extractora de Humo Mabe 60 cm',210.00,'Activo'),(15,2,'Horno Empotrable a Gas Whirlpool 24 Pulgadas',610.00,'Activo'),(16,3,'Smart TV TCL 50 Pulgadas 4K UHD',349.99,'Activo'),(17,3,'Smart TV Sony Bravia 55 Pulgadas Google TV',680.00,'Activo'),(18,3,'Pantalla LED Samsung 43 Pulgadas Full HD',280.00,'Activo'),(19,3,'Smart TV LG 65 Pulgadas 4K ThinQ AI',899.99,'Activo'),(20,3,'Smart TV Xiaomi 32 Pulgadas HD LED',185.00,'Activo'),(21,3,'Pantalla LED Hisense 58 Pulgadas 4K UHD',450.00,'Activo'),(22,3,'Smart TV RCA 40 Pulgadas Full HD',220.00,'Activo'),(23,4,'Aire Acondicionado Split Inverter 12000 BTU Midea',420.00,'Activo'),(24,4,'Aire Acondicionado Daikin 18000 BTU 220V',720.00,'Activo'),(25,4,'Ventilador de Pedestal Black & Decker 3 en 1',45.00,'Activo'),(26,4,'Aire Acondicionado Portable LG 10000 BTU',490.00,'Activo'),(27,4,'Ventilador de Torre Oscilante Imaco con Control',65.00,'Activo'),(28,4,'Aire Acondicionado Carrier 24000 BTU Inverter',1100.00,'Activo'),(29,4,'Deshumidificador Casero Midea 30 Pints',230.00,'Activo'),(30,4,'Ventilador de Piso Industrial 20 Pulgadas',75.00,'Activo'),(31,5,'Barra de Sonido Sony con Subwoofer Inalámbrico',210.00,'Activo'),(32,5,'Minicomponente LG Bluetooth XBOOM 1000W',315.00,'Activo'),(33,5,'Sistema de Audio JBL PartyBox 110 Portátil',399.99,'Activo'),(34,5,'Barra de Sonido Samsung 2.1 Canales con Dolby Audio',175.00,'Activo'),(35,5,'Minicomponente Panasonic MAX GO 300W',260.00,'Activo'),(36,5,'Reproductor Blu-Ray Disc Sony con Streaming',120.00,'Activo'),(37,6,'Licuadora Oster Jarra de Vidrio 3 Velocidades',49.99,'Activo'),(38,6,'Cafetera Eléctrica Black & Decker 12 Tazas',32.50,'Activo'),(39,6,'Microondas Mabe Digital 0.7 Pies Cúbicos',95.00,'Activo'),(40,6,'Tostadora de Pan Philips 2 Ranuras',28.00,'Activo'),(41,6,'Plancha de Vapor para Ropa Black & Decker',24.99,'Activo'),(42,6,'Licuadora de Inmersión Oster con Accesorios',42.00,'Activo'),(43,6,'Cafetera Espresso Philips de Cápsulas',115.00,'Activo'),(44,6,'Microondas LG Grill 1.1 Pies Cúbicos',160.00,'Activo'),(45,6,'Exprimidor de Cítricos Eléctrico Imaco',22.00,'Activo'),(46,6,'Batidora de Mano Oster 5 Velocidades',29.99,'Activo'),(47,6,'Hervidor de Agua Eléctrico Acero Inoxidable 1.7 L',31.00,'Activo'),(48,6,'Sandwichera Placa Antiadherente Imaco',26.50,'Activo'),(49,7,'Laptop HP 15.6 Pulgadas Core i5 8GB RAM 512GB SSD',620.00,'Activo'),(50,7,'Impresora Multifuncional Epson EcoTank L3210',215.00,'Activo'),(51,7,'Laptop Lenovo IdeaPad 3 Celeron 4GB 128GB SSD',340.00,'Activo'),(52,7,'Tablet Lenovo Tab M10 Plus 4GB 64GB',199.99,'Activo'),(53,7,'Monitor Gamer LED 24 Pulgadas Full HD AOC',155.00,'Activo'),(54,7,'Impresora HP LaserJet Pro Inalámbrica',245.00,'Activo'),(55,7,'Router Inalámbrico Wi-Fi 6 Dual Band TP-Link',79.99,'Activo'),(56,7,'Disco Duro Externo Portable 1TB Seagate',62.00,'Activo'),(57,8,'Batidora de Pedestal Oster con Tazón de Acero',85.00,'Activo'),(58,8,'Freidora de Aire Imaco Digital 4 Litros',99.99,'Activo'),(59,8,'Horno Tostador Black & Decker 9 Litros',65.00,'Activo'),(60,8,'Procesador de Alimentos Oster 8 Tazas',78.00,'Activo'),(61,8,'Olla de Presión Multifuncional Midea 6 Litros',110.00,'Activo'),(62,8,'Wafflera Eléctrica Giratoria Oster',45.00,'Activo'),(63,8,'Freidora de Aire Dual Basket Ninja 8 Litros',199.99,'Activo'),(64,8,'Set de Ollas de Acero Inoxidable Tramontina 10 Pzas',135.00,'Activo'),(65,9,'Lavadora Automática Whirlpool 18 Kg Carga Superior',580.00,'Activo'),(66,9,'Centro de Lavado Mabe Gas 20 Kg',1150.00,'Activo'),(67,9,'Secadora de Ropa Midea Eléctrica 7 Kg',410.00,'Activo'),(68,9,'Lavadora Semiautomática Cetron 13 Kg Doble Tina',295.00,'Activo'),(69,9,'Lavadora LG Carga Frontal Inverter 12 Kg',790.00,'Activo'),(70,9,'Secadora de Ropa a Gas Whirlpool 15 Kg',680.00,'Activo'),(71,10,'Secadora de Cabello Profesional Remington',35.00,'Activo'),(72,10,'Afeitadora Recargable Philips Series 3000',55.00,'Activo'),(73,10,'Plancha Alaciadora de Cabello Conair Cerámica',42.00,'Activo'),(74,10,'Cortadora de Cabello Kit Profesional Wahl',48.00,'Activo'),(75,10,'Depiladora Eléctrica Braun Silk-épil 3',65.00,'Activo'),(76,10,'Cepillo Secador Revlon One-Step Volumizer',52.00,'Activo'),(77,11,'Lámpara LED Inteligente de Piso Wi-Fi',40.00,'Activo'),(78,11,'Aspiradora Vertical Sin Cable Midea',125.00,'Activo'),(79,11,'Aspiradora de Arrastre 2000W Philips',145.00,'Activo'),(80,11,'Robot Aspirador Inteligente Xiaomi Mi Robot',275.00,'Activo'),(81,11,'Lámpara de Escritorio LED con Carga USB',24.50,'Activo'),(82,11,'Set de Focos LED Inteligentes RGB Pack de 4',32.00,'Activo'),(83,12,'Hidrolavadora Black & Decker 1500 PSI',140.00,'Activo'),(84,12,'Taladro Percutor Bosch 550W con Accesorios',79.99,'Activo'),(85,12,'Cortadora de Césped Eléctrica Black & Decker',210.00,'Activo'),(86,12,'Kit de Herramientas Manuales 100 Piezas Stanley',85.00,'Activo'),(87,12,'Esmeril Angular Bosch 4-1/2 Pulgadas 710W',69.00,'Activo'),(88,12,'Soplador de Hojas Eléctrico B&D 400W',55.00,'Activo'),(89,13,'Silla Ergonómica Ejecutiva para Oficina',130.00,'Activo'),(90,13,'Escritorio Modular de Madera para Cómputo',160.00,'Activo'),(91,13,'Estantería Metálica de 5 Niveles para Archivo',95.00,'Activo'),(92,13,'Silla de Visita Fija Tapizada en Tela',55.00,'Activo'),(93,13,'Archivero Metálico de 3 Gavetas con Llave',185.00,'Activo'),(94,14,'Kit de Seguridad Smart Home Cámara y Sensores',180.00,'Activo'),(95,14,'Enchufe Inteligente Wi-Fi Compatible con Alexa',18.50,'Activo'),(96,14,'Cámara de Seguridad Exterior Wi-Fi 1080p Imou',65.00,'Activo'),(97,14,'Cerradura Digital Inteligente con Huella Biométrica',240.00,'Activo'),(98,15,'Audífonos Inalámbricos Bluetooth Sony con Cancelación',95.00,'Activo'),(99,15,'Bocina Portátil JBL Clip 4 Resistente al Agua',65.00,'Activo'),(100,15,'Audífonos Gamer con Micrófono HyperX Cloud Stinger',59.99,'Activo'),(101,1,'Refrigerador Hisense Inverter 13 Pies Gris',575.00,'Activo'),(102,1,'Congelador Vertical Frigidaire 7 Pies',410.00,'Activo'),(103,1,'Refrigerador Midea Side by Side 18 Pies',890.00,'Activo'),(104,1,'Enfriador de Bebidas RCA 90 Litros',225.00,'Activo'),(105,2,'Cocina Eléctrica Frigidaire 4 Quemadores',625.00,'Activo'),(106,2,'Horno de Gas Mabe 30 Pulgadas',695.00,'Activo'),(107,2,'Campana Extractora Whirlpool 90 cm',285.00,'Activo'),(108,3,'Smart TV Hisense 70 Pulgadas 4K UHD',785.00,'Activo'),(109,3,'Proyector Portátil Epson Full HD',620.00,'Activo'),(110,3,'Smart TV Philips 55 Pulgadas Ambilight',730.00,'Activo'),(111,3,'Pantalla Samsung QLED 65 Pulgadas',1120.00,'Activo'),(112,4,'Ventilador de Techo Hunter con Control',145.00,'Activo'),(113,4,'Purificador de Aire Xiaomi Smart Air',185.00,'Activo'),(114,4,'Aire Acondicionado Mini Split LG 9000 BTU',385.00,'Activo'),(115,5,'Parlante Bluetooth Bose SoundLink Flex',175.00,'Activo'),(116,5,'Sistema de Teatro en Casa Sony 5.1',450.00,'Activo'),(117,5,'Micrófono Inalámbrico JBL Dual',120.00,'Activo'),(118,6,'Licuadora Ninja Profesional 1000W',135.00,'Activo'),(119,6,'Cafetera Programable Oster 12 Tazas',55.00,'Activo'),(120,6,'Microondas Samsung 1.4 Pies Cúbicos',185.00,'Activo'),(121,6,'Plancha de Vapor Philips 2400W',65.00,'Activo'),(122,7,'Laptop Acer Aspire 5 Ryzen 5 16GB RAM',725.00,'Activo'),(123,7,'Teclado Mecánico Logitech G413',95.00,'Activo'),(124,7,'Mouse Inalámbrico Logitech MX Master',110.00,'Activo'),(125,7,'Monitor Samsung Curvo 27 Pulgadas',225.00,'Activo'),(126,7,'UPS APC 900VA Respaldo Eléctrico',155.00,'Activo'),(127,8,'Freidora de Aire Oster 6 Litros',125.00,'Activo'),(128,8,'Máquina para Pan Hamilton Beach',115.00,'Activo'),(129,8,'Horno Eléctrico de Convección Oster 45 Litros',245.00,'Activo'),(130,8,'Juego de Sartenes Antiadherentes T-fal 3 Piezas',85.00,'Activo'),(131,9,'Lavadora Samsung Digital Inverter 19 Kg',675.00,'Activo'),(132,9,'Secadora Eléctrica LG 20 Kg',790.00,'Activo'),(133,9,'Lavadora Mabe Automática 16 Kg',495.00,'Activo'),(134,10,'Secadora de Cabello Dyson Supersonic',395.00,'Activo'),(135,10,'Rasuradora Philips OneBlade Recargable',65.00,'Activo'),(136,10,'Cepillo Dental Eléctrico Oral-B Pro',55.00,'Activo'),(137,11,'Aspiradora Robot Ecovacs Deebot',345.00,'Activo'),(138,11,'Lámpara Inteligente Philips Hue',75.00,'Activo'),(139,11,'Purificador de Agua de Grifo Brita',45.00,'Activo'),(140,12,'Taladro Inalámbrico DeWalt 20V',185.00,'Activo'),(141,12,'Sierra Circular Bosch 7-1/4 Pulgadas',165.00,'Activo'),(142,12,'Juego de Destornilladores Stanley 20 Piezas',35.00,'Activo'),(143,13,'Escritorio Ajustable de Altura Eléctrico',375.00,'Activo'),(144,13,'Silla de Oficina con Soporte Lumbar',195.00,'Activo'),(145,13,'Mesa Plegable Multiuso 120 cm',85.00,'Activo'),(146,14,'Timbre Inteligente con Cámara Wi-Fi',115.00,'Activo'),(147,14,'Sensor de Movimiento Inteligente Zigbee',29.99,'Activo'),(148,14,'Controlador de Iluminación Smart Wi-Fi',39.99,'Activo'),(149,15,'Audífonos Inalámbricos JBL Tune 520BT',55.00,'Activo'),(150,15,'Bocina Bluetooth Sony SRS-XB100',65.00,'Activo'),(151,1,'Congelador Horizontal Hisense 10 Pies Cúbicos',485.00,'Activo'),(152,2,'Lavavajillas Whirlpool de 14 Servicios',695.00,'Activo'),(153,3,'Smart TV TCL QLED 75 Pulgadas 4K',995.00,'Activo'),(154,4,'Ventilador de Pared Industrial 18 Pulgadas',89.99,'Activo'),(155,5,'Sistema de Karaoke Portátil con Micrófonos',189.99,'Activo'),(156,6,'Máquina de Hielo Portátil de 12 Kg Diarios',165.00,'Activo'),(157,7,'Tablet Samsung Galaxy Tab A9 8.7 Pulgadas',225.00,'Activo'),(158,8,'Máquina de Donas Eléctrica Antiadherente',49.99,'Activo'),(159,9,'Lavadora Secadora LG Inverter 12 Kg',1095.00,'Activo'),(160,10,'Masajeador de Cuello y Espalda con Calor',75.00,'Activo'),(161,11,'Aspiradora de Mano Recargable Black & Decker',89.99,'Activo'),(162,12,'Podadora de Setos Inalámbrica 20V',175.00,'Activo'),(163,13,'Archivador Vertical Metálico de 4 Gavetas',225.00,'Activo'),(164,14,'Detector Inteligente de Humo Wi-Fi',65.00,'Activo'),(165,15,'Audífonos Inalámbricos Anker Soundcore P20i',39.99,'Activo');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productopromocion`
--

DROP TABLE IF EXISTS `productopromocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productopromocion` (
  `ID_PROMOCION` int NOT NULL,
  `ID_PRODUCTO` int NOT NULL,
  PRIMARY KEY (`ID_PROMOCION`,`ID_PRODUCTO`),
  KEY `FK_APLICA_A2` (`ID_PRODUCTO`),
  CONSTRAINT `FK_APLICA_A` FOREIGN KEY (`ID_PROMOCION`) REFERENCES `promocion` (`ID_PROMOCION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_APLICA_A2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productopromocion`
--

LOCK TABLES `productopromocion` WRITE;
/*!40000 ALTER TABLE `productopromocion` DISABLE KEYS */;
INSERT INTO `productopromocion` VALUES (12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),(12,8),(16,9),(16,10),(16,11),(16,12),(16,13),(16,14),(17,15),(17,16),(17,17),(17,18),(17,19),(17,20),(18,21),(18,22),(18,23),(18,24),(18,25),(18,26),(19,27),(19,28),(19,29),(19,30),(20,31),(20,32),(21,33),(21,34),(21,35),(21,36),(13,37),(13,38),(13,39),(13,40),(22,41),(22,42),(22,43),(22,44),(22,45),(22,46),(23,47),(23,48),(23,49),(23,50),(23,51),(23,52),(24,53),(24,54),(25,55),(25,56),(25,57),(25,58),(25,59),(25,60),(26,61),(26,62),(26,63),(27,64),(27,65),(27,66),(28,67),(28,68),(29,69),(29,70),(29,71),(30,72),(30,73),(30,74),(30,75),(26,151),(26,152),(26,153),(27,154),(27,155),(27,156),(28,157),(28,158),(28,159),(28,160),(29,161),(29,162),(29,163),(30,164),(30,165);
/*!40000 ALTER TABLE `productopromocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion`
--

DROP TABLE IF EXISTS `promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocion` (
  `ID_PROMOCION` int NOT NULL AUTO_INCREMENT,
  `FECHA_INICIO` date NOT NULL,
  `FECHA_FIN` date NOT NULL,
  `PORCENTAJE_DESCUENTO` decimal(5,2) DEFAULT NULL,
  `ESTADO_PROMOCION` varchar(50) NOT NULL DEFAULT 'Activa',
  PRIMARY KEY (`ID_PROMOCION`),
  CONSTRAINT `CK_ESTADO_PROM` CHECK ((`ESTADO_PROMOCION` in (_utf8mb4'Activa',_utf8mb4'Inactiva'))),
  CONSTRAINT `CK_FECHAS_PROM` CHECK ((`FECHA_FIN` >= `FECHA_INICIO`)),
  CONSTRAINT `CK_PORC_DESC` CHECK (((`PORCENTAJE_DESCUENTO` >= 0) and (`PORCENTAJE_DESCUENTO` <= 100)))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion`
--

LOCK TABLES `promocion` WRITE;
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
INSERT INTO `promocion` VALUES (1,'2026-01-01','2026-01-31',15.00,'Inactiva'),(2,'2026-02-01','2026-02-28',10.00,'Inactiva'),(3,'2026-03-01','2026-03-31',20.00,'Inactiva'),(4,'2026-04-01','2026-04-30',25.00,'Inactiva'),(5,'2026-05-01','2026-05-15',30.00,'Inactiva'),(6,'2026-05-16','2026-05-31',12.50,'Inactiva'),(7,'2026-06-01','2026-06-30',10.00,'Inactiva'),(8,'2026-07-01','2026-07-31',5.00,'Inactiva'),(9,'2026-08-01','2026-08-31',18.00,'Inactiva'),(10,'2026-09-01','2026-09-30',22.00,'Inactiva'),(11,'2026-10-01','2026-10-31',15.00,'Inactiva'),(12,'2026-11-01','2026-11-30',35.00,'Activa'),(13,'2026-10-10','2026-10-31',30.00,'Inactiva'),(14,'2025-11-15','2025-11-30',40.00,'Inactiva'),(15,'2025-12-01','2025-12-31',20.00,'Inactiva'),(16,'2026-11-01','2026-11-20',10.00,'Activa'),(17,'2026-11-05','2026-11-25',15.00,'Activa'),(18,'2026-11-01','2026-11-15',20.00,'Activa'),(19,'2026-11-10','2026-11-30',12.00,'Activa'),(20,'2026-10-15','2026-10-31',10.00,'Inactiva'),(21,'2026-11-01','2026-11-30',8.00,'Activa'),(22,'2026-11-01','2026-11-30',18.00,'Activa'),(23,'2026-11-01','2026-11-30',25.00,'Activa'),(24,'2026-11-07','2026-11-21',12.00,'Activa'),(25,'2026-11-01','2026-11-30',15.00,'Activa'),(26,'2026-10-05','2026-10-20',12.00,'Inactiva'),(27,'2026-10-20','2026-10-31',20.00,'Inactiva'),(28,'2026-11-01','2026-11-14',10.00,'Activa'),(29,'2026-11-08','2026-11-22',15.00,'Activa'),(30,'2026-11-12','2026-11-30',20.00,'Activa');
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `ID_PROVEEDOR` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_PROVEEDOR` varchar(150) NOT NULL,
  `TELEFONO_PROVEEDOR` varchar(20) DEFAULT NULL,
  `ESTADO_PROVEEDOR` varchar(50) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`ID_PROVEEDOR`),
  CONSTRAINT `CK_ESTADO_PROV` CHECK ((`ESTADO_PROVEEDOR` in (_utf8mb4'Activo',_utf8mb4'Inactivo')))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Mabe El Salvador, S.A.','2250-4000','Activo'),(2,'LG Electronics Centroamérica','2231-5000','Activo'),(3,'Samsung Electronics de C.A.','2209-6000','Activo'),(4,'Whirlpool Centroamérica','2275-7000','Activo'),(5,'Cetron El Salvador','2222-8100','Activo'),(6,'Sony Interamericana','2293-1200','Activo'),(7,'Oster de Centroamérica','2246-3300','Activo'),(8,'Black & Decker El Salvador','2281-9000','Activo'),(9,'Panasonic de El Salvador','2260-1100','Activo'),(10,'Bosch El Salvador','2212-4400','Activo'),(11,'Philips Centroamérica','2239-5500','Activo'),(12,'Imaco Comercial','2224-6600','Activo'),(13,'Challenger del Caribe','2278-8800','Activo'),(14,'Frigidaire Latinoamérica','2205-9900','Activo'),(15,'Daikin Air Conditioning','2299-1010','Activo'),(16,'Carrier El Salvador','2233-2020','Activo'),(17,'Midea Central America','2288-3030','Activo'),(18,'TCL Electronics CA','2211-4040','Activo'),(19,'Distribuidora Electrolux','2255-6060','Activo'),(20,'Importadora Osteria','2266-7070','Activo');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `ID_SUCURSAL` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_SUCURSAL` varchar(200) NOT NULL,
  `PRESUPUESTO_SUCURSAL` decimal(15,2) NOT NULL,
  `DIRECCION_SUCURSAL` varchar(200) NOT NULL,
  `TELEFONO_SUCURSAL` varchar(20) DEFAULT NULL,
  `ESTADO_SUCURSAL` varchar(50) NOT NULL DEFAULT 'Activa',
  PRIMARY KEY (`ID_SUCURSAL`),
  CONSTRAINT `CK_ESTADO_SUC` CHECK ((`ESTADO_SUCURSAL` in (_utf8mb4'Activa',_utf8mb4'Inactiva'))),
  CONSTRAINT `CK_PRESUPUESTO_SUC` CHECK ((`PRESUPUESTO_SUCURSAL` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'ElectroHogar - Sucursal San Salvador',150000.00,'Centro Comercial Galerías, Paseo General Escalón, San Salvador','2298-1000','Activa'),(2,'ElectroHogar - Sucursal Santa Ana',90000.00,'Metrocentro Santa Ana, Local 45, Santa Ana','2441-2000','Activa'),(3,'ElectroHogar - Sucursal San Miguel',100000.00,'Plaza Caimito, Carretera Panamericana, San Miguel','2661-3000','Activa');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_USUARIO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_USUARIO` varchar(50) NOT NULL,
  `CLAVE` varchar(255) NOT NULL,
  `ESTADO_USUARIO` varchar(20) NOT NULL DEFAULT 'Activo',
  `INTENTOS_INGRESO` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_USUARIO`),
  UNIQUE KEY `NOMBRE_USUARIO` (`NOMBRE_USUARIO`),
  CONSTRAINT `CK_ESTADO_USER` CHECK ((`ESTADO_USUARIO` in (_utf8mb4'Activo',_utf8mb4'Inactivo',_utf8mb4'Bloqueado'))),
  CONSTRAINT `CK_INTENTOS_USER` CHECK ((`INTENTOS_INGRESO` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'jsanchez','123456','Activo',0),(2,'mhernandez','123456','Activo',0),(3,'lmartinez','123456','Activo',0),(4,'cflores','123456','Activo',0),(5,'aramirez','123456','Activo',0),(6,'kgomez','123456','Activo',0),(7,'dcastillo','123456','Activo',0),(8,'nortiz','123456','Activo',0),(9,'pmendoza','123456','Activo',0),(10,'hsuarez','123456','Activo',0),(11,'jrivas','123456','Activo',0),(12,'cmorales','123456','Activo',0),(13,'esilva','123456','Activo',0),(14,'fgaitan','123456','Activo',0),(15,'vaguilar','123456','Activo',0),(16,'bportillo','123456','Activo',0),(17,'mcoreas','123456','Activo',0),(18,'sorellana','123456','Activo',0),(19,'jmelendez','123456','Activo',0),(20,'aescobar','123456','Activo',0),(21,'rvelasquez','123456','Activo',0),(22,'kquinteros','123456','Activo',0),(23,'eperez','123456','Activo',0),(24,'nramirez','123456','Activo',0),(25,'dromero','123456','Activo',0),(26,'csosa','123456','Activo',0),(27,'mamezquita','123456','Activo',0),(28,'fguevara','123456','Activo',0),(29,'jarevalo','123456','Activo',0),(30,'oadmin','123456','Activo',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `ID_EMPLEADO` int NOT NULL,
  `PORCENTAJE_COMISION` decimal(10,2) NOT NULL,
  `META_MENSUAL` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_EMPLEADO`),
  CONSTRAINT `FK_ES_UN2` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `CK_META_MENSUAL` CHECK ((`META_MENSUAL` >= 0)),
  CONSTRAINT `CK_PORC_COMISION` CHECK (((`PORCENTAJE_COMISION` >= 0) and (`PORCENTAJE_COMISION` <= 100)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (4,3.50,15000.00),(5,4.00,18000.00),(6,3.00,12000.00),(9,3.50,16000.00),(10,4.50,20000.00),(14,3.00,14000.00),(15,4.00,17000.00),(17,3.50,15000.00),(19,3.00,13000.00),(20,4.50,22000.00),(24,3.50,15000.00),(25,4.00,19000.00),(28,3.00,12500.00),(29,4.50,21000.00),(30,3.50,16000.00);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sistema_ventas'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `EVT_ACTUALIZAR_CUOTAS_VENCIDAS` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `EVT_ACTUALIZAR_CUOTAS_VENCIDAS` ON SCHEDULE EVERY 1 DAY STARTS '2026-11-15 07:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    CALL SP_ACTUALIZAR_CUOTAS_VENCIDAS();
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'sistema_ventas'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_CALCULAR_COMISION_VENDEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_CALCULAR_COMISION_VENDEDOR`(
    P_ID_VENDEDOR INT,
    P_FECHA_INICIO DATE,
    P_FECHA_FIN DATE
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE V_PORCENTAJE_COMISION DECIMAL(5,2) DEFAULT 0;
    DECLARE V_TOTAL_VENTAS DECIMAL(10,2) DEFAULT 0;
    DECLARE V_COMISION_TOTAL DECIMAL(10,2) DEFAULT 0;

    SELECT COALESCE(PORCENTAJE_COMISION, 0) INTO V_PORCENTAJE_COMISION
    FROM VENDEDOR
    WHERE ID_EMPLEADO = P_ID_VENDEDOR;

    SELECT COALESCE(SUM(MONTO_TOTAL), 0) INTO V_TOTAL_VENTAS
    FROM FACTURA
    WHERE ESTADO_FACTURA = 'Activa'
      AND ID_EMPLEADO = P_ID_VENDEDOR
      AND FECHA_HORA BETWEEN P_FECHA_INICIO AND P_FECHA_FIN;

    SET V_COMISION_TOTAL = V_TOTAL_VENTAS * (V_PORCENTAJE_COMISION / 100.00);

    RETURN V_COMISION_TOTAL;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_CALCULAR_PRECIO_PROMOCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_CALCULAR_PRECIO_PROMOCION`(
    P_ID_PRODUCTO INT
) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE V_PRECIO_ORIGINAL DECIMAL(10,2);
    DECLARE V_PORCENTAJE_DESCUENTO DECIMAL(5,2) DEFAULT 0.00;
    DECLARE V_PRECIO_FINAL DECIMAL(10,2);

    -- Se obtiene el precio original del producto
    SELECT PRECIO_VENTA
    INTO V_PRECIO_ORIGINAL
    FROM PRODUCTO
    WHERE ID_PRODUCTO = P_ID_PRODUCTO;

    -- Se obtiene el mayor descuento de una promocion vigente
    SELECT COALESCE(MAX(PR.PORCENTAJE_DESCUENTO), 0)
    INTO V_PORCENTAJE_DESCUENTO
    FROM PROMOCION PR
    INNER JOIN PRODUCTOPROMOCION PP
        ON PP.ID_PROMOCION = PR.ID_PROMOCION
    WHERE PP.ID_PRODUCTO = P_ID_PRODUCTO
      AND PR.ESTADO_PROMOCION = 'Activa'
      AND CURDATE() BETWEEN PR.FECHA_INICIO AND PR.FECHA_FIN;

    -- Si el porcentaje es nulo simplmente se devuelve el precio original
    IF V_PORCENTAJE_DESCUENTO IS NULL OR V_PORCENTAJE_DESCUENTO <= 0 THEN
        RETURN V_PRECIO_ORIGINAL;
    END IF;

    SET V_PRECIO_FINAL = V_PRECIO_ORIGINAL - (V_PRECIO_ORIGINAL * V_PORCENTAJE_DESCUENTO / 100.00);

    RETURN ROUND(V_PRECIO_FINAL, 2);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_OBTENER_CUPO_DISPONIBLE_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_OBTENER_CUPO_DISPONIBLE_CLIENTE`(
    P_ID_CLIENTE INT,
    P_ID_SUCURSAL INT
) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
    DECLARE V_LIMITE DECIMAL(10,2) DEFAULT 0.00;
    DECLARE V_DEUDA DECIMAL(10,2) DEFAULT 0.00;
    DECLARE V_ES_NATURAL INT DEFAULT 0;
    DECLARE V_ES_JURIDICO INT DEFAULT 0;

    -- Determina si el cliente está registrado como natural o jurídico.
    SELECT COUNT(*) INTO V_ES_NATURAL
    FROM CLIENTENATURAL
    WHERE ID_CLIENTE = P_ID_CLIENTE;

    SELECT COUNT(*) INTO V_ES_JURIDICO
    FROM CLIENTEJURIDICO
    WHERE ID_CLIENTE = P_ID_CLIENTE;

    -- El clienten natural su limite depende de la sucursal
    IF V_ES_NATURAL = 1 AND V_ES_JURIDICO = 0 THEN

        SELECT COALESCE(MAX(MONTOLIMITE), 0) INTO V_LIMITE
        FROM LIMITECREDITOPERSONAL
        WHERE ID_CLIENTE = P_ID_CLIENTE
          AND ID_SUCURSAL = P_ID_SUCURSAL;

    -- El cliente es juridico se usa el cupo coorporativo
    ELSEIF V_ES_JURIDICO = 1 AND V_ES_NATURAL = 0 THEN

        SELECT COALESCE(MAX(CUPO_CREDITO_CORPORATIVO), 0) INTO V_LIMITE
        FROM CLIENTEJURIDICO
        WHERE ID_CLIENTE = P_ID_CLIENTE;

    -- Si no es ninguno de los tipos de cliente validos, entonces no se le concede ningun cupo
    ELSE
        RETURN 0;
    END IF;

    -- Se suman los saldos de los credito de distintas compras realizadas por un cliente par verificar cual es la deuda
    SELECT COALESCE(SUM(C.SALDO_PENDIENTE), 0) INTO V_DEUDA
    FROM CREDITO AS C

    -- Se utiliza inner join para no tomar registros corruptos, entonces lo ignora automaticamente porque exigen que exista coincidencia en ambas tablas
    INNER JOIN FACTURA AS F ON C.ID_FACTURA = F.ID_FACTURA
    WHERE F.ID_CLIENTE = P_ID_CLIENTE
      AND F.ESTADO_FACTURA = 'Activa'
      AND C.ESTADO_CREDITO NOT IN ('Pagado', 'Cancelado')
      AND (
          (V_ES_NATURAL = 1 AND F.ID_SUCURSAL = P_ID_SUCURSAL)
          OR V_ES_JURIDICO = 1
      );

    -- Se utiliza greatest para que en caso de que de un valor negativo se muestre 0, el cupo nunca debe ser negativo
    RETURN GREATEST(V_LIMITE - V_DEUDA, 0);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTIVAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTIVAR_CLIENTE`(
    IN P_ID_CLIENTE INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF NOT EXISTS (SELECT 1 FROM CLIENTE WHERE ID_CLIENTE = P_ID_CLIENTE) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe';
    END IF;

    IF EXISTS (SELECT 1 FROM CLIENTE WHERE ID_CLIENTE = P_ID_CLIENTE AND ESTADO_CLIENTE = 'Activo') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente ya está activo';
    END IF;

    START TRANSACTION;

    UPDATE CLIENTE
    SET ESTADO_CLIENTE = 'Activo'
    WHERE ID_CLIENTE = P_ID_CLIENTE;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_CAJERO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_CAJERO`(
    IN P_ID_VENDEDOR INTEGER,
    IN P_NUM_CAJA INTEGER,
    IN P_TURNO VARCHAR(30),
    OUT P_CONFIRMACION INTEGER
)
PROCESO: BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET P_CONFIRMACION = -1;
    END;

    IF P_ID_VENDEDOR IS NULL OR P_NUM_CAJA IS NULL OR P_TURNO IS NULL OR TRIM(P_TURNO) = '' THEN
        SET P_CONFIRMACION = -2; 
        LEAVE PROCESO;
    END IF;

    START TRANSACTION;

    UPDATE CAJERO 
    SET 
        NUMERO_CAJA = P_NUM_CAJA,
        TURNO = P_TURNO
    WHERE ID_EMPLEADO = P_ID_VENDEDOR;

    IF ROW_COUNT() = 0 THEN
        IF NOT EXISTS(SELECT 1 FROM CAJERO WHERE ID_EMPLEADO = P_ID_VENDEDOR) THEN
            ROLLBACK;
            SET P_CONFIRMACION = -3; 
            LEAVE PROCESO;
        END IF;
    END IF;

    COMMIT;
    SET P_CONFIRMACION = 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_CLIENTE`(
    IN P_ID_CLIENTE INT,
    IN P_CORREO VARCHAR(100),
    IN P_TELEFONO VARCHAR(20)
)
BEGIN
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
     ROLLBACK;
     RESIGNAL;
   END;

   START TRANSACTION;
      UPDATE CLIENTE
      SET CORREO= COALESCE(NULLIF(P_CORREO, ''), CORREO),
          TELEFONO_CLIENTE = COALESCE(NULLIF(P_TELEFONO, ''), TELEFONO_CLIENTE)
      WHERE ID_CLIENTE= P_ID_CLIENTE;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_CLIENTE_JURIDICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_CLIENTE_JURIDICO`(
    IN P_ID_CLIENTE INT,
    IN P_REPRESENTANTE VARCHAR(100),
    IN P_CUPO_CREDITO DECIMAL(10,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF P_CUPO_CREDITO IS NOT NULL AND P_CUPO_CREDITO < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cupo de crédito no puede ser negativo.';
    END IF;

    START TRANSACTION;
        UPDATE CLIENTEJURIDICO
        SET NOMBRE_REPRESENTANTE_LEGAL = COALESCE(NULLIF(P_REPRESENTANTE, ''), NOMBRE_REPRESENTANTE_LEGAL),
            CUPO_CREDITO_CORPORATIVO = COALESCE(P_CUPO_CREDITO, CUPO_CREDITO_CORPORATIVO)
        WHERE ID_CLIENTE = P_ID_CLIENTE;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_COMPRA_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_COMPRA_PRODUCTO`(
    IN P_ID_PROVEEDOR INT,
    IN P_ID_PRODUCTO INT,
    IN P_FECHA_ENTREGA DATE,
    IN P_PRECIO_PACTADO DECIMAL(10,2)
)
BEGIN
    DECLARE V_EXISTE INT;

    SELECT COUNT(*) INTO V_EXISTE
    FROM COMPRAPRODUCTO
    WHERE ID_PROVEEDOR = P_ID_PROVEEDOR AND ID_PRODUCTO = P_ID_PRODUCTO;

    IF V_EXISTE = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe un registro de compra para este proveedor y producto.';
    ELSEIF P_PRECIO_PACTADO IS NOT NULL AND P_PRECIO_PACTADO <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio pactado de compra debe ser mayor a cero.';
    ELSE
        UPDATE COMPRAPRODUCTO
        SET FECHA_ENTREGA = COALESCE(P_FECHA_ENTREGA, FECHA_ENTREGA),
            PRECIO_PACTADO = COALESCE(P_PRECIO_PACTADO, PRECIO_PACTADO)
        WHERE ID_PROVEEDOR = P_ID_PROVEEDOR
          AND ID_PRODUCTO = P_ID_PRODUCTO;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_CUOTAS_VENCIDAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_CUOTAS_VENCIDAD`()
BEGIN

--  Se actualiza las cuotas pendientes que ya vencieron
UPDATE CUOTA
SET ESTADO_CUOTA='Vencida'
WHERE ESTADO_CUOTA='Pendiente'
AND FECHA_VENCIMIENTO<CURDATE();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_EMPLEADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_EMPLEADO`(
    IN P_ID_VENDEDOR INTEGER,
    IN P_CORREO VARCHAR(150),
    IN P_DIRECCION VARCHAR(200),
    IN P_TELEFONO VARCHAR(12),
    OUT CONFIRMACION INTEGER 
)
PROCESO: BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN 
        ROLLBACK;
        SET CONFIRMACION = -1;
    END;

    START TRANSACTION;
    
    UPDATE EMPLEADO 
    SET 
        DIRECCION_EMPLEADO = IF(P_DIRECCION IS NOT NULL AND TRIM(P_DIRECCION) 
                             != '', P_DIRECCION, DIRECCION_EMPLEADO),
        CORREO_ELECTRONICO = IF(P_CORREO IS NOT NULL AND TRIM(P_CORREO) 
                             != '', P_CORREO, CORREO_ELECTRONICO),
        TELEFONO_EMPLEADO  = IF(P_TELEFONO IS NOT NULL AND TRIM(P_TELEFONO) 
                             != '', P_TELEFONO, TELEFONO_EMPLEADO)
    WHERE ID_EMPLEADO = P_ID_VENDEDOR;

    IF ROW_COUNT() = 0 THEN

        IF NOT EXISTS(SELECT 1 FROM EMPLEADO 
                      WHERE ID_EMPLEADO = P_ID_VENDEDOR) THEN
            ROLLBACK;
            SET CONFIRMACION = -3;
            LEAVE PROCESO;
        END IF;
    END IF;

    COMMIT;
    SET CONFIRMACION = 1; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_INVENTARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_INVENTARIO`(
    IN P_ID_PRODUCTO INT,
    IN P_ID_SUCURSAL INT,
    IN P_CANTIDAD INT,
    IN P_TIPO_MOVIMIENTO VARCHAR(20)
)
BEGIN
    DECLARE V_STOCK_ACTUAL INT DEFAULT 0;

    -- Se valida que la cantidad sea mayor que cero
    IF P_CANTIDAD IS NULL OR P_CANTIDAD <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad debe ser mayor que cero.';
    END IF;

    -- Se valida el tipo de movimiento
    IF P_TIPO_MOVIMIENTO IS NULL OR P_TIPO_MOVIMIENTO NOT IN ('Entrada', 'Salida') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El movimiento debe ser Entrada o Salida.';
    END IF;

    -- Se verifica que el producto exista
    IF NOT EXISTS (SELECT 1 FROM PRODUCTO WHERE ID_PRODUCTO = P_ID_PRODUCTO) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto indicado no existe.';
    END IF;

    -- Se verifica que la sucursal exista
    IF NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL = P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La sucursal indicada no existe.';
    END IF;

    -- Se comprueba que el producto tenga inventario en esa sucursal
    IF NOT EXISTS (SELECT 1 FROM INVENTARIO WHERE ID_PRODUCTO = P_ID_PRODUCTO AND ID_SUCURSAL = P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no tiene inventario registrado en esta sucursal.';
    END IF;

    -- Se obtiene y bloquea el stock actual
    SELECT STOCK 
    INTO V_STOCK_ACTUAL 
    FROM INVENTARIO 
    WHERE ID_PRODUCTO = P_ID_PRODUCTO 
    AND ID_SUCURSAL = P_ID_SUCURSAL 
    FOR UPDATE;

    -- Se aumenta el stock cuando ingresan productos
    IF P_TIPO_MOVIMIENTO = 'Entrada' THEN

        UPDATE INVENTARIO SET STOCK = STOCK + P_CANTIDAD WHERE ID_PRODUCTO = P_ID_PRODUCTO AND ID_SUCURSAL = P_ID_SUCURSAL;

    -- Se disminuye el stock cuando salen productos
    ELSEIF P_TIPO_MOVIMIENTO = 'Salida' THEN

        -- Se verifica que existan suficientes unidades
        IF V_STOCK_ACTUAL < P_CANTIDAD THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficientes existencias para realizar la salida.';
        END IF;

        UPDATE INVENTARIO SET STOCK = STOCK - P_CANTIDAD WHERE ID_PRODUCTO = P_ID_PRODUCTO AND ID_SUCURSAL = P_ID_SUCURSAL;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_LIMITE_CREDITO_PERSONAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_LIMITE_CREDITO_PERSONAL`(
    IN P_ID_CLIENTE INTEGER,
    IN P_ID_SUCURSAL INTEGER, 
    IN P_NUEVO_MONTO DECIMAL(10,2),
    OUT CONFIRMACION INTEGER
)
PROCESO: BEGIN 

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        ROLLBACK;
        SET CONFIRMACION = -1;
    END;


    IF P_NUEVO_MONTO IS NULL OR P_NUEVO_MONTO <= 0.0 THEN
        SET CONFIRMACION = -2; 
        LEAVE PROCESO;
    END IF;

    START TRANSACTION;

    UPDATE LIMITECREDITOPERSONAL
    SET MONTOLIMITE = P_NUEVO_MONTO
    WHERE ID_CLIENTE = P_ID_CLIENTE 
      AND ID_SUCURSAL = P_ID_SUCURSAL;

    IF ROW_COUNT() = 0 THEN
      
        IF NOT EXISTS(SELECT 1 
                        FROM LIMITECREDITOPERSONAL 
                        WHERE ID_CLIENTE = P_ID_CLIENTE 
                        AND ID_SUCURSAL = P_ID_SUCURSAL) 
        THEN

            ROLLBACK;
            SET CONFIRMACION = -3; 
            LEAVE PROCESO;
        END IF;
    END IF;

    COMMIT;
    SET CONFIRMACION = 1; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_PRECIO_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_PRECIO_PRODUCTO`(
    IN P_ID_PRODUCTO INT,
    IN P_ID_EMPLEADO INT,
    IN P_NUEVO_PRECIO DECIMAL(10,2)
)
BEGIN
  DECLARE PRECIO_ANTERIOR DECIMAL(10,2);
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  -- Se valida que se ingrese un precio correcto
  IF P_NUEVO_PRECIO IS NULL OR P_NUEVO_PRECIO<=0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El precio debe ser mayor que cero.';
  END IF;

  -- se valida que exista el empleado que realiza el cambio
  IF NOT EXISTS (SELECT 1 FROM EMPLEADO WHERE ID_EMPLEADO=P_ID_EMPLEADO) THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El empleado no existe.';
  END IF;

  -- Se valida que el empleado sea Supervisor y tenga su usuario activo
  IF NOT EXISTS (
      SELECT 1
      FROM EMPLEADO E
      INNER JOIN USUARIO U ON E.ID_USUARIO = U.ID_USUARIO
      WHERE E.ID_EMPLEADO = P_ID_EMPLEADO
        AND E.TIPO_EMPLEADO = 'Supervisor'
        AND U.ESTADO_USUARIO = 'Activo'
  ) THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Acceso denegado. El empleado no es un Supervisor activo.';
  END IF;

-- Se valida que el producto exista
  IF NOT EXISTS (SELECT 1 FROM PRODUCTO WHERE ID_PRODUCTO=P_ID_PRODUCTO) THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El producto no existe.';
  END IF;

  START TRANSACTION;
-- Se hace lectura para traer el precio anterior, bloqueando el registro
  SELECT PRECIO_VENTA
   INTO PRECIO_ANTERIOR
   FROM PRODUCTO
  WHERE ID_PRODUCTO=P_ID_PRODUCTO
  FOR UPDATE;

 -- Se actualiza el preio del producto y se añade el registro a la bitacora

  UPDATE PRODUCTO
  SET PRECIO_VENTA= P_NUEVO_PRECIO
  WHERE ID_PRODUCTO= P_ID_PRODUCTO;

  INSERT INTO BITACORAPRODUCTO (ID_PRODUCTO, ID_EMPLEADO, PRECIO_ANTERIOR,PRECIO_ACTUAL, FECHA_CAMBIO)
  VALUES(P_ID_PRODUCTO, P_ID_EMPLEADO, PRECIO_ANTERIOR, P_NUEVO_PRECIO, NOW() );

  COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_PROMOCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_PROMOCION`(
    IN P_ID_PROMOCION INT,
    IN P_FECHA_INICIO DATE,
    IN P_FECHA_FIN DATE,
    IN P_PORCENTAJE_DESCUENTO DECIMAL(5,2)
)
BEGIN
    DECLARE V_EXISTE INT;

    SELECT COUNT(*) INTO V_EXISTE
    FROM PROMOCION
    WHERE ID_PROMOCION = P_ID_PROMOCION;

    IF V_EXISTE = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: La promoción especificada no existe en el sistema.';
    ELSE
        UPDATE PROMOCION
        SET FECHA_INICIO = COALESCE(P_FECHA_INICIO, FECHA_INICIO),
            FECHA_FIN = COALESCE(P_FECHA_FIN, FECHA_FIN),
            PORCENTAJE_DESCUENTO = COALESCE(P_PORCENTAJE_DESCUENTO, PORCENTAJE_DESCUENTO)
        WHERE ID_PROMOCION = P_ID_PROMOCION;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_PROVEEDOR_TELEFONO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_PROVEEDOR_TELEFONO`(in P_ID_PROVEEDOR INT, in P_TELEFONO_PROVEEDOR varchar(20))
begin
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
 update PROVEEDOR set 
 TELEFONO_PROVEEDOR = P_TELEFONO_PROVEEDOR
 where ID_PROVEEDOR = P_ID_PROVEEDOR;
commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_STOCK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_STOCK`(
    IN P_ID_PRODUCTO INT,
    IN P_ID_SUCURSAL INT,
    IN P_STOCK INT
)
BEGIN
    -- Verificar que la cantidad no sea negativa
    IF P_STOCK <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El stock no puede ser negativo o menor a cero';
    END IF;

    -- Actualizar el inventario de la sucursal
    UPDATE INVENTARIO
    SET STOCK = P_STOCK
    WHERE ID_PRODUCTO = P_ID_PRODUCTO
      AND ID_SUCURSAL = P_ID_SUCURSAL;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_SUCURSAL_DIRECCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_SUCURSAL_DIRECCION`(
 IN P_ID_SUCURSAL INT,
 IN P_DIRECCION_SUCURSAL VARCHAR(200))
BEGIN
         DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
 UPDATE SUCURSAL
 SET
   DIRECCION_SUCURSAL=P_DIRECCION_SUCURSAL
 WHERE ID_SUCURSAL=P_ID_SUCURSAL ;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_SUCURSAL_NOMBRE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_SUCURSAL_NOMBRE`(
 IN P_ID_SUCURSAL INT,
 IN P_NOMBRE_SUCURSAL VARCHAR(200)
  )
BEGIN
     DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
 UPDATE SUCURSAL SET
 NOMBRE_SUCURSAL=P_NOMBRE_SUCURSAL
 WHERE ID_SUCURSAL=P_ID_SUCURSAL;
COMMIT;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_SUCURSAL_PRESUPUESTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_SUCURSAL_PRESUPUESTO`(
 IN P_ID_SUCURSAL INT,
 IN P_PRESUPUESTO_SUCURSAL DECIMAL(15,2))
BEGIN
         DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
 UPDATE SUCURSAL
 SET
   PRESUPUESTO_SUCURSAL=P_PRESUPUESTO_SUCURSAL
 WHERE ID_SUCURSAL=P_ID_SUCURSAL ;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_SUCURSAL_TELEFONO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_SUCURSAL_TELEFONO`(
 IN P_ID_SUCURSAL INT,
 IN P_TELEFONO_SUCURSAL VARCHAR(20))
BEGIN
         DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
 UPDATE SUCURSAL
 SET
   TELEFONO_SUCURSAL=P_TELEFONO_SUCURSAL
 WHERE ID_SUCURSAL=P_ID_SUCURSAL ;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_VENDEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_VENDEDOR`(
    IN P_ID_VENDEDOR INTEGER,    
    IN P_PORCENTAJE DECIMAL(10,2),
    IN P_META DECIMAL(10,2),
    OUT P_CONFIRMACION INTEGER
)
PROCESO: BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET P_CONFIRMACION = -1;
    END;

    IF P_ID_VENDEDOR IS NULL OR P_ID_VENDEDOR <= 0 
       OR P_PORCENTAJE IS NULL OR P_PORCENTAJE < 0.0 
       OR P_META IS NULL OR P_META < 0.0 THEN
        SET P_CONFIRMACION = -2; 
        LEAVE PROCESO;
    END IF;

    START TRANSACTION;

    UPDATE VENDEDOR 
    SET 
        PORCENTAJE_COMISION = P_PORCENTAJE,
        META_MENSUAL = P_META
    WHERE ID_EMPLEADO = P_ID_VENDEDOR;

    IF ROW_COUNT() = 0 THEN
        IF NOT EXISTS(SELECT 1 FROM VENDEDOR WHERE ID_EMPLEADO = P_ID_VENDEDOR) THEN
            ROLLBACK;
            SET P_CONFIRMACION = -3;
            LEAVE PROCESO;
        END IF;
    END IF;

    COMMIT;
    SET P_CONFIRMACION = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_AGREGAR_DETALLE_FACTURA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AGREGAR_DETALLE_FACTURA`(
    IN P_ID_FACTURA INT,
    IN P_ID_PRODUCTO INT,
    IN P_CANTIDAD INT
)
BEGIN
    DECLARE V_ID_SUCURSAL INT DEFAULT NULL;
    DECLARE V_STOCK INT;
    DECLARE V_PRECIO DECIMAL(10,2);
    DECLARE V_SUBTOTAL DECIMAL(10,2);
    DECLARE V_CORRELATIVO INT;

    -- Se valida que el producto exista y esté activo
    IF NOT EXISTS (
        SELECT 1
        FROM PRODUCTO
        WHERE ID_PRODUCTO = P_ID_PRODUCTO
          AND ESTADO_PRODUCTO = 'Activo'
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no existe o esta inactivo.';
    END IF;

    -- Se valida la cantidad solicitada
    IF P_CANTIDAD IS NULL OR P_CANTIDAD <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cantidad debe ser mayor que cero.';
    END IF;

    -- Se bloquea la factura para controlar el correlativo
    SELECT ID_SUCURSAL INTO V_ID_SUCURSAL
    FROM FACTURA
    WHERE ID_FACTURA = P_ID_FACTURA
      AND ESTADO_FACTURA = 'Activa'
    FOR UPDATE;

    -- Se verifica que la factura exista y esté activa
    IF V_ID_SUCURSAL IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura no existe o esta anulada.';
    END IF;

    -- Se verifica que el producto esté en el inventario
    IF NOT EXISTS (
        SELECT 1
        FROM INVENTARIO
        WHERE ID_PRODUCTO = P_ID_PRODUCTO
          AND ID_SUCURSAL = V_ID_SUCURSAL
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no esta registrado en esta sucursal.';
    END IF;

    -- Se consulta y bloquea el stock disponible
    SELECT STOCK INTO V_STOCK
    FROM INVENTARIO
    WHERE ID_PRODUCTO = P_ID_PRODUCTO
      AND ID_SUCURSAL = V_ID_SUCURSAL
    FOR UPDATE;

    -- Se valida que haya existencias suficientes
    IF V_STOCK < P_CANTIDAD THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay existencias suficientes para realizar la venta.';
    END IF;

    -- Se obtiene el precio final del producto con su promocion
    SET V_PRECIO = FN_CALCULAR_PRECIO_PROMOCION(P_ID_PRODUCTO);

    -- Se calcula el subtotal
    SET V_SUBTOTAL = V_PRECIO * P_CANTIDAD;

    -- Se obtiene el siguiente correlativo de la factura
    SELECT COALESCE(MAX(NUMERO_CORRELATIVO), 0) + 1 INTO V_CORRELATIVO
    FROM DETALLEFACTURA
    WHERE ID_FACTURA = P_ID_FACTURA;

    -- Se registra el detalle de la factura
    INSERT INTO DETALLEFACTURA (ID_FACTURA, NUMERO_CORRELATIVO, ID_PRODUCTO, CANTIDAD_DE_DETALLE, PRECIO_UNITARIO, SUBTOTAL)
    VALUES (P_ID_FACTURA, V_CORRELATIVO, P_ID_PRODUCTO, P_CANTIDAD, V_PRECIO, V_SUBTOTAL);

    -- Se descuentan las existencias del inventario
    CALL SP_ACTUALIZAR_INVENTARIO(P_ID_PRODUCTO, V_ID_SUCURSAL, P_CANTIDAD, 'Salida');

    -- Se actualiza el monto total de la factura
    UPDATE FACTURA SET MONTO_TOTAL = MONTO_TOTAL + V_SUBTOTAL WHERE ID_FACTURA = P_ID_FACTURA;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ANULAR_FACTURA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ANULAR_FACTURA`(
    IN P_ID_FACTURA INT,
    IN P_ID_EMPLEADO INT,
    IN P_MOTIVO_CANCELACION VARCHAR(500)
)
BEGIN
    DECLARE V_ESTADO_FACTURA VARCHAR(50) DEFAULT NULL;
    DECLARE V_ID_CREDITO INT DEFAULT NULL;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Se verifica que el motivo de cancelación no esté vacío
    IF P_MOTIVO_CANCELACION IS NULL OR TRIM(P_MOTIVO_CANCELACION) = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe indicar el motivo de cancelacion.';
    END IF;

    -- Se comprueba que el empleado exista y se encuentre activo
    IF NOT EXISTS (SELECT 1 FROM EMPLEADO E JOIN USUARIO U ON E.ID_USUARIO = U.ID_USUARIO WHERE E.ID_EMPLEADO = P_ID_EMPLEADO AND U.ESTADO_USUARIO = 'Activo') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El empleado responsable no existe o no se encuentra activo.';
    END IF;

    START TRANSACTION;

    -- Se verifica que la factura exista
    IF NOT EXISTS (SELECT 1 FROM FACTURA WHERE ID_FACTURA = P_ID_FACTURA) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura indicada no existe en el sistema.';
    END IF;

    -- Se bloquea la factura para evitar anulaciones simultáneas
    SELECT ESTADO_FACTURA
    INTO V_ESTADO_FACTURA
    FROM FACTURA
    WHERE ID_FACTURA = P_ID_FACTURA
    FOR UPDATE;

    -- Se comprueba que la factura no esté anulada
    IF V_ESTADO_FACTURA = 'Anulada' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura ya se encuentra anulada previamente.';
    END IF;

    -- Se obtiene el crédito asociado a la factura, si existe
    SELECT ID_CREDITO
    INTO V_ID_CREDITO
    FROM CREDITO
    WHERE ID_FACTURA = P_ID_FACTURA
    LIMIT 1;

    -- Si tiene crédito, se comprueba que no existan cuotas pagadas
    IF V_ID_CREDITO IS NOT NULL THEN

        IF EXISTS (SELECT 1 FROM CUOTA WHERE ID_CREDITO = V_ID_CREDITO AND (ESTADO_CUOTA = 'Pagada' OR MONTO_ABONADO > 0)) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede anular una factura con cuotas abonadas o pagadas.';
        END IF;

    END IF;

    -- Se anula la factura
    -- El trigger devuelve automáticamente los productos al inventario
    UPDATE FACTURA
    SET ESTADO_FACTURA = 'Anulada'
    WHERE ID_FACTURA = P_ID_FACTURA;

    -- Se registra el motivo de cancelación en la bitácora
    INSERT INTO BITACORAFACTURACANCELADA (ID_FACTURA, ID_EMPLEADO, MOTIVO_DE_CANCELACION)
    VALUES (P_ID_FACTURA, P_ID_EMPLEADO, P_MOTIVO_CANCELACION);

    -- Si la factura tiene crédito, se cancela
    IF V_ID_CREDITO IS NOT NULL THEN

        UPDATE CREDITO
        SET ESTADO_CREDITO = 'Cancelado',
            SALDO_PENDIENTE = 0.00
        WHERE ID_CREDITO = V_ID_CREDITO;

        -- Se cancelan las cuotas pendientes
        UPDATE CUOTA
        SET ESTADO_CUOTA = 'Cancelada'
        WHERE ID_CREDITO = V_ID_CREDITO
          AND ESTADO_CUOTA <> 'Pagada';

    END IF;

    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ASIGNAR_PRODUCTO_PROMOCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ASIGNAR_PRODUCTO_PROMOCION`(
    IN P_ID_PROMOCION INT,
    IN P_ID_PRODUCTO INT
)
BEGIN
    -- Se valida que la promocion exista
    IF NOT EXISTS (SELECT 1 FROM PROMOCION WHERE ID_PROMOCION = P_ID_PROMOCION) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La promocion no existe en el sistema.';
    END IF;

    -- Se valida que el producto exista y este activo
    IF NOT EXISTS (SELECT 1 FROM PRODUCTO WHERE ID_PRODUCTO = P_ID_PRODUCTO AND ESTADO_PRODUCTO = 'Activo') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no existe o se encuentra inactivo.';
    END IF;

    INSERT INTO PRODUCTOPROMOCION (ID_PROMOCION, ID_PRODUCTO)
    VALUES (P_ID_PROMOCION, P_ID_PRODUCTO);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_BITACORA_FACTURA_ANULADA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_BITACORA_FACTURA_ANULADA`(
    IN P_ID_SUCURSAL INT,
    IN P_BUSQUEDA VARCHAR(150),
    IN P_FECHA_DESDE DATETIME,
    IN P_FECHA_HASTA DATETIME
)
BEGIN
    DECLARE V_FILTRO VARCHAR(255);

    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN

        SELECT B.ID_BITACORA_FACTURA, B.ID_FACTURA, B.ID_EMPLEADO, B.FECHA_CREACION, B.MOTIVO_DE_CANCELACION
        FROM BITACORAFACTURACANCELADA B
        INNER JOIN FACTURA F ON B.ID_FACTURA = F.ID_FACTURA
        WHERE (P_ID_SUCURSAL IS NULL OR F.ID_SUCURSAL = P_ID_SUCURSAL)
          AND (P_FECHA_DESDE IS NULL OR B.FECHA_CREACION >= P_FECHA_DESDE)
          AND (P_FECHA_HASTA IS NULL OR B.FECHA_CREACION <= P_FECHA_HASTA)
        ORDER BY B.FECHA_CREACION DESC;

    ELSE

        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT B.ID_BITACORA_FACTURA, B.ID_FACTURA, B.ID_EMPLEADO, B.FECHA_CREACION, B.MOTIVO_DE_CANCELACION
        FROM BITACORAFACTURACANCELADA B
        INNER JOIN FACTURA F ON B.ID_FACTURA = F.ID_FACTURA
        WHERE (P_ID_SUCURSAL IS NULL OR F.ID_SUCURSAL = P_ID_SUCURSAL)
          AND (
              CAST(B.ID_BITACORA_FACTURA AS CHAR) LIKE V_FILTRO
              OR CAST(B.ID_FACTURA AS CHAR) LIKE V_FILTRO
              OR CAST(B.ID_EMPLEADO AS CHAR) LIKE V_FILTRO
              OR B.MOTIVO_DE_CANCELACION LIKE V_FILTRO
          )
          AND (P_FECHA_DESDE IS NULL OR B.FECHA_CREACION >= P_FECHA_DESDE)
          AND (P_FECHA_HASTA IS NULL OR B.FECHA_CREACION <= P_FECHA_HASTA)
        ORDER BY B.FECHA_CREACION DESC;

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_CAJEROS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_CAJEROS`(
    IN P_ID_SUCURSAL INT,
    IN BUSQUEDA VARCHAR(200)
)
BEGIN
    DECLARE FILTRO VARCHAR(202);
    
    SET BUSQUEDA = TRIM(BUSQUEDA);
    IF BUSQUEDA = '' THEN
        SET BUSQUEDA = NULL;
    END IF;
    
    IF BUSQUEDA IS NOT NULL THEN
        SET FILTRO = CONCAT('%', BUSQUEDA, '%');
    END IF;

    SELECT 
        C.ID_EMPLEADO, 
        E.NOMBRE_EMPLEADO, 
        U.NOMBRE_USUARIO, 
        E.CORREO_ELECTRONICO, 
        E.DUI_EMPLEADO, 
        E.FECHA_CONTRATACION, 
        C.NUMERO_CAJA,      
        C.TURNO,
        U.ESTADO_USUARIO
    FROM 
        CAJERO C 
    INNER JOIN 
        EMPLEADO E ON E.ID_EMPLEADO = C.ID_EMPLEADO 
    INNER JOIN 
        USUARIO U ON U.ID_USUARIO = E.ID_USUARIO
    WHERE 
        E.ID_SUCURSAL = P_ID_SUCURSAL
        AND (
            BUSQUEDA IS NULL 
            OR E.NOMBRE_EMPLEADO LIKE FILTRO
            OR E.CORREO_ELECTRONICO LIKE FILTRO
            OR U.NOMBRE_USUARIO LIKE FILTRO
            OR E.DUI_EMPLEADO LIKE FILTRO
            OR C.TURNO LIKE FILTRO
            OR U.ESTADO_USUARIO LIKE FILTRO
            OR CAST(E.ID_EMPLEADO AS CHAR) LIKE FILTRO
            OR CAST(E.FECHA_CONTRATACION AS CHAR) LIKE FILTRO
            OR CAST(C.NUMERO_CAJA AS CHAR) LIKE FILTRO
        );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_CATEGORIAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_CATEGORIAS`(
    IN BUSQUEDA VARCHAR(200)
)
BEGIN
    DECLARE filtro VARCHAR(202);
    
    IF BUSQUEDA IS NULL OR TRIM(BUSQUEDA) = '' THEN
        SELECT * FROM CATEGORIA
        WHERE ESTADO_CATEGORIA = 'Activo';
    ELSE
        SET filtro = CONCAT('%', TRIM(BUSQUEDA), '%');

        SELECT ID_CATEGORIA, NOMBRE_CATEGORIA FROM CATEGORIA
        WHERE CAST(ID_CATEGORIA AS CHAR) LIKE filtro
           OR NOMBRE_CATEGORIA LIKE filtro
           AND ESTADO_CATEGORIA = 'Activo';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_CATEGORIAS_INACTIVAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_CATEGORIAS_INACTIVAS`()
BEGIN

    -- Se consultan las categorias inactivas
    SELECT ID_CATEGORIA, NOMBRE_CATEGORIA, ESTADO_CATEGORIA
    FROM CATEGORIA
    WHERE ESTADO_CATEGORIA = 'Inactiva'
    ORDER BY ID_CATEGORIA DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_CLIENTE_JURIDICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_CLIENTE_JURIDICO`(
    IN P_BUSQUEDA VARCHAR(150)
)
BEGIN
    DECLARE V_FILTRO VARCHAR(152);

    -- Si el campo de búsqueda está vacío, devuelve el listado completo de jurídicos
    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN
        SELECT C.ID_CLIENTE, CJ.RAZON_SOCIAL, CJ.NIT, C.CORREO,
               C.TELEFONO_CLIENTE, CJ.NOMBRE_REPRESENTANTE_LEGAL, CJ.CUPO_CREDITO_CORPORATIVO, 
               C.ESTADO_CLIENTE, 'JURIDICO' AS TIPO
        FROM CLIENTE C 
        JOIN CLIENTEJURIDICO CJ ON C.ID_CLIENTE = CJ.ID_CLIENTE;
    ELSE
        -- Se construye filtro en los 3 campos clave
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT C.ID_CLIENTE, CJ.RAZON_SOCIAL, CJ.NIT, C.CORREO,
               C.TELEFONO_CLIENTE, CJ.NOMBRE_REPRESENTANTE_LEGAL, CJ.CUPO_CREDITO_CORPORATIVO, 
               C.ESTADO_CLIENTE, 'JURIDICO' AS TIPO
        FROM CLIENTE C 
        JOIN CLIENTEJURIDICO CJ ON C.ID_CLIENTE = CJ.ID_CLIENTE
        WHERE CAST(C.ID_CLIENTE AS CHAR) LIKE V_FILTRO
           OR CJ.RAZON_SOCIAL LIKE V_FILTRO
           OR CJ.NIT LIKE V_FILTRO
           OR CJ.NOMBRE_REPRESENTANTE_LEGAL LIKE V_FILTRO;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_CLIENTE_NATURAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_CLIENTE_NATURAL`(
    IN P_BUSQUEDA VARCHAR(150)
)
BEGIN
    DECLARE V_FILTRO VARCHAR(152);

    -- Si no escriben nada, devuelve todos los activos (o el listado general)
    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN
        SELECT C.ID_CLIENTE, CN.NOMBRE_CLIENTE, CN.DUI_CLIENTE, C.CORREO,
               C.TELEFONO_CLIENTE, C.ESTADO_CLIENTE, 'NATURAL' AS TIPO
        FROM CLIENTE C
        JOIN CLIENTENATURAL CN ON C.ID_CLIENTE = CN.ID_CLIENTE;
    ELSE
        -- Si escriben algo, busca de forma dinámica por ID, Nombre o DUI en un solo campo
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT C.ID_CLIENTE, CN.NOMBRE_CLIENTE, CN.DUI_CLIENTE, C.CORREO,
               C.TELEFONO_CLIENTE, C.ESTADO_CLIENTE, 'NATURAL' AS TIPO
        FROM CLIENTE C
        JOIN CLIENTENATURAL CN ON C.ID_CLIENTE = CN.ID_CLIENTE
        WHERE CAST(C.ID_CLIENTE AS CHAR) LIKE V_FILTRO
           OR CN.NOMBRE_CLIENTE LIKE V_FILTRO
           OR CN.DUI_CLIENTE LIKE V_FILTRO;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_COMPRA_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_COMPRA_PRODUCTO`(
    IN P_BUSQUEDA VARCHAR(150)
)
BEGIN
    DECLARE V_FILTRO VARCHAR(152);

    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN
        SELECT CP.ID_PROVEEDOR, PR.NOMBRE_PROVEEDOR, CP.ID_PRODUCTO, PD.NOMBRE_PRODUCTO, CP.FECHA_ENTREGA, CP.PRECIO_PACTADO
        FROM COMPRAPRODUCTO CP
        JOIN PROVEEDOR PR ON PR.ID_PROVEEDOR = CP.ID_PROVEEDOR
        JOIN PRODUCTO PD ON PD.ID_PRODUCTO = CP.ID_PRODUCTO
        ORDER BY CP.FECHA_ENTREGA DESC;
    ELSE
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT CP.ID_PROVEEDOR, PR.NOMBRE_PROVEEDOR, CP.ID_PRODUCTO, PD.NOMBRE_PRODUCTO, CP.FECHA_ENTREGA, CP.PRECIO_PACTADO
        FROM COMPRAPRODUCTO CP
        JOIN PROVEEDOR PR ON PR.ID_PROVEEDOR = CP.ID_PROVEEDOR
        JOIN PRODUCTO PD ON PD.ID_PRODUCTO = CP.ID_PRODUCTO
        WHERE (CAST(CP.ID_PRODUCTO AS CHAR) LIKE V_FILTRO
            OR CAST(CP.ID_PROVEEDOR AS CHAR) LIKE V_FILTRO
            OR PD.NOMBRE_PRODUCTO LIKE V_FILTRO
            OR PR.NOMBRE_PROVEEDOR LIKE V_FILTRO)
        ORDER BY CP.FECHA_ENTREGA DESC;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_CREDITOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_CREDITOS`(
    IN P_ID_SUCURSAL INT,
    IN P_BUSQUEDA VARCHAR(50),
    IN P_ESTADO VARCHAR(30)
)
BEGIN
    DECLARE V_FILTRO VARCHAR(52);

    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN

        SELECT C.ID_CREDITO, F.ID_CLIENTE, COALESCE(CN.NOMBRE_CLIENTE, CJ.RAZON_SOCIAL) AS NOMBRE_CLIENTE, C.ID_FACTURA, F.NUMERO_FACTURA, F.MONTO_TOTAL AS TOTAL_FACTURA, C.MONTO_FINANCIADO, C.SALDO_PENDIENTE, C.ESTADO_CREDITO, C.FECHA_OTORGACION
        FROM CREDITO C
        JOIN FACTURA F ON C.ID_FACTURA = F.ID_FACTURA
        LEFT JOIN CLIENTENATURAL CN ON CN.ID_CLIENTE = F.ID_CLIENTE
        LEFT JOIN CLIENTEJURIDICO CJ ON CJ.ID_CLIENTE = F.ID_CLIENTE
        WHERE F.ID_SUCURSAL = P_ID_SUCURSAL
          AND (NULLIF(TRIM(P_ESTADO), '') IS NULL OR C.ESTADO_CREDITO = TRIM(P_ESTADO))
        ORDER BY C.FECHA_OTORGACION DESC, C.ID_CREDITO DESC;

    ELSE
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT C.ID_CREDITO, F.ID_CLIENTE, COALESCE(CN.NOMBRE_CLIENTE, CJ.RAZON_SOCIAL) AS NOMBRE_CLIENTE, C.ID_FACTURA, F.NUMERO_FACTURA, F.MONTO_TOTAL AS TOTAL_FACTURA, C.MONTO_FINANCIADO, C.SALDO_PENDIENTE, C.ESTADO_CREDITO, C.FECHA_OTORGACION
        FROM CREDITO C
        JOIN FACTURA F ON C.ID_FACTURA = F.ID_FACTURA
        LEFT JOIN CLIENTENATURAL CN ON CN.ID_CLIENTE = F.ID_CLIENTE
        LEFT JOIN CLIENTEJURIDICO CJ ON CJ.ID_CLIENTE = F.ID_CLIENTE
        WHERE F.ID_SUCURSAL = P_ID_SUCURSAL
          AND (
              CAST(F.ID_CLIENTE AS CHAR) LIKE V_FILTRO
              OR CN.NOMBRE_CLIENTE LIKE V_FILTRO
              OR CJ.RAZON_SOCIAL LIKE V_FILTRO
              OR CAST(C.ID_FACTURA AS CHAR) LIKE V_FILTRO
              OR CAST(C.ID_CREDITO AS CHAR) LIKE V_FILTRO
              OR F.NUMERO_FACTURA LIKE V_FILTRO
          )
          AND (NULLIF(TRIM(P_ESTADO), '') IS NULL OR C.ESTADO_CREDITO = TRIM(P_ESTADO))
        ORDER BY C.FECHA_OTORGACION DESC, C.ID_CREDITO DESC;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_CUOTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_CUOTAS`(
    IN P_ID_SUCURSAL INT,
    IN P_BUSQUEDA VARCHAR(50),
    IN P_ESTADO VARCHAR(30)
)
BEGIN
    DECLARE V_FILTRO VARCHAR(52);

    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN

        SELECT C.ID_CREDITO, F.ID_CLIENTE, COALESCE(CN.NOMBRE_CLIENTE, CJ.RAZON_SOCIAL) AS NOMBRE_CLIENTE, F.NUMERO_FACTURA, C.NUMERO_CUOTA, C.FECHA_VENCIMIENTO, C.FECHA_PAGO, C.MONTO_ABONADO, C.MONTO_ESPERADO, C.ESTADO_CUOTA
        FROM CUOTA C
        JOIN CREDITO CR ON C.ID_CREDITO = CR.ID_CREDITO
        JOIN FACTURA F ON CR.ID_FACTURA = F.ID_FACTURA
        LEFT JOIN CLIENTENATURAL CN ON CN.ID_CLIENTE = F.ID_CLIENTE
        LEFT JOIN CLIENTEJURIDICO CJ ON CJ.ID_CLIENTE = F.ID_CLIENTE
        WHERE F.ID_SUCURSAL = P_ID_SUCURSAL
          AND (NULLIF(TRIM(P_ESTADO), '') IS NULL OR C.ESTADO_CUOTA = TRIM(P_ESTADO))
        ORDER BY C.ID_CREDITO ASC, C.NUMERO_CUOTA ASC;

    ELSE
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT C.ID_CREDITO, F.ID_CLIENTE, COALESCE(CN.NOMBRE_CLIENTE, CJ.RAZON_SOCIAL) AS NOMBRE_CLIENTE, F.NUMERO_FACTURA, C.NUMERO_CUOTA, C.FECHA_VENCIMIENTO, C.FECHA_PAGO, C.MONTO_ABONADO, C.MONTO_ESPERADO, C.ESTADO_CUOTA
        FROM CUOTA C
        JOIN CREDITO CR ON C.ID_CREDITO = CR.ID_CREDITO
        JOIN FACTURA F ON CR.ID_FACTURA = F.ID_FACTURA
        LEFT JOIN CLIENTENATURAL CN ON CN.ID_CLIENTE = F.ID_CLIENTE
        LEFT JOIN CLIENTEJURIDICO CJ ON CJ.ID_CLIENTE = F.ID_CLIENTE
        WHERE F.ID_SUCURSAL = P_ID_SUCURSAL
          AND (
              CAST(F.ID_CLIENTE AS CHAR) LIKE V_FILTRO
              OR CN.NOMBRE_CLIENTE LIKE V_FILTRO
              OR CJ.RAZON_SOCIAL LIKE V_FILTRO
              OR CAST(C.ID_CREDITO AS CHAR) LIKE V_FILTRO
              OR CAST(CR.ID_FACTURA AS CHAR) LIKE V_FILTRO
              OR F.NUMERO_FACTURA LIKE V_FILTRO
              OR CAST(C.NUMERO_CUOTA AS CHAR) LIKE V_FILTRO
          )
          AND (NULLIF(TRIM(P_ESTADO), '') IS NULL OR C.ESTADO_CUOTA = TRIM(P_ESTADO))
        ORDER BY C.ID_CREDITO ASC, C.NUMERO_CUOTA ASC;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_DETALLE_FACTURA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_DETALLE_FACTURA`(
    IN P_ID_SUCURSAL INT,
    IN P_BUSQUEDA VARCHAR(100)
)
BEGIN
    DECLARE V_FILTRO VARCHAR(102);

    -- Se valida que la sucursal exista
    IF P_ID_SUCURSAL IS NULL OR NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL = P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La sucursal no existe en el sistema.';
    END IF;

    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN
        -- Listado completo general
        SELECT DF.ID_FACTURA, DF.NUMERO_CORRELATIVO, DF.ID_PRODUCTO, P.NOMBRE_PRODUCTO, DF.CANTIDAD_DE_DETALLE, DF.PRECIO_UNITARIO, DF.SUBTOTAL
        FROM DETALLEFACTURA DF
        JOIN PRODUCTO P ON DF.ID_PRODUCTO = P.ID_PRODUCTO
        JOIN FACTURA F ON DF.ID_FACTURA = F.ID_FACTURA
        WHERE F.ID_SUCURSAL = P_ID_SUCURSAL
        ORDER BY DF.ID_FACTURA DESC, DF.NUMERO_CORRELATIVO ASC;

    ELSE
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT DF.ID_FACTURA, DF.NUMERO_CORRELATIVO, DF.ID_PRODUCTO, P.NOMBRE_PRODUCTO, DF.CANTIDAD_DE_DETALLE, DF.PRECIO_UNITARIO, DF.SUBTOTAL
        FROM DETALLEFACTURA DF
        JOIN PRODUCTO P ON DF.ID_PRODUCTO = P.ID_PRODUCTO
        JOIN FACTURA F ON DF.ID_FACTURA = F.ID_FACTURA
        WHERE F.ID_SUCURSAL = P_ID_SUCURSAL
          AND (
              CAST(DF.ID_FACTURA AS CHAR(15)) LIKE V_FILTRO
              OR CAST(DF.NUMERO_CORRELATIVO AS CHAR(15)) LIKE V_FILTRO
              OR P.NOMBRE_PRODUCTO LIKE V_FILTRO
          )
        ORDER BY DF.ID_FACTURA DESC, DF.NUMERO_CORRELATIVO ASC;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_FACTURAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_FACTURAS`(
    IN P_ID_SUCURSAL INT,
    IN P_BUSQUEDA VARCHAR(100)
)
BEGIN
    DECLARE V_FILTRO VARCHAR(102);

    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN
        SELECT 
            F.ID_FACTURA, 
            F.NUMERO_FACTURA, 
            COALESCE(CN.NOMBRE_CLIENTE, CJ.RAZON_SOCIAL) AS NOMBRE_CLIENTE, 
            S.NOMBRE_SUCURSAL, 
            F.FECHA_HORA, 
            F.MONTO_TOTAL, 
            F.METODO_PAGO
        FROM FACTURA F
        JOIN CLIENTE C ON F.ID_CLIENTE = C.ID_CLIENTE
        LEFT JOIN CLIENTENATURAL CN ON C.ID_CLIENTE = CN.ID_CLIENTE
        LEFT JOIN CLIENTEJURIDICO CJ ON C.ID_CLIENTE = CJ.ID_CLIENTE
        LEFT JOIN SUCURSAL S ON F.ID_SUCURSAL = S.ID_SUCURSAL
        WHERE F.ID_SUCURSAL = P_ID_SUCURSAL
          AND F.ESTADO_FACTURA = 'Activa'
        ORDER BY F.FECHA_HORA DESC, F.ID_FACTURA DESC;
    ELSE
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT 
            F.ID_FACTURA, 
            F.NUMERO_FACTURA, 
            COALESCE(CN.NOMBRE_CLIENTE, CJ.RAZON_SOCIAL) AS NOMBRE_CLIENTE, 
            S.NOMBRE_SUCURSAL, 
            F.FECHA_HORA, 
            F.MONTO_TOTAL, 
            F.METODO_PAGO
        FROM FACTURA F
        JOIN CLIENTE C ON F.ID_CLIENTE = C.ID_CLIENTE
        LEFT JOIN CLIENTENATURAL CN ON C.ID_CLIENTE = CN.ID_CLIENTE
        LEFT JOIN CLIENTEJURIDICO CJ ON C.ID_CLIENTE = CJ.ID_CLIENTE
        LEFT JOIN SUCURSAL S ON F.ID_SUCURSAL = S.ID_SUCURSAL
        WHERE F.ID_SUCURSAL = P_ID_SUCURSAL
          AND F.ESTADO_FACTURA = 'Activa'
          AND (
              CAST(F.ID_FACTURA AS CHAR) LIKE V_FILTRO
              OR F.NUMERO_FACTURA LIKE V_FILTRO
              OR CN.NOMBRE_CLIENTE LIKE V_FILTRO
              OR CJ.RAZON_SOCIAL LIKE V_FILTRO
          )
        ORDER BY F.FECHA_HORA DESC, F.ID_FACTURA DESC;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_HISTORIAL_PRECIOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_HISTORIAL_PRECIOS`(
    IN P_ID_EMPLEADO INT,
    IN P_BUSQUEDA VARCHAR(150),
    IN P_FECHA_DESDE DATETIME,
    IN P_FECHA_HASTA DATETIME
)
BEGIN
    DECLARE V_FILTRO VARCHAR(152);

    IF P_FECHA_DESDE IS NOT NULL AND P_FECHA_HASTA IS NOT NULL AND P_FECHA_DESDE > P_FECHA_HASTA THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha inicial no puede ser mayor que la fecha final.';
    END IF;

    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN

        SELECT B.ID_BITACORA, B.ID_PRODUCTO, P.NOMBRE_PRODUCTO, B.ID_EMPLEADO, E.NOMBRE_EMPLEADO, B.PRECIO_ANTERIOR, B.PRECIO_ACTUAL, B.FECHA_CAMBIO
        FROM BITACORAPRODUCTO B
        JOIN PRODUCTO P ON B.ID_PRODUCTO = P.ID_PRODUCTO
        JOIN EMPLEADO E ON B.ID_EMPLEADO = E.ID_EMPLEADO
        WHERE (P_FECHA_DESDE IS NULL OR B.FECHA_CAMBIO >= P_FECHA_DESDE)
          AND (P_FECHA_HASTA IS NULL OR B.FECHA_CAMBIO <= P_FECHA_HASTA)
        ORDER BY B.FECHA_CAMBIO DESC;

    ELSE
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT B.ID_BITACORA, B.ID_PRODUCTO, P.NOMBRE_PRODUCTO, B.ID_EMPLEADO, E.NOMBRE_EMPLEADO, B.PRECIO_ANTERIOR, B.PRECIO_ACTUAL, B.FECHA_CAMBIO
        FROM BITACORAPRODUCTO B
        JOIN PRODUCTO P ON B.ID_PRODUCTO = P.ID_PRODUCTO
        JOIN EMPLEADO E ON B.ID_EMPLEADO = E.ID_EMPLEADO
        WHERE (CAST(B.ID_BITACORA AS CHAR) LIKE V_FILTRO
               OR CAST(B.ID_PRODUCTO AS CHAR) LIKE V_FILTRO
               OR P.NOMBRE_PRODUCTO LIKE V_FILTRO
               OR CAST(B.ID_EMPLEADO AS CHAR) LIKE V_FILTRO
               OR E.NOMBRE_EMPLEADO LIKE V_FILTRO)
          AND (P_FECHA_DESDE IS NULL OR B.FECHA_CAMBIO >= P_FECHA_DESDE)
          AND (P_FECHA_HASTA IS NULL OR B.FECHA_CAMBIO <= P_FECHA_HASTA)
        ORDER BY B.FECHA_CAMBIO DESC;

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_INVENTARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_INVENTARIO`(
    IN P_ID_SUCURSAL INT
)
BEGIN

    -- Se verifica que la sucursal exista
    IF NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL=P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='La sucursal indicada no existe.';
    END IF;

    -- Se consultan las existencias de los productos en la sucursal
    SELECT
        I.ID_PRODUCTO,
        P.NOMBRE_PRODUCTO,
        I.ID_SUCURSAL,
        S.NOMBRE_SUCURSAL,
        I.STOCK
    FROM INVENTARIO I
    INNER JOIN PRODUCTO P ON I.ID_PRODUCTO=P.ID_PRODUCTO
    INNER JOIN SUCURSAL S ON I.ID_SUCURSAL=S.ID_SUCURSAL
    WHERE I.ID_SUCURSAL=P_ID_SUCURSAL
    ORDER BY P.NOMBRE_PRODUCTO;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_LIMITE_CREDITO_PERSONAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_LIMITE_CREDITO_PERSONAL`(
    IN P_ID_CLIENTE INTEGER,
    IN P_ID_SUCURSAL INTEGER,
    OUT MONTO DECIMAL(10,2)
)
PROCESO: BEGIN 

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN 
        SET MONTO = -1.00;
    END;

    SET MONTO = NULL;

    SELECT L.MONTOLIMITE
    INTO MONTO
    FROM CLIENTENATURAL C 
    JOIN LIMITECREDITOPERSONAL L 
    ON C.ID_CLIENTE = L.ID_CLIENTE
    WHERE C.ID_CLIENTE = P_ID_CLIENTE 
      AND L.ID_SUCURSAL = P_ID_SUCURSAL
    LIMIT 1;

    IF MONTO IS NULL THEN
        SET MONTO = -2.00; 
        LEAVE PROCESO;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_PRECIO_PROMOCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_PRECIO_PROMOCION`(
    IN P_ID_PRODUCTO INT
)
BEGIN
    DECLARE V_PRECIO DECIMAL(10,2);
    DECLARE V_DESCUENTO DECIMAL(5,2) DEFAULT 0.00;
    DECLARE V_NOMBRE VARCHAR(50);

    -- Obtener el precio original
    SELECT PRECIO_VENTA
    INTO V_PRECIO
    FROM PRODUCTO
    WHERE ID_PRODUCTO = P_ID_PRODUCTO;

    -- Obtener el mayor descuento vigente
    SELECT COALESCE(MAX(PR.PORCENTAJE_DESCUENTO), 0)
    INTO V_DESCUENTO
    FROM PROMOCION PR
    INNER JOIN PRODUCTOPROMOCION PP
        ON PP.ID_PROMOCION = PR.ID_PROMOCION
    WHERE PP.ID_PRODUCTO = P_ID_PRODUCTO
      AND PR.ESTADO_PROMOCION = 'Activa'
      AND CURDATE() BETWEEN PR.FECHA_INICIO AND PR.FECHA_FIN;

    -- Obtener el nombre del producto
    SELECT NOMBRE_PRODUCTO
    INTO V_NOMBRE
    FROM PRODUCTO
    WHERE ID_PRODUCTO = P_ID_PRODUCTO;

    -- Mostrar valores a la interfaz
    SELECT
        V_NOMBRE AS PRODUCTO,
        P_ID_PRODUCTO AS ID_PRODUCTO,
        V_PRECIO AS PRECIO_ORIGINAL,
        V_DESCUENTO AS DESCUENTO_PROMOCION,
        FN_CALCULAR_PRECIO_PROMOCION(
            V_PRECIO,
            V_DESCUENTO
        ) AS PRECIO_FINAL;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_PRODUCTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_PRODUCTOS`(
    IN P_ID_EMPLEADO INT,
    IN P_BUSQUEDA VARCHAR(150)
)
BEGIN
    DECLARE V_ID_SUCURSAL INT;
    DECLARE V_FILTRO VARCHAR(152);


    SET V_FILTRO = CONCAT('%', TRIM(COALESCE(P_BUSQUEDA, '')), '%');

    -- Se obtiene la sucursal del empleado
    SELECT ID_SUCURSAL INTO V_ID_SUCURSAL
    FROM EMPLEADO
    WHERE ID_EMPLEADO = P_ID_EMPLEADO;

    -- Se consultan todos los productos cuando no se envia una busqueda
    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN

        SELECT
            P.ID_PRODUCTO,
            P.ID_CATEGORIA,
            C.NOMBRE_CATEGORIA,
            P.NOMBRE_PRODUCTO,
            I.STOCK,
            P.PRECIO_VENTA,
            P.ESTADO_PRODUCTO,
            COALESCE(PR.PORCENTAJE_DESCUENTO, 0) AS PORCENTAJE_DESCUENTO,
            FN_CALCULAR_PRECIO_PROMOCION(P.ID_PRODUCTO) AS PRECIO_FINAL
        FROM PRODUCTO P
        INNER JOIN CATEGORIA C ON C.ID_CATEGORIA = P.ID_CATEGORIA
        INNER JOIN INVENTARIO I ON I.ID_PRODUCTO = P.ID_PRODUCTO
        LEFT JOIN ( -- Se hace una subconsulta que actua como tabla temporal llamada PR
            SELECT PP.ID_PRODUCTO, MAX(PR.PORCENTAJE_DESCUENTO) AS PORCENTAJE_DESCUENTO
            FROM PRODUCTOPROMOCION PP
            INNER JOIN PROMOCION PR ON PR.ID_PROMOCION = PP.ID_PROMOCION
            WHERE PR.ESTADO_PROMOCION = 'Activa'
            AND CURDATE() BETWEEN PR.FECHA_INICIO AND PR.FECHA_FIN
            GROUP BY PP.ID_PRODUCTO
        ) PR ON PR.ID_PRODUCTO = P.ID_PRODUCTO
        WHERE I.ID_SUCURSAL = V_ID_SUCURSAL
        ORDER BY P.ID_PRODUCTO DESC;

    -- Se consultan los productos que coincidan con la busqueda
    ELSE

        SELECT
            P.ID_PRODUCTO,
            P.ID_CATEGORIA,
            C.NOMBRE_CATEGORIA,
            P.NOMBRE_PRODUCTO,
            I.STOCK,
            P.PRECIO_VENTA,
            P.ESTADO_PRODUCTO,
            COALESCE(PR.PORCENTAJE_DESCUENTO, 0) AS PORCENTAJE_DESCUENTO,
            FN_CALCULAR_PRECIO_PROMOCION(P.ID_PRODUCTO) AS PRECIO_FINAL
        FROM PRODUCTO P
        INNER JOIN CATEGORIA C ON C.ID_CATEGORIA = P.ID_CATEGORIA
        INNER JOIN INVENTARIO I ON I.ID_PRODUCTO = P.ID_PRODUCTO
        LEFT JOIN (
            SELECT PP.ID_PRODUCTO, MAX(PR.PORCENTAJE_DESCUENTO) AS PORCENTAJE_DESCUENTO
            FROM PRODUCTOPROMOCION PP
            INNER JOIN PROMOCION PR ON PR.ID_PROMOCION = PP.ID_PROMOCION
            WHERE PR.ESTADO_PROMOCION = 'Activa'
            AND CURDATE() BETWEEN PR.FECHA_INICIO AND PR.FECHA_FIN
            GROUP BY PP.ID_PRODUCTO
        ) PR ON PR.ID_PRODUCTO = P.ID_PRODUCTO
        WHERE I.ID_SUCURSAL = V_ID_SUCURSAL
        AND (
           CAST(P.ID_PRODUCTO AS CHAR) LIKE V_FILTRO
           OR CAST(P.ID_CATEGORIA AS CHAR) LIKE V_FILTRO
           OR C.NOMBRE_CATEGORIA LIKE V_FILTRO
           OR P.NOMBRE_PRODUCTO LIKE V_FILTRO
           OR CAST(I.STOCK AS CHAR) LIKE V_FILTRO
           OR CAST(P.PRECIO_VENTA AS CHAR) LIKE V_FILTRO
           OR P.ESTADO_PRODUCTO LIKE V_FILTRO
           OR CAST(COALESCE(PR.PORCENTAJE_DESCUENTO, 0) AS CHAR) LIKE V_FILTRO
           )
        ORDER BY P.ID_PRODUCTO DESC;


    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_PRODUCTOS_INACTIVOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_PRODUCTOS_INACTIVOS`(
    IN P_ID_EMPLEADO INT
)
BEGIN
    DECLARE V_ID_SUCURSAL INT;

    -- Se obtiene la sucursal del empleado
    SELECT ID_SUCURSAL INTO V_ID_SUCURSAL
    FROM EMPLEADO
    WHERE ID_EMPLEADO = P_ID_EMPLEADO;

    -- Se valida que el empleado exista
    IF V_ID_SUCURSAL IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El empleado no existe o no tiene una sucursal asignada.';
    END IF;

    -- Se consultan los productos inactivos de la sucursal
    SELECT P.ID_PRODUCTO, P.NOMBRE_PRODUCTO, C.NOMBRE_CATEGORIA, I.STOCK, P.PRECIO_VENTA, P.ESTADO_PRODUCTO
    FROM PRODUCTO P
    INNER JOIN CATEGORIA C ON C.ID_CATEGORIA = P.ID_CATEGORIA
    INNER JOIN INVENTARIO I ON I.ID_PRODUCTO = P.ID_PRODUCTO
    WHERE I.ID_SUCURSAL = V_ID_SUCURSAL
    AND P.ESTADO_PRODUCTO = 'Inactivo'
    ORDER BY P.ID_PRODUCTO ASC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_PRODUCTOS_PROMOCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_PRODUCTOS_PROMOCION`(
    IN P_ID_PROMOCION INT
)
BEGIN
    SELECT PP.ID_PROMOCION, PP.ID_PRODUCTO, P.NOMBRE_PRODUCTO, PR.FECHA_INICIO, PR.FECHA_FIN, PR.PORCENTAJE_DESCUENTO, PR.ESTADO_PROMOCION
    FROM PRODUCTOPROMOCION PP
    INNER JOIN PRODUCTO P ON PP.ID_PRODUCTO = P.ID_PRODUCTO
    INNER JOIN PROMOCION PR ON PP.ID_PROMOCION = PR.ID_PROMOCION
    WHERE P_ID_PROMOCION IS NULL OR PP.ID_PROMOCION = P_ID_PROMOCION
    ORDER BY PP.ID_PROMOCION DESC, P.NOMBRE_PRODUCTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_PRODUCTOS_SUCURSAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_PRODUCTOS_SUCURSAL`(
    IN P_ID_EMPLEADO INT,
    IN P_BUSQUEDA VARCHAR(150),
    IN ID_SUCURSAL INTEGER
)
BEGIN
    DECLARE V_ID_SUCURSAL INT;
    DECLARE V_FILTRO VARCHAR(152);


    SET V_FILTRO = CONCAT('%', TRIM(COALESCE(P_BUSQUEDA, '')), '%');

    
    SET V_ID_SUCURSAL = ID_SUCURSAL;
    -- Se consultan todos los productos cuando no se envia una busqueda
    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN

        SELECT
            P.ID_PRODUCTO,
            P.ID_CATEGORIA,
            C.NOMBRE_CATEGORIA,
            P.NOMBRE_PRODUCTO,
            I.STOCK,
            P.PRECIO_VENTA,
            P.ESTADO_PRODUCTO,
            COALESCE(PR.PORCENTAJE_DESCUENTO, 0) AS PORCENTAJE_DESCUENTO,
            FN_CALCULAR_PRECIO_PROMOCION(P.ID_PRODUCTO) AS PRECIO_FINAL
        FROM PRODUCTO P
        INNER JOIN CATEGORIA C ON C.ID_CATEGORIA = P.ID_CATEGORIA
        INNER JOIN INVENTARIO I ON I.ID_PRODUCTO = P.ID_PRODUCTO
        LEFT JOIN ( -- Se hace una subconsulta que actua como tabla temporal llamada PR
            SELECT PP.ID_PRODUCTO, MAX(PR.PORCENTAJE_DESCUENTO) AS PORCENTAJE_DESCUENTO
            FROM PRODUCTOPROMOCION PP
            INNER JOIN PROMOCION PR ON PR.ID_PROMOCION = PP.ID_PROMOCION
            WHERE PR.ESTADO_PROMOCION = 'Activa'
            AND CURDATE() BETWEEN PR.FECHA_INICIO AND PR.FECHA_FIN
            GROUP BY PP.ID_PRODUCTO
        ) PR ON PR.ID_PRODUCTO = P.ID_PRODUCTO
        WHERE I.ID_SUCURSAL = V_ID_SUCURSAL
        ORDER BY P.ID_PRODUCTO DESC;

    -- Se consultan los productos que coincidan con la busqueda
    ELSE

        SELECT
            P.ID_PRODUCTO,
            P.ID_CATEGORIA,
            C.NOMBRE_CATEGORIA,
            P.NOMBRE_PRODUCTO,
            I.STOCK,
            P.PRECIO_VENTA,
            P.ESTADO_PRODUCTO,
            COALESCE(PR.PORCENTAJE_DESCUENTO, 0) AS PORCENTAJE_DESCUENTO,
            FN_CALCULAR_PRECIO_PROMOCION(P.ID_PRODUCTO) AS PRECIO_FINAL
        FROM PRODUCTO P
        INNER JOIN CATEGORIA C ON C.ID_CATEGORIA = P.ID_CATEGORIA
        INNER JOIN INVENTARIO I ON I.ID_PRODUCTO = P.ID_PRODUCTO
        LEFT JOIN (
            SELECT PP.ID_PRODUCTO, MAX(PR.PORCENTAJE_DESCUENTO) AS PORCENTAJE_DESCUENTO
            FROM PRODUCTOPROMOCION PP
            INNER JOIN PROMOCION PR ON PR.ID_PROMOCION = PP.ID_PROMOCION
            WHERE PR.ESTADO_PROMOCION = 'Activa'
            AND CURDATE() BETWEEN PR.FECHA_INICIO AND PR.FECHA_FIN
            GROUP BY PP.ID_PRODUCTO
        ) PR ON PR.ID_PRODUCTO = P.ID_PRODUCTO
        WHERE I.ID_SUCURSAL = V_ID_SUCURSAL
        AND (
           CAST(P.ID_PRODUCTO AS CHAR) LIKE V_FILTRO
           OR CAST(P.ID_CATEGORIA AS CHAR) LIKE V_FILTRO
           OR C.NOMBRE_CATEGORIA LIKE V_FILTRO
           OR P.NOMBRE_PRODUCTO LIKE V_FILTRO
           OR CAST(I.STOCK AS CHAR) LIKE V_FILTRO
           OR CAST(P.PRECIO_VENTA AS CHAR) LIKE V_FILTRO
           OR P.ESTADO_PRODUCTO LIKE V_FILTRO
           OR CAST(COALESCE(PR.PORCENTAJE_DESCUENTO, 0) AS CHAR) LIKE V_FILTRO
           )
        ORDER BY P.ID_PRODUCTO DESC;


    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_PROMOCIONES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_PROMOCIONES`(
    IN P_BUSQUEDA VARCHAR(50),
    IN P_ESTADO VARCHAR(30),
    IN P_FECHA_INICIO DATE,
    IN P_FECHA_FIN DATE
)
BEGIN
    DECLARE V_FILTRO VARCHAR(52);

    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN
        SELECT ID_PROMOCION,
               FECHA_INICIO,
               FECHA_FIN,
               PORCENTAJE_DESCUENTO,
               ESTADO_PROMOCION
        FROM PROMOCION
        WHERE (NULLIF(TRIM(P_ESTADO),'') IS NULL OR ESTADO_PROMOCION = TRIM(P_ESTADO))
          AND (P_FECHA_INICIO IS NULL OR FECHA_INICIO >= P_FECHA_INICIO)
          AND (P_FECHA_FIN IS NULL OR FECHA_FIN <= P_FECHA_FIN)
        ORDER BY FECHA_INICIO DESC;
    ELSE
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');

        SELECT ID_PROMOCION,
               FECHA_INICIO,
               FECHA_FIN,
               PORCENTAJE_DESCUENTO,
               ESTADO_PROMOCION
        FROM PROMOCION
        WHERE (
               CAST(ID_PROMOCION AS CHAR(15)) LIKE V_FILTRO
               OR CAST(PORCENTAJE_DESCUENTO AS CHAR(15)) LIKE V_FILTRO
              )
           AND (NULLIF(TRIM(P_ESTADO),'') IS NULL OR ESTADO_PROMOCION = TRIM(P_ESTADO))
           AND (P_FECHA_INICIO IS NULL OR FECHA_INICIO >= P_FECHA_INICIO)
           AND (P_FECHA_FIN IS NULL OR FECHA_FIN <= P_FECHA_FIN)
        ORDER BY FECHA_INICIO DESC;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_PROVEEDORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_PROVEEDORES`(
    IN P_ID_EMPLEADO INT,
    IN P_BUSQUEDA VARCHAR(150)
)
BEGIN
    DECLARE v_filtro VARCHAR(150);
    IF NOT EXISTS (
        SELECT 1
        FROM EMPLEADO E
        INNER JOIN USUARIO U ON E.ID_USUARIO = U.ID_USUARIO
        WHERE E.ID_EMPLEADO = P_ID_EMPLEADO
          AND U.ESTADO_USUARIO = 'Activo'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado, el empleado no cuenta con un usuario activo';
    END IF;
    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN
        SELECT ID_PROVEEDOR, NOMBRE_PROVEEDOR, TELEFONO_PROVEEDOR, ESTADO_PROVEEDOR
        FROM PROVEEDOR
        ORDER BY ID_PROVEEDOR DESC;
    ELSE
        SET v_filtro = CONCAT('%', TRIM(P_BUSQUEDA), '%');  
        SELECT ID_PROVEEDOR, NOMBRE_PROVEEDOR, TELEFONO_PROVEEDOR, ESTADO_PROVEEDOR
        FROM PROVEEDOR
        WHERE CAST(ID_PROVEEDOR AS CHAR) LIKE v_filtro
           OR NOMBRE_PROVEEDOR LIKE v_filtro
           OR TELEFONO_PROVEEDOR LIKE v_filtro
           OR ESTADO_PROVEEDOR LIKE v_filtro
        ORDER BY ID_PROVEEDOR DESC;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_SUCURSALES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_SUCURSALES`(
    IN P_ID_EMPLEADO INT,
    IN P_BUSQUEDA VARCHAR(150)
)
BEGIN
    DECLARE V_FILTRO VARCHAR(150);
    IF NOT EXISTS (
        SELECT 1
        FROM EMPLEADO E
        INNER JOIN USUARIO U ON E.ID_USUARIO = U.ID_USUARIO
        WHERE E.ID_EMPLEADO = P_ID_EMPLEADO
          AND U.ESTADO_USUARIO = 'Activo'
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acceso denegado,el empleado no cuenta con un usuario activo';
    END IF;
    IF P_BUSQUEDA IS NULL OR TRIM(P_BUSQUEDA) = '' THEN
        SELECT ID_SUCURSAL, NOMBRE_SUCURSAL, PRESUPUESTO_SUCURSAL, DIRECCION_SUCURSAL, TELEFONO_SUCURSAL, ESTADO_SUCURSAL
        FROM SUCURSAL
        ORDER BY ID_SUCURSAL DESC;
    ELSE
        SET V_FILTRO = CONCAT('%', TRIM(P_BUSQUEDA), '%');
        SELECT ID_SUCURSAL, NOMBRE_SUCURSAL, PRESUPUESTO_SUCURSAL, DIRECCION_SUCURSAL, TELEFONO_SUCURSAL, ESTADO_SUCURSAL
        FROM SUCURSAL
        WHERE CAST(ID_SUCURSAL AS CHAR) LIKE V_FILTRO
           OR NOMBRE_SUCURSAL LIKE V_FILTRO
           OR CAST(PRESUPUESTO_SUCURSAL AS CHAR) LIKE V_FILTRO
           OR DIRECCION_SUCURSAL LIKE V_FILTRO
           OR TELEFONO_SUCURSAL LIKE V_FILTRO
           OR ESTADO_SUCURSAL LIKE V_FILTRO
        ORDER BY ID_SUCURSAL DESC;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_SUPERVISOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_SUPERVISOR`(
    IN BUSQUEDA VARCHAR(200)
)
BEGIN
    DECLARE FILTRO VARCHAR(202);
    
    SET BUSQUEDA = TRIM(BUSQUEDA);
    IF BUSQUEDA = '' THEN
        SET BUSQUEDA = NULL;
    END IF;
    IF BUSQUEDA IS NOT NULL THEN
        SET FILTRO = CONCAT('%', BUSQUEDA, '%');
    END IF;

    SELECT 
        E.ID_EMPLEADO, 
        E.ID_SUCURSAL, 
        E.NOMBRE_EMPLEADO, 
        U.NOMBRE_USUARIO, 
        E.CORREO_ELECTRONICO, 
        E.DUI_EMPLEADO, 
        E.FECHA_CONTRATACION, 
        COUNT(SUB.ID_EMPLEADO) AS EMPLEADOS_A_CARGO,
        U.ESTADO_USUARIO
    FROM 
        EMPLEADO E 
    INNER JOIN 
        USUARIO U ON U.ID_USUARIO = E.ID_USUARIO
    LEFT JOIN 
        EMPLEADO SUB ON SUB.ID_SUPERVISOR = E.ID_EMPLEADO
    WHERE 
        E.TIPO_EMPLEADO = 'Supervisor'
        AND (
            BUSQUEDA IS NULL 
            OR E.NOMBRE_EMPLEADO LIKE FILTRO
            OR CAST(E.ID_SUCURSAL AS CHAR) LIKE FILTRO
            OR E.CORREO_ELECTRONICO LIKE FILTRO
            OR U.NOMBRE_USUARIO LIKE FILTRO
            OR E.DUI_EMPLEADO LIKE FILTRO
            OR U.ESTADO_USUARIO LIKE FILTRO
            OR CAST(E.ID_EMPLEADO AS CHAR) LIKE FILTRO
            OR CAST(E.FECHA_CONTRATACION AS CHAR) LIKE FILTRO
        )
    GROUP BY 
        E.ID_EMPLEADO, 
        E.ID_SUCURSAL, 
        E.NOMBRE_EMPLEADO, 
        U.NOMBRE_USUARIO, 
        E.CORREO_ELECTRONICO, 
        E.DUI_EMPLEADO, 
        E.FECHA_CONTRATACION,
        U.ESTADO_USUARIO;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CONSULTAR_VENDEDORES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CONSULTAR_VENDEDORES`(
    IN P_ID_SUCURSAL INT,
    IN BUSQUEDA VARCHAR(200)
)
BEGIN
    DECLARE FILTRO VARCHAR(202);

    SET BUSQUEDA = TRIM(BUSQUEDA);

    IF BUSQUEDA = '' THEN
        SET BUSQUEDA = NULL;
    END IF;

    IF BUSQUEDA IS NOT NULL THEN
        SET FILTRO = CONCAT('%', BUSQUEDA, '%');
    END IF;

    SELECT
        V.ID_EMPLEADO,
        E.NOMBRE_EMPLEADO,
        U.NOMBRE_USUARIO,
        E.CORREO_ELECTRONICO,
        E.DUI_EMPLEADO,
        E.FECHA_CONTRATACION,
        V.PORCENTAJE_COMISION,
        U.ESTADO_USUARIO
    FROM VENDEDOR V
    INNER JOIN EMPLEADO E ON E.ID_EMPLEADO = V.ID_EMPLEADO
    INNER JOIN USUARIO U ON U.ID_USUARIO = E.ID_USUARIO
    WHERE
        E.ID_SUCURSAL = P_ID_SUCURSAL
        AND (
            BUSQUEDA IS NULL
            OR E.NOMBRE_EMPLEADO LIKE FILTRO
            OR E.CORREO_ELECTRONICO LIKE FILTRO
            OR U.NOMBRE_USUARIO LIKE FILTRO
            OR E.DUI_EMPLEADO LIKE FILTRO
            OR U.ESTADO_USUARIO LIKE FILTRO
            OR CAST(E.ID_EMPLEADO AS CHAR) LIKE FILTRO
            OR CAST(E.FECHA_CONTRATACION AS CHAR) LIKE FILTRO
            OR CAST(V.PORCENTAJE_COMISION AS CHAR) LIKE FILTRO
        );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DEFINIR_ROL_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DEFINIR_ROL_USUARIO`(
    IN NOMUSUARIO VARCHAR(50),
    OUT ROL INTEGER 
)
BLOQUE : BEGIN

    DECLARE V_TIPO VARCHAR(20) DEFAULT NULL;
    DECLARE V_CONTEO INTEGER DEFAULT 0;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET ROL = -1;
    END;
    
    IF NOMUSUARIO IS NULL OR TRIM(NOMUSUARIO) = '' THEN
        SET ROL = -2;
        LEAVE BLOQUE;
    END IF;

    SELECT E.TIPO_EMPLEADO 
    INTO V_TIPO
    FROM USUARIO U
    JOIN EMPLEADO E ON U.ID_USUARIO = E.ID_USUARIO
    WHERE U.NOMBRE_USUARIO = TRIM(NOMUSUARIO);

    IF V_TIPO IS NULL THEN
        SET ROL = -3;
        LEAVE BLOQUE;
    END IF;

    IF V_TIPO = 'Supervisor' THEN
        SET ROL = 3;
        LEAVE BLOQUE;
    END IF;

    SELECT COUNT(*)
    INTO V_CONTEO
    FROM USUARIO U 
    JOIN EMPLEADO E ON U.ID_USUARIO = E.ID_USUARIO 
    JOIN CAJERO C ON E.ID_EMPLEADO = C.ID_EMPLEADO
    WHERE U.NOMBRE_USUARIO = TRIM(NOMUSUARIO);

    IF V_CONTEO = 1 THEN
        SET ROL = 1;
        LEAVE BLOQUE;
    END IF;

    SELECT COUNT(*)
    INTO V_CONTEO
    FROM USUARIO U 
    JOIN EMPLEADO E ON U.ID_USUARIO = E.ID_USUARIO 
    JOIN VENDEDOR V ON E.ID_EMPLEADO = V.ID_EMPLEADO
    WHERE U.NOMBRE_USUARIO = TRIM(NOMUSUARIO);
    
    IF V_CONTEO = 1 THEN
        SET ROL = 2;
        LEAVE BLOQUE;
    END IF;

    SET ROL = -3;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DESACTIVAR_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DESACTIVAR_CATEGORIA`(
    IN P_ID_CATEGORIA INTEGER
)
BEGIN
    UPDATE CATEGORIA
    SET ESTADO_CATEGORIA = 'Inactivo'
    WHERE ID_CATEGORIA = P_ID_CATEGORIA;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DESACTIVAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DESACTIVAR_CLIENTE`(
    IN P_ID_CLIENTE INT
)
BEGIN 
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
     ROLLBACK;
     RESIGNAL;
   END;

   START TRANSACTION;
     UPDATE CLIENTE
     SET ESTADO_CLIENTE= 'Inactivo'
     WHERE ID_CLIENTE= P_ID_CLIENTE;

   COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DESACTIVAR_PROMOCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DESACTIVAR_PROMOCION`(
    IN P_ID_PROMOCION INT
)
BEGIN
    DECLARE V_EXISTE INT;

    SELECT COUNT(*) INTO V_EXISTE
    FROM PROMOCION
    WHERE ID_PROMOCION = P_ID_PROMOCION;

    IF (V_EXISTE = 0) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La promoción no existe en el sistema.';
    ELSE
        UPDATE PROMOCION
        SET ESTADO_PROMOCION = 'Inactiva'
        WHERE ID_PROMOCION = P_ID_PROMOCION;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DESACTIVAR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DESACTIVAR_PROVEEDOR`(in P_ID_PROVEEDOR INT, in P_ESTADO_PROVEEDOR varchar(50))
begin
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
 update PROVEEDOR set 
 ESTADO_PROVEEDOR = P_ESTADO_PROVEEDOR
 where ID_PROVEEDOR = P_ID_PROVEEDOR;
commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DESACTIVAR_SUCURSAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DESACTIVAR_SUCURSAL`(
 IN P_ID_SUCURSAL INT,
 IN P_ESTADO_SUCURSAL VARCHAR(50))
BEGIN
         DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
 UPDATE SUCURSAL
 SET
   ESTADO_SUCURSAL=P_ESTADO_SUCURSAL
 WHERE ID_SUCURSAL=P_ID_SUCURSAL ;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DESACTIVAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DESACTIVAR_USUARIO`(
    IN P_NOMBRE_USUARIO VARCHAR (50),
    OUT CONFIRMACION INTEGER
)
BEGIN

    DECLARE U_EXISTE INTEGER DEFAULT 0;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET CONFIRMACION = -1; 
    END;

    IF P_NOMBRE_USUARIO IS NULL OR TRIM(P_NOMBRE_USUARIO) = '' THEN
        SET CONFIRMACION = -2;

    ELSE
        SELECT COUNT(*)
        INTO U_EXISTE 
        FROM USUARIO
        WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO);

        IF U_EXISTE = 0 THEN
            SET CONFIRMACION = -3;
        ELSE
            UPDATE USUARIO
            SET ESTADO_USUARIO = 'Inactivo'
            WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO);

            SET CONFIRMACION = 1;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DESBLOQUEAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DESBLOQUEAR_USUARIO`(
    IN P_NOMBRE_USUARIO VARCHAR(50),
    OUT CONFIRMACION INTEGER
)
BEGIN 
    DECLARE U_EXISTE INTEGER DEFAULT 0;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET CONFIRMACION = -1; 
    END;

    IF P_NOMBRE_USUARIO IS NULL OR TRIM(P_NOMBRE_USUARIO) = '' THEN
        SET CONFIRMACION = -2;

    ELSE
        SELECT COUNT(*)
        INTO U_EXISTE 
        FROM USUARIO
        WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO);

        IF U_EXISTE = 0 THEN
            SET CONFIRMACION = -3;
        ELSE
            UPDATE USUARIO
            SET INTENTOS_INGRESO = 0,
                ESTADO_USUARIO = 'Activo'
            WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO);

            SET CONFIRMACION = 1;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_GENERAR_PLAN_CUOTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GENERAR_PLAN_CUOTAS`(
    IN P_ID_FACTURA INT,
    IN P_MONTO_PRIMA DECIMAL(10,2),
    IN P_TASA_INTERES DECIMAL(10,2),
    IN P_NUMERO_CUOTAS INT,
    OUT P_ID_CREDITO INT
)
BEGIN
    -- Datos obtenidos de la factura
    DECLARE V_ID_CLIENTE INT DEFAULT NULL;
    DECLARE V_ID_SUCURSAL INT DEFAULT NULL;
    DECLARE V_MONTO_TOTAL DECIMAL(12,2) DEFAULT 0.00;
    DECLARE V_METODO_PAGO VARCHAR(30);
    DECLARE V_ESTADO_FACTURA VARCHAR(30);
    DECLARE V_ESTADO_CLIENTE VARCHAR(30);

    -- Datos del crédito.
    DECLARE V_LIMITE DECIMAL(12,2) DEFAULT 0.00;
    DECLARE V_CUPO_DISPONIBLE DECIMAL(12,2) DEFAULT 0.00;
    DECLARE V_MONTO_FINANCIADO DECIMAL(12,2) DEFAULT 0.00;
    DECLARE V_INTERES DECIMAL(12,2) DEFAULT 0.00;
    DECLARE V_TOTAL_PAGAR DECIMAL(12,2) DEFAULT 0.00;
    DECLARE V_MONTO_CUOTA DECIMAL(12,2) DEFAULT 0.00;

    DECLARE V_ID_CREDITO INT;
    DECLARE V_NUMERO_ACTUAL INT DEFAULT 1;
    DECLARE V_FECHA_VENCIMIENTO DATE;
    DECLARE V_CUOTAS_VENCIDAS INT DEFAULT 0;

    -- Se bloque la factura para impedir que dos procesos generen creditos para la misma venta
    SELECT ID_CLIENTE, ID_SUCURSAL, MONTO_TOTAL, METODO_PAGO, ESTADO_FACTURA
    INTO V_ID_CLIENTE, V_ID_SUCURSAL, V_MONTO_TOTAL, V_METODO_PAGO, V_ESTADO_FACTURA
    FROM FACTURA
    WHERE ID_FACTURA = P_ID_FACTURA
    FOR UPDATE;

    -- Se valida que la factura asociada a ese cliente exista
    IF V_ID_CLIENTE IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura indicada no existe para dicho cliente.';
    END IF;

    -- Solo se permiten creditos sobre facturas activas
    IF V_ESTADO_FACTURA <> 'Activa' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se  puede generar credito para una factura anulada.';
    END IF;

    -- Se verifica qe la factura corresponda a una venta a crédito.ALTER
    IF V_METODO_PAGO NOT IN ('Credito Corporativo', 'Credito Personal') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura no corresponde a una venta a credito.';
    END IF;

    -- Se obtiene el estado del cliente para verificar que este activo
    SELECT ESTADO_CLIENTE INTO V_ESTADO_CLIENTE
    FROM CLIENTE
    WHERE ID_CLIENTE = V_ID_CLIENTE;

    IF V_ESTADO_CLIENTE IS NULL OR V_ESTADO_CLIENTE <> 'Activo' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe o esta inactivo.';
    END IF;

    -- Evitar que una factura tenga más de un credito
    IF EXISTS (SELECT 1 FROM CREDITO WHERE ID_FACTURA = P_ID_FACTURA) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La factura ya tiene un credito registrado';
    END IF;

    -- Se valida la prima
    IF P_MONTO_PRIMA IS NULL OR P_MONTO_PRIMA < 0 OR P_MONTO_PRIMA >= V_MONTO_TOTAL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La prima debe ser mayor o igual a cero y menor que el total de la factura.';
    END IF;

    -- Se valida la tasa de interes
    IF P_TASA_INTERES IS NULL OR P_TASA_INTERES < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La tasa de interes no puede ser negativa ni nula.';
    END IF;
 -- Validar el numero de cuotas
    IF P_NUMERO_CUOTAS IS NULL OR P_NUMERO_CUOTAS <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El número de cuotas debe ser mayor que cero.';
    END IF;

    -- Se calcula el monto que se financiara descontando la prima inicial
    SET V_MONTO_FINANCIADO = ROUND(V_MONTO_TOTAL - P_MONTO_PRIMA, 2);

    -- Se calcula el interes simple mensual
    SET V_INTERES = ROUND(V_MONTO_FINANCIADO * (P_TASA_INTERES) / 100.00 * P_NUMERO_CUOTAS, 2);

    -- Se calcula el total que debera pagar el cliente
    SET V_TOTAL_PAGAR = ROUND(V_MONTO_FINANCIADO + V_INTERES, 2);

    -- Bloquear el registro que contiene el limite de cretido y evitar que dos ventas simultaneas excedan el cupo

    -- Cliente juridico
    IF V_METODO_PAGO = 'Credito Corporativo' THEN

        IF NOT EXISTS (SELECT 1 FROM CLIENTEJURIDICO WHERE ID_CLIENTE = V_ID_CLIENTE) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito corporativo solo aplica a clients jurídicos.';
        END IF;

        SELECT CUPO_CREDITO_CORPORATIVO INTO V_LIMITE
        FROM CLIENTEJURIDICO
        WHERE ID_CLIENTE = V_ID_CLIENTE
        FOR UPDATE;

    -- Cliente natural
    ELSEIF V_METODO_PAGO = 'Credito Personal' THEN

        IF NOT EXISTS (SELECT 1 FROM CLIENTENATURAL WHERE ID_CLIENTE = V_ID_CLIENTE) THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito personal solo aplica a clientes naturales.';
        END IF;

        SELECT MONTOLIMITE INTO V_LIMITE
        FROM LIMITECREDITOPERSONAL
        WHERE ID_CLIENTE = V_ID_CLIENTE
          AND ID_SUCURSAL = V_ID_SUCURSAL
        FOR UPDATE;

    END IF;

    -- Se verifica que tenga un limite de credito
    IF V_LIMITE IS NULL OR V_LIMITE <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no tiene un limite autorizado.';
    END IF;

    -- Se obtiene el cupo disponible
    SET V_CUPO_DISPONIBLE = FN_OBTENER_CUPO_DISPONIBLE_CLIENTE(V_ID_CLIENTE, V_ID_SUCURSAL);

    -- Verificar que el monto de la factura debe caer dentro del cupo disponible
    IF V_TOTAL_PAGAR > V_CUPO_DISPONIBLE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no cuenta con cupo suficiente para este crédito.';
    END IF;

    -- Registrar el crédito.
    INSERT INTO CREDITO (ID_FACTURA, MONTO_PRIMA, MONTO_FINANCIADO, SALDO_PENDIENTE, TASA_INTERES, NUMERO_CUOTAS)
    VALUES (P_ID_FACTURA, P_MONTO_PRIMA, V_MONTO_FINANCIADO, V_TOTAL_PAGAR, P_TASA_INTERES, P_NUMERO_CUOTAS);

    -- Se recupera el identificar del crédtito recien creado
    SET V_ID_CREDITO = LAST_INSERT_ID();

    -- Se devuelve el id del credito generado
    SET P_ID_CREDITO = V_ID_CREDITO;

    -- Calcula el monto base de cada cuota
    SET V_MONTO_CUOTA = ROUND(V_TOTAL_PAGAR / P_NUMERO_CUOTAS, 2);

    -- Se genera cuotas con vencimiento mensual
    WHILE V_NUMERO_ACTUAL <= P_NUMERO_CUOTAS DO

        -- le suma un mes a la fecha actual respecto a la fecha de cada cuota
        SET V_FECHA_VENCIMIENTO = DATE_ADD(CURRENT_DATE(), INTERVAL V_NUMERO_ACTUAL MONTH);

        -- Se insertan los creditos respectivos
        INSERT INTO CUOTA (ID_CREDITO, NUMERO_CUOTA, FECHA_VENCIMIENTO, FECHA_PAGO, MONTO_ESPERADO)
        VALUES (V_ID_CREDITO, V_NUMERO_ACTUAL, V_FECHA_VENCIMIENTO, NULL, V_MONTO_CUOTA);

        SET V_NUMERO_ACTUAL = V_NUMERO_ACTUAL + 1;

    END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PAGAR_CUOTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PAGAR_CUOTA`(
    IN P_ID_CREDITO INT,
    IN P_NUMERO_CUOTA INT,
    IN P_MONTO_PAGO DECIMAL(10,2)
)
BEGIN
    DECLARE V_ESTADO_CUOTA VARCHAR(50);
    DECLARE V_ESTADO_CREDITO VARCHAR(50);
    DECLARE V_ESTADO_FACTURA VARCHAR(50);
    DECLARE V_MONTO_ESPERADO DECIMAL(10,2);
    DECLARE V_MONTO_ABONADO DECIMAL(10,2);
    DECLARE V_SALDO_CUOTA DECIMAL(10,2);
    DECLARE V_SALDO_CREDITO DECIMAL(10,2);
    DECLARE V_NUEVO_SALDO_CREDITO DECIMAL(10,2);
    DECLARE V_NUEVO_ESTADO_CREDITO VARCHAR(50);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Se valida el monto que se esta pagando
    IF P_MONTO_PAGO IS NULL OR P_MONTO_PAGO <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El monto de pago debe ser mayor que cero.';
    END IF;

    -- Se validan los datos de entrada básicos
    IF P_ID_CREDITO IS NULL OR P_ID_CREDITO <= 0 OR P_NUMERO_CUOTA IS NULL OR P_NUMERO_CUOTA <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe indicar un crédito y una cuota válidos.';
    END IF;

    -- Comprobar que el crédito exista.
    IF NOT EXISTS (SELECT 1 FROM CREDITO WHERE ID_CREDITO = P_ID_CREDITO) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito indicado no existe.';
    END IF;

    -- Comprobar que la cuota pertenezca al crédito.
    IF NOT EXISTS (SELECT 1 FROM CUOTA WHERE ID_CREDITO = P_ID_CREDITO AND NUMERO_CUOTA = P_NUMERO_CUOTA) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cuota no existe para el crédito indicado.';
    END IF;

    -- Se consultan los estados actuales antes de iniciar la transacción
    SELECT ESTADO_CREDITO, SALDO_PENDIENTE INTO V_ESTADO_CREDITO, V_SALDO_CREDITO
    FROM CREDITO
    WHERE ID_CREDITO = P_ID_CREDITO;

    SELECT C.ESTADO_CUOTA, C.MONTO_ESPERADO, C.MONTO_ABONADO, F.ESTADO_FACTURA
    INTO V_ESTADO_CUOTA, V_MONTO_ESPERADO, V_MONTO_ABONADO, V_ESTADO_FACTURA
    FROM CUOTA C
    INNER JOIN CREDITO CR ON CR.ID_CREDITO = C.ID_CREDITO
    INNER JOIN FACTURA F ON F.ID_FACTURA = CR.ID_FACTURA
    WHERE C.ID_CREDITO = P_ID_CREDITO AND C.NUMERO_CUOTA = P_NUMERO_CUOTA;

    -- No permitir pagar créditos cancelados o ya pagados.
    IF V_ESTADO_CREDITO IN ('Cancelado', 'Pagado') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito está cancelado o ya fue pagado.';
    END IF;

    -- No permitir pagos de facturas anuladas.
    IF V_ESTADO_FACTURA <> 'Activa' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede pagar una cuota de una factura anulada.';
    END IF;

    -- se valida que la cuota no se encuentre pagada
    IF V_ESTADO_CUOTA = 'Pagada' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Esta cuota ya ha sido pagada en su totalidad.';
    END IF;

    -- se valida que la cuota no se encuntre cancelada
    IF V_ESTADO_CUOTA = 'Cancelada' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede pagar una cuota que ha sido cancelada.';
    END IF;

    -- Calcula el saldo completo de la cuota
    SET V_SALDO_CUOTA = V_MONTO_ESPERADO - V_MONTO_ABONADO;

    IF V_SALDO_CUOTA <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cuota no tiene saldo pendiente.';
    END IF;

    -- Se valida que el pago sea exacto al monto esperado de la cuota
    IF P_MONTO_PAGO <> V_SALDO_CUOTA THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El monto debe coincidir exactamente con el saldo completo de la cuota.';
    END IF;

    -- Verificar que el crédito tenga saldo suficiente.
    IF V_SALDO_CREDITO < V_SALDO_CUOTA THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El saldo del crédito es insuficiente para pagar esta cuota.';
    END IF;

    START TRANSACTION;

    -- Bloquear los registros implicados para evitar acceder a datos incorrectos
    SELECT ESTADO_CREDITO, SALDO_PENDIENTE INTO V_ESTADO_CREDITO, V_SALDO_CREDITO
    FROM CREDITO
    WHERE ID_CREDITO = P_ID_CREDITO
    FOR UPDATE;

    SELECT ESTADO_CUOTA, MONTO_ABONADO, MONTO_ESPERADO INTO V_ESTADO_CUOTA, V_MONTO_ABONADO, V_MONTO_ESPERADO
    FROM CUOTA
    WHERE ID_CREDITO = P_ID_CREDITO AND NUMERO_CUOTA = P_NUMERO_CUOTA
    FOR UPDATE;

    -- Se vuelven a comprobar los valores después de bloquear los registros
    IF V_ESTADO_CREDITO IN ('Cancelado', 'Pagado') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito está cancelado o ya fue pagado.';
    END IF;

    IF V_ESTADO_CUOTA IN ('Pagada', 'Cancelada') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La cuota ya fue pagada o está cancelada.';
    END IF;

    SET V_SALDO_CUOTA = V_MONTO_ESPERADO - V_MONTO_ABONADO;

    IF V_SALDO_CUOTA <= 0 OR P_MONTO_PAGO <> V_SALDO_CUOTA THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El monto debe coincidir exactamente con el saldo completo de la cuota.';
    END IF;

    IF V_SALDO_CREDITO < V_SALDO_CUOTA THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El saldo del crédito es insuficiente para pagar esta cuota.';
    END IF;

    -- Marca la Cuota como Pagada por el monto completo
    UPDATE CUOTA
    SET MONTO_ABONADO = MONTO_ESPERADO,
        FECHA_PAGO = NOW(),
        ESTADO_CUOTA = 'Pagada'
    WHERE ID_CREDITO = P_ID_CREDITO
      AND NUMERO_CUOTA = P_NUMERO_CUOTA;

    -- Descuenta el pago del saldo total del crédito.
    SET V_NUEVO_SALDO_CREDITO = V_SALDO_CREDITO - V_SALDO_CUOTA;

    IF V_NUEVO_SALDO_CREDITO < 0 THEN
        SET V_NUEVO_SALDO_CREDITO = 0.00;
    END IF;

    -- Determina el nuevo estado general del crédito.
    IF V_NUEVO_SALDO_CREDITO = 0 THEN
        SET V_NUEVO_ESTADO_CREDITO = 'Pagado';
    ELSEIF EXISTS (SELECT 1 FROM CUOTA WHERE ID_CREDITO = P_ID_CREDITO AND ESTADO_CUOTA = 'Vencida') THEN
        SET V_NUEVO_ESTADO_CREDITO = 'Vencido';
    ELSE
        SET V_NUEVO_ESTADO_CREDITO = 'Pendiente';
    END IF;

    -- Actualiza el saldo pendiente y el estado general del Crédito
    UPDATE CREDITO
    SET SALDO_PENDIENTE = V_NUEVO_SALDO_CREDITO,
        ESTADO_CREDITO = V_NUEVO_ESTADO_CREDITO
    WHERE ID_CREDITO = P_ID_CREDITO;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REACTIVAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REACTIVAR_USUARIO`(
    IN P_NOMBRE_USUARIO VARCHAR (50),
    OUT CONFIRMACION INTEGER
)
BEGIN

    DECLARE U_EXISTE INTEGER DEFAULT 0;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET CONFIRMACION = -1; 
    END;

    IF P_NOMBRE_USUARIO IS NULL OR TRIM(P_NOMBRE_USUARIO) = '' THEN
        SET CONFIRMACION = -2;

    ELSE
        SELECT COUNT(*)
        INTO U_EXISTE 
        FROM USUARIO
        WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO);

        IF U_EXISTE = 0 THEN
            SET CONFIRMACION = -3;
        ELSE
            UPDATE USUARIO
            SET ESTADO_USUARIO = 'Activo'
            WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO);

            SET CONFIRMACION = 1;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REALIZAR_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REALIZAR_VENTA`(
    IN P_ID_CLIENTE INT,
    IN P_ID_EMPLEADO INT,
    IN P_ID_SUCURSAL INT,
    IN P_METODO_PAGO VARCHAR(30),
    IN P_PRODUCTOS JSON,
    IN P_MONTO_PRIMA DECIMAL(10,2),
    IN P_TASA_INTERES DECIMAL(10,2),
    IN P_NUMERO_CUOTAS INT,
    OUT P_ID_FACTURA INT,
    OUT P_NUMERO_FACTURA VARCHAR(20),
    OUT P_ID_CREDITO INT
)
BEGIN
    DECLARE V_ID_FACTURA INT DEFAULT NULL;
    DECLARE V_ID_CREDITO INT DEFAULT NULL;
    DECLARE V_NUMERO_FACTURA VARCHAR(20);
    DECLARE V_TOTAL_PRODUCTOS INT;
    DECLARE V_CONTADOR INT DEFAULT 0;
    DECLARE V_ID_PRODUCTO INT;
    DECLARE V_CANTIDAD INT;
    DECLARE V_PRODUCTO_JSON JSON;
    DECLARE V_ID_TEXTO VARCHAR(30);
    DECLARE V_CANTIDAD_TEXTO VARCHAR(30);

    -- Si falla cualquier operación, se deshace toda la venta
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Se valida que se haya enviado una lista de productos
    IF P_PRODUCTOS IS NULL OR JSON_TYPE(P_PRODUCTOS) <> 'ARRAY' OR JSON_LENGTH(P_PRODUCTOS) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe agregar al menos un producto a la venta.';
    END IF;

    -- Se obtiene la cantidad de productos enviados
    SET V_TOTAL_PRODUCTOS = JSON_LENGTH(P_PRODUCTOS);

    -- Se inicia la transacción de toda la venta
    START TRANSACTION;
   -- Se registra el encabezado de la factura con número automático
    CALL SP_REGISTRAR_FACTURA(P_ID_CLIENTE, P_ID_EMPLEADO, P_ID_SUCURSAL, P_METODO_PAGO, V_ID_FACTURA);

    -- Se recorren todos los productos enviados desde C#
    WHILE V_CONTADOR < V_TOTAL_PRODUCTOS DO

        -- Se obtiene el producto de la posición actual del JSON, se accede a un producto especifico
        SET V_PRODUCTO_JSON = JSON_EXTRACT(P_PRODUCTOS, CONCAT('$[', V_CONTADOR, ']'));

        -- Se obtiene el identificador y cantidad del producto
        SET V_ID_TEXTO = JSON_UNQUOTE(JSON_EXTRACT(V_PRODUCTO_JSON, '$.ID_PRODUCTO'));
        SET V_CANTIDAD_TEXTO = JSON_UNQUOTE(JSON_EXTRACT(V_PRODUCTO_JSON, '$.CANTIDAD'));

        -- Se validan los datos de cada producto
        IF V_ID_TEXTO IS NULL OR V_CANTIDAD_TEXTO IS NULL THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Los datos de un producto son inválidos.';
        END IF;

        -- Se convierten los datos del producto a números enteros
        SET V_ID_PRODUCTO = CAST(V_ID_TEXTO AS UNSIGNED);
        SET V_CANTIDAD = CAST(V_CANTIDAD_TEXTO AS UNSIGNED);

        -- Se registra el detalle, se aplica la promoción y se descuenta inventario
        CALL SP_AGREGAR_DETALLE_FACTURA(V_ID_FACTURA, V_ID_PRODUCTO, V_CANTIDAD);

        -- Se avanza al siguiente producto
        SET V_CONTADOR = V_CONTADOR + 1;

    END WHILE;

    -- Se genera el plan de cuotas únicamente si la venta es a crédito
    IF P_METODO_PAGO IN ('Credito Personal', 'Credito Corporativo') THEN
        CALL SP_GENERAR_PLAN_CUOTAS(V_ID_FACTURA, P_MONTO_PRIMA, P_TASA_INTERES, P_NUMERO_CUOTAS, V_ID_CREDITO);
    END IF;

    -- Se obtiene el número de factura generado automáticamente
    SELECT NUMERO_FACTURA 
    INTO V_NUMERO_FACTURA 
    FROM FACTURA 
    WHERE ID_FACTURA = V_ID_FACTURA;

    -- Se confirma toda la venta
    COMMIT;

    -- Se devuelven los datos de la venta registrada
    SET P_ID_FACTURA = V_ID_FACTURA;
    SET P_NUMERO_FACTURA = V_NUMERO_FACTURA;
    SET P_ID_CREDITO = V_ID_CREDITO;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CATEGORIA`(
    IN P_NOMBRE_CATEGORIA VARCHAR(150),
    OUT ID_REGISTRO INTEGER
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET ID_REGISTRO = -1; -- -1 indica Error del Servidor
    END;

    IF P_NOMBRE_CATEGORIA IS NULL OR TRIM(P_NOMBRE_CATEGORIA) = '' THEN
         
         SET ID_REGISTRO = -2; -- -2 indica Error por datos nulos o vacíos

    ELSE
    
        START TRANSACTION;

        INSERT INTO CATEGORIA (NOMBRE_CATEGORIA)
        VALUES (TRIM(P_NOMBRE_CATEGORIA)); 
    
        SET ID_REGISTRO = LAST_INSERT_ID();

        COMMIT;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CLIENTE`(
  IN P_CORREO VARCHAR(100),
  IN P_TELEFONO VARCHAR(20),
  OUT P_ID_CLIENTE INT
)
BEGIN 
  IF P_CORREO NOT LIKE '%@%' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El formato del correo electrónico no es válido.';
  END IF;

  IF LENGTH(P_TELEFONO)<8 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT= 'El telefóno debe tener al menos 8 dígitos.';
  END IF;

  INSERT INTO CLIENTE (CORREO,TELEFONO_CLIENTE)
  VALUES(P_CORREO, P_TELEFONO);

  SET P_ID_CLIENTE = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CLIENTE_JURIDICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CLIENTE_JURIDICO`(
    IN P_CORREO VARCHAR(100),
    IN P_TELEFONO VARCHAR(20),
    IN P_REPRESENTANTE VARCHAR(100),
    IN P_NIT VARCHAR(20),
    IN P_RAZON_SOCIAL VARCHAR(100),
    IN P_CUPO_CREDITO DECIMAL(10,2),
    OUT P_ID_CLIENTE INT
)
BEGIN
   DECLARE EXIT HANDLER FOR SQLEXCEPTION
   BEGIN
      ROLLBACK;
      RESIGNAL;
   END;

-- validar razón social obligatoria

IF P_RAZON_SOCIAL IS NULL OR TRIM(P_RAZON_SOCIAL)='' THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT= 'La razón social es obligatoria. ';
END IF;

-- valida la longitud minima del nit de 14 digitos
IF P_NIT IS NULL OR LENGTH(TRIM(P_NIT))<14 THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT= 'El nit ingresado no es valido o esta incompleto.';
END IF;

-- valida que el cupo corporativo no sea negativo
IF P_CUPO_CREDITO<0 THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT= 'El cupo de credito corporativo no puede ser negativo';
END IF;

START TRANSACTION;

-- llama al procedimiento base
CALL SP_REGISTRAR_CLIENTE(P_CORREO,P_TELEFONO,P_ID_CLIENTE);

-- Insertar los datos de los clientes juridicos

INSERT INTO CLIENTEJURIDICO(ID_CLIENTE, NOMBRE_REPRESENTANTE_LEGAL,NIT, RAZON_SOCIAL, CUPO_CREDITO_CORPORATIVO)
VALUES (P_ID_CLIENTE, P_REPRESENTANTE, P_NIT, P_RAZON_SOCIAL, P_CUPO_CREDITO);

COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CLIENTE_NATURAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CLIENTE_NATURAL`(
    IN P_CORREO VARCHAR(100),
    IN P_TELEFONO VARCHAR(20),
    IN P_NOMBRE_CLIENTE VARCHAR(150),
    IN P_DUI_CLIENTE VARCHAR(12),
    OUT P_ID_CLIENTE INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  IF P_NOMBRE_CLIENTE IS NULL OR TRIM(P_NOMBRE_CLIENTE) = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El nombre del cliente natural es obligatorio.';
    END IF;

    --  Validar longitud del DUI
    IF P_DUI_CLIENTE IS NULL OR LENGTH(TRIM(P_DUI_CLIENTE)) < 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El DUI del cliente no es válido o está incompleto.';
    END IF;

    START TRANSACTION;
        -- Llama al procedimiento base, que también ya valida correo y teléfono y registra en la tabal cliente general
        CALL SP_REGISTRAR_CLIENTE(P_CORREO, P_TELEFONO, P_ID_CLIENTE);

        -- Inserta en la tabla hija
        INSERT INTO CLIENTENATURAL (ID_CLIENTE, NOMBRE_CLIENTE, DUI_CLIENTE)
        VALUES (P_ID_CLIENTE, P_NOMBRE_CLIENTE, P_DUI_CLIENTE);
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_COMPRA_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_COMPRA_PRODUCTO`(
    IN P_ID_PROVEEDOR INT,
    IN P_ID_PRODUCTO INT,
    IN P_FECHA_ENTREGA DATE,
    IN P_PRECIO_PACTADO DECIMAL(10,2),
    OUT P_ID INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF P_PRECIO_PACTADO IS NULL OR P_PRECIO_PACTADO <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio pactado debe ser mayor que cero.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM PROVEEDOR WHERE ID_PROVEEDOR = P_ID_PROVEEDOR) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El proveedor no existe en el sistema.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM PRODUCTO WHERE ID_PRODUCTO = P_ID_PRODUCTO) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no existe en el sistema';
    END IF;

    START TRANSACTION;

    INSERT INTO COMPRAPRODUCTO (ID_PROVEEDOR, ID_PRODUCTO, FECHA_ENTREGA, PRECIO_PACTADO)
    VALUES (P_ID_PROVEEDOR, P_ID_PRODUCTO, P_FECHA_ENTREGA, P_PRECIO_PACTADO);

    COMMIT;

    -- Al ser un id compuesto se devuelve el del proveedor;
    SET P_ID = P_ID_PROVEEDOR;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_EMPLEADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_EMPLEADO`(
    IN P_NOMBRE_USUARIO VARCHAR(50),
    IN P_CLAVE VARCHAR(100),
    IN P_ID_SUCURSAL INT,
    IN P_ID_SUPERVISOR INT, 
    IN P_NOMBRE_EMPLEADO VARCHAR(150),
    IN P_DUI_EMPLEADO VARCHAR(12),
    IN P_CORREO_ELECTRONICO VARCHAR(150),
    IN P_DIRECCION_EMPLEADO VARCHAR(200),
    IN P_TELEFONO_EMPLEADO VARCHAR(20),
    IN P_TIPO_EMPLEADO VARCHAR(20), 
    IN P_ROL_ESPECIFICO VARCHAR(20), 
    IN P_PORCENTAJE_COMISION DECIMAL(10,2),
    IN P_META_MENSUAL DECIMAL(10,2),
    IN P_NUMERO_CAJA INT,
    IN P_TURNO VARCHAR(30),
    OUT ID_GENERADO_OUT INT
)
BEGIN
    DECLARE V_ID_USUARIO INT;
    DECLARE V_ID_EMPLEADO INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET ID_GENERADO_OUT = -1; 
    END;

    SET ID_GENERADO_OUT = 0;

    VALIDACIONES: BEGIN
        IF P_NOMBRE_USUARIO IS NULL OR TRIM(P_NOMBRE_USUARIO) = '' OR
           P_CLAVE IS NULL OR TRIM(P_CLAVE) = '' OR
           P_NOMBRE_EMPLEADO IS NULL OR TRIM(P_NOMBRE_EMPLEADO) = '' OR
           P_DUI_EMPLEADO IS NULL OR TRIM(P_DUI_EMPLEADO) = '' OR
           P_ID_SUCURSAL IS NULL OR P_TIPO_EMPLEADO IS NULL OR
           P_ROL_ESPECIFICO IS NULL OR TRIM(P_ROL_ESPECIFICO) = '' THEN
            SET ID_GENERADO_OUT = -2; 
            LEAVE VALIDACIONES; 
        END IF;

        IF CHAR_LENGTH(TRIM(P_CLAVE)) < 4 THEN
            SET ID_GENERADO_OUT = -3; 
            LEAVE VALIDACIONES; 
        END IF;

        IF EXISTS (SELECT 1 FROM USUARIO WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO)) THEN
            SET ID_GENERADO_OUT = -4; 
            LEAVE VALIDACIONES; 
        END IF;

        IF EXISTS (SELECT 1 FROM EMPLEADO WHERE DUI_EMPLEADO = TRIM(P_DUI_EMPLEADO)) THEN
            SET ID_GENERADO_OUT = -5; 
            LEAVE VALIDACIONES; 
        END IF;

        IF UPPER(TRIM(P_ROL_ESPECIFICO)) NOT IN ('VENDEDOR', 'CAJERO', 'SUPERVISOR') THEN
            SET ID_GENERADO_OUT = -6;
            LEAVE VALIDACIONES;
        END IF;
    END VALIDACIONES;

    IF ID_GENERADO_OUT = 0 THEN
        START TRANSACTION;

            INSERT INTO USUARIO (NOMBRE_USUARIO, CLAVE)
            VALUES (TRIM(P_NOMBRE_USUARIO), P_CLAVE);
            
            SET V_ID_USUARIO = LAST_INSERT_ID();

            INSERT INTO EMPLEADO (
                ID_SUCURSAL, ID_SUPERVISOR, ID_USUARIO, NOMBRE_EMPLEADO, 
                DUI_EMPLEADO, CORREO_ELECTRONICO, DIRECCION_EMPLEADO, 
                TELEFONO_EMPLEADO, TIPO_EMPLEADO
            ) VALUES (
                P_ID_SUCURSAL, P_ID_SUPERVISOR, V_ID_USUARIO, TRIM(P_NOMBRE_EMPLEADO), 
                TRIM(P_DUI_EMPLEADO), TRIM(P_CORREO_ELECTRONICO), TRIM(P_DIRECCION_EMPLEADO), 
                TRIM(P_TELEFONO_EMPLEADO), P_TIPO_EMPLEADO
            );
            
            SET V_ID_EMPLEADO = LAST_INSERT_ID();

            IF UPPER(TRIM(P_ROL_ESPECIFICO)) = 'VENDEDOR' THEN
                INSERT INTO VENDEDOR (ID_EMPLEADO, PORCENTAJE_COMISION, META_MENSUAL)
                VALUES (V_ID_EMPLEADO, P_PORCENTAJE_COMISION, P_META_MENSUAL);

            ELSEIF UPPER(TRIM(P_ROL_ESPECIFICO)) = 'CAJERO' THEN
                INSERT INTO CAJERO (ID_EMPLEADO, NUMERO_CAJA, TURNO)
                VALUES (V_ID_EMPLEADO, P_NUMERO_CAJA, P_TURNO);
            END IF;

        COMMIT;
        SET ID_GENERADO_OUT = V_ID_EMPLEADO;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_FACTURA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_FACTURA`(
    IN P_ID_CLIENTE INT,
    IN P_ID_EMPLEADO INT,
    IN P_ID_SUCURSAL INT,
    IN P_METODO_PAGO VARCHAR(30),
    OUT P_ID_FACTURA INT
)
BEGIN
    DECLARE V_NUMERO_FACTURA VARCHAR(20);
    DECLARE V_NUMERO_PROVISIONAL VARCHAR(20);

    -- Se inicializa el identificador de salida
    SET P_ID_FACTURA = NULL;

    -- Se valida que el cliente exista y esté activo
    IF NOT EXISTS (SELECT 1 FROM CLIENTE WHERE ID_CLIENTE = P_ID_CLIENTE AND ESTADO_CLIENTE = 'Activo') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente no existe o está inactivo.';
    END IF;

    -- El cliente debe pertenecer a un tipo definido (natural o juridico)
    IF NOT EXISTS (SELECT 1 FROM CLIENTENATURAL WHERE ID_CLIENTE = P_ID_CLIENTE)
       AND NOT EXISTS (SELECT 1 FROM CLIENTEJURIDICO WHERE ID_CLIENTE = P_ID_CLIENTE) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente debe ser natural o juridico.';
    END IF;

    -- Se valida que el empleado exista
    IF NOT EXISTS (SELECT 1 FROM EMPLEADO WHERE ID_EMPLEADO = P_ID_EMPLEADO) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El empleado no existe.';
    END IF;

    -- Se valida que la sucursal exista
    IF NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL = P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La sucursal no existe.';
    END IF;

    -- Se valida el método de pago
    IF P_METODO_PAGO IS NULL OR P_METODO_PAGO NOT IN ('Efectivo', 'Tarjeta', 'Transferencia', 'Credito Corporativo', 'Credito Personal') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El método de pago no es válido.';
    END IF;

    -- Se valida que el crédito personal sea para un cliente natural
    IF P_METODO_PAGO = 'Credito Personal' AND NOT EXISTS (SELECT 1 FROM CLIENTENATURAL WHERE ID_CLIENTE = P_ID_CLIENTE) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito personal requiere un cliente natural.';
    END IF;

    -- Se valida que el crédito corporativo sea para un cliente jurídico
    IF P_METODO_PAGO = 'Credito Corporativo' AND NOT EXISTS (SELECT 1 FROM CLIENTEJURIDICO WHERE ID_CLIENTE = P_ID_CLIENTE) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El crédito corporativo requiere un cliente jurídico.';
    END IF;

   -- Se asigna un número provisional a la factura para cumplir con not null de la factura
    SET V_NUMERO_PROVISIONAL = 'TEMPORAL';

    -- Se registra la factura con monto inicial de cero y número provisional mientras se genera el real
    INSERT INTO FACTURA (ID_CLIENTE, ID_EMPLEADO, ID_SUCURSAL, NUMERO_FACTURA, MONTO_TOTAL, METODO_PAGO)
    VALUES (P_ID_CLIENTE, P_ID_EMPLEADO, P_ID_SUCURSAL, V_NUMERO_PROVISIONAL, 0, P_METODO_PAGO);

    -- Se obtiene el identificador de la factura registrada
    SET P_ID_FACTURA = LAST_INSERT_ID();

    -- Se genera automáticamente el número definitivo de la factura en base a la inserción realizada
    SET V_NUMERO_FACTURA = CONCAT('FAC-', LPAD(P_ID_FACTURA, 6, '0'));

    -- Se actualiza la factura con su número definitivo
    UPDATE FACTURA 
    SET NUMERO_FACTURA = V_NUMERO_FACTURA 
    WHERE ID_FACTURA = P_ID_FACTURA;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_INVENTARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_INVENTARIO`(
    IN P_ID_PRODUCTO INT,
    IN P_ID_SUCURSAL INT,
    IN P_STOCK INT
)
BEGIN

    -- Se verifica que el producto exista
    IF NOT EXISTS (SELECT 1 FROM PRODUCTO WHERE ID_PRODUCTO=P_ID_PRODUCTO) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El producto indicado no existe.';
    END IF;

    -- Se verifica que el producto se encuentre activo
    IF NOT EXISTS (SELECT 1 FROM PRODUCTO WHERE ID_PRODUCTO=P_ID_PRODUCTO AND ESTADO_PRODUCTO='Activo') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El producto se encuentra inactivo.';
    END IF;

    -- Se verifica que la sucursal exista
    IF NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL=P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='La sucursal indicada no existe.';
    END IF;

    -- Se valida que el stock no sea negativo
    IF P_STOCK IS NULL OR P_STOCK<0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='La cantidad de inventario no puede ser negativa.';
    END IF;

    -- Se evita registrar dos veces el mismo producto en una sucursal
    IF EXISTS (SELECT 1 FROM INVENTARIO WHERE ID_PRODUCTO=P_ID_PRODUCTO AND ID_SUCURSAL=P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El producto ya tiene inventario registrado en esta sucursal.';
    END IF;

    INSERT INTO INVENTARIO (ID_PRODUCTO, ID_SUCURSAL, STOCK)
    VALUES (P_ID_PRODUCTO, P_ID_SUCURSAL, P_STOCK);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_LIMITE_CREDITO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_LIMITE_CREDITO`(
    IN P_ID_CLIENTE INT,
    IN P_ID_SUCURSAL INT,
    IN P_MONTO_LIMITE DECIMAL(10,2)
)
BEGIN

    -- Se verifica que el cliente exista y se encuentre activo
    IF NOT EXISTS (SELECT 1 FROM CLIENTE WHERE ID_CLIENTE=P_ID_CLIENTE AND ESTADO_CLIENTE='Activo') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El cliente no existe o se encuentra inactivo.';
    END IF;

    -- Se verifica que el cliente sea una persona natural
    IF NOT EXISTS (SELECT 1 FROM CLIENTENATURAL WHERE ID_CLIENTE=P_ID_CLIENTE) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El limite de credito personal solo aplica a clientes naturales.';
    END IF;

    -- Se verifica que la sucursal exista
    IF NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL=P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='La sucursal indicada no existe.';
    END IF;

    -- Se valida que el monto autorizado sea mayor que cero
    IF P_MONTO_LIMITE IS NULL OR P_MONTO_LIMITE<=0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El limite de credito debe ser mayor que cero.';
    END IF;

    -- Se comprueba que el cliente no tenga un limite registrado en esa sucursal
    IF EXISTS (SELECT 1 FROM LIMITECREDITOPERSONAL WHERE ID_CLIENTE=P_ID_CLIENTE AND ID_SUCURSAL=P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='El cliente ya tiene un limite de credito registrado en esta sucursal.';
    END IF;

    -- Se registra el limite de credito autorizado
    INSERT INTO LIMITECREDITOPERSONAL (ID_CLIENTE, ID_SUCURSAL, MONTOLIMITE)
    VALUES (P_ID_CLIENTE, P_ID_SUCURSAL, P_MONTO_LIMITE);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PRODUCTO`(
    IN P_ID_CATEGORIA INT,
    IN P_ID_SUCURSAL INT,
    IN P_NOMBRE_PRODUCTO VARCHAR(150),
    IN P_PRECIO_VENTA DECIMAL(10,2),
    IN P_STOCK INT,
    OUT P_ID_PRODUCTO INT
)
BEGIN
    DECLARE V_ID_PRODUCTO INT;

    -- Si ocurre un error, se deshacen todos los cambios
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Se valida que la categoria exista
    IF P_ID_CATEGORIA IS NULL OR NOT EXISTS (SELECT 1 FROM CATEGORIA WHERE ID_CATEGORIA = P_ID_CATEGORIA) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La categoria indicada no existe';
    END IF;

    -- Se valida el nombre del producto
    IF P_NOMBRE_PRODUCTO IS NULL OR TRIM(P_NOMBRE_PRODUCTO) = '' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre del producto es obligatorio';
    END IF;

    -- Se valida el precio de venta
    IF P_PRECIO_VENTA IS NULL OR P_PRECIO_VENTA <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El precio de venta debe ser mayor a cero';
    END IF;

    -- Se valida que la sucursal exista
    IF P_ID_SUCURSAL IS NULL OR NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL = P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La sucursal indicada no existe';
    END IF;

    -- Se valida el stock inicial
    IF P_STOCK IS NULL OR P_STOCK< 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El stock inicial no puede ser negativo';
    END IF;

    START TRANSACTION;

    INSERT INTO PRODUCTO (ID_CATEGORIA, NOMBRE_PRODUCTO, PRECIO_VENTA)
    VALUES (P_ID_CATEGORIA, TRIM(P_NOMBRE_PRODUCTO), P_PRECIO_VENTA);

    -- Se obtiene el identificador del producto registrado
    SET V_ID_PRODUCTO = LAST_INSERT_ID();
    
    CALL SP_REGISTRAR_INVENTARIO(V_ID_PRODUCTO, P_ID_SUCURSAL, P_STOCK);


    COMMIT;

    SET P_ID_PRODUCTO = V_ID_PRODUCTO;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PROMOCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROMOCION`(
    IN P_FECHA_INICIO DATE,
    IN P_FECHA_FIN DATE,
    IN P_PORCENTAJE_DESCUENTO DECIMAL(5,2),
    IN P_PRODUCTOS JSON,
    OUT P_ID_PROMOCION INT
)
BEGIN
    DECLARE V_ID_PRODUCTO INT;
    DECLARE V_CONTADOR INT DEFAULT 0;
    DECLARE V_TOTAL INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Se validan los datos de la promocion
    IF P_FECHA_INICIO IS NULL OR P_FECHA_FIN IS NULL OR P_PORCENTAJE_DESCUENTO IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe completar todos los campos de la promocion.';
    END IF;

    IF P_FECHA_FIN < P_FECHA_INICIO  THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de finalizacion no puede ser anterior a la fecha de inicio.';
    END IF;

    IF P_PORCENTAJE_DESCUENTO <= 0 OR P_PORCENTAJE_DESCUENTO > 100 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El porcentaje de descuento debe estar entre 0 y 100.';
    END IF;

    -- Se valida que se hayan seleccionado productos
    IF P_PRODUCTOS IS NULL OR JSON_TYPE(P_PRODUCTOS) <> 'ARRAY' OR JSON_LENGTH(P_PRODUCTOS) = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe seleccionar al menos un producto.';
    END IF;

    -- Se obtiene la cantidad de productos seleccionados, servira para los recorrido del while
    SET V_TOTAL = JSON_LENGTH(P_PRODUCTOS);

    START TRANSACTION;

    INSERT INTO PROMOCION (FECHA_INICIO, FECHA_FIN, PORCENTAJE_DESCUENTO)
    VALUES (P_FECHA_INICIO, P_FECHA_FIN, P_PORCENTAJE_DESCUENTO);

    SET P_ID_PROMOCION = LAST_INSERT_ID();

    WHILE V_CONTADOR < V_TOTAL DO

        -- Se obtiene el identificador del producto, con unsigned se hace que sea un número valido no negativo
        SET V_ID_PRODUCTO = CAST(JSON_UNQUOTE(JSON_EXTRACT(P_PRODUCTOS, CONCAT('$[', V_CONTADOR, ']'))) AS UNSIGNED);

        CALL SP_ASIGNAR_PRODUCTO_PROMOCION(P_ID_PROMOCION, V_ID_PRODUCTO);

        SET V_CONTADOR = V_CONTADOR + 1;

    END WHILE;

    COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROVEEDOR`(
in P_NOMBRE_PROVEEDOR VARCHAR(150),
in P_TELEFONO_PROVEEDOR VARCHAR(20),
in P_ESTADO_PROVEEDOR VARCHAR(50))
begin
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
insert into PROVEEDOR (NOMBRE_PROVEEDOR, TELEFONO_PROVEEDOR, ESTADO_PROVEEDOR)
VALUES(P_NOMBRE_PROVEEDOR, P_TELEFONO_PROVEEDOR, P_ESTADO_PROVEEDOR);
commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_SUCURSAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_SUCURSAL`(
 IN P_NOMBRE_SUCURSAL VARCHAR(200),
 IN P_PRESUPUESTO_SUCURSAL DECIMAL(15,2),
 IN P_DIRECCION_SUCURSAL VARCHAR(200),
 IN P_TELEFONO_SUCURSAL VARCHAR(20),
 IN P_ESTADO_SUCURSAL VARCHAR(50)
 )
BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;
    START TRANSACTION;
 INSERT INTO SUCURSAL (NOMBRE_SUCURSAL,PRESUPUESTO_SUCURSAL,DIRECCION_SUCURSAL,TELEFONO_SUCURSAL,ESTADO_SUCURSAL)
 VALUES( P_NOMBRE_SUCURSAL, P_PRESUPUESTO_SUCURSAL, P_DIRECCION_SUCURSAL, P_TELEFONO_SUCURSAL,P_ESTADO_SUCURSAL);
 COMMIT;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REPORTE_INVENTARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REPORTE_INVENTARIO`(
    IN P_ID_SUCURSAL INT
)
BEGIN

    -- Se valida que la sucursal exista cuando se especifica
    IF P_ID_SUCURSAL IS NOT NULL AND NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL = P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La sucursal indicada no existe.';
    END IF;

    -- Reporte de existencias de productos por sucursal
    SELECT P.ID_PRODUCTO, P.NOMBRE_PRODUCTO, C.NOMBRE_CATEGORIA, I.ID_SUCURSAL, S.NOMBRE_SUCURSAL, I.STOCK, P.PRECIO_VENTA, (I.STOCK * P.PRECIO_VENTA) AS VALOR_INVENTARIO, P.ESTADO_PRODUCTO
    FROM INVENTARIO I
    INNER JOIN PRODUCTO P ON P.ID_PRODUCTO = I.ID_PRODUCTO
    INNER JOIN CATEGORIA C ON C.ID_CATEGORIA = P.ID_CATEGORIA
    INNER JOIN SUCURSAL S ON S.ID_SUCURSAL = I.ID_SUCURSAL
    WHERE (P_ID_SUCURSAL IS NULL OR I.ID_SUCURSAL = P_ID_SUCURSAL)
    ORDER BY S.NOMBRE_SUCURSAL, C.NOMBRE_CATEGORIA, P.NOMBRE_PRODUCTO;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REPORTE_VENTAS_POR_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REPORTE_VENTAS_POR_CATEGORIA`(
    IN P_FECHA_INICIO DATE,
    IN P_FECHA_FIN DATE,
    IN P_ID_SUCURSAL INT
)
BEGIN

    -- Se valida el periodo seleccionado
    IF P_FECHA_INICIO IS NULL OR P_FECHA_FIN IS NULL OR P_FECHA_INICIO > P_FECHA_FIN THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe indicar un periodo de fechas válido.';
    END IF;

    -- Se valida que la sucursal exista cuando se especifica
    IF P_ID_SUCURSAL IS NOT NULL AND NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL = P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La sucursal indicada no existe.';
    END IF;

    -- Reporte de ventas agrupadas por categoría
    SELECT C.ID_CATEGORIA, C.NOMBRE_CATEGORIA, SUM(DF.CANTIDAD_DE_DETALLE) AS CANTIDAD_VENDIDA, SUM(DF.SUBTOTAL) AS TOTAL_VENTAS
    FROM DETALLEFACTURA DF
    INNER JOIN FACTURA F ON F.ID_FACTURA = DF.ID_FACTURA
    INNER JOIN PRODUCTO P ON P.ID_PRODUCTO = DF.ID_PRODUCTO
    INNER JOIN CATEGORIA C ON C.ID_CATEGORIA = P.ID_CATEGORIA
    WHERE F.FECHA_HORA >= P_FECHA_INICIO
      AND F.FECHA_HORA < DATE_ADD(P_FECHA_FIN, INTERVAL 1 DAY)
      AND F.ESTADO_FACTURA = 'Activa'
      AND (P_ID_SUCURSAL IS NULL OR F.ID_SUCURSAL = P_ID_SUCURSAL)
    GROUP BY C.ID_CATEGORIA, C.NOMBRE_CATEGORIA
    ORDER BY TOTAL_VENTAS DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REPORTE_VENTAS_POR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REPORTE_VENTAS_POR_PROVEEDOR`(
    IN P_FECHA_INICIO DATE,
    IN P_FECHA_FIN DATE,
    IN P_ID_SUCURSAL INT
)
BEGIN

    -- Se valida el periodo seleccionado
    IF P_FECHA_INICIO IS NULL OR P_FECHA_FIN IS NULL OR P_FECHA_INICIO > P_FECHA_FIN THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe indicar un periodo de fechas válido.';
    END IF;

    -- Se valida que la sucursal exista cuando se especifica
    IF P_ID_SUCURSAL IS NOT NULL AND NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL = P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La sucursal indicada no existe.';
    END IF;

    -- Reporte de productos vendidos relacionados con proveedores
    SELECT PR.ID_PROVEEDOR, PR.NOMBRE_PROVEEDOR, SUM(DF.CANTIDAD_DE_DETALLE) AS CANTIDAD_VENDIDA, SUM(DF.SUBTOTAL) AS TOTAL_VENTAS_RELACIONADAS
    FROM PROVEEDOR PR
    INNER JOIN COMPRAPRODUCTO CP ON CP.ID_PROVEEDOR = PR.ID_PROVEEDOR
    INNER JOIN DETALLEFACTURA DF ON DF.ID_PRODUCTO = CP.ID_PRODUCTO
    INNER JOIN FACTURA F ON F.ID_FACTURA = DF.ID_FACTURA
    WHERE F.FECHA_HORA >= P_FECHA_INICIO
      AND F.FECHA_HORA < DATE_ADD(P_FECHA_FIN, INTERVAL 1 DAY)
      AND F.ESTADO_FACTURA = 'Activa'
      AND (P_ID_SUCURSAL IS NULL OR F.ID_SUCURSAL = P_ID_SUCURSAL)
    GROUP BY PR.ID_PROVEEDOR, PR.NOMBRE_PROVEEDOR
    ORDER BY TOTAL_VENTAS_RELACIONADAS DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REPORTE_VENTAS_POR_SUCURSAL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REPORTE_VENTAS_POR_SUCURSAL`(
    IN P_FECHA_INICIO DATE,
    IN P_FECHA_FIN DATE
)
BEGIN

    -- Se valida el periodo seleccionado
    IF P_FECHA_INICIO IS NULL OR P_FECHA_FIN IS NULL OR P_FECHA_INICIO > P_FECHA_FIN THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe indicar un periodo de fechas válido.';
    END IF;

    -- Reporte de ventas de todas las sucursales
    SELECT S.ID_SUCURSAL, S.NOMBRE_SUCURSAL, COUNT(F.ID_FACTURA) AS TOTAL_FACTURAS, COALESCE(SUM(F.MONTO_TOTAL), 0) AS TOTAL_VENTAS
    FROM SUCURSAL S
    INNER JOIN FACTURA F ON F.ID_SUCURSAL = S.ID_SUCURSAL
    WHERE F.FECHA_HORA >= P_FECHA_INICIO
      AND F.FECHA_HORA < DATE_ADD(P_FECHA_FIN, INTERVAL 1 DAY)
      AND F.ESTADO_FACTURA = 'Activa'
    GROUP BY S.ID_SUCURSAL, S.NOMBRE_SUCURSAL
    ORDER BY TOTAL_VENTAS DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REPORTE_VENTAS_POR_VENDEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REPORTE_VENTAS_POR_VENDEDOR`(
    IN P_FECHA_INICIO DATE,
    IN P_FECHA_FIN DATE,
    IN P_ID_SUCURSAL INT
)
BEGIN

    -- Se valida el periodo seleccionado
    IF P_FECHA_INICIO IS NULL OR P_FECHA_FIN IS NULL OR P_FECHA_INICIO > P_FECHA_FIN THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Debe indicar un periodo de fechas válido.';
    END IF;

    -- Se valida que la sucursal exista cuando se especifica
    IF P_ID_SUCURSAL IS NOT NULL AND NOT EXISTS (SELECT 1 FROM SUCURSAL WHERE ID_SUCURSAL = P_ID_SUCURSAL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La sucursal indicada no existe.';
    END IF;

    -- Reporte de ventas realizadas por vendedor
    SELECT V.ID_EMPLEADO, E.NOMBRE_EMPLEADO, F.ID_SUCURSAL, S.NOMBRE_SUCURSAL, COUNT(F.ID_FACTURA) AS TOTAL_FACTURAS, COALESCE(SUM(F.MONTO_TOTAL), 0) AS TOTAL_VENTAS
    FROM VENDEDOR V
    INNER JOIN EMPLEADO E ON E.ID_EMPLEADO = V.ID_EMPLEADO
    INNER JOIN FACTURA F ON F.ID_EMPLEADO = V.ID_EMPLEADO
    INNER JOIN SUCURSAL S ON S.ID_SUCURSAL = F.ID_SUCURSAL
    WHERE F.FECHA_HORA >= P_FECHA_INICIO
      AND F.FECHA_HORA < DATE_ADD(P_FECHA_FIN, INTERVAL 1 DAY)
      AND F.ESTADO_FACTURA = 'Activa'
      AND (P_ID_SUCURSAL IS NULL OR F.ID_SUCURSAL = P_ID_SUCURSAL)
    GROUP BY V.ID_EMPLEADO, E.NOMBRE_EMPLEADO, F.ID_SUCURSAL, S.NOMBRE_SUCURSAL
    ORDER BY TOTAL_VENTAS DESC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_RESTABLECER_CONTRASENA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RESTABLECER_CONTRASENA`(
    IN P_NOMBRE_USUARIO VARCHAR(50),
    IN NUEVA_CONTRASEÑA VARCHAR(100),
    OUT CONFIRMACION INTEGER
)
BEGIN 
    DECLARE V_EXISTE INTEGER DEFAULT 0;


    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET CONFIRMACION = -1; 
    END;

    SET nueva_contraseña = SHA2(nueva_contraseña, 256);

    IF NUEVA_CONTRASEÑA IS NULL OR TRIM(NUEVA_CONTRASEÑA) = '' OR
       P_NOMBRE_USUARIO IS NULL OR TRIM(P_NOMBRE_USUARIO) = '' THEN
        
        SET CONFIRMACION = -2; 

    ELSE
     
        SELECT COUNT(*) INTO V_EXISTE 
        FROM USUARIO 
        WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO);

        IF V_EXISTE = 0 THEN
            SET CONFIRMACION = -3; 
        ELSE
       
            UPDATE USUARIO
            SET CLAVE = NUEVA_CONTRASEÑA
            WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO);
            
            SET CONFIRMACION = 1; 
        END IF;
        
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_RETIRAR_PRODUCTO_PROMOCION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RETIRAR_PRODUCTO_PROMOCION`(
    IN P_ID_PROMOCION INT,
    IN P_ID_PRODUCTO INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Se valida que el producto este asignado a la promocion
    IF NOT EXISTS (SELECT 1 FROM PRODUCTOPROMOCION WHERE ID_PROMOCION = P_ID_PROMOCION AND ID_PRODUCTO = P_ID_PRODUCTO) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no esta asignado a esta promocion.';
    END IF;

    START TRANSACTION;

    DELETE FROM PRODUCTOPROMOCION
    WHERE ID_PROMOCION = P_ID_PROMOCION AND ID_PRODUCTO = P_ID_PRODUCTO;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VALIDAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VALIDAR_USUARIO`(
    IN P_NOMBRE_USUARIO VARCHAR(50),
    IN P_CLAVE VARCHAR(100),
    OUT CONFIRMACION INTEGER
)
PROCESO: BEGIN
    
    DECLARE V_COINCIDE INTEGER DEFAULT 0;
    DECLARE V_INTENTOS INTEGER DEFAULT 0;
    DECLARE V_ESTADO VARCHAR(20) DEFAULT '';
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET CONFIRMACION = -1; 
    END;

    SET p_clave = SHA2(p_clave, 256);
    
    IF P_NOMBRE_USUARIO IS NULL OR TRIM(P_NOMBRE_USUARIO) = '' OR P_CLAVE IS NULL OR TRIM(P_CLAVE) = '' THEN
        SET CONFIRMACION = -2;
        LEAVE PROCESO;
    END IF;

    SELECT INTENTOS_INGRESO, ESTADO_USUARIO
    INTO V_INTENTOS, V_ESTADO    
    FROM USUARIO
    WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO)
    LIMIT 1;

    IF V_ESTADO IS NULL OR V_ESTADO = '' THEN
        SET CONFIRMACION = -3;
        LEAVE PROCESO;
    END IF;

    IF V_ESTADO = 'Inactivo' OR V_ESTADO = 'Bloqueado' THEN
        SET CONFIRMACION = -5;
        LEAVE PROCESO;
    END IF;

    SELECT COUNT(*) INTO V_COINCIDE 
    FROM USUARIO
    WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO) 
    AND CLAVE = P_CLAVE;

    START TRANSACTION;

    IF V_COINCIDE > 0 THEN

        UPDATE USUARIO 
        SET INTENTOS_INGRESO = 0 
        WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO);

        SELECT S.ID_SUCURSAL INTO CONFIRMACION
        FROM USUARIO U 
        INNER JOIN EMPLEADO E ON U.ID_USUARIO = E.ID_USUARIO 
        INNER JOIN SUCURSAL S ON S.ID_SUCURSAL = E.ID_SUCURSAL
        WHERE U.NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO)
        LIMIT 1;

        COMMIT;
        LEAVE PROCESO;
    END IF;

    SET V_INTENTOS = V_INTENTOS + 1;
    
    IF V_INTENTOS >= 3 THEN
        UPDATE USUARIO 
        SET INTENTOS_INGRESO = V_INTENTOS, 
            ESTADO_USUARIO = 'Bloqueado' 
        WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO);

        SET CONFIRMACION = -5;
    ELSE
        UPDATE USUARIO 
        SET INTENTOS_INGRESO = V_INTENTOS 
        WHERE NOMBRE_USUARIO = TRIM(P_NOMBRE_USUARIO);

        SET CONFIRMACION = -4;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-14 18:47:20
