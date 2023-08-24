-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `binding_details`
--

DROP TABLE IF EXISTS `binding_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `binding_details` (
  `Binding_id` int NOT NULL,
  `Binding_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Binding_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binding_details`
--

LOCK TABLES `binding_details` WRITE;
/*!40000 ALTER TABLE `binding_details` DISABLE KEYS */;
INSERT INTO `binding_details` VALUES (1,'MCGraw Hill'),(2,'BPB Publication');
/*!40000 ALTER TABLE `binding_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_details`
--

DROP TABLE IF EXISTS `book_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_details` (
  `ISBN_Code` int NOT NULL,
  `Book_Title` varchar(100) DEFAULT NULL,
  `Language` varchar(10) DEFAULT NULL,
  `Binding_id` int DEFAULT NULL,
  `No_copies_Actual` int DEFAULT NULL,
  `No_copies_current` int DEFAULT NULL,
  `Category_id` int DEFAULT NULL,
  `Publication_year` int DEFAULT NULL,
  PRIMARY KEY (`ISBN_Code`),
  KEY `Binding_ID_FK` (`Binding_id`),
  KEY `Category_id_fk` (`Category_id`),
  CONSTRAINT `Binding_ID_FK` FOREIGN KEY (`Binding_id`) REFERENCES `binding_details` (`Binding_id`),
  CONSTRAINT `Category_id_fk` FOREIGN KEY (`Category_id`) REFERENCES `category_details` (`Category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_details`
--

LOCK TABLES `book_details` WRITE;
/*!40000 ALTER TABLE `book_details` DISABLE KEYS */;
INSERT INTO `book_details` VALUES (1,'Programming concepts','English',2,20,15,2,2006);
/*!40000 ALTER TABLE `book_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower_details`
--

DROP TABLE IF EXISTS `borrower_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrower_details` (
  `Borrower_id` int NOT NULL,
  `Book_id` int DEFAULT NULL,
  `Borrower_from` date DEFAULT NULL,
  `Borrower_to` date DEFAULT NULL,
  `Actual_Return_Date` date DEFAULT NULL,
  `Issued_by` int DEFAULT NULL,
  PRIMARY KEY (`Borrower_id`),
  KEY `Book_id_fk` (`Book_id`),
  KEY `Issues_by_fk` (`Issued_by`),
  CONSTRAINT `Book_id_fk` FOREIGN KEY (`Book_id`) REFERENCES `book_details` (`ISBN_Code`),
  CONSTRAINT `Issues_by_fk` FOREIGN KEY (`Issued_by`) REFERENCES `staff_details` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower_details`
--

LOCK TABLES `borrower_details` WRITE;
/*!40000 ALTER TABLE `borrower_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrower_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_details`
--

DROP TABLE IF EXISTS `category_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_details` (
  `Category_id` int NOT NULL,
  `Category_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_details`
--

LOCK TABLES `category_details` WRITE;
/*!40000 ALTER TABLE `category_details` DISABLE KEYS */;
INSERT INTO `category_details` VALUES (1,'Database'),(2,'Programming Language');
/*!40000 ALTER TABLE `category_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine_payment`
--

DROP TABLE IF EXISTS `fine_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fine_payment` (
  `id` int NOT NULL,
  `Student_Id` varchar(20) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_amount` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `studend_id_fk` (`Student_Id`),
  CONSTRAINT `studend_id_fk` FOREIGN KEY (`Student_Id`) REFERENCES `student_details` (`Student_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine_payment`
--

LOCK TABLES `fine_payment` WRITE;
/*!40000 ALTER TABLE `fine_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `fine_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shelf_details`
--

DROP TABLE IF EXISTS `shelf_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shelf_details` (
  `Shelf_id` int NOT NULL,
  `Shelf_no` int DEFAULT NULL,
  `Floor_no` int DEFAULT NULL,
  PRIMARY KEY (`Shelf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelf_details`
--

LOCK TABLES `shelf_details` WRITE;
/*!40000 ALTER TABLE `shelf_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `shelf_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_details`
--

DROP TABLE IF EXISTS `staff_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_details` (
  `Staff_ID` int NOT NULL,
  `Staff_Name` varchar(50) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `Is_Admin` binary(1) DEFAULT NULL,
  `Designation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_details`
--

LOCK TABLES `staff_details` WRITE;
/*!40000 ALTER TABLE `staff_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_details`
--

DROP TABLE IF EXISTS `student_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_details` (
  `Student_Id` varchar(20) NOT NULL,
  `Student_Name` varchar(50) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Borrower_Id` int DEFAULT NULL,
  `Department` varchar(20) DEFAULT NULL,
  `Contact_Name` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Student_Id`),
  KEY `Borrower_id_fk` (`Borrower_Id`),
  CONSTRAINT `Borrower_id_fk` FOREIGN KEY (`Borrower_Id`) REFERENCES `borrower_details` (`Borrower_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_details`
--

LOCK TABLES `student_details` WRITE;
/*!40000 ALTER TABLE `student_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-28 22:44:23
