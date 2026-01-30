-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: copd_highflyers
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
-- Table structure for table `appointment_details`
--

DROP TABLE IF EXISTS `appointment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment_details` (
  `Appoinment_no` int NOT NULL,
  `Appoinment_date` date NOT NULL,
  `Patient_ID` varchar(20) DEFAULT NULL,
  `Doctor_prescription` text,
  `COPD_Test_recommend` varchar(50) DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `MC_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Appoinment_no`,`Appoinment_date`),
  KEY `Patient_ID` (`Patient_ID`),
  KEY `staff_id` (`staff_id`),
  KEY `MC_number` (`MC_number`),
  CONSTRAINT `appointment_details_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  CONSTRAINT `appointment_details_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `assistant` (`staff_id`),
  CONSTRAINT `appointment_details_ibfk_3` FOREIGN KEY (`MC_number`) REFERENCES `doctor` (`MC_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_details`
--

LOCK TABLES `appointment_details` WRITE;
/*!40000 ALTER TABLE `appointment_details` DISABLE KEYS */;
INSERT INTO `appointment_details` VALUES (1,'2025-02-17','P_0001','jhdkhkoijidnfuin','Do Test','ST_001','MC_0001'),(1,'2026-02-15','P_0001','kkdjivnfdvjknuinv','Not necessary','ST_001','MC_0001'),(2,'2025-02-10','P_0002','ihiojoidj9ijnfiuhfo','Not necessary','ST_002','MC_0002'),(2,'2026-03-19','P_0003','uihiugyug7uiuhik','Do Test','ST_003','MC_0003'),(3,'2025-08-13','P_0003','iusdhiucbijcbiuwhe','Do Test','ST_003','MC_0003'),(3,'2026-04-17','P_0004','hgiyhuuih09joij0','Not necessary','ST_004','MC_0004'),(4,'2025-09-16','P_0004','hvyubdcjknuihijnni','Do Test','ST_004','MC_0004');
/*!40000 ALTER TABLE `appointment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assistant`
--

DROP TABLE IF EXISTS `assistant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assistant` (
  `staff_id` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `place_of_work` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assistant`
--

LOCK TABLES `assistant` WRITE;
/*!40000 ALTER TABLE `assistant` DISABLE KEYS */;
INSERT INTO `assistant` VALUES ('ST_001','Saduni Nisanasala','sadunisana@gmail.com','Sadu@123','895643200V','0774567893','general hospital,colombo'),('ST_002','kumari perera','kumari2987@gmail.com','Kumari@123','984532346V','0754369976','teaching hospital,kurunegala'),('ST_003','Deshan maduranga','deshmadu34@gmail.com','Desh@123','794532907V','0714598655','ABC private medical center'),('ST_004','Pathum silva','silvapathum@gmail.com','Pathum@123','993450872V','0774131276','Medihelp hospital');
/*!40000 ALTER TABLE `assistant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `MC_number` varchar(20) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `NIC_no` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Place_of_work` varchar(100) DEFAULT NULL,
  `Contact_number` varchar(15) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Appoinment_count` int DEFAULT NULL,
  PRIMARY KEY (`MC_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('MC_0001','G.G.C.H.Samarasingha','9898345625v','ggsamarasingha@gmail.com','General hospital peradeniya','0710588277','Samara_23',10),('MC_0002','K.A.C.Kollonne','9796900012v','chamodinis@gmail.com','General hospital colombo','0774572673','Kol@34_62',5),('MC_0003','C.M.K Dasuni','9832445625v','dasuniggs@gmail.com','General hospital Kegalle','0838557069','Samara_24',15),('MC_0004','V.P Sanduni','8906900012v','sandunihjk@gmail.com','General hospital Galle','0902541465','Kol@34_63',10),('MC_0005','A.Y. Denuki','9898567825v','sdfadsgjtygha@gmail.com','General hospital gampaha','0966525861','Samara_25',15);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `Patient_ID` varchar(20) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Date_of_birth` date DEFAULT NULL,
  `NIC` varchar(20) DEFAULT NULL,
  `Phone_number` varchar(15) DEFAULT NULL,
  `Other_diagnosis_details` text,
  PRIMARY KEY (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('P_0001','Samith Gurusinghe','male','samith12@gmail.com','Samith','2000-03-17','789251678v','332276690','asthma'),('P_0002','raveena Ranasinghe','female','raveena@gmail.com','ravees','1990-10-09','199023444v','712276690','no'),('P_0003','Chathurika rithu','female','rithu1234@gmail.com','Rith99','2000-10-10','199675044v','338966690','pneumonia'),('P_0004','Anjana Sampath','male','anju67@gmail.com','ASE3456g','1998-10-11','196578932v','757806690','heartattack'),('P_0005','Galewela Chamodhi','female','chamma@gmail.com','hjgfffdri88','1997-10-12','187654264v','776690765','no');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `samples`
--

DROP TABLE IF EXISTS `samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `samples` (
  `Sample_ID` varchar(20) NOT NULL,
  `Test_id` varchar(20) NOT NULL,
  `Audio_URL` varchar(255) DEFAULT NULL,
  `Preprocess_URL` varchar(255) DEFAULT NULL,
  `Spectrogram_URL` varchar(255) DEFAULT NULL,
  `Probability_of_positive` decimal(10,6) DEFAULT NULL,
  `Probability_of_negative` decimal(10,6) DEFAULT NULL,
  `Sample_date` date DEFAULT NULL,
  `Sample_time` time DEFAULT NULL,
  `Patient_ID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Sample_ID`,`Test_id`),
  KEY `Test_id` (`Test_id`),
  KEY `Patient_ID` (`Patient_ID`),
  CONSTRAINT `samples_ibfk_1` FOREIGN KEY (`Test_id`) REFERENCES `test_record` (`Test_id`),
  CONSTRAINT `samples_ibfk_2` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `samples`
--

LOCK TABLES `samples` WRITE;
/*!40000 ALTER TABLE `samples` DISABLE KEYS */;
INSERT INTO `samples` VALUES ('S_1','T_0001','gkjgluliudidc','hgsfuhfjh','gfhgkjhj',0.600000,0.400000,'2025-02-07','07:12:00','P_0001'),('S_1','T_0002','uygsiuh9ihi','gvvgs','xdxv,bj',0.400000,0.600000,'2025-02-10','10:12:00','P_0002'),('S_1','T_0003','hgiuhisiojoi','gfwfdf','fgxjxcgh',0.700000,0.300000,'2025-08-13','13:12:00','P_0003'),('S_1','T_0004','kjiijoissuygb','buycsvcjhbciu','fghffff',0.200000,0.800000,'2025-09-16','16:12:00','P_0004'),('S_2','T_0001','jgjhgindjoinc','ghgh','hutywr',0.700000,0.300000,'2025-02-07','08:12:00','P_0001'),('S_2','T_0002','uhdsiuhihijk','gsdggs','fffuygtdtdy',0.600000,0.400000,'2025-02-10','11:12:00','P_0002'),('S_2','T_0003','hiuhnknxnbn','dhgh','cfghkhgg',0.300000,0.700000,'2025-08-13','14:12:00','P_0003'),('S_2','T_0004','oijon9u809','jjo','fhs',0.000000,0.000000,'2025-09-16','17:12:00','P_0004'),('S_3','T_0001','hlkhjljiunkjn','hgdfhg','eretdtyf',0.300000,0.700000,'2025-02-07','09:12:00','P_0001'),('S_3','T_0002','fhgfjhghkjgljh','hh','hdfhj',0.000000,0.000000,'2025-02-11','12:12:00','P_0002'),('S_3','T_0003','jihsiunjncuidb','gdhry','cjjdrjd',0.800000,0.200000,'2025-08-13','15:12:00','P_0003'),('S_3','T_0004','uhsniuhjnijkn','tryur','jfkiheu',0.000000,0.000000,'2025-09-16','18:12:00','P_0004');
/*!40000 ALTER TABLE `samples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `samples_backup`
--

DROP TABLE IF EXISTS `samples_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `samples_backup` (
  `Sample_ID` varchar(20) NOT NULL,
  `Test_id` varchar(20) NOT NULL,
  `Audio_URL` varchar(255) DEFAULT NULL,
  `Preprocess_URL` varchar(255) DEFAULT NULL,
  `Spectrogram_URL` varchar(255) DEFAULT NULL,
  `Probability_of_positive` float DEFAULT NULL,
  `Probability_of_negative` float DEFAULT NULL,
  `Sample_date` date DEFAULT NULL,
  `Sample_time` time DEFAULT NULL,
  `Patient_ID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `samples_backup`
--

LOCK TABLES `samples_backup` WRITE;
/*!40000 ALTER TABLE `samples_backup` DISABLE KEYS */;
INSERT INTO `samples_backup` VALUES ('S_1','T_0001','gkjgluliudidc','jgkukljoijklmc','gfhgkjhjklj,mnm,',0.6,0.4,'2025-02-07','07:12:00','P_0001'),('S_1','T_0002','uygsiuh9ihi','jzhxizoijnzxn ','xdxhfgcmhv,bj',0.4,0.6,'2025-02-10','10:12:00','P_0002'),('S_1','T_0003','hgiuhisiojoi','hc87guashugc','fgxjxcghckyfkyu',0.7,0.3,'2025-08-13','13:12:00','P_0003'),('S_1','T_0004','kjiijoissuygb','buycsvcjhbciu','fghffffvjv,jh',0.2,0.8,'2025-09-16','16:12:00','P_0004'),('S_2','T_0001','jgjhgindjoinc','kljoijkmopm','gyuftydrdjdjf',0.7,0.3,'2025-02-07','08:12:00','P_0001'),('S_2','T_0002','uhdsiuhihijk','jhzuihzjniujnn','fffuygyugyftdtdy',0.6,0.4,'2025-02-10','11:12:00','P_0002'),('S_2','T_0003','hiuhnknxnbn','ayguhbxygcjn','cfghkhgtfdxmhg',0.3,0.7,'2025-08-13','14:12:00','P_0003'),('S_3','T_0001','hlkhjljiunkjn','niuxoijzxuybz','gdjfhgjhkjkjhg',0.3,0.7,'2025-02-07','09:12:00','P_0001'),('S_3','T_0003','jihsiunjncuidb','asgjhvjhzghjb','cjjdrjdytdykfj',0.8,0.2,'2025-08-13','15:12:00','P_0003');
/*!40000 ALTER TABLE `samples_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_record`
--

DROP TABLE IF EXISTS `test_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_record` (
  `Test_id` varchar(20) NOT NULL,
  `Sample_ID` varchar(20) NOT NULL,
  `Patient_ID` varchar(20) DEFAULT NULL,
  `Average_positive_probability` float DEFAULT NULL,
  `Average_negative_probability` float DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `record_start_time` time DEFAULT NULL,
  `record_end_time` time DEFAULT NULL,
  `staff_id` varchar(20) DEFAULT NULL,
  `Status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Test_id`,`Sample_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `test_record_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  CONSTRAINT `test_record_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `assistant` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_record`
--

LOCK TABLES `test_record` WRITE;
/*!40000 ALTER TABLE `test_record` DISABLE KEYS */;
INSERT INTO `test_record` VALUES ('T_0001','S_1','P_0001',0.9,0.1,'2025-02-07','07:12:00','07:13:00','ST_001','end'),('T_0001','S_2','P_0001',0.7,0.3,'2025-02-07','07:15:00','07:16:00','ST_001','end'),('T_0001','S_3','P_0001',0.6,0.4,'2025-02-07','07:18:00','07:19:00','ST_001','end'),('T_0002','S_1','P_0002',0.5,0.5,'2025-02-10','09:36:00','09:38:00','ST_002','end'),('T_0002','S_2','P_0002',0.8,0.2,'2025-02-10','09:40:00','09:41:00','ST_002','end'),('T_0003','S_1','P_0003',0.2,0.8,'2025-08-13','10:00:12','10:02:00','ST_003','end'),('T_0003','S_2','P_0003',0.3,0.7,'2025-08-13','10:07:34','10:09:00','ST_003','end'),('T_0003','S_3','P_0003',0.1,0.9,'2025-08-13','10:15:12','10:17:00','ST_003','end'),('T_0004','S_1','P_0004',0.4,0.6,'2025-09-16','07:12:00','07:14:00','ST_004','end');
/*!40000 ALTER TABLE `test_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-30 18:28:32
