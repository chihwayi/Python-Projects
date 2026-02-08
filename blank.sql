-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: blankzimepms
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adverseeventtype`
--

DROP TABLE IF EXISTS `adverseeventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adverseeventtype` (
  `ID` int(11) NOT NULL,
  `AdverseEventName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adverseeventtype`
--

LOCK TABLES `adverseeventtype` WRITE;
/*!40000 ALTER TABLE `adverseeventtype` DISABLE KEYS */;
INSERT INTO `adverseeventtype` VALUES (1,'Pain(A-PA)'),(2,'Bleeding (A-BL)'),(3,'Anasthetic-related problem(A-AN)'),(4,'Damaged penis  (A-SD)'),(5,'Difficulty with placement (A-DP)'),(6,'Device malfunction (A-DM)');
/*!40000 ALTER TABLE `adverseeventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art_sqnumber`
--

DROP TABLE IF EXISTS `art_sqnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `art_sqnumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sqnumber` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_sqnumber`
--

LOCK TABLES `art_sqnumber` WRITE;
/*!40000 ALTER TABLE `art_sqnumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `art_sqnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basicvitals`
--

DROP TABLE IF EXISTS `basicvitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basicvitals` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Height` float DEFAULT NULL,
  `OPDNumber` varchar(255) DEFAULT NULL,
  `temperature` float(255,0) DEFAULT NULL,
  `BloodPressure` varchar(255) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `FunctionalStatus` int(11) DEFAULT NULL,
  `VisitDate` datetime DEFAULT NULL,
  `basicvitalscol` varchar(45) DEFAULT NULL,
  `test` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicvitals`
--

LOCK TABLES `basicvitals` WRITE;
/*!40000 ALTER TABLE `basicvitals` DISABLE KEYS */;
/*!40000 ALTER TABLE `basicvitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbs`
--

DROP TABLE IF EXISTS `cbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HTCNumber` varchar(255) DEFAULT NULL,
  `OPDNumber` varchar(255) DEFAULT NULL,
  `NationalID` varchar(255) DEFAULT NULL,
  `ArtNumber` varchar(45) DEFAULT NULL,
  `artRegimen` varchar(45) DEFAULT NULL,
  `DateFormCompleted` date DEFAULT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `religion` varchar(45) DEFAULT NULL,
  `highest EducationalLevel` varchar(45) DEFAULT NULL,
  `pseudoID` varchar(45) DEFAULT NULL,
  `selfIdGeder` varchar(45) DEFAULT NULL,
  `distOfBirth` varchar(45) DEFAULT NULL,
  `momName` varchar(45) DEFAULT NULL,
  `maritalStatus` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `districtOfResidence` varchar(45) DEFAULT NULL,
  `nationality` varchar(45) DEFAULT NULL,
  `RecentPositive` date DEFAULT NULL,
  `isPregnant` varchar(45) DEFAULT NULL,
  `isBreadfeeding` varchar(45) DEFAULT NULL,
  `infantFeedingMode` varchar(45) DEFAULT NULL,
  `siteOfDelivery` varchar(45) DEFAULT NULL,
  `GavidityOfMother` varchar(45) DEFAULT NULL,
  `SuspVictSexualAbuse` varchar(45) DEFAULT NULL,
  `EarlySexDebutMale` varchar(45) DEFAULT NULL,
  `EarlySexDebutFemale` varchar(45) DEFAULT NULL,
  `unProtectedSexWithMale` varchar(45) DEFAULT NULL,
  `unProtectedSexWithFemale` varchar(45) DEFAULT NULL,
  `sexWithSexWorker` varchar(45) DEFAULT NULL,
  `ExchangedSexMoney` varchar(45) DEFAULT NULL,
  `BeenPrison` varchar(45) DEFAULT NULL,
  `RecMedicalInjection` varchar(45) DEFAULT NULL,
  `Injectables` varchar(45) DEFAULT NULL,
  `RecBloodTranfusion` varchar(45) DEFAULT NULL,
  `STIHistory` varchar(45) DEFAULT NULL,
  `isMotherAlive` varchar(45) DEFAULT NULL,
  `motherMartalStatus` varchar(45) DEFAULT NULL,
  `momOARTnumber` varchar(45) DEFAULT NULL,
  `MomArtstatus` varchar(45) DEFAULT NULL,
  `MomHivTesting` varchar(45) DEFAULT NULL,
  `MomOtherRegimen` varchar(45) DEFAULT NULL,
  `surrogateMother` varchar(45) DEFAULT NULL,
  `ancbooking` varchar(45) DEFAULT NULL,
  `gaatbooking` varchar(45) DEFAULT NULL,
  `parityatbooking` varchar(45) DEFAULT NULL,
  `numberofancvisits` varchar(45) DEFAULT NULL,
  `sexmaleagedebut` varchar(45) DEFAULT NULL,
  `sexfemaleagedebut` varchar(45) DEFAULT NULL,
  `everBeenOnPrep` varchar(45) DEFAULT NULL,
  `everBeenOnAnyArtNotPrep` varchar(45) DEFAULT NULL,
  `currentlyOnART` varchar(45) DEFAULT NULL,
  `monthsRecentPositive` varchar(45) DEFAULT NULL,
  `datestoppedart` varchar(45) DEFAULT NULL,
  `poorbreastfeed` varchar(45) DEFAULT NULL,
  `otherriskfactors` varchar(345) DEFAULT NULL,
  `probablerouteoftransmission` varchar(345) DEFAULT NULL,
  `sexualabused` varchar(45) DEFAULT NULL,
  `unprotectedsexnocondom` varchar(45) DEFAULT NULL,
  `tatooedwithunsterilized` varchar(45) DEFAULT NULL,
  `otherrouteoftransmission` varchar(45) DEFAULT NULL,
  `sexualactive` varchar(45) DEFAULT NULL,
  `ContactOfIndexTest` varchar(45) DEFAULT NULL,
  `contactofindexcaseHTSnumber` varchar(45) DEFAULT NULL,
  `contactofindexcaseARTnumber` varchar(45) DEFAULT NULL,
  `contactofindexcaseUNIQnumber` varchar(45) DEFAULT NULL,
  `initiatedonart` varchar(45) DEFAULT NULL,
  `reasonNotInitiatedOnArt` varchar(45) DEFAULT NULL,
  `typeOfDelivery` varchar(45) DEFAULT NULL,
  `placeOfDelivery` varchar(45) DEFAULT NULL,
  `deliveredBy` varchar(45) DEFAULT NULL,
  `InfantProphylaxisDuration` varchar(45) DEFAULT NULL,
  `feedingMethod` varchar(45) DEFAULT NULL,
  `currentlyBF` varchar(45) DEFAULT NULL,
  `birthWeight` varchar(45) DEFAULT NULL,
  `gaAtDelivery` varchar(45) DEFAULT NULL,
  `feedingAgeCeased` varchar(45) DEFAULT NULL,
  `feedingDuration` varchar(45) DEFAULT NULL,
  `infantProphylaxis` varchar(45) DEFAULT NULL,
  `StaffMemberEntering` varchar(45) DEFAULT NULL,
  `StaffMemberTelephone` varchar(45) DEFAULT NULL,
  `StaffMemberEmail` varchar(45) DEFAULT NULL,
  `dateEnteredEpms` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `HTCNumber_UNIQUE` (`HTCNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbs`
--

LOCK TABLES `cbs` WRITE;
/*!40000 ALTER TABLE `cbs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbs_setupentrypoints`
--

DROP TABLE IF EXISTS `cbs_setupentrypoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cbs_setupentrypoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbs_setupentrypoints`
--

LOCK TABLES `cbs_setupentrypoints` WRITE;
/*!40000 ALTER TABLE `cbs_setupentrypoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `cbs_setupentrypoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbs_setupfacilitytype`
--

DROP TABLE IF EXISTS `cbs_setupfacilitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cbs_setupfacilitytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facilitytype` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbs_setupfacilitytype`
--

LOCK TABLES `cbs_setupfacilitytype` WRITE;
/*!40000 ALTER TABLE `cbs_setupfacilitytype` DISABLE KEYS */;
/*!40000 ALTER TABLE `cbs_setupfacilitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbs_setupserviceaccess`
--

DROP TABLE IF EXISTS `cbs_setupserviceaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cbs_setupserviceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `isHIV` int(8) NOT NULL,
  `isSyphilis` int(8) NOT NULL,
  `isARVTherapy` int(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbs_setupserviceaccess`
--

LOCK TABLES `cbs_setupserviceaccess` WRITE;
/*!40000 ALTER TABLE `cbs_setupserviceaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `cbs_setupserviceaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbs_setuptestkittypes`
--

DROP TABLE IF EXISTS `cbs_setuptestkittypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cbs_setuptestkittypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `progId` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbs_setuptestkittypes`
--

LOCK TABLES `cbs_setuptestkittypes` WRITE;
/*!40000 ALTER TABLE `cbs_setuptestkittypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cbs_setuptestkittypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cbs_tests`
--

DROP TABLE IF EXISTS `cbs_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cbs_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OPDNumber` varchar(255) NOT NULL,
  `HTCNumber` varchar(255) DEFAULT NULL,
  `recencyTesting` varchar(45) DEFAULT NULL,
  `recencyTesterName` varchar(45) DEFAULT NULL,
  `recencyTestingDate` date DEFAULT NULL,
  `recencyTestingResult` varchar(45) DEFAULT NULL,
  `recencyTestingNotDone` varchar(45) DEFAULT NULL,
  `dateHivDiagnosed` date DEFAULT NULL,
  `firstTestMethod` varchar(45) DEFAULT NULL,
  `firstTestResult` varchar(45) DEFAULT NULL,
  `SecondTestMethod` varchar(45) DEFAULT NULL,
  `SecondTestResult` varchar(45) DEFAULT NULL,
  `WhoStageAtNotification` varchar(45) DEFAULT NULL,
  `WhoStage` varchar(45) DEFAULT NULL,
  `CdCountTest` varchar(45) DEFAULT NULL,
  `CdCountResult` varchar(45) DEFAULT NULL,
  `CdCountPercentage` varchar(45) DEFAULT NULL,
  `CdCountTestDate` date DEFAULT NULL,
  `MotherViralloadFirstTest` varchar(45) DEFAULT NULL,
  `MotherViralloadFirstTestResult` varchar(45) DEFAULT NULL,
  `MotherViralloadFirstTestDate` date DEFAULT NULL,
  `MotherViralloadSecondTest` varchar(45) DEFAULT NULL,
  `MotherViralloadSecondTestResult` varchar(45) DEFAULT NULL,
  `MotherViralloadSecondTestDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cbs_tests`
--

LOCK TABLES `cbs_tests` WRITE;
/*!40000 ALTER TABLE `cbs_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `cbs_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `circumcisionreasontype`
--

DROP TABLE IF EXISTS `circumcisionreasontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `circumcisionreasontype` (
  `ID` int(11) NOT NULL,
  `CircumcisionReasonName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `circumcisionreasontype`
--

LOCK TABLES `circumcisionreasontype` WRITE;
/*!40000 ALTER TABLE `circumcisionreasontype` DISABLE KEYS */;
INSERT INTO `circumcisionreasontype` VALUES (1,'Partial HIV protection'),(2,'Sexual pleasure'),(3,'STI protection'),(4,'Medical '),(5,'Appearance'),(6,'Hygiene'),(7,'Cultural/ social'),(8,'Religious'),(99,'Other');
/*!40000 ALTER TABLE `circumcisionreasontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complainttype`
--

DROP TABLE IF EXISTS `complainttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complainttype` (
  `ID` int(11) NOT NULL,
  `ComplaintName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complainttype`
--

LOCK TABLES `complainttype` WRITE;
/*!40000 ALTER TABLE `complainttype` DISABLE KEYS */;
INSERT INTO `complainttype` VALUES (1,'Painful/ weak erection'),(2,'Swelling of the scrotum'),(3,'Pain on urination'),(4,'Urethral discharge'),(5,'Genital sore'),(6,'Difficulty in retracting the foreskin'),(99,'Other');
/*!40000 ALTER TABLE `complainttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosistype`
--

DROP TABLE IF EXISTS `diagnosistype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosistype` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DiagnosisName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosistype`
--

LOCK TABLES `diagnosistype` WRITE;
/*!40000 ALTER TABLE `diagnosistype` DISABLE KEYS */;
INSERT INTO `diagnosistype` VALUES (1,'Anaemia'),(2,'Cancer'),(3,'Hypertension'),(4,'Bleeding disorder'),(5,'Diabetes mellitus'),(6,'Peripheral vascular disease'),(7,'Heart condition'),(8,'Liver disease'),(9,'Kidney disease'),(10,'Thyroid disease');
/*!40000 ALTER TABLE `diagnosistype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `ID` int(11) NOT NULL,
  `ProvinceID` int(11) DEFAULT NULL,
  `DistrictName` varchar(255) DEFAULT NULL,
  `DistrictCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,7,'Harare','6'),(2,1,'Harare Urban','A'),(3,1,'Chitungwisa Urban','B'),(4,1,'Chitungwiza Hospital','C'),(5,1,'Harare Central Hospital','D'),(6,1,'Parirenyatwa','E'),(7,1,'Harare City Clinics','F'),(8,1,'Buhera','1'),(9,1,'Chimanimani','2'),(10,1,'Chipinge','3'),(11,1,'Makoni','4'),(12,1,'Mutare','5'),(13,1,'Mutasa','6'),(14,1,'Nyanga','7'),(15,1,'Mutare City','8'),(16,2,'Bindura','1'),(17,2,'Centenary','2'),(18,2,'Guruve','3'),(19,2,'Mazowe','4'),(20,2,'Mt. Darwin','5'),(21,2,'Rushinga','6'),(22,2,'Shamva','7'),(23,2,'Mbire','8'),(24,3,'Chikomba','1'),(25,3,'Goromonzi','2'),(26,3,'U.M.P','3'),(27,3,'Hwedza','4'),(28,3,'Marondera','5'),(29,3,'Mudzi','6'),(30,3,'Murewa','7'),(31,3,'Mutoko','8'),(32,3,'Seke','9'),(33,4,'Chegutu','1'),(34,4,'Hurungwe','2'),(35,4,'Kadoma','3'),(36,4,'Kariba','4'),(37,4,'Makonde','5'),(38,4,'Zvimba','6'),(39,5,'Binga','1'),(40,5,'Bubi','2'),(41,5,'Hwange','3'),(42,5,'Lupane','4'),(43,5,'Nkayi','5'),(44,5,'Tsholotsho','6'),(45,5,'Umguza','7'),(46,6,'Beitbridge','1'),(47,6,'Bulilima','2'),(48,6,'Gwanda','3'),(49,6,'Insiza','4'),(50,6,'Matobo','5'),(51,6,'Umzingwane','6'),(52,6,'Mangwe','7'),(53,7,'Chirumhanzu','1'),(54,7,'Gokwe North','2'),(55,7,'Gweru','3'),(56,7,'Kwekwe','4'),(57,7,'Mberengwa','5'),(58,7,'Shurugwi','6'),(59,7,'Zvishavane','7'),(60,7,'Gokwe South','8'),(61,8,'Bikita','1'),(62,8,'Chiredzi','2'),(63,8,'Chivi','3'),(64,8,'Gutu','4'),(65,8,'Masvingo','5'),(66,8,'Mwenezi','6'),(67,8,'Zaka','7'),(68,9,'Bulawayo (Rural)','1'),(69,9,'Bulawayo (Urban)','A'),(70,9,'Ingutsheni','B'),(71,9,'U.B.H.','C'),(72,9,'Mpilo Hospital','D'),(73,10,'Brine','1'),(74,11,'Brine','1');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility` (
  `ID` int(11) NOT NULL,
  `DistrictID` int(11) DEFAULT NULL,
  `ProvinceID` varchar(255) DEFAULT NULL,
  `FacilityName` varchar(255) DEFAULT NULL,
  `FacilityCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,6,'7','Harare hospital','5'),(2,6,'0','Arcadia P.C.C.','02'),(3,NULL,'0','Bank Street P.C.C.','03'),(4,NULL,'0','Belvedere F.H.C.','05'),(5,NULL,'0','Borrowdale F.H.C.','06'),(6,NULL,'0','Borrowdale P.C.C.','07'),(7,NULL,'0','Braeside F.H.C.','08'),(8,NULL,'0','Budiriro Polyclinic','09'),(9,NULL,'0','Mbuya Nehanda','0A'),(10,NULL,'0','Psychriatic Unit','0B'),(11,NULL,'0','Beatrice Rd.Infectio','0C'),(12,NULL,'0','Wilkins Infectious H','0D'),(13,NULL,'0','St.Annes','0E'),(14,NULL,'0','Avenues Clinic','0F'),(15,NULL,'0','Harare City All Clinics','0U'),(16,NULL,'0','Eastlea F.H.C.','10'),(17,NULL,'0','Glen Norah Satellite','11'),(18,NULL,'0','Glen Norah Polyclin.','12'),(19,NULL,'0','Glen View Polyclinic','13'),(20,NULL,'0','Glen View Satellite','14'),(21,NULL,'0','Greendale F.H.C.','15'),(22,NULL,'0','Hatcliffe F.H.C.','16'),(23,NULL,'0','Hatcliffe P.C.C.','17'),(24,NULL,'0','Highfield Polyclinic','18'),(25,NULL,'0','Kambuzuma Polyclinic','19'),(26,NULL,'0','Kuwadzana Polyclinic','20'),(27,NULL,'0','Mabelreign Satellite','21'),(28,NULL,'0','Mabvuku F.H.C.','22'),(29,NULL,'0','Mabvuku P.C.C.','23'),(30,NULL,'0','Marondera Polyclinic','24'),(31,NULL,'0','Matapi Clinic','25'),(32,NULL,'0','Mbare Hostels Clinic','26'),(33,NULL,'0','Mbare Polyclinic','27'),(34,NULL,'0','Mt.Pleasant P.C.C.','28'),(35,NULL,'0','Mufakose Polyclinic','29'),(36,NULL,'0','Parirenyatwa P.C.C.','30'),(37,NULL,'0','Queen Elisabeth Fhc.','31'),(38,NULL,'0','Rugare Clinic','32'),(39,NULL,'0','Rujeko Clinic','33'),(40,NULL,'0','Rutsanana Clinic','34'),(41,NULL,'0','Southerton P.C.C.','35'),(42,NULL,'0','Sunningdale F.H.C.','36'),(43,NULL,'0','Sunningdale P.C.C.','37'),(44,NULL,'0','Tafara Clinic','38'),(45,NULL,'0','Warren Park Polycli.','39'),(46,NULL,'0','Waterfalls F.H.C.','40'),(47,NULL,'0','Waterfalls P.C.C.','41'),(48,NULL,'0','Western Triangle Pcc','42'),(49,NULL,'0','Kg Six','43'),(50,NULL,'0','Seke South Clinic','01'),(51,NULL,'0','Seke North Clinic','02'),(52,NULL,'0','St.Mary\'s Clinic','03'),(53,NULL,'0','Zengeza Clinic','04'),(54,NULL,'0','South Medical Hospital','0B'),(55,NULL,'0','Chitungwiza Hospital','01'),(56,NULL,'0','Harare Cent Hosp','01'),(57,NULL,'0','Harare Hosp','07'),(58,NULL,'0','Harare  Hosp','0D'),(59,0,'0','Casualty','01'),(60,0,'0','Domestic Staff Clin.','02'),(61,0,'0','Family Planning','03'),(62,0,'0','Geriatric Centre','04'),(63,0,'0','G.M.O.','05'),(64,0,'0','O.P.D. (T)','06'),(65,0,'0','O.P.D. (Nt)','07'),(66,0,'0','Radiotherapy','08'),(67,0,'0','Sekuru Kaguvi','09'),(68,0,'0','Parirenyatwa','0E'),(69,0,'0','Staff Clinic','10'),(70,NULL,'0','Parirenyatwa Clinic','01'),(71,NULL,'0','Hatfield Clinic','02'),(72,NULL,'0','Arcadia Clinic','03'),(73,NULL,'0','Mabvuku Poly','04'),(74,NULL,'0','Highlands','05'),(75,NULL,'0','Mabvuku Satelite Clinic','06'),(76,NULL,'0','Borrowdale Clinic','07'),(77,NULL,'0','Mount Pleasant','08'),(78,NULL,'0','Hatcliffe Clinic','09'),(79,NULL,'0','Beatrice Road Hosp','0C'),(80,NULL,'0','Wilkins Hospital','0D'),(81,NULL,'0','Avondale Clinic','10'),(82,NULL,'0','Marlborough Satelite Clinic','11'),(83,NULL,'0','Mabelreign Satelite','12'),(84,NULL,'0','Rujeko Poly','13'),(85,NULL,'0','Belvedere Satelite','14'),(86,NULL,'0','Warren Park  Poly','15'),(87,NULL,'0','Kuwadzana Poly','16'),(88,NULL,'0','Kambuzuma Poly','17'),(89,NULL,'0','Southerton Clinic','18'),(90,NULL,'0','Highfield Poly','19'),(91,NULL,'0','Rutsanana Poly','20'),(92,NULL,'0','Western Triangle Clinic','21'),(93,NULL,'0','Glen Norah Satelite','22'),(94,NULL,'0','Glen View  Poly','23'),(95,NULL,'0','Glen View Satelite','24'),(96,NULL,'0','Mufakose Poly','25'),(97,NULL,'0','Budiriro Poly','26'),(98,NULL,'0','Mbare Poly ','27'),(99,NULL,'0','Matapi Clinic','28'),(100,NULL,'0','Mbare Hostels Clinic','29'),(101,NULL,'0','Sunningdale Clinic','30'),(102,NULL,'0','Waterfalls Clinic','31'),(103,NULL,'0','Hopley Clinic','32'),(104,NULL,'0','Private Institutions','33'),(105,1,'1','Betera R.H.C.','02'),(106,1,'1','Madzimbashuro R.H.C.','03'),(107,1,'1','Mombeyarara R.H.C.','04'),(108,1,'1','Murwira R.H.C.','05'),(109,1,'1','Zangama R.H.C.','06'),(110,1,'1','Buhera Hospital','0A'),(111,1,'1','Birchenough Bridge H','0B'),(112,1,'1','Murambinda Hospital','0C'),(113,1,'1','Nyashanu Hospital','0D'),(114,1,'1','Viriri Hospital','0E'),(115,1,'1','Mudawose','16'),(116,1,'1','Chimbudzi','17'),(117,1,'1','Garamwera','18'),(118,1,'1','Munyanyi','19'),(119,1,'1','Mudanda','24'),(120,1,'1','Bangure Clinic','25'),(121,1,'1','Chabata Clinic','26'),(122,1,'1','Chapanduka Clinic','27'),(123,1,'1','Chapwanya Clinic','28'),(124,1,'1','Chirozva Clinic','29'),(125,1,'1','Chiwenga Clinic','30'),(126,1,'1','Chiwese Clinic','31'),(127,1,'1','Gunura Clinic','32'),(128,1,'1','Gombe Clinic','33'),(129,1,'1','Mutepfe Clinic','34'),(130,1,'1','Mutiusinazita Clinic','35'),(131,1,'1','Muzokomba Clinic','36'),(132,1,'1','Nerutanga Clinic','37'),(133,1,'1','Rambanembasi Clinic','38'),(134,1,'1','Mumanyi R.H.C.','39'),(135,1,'1','Dorowa Clinic','75'),(136,2,'1','Bumba R.H.C.','01'),(137,2,'1','Changazi R.H.C.','02'),(138,2,'1','Chayamiti R.H.C.','03'),(139,2,'1','Chikukwa R.H.C.','04'),(140,2,'1','Nyahode Clinic','05'),(141,2,'1','Muchadziya R.H.C.','08'),(142,2,'1','Biriviri Hospital','0A'),(143,2,'1','Nyanyadzi Hospital','0B'),(144,2,'1','Mutambara Hospital','0C'),(145,2,'1','Rusitu Hospital','0D'),(146,2,'1','Chimanimani Hospital','0E'),(147,2,'1','Cashel Clinic','25'),(148,2,'1','Chakohwa Clinic','26'),(149,2,'1','Chikwakwa Clinic','27'),(150,2,'1','Gudyanga Clinic','29'),(151,2,'1','Mutsvangwa Clinic','30'),(152,2,'1','Ngorima Clinic','31'),(153,2,'1','Shinja Clinic','32'),(154,2,'1','Arda Rusitu Clinic','51'),(155,2,'1','Martin Forest','52'),(156,2,'1','Charter Clinic','61'),(157,2,'1','Chisengu Clinic','62'),(158,2,'1','Gwendingwe Clinic','63'),(159,2,'1','Roscommon Clinic','64'),(160,2,'1','Tarka Clinic','65'),(161,2,'1','Tilbury Clinic','66'),(162,3,'1','Chinyamukwakwa R.H.C','03'),(163,3,'1','Kopera R.H.C.','06'),(164,3,'1','Mabee R.H.C.','07'),(165,3,'1','Mahenye R.H.C.','09'),(166,3,'1','Chipinge Hospital','0A'),(167,3,'1','Chikore Hospital','0B'),(168,3,'1','Mt.Selinda Hospital','0C'),(169,3,'1','St Peters','0D'),(170,3,'1','Musiriswe R.H.C.','11'),(171,3,'1','Paidamoyo R.H.C.','12'),(172,3,'1','Tanganda R.H.C.','14'),(173,3,'1','Tongogara R.H.C.','15'),(174,3,'1','Tuzuka R.H.C.','16'),(175,3,'1','Z.R.P','17'),(176,3,'1','Chipinge Prisons Clinic','18'),(177,3,'1','Chibuwe Clinic','25'),(178,3,'1','Gumira Clinic','26'),(179,3,'1','Hwakwata Clinic','27'),(180,3,'1','Kondo Clinic','28'),(181,3,'1','Madhuko Clinic','29'),(182,3,'1','Manzvire Clinic','30'),(183,3,'1','Musani Clinic','31'),(184,3,'1','Mutandahwe Clinic','32'),(185,3,'1','Mutema Clinic','33'),(186,3,'1','Ngaone Clinic','34'),(187,3,'1','Rimbi Clinic','35'),(188,3,'1','Veneka Clinic','36'),(189,3,'1','Zamuchia Clinic','37'),(190,3,'1','Chichichi R.H.C.','38'),(191,3,'1','Chisuma R.H.C.','39'),(192,3,'1','Maparadza Clinic','40'),(193,3,'1','Chipangayi Clinic','45'),(194,3,'1','Chiriga Clinic','46'),(195,3,'1','Gaza Clinic','47'),(196,3,'1','Junction Gate Clinic','48'),(197,3,'1','Chipinge Town Clinic','49'),(198,3,'1','Tamandayi Clinic','50'),(199,3,'1','Arda Chisumbanje Clinic','61'),(200,3,'1','Clearwater Clinic','62'),(201,3,'1','Jersey Clinic','64'),(202,3,'1','Midsave Clinic','65'),(203,3,'1','New Year\'s Gift Cli.','66'),(204,3,'1','Silver Stream Clinic','67'),(205,3,'1','Smalldeel Clinic','68'),(206,3,'1','Southdown Clinic','69'),(207,3,'1','Takwirira Clinic','70'),(208,3,'1','Ratelshoek Clinic','71'),(209,3,'1','Zona Clinic','72'),(210,3,'1','Gwenzi Clinic','90'),(211,4,'1','Bamba R.H.C.','01'),(212,4,'1','Chikobvore R.H.C.','02'),(213,4,'1','Chinhenga R.H.C.','03'),(214,4,'1','Chinyika I R.H.C.','04'),(215,4,'1','Chinyika Ii R.H.C.','05'),(216,4,'1','Chinyudze R.H.C.','06'),(217,4,'1','Groobi Spring R.H.C.','07'),(218,4,'1','Gowakowa R.H.C.','09'),(219,4,'1','Rusape Hospital','0A'),(220,4,'1','Weya Hospital','0B'),(221,4,'1','Makoni Hospital','0C'),(222,4,'1','Nedewedzo Hospital','0D'),(223,4,'1','St.Micheal\'s Tanda H','0E'),(224,4,'1','St.Therese\'s Hospita','0F'),(225,4,'1','Katsenga R.H.C.','10'),(226,4,'1','Maparura R.H.C','11'),(227,4,'1','Masvosva R.H.C.','12'),(228,4,'1','Matotwe R.H.C.','13'),(229,4,'1','Mayo I R.H.C.','14'),(230,4,'1','Mayo Ii R.H.C.','15'),(231,4,'1','Nyahowe R.H.C.','18'),(232,4,'1','Nyahukwe R.H.C','19'),(233,4,'1','Nyamukamani R.H.C.','20'),(234,4,'1','Chiduku Clinic','25'),(235,4,'1','Chikore Clinic','26'),(236,4,'1','Nyazura Clinic','27'),(237,4,'1','Dowa Clinic','28'),(238,4,'1','Dumbabwe Clinic','29'),(239,4,'1','Matsika Clinic','30'),(240,4,'1','Nyamidzi Clinic','31'),(241,4,'1','Mukamba Clinic','32'),(242,4,'1','Rukweza Clinic','33'),(243,4,'1','Tandi Clinic','34'),(244,4,'1','Toriro Clinic','35'),(245,4,'1','Tsanzaguru Clinic','36'),(246,4,'1','Era Mine Clinic','37'),(247,4,'1','Maurice Nyagumbo','38'),(248,4,'1','Mufusire','39'),(249,4,'1','Headlands Clinic','40'),(250,4,'1','Mubvurungwa Clinic','41'),(251,4,'1','Vengere Clinic','42'),(252,4,'1','Ringanayi','43'),(253,4,'1','Mavhudzi Clinic','44'),(254,4,'1','Chinyadza Clinic','45'),(255,4,'1','Nyamusosa Clinic','46'),(256,4,'1','Sangano','47'),(257,4,'1','Vengere Clinic','49'),(258,4,'1','Rusape Prison','74'),(259,4,'1','ZRP Rusape','75'),(260,4,'1','Inyathi Mine','76'),(261,4,'1','Mukuwapasi Rehab','81'),(262,4,'1','Mukuwapasi Clinic','82'),(263,4,'1','Nyazura Mission Clinic','91'),(264,4,'1','Arnoldine Mission Cl','92'),(265,5,'1','Bwizi R.H.C.','01'),(266,5,'1','Chiadzwa R.H.C.','02'),(267,5,'1','Mavhiza','03'),(268,5,'1','Gutaurare R.H.C.','04'),(269,5,'1','Gwindingwi R.H.C.','05'),(270,5,'1','Muromo R.H.C.','06'),(271,5,'1','Murowa R.H.C.','07'),(272,5,'1','Mt Zuma','09'),(273,5,'1','Mutare Provincial Hospital','0A'),(274,5,'1','Mutare Infectious Hospital','0B'),(275,5,'1','Sakubva Hospital','0C'),(276,5,'1','Sakubva Infectious Hospital','0D'),(277,5,'1','Marange Hospital','0E'),(278,5,'1','St.Andrew\'s Hospital','0F'),(279,5,'1','St.Joseph\'s Hospital','0G'),(280,5,'1','Nyagundi R.H.C.','11'),(281,5,'1','Nyamazura R.H.C.','12'),(282,5,'1','Zvipiripiri R.H.C.','13'),(283,5,'1','Vumba','15'),(284,5,'1','Z.R.P','16'),(285,5,'1','Chitora','18'),(286,5,'1','Matanda','20'),(287,5,'1','Leekuyl Takunda','21'),(288,5,'1','Army Dependent','23'),(289,5,'1','Arda Odzi','24'),(290,5,'1','Bakorenhema Clinic','25'),(291,5,'1','Bezely Bridge Clinic','26'),(292,5,'1','Chipfatsura Clinic','27'),(293,5,'1','Chitakatira Clinic','29'),(294,5,'1','Mambwere Clinic','30'),(295,5,'1','Masasi Clinic','31'),(296,5,'1','Mutare Prison Farm Clinic','32'),(297,5,'1','Mkwada Clinic','33'),(298,5,'1','Chitaka Clinic','34'),(299,5,'1','Mushunje Clinic','35'),(300,5,'1','Nzvenga Clinic','36'),(301,5,'1','Rowa Clinic','37'),(302,5,'1','Odzi Clinic','38'),(303,5,'1','Zimunya Clinic','39'),(304,5,'1','Zumbare Clinic','40'),(305,5,'1','Dora','41'),(306,5,'1','Chishingwi','43'),(307,5,'1','Chipendereke','44'),(308,5,'1','Burma Valley Clinic','45'),(309,5,'1','City Health Clinic','61'),(310,5,'1','Chikanga Clinic','62'),(311,5,'1','Dangamvura Clinic','63'),(312,5,'1','Sakubva Health Centre','64'),(313,5,'1','Florida Clinic','65'),(314,5,'1','Fern Valley Clinic','66'),(315,5,'1','Mapofu Clinic','84'),(316,5,'1','Chikwariro Clinic','91'),(317,6,'1','Chavhanga R.H.C.','01'),(318,6,'1','Rupinda R.H.C.','02'),(319,6,'1','Sherukuru R.H.C.','03'),(320,6,'1','Tsonzo R.H.C.','04'),(321,6,'1','Tsonzo Hospital','0A'),(322,6,'1','Bonda Hospital','0B'),(323,6,'1','Old Mutare Hospital','0C'),(324,6,'1','St.Barbara Hospital','0D'),(325,6,'1','Triashill Hospital','0E'),(326,6,'1','Hauna District Hospital','0F'),(327,6,'1','Chitombo Clinic','25'),(328,6,'1','Guta Clinic','26'),(329,6,'1','Hauna Clinic','27'),(330,6,'1','Mandeya Clinic','28'),(331,6,'1','Mpotedzi Clinic','29'),(332,6,'1','Mt.Jenya Clinic','30'),(333,6,'1','Mutasa Clinic','31'),(334,6,'1','Mwoyoweshumba Clinic','32'),(335,6,'1','Ngarura Clinic','33'),(336,6,'1','Ruda Clinic','34'),(337,6,'1','Rumbizi Clinic','35'),(338,6,'1','Sachisuko Clinic','36'),(339,6,'1','Sadziwa Clinic','37'),(340,6,'1','Sagambe Clinic','38'),(341,6,'1','Sahumani Clinic','39'),(342,6,'1','Sakupwanya Clinic','40'),(343,6,'1','Samanga Clinic','41'),(344,6,'1','Samaringa Clinic','42'),(345,6,'1','Zongoro Clinic','43'),(346,6,'1','Aberfoyle Tea Estate','61'),(347,6,'1','Chingamwe Clinic','62'),(348,6,'1','Eastern Highlands 1','63'),(349,6,'1','Eastern Highlands 5','64'),(350,6,'1','Haparari','65'),(351,6,'1','Forestry Clinic','66'),(352,6,'1','Katiyo Tea Estate','67'),(353,6,'1','Selbourne Clinic','68'),(354,6,'1','Drenane Clinic','69'),(355,6,'1','Imbeza Clinic','70'),(356,6,'1','Redwing Clinic','71'),(357,6,'1','Sheba Clinic','72'),(358,6,'1','Stapleford Clinic','73'),(359,6,'1','Eastern Highlands Pl Clinic','74'),(360,6,'1','Gatsi Clinic','91'),(361,6,'1','Honde Mission Clinic','92'),(362,6,'1','St.Augustines','93'),(363,6,'1','St.Peter\'s Mandeya','94'),(364,6,'1','Mapara','96'),(365,6,'1','Jombe','97'),(366,6,'1','Premier Central Clinic','98'),(367,7,'1','Dombo R.H.C.','02'),(368,7,'1','Fombe R.H.C.','03'),(369,7,'1','Gairezi R.H.C.','04'),(370,7,'1','Gotekote R.H.C.','05'),(371,7,'1','Nyarumvurwe R.H.C.','06'),(372,7,'1','Matize R.H.C.','07'),(373,7,'1','Nyamombe Camp R.H.C.','09'),(374,7,'1','Nyanga District Hosp','0A'),(375,7,'1','Avilla Hospital','0B'),(376,7,'1','Elim Hospital','0C'),(377,7,'1','Mt.Mellery Hospital','0D'),(378,7,'1','Regina Coeli Hospita','0E'),(379,7,'1','Nyautare R.H.C.','10'),(380,7,'1','Ruchera R.H.C.','11'),(381,7,'1','Chatindo Clinic','25'),(382,7,'1','Chiwarira Clinic','26'),(383,7,'1','Nyamaropa Clinic','27'),(384,7,'1','Kambudzi Clinic','29'),(385,7,'1','Nyatate Clinic','30'),(386,7,'1','Sabvure Clinic','31'),(387,7,'1','Tombo Clinic','32'),(388,7,'1','Mobile Clinic','45'),(389,7,'1','Nyangau Clinic','61'),(390,7,'1','Nyafaru Clinic','62'),(391,7,'1','Erim Forest Estate','63'),(392,7,'1','Nyangombe Clinic','91'),(393,7,'1','Claremont Estate Clinic','92'),(394,7,'1','Nyadowa Clinic','94'),(395,1,'2','Chiveso R.H.C.','01'),(396,1,'2','Muonwe R.H.C.','02'),(397,1,'2','Prison Clinic','03'),(398,1,'2','Bindura Polyclinic','04'),(399,1,'2','Z.R.P. Clinic','05'),(400,1,'2','Bindura Provincial','0A'),(401,1,'2','Musana Clinic','25'),(402,1,'2','Nyava Clinic','26'),(403,1,'2','Chiriseri Clinic','45'),(404,1,'2','Manhenga Clinic','46'),(405,1,'2','Rusununguko Clinic','61'),(406,1,'2','Chipadze Clinic','62'),(407,1,'2','Chiwaridzo Clinic','63'),(408,1,'2','Freda Rebecca','75'),(409,1,'2','Trojan Nickel Clinic','76'),(410,1,'2','Farm Health Scheme','77'),(411,1,'2','Foothills','78'),(412,1,'2','Busce Clinic','79'),(413,1,'2','Mupandira R H C','80'),(414,1,'2','ZNFPC Clinic','81'),(415,1,'2','Rutope Clinic','82'),(416,1,'2','Manga R H C','83'),(417,2,'2','Chawarura R.H.C.','01'),(418,2,'2','Hoya R.H.C.','02'),(419,2,'2','Machaya R.H.C.','03'),(420,2,'2','Muzarabani R.H.C.','04'),(421,2,'2','Chidikamwedzi Clinic','07'),(422,2,'2','Chinyani Clinic','08'),(423,2,'2','St.Albert\'s','0A'),(424,2,'2','Hwata Clinic','25'),(425,2,'2','Dambakurima Clinic','26'),(426,2,'2','David Nelson Clinic','45'),(427,2,'2','Farm Health Scheme','81'),(428,2,'2','Chadereka R.H.C','85'),(429,3,'2','Bvochora R.H.C.','01'),(430,3,'2','Masoka R.H.C','02'),(431,3,'2','Mashumbi Pools R.H.C','03'),(432,3,'2','Masomo R.H.C','04'),(433,3,'2','Negomo R.H.C.','05'),(434,3,'2','Nyamhondoro R.H.C.','06'),(435,3,'2','Shinje R.H.C.','07'),(436,3,'2','Mvirwi','0A'),(437,3,'2','Guruve','0B'),(438,3,'2','Chitsungo','0C'),(439,3,'2','Angwa R.H.C.','25'),(440,3,'2','Bakasa R.H.C.','26'),(441,3,'2','Bepura R.H.C','27'),(442,3,'2','Chapoto R.H.C.','28'),(443,3,'2','Chipuriro R.H.C.','29'),(444,3,'2','Gonono R.H.C.','30'),(445,3,'2','Kachuta R.H.C.','31'),(446,3,'2','Mahuwe R.H.C.','32'),(447,3,'2','Matsvitsi R.H.C.','33'),(448,3,'2','Gota R.H.C','34'),(449,3,'2','Musengezi R.H.C','35'),(450,3,'2','ZRP','36'),(451,3,'2','FHS','37'),(452,3,'2','Chikafa R.H.C','38'),(453,3,'2','Nyakapupu R.H.C','39'),(454,3,'2','Chirunya R.H.C','40'),(455,3,'2','Chidodo R.H.C','41'),(456,3,'2','Nyambudzi R.H.C','42'),(457,3,'2','Ruyamuro R.H.C','43'),(458,4,'2','Chinehasha R.H.C.','01'),(459,4,'2','Nyakudya R.H.C.','02'),(460,4,'2','Shutu R.H.C.','03'),(461,4,'2','Hatcliffe Extension Clinic','04'),(462,4,'2','Montgomery Clinic','05'),(463,4,'2','Donje Clinic','06'),(464,4,'2','Cranham Extension Clinic','07'),(465,4,'2','Adura Clinic','08'),(466,4,'2','Danbery Park Clinic','09'),(467,4,'2','Concession','0A'),(468,4,'2','Rosa','0B'),(469,4,'2','Howard','0C'),(470,4,'2','Mazowe Citrus','0D'),(471,4,'2','Mvurwi Hospital','0E'),(472,4,'2','Davaar Clinic','10'),(473,4,'2','Von Abo Clinic','11'),(474,4,'2','Bare Clinic','25'),(475,4,'2','Gunguwe Clinic','26'),(476,4,'2','Jingamvura Clinic','27'),(477,4,'2','Makope Clinic','28'),(478,4,'2','Mukodzongi Clinic','29'),(479,4,'2','Christon Bank Clinic','30'),(480,4,'2','Mvurwi Fhc','31'),(481,4,'2','Nzvimbo Clinic','32'),(482,4,'2','Belgownie Clinic','45'),(483,4,'2','Home Eden Clinic','46'),(484,4,'2','Tsungubvi Clinic','47'),(485,4,'2','Henderson Clinic','75'),(486,4,'2','Iron Duke Clinic','76'),(487,4,'2','Mazowe Mine Clinic','77'),(488,4,'2','Stories Clinic','78'),(489,4,'2','Hatcliffe','81'),(490,4,'2','Nemc','82'),(491,4,'2','Montgomery C.C','83'),(492,4,'2','Dambo Clinic','84'),(493,4,'2','Forrester Clinic','85'),(494,4,'2','Mazowe Secondary Clinic','86'),(495,5,'2','Dotito R.H.C.','01'),(496,5,'2','Kamutsenzere R.H.C.','02'),(497,5,'2','Mukumbura R.H.C.','03'),(498,5,'2','Nyamahobogo R.H.C.','04'),(499,5,'2','Pfunyangowu R.H.C.','05'),(500,5,'2','Tsakare R.H.C.','06'),(501,5,'2','Mutungagore Clinic','07'),(502,5,'2','Mutasa Clinic','08'),(503,5,'2','Chiburi Clinic','09'),(504,5,'2','Mt.Darwin','0A'),(505,5,'2','Karanda Hospital','0B'),(506,5,'2','Amanda Clinic','10'),(507,5,'2','Chahwanda R.H.C.','25'),(508,5,'2','Kaitano R.H.C.','26'),(509,5,'2','Nembire R.H.C.','27'),(510,5,'2','Pachanza Clinic','28'),(511,5,'2','Bveke Clinic','29'),(512,5,'2','ZRP Clinic','30'),(513,5,'2','ZPS Clinic','31'),(514,5,'2','Matope Clinic','32'),(515,5,'2','Bandimba R.H.C.','33'),(516,6,'2','Mukosa R.H.C.','01'),(517,6,'2','Mukonde R.H.C.','02'),(518,6,'2','Nhawa R.H.C.','03'),(519,6,'2','Rushinga R.H.C.','04'),(520,6,'2','Mazowe Camp','05'),(521,6,'2','Nyamatikiti Camp','06'),(522,6,'2','Chimandau R.H.C.','07'),(523,6,'2','Chimhanda Hospital','0A'),(524,6,'2','Mary Mount','0B'),(525,6,'2','Bungwe Clinic','25'),(526,6,'2','Rusambo Clinic','26'),(527,6,'2','Chimhanda Clinic','27'),(528,7,'2','Nyamaruro R.H.C.','01'),(529,7,'2','Chinduduma Primary','02'),(530,7,'2','Chishapa Clinic','03'),(531,7,'2','Goora R.H.C.','04'),(532,7,'2','Mupfurudzi R.H.C.','05'),(533,7,'2','Shamva District Hosp','0A'),(534,7,'2','Madziwa Rural Hospital','0B'),(535,7,'2','Wadzanai Clinic','12'),(536,7,'2','Bushu Clinic','25'),(537,7,'2','Chidembo Clinic','26'),(538,7,'2','Chihuri Clinic','27'),(539,7,'2','Mobile Clinic','45'),(540,7,'2','Madziwa Mine Clinic','75'),(541,7,'2','Shamwa Gold Mine','76'),(542,8,'2','Masoka R.H.C.','01'),(543,8,'2','Masomo R.H.C.','02'),(544,8,'2','Mushumbi R.H.C.','03'),(545,8,'2','Chitsungo Mission Hospital','0B'),(546,8,'2','Chapoto R.H.C.','20'),(547,8,'2','Angwa R.H.C.','21'),(548,8,'2','Chikafa R.H.C.','30'),(549,8,'2','Gonono R.H.C.','31'),(550,8,'2','Musengezi R.H.C.','32'),(551,8,'2','Mahuwe R.H.C.','33'),(552,8,'2','Chirunya R.H.C.','34'),(553,8,'2','Nyambudzi R.H.C.','35'),(554,8,'2','Chidodo R.H.C.','41'),(555,1,'3','Mufudziwakanaka R.H.C..','01'),(556,1,'3','Murezi R.H.C.','02'),(557,1,'3','Nyamhere R.H.C.','03'),(558,1,'3','Zvamatobwe R.H.C.','04'),(559,1,'3','Range R.H.C.','05'),(560,1,'3','Chivu Hospital','0A'),(561,1,'3','Nharira Hospital','0B'),(562,1,'3','Range Hospital','0C'),(563,1,'3','Sadza Hospital','0D'),(564,1,'3','Gandachibvuva Hospital','0E'),(565,1,'3','Bvumbura Clinic','25'),(566,1,'3','Gokomere Clinic','26'),(567,1,'3','Madamombe Clinic','27'),(568,1,'3','Manyene Clinic','28'),(569,1,'3','Masasa Clinic','29'),(570,1,'3','Mbiru Clinic','30'),(571,1,'3','Mushore Clinic','31'),(572,1,'3','Nhangembwe Clinic','32'),(573,1,'3','Pokoteke Clinic','33'),(574,1,'3','Rutanhira Clinic','34'),(575,1,'3','Shumba Clinic','35'),(576,1,'3','Unyetu Clinic','36'),(577,1,'3','Wazvaramhaka Clinic','37'),(578,1,'3','Chivu Clinic','45'),(579,1,'3','Gandami Clinic','46'),(580,1,'3','Lancshire Clinic','47'),(581,1,'3','Mutoro Clinic','48'),(582,1,'3','Wiltshire Clinic','49'),(583,1,'3','Daramombe Clinic','91'),(584,1,'3','Mwerahari Clinic','92'),(585,2,'3','Bosha R.H.C.','01'),(586,2,'3','Domboshava R.H.C.','02'),(587,2,'3','Mwanza R.H.C.','03'),(588,2,'3','Rusununguko Clinic','04'),(589,2,'3','Makumbe District Hospital','0A'),(590,2,'3','Ruwa Hospital','0C'),(591,2,'3','Chikwaka Hospital','0D'),(592,2,'3','Chinamhora Clinic','25'),(593,2,'3','Chinyika Clinic','26'),(594,2,'3','Kowowo Clinic','27'),(595,2,'3','Masukandoro Clinic','28'),(596,2,'3','Nyawure Clinic','29'),(597,2,'3','Pote Clinic','30'),(598,2,'3','Bromley Clinic','45'),(599,2,'3','Cranborne Clinic','46'),(600,2,'3','Henry John Rheimer Clinic','47'),(601,2,'3','Kubatsirana Clinic','48'),(602,2,'3','Rusike Clinic','49'),(603,2,'3','Ruwa Clinic','50'),(604,2,'3','Joan Rankini Clinic','51'),(605,2,'3','St Joseph Clinic','52'),(606,2,'3','Acturus Clinic','75'),(607,3,'3','Kafura R.H.C.','01'),(608,3,'3','Karimbika R.H.C.','02'),(609,3,'3','Sowa R.H.C.','03'),(610,3,'3','Marembera R.H.C.','04'),(611,3,'3','Mutawatawa District Hospital','0A'),(612,3,'3','Borera Clinic','25'),(613,3,'3','Chikuhwa Clinic','26'),(614,3,'3','Chipfunde Clinic','27'),(615,3,'3','Chitimbe Clinic','28'),(616,3,'3','Chitsungo Clinic','29'),(617,3,'3','Manyika Clinic','30'),(618,3,'3','Maramba Clinic','31'),(619,3,'3','Mashambanhaka Clinic','32'),(620,3,'3','Nhakiwa Clinic','33'),(621,3,'3','Nyakasoro Clinic','34'),(622,3,'3','Nyanzou Clinic','36'),(623,3,'3','Muskwe Clinic','37'),(624,3,'3','Dindi Clinic','91'),(625,4,'3','Garaba R.H.C.','01'),(626,4,'3','Goneso R.H.C.','02'),(627,4,'3','Goto R.H.C.','03'),(628,4,'3','Makanda R.H.C.','04'),(629,4,'3','Sengezi R.H.C.','05'),(630,4,'3','Hwedza Hospital','0A'),(631,4,'3','Mt. St.Mary\'s','0B'),(632,4,'3','Chigondo R.H.C.','25'),(633,4,'3','Masikana Clinic','26'),(634,4,'3','Mukamba R.H.C.','27'),(635,4,'3','Chikurumadziva Clinic','45'),(636,4,'3','Makarara Clinic','46'),(637,4,'3','Zviduri Clinic','47'),(638,5,'3','Border Church R.H.C.','01'),(639,5,'3','Chimbwanda R.H.C.','02'),(640,5,'3','Dimbiti R.H.C.','03'),(641,5,'3','Kushinga Pikelela','04'),(642,5,'3','Mudzimurema R.H.C.','05'),(643,5,'3','Winimbi R.H.C.','06'),(644,5,'3','Marondera Provincial Hospital','0A'),(645,5,'3','Chiota Hospital','0B'),(646,5,'3','Prisons Marondera','11'),(647,5,'3','Z.R.P. Clinic','12'),(648,5,'3','Masikana Clinic','25'),(649,5,'3','Marondera Rural Clinic','28'),(650,5,'3','Chipararwe Clinic','29'),(651,5,'3','Igava Clinic','45'),(652,5,'3','Marondera Clinic','46'),(653,5,'3','Dombotombo Clinic','61'),(654,5,'3','Nyameni Clinic','62'),(655,5,'3','Nyembanzvere Clinic','63'),(656,5,'3','Waddilove','86'),(657,5,'3','Rakodzi Clinic','88'),(658,6,'3','Chimukoko R.H.C.','01'),(659,6,'3','Chiunye R.H.C.','02'),(660,6,'3','Gozi R.H.C.','03'),(661,6,'3','Kondo R.H.C.','04'),(662,6,'3','Makaha R.H.C.','05'),(663,6,'3','Msarakufa R.H.C.','06'),(664,6,'3','Nyamanyoka R.H.C.','07'),(665,6,'3','Kotwa Hospital','0A'),(666,6,'3','St Pius Clinic','25'),(667,6,'3','Kapotese Clinic','26'),(668,6,'3','Kotwa Clinic','27'),(669,6,'3','Masenda Clinic','28'),(670,6,'3','Nyamapanda Clinic','29'),(671,6,'3','Nyamatawa Clinic','30'),(672,6,'3','Nyamukoho Clinic','31'),(673,6,'3','Shinga Clinic','32'),(674,6,'3','Suswe Clinic','33'),(675,6,'3','Chisvo Clinic','34'),(676,6,'3','Chikwizo Clinic','91'),(677,6,'3','Dendera Clinic','92'),(678,6,'3','Nyahuku Clinic','93'),(679,7,'3','Chitate R.H.C.','01'),(680,7,'3','Chitowa R.H.C.','02'),(681,7,'3','Jekwa R.H.C.','03'),(682,7,'3','Kadenge R.H.C.','04'),(683,7,'3','Madamombe R.H.C.','05'),(684,7,'3','Munamba R.H.C.','06'),(685,7,'3','Z.P.S Clinic','07'),(686,7,'3','ZRP Mrewa  clinic','08'),(687,7,'3','Murewa Hospital','0A'),(688,7,'3','St.Paul\'s Musami','0B'),(689,7,'3','Nhowe Mission Hospital','0C'),(690,7,'3','Murewa Polyclinic','22'),(691,7,'3','Chitowa 1 Clinic','23'),(692,7,'3','Chitowa 2 Clinic','24'),(693,7,'3','Dandara R.H.C.','25'),(694,7,'3','Dombwe R.H.C.','26'),(695,7,'3','Kadzere R.H.C.','27'),(696,7,'3','Nyamutumbu R.H.C.','28'),(697,7,'3','Shambamuto R.H.C.','29'),(698,7,'3','Craiglea Clinic','30'),(699,7,'3','Matututu Clinic','31'),(700,7,'3','Ngwerume clinic','32'),(701,7,'3','Macheke Clinic','45'),(702,7,'3','Virginia Clinic','46'),(703,7,'3','Waterloo Clinic','47'),(704,7,'3','Kambarami clinic','49'),(705,7,'3','Muchinjike clinic','50'),(706,7,'3','Nohoreka Clinic','71'),(707,7,'3','Goso clinic ','72'),(708,8,'3','Hoyuyu I R.H.C','01'),(709,8,'3','Hoyuyu Ii R.H.C.','02'),(710,8,'3','Kapondoro R.H.C.','03'),(711,8,'3','Katsukunya R.H.C.','04'),(712,8,'3','Kawere R.H.C.','05'),(713,8,'3','Mushimbo R.H.C.','06'),(714,8,'3','Nyamuzizi R.H.C.','07'),(715,8,'3','Nyadiri R.H.C.','08'),(716,8,'3','Kushimga R.H.C.','09'),(717,8,'3','Mutoko Hospital','0A'),(718,8,'3','Nyamuzuwe Hospital','0B'),(719,8,'3','Makosa Hospital','0C'),(720,8,'3','Nyadiri Mission Hospital','0D'),(721,8,'3','Luisa Guidotti','0E'),(722,8,'3','Nzira R.H.C.','10'),(723,8,'3','Mutoko Prison Clinic','11'),(724,8,'3','Epi Mobile','20'),(725,8,'3','ZNFPC Clinic','21'),(726,8,'3','Charehwa Clinic','25'),(727,8,'3','Matedza Clinic','26'),(728,8,'3','Mother Of Peace Clinic','27'),(729,8,'3','Mutemwa Leprosy Settl. Clinic','61'),(730,8,'3','Chindenga Clinic','91'),(731,8,'3','Kowo Clinic','98'),(732,8,'3','Kawazva Clinic','99'),(733,9,'3','Acton Reynolds R.H.C','01'),(734,9,'3','Zhakata R.H.C.','02'),(735,9,'3','ZRP Clinic','03'),(736,9,'3','Ringa Clinic','04'),(737,9,'3','Masasa R.H.C.','05'),(738,9,'3','Epi Unit','06'),(739,9,'3','Cbd Clinic','07'),(740,9,'3','Beatrice Rural Hospital','0A'),(741,9,'3','Kunaka Hospital','0B'),(742,9,'3','Charakupa Clinic','21'),(743,9,'3','Jonas Clinic','22'),(744,9,'3','Makanyazingwa Clinic','23'),(745,9,'3','Marirangwe Clinic','24'),(746,9,'3','Muda Clinic','25'),(747,9,'3','Epworth Polyclinic','26'),(748,9,'3','Christon Bank','45'),(749,9,'3','Arbor Acres Clinic','81'),(750,9,'3','Gilston Clinic','82'),(751,9,'3','Derbyshire Clinic','83'),(752,9,'3','Lanark Clinic','84'),(753,9,'3','Epworth Mission Clinic','90'),(754,1,'4','Chibero R.H.C.','01'),(755,1,'4','Gora R.H.C.','02'),(756,1,'4','Mbyuanehanda R.H.C.','03'),(757,1,'4','Monera R.H.C.','04'),(758,1,'4','Msengezi R.H.C.','05'),(759,1,'4','Musinami R.H.C.','06'),(760,1,'4','Chegutu Hospital','0A'),(761,1,'4','Mhondoro Hospital','0B'),(762,1,'4','Norton Selous Hospital','0C'),(763,1,'4','Chikara Clinic','25'),(764,1,'4','Chivero Clinic','26'),(765,1,'4','Mhondoro North Clin.','27'),(766,1,'4','Mupawose Clinic','28'),(767,1,'4','Rwizi Clinic','29'),(768,1,'4','Watyoka Clinic','30'),(769,1,'4','Chegutu Clinic','45'),(770,1,'4','Dombwe Clinic','46'),(771,1,'4','Kutanga-Utano Clinic','47'),(772,1,'4','Sandringham Clinic','48'),(773,1,'4','Selous Clinic','49'),(774,1,'4','David Whitehead','51'),(775,1,'4','Hunyani Pulp Clinic','52'),(776,1,'4','Pfupajena Munic Clinic','61'),(777,1,'4','Chinengundu Clinic','62'),(778,1,'4','Zmdc Clinic','76'),(779,1,'4','Lismore Clinic','77'),(780,1,'4','Homedale Clinic','78'),(781,1,'4','Mafuti Clinic','79'),(782,1,'4','Brunswick Clinic','80'),(783,1,'4','Dadle Hall','81'),(784,1,'4','CBDS','82'),(785,1,'4','Suri Suri Airbase Clinic','83'),(786,1,'4','Chegutu Hospital FCH','84'),(787,2,'4','Chirundu R.H.C.','01'),(788,2,'4','Chivende R.H.C.','02'),(789,2,'4','Marongora R.H.C.','04'),(790,2,'4','Masanga R.H.C.','05'),(791,2,'4','Zvipani R.H.C.','06'),(792,2,'4','Karoi Hospital','0A'),(793,2,'4','Hurungwe Hospital','0B'),(794,2,'4','Mwani Hospital','0C'),(795,2,'4','Chidamoyo Hospital','0D'),(796,2,'4','Chinhere Clinic','25'),(797,2,'4','Chundu Clinic','26'),(798,2,'4','Kasangarare Clinic','27'),(799,2,'4','Nyamakate Clinic','28'),(800,2,'4','Nyamhunga Clinic','29'),(801,2,'4','Helwin Clinic','45'),(802,2,'4','Hesketh Clinic','46'),(803,2,'4','Mashongwe Clinic','47'),(804,2,'4','Nyangoma Clinic','48'),(805,2,'4','Tengwe Clinic','49'),(806,2,'4','Karoi Static Clinic','61'),(807,2,'4','Lynx Clinic','75'),(808,2,'4','Kapfunde Clinic','91'),(809,2,'4','Karoi Hospital Mobile','92'),(810,2,'4','Hurungwe RCD Mobile','93'),(811,2,'4','Kasimure Clinic','94'),(812,2,'4','Dete','96'),(813,2,'4','Lanlory','97'),(814,2,'4','ZRP Clinic','98'),(815,2,'4','Doro','99'),(816,3,'4','Domboshava R.H.C.','02'),(817,3,'4','Donaine R.H.C.','03'),(818,3,'4','Geja R.H.C.','04'),(819,3,'4','Jompani R.H.C.','05'),(820,3,'4','Jondale Bunbe R.H.C.','06'),(821,3,'4','Kadoma Prison Clinic','07'),(822,3,'4','Muzvezve R.H.C.','08'),(823,3,'4','Nyabango R.H.C.','09'),(824,3,'4','Kadoma Hospital','0A'),(825,3,'4','Ngezi Hospital','0B'),(826,3,'4','Sanyati Hospital','0C'),(827,3,'4','St.Michael\'s Hospita','0D'),(828,3,'4','Battlefields Hospita','0E'),(829,3,'4','Rimuka Mch.','0F'),(830,3,'4','Nyamatani R.H.C.','10'),(831,3,'4','Vere R.H.C.','11'),(832,3,'4','Bururu Clinic','25'),(833,3,'4','Chirikiti Clinic','26'),(834,3,'4','Manyewe Clinic','27'),(835,3,'4','Murambwa Clinic','28'),(836,3,'4','Muwuyu Clinic','29'),(837,3,'4','Sanyati Clinic','30'),(838,3,'4','Associated Textile','31'),(839,3,'4','Chenjiri Clinic','45'),(840,3,'4','Ordolf Clinic','46'),(841,3,'4','Rubatsiro Clinic','47'),(842,3,'4','Turf Estate Clinic','48'),(843,3,'4','C.S.C. Satellite Clinic','52'),(844,3,'4','David Whitehead Cli.','53'),(845,3,'4','Kadoma Textiles Sat.','54'),(846,3,'4','Rimuka','61'),(847,3,'4','Waverly','62'),(848,3,'4','Ingezi','63'),(849,3,'4','Brompton Clinic','75'),(850,3,'4','Eiffel Flats Clinic','76'),(851,3,'4','Golden Valley Clinic','77'),(852,3,'4','Patchway Clinic','79'),(853,3,'4','Venice Clinic','80'),(854,3,'4','Jairos Jiri Clinic','81'),(855,3,'4','Population Services','83'),(856,3,'4','Mafindifindi','84'),(857,3,'4','Come Again Clinic','85'),(858,3,'4','Sanyati Outreach Cl','86'),(859,3,'4','Kadoma Outreach','88'),(860,3,'4','Chaigari Mine Clinic','89'),(861,4,'4','Gache-Gache R.H.C.','02'),(862,4,'4','Kanyati R.H.C.','03'),(863,4,'4','Mola Clinic','04'),(864,4,'4','Negande R.H.C.','05'),(865,4,'4','Kariba Hospital','0A'),(866,4,'4','Chalala Clinic','25'),(867,4,'4','Msampakaruwa Clinic','27'),(868,4,'4','Siyakobvu Clinic','28'),(869,4,'4','Nyamhunga','61'),(870,4,'4','Mahombekombe','62'),(871,5,'4','Chinhoyi Prison','01'),(872,5,'4','Chinhoyi Z.R.P.','02'),(873,5,'4','Chinhoyi (Teachers)','03'),(874,5,'4','Kamhonde R.H.C.','05'),(875,5,'4','Kenzamba R.H.C.','06'),(876,5,'4','Murereka R.H.C.','07'),(877,5,'4','Zumbara R.H.C.','08'),(878,5,'4','Chinhoyi Provincial Hospital','0A'),(879,5,'4','St.Rupert\'s Hospital','0B'),(880,5,'4','Alaska Mine Hospital','0C'),(881,5,'4','Mhangura Mine Hospital','0D'),(882,5,'4','Chinhoyi Prov Hosp Opd','0P'),(883,5,'4','Chinhoyi Prov Hosp Fch','0Q'),(884,5,'4','Hombwe Clinic','25'),(885,5,'4','Mukohwe Clinic','26'),(886,5,'4','Obva Clinic','27'),(887,5,'4','Doma Clinic','45'),(888,5,'4','Magog Farm Dispensar','46'),(889,5,'4','Matoranjera Clinic','47'),(890,5,'4','Umboe Clinic','48'),(891,5,'4','C.S.C.','51'),(892,5,'4','Chinoyi Clinic','61'),(893,5,'4','Chikonohono','62'),(894,5,'4','Alaska Clinic','75'),(895,5,'4','Damba Clinic','76'),(896,5,'4','Shacleton Clinic','77'),(897,6,'4','Chivhere R.H.C.','01'),(898,6,'4','Gwebi R.H.C.','02'),(899,6,'4','Banket Hospital Opd','0A'),(900,6,'4','Banket Hospital Mch','0B'),(901,6,'4','Darwendale Hospital','0C'),(902,6,'4','Raffingora Hospital','0D'),(903,6,'4','Father O\'hea','0E'),(904,6,'4','Mutorashanga Mine H.','0F'),(905,6,'4','Zvimba Hospital','0G'),(906,6,'4','Banket Outreach','0H'),(907,6,'4','Masiyarwa Clinic','25'),(908,6,'4','Chirau Clinic','26'),(909,6,'4','Jari Clinic','27'),(910,6,'4','Madzorera Clinic','28'),(911,6,'4','Mpumbu Clinic','29'),(912,6,'4','Ada Sisi Clinic','41'),(913,6,'4','Ayshire Clinic','42'),(914,6,'4','Kutama Clinic','43'),(915,6,'4','Kuwadzana Clinic','44'),(916,6,'4','Mt.Hampden Clinic','45'),(917,6,'4','Nyabira Clinic','46'),(918,6,'4','T.R.B. Clinic','47'),(919,6,'4','Trelawny Clinic','48'),(920,6,'4','Zowa Clinic','49'),(921,6,'4','Caesar Clinic','75'),(922,6,'4','Muriel Clinic','76'),(923,6,'4','Sutton Clinic','77'),(924,6,'4','Vanad Clinic','78'),(925,1,'5','Chunga R.H.C.','01'),(926,1,'5','Lubimbi R.H.C.','02'),(927,1,'5','Lusulu R.H.C.','03'),(928,1,'5','Muchesu R.H.C.','04'),(929,1,'5','Siansundu R.H.C.','05'),(930,1,'5','Chinego R.H.C.','08'),(931,1,'5','Binga Hospital','0A'),(932,1,'5','Siabuwa Hospital','0B'),(933,1,'5','Kariyangwe Hospital','0C'),(934,1,'5','Pashu Clinic','25'),(935,1,'5','Tinde Clinic','90'),(936,2,'5','Lukala R.H.C.','01'),(937,2,'5','Membeswana R.H.C.','02'),(938,2,'5','Inyathi Hospital','0A'),(939,2,'5','Siganda Clinic','26'),(940,2,'5','Balanda Clinic','27'),(941,2,'5','Majiji Clinic','28'),(942,2,'5','Isabella Clinic','56'),(943,3,'5','Chisuma R.H.C.','01'),(944,3,'5','Jambezi R.H.C.','02'),(945,3,'5','Kanyambizi R.H.C.','03'),(946,3,'5','Mwakandara R.H.C.','04'),(947,3,'5','Mwemba R.H.C.','05'),(948,3,'5','ZRP Victoria Falls Clinic','06'),(949,3,'5','Victoria Falls Hospital','0A'),(950,3,'5','Lukosi Hospital','0B'),(951,3,'5','Kamativi Tin Hospit.','0C'),(952,3,'5','Hwange Collery Hospital','0D'),(953,3,'5','Dete Clinic','26'),(954,3,'5','Dinde Clinic','27'),(955,3,'5','Lupote Clinic','30'),(956,3,'5','Main Camp Clinic','31'),(957,3,'5','Ndlovu Clinic','32'),(958,3,'5','Simangane Clinic','33'),(959,3,'5','Vic.Falls Clinic','34'),(960,3,'5','Mabale Clinic','35'),(961,3,'5','Robins Clinic','36'),(962,3,'5','St Patricks Hospital','37'),(963,3,'5','CBDS [ZNFPC]','39'),(964,3,'5','Hwange  Prison Clinic','53'),(965,3,'5','Hwange ZRP Clinic','55'),(966,3,'5','Zesa Dr  Stn Clinic','58'),(967,3,'5','Zesa Chibondo','59'),(968,3,'5','Zesa Inguminja Cli.','60'),(969,3,'5','Empumalanga','61'),(970,3,'5','Chinotimba','62'),(971,3,'5','Dete Clinic (Nrz)','81'),(972,3,'5','Ngumija Clinic (Nrz)','82'),(973,3,'5','N.R.Z. Surgery (Nrz)','83'),(974,3,'5','Lukunguni Clinic','91'),(975,4,'5','Dandanda R.H.C.','02'),(976,4,'5','Dongamuzi R.H.C.','03'),(977,4,'5','Gomoza R.H.C.','04'),(978,4,'5','Kanyandavu R.H.C.','05'),(979,4,'5','Lupane R.H.C.','06'),(980,4,'5','Lupaka Clinic','07'),(981,4,'5','Mobile A','08'),(982,4,'5','St.Paul\'s Hospital','0A'),(983,4,'5','St.Luke\'s Hospital','0B'),(984,4,'5','ZNFPC','10'),(985,4,'5','Jotsholo Clinic','26'),(986,4,'5','Mdlankuzi Clinic','27'),(987,4,'5','Fatima Mission','91'),(988,5,'5','Mateme R.H.C.','02'),(989,5,'5','Ngwaladi R.H.C.','03'),(990,5,'5','Sivalo R.H.C.','05'),(991,5,'5','Zenka R.H.C.','06'),(992,5,'5','Nkayi Hospital','0A'),(993,5,'5','Dakamela Hospital','0B'),(994,5,'5','Mbuma Hospital','0C'),(995,5,'5','Fanisoni Clinic','25'),(996,5,'5','Nesingwe Clinic','26'),(997,5,'5','Sebhumane Clinic','27'),(998,5,'5','Sikhobokhobo Clinic','28'),(999,5,'5','Zinyangeni Clinic','29'),(1000,5,'5','Nkayi Mobile','30'),(1001,5,'5','Mbuma Mobile','31'),(1002,5,'5','Guwe Clinic','32'),(1003,5,'5','Gwelutshena Clinic','33'),(1004,5,'5','Sesemba Clinic','34'),(1005,6,'5','Makhaza R.H.C.','03'),(1006,6,'5','Mlagisa R.H.C.','04'),(1007,6,'5','Mtshayeli R.H.C.','05'),(1008,6,'5','Sodaka R.H.C.','06'),(1009,6,'5','Tsholotsho Hospital','0A'),(1010,6,'5','Siphepha Hospital','0B'),(1011,6,'5','Phumula Hospital','0C'),(1012,6,'5','Bhubhudhe Clinic','25'),(1013,6,'5','Dlamini Clinic','26'),(1014,6,'5','Jimila Clinic','28'),(1015,6,'5','Madlangombe Clinic','29'),(1016,6,'5','Nkunzi Clinic','30'),(1017,6,'5','Tsholotsho Urban Clinic','31'),(1018,6,'5','Cbd [ZNFPC]','94'),(1019,6,'5','Kapane R.H.C.','96'),(1020,6,'5','Mpanedziba R.H.C.','97'),(1021,6,'5','Sikente R.H.C.','98'),(1022,7,'5','Igusi','03'),(1023,7,'5','Nyamandlovu Hospital','0A'),(1024,7,'5','Fingo','26'),(1025,7,'5','Ntabazinduna','29'),(1026,7,'5','Mbembesi','33'),(1027,7,'5','Clay Products','51'),(1028,7,'5','Fairbridge','52'),(1029,7,'5','Unicem','53'),(1030,7,'5','Imbizo Camp','65'),(1031,7,'5','T.G.Silundika','81'),(1032,7,'5','Ntabazinduna Zps Clinic','85'),(1033,7,'5','Ntabazinduna ZRP Clinic','88'),(1034,7,'5','St James Mission','91'),(1035,7,'5','Induna','97'),(1036,7,'5','Muntu Clinic','98'),(1037,7,'5','Khami Depend Clinic','99'),(1038,1,'6','Chikwalakwala R.H.C.','01'),(1039,1,'6','Chitulipasi R.H.C.','02'),(1040,1,'6','Dite R.H.C.','03'),(1041,1,'6','Majini R.H.C.','04'),(1042,1,'6','Prison Clinic','05'),(1043,1,'6','Shabwe R.H.C.','06'),(1044,1,'6','Z.N.A. Clinic','07'),(1045,1,'6','ZRP Clinic','08'),(1046,1,'6','Nottingham R.H.C.','09'),(1047,1,'6','Beitbridge Hospital','0A'),(1048,1,'6','Chasvingo Clinic','25'),(1049,1,'6','Dulibadzimu Clinic','26'),(1050,1,'6','Masera Clinic','27'),(1051,1,'6','Swereki R.H.C.','28'),(1052,1,'6','Shashe Clinic','29'),(1053,1,'6','Tongwe Clinic','30'),(1054,1,'6','Zezani Clinic','31'),(1055,1,'6','Makakabule Clinic','76'),(1056,1,'6','Chamnangana Clinic','77'),(1057,1,'6','N.R.Z Clinic','81'),(1058,2,'6','Village 13 R.H.C','01'),(1059,2,'6','Huwana R.H.C.','02'),(1060,2,'6','Makhulela R.H.C.','04'),(1061,2,'6','Matjinge R.H.C.','06'),(1062,2,'6','Nswazwi R.H.C','08'),(1063,2,'6','Lady Barring Hospita','0B'),(1064,2,'6','Lady Stanley Hospita','0C'),(1065,2,'6','Hingwe R.H.C','20'),(1066,2,'6','Bombodema Clinic','25'),(1067,2,'6','Madlambudzi Clinic','28'),(1068,2,'6','Ndiweni Clinic','30'),(1069,2,'6','Sikhathini Clinic','31'),(1070,2,'6','Solusi Clinic','91'),(1071,3,'6','Gungwe R.H.C.','01'),(1072,3,'6','Magwe R.H.C.','02'),(1073,3,'6','Nhwali R.H.C.','03'),(1074,3,'6','Prison Clinic','04'),(1075,3,'6','Simbumbumbu Clinic','05'),(1076,3,'6','Stainmore R.H.C.','06'),(1077,3,'6','Z.R.P. Clinic','07'),(1078,3,'6','Z.N.A. Clinic','08'),(1079,3,'6','ZNFPC','09'),(1080,3,'6','Gwanda Provincial Hospital','0A'),(1081,3,'6','Manama Hospital','0B'),(1082,3,'6','Mtshabezi Hospital','0C'),(1083,3,'6','Buvuma Clinic','25'),(1084,3,'6','Kafusi Clinic','26'),(1085,3,'6','Mashaba Clinic','27'),(1086,3,'6','Mzimuni Clinic','28'),(1087,3,'6','Ntalale Clinic','29'),(1088,3,'6','Sengezane Clinic','30'),(1089,3,'6','Phakama Clinic','62'),(1090,3,'6','Selonga Clinic','63'),(1091,3,'6','Blanket Clinic','76'),(1092,3,'6','Colleen-Bawn Clinic','77'),(1093,3,'6','Freda Clinic','78'),(1094,3,'6','Jessie Clinic','79'),(1095,3,'6','Vumbachikwe Clinic','80'),(1096,3,'6','J.Z.Moyo Clinic','81'),(1097,3,'6','Zimcan Clinic','82'),(1098,3,'6','Jm Polytech Clinic','83'),(1099,4,'6','Gwatemba R.H.C.','02'),(1100,4,'6','Insiza R.H.C.','03'),(1101,4,'6','Mabuze R.H.C.','04'),(1102,4,'6','Nkankezi R.H.C.','05'),(1103,4,'6','Nyamime R.H.C.','06'),(1104,4,'6','Sanale R.H.C.','07'),(1105,4,'6','Filabusi Hospital','0A'),(1106,4,'6','Shangani Hospital','0B'),(1107,4,'6','Avoca Hospital','0C'),(1108,4,'6','Wanezi Hospital','0D'),(1109,4,'6','Singwango Clinic','25'),(1110,4,'6','Zhulube Clinic','26'),(1111,4,'6','Singwambizi Clinic','27'),(1112,4,'6','Kombo Health Post','28'),(1113,4,'6','Epoch Clinic','76'),(1114,4,'6','Shangani Clinic','77'),(1115,5,'6','Natisa R.H.C.','01'),(1116,5,'6','Sankonjane R.H.C.','02'),(1117,5,'6','Homestead R.H.C.','03'),(1118,5,'6','Beula-Seula R.H.C.','04'),(1119,5,'6','Ekukhanyeni R.H.C.','05'),(1120,5,'6','Maphisa Hospital','0A'),(1121,5,'6','Kezi Hospital','0B'),(1122,5,'6','Matopo Hospital','0C'),(1123,5,'6','Tshelanyemba Hospital','0D'),(1124,5,'6','St.Joseph\'s Hospital','0E'),(1125,5,'6','Mbembeswane R.H.C.','25'),(1126,5,'6','Boomerange Health Post','27'),(1127,5,'6','Gulati Clinic','81'),(1128,5,'6','Matopo Clinic','91'),(1129,5,'6','Bazha Clinic','92'),(1130,5,'6','Masiye Camp Health Post','93'),(1131,6,'6','Kumbudzi R.H.C.','01'),(1132,6,'6','Mbizingwe R.H.C.','02'),(1133,6,'6','Z.N.A. Clinic','03'),(1134,6,'6','Esigodini Hospital','0A'),(1135,6,'6','Epi Mobile','20'),(1136,6,'6','Esibomvu Clinic','25'),(1137,6,'6','Habane Clinic','26'),(1138,6,'6','Mawabeni Clinic','27'),(1139,6,'6','Mhlalandlela Clinic','28'),(1140,6,'6','Nhlangano Clinic','29'),(1141,6,'6','Nswazi Clinic','30'),(1142,6,'6','Ntshamathe Clinic','31'),(1143,6,'6','Irrisvale Clinic','32'),(1144,6,'6','Mpisini Health Post','33'),(1145,6,'6','How Mine Clinic','76'),(1146,6,'6','Agriculture Inst.','81'),(1147,6,'6','ZNFPC','85'),(1148,7,'6','Ingwizi R.H.C','03'),(1149,7,'6','Marula Clinic','05'),(1150,7,'6','Mayobodo R.H.C','07'),(1151,7,'6','Bango R.H.C','09'),(1152,7,'6','Plumtree Hospital','0A'),(1153,7,'6','St Annes Mission Hosp Brunapeg','0D'),(1154,7,'6','Embakwe Mission Hosp','0E'),(1155,7,'6','Madabe Clinic','27'),(1156,7,'6','Mambale Clinic','29'),(1157,7,'6','Tshitshi Clinic','32'),(1158,7,'6','Sanzukwi Clinic','33'),(1159,7,'6','Dingumuzi Clinic','45'),(1160,7,'6','Empandeni Clinic','92'),(1161,7,'6','Plumtree Prison Clinic','93'),(1162,1,'7','Chizhou Clinic','01'),(1163,1,'7','Denhere Clinic','02'),(1164,1,'7','Lynwood Clinic','03'),(1165,1,'7','Nyautonge R.H.C.','04'),(1166,1,'7','Nyikavanhu Clinic','05'),(1167,1,'7','Mvuma Hospital','0A'),(1168,1,'7','Chilimanzi Hospital','0B'),(1169,1,'7','Driemfontein Hospita','0C'),(1170,1,'7','Holy Cross Hospital','0D'),(1171,1,'7','Muvonde Hospital','0E'),(1172,1,'7','St.Theressa Hospital','0F'),(1173,1,'7','Chengwena Clinic','25'),(1174,1,'7','Hama Clinic','26'),(1175,1,'7','Siyahokwe Clinic','27'),(1176,1,'7','Lalapanzi Clinic','45'),(1177,1,'7','Zamasco Clinic','51'),(1178,1,'7','Peak Mine Clinic','78'),(1179,1,'7','Athens Clinic','81'),(1180,1,'7','Mtao Forest Clinic','82'),(1181,1,'7','Central Estates Clinic','86'),(1182,2,'7','Gwanyika R.H.C.','01'),(1183,2,'7','Kadzidirire R.H.C.','02'),(1184,2,'7','Madzivazvido R.H.C.','03'),(1185,2,'7','Musadzi R.H.C.','04'),(1186,2,'7','Mashame R.H.C.','05'),(1187,2,'7','Mateta R.H.C.','06'),(1188,2,'7','Norah R.H.C.','07'),(1189,2,'7','Nyaje R.H.C.','08'),(1190,2,'7','Simchembu R.H.C.','09'),(1191,2,'7','Gokwe Hospital','0A'),(1192,2,'7','Chireya Hospital','0B'),(1193,2,'7','Kana Hospital','0C'),(1194,2,'7','Mutora Hospital','0D'),(1195,2,'7','Tsungai R.H.C.','10'),(1196,2,'7','Svisvi Clinic','11'),(1197,2,'7','Zhamba Clinic','12'),(1198,2,'7','Cheziya Clinic','13'),(1199,2,'7','To Phone','14'),(1200,2,'7','ZRP Camp Clinic','15'),(1201,2,'7','Chitave Clinic','16'),(1202,2,'7','Mateme Sda Clinic','17'),(1203,2,'7','Jahana Clinic','19'),(1204,2,'7','Vumba Clinic','20'),(1205,2,'7','Population Services Clinic','24'),(1206,2,'7','Chemahororo Clinic','25'),(1207,2,'7','Gawa Clinic','26'),(1208,2,'7','Gumunyu Clinic','27'),(1209,2,'7','Jiri/Ndoza Clinic','28'),(1210,2,'7','Kahobo Clinic','29'),(1211,2,'7','Krima Clinic','30'),(1212,2,'7','Kuwirirana Clinic','31'),(1213,2,'7','Mangidi Clinic','32'),(1214,2,'7','Manoti Clinic','33'),(1215,2,'7','Masuka Clinic','34'),(1216,2,'7','Msala Clinic','35'),(1217,2,'7','Musita Clinic','36'),(1218,2,'7','Nyamhunga Clinic','37'),(1219,2,'7','Sai Clinic','38'),(1220,2,'7','Tongwe Clinic','39'),(1221,2,'7','Zhomba Clinic','40'),(1222,2,'7','Mokoka Clinic','41'),(1223,2,'7','Denda Clinic','91'),(1224,2,'7','Goredema Clinic','92'),(1225,2,'7','Manyoni Clinic','93'),(1226,2,'7','Mtanke Clinic','94'),(1227,2,'7','Nenyunga Clinic','95'),(1228,2,'7','Sessami Clinic','96'),(1229,2,'7','Huchu Clinic','97'),(1230,2,'7','Rubatsiro Clinic','98'),(1231,3,'7','Gunde R.H.C.','01'),(1232,3,'7','Kabanga R.H.C.','02'),(1233,3,'7','Mangwandi R.H.C.','03'),(1234,3,'7','Masvori R.H.C.','04'),(1235,3,'7','Nkululeko R.H.C.','05'),(1236,3,'7','Ntabamhlope R.H.C.','06'),(1237,3,'7','Midlands State University','07'),(1238,3,'7','Mkoba Teachers Coll.','08'),(1239,3,'7','Five Maint.','09'),(1240,3,'7','Gweru Provincial H.','0A'),(1241,3,'7','Birchenough Hospital','0B'),(1242,3,'7','Chikwingwizha Hospital','0C'),(1243,3,'7','Infectious Diseases','0D'),(1244,3,'7','Guinea Fowl','0E'),(1245,3,'7','Thornhill Hospital','0F'),(1246,3,'7','Gweru Urban','0U'),(1247,3,'7','Zim.Military Academy','12'),(1248,3,'7','Connemara (Justice)','13'),(1249,3,'7','Whawha (Justice)','14'),(1250,3,'7','Fletcher High School','15'),(1251,3,'7','Z.R.P. Clinic','16'),(1252,3,'7','Outreach ','20'),(1253,3,'7','Vungu Rdc Clinic','21'),(1254,3,'7','Chiwundura Clinic','25'),(1255,3,'7','Maboleni Clinic','26'),(1256,3,'7','Madikani Clinic','27'),(1257,3,'7','Makepesi Clinic','28'),(1258,3,'7','Somabhula Clinic','45'),(1259,3,'7','Vungu Clinic','46'),(1260,3,'7','Nyama','47'),(1261,3,'7','V.D.R.C.  Mobile','48'),(1262,3,'7','Bata Clinic','51'),(1263,3,'7','C.S.C.','52'),(1264,3,'7','Dairy Market. Board','53'),(1265,3,'7','Zimasco Clinic','54'),(1266,3,'7','Zimbabwe Castings','56'),(1267,3,'7','Zimglass','57'),(1268,3,'7','Mkoba 1','62'),(1269,3,'7','Mkoba Polyclinic','63'),(1270,3,'7','Monomutapa','64'),(1271,3,'7','Medical Centre','65'),(1272,3,'7','Ivene','66'),(1273,3,'7','Senga','67'),(1274,3,'7','Totonga','68'),(1275,3,'7','Claybank (Ch.Welf.)','69'),(1276,3,'7','Dabuka Clinic (Nrz)','81'),(1277,3,'7','Kariba Clinic','82'),(1278,3,'7','Lalapanzi Clinic','83'),(1279,3,'7','Netherburn','84'),(1280,3,'7','Railways (Nrz)','85'),(1281,3,'7','Lower Gweru Clinic','91'),(1282,3,'7','St.Patrick\'s Clinic','92'),(1283,4,'7','Dendera R.H.C.','01'),(1284,4,'7','Donza R.H.C.','02'),(1285,4,'7','Mazebe R.H.C.','03'),(1286,4,'7','Msilahobe R.H.C.','04'),(1287,4,'7','Nyoni R.H.C.','05'),(1288,4,'7','Mayoka','09'),(1289,4,'7','Kwekwe Hospital','0A'),(1290,4,'7','Silobela Hospital','0B'),(1291,4,'7','Zhombe Hospital','0C'),(1292,4,'7','Torwood Hospital','0D'),(1293,4,'7','Kwekwe Urban','0U'),(1294,4,'7','Epi Team','20'),(1295,4,'7','Donjuan Clinic','25'),(1296,4,'7','Exchange Clinic','26'),(1297,4,'7','Malisa Joshepha Cli.','27'),(1298,4,'7','Malisa Zhombe Clinic','28'),(1299,4,'7','Ntabeni Clinic','29'),(1300,4,'7','Samambwa Clinic','30'),(1301,4,'7','Senkwasi Clinic','31'),(1302,4,'7','Sidakeni Clinic','32'),(1303,4,'7','Silobela Clinic','33'),(1304,4,'7','Simana Clinic','34'),(1305,4,'7','Globe And Phoenix','51'),(1306,4,'7','Rio Tinto Clinic','52'),(1307,4,'7','Mlezu Clinic','53'),(1308,4,'7','Torwood Clinic','54'),(1309,4,'7','Torsteel Clinic','55'),(1310,4,'7','Zimasco Clinic','56'),(1311,4,'7','Zrdc Clinic','57'),(1312,4,'7','Zisco Works Clinic','58'),(1313,4,'7','Redcliff','59'),(1314,4,'7','Amaveni','61'),(1315,4,'7','Mbizo A','62'),(1316,4,'7','Mbizo B','63'),(1317,4,'7','Rutendo','64'),(1318,4,'7','Sebakwe','65'),(1319,4,'7','Sherwood','66'),(1320,4,'7','Community Polyclinic','76'),(1321,4,'7','Jena Mines Clinic','77'),(1322,4,'7','Gaika Clinic','81'),(1323,4,'7','Medical Centre','83'),(1324,4,'7','Tiger Reef Clinic','84'),(1325,4,'7','Munyati Clinic','85'),(1326,4,'7','Al Davies Clinic','86'),(1327,4,'7','Z.R.P. Clinic','87'),(1328,4,'7','Gomora Clinic','88'),(1329,5,'7','Gwarawa R.H.C.','01'),(1330,5,'7','Mataga R.H.C.','02'),(1331,5,'7','Mavorovondo R.H.C.','03'),(1332,5,'7','Murongwe R.H.C.','04'),(1333,5,'7','Mwanezi R.H.C.','05'),(1334,5,'7','Vurasha R.H.C.','06'),(1335,5,'7','Wanezi  R.H.C.','07'),(1336,5,'7','Kotokwe R.H.C.','08'),(1337,5,'7','Mberengwa Hospital','0A'),(1338,5,'7','Jeka Hospital','0B'),(1339,5,'7','Masase Hospital','0C'),(1340,5,'7','Mnene Hospital','0D'),(1341,5,'7','Musume Hospital','0E'),(1342,5,'7','Bonda Clinic','25'),(1343,5,'7','Chabwira Clinic','26'),(1344,5,'7','Chidembeko Clinic','27'),(1345,5,'7','Chingezi Clinic','28'),(1346,5,'7','Makuwerere Clinic','29'),(1347,5,'7','Matedzi Clinic','30'),(1348,5,'7','Mazivofa Clinic','31'),(1349,5,'7','Mbahuru Clinic','32'),(1350,5,'7','Mketi Clinic','33'),(1351,5,'7','Negove Clinic','34'),(1352,5,'7','Ngezi Clinic','35'),(1353,5,'7','Ngungumbane Clinic','36'),(1354,5,'7','Svita Clinic','37'),(1355,5,'7','Mponjani Clinic','38'),(1356,5,'7','Mposi Clinic','39'),(1357,5,'7','Chiedza Clinic','40'),(1358,5,'7','Vutsanana Clinic','41'),(1359,5,'7','Buchwa Mine Clinic','76'),(1360,5,'7','C.Mine Clinic','77'),(1361,5,'7','Sandawana Clinic','78'),(1362,5,'7','Buchwa Camp Clinic','79'),(1363,5,'7','Mnene Outreach','86'),(1364,6,'7','Chikato R.H.C.','01'),(1365,6,'7','Chironde R.H.C.','02'),(1366,6,'7','Chitora R.H.C.','03'),(1367,6,'7','Gwanza R.H.C.','04'),(1368,6,'7','Marishongwe R.H.C.','05'),(1369,6,'7','Rusike R.H.C.','06'),(1370,6,'7','Tana R.H.C.','07'),(1371,6,'7','Zvarota R.H.C.','08'),(1372,6,'7','Svika R.H.C.','09'),(1373,6,'7','Shurugwi Hospital','0A'),(1374,6,'7','Zvamabande Hospital','0B'),(1375,6,'7','Chrome Mine Hospital','0C'),(1376,6,'7','Banga Clinic','25'),(1377,6,'7','Gundura Clinic','26'),(1378,6,'7','Mazibisa Clinic','27'),(1379,6,'7','Nhema Clinic','28'),(1380,6,'7','Tongogara Clinic','29'),(1381,6,'7','Jobolinko Clinic','45'),(1382,6,'7','Makusha Clinic','46'),(1383,6,'7','Rockford Clinic','47'),(1384,6,'7','Tokwe Clinic','48'),(1385,6,'7','Iron Mine Clinic','77'),(1386,6,'7','Peak Mine Clinic','78'),(1387,6,'7','Quarry Gold Mine','79'),(1388,6,'7','Hanke Clinic','91'),(1389,6,'7','Pakame Clinic','92'),(1390,7,'7','Maketo R.H.C.','01'),(1391,7,'7','Mandava R.H.C.','02'),(1392,7,'7','Matenda R.H.C.','03'),(1393,7,'7','Vugwi R.H.C.','04'),(1394,7,'7','Vukuzenzele R.H.C.','05'),(1395,7,'7','Zvishavane Hospital','0A'),(1396,7,'7','Lundi Hospital','0B'),(1397,7,'7','Shabane Mine Hospital','0C'),(1398,7,'7','Epi Mobile','20'),(1399,7,'7','Gudo Clinic','25'),(1400,7,'7','Mabasa Clinic','26'),(1401,7,'7','Mapanzure Clinic','27'),(1402,7,'7','Mrowa Clinic','28'),(1403,7,'7','Mtambi Clinic','29'),(1404,7,'7','Runde Mobile','32'),(1405,7,'7','Sabi Mine Clinic','76'),(1406,7,'7','Mimosa','77'),(1407,7,'7','Medical Centre','78'),(1408,7,'7','Zvishavane Prison','80'),(1409,7,'7','Bannockburn Clinic','81'),(1410,7,'7','Family Planning','82'),(1411,7,'7','Kandodo Clinic','83'),(1412,7,'7','Maglass Clinic','84'),(1413,7,'7','ZRP Clinic','85'),(1414,7,'7','Zvishavane Polyclinic','86'),(1415,8,'7','Gokwe Hosp','0A'),(1416,1,'8','Chirorwe R.H.C.','01'),(1417,1,'8','Dewure I R.H.C.','02'),(1418,1,'8','Dewure Ii R.H.C.','03'),(1419,1,'8','Mukanga R.H.C.','04'),(1420,1,'8','Mukore R.H.C.','05'),(1421,1,'8','Nyika R.H.C.','06'),(1422,1,'8','Ngorima R.H.C.','07'),(1423,1,'8','Bikita Rural Hospital','0A'),(1424,1,'8','Chikuku Rural Hospital','0B'),(1425,1,'8','Mashoko Hospital','0C'),(1426,1,'8','Silveira Hospital','0D'),(1427,1,'8','Bikita Epi Mobile','20'),(1428,1,'8','Chitasa Clinic','25'),(1429,1,'8','Hozvi Clinic','26'),(1430,1,'8','Mandara Clinic','27'),(1431,1,'8','Marozva Clinic','28'),(1432,1,'8','Odzi Clinic','29'),(1433,1,'8','Negovani Clinic','30'),(1434,1,'8','Murwira Clinic','31'),(1435,1,'8','Mungezi R.H.C.','32'),(1436,1,'8','Mutikizizi R.H.C.','33'),(1437,1,'8','Gangare R.H.C.','34'),(1438,1,'8','Gava R.H.C.','35'),(1439,1,'8','Bikita Minerals Clinic','76'),(1440,2,'8','Chambuta Clinic','01'),(1441,2,'8','Chilonga R.H.C.','02'),(1442,2,'8','Chizvirizvi R.H.C.','04'),(1443,2,'8','Dzavata R.H.C.','05'),(1444,2,'8','Gezani R.H.C.','06'),(1445,2,'8','Malipati R.H.C.','07'),(1446,2,'8','Mhlanguleni R.H.C.','08'),(1447,2,'8','Muteyo R.H.C.','09'),(1448,2,'8','Chiredzi Hospital','0A'),(1449,2,'8','Chikombedzi Hospital','0B'),(1450,2,'8','Hippo Valley Hospital','0C'),(1451,2,'8','Triangle Hospital','0D'),(1452,2,'8','Nyambange R.H.C.','10'),(1453,2,'8','Old Boli R.H.C.','12'),(1454,2,'8','Samu R.H.C.','13'),(1455,2,'8','Pahlela Clinic','14'),(1456,2,'8','Chiredzi Prison Clinic','17'),(1457,2,'8','Z.R.P.','18'),(1458,2,'8','Chiredzi Epi Mobile','20'),(1459,2,'8','Chibvedziva Clinic','25'),(1460,2,'8','Chipiwa Clinic','26'),(1461,2,'8','St.Joseph Clinic','27'),(1462,2,'8','Dumisa Clinic','28'),(1463,2,'8','Porepore Clinic','29'),(1464,2,'8','Rupangwana Clinic','30'),(1465,2,'8','Rutandare Clinic','31'),(1466,2,'8','Chitsa Ii Clinic','32'),(1467,2,'8','Tsovani Clinic','33'),(1468,2,'8','Makambe Clinic','34'),(1469,2,'8','Mkwasine Clinic','82'),(1470,2,'8','Z.S.A.','84'),(1471,2,'8','N.R.Z.','85'),(1472,2,'8','Damarakanaka Clinic','91'),(1473,2,'8','Chingele Clinic','92'),(1474,3,'8','Chigwikwi R.H.C.','02'),(1475,3,'8','Mandamabwe R.H.C.','03'),(1476,3,'8','Ngundu R.H.C.','04'),(1477,3,'8','Razi R.H.C.','05'),(1478,3,'8','Takavarasha R.H.C.','07'),(1479,3,'8','Nyahombe R.H.C.','08'),(1480,3,'8','Chivi District Hospital','0A'),(1481,3,'8','Chivi Rural Hospital','0B'),(1482,3,'8','Berejena Mission Hospital','0C'),(1483,3,'8','Chifedza Clinic','25'),(1484,3,'8','Davira Clinic','26'),(1485,3,'8','Madamombe Clinic','27'),(1486,3,'8','Shindi Satellite Cl','28'),(1487,4,'8','Mushaviri R.H.C.','01'),(1488,4,'8','Majada R.H.C.','02'),(1489,4,'8','Matizha R.H.C.','03'),(1490,4,'8','Mutema R.H.C.','04'),(1491,4,'8','Nemashakwe R.H.C.','05'),(1492,4,'8','Soti Source R.H.C.','06'),(1493,4,'8','Chitando R.H.C.','08'),(1494,4,'8','Zvavahera R.H.C.','09'),(1495,4,'8','Gutu Rural Hospital','0A'),(1496,4,'8','Chimombe Rural Hosp','0B'),(1497,4,'8','Chinyika Hospital','0D'),(1498,4,'8','Gutu Mission Hospital','0E'),(1499,4,'8','Cheshuro Clinic','25'),(1500,4,'8','Denhere Clinic','26'),(1501,4,'8','Dewure Clinic','27'),(1502,4,'8','Magombedze Clinic','28'),(1503,4,'8','Mazuru Clinic','29'),(1504,4,'8','Munyikwa Clinic','30'),(1505,4,'8','Nyazvidzi Clinic','31'),(1506,4,'8','Zinhata Clinic','32'),(1507,4,'8','Tirizi Satellite Cl','33'),(1508,4,'8','Chiwore R.H.C.','34'),(1509,4,'8','Magombedze Chitsa Clinic','35'),(1510,4,'8','Chipiri','36'),(1511,4,'8','Dambaro','37'),(1512,4,'8','Matomuse','38'),(1513,4,'8','Population Health Clinic','76'),(1514,4,'8','Serima Clinic','91'),(1515,4,'8','Mutero R.H.C.','92'),(1516,4,'8','Mukaro Mission Clinic','93'),(1517,5,'8','Alvord R.H.C.','01'),(1518,5,'8','Mukosi R.H.C.','02'),(1519,5,'8','Mushandike R.H.C.','03'),(1520,5,'8','Musvovi R.H.C.','04'),(1521,5,'8','Mutimurefu R.H.C.','05'),(1522,5,'8','Nemamwa R.H.C.','06'),(1523,5,'8','Nyikavanhu R.H.C.','07'),(1524,5,'8','Z.R.P. Clinic','08'),(1525,5,'8','41.Brigade Clinic','09'),(1526,5,'8','Masvingo Provincial','0A'),(1527,5,'8','Ngomahura Psy.Hospital','0B'),(1528,5,'8','Nyajena Rural Hospital','0C'),(1529,5,'8','Morgenster Mission','0D'),(1530,5,'8','Gokomere Mission Cl','0E'),(1531,5,'8','Gaths Mine Hospital','0F'),(1532,5,'8','Masv.Teach.Coll.Clinic','10'),(1533,5,'8','Masvingo Tech College Clinic','11'),(1534,5,'8','Sommerton R.H.C.','12'),(1535,5,'8','Masvingo Epi Mobile','20'),(1536,5,'8','Chakumbira Clinic','25'),(1537,5,'8','Chatikobo Clinic','26'),(1538,5,'8','Gundura Clinic','27'),(1539,5,'8','Mapanzure Clinic','28'),(1540,5,'8','Masvingo Prison  Clinic','29'),(1541,5,'8','Bere Clinic','30'),(1542,5,'8','Murinye Clinic','31'),(1543,5,'8','Rukovo Clinic','32'),(1544,5,'8','Shumba Clinic','33'),(1545,5,'8','Zimuto B.C. Clinic','34'),(1546,5,'8','Mucheke Clinic','35'),(1547,5,'8','Zano Clinic','36'),(1548,5,'8','Guwa R.H.C.','40'),(1549,5,'8','Gurajena R.H.C.','41'),(1550,5,'8','Stanmore R.H.C.','42'),(1551,5,'8','Zvamahonde','43'),(1552,5,'8','Ngomahuru R.H.C.','44'),(1553,5,'8','Renco Mine Clinic','76'),(1554,5,'8','Lennox Mine Clinic','77'),(1555,5,'8','Mazorodze Clinic','81'),(1556,5,'8','Rujeko Clinic','82'),(1557,5,'8','Runyararo Clinic','83'),(1558,5,'8','Bondolfi Clinic','91'),(1559,5,'8','Shonganiso Clinic','92'),(1560,5,'8','Zimuto Mission Clinic','93'),(1561,5,'8','Masv.Mission Mobile','95'),(1562,6,'8','Chimbudzi R.H.C.','01'),(1563,6,'8','Chirindi R.H.C.','02'),(1564,6,'8','Chizumba R.H.C.','03'),(1565,6,'8','Maranda Sub R.H.C.','04'),(1566,6,'8','Nehanda R.H.C.','05'),(1567,6,'8','Rutenga Clinic','06'),(1568,6,'8','Neshuro Diistrict Hospital','0A'),(1569,6,'8','Matibi Mission Hosp','0B'),(1570,6,'8','Mwenezi Epi Mobile','20'),(1571,6,'8','Mazetese Clinic','25'),(1572,6,'8','Mushava Clinic','27'),(1573,6,'8','Mwenezi Clinic','28'),(1574,6,'8','Murove Clinic','29'),(1575,6,'8','Mlelezi Clinic','30'),(1576,6,'8','Boterere Clinic','31'),(1577,6,'8','Rutenga Clinic','81'),(1578,6,'8','M.D.C. Clinic','82'),(1579,6,'8','Maranda Clinic','91'),(1580,6,'8','Lundi Clinic','92'),(1581,7,'8','Chipinda R.H.C.','01'),(1582,7,'8','Harava R.H.C.','02'),(1583,7,'8','Nemauku R.H.C.','03'),(1584,7,'8','Svuure R.H.C.','04'),(1585,7,'8','Zibwowa R.H.C.','05'),(1586,7,'8','Ndanga Hospital','0A'),(1587,7,'8','Musiso Hospital','0C'),(1588,7,'8','Zaka Epi Mobile','20'),(1589,7,'8','Bota Clinic','25'),(1590,7,'8','Bvukururu Clinic','26'),(1591,7,'8','Chinyabako Clinic','27'),(1592,7,'8','Chiredzana Clinic','29'),(1593,7,'8','Fube Clinic','30'),(1594,7,'8','Jichidza Clinic','32'),(1595,7,'8','Mushaya Clinic','33'),(1596,7,'8','Ndanga Clinic','34'),(1597,7,'8','Nhema Clinic','35'),(1598,7,'8','Nyakunhuwa Clinic','36'),(1599,7,'8','Siyawareva Clinic','37'),(1600,7,'8','Veza Clinic','38'),(1601,7,'8','Jerera Satelite Clinic','40'),(1602,7,'8','Jichidza Mission','91'),(1603,NULL,'9','Emakhandeni Day Clinic','01'),(1604,NULL,'9','Tshabalala Clinic','02'),(1605,NULL,'9','E.F.Watson Clinic','03'),(1606,NULL,'9','Entumbane Clinic','04'),(1607,NULL,'9','Khami Road Clinic','05'),(1608,NULL,'9','Luveve Clinic','06'),(1609,NULL,'9','Magwegwe Clinic','07'),(1610,NULL,'9','Mzilikazi Clinic','08'),(1611,NULL,'9','Njube Clinic','09'),(1612,NULL,'9','Lady Rodwell','0A'),(1613,NULL,'9','Thorngrove','0E'),(1614,NULL,'9','Mater Dei','0G'),(1615,NULL,'9','Richard Morris','0H'),(1616,NULL,'9','Ingutsheni Hospital','0I'),(1617,NULL,'9','Nkulumane Clinic','10'),(1618,NULL,'9','Pelandaba Clinic','11'),(1619,NULL,'9','Princess Margareth','12'),(1620,NULL,'9','Pumula Clinic','13'),(1621,NULL,'9','Dr.Shenan Clinic','14'),(1622,NULL,'9','Central Clinic','16'),(1623,NULL,'9','Nketa Clinic','17'),(1624,NULL,'9','Northern Surban  Clinic','18'),(1625,NULL,'9','King\'s Maternity','19'),(1626,NULL,'9','Jubilee Clinic','20'),(1627,NULL,'9','Maternal Health Clinic','21'),(1628,NULL,'9','Galen House Clinic','22'),(1629,NULL,'9','Marondera Polyclinic','23'),(1630,NULL,'9','Family Medical Clinic','24'),(1631,NULL,'9','Elons Clinic','25'),(1632,NULL,'9','Cowdray Park Clinic','27'),(1633,NULL,'9','Silver Oaks Medical Centre','28'),(1634,NULL,'9','Patient Wise Clinic','29'),(1635,NULL,'9','Family Health Clinic','30'),(1636,NULL,'9','24 Hour Medical Centre','31'),(1637,NULL,'9','Main Street','32'),(1638,NULL,'9','Maqhawe Clinic','33'),(1639,NULL,'9','Pumula South Clinic','35'),(1640,NULL,'9','Tembi Home Health Centre','36'),(1641,NULL,'9','Medical Chambers Cnt','37'),(1642,NULL,'9','Dr W Ndebele','39'),(1643,NULL,'9','Ingutsheni','01'),(1644,NULL,'9','U.B.H','02'),(1645,NULL,'9','UBH','0C'),(1646,NULL,'9','Mpilo Hospital','02'),(1647,1,'10','Tanya','0A'),(1648,1,'11','Tanya','01'),(1649,1,'11','Tinashe','02');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilityconfig`
--

DROP TABLE IF EXISTS `facilityconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facilityconfig` (
  `idfacilityConfig` int(11) NOT NULL AUTO_INCREMENT,
  `provinceId` int(11) NOT NULL,
  `districtId` varchar(45) NOT NULL,
  `facilityId` varchar(45) NOT NULL,
  PRIMARY KEY (`idfacilityConfig`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilityconfig`
--

LOCK TABLES `facilityconfig` WRITE;
/*!40000 ALTER TABLE `facilityconfig` DISABLE KEYS */;
INSERT INTO `facilityconfig` VALUES (1,1,'5','0A');
/*!40000 ALTER TABLE `facilityconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functionalstatustype`
--

DROP TABLE IF EXISTS `functionalstatustype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `functionalstatustype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functionalstatustype`
--

LOCK TABLES `functionalstatustype` WRITE;
/*!40000 ALTER TABLE `functionalstatustype` DISABLE KEYS */;
INSERT INTO `functionalstatustype` VALUES (1,'ABULATORY'),(2,'SCHOOL GOING'),(3,'BED RIDDEN'),(4,'WORKING');
/*!40000 ALTER TABLE `functionalstatustype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generalconditiontype`
--

DROP TABLE IF EXISTS `generalconditiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generalconditiontype` (
  `ID` int(11) NOT NULL,
  `GeneralConditionName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generalconditiontype`
--

LOCK TABLES `generalconditiontype` WRITE;
/*!40000 ALTER TABLE `generalconditiontype` DISABLE KEYS */;
INSERT INTO `generalconditiontype` VALUES (1,'Ill looking'),(2,'Healthy'),(3,'Lymphadenopathy'),(4,'Wasting'),(5,'Dehydration'),(6,'Jaundice'),(7,'Pallor');
/*!40000 ALTER TABLE `generalconditiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genitalexamtype`
--

DROP TABLE IF EXISTS `genitalexamtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genitalexamtype` (
  `ID` int(11) NOT NULL,
  `GenitalExamName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genitalexamtype`
--

LOCK TABLES `genitalexamtype` WRITE;
/*!40000 ALTER TABLE `genitalexamtype` DISABLE KEYS */;
INSERT INTO `genitalexamtype` VALUES (1,'Hypospadias'),(2,'Genital Ulcers'),(3,'Genital warts'),(4,'Balanitis'),(5,'Torsion of the penis'),(6,'Preputial Adhesions'),(7,'Phimosis'),(8,'Paraphimosis'),(9,'Epispadias'),(10,'Posthitis'),(11,'Urethral discharge');
/*!40000 ALTER TABLE `genitalexamtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highviralload`
--

DROP TABLE IF EXISTS `highviralload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `highviralload` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `firstSession` varchar(255) DEFAULT NULL,
  `firstSessionDate` date DEFAULT NULL,
  `firstSessionSummary` varchar(255) DEFAULT NULL,
  `secondSession` varchar(255) DEFAULT NULL,
  `arvIntake` varchar(255) DEFAULT NULL,
  `assessmentDate` date DEFAULT NULL,
  `counsellorName` varchar(255) DEFAULT NULL,
  `secondSessionDate` date DEFAULT NULL,
  `secondSessionSummary` varchar(255) DEFAULT NULL,
  `arvIntake2` varchar(255) DEFAULT NULL,
  `extraSession` varchar(255) DEFAULT NULL,
  `extraSessionDate` date DEFAULT NULL,
  `extraSessionSummary` varchar(255) DEFAULT NULL,
  `arvIntake3` varchar(255) DEFAULT NULL,
  `repeatedVlDate` varchar(255) DEFAULT NULL,
  `viralLoadResult` varchar(255) DEFAULT NULL,
  `arvRegimenValuation` varchar(255) DEFAULT NULL,
  `nurseName` varchar(255) DEFAULT NULL,
  `nurseAssessmentDate` date DEFAULT NULL,
  `RegimenValuation` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `doctorDate` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highviralload`
--

LOCK TABLES `highviralload` WRITE;
/*!40000 ALTER TABLE `highviralload` DISABLE KEYS */;
/*!40000 ALTER TABLE `highviralload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hivresulttype`
--

DROP TABLE IF EXISTS `hivresulttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hivresulttype` (
  `ID` int(11) NOT NULL,
  `ResultName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hivresulttype`
--

LOCK TABLES `hivresulttype` WRITE;
/*!40000 ALTER TABLE `hivresulttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `hivresulttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htc`
--

DROP TABLE IF EXISTS `htc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htc` (
  `HTCNumber` varchar(255) NOT NULL,
  `OPDNumber` varchar(255) DEFAULT NULL,
  `DateofRegistration` date DEFAULT NULL,
  `CoupleTo` varchar(255) DEFAULT NULL,
  `isCouple` varchar(4) DEFAULT NULL,
  `HTCApproach` varchar(255) DEFAULT NULL,
  `HTCModel_Id` int(255) DEFAULT NULL,
  `CounselingRecieved` varchar(255) DEFAULT NULL,
  `OptedOut` varchar(255) DEFAULT NULL,
  `NameofCounselor` varchar(255) DEFAULT NULL,
  `RecievedResult` varchar(255) DEFAULT NULL,
  `PostTestCounseled` varchar(255) DEFAULT NULL,
  `PostTestCounselDate` date DEFAULT NULL,
  `RefferedforService` varchar(255) DEFAULT NULL,
  `TestPurposeType_ID` int(11) DEFAULT NULL,
  `ReferredFromType_ID` int(11) DEFAULT NULL,
  `tested_before` varchar(255) DEFAULT NULL,
  `current_pregnancy_lactation` varchar(255) DEFAULT NULL,
  `date_tested_before` datetime DEFAULT NULL,
  `EntryPointID` int(11) DEFAULT NULL,
  `FinalResultType` varchar(255) DEFAULT NULL,
  `PerformedBy` varchar(255) DEFAULT NULL,
  `notified` varchar(4) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Sex` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`HTCNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htc`
--

LOCK TABLES `htc` WRITE;
/*!40000 ALTER TABLE `htc` DISABLE KEYS */;
/*!40000 ALTER TABLE `htc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htc_hivresult`
--

DROP TABLE IF EXISTS `htc_hivresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htc_hivresult` (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT,
  `OPDNumber` varchar(255) DEFAULT NULL,
  `HTCNumber` varchar(255) DEFAULT NULL,
  `TestKit` varchar(255) DEFAULT NULL,
  `LotNumber` varchar(255) DEFAULT NULL,
  `isRetest` bit(1) DEFAULT NULL,
  `TestCategory` int(11) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `ExpireDate` timestamp NULL DEFAULT NULL,
  `starttime` varchar(8) DEFAULT NULL,
  `readingtime` varchar(8) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Sex` varchar(45) DEFAULT NULL,
  `DateofRegistration` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htc_hivresult`
--

LOCK TABLES `htc_hivresult` WRITE;
/*!40000 ALTER TABLE `htc_hivresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `htc_hivresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htc_setuphtcapproach`
--

DROP TABLE IF EXISTS `htc_setuphtcapproach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htc_setuphtcapproach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htc_setuphtcapproach`
--

LOCK TABLES `htc_setuphtcapproach` WRITE;
/*!40000 ALTER TABLE `htc_setuphtcapproach` DISABLE KEYS */;
INSERT INTO `htc_setuphtcapproach` VALUES (1,'PITC'),(2,'CITC/ VCT'),(3,NULL);
/*!40000 ALTER TABLE `htc_setuphtcapproach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htc_setuphtcmodel`
--

DROP TABLE IF EXISTS `htc_setuphtcmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htc_setuphtcmodel` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) DEFAULT NULL,
  `FacilityBased` int(2) DEFAULT NULL,
  `Community based` int(2) DEFAULT NULL,
  `MainModel` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htc_setuphtcmodel`
--

LOCK TABLES `htc_setuphtcmodel` WRITE;
/*!40000 ALTER TABLE `htc_setuphtcmodel` DISABLE KEYS */;
INSERT INTO `htc_setuphtcmodel` VALUES (1,'Health facilty based',0,0,0),(2,'Standalone',0,0,0),(3,'Mobile (Outreach)',0,1,0),(4,'Workplace',0,0,0),(5,'Campaign',0,1,0),(6,'Other',1,1,0),(7,'Facility Based',0,0,1),(8,'Community Based',0,0,1),(10,'Private',1,0,0),(11,'Public',1,0,0),(12,'New Start centere',1,0,0),(13,'NGO',1,0,0),(14,'Home',0,1,0);
/*!40000 ALTER TABLE `htc_setuphtcmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htc_testreason`
--

DROP TABLE IF EXISTS `htc_testreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htc_testreason` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htc_testreason`
--

LOCK TABLES `htc_testreason` WRITE;
/*!40000 ALTER TABLE `htc_testreason` DISABLE KEYS */;
INSERT INTO `htc_testreason` VALUES (1,'TB'),(2,'ANC/ L&B/ PNC'),(3,'STI'),(4,'VMMC'),(5,'Diagnosis'),(6,'Family Planning'),(7,'Nutrition'),(8,'Exposed Infant'),(9,'Occupational'),(10,'Sexual Abuse'),(11,'Family Member on ART'),(12,'Death of Child or Spouse'),(13,'Knowledge of HIV Status'),(14,'Other'),(15,'index testing'),(16,NULL);
/*!40000 ALTER TABLE `htc_testreason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `htc_testtype`
--

DROP TABLE IF EXISTS `htc_testtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htc_testtype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TestName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `htc_testtype`
--

LOCK TABLES `htc_testtype` WRITE;
/*!40000 ALTER TABLE `htc_testtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `htc_testtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hts_entrypoint`
--

DROP TABLE IF EXISTS `hts_entrypoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hts_entrypoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(55) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hts_entrypoint`
--

LOCK TABLES `hts_entrypoint` WRITE;
/*!40000 ALTER TABLE `hts_entrypoint` DISABLE KEYS */;
INSERT INTO `hts_entrypoint` VALUES (1,'Antenatal clinic','2'),(2,'STI Clinic','0'),(3,'General VCT Clinic','0'),(4,'Outpatients','0'),(5,'Counseling area','0'),(6,'Medical & Surgical Ward','1'),(7,'TB Ward','0'),(8,'Vmmc','1'),(9,'Paediatric Ward','0'),(10,'HTS Campaign','0'),(11,'Private Clinic/Hospital','0'),(12,'Other Wards(Specify)','0'),(13,NULL,NULL);
/*!40000 ALTER TABLE `hts_entrypoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hts_sqnumber`
--

DROP TABLE IF EXISTS `hts_sqnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hts_sqnumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sqnumber` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hts_sqnumber`
--

LOCK TABLES `hts_sqnumber` WRITE;
/*!40000 ALTER TABLE `hts_sqnumber` DISABLE KEYS */;
INSERT INTO `hts_sqnumber` VALUES (1,2,2020),(2,NULL,NULL);
/*!40000 ALTER TABLE `hts_sqnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory`
--

DROP TABLE IF EXISTS `laboratory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` varchar(45) DEFAULT NULL,
  `TestType` varchar(45) DEFAULT NULL,
  `TestDate` date DEFAULT NULL,
  `ReceivedDate` date DEFAULT NULL,
  `PatientReceivedDate` date DEFAULT NULL,
  `Result` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory`
--

LOCK TABLES `laboratory` WRITE;
/*!40000 ALTER TABLE `laboratory` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linkages`
--

DROP TABLE IF EXISTS `linkages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linkages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `OPDNumber` varchar(225) NOT NULL,
  `Referred_to` varchar(225) NOT NULL,
  `Referred_to_date` datetime NOT NULL,
  `Referred_From` varchar(225) NOT NULL,
  `Referred_from_Date` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linkages`
--

LOCK TABLES `linkages` WRITE;
/*!40000 ALTER TABLE `linkages` DISABLE KEYS */;
/*!40000 ALTER TABLE `linkages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locks` (
  `LockedPatientID` varchar(17) NOT NULL,
  `LockByMachine` varchar(50) DEFAULT NULL,
  `LockByForm` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LockedPatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locks`
--

LOCK TABLES `locks` WRITE;
/*!40000 ALTER TABLE `locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merge`
--

DROP TABLE IF EXISTS `merge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `OPDNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merge`
--

LOCK TABLES `merge` WRITE;
/*!40000 ALTER TABLE `merge` DISABLE KEYS */;
/*!40000 ALTER TABLE `merge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `ID` int(11) NOT NULL,
  `ModuleName` varchar(255) DEFAULT NULL,
  `FolderPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulerole`
--

DROP TABLE IF EXISTS `modulerole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulerole` (
  `ID` int(11) NOT NULL,
  `ModuleID` int(11) DEFAULT NULL,
  `RoleID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulerole`
--

LOCK TABLES `modulerole` WRITE;
/*!40000 ALTER TABLE `modulerole` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulerole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nextofkin`
--

DROP TABLE IF EXISTS `nextofkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nextofkin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) DEFAULT NULL,
  `OPDNumber` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `PhysicalAddress` varchar(255) DEFAULT NULL,
  `ContactNumber` varchar(255) DEFAULT NULL,
  `RelationType` varchar(255) DEFAULT NULL,
  `Chief` varchar(255) DEFAULT NULL,
  `Kraal` varchar(255) DEFAULT NULL,
  `Village` varchar(255) DEFAULT NULL,
  `School` varchar(255) DEFAULT NULL,
  `Clinic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4178 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nextofkin`
--

LOCK TABLES `nextofkin` WRITE;
/*!40000 ALTER TABLE `nextofkin` DISABLE KEYS */;
/*!40000 ALTER TABLE `nextofkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `ID` int(11) NOT NULL,
  `ModuleID` int(11) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `FilePath` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `PageID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node`
--

LOCK TABLES `node` WRITE;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
/*!40000 ALTER TABLE `node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noderole`
--

DROP TABLE IF EXISTS `noderole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noderole` (
  `ID` int(11) NOT NULL,
  `NodeID` int(11) DEFAULT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `ViewAllowed` bit(1) DEFAULT NULL,
  `EditAllowed` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noderole`
--

LOCK TABLES `noderole` WRITE;
/*!40000 ALTER TABLE `noderole` DISABLE KEYS */;
/*!40000 ALTER TABLE `noderole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `OPDNumber` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `NationalID` varchar(255) DEFAULT NULL,
  `Age` float DEFAULT NULL,
  `Sex` char(6) DEFAULT NULL,
  `FacilityCode` varchar(255) DEFAULT NULL,
  `RegistrationDate` datetime DEFAULT NULL,
  `MaritalStatus` varchar(255) DEFAULT NULL,
  `EducationalLevel` varchar(255) DEFAULT NULL,
  `Occupation` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `vmmcId` varchar(255) DEFAULT NULL,
  `htsId` varchar(255) DEFAULT NULL,
  `tbId` varchar(255) DEFAULT NULL,
  `patientId` varchar(21) DEFAULT NULL,
  `stiId` varchar(45) DEFAULT NULL,
  `OphanStatus` varchar(45) DEFAULT NULL,
  `DateOfDeath` date DEFAULT NULL,
  `Religion` varchar(45) DEFAULT NULL,
  `fileRef` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`OPDNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_address`
--

DROP TABLE IF EXISTS `patient_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_address` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientId` int(11) DEFAULT NULL,
  `OPDNumber` varchar(255) DEFAULT NULL,
  `PhysicalAddress` varchar(255) DEFAULT NULL,
  `Chief` varchar(255) DEFAULT NULL,
  `Kraal` varchar(255) DEFAULT NULL,
  `School` varchar(255) DEFAULT NULL,
  `Village` varchar(255) DEFAULT NULL,
  `Clinic` varchar(255) DEFAULT NULL,
  `MobileNumber` varchar(255) DEFAULT NULL,
  `TelNumber` varchar(255) DEFAULT NULL,
  `WorkTelNumber` varchar(255) DEFAULT NULL,
  `WorkAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4174 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_address`
--

LOCK TABLES `patient_address` WRITE;
/*!40000 ALTER TABLE `patient_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_diagnosis`
--

DROP TABLE IF EXISTS `patient_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_diagnosis` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OPDNumber` varchar(255) DEFAULT NULL,
  `VMMCID` varchar(255) DEFAULT NULL,
  `DiagnosisType_Id` int(11) DEFAULT NULL,
  `DiagnosisDescription` varchar(255) DEFAULT NULL,
  `SpecifyOtherDiagnosis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_diagnosis`
--

LOCK TABLES `patient_diagnosis` WRITE;
/*!40000 ALTER TABLE `patient_diagnosis` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_medical_insurance`
--

DROP TABLE IF EXISTS `patient_medical_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_medical_insurance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) DEFAULT NULL,
  `OPDNumber` varchar(255) DEFAULT NULL,
  `Medical_Insurance_Name` varchar(255) DEFAULT NULL,
  `Medical_Insurance_Number` varchar(255) DEFAULT NULL,
  `Medical_Insurance_Scheme` varchar(255) DEFAULT NULL,
  `Medical_Insurance_Relation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_medical_insurance`
--

LOCK TABLES `patient_medical_insurance` WRITE;
/*!40000 ALTER TABLE `patient_medical_insurance` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_medical_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_sqnumber`
--

DROP TABLE IF EXISTS `patient_sqnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_sqnumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sqnumber` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_sqnumber`
--

LOCK TABLES `patient_sqnumber` WRITE;
/*!40000 ALTER TABLE `patient_sqnumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_sqnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_status`
--

DROP TABLE IF EXISTS `patient_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_status` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(255) DEFAULT NULL,
  `OPDNumber` varchar(255) DEFAULT NULL,
  `StatusType_ID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_status`
--

LOCK TABLES `patient_status` WRITE;
/*!40000 ALTER TABLE `patient_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceduretype`
--

DROP TABLE IF EXISTS `proceduretype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proceduretype` (
  `ID` int(11) NOT NULL,
  `ProcedureName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceduretype`
--

LOCK TABLES `proceduretype` WRITE;
/*!40000 ALTER TABLE `proceduretype` DISABLE KEYS */;
/*!40000 ALTER TABLE `proceduretype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `ID` int(11) NOT NULL,
  `ProvinceName` varchar(255) NOT NULL,
  `ProvinceCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProvinceName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (10,'Bulawayo','9'),(1,'Harare','7'),(2,'Manicaland','1'),(3,'Mashonaland Central','2'),(4,'Mashonaland East','3'),(5,'Mashonaland West','4'),(11,'Masvikeni A','10'),(12,'Masvikeni B','11'),(9,'Masvingo','8'),(6,'Matabeleland North','5'),(7,'Matabeleland South','6'),(8,'Midlands','7');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportdates`
--

DROP TABLE IF EXISTS `reportdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportdates` (
  `ID` int(11) NOT NULL DEFAULT '1',
  `startDate` varchar(45) DEFAULT '0000-00-00',
  `End` varchar(45) DEFAULT '0000-00-00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportdates`
--

LOCK TABLES `reportdates` WRITE;
/*!40000 ALTER TABLE `reportdates` DISABLE KEYS */;
INSERT INTO `reportdates` VALUES (1,'2020-06-18','2020-06-30');
/*!40000 ALTER TABLE `reportdates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riskreductionplantype`
--

DROP TABLE IF EXISTS `riskreductionplantype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riskreductionplantype` (
  `ID` int(11) NOT NULL,
  `RiskReductionName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riskreductionplantype`
--

LOCK TABLES `riskreductionplantype` WRITE;
/*!40000 ALTER TABLE `riskreductionplantype` DISABLE KEYS */;
/*!40000 ALTER TABLE `riskreductionplantype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `RoleId` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `PermissionLevel` int(255) DEFAULT NULL,
  PRIMARY KEY (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('1','Admin',5),('2','Data Entry Clerk',4),('3','Dispenser',3),('4','Lab Technician',3),('5','Executive',1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securityaccesslevels`
--

DROP TABLE IF EXISTS `securityaccesslevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securityaccesslevels` (
  `AccessLevel` int(11) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `EnterSecurity` tinyint(4) DEFAULT NULL,
  `EnterUtilities` tinyint(4) DEFAULT NULL,
  `EnterPrintouts` tinyint(4) DEFAULT NULL,
  `EnterSetup` tinyint(4) DEFAULT NULL,
  `EnterDataEntryDispensing` tinyint(4) DEFAULT NULL,
  `EnterDataEntry` tinyint(4) DEFAULT NULL,
  `EnterPrintoutsSpecial` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`AccessLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securityaccesslevels`
--

LOCK TABLES `securityaccesslevels` WRITE;
/*!40000 ALTER TABLE `securityaccesslevels` DISABLE KEYS */;
INSERT INTO `securityaccesslevels` VALUES (1,'printouts standard only',0,1,1,0,0,0,0),(2,'data entry dispensing only, printouts standard',0,1,1,0,1,0,0),(3,'data entry all, printouts standard only',0,1,1,0,1,1,0),(4,'data entry all, printouts all',0,1,1,0,1,1,1),(5,'administrator - all rights',1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `securityaccesslevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securityusers`
--

DROP TABLE IF EXISTS `securityusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securityusers` (
  `UserNumber` int(11) NOT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `LoginName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `AccessLevel` int(11) DEFAULT NULL,
  `Active` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserNumber`),
  KEY `fi0` (`AccessLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securityusers`
--

LOCK TABLES `securityusers` WRITE;
/*!40000 ALTER TABLE `securityusers` DISABLE KEYS */;
INSERT INTO `securityusers` VALUES (67,'Doreen Saganya','dsaganya','1234',5,NULL),(68,'Maxwell Tinorwa','mtinorwa','maxwell',3,NULL),(69,'Florence Thondlana','fthondhlana','manyezu1958',3,NULL),(70,'Oppressive Tinapi','otinapi','oppie',4,NULL),(71,'Ellen Madondo','emadondo','1956',3,NULL),(72,'Tatenda Gowodo','tgowodo','654321',4,NULL),(73,'Misheck Simoko','msimoko','qwerty',4,NULL),(74,'Doctor Chiwumira','dchiwumira','awesomedoc',4,NULL),(75,'Sharon Mugwambani','smugwambani','sherry',4,NULL),(76,'Patience Mukaronda','pmukaronda','nokutenda',4,NULL),(77,'Chipo Veremu','cveremu','chipo-sunshine9',4,NULL),(78,'Alma Muropa','amuropa','chikomborero',4,NULL),(79,'tawanda mipasa','tmipasa','281987',4,0),(80,'Chikono Gibson','gchikono','1967',5,NULL),(81,'Admin','admin','ctc',5,NULL),(82,'Oliver Matongo','omatongo','mph2015',4,NULL),(83,'Keith Ndlovu','kndlovu','elephant84',4,NULL),(84,'Cuthbert Chideme','cchideme',NULL,3,NULL),(85,'Ashley Bonyongwa','abonyongwa','1234',4,NULL),(86,'Moreblessing Chinhengo','mchinhengo','12345',4,NULL),(87,'Barbra Njukuya','bnjukuya','grace',4,NULL),(88,'Nelia Chipenzi','nchipenzi','23456',4,NULL);
/*!40000 ALTER TABLE `securityusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setup_linkages`
--

DROP TABLE IF EXISTS `setup_linkages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setup_linkages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setup_linkages`
--

LOCK TABLES `setup_linkages` WRITE;
/*!40000 ALTER TABLE `setup_linkages` DISABLE KEYS */;
/*!40000 ALTER TABLE `setup_linkages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setupclinicians`
--

DROP TABLE IF EXISTS `setupclinicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setupclinicians` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FistName` varchar(255) DEFAULT NULL,
  `Surname` varchar(255) DEFAULT NULL,
  `IDNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setupclinicians`
--

LOCK TABLES `setupclinicians` WRITE;
/*!40000 ALTER TABLE `setupclinicians` DISABLE KEYS */;
/*!40000 ALTER TABLE `setupclinicians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setupdoctors`
--

DROP TABLE IF EXISTS `setupdoctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setupdoctors` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `FirstName` varchar(255) DEFAULT NULL,
  `Surname` varchar(255) DEFAULT NULL,
  `IDNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setupdoctors`
--

LOCK TABLES `setupdoctors` WRITE;
/*!40000 ALTER TABLE `setupdoctors` DISABLE KEYS */;
/*!40000 ALTER TABLE `setupdoctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setupmedicalaidsocities`
--

DROP TABLE IF EXISTS `setupmedicalaidsocities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setupmedicalaidsocities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medical_aid_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setupmedicalaidsocities`
--

LOCK TABLES `setupmedicalaidsocities` WRITE;
/*!40000 ALTER TABLE `setupmedicalaidsocities` DISABLE KEYS */;
INSERT INTO `setupmedicalaidsocities` VALUES (1,'CIMAS','TEST'),(2,'PSMAS','TEST2'),(3,'FIRST MUTUAL','TEST3'),(4,'OLD MUTUAL','TEST4');
/*!40000 ALTER TABLE `setupmedicalaidsocities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setupprimarycounsellors`
--

DROP TABLE IF EXISTS `setupprimarycounsellors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setupprimarycounsellors` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `FirstName` varchar(255) DEFAULT NULL,
  `Surname` varchar(255) DEFAULT NULL,
  `IDNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setupprimarycounsellors`
--

LOCK TABLES `setupprimarycounsellors` WRITE;
/*!40000 ALTER TABLE `setupprimarycounsellors` DISABLE KEYS */;
/*!40000 ALTER TABLE `setupprimarycounsellors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setupreferred_to`
--

DROP TABLE IF EXISTS `setupreferred_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setupreferred_to` (
  `id` int(11) NOT NULL,
  `description` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setupreferred_to`
--

LOCK TABLES `setupreferred_to` WRITE;
/*!40000 ALTER TABLE `setupreferred_to` DISABLE KEYS */;
INSERT INTO `setupreferred_to` VALUES (2,'VMMC'),(3,'Medical Care'),(4,'OI/ART'),(5,'Psychosocial support'),(6,'TB'),(7,'Nutrition'),(8,'PMTCT'),(9,'Cervical cancer screening'),(10,'Other');
/*!40000 ALTER TABLE `setupreferred_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setupreferredfrom`
--

DROP TABLE IF EXISTS `setupreferredfrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setupreferredfrom` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ReferredFromName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setupreferredfrom`
--

LOCK TABLES `setupreferredfrom` WRITE;
/*!40000 ALTER TABLE `setupreferredfrom` DISABLE KEYS */;
INSERT INTO `setupreferredfrom` VALUES (1,'New Start Centre'),(2,'Community mobiliser'),(3,'Workplace'),(4,'School'),(5,'HTC Program'),(6,'Health worker'),(99,'Other');
/*!40000 ALTER TABLE `setupreferredfrom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setupriskreductionplan`
--

DROP TABLE IF EXISTS `setupriskreductionplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setupriskreductionplan` (
  `RiskReductionPlanName` varchar(255) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setupriskreductionplan`
--

LOCK TABLES `setupriskreductionplan` WRITE;
/*!40000 ALTER TABLE `setupriskreductionplan` DISABLE KEYS */;
INSERT INTO `setupriskreductionplan` VALUES ('Dual Protection',1),('Use Condoms',2),('Decrease Number of sex partners',3),('Abstinence',4),('Monogamy',5),(NULL,6);
/*!40000 ALTER TABLE `setupriskreductionplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setupservicetypes`
--

DROP TABLE IF EXISTS `setupservicetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setupservicetypes` (
  `idsetupServiceTypes` int(11) NOT NULL,
  `setupServiceName` varchar(255) NOT NULL,
  PRIMARY KEY (`idsetupServiceTypes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setupservicetypes`
--

LOCK TABLES `setupservicetypes` WRITE;
/*!40000 ALTER TABLE `setupservicetypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `setupservicetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setupstaff`
--

DROP TABLE IF EXISTS `setupstaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setupstaff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `userRole` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setupstaff`
--

LOCK TABLES `setupstaff` WRITE;
/*!40000 ALTER TABLE `setupstaff` DISABLE KEYS */;
INSERT INTO `setupstaff` VALUES (1,'tmataranyika','Trevor','Mataranyika','Doctor'),(2,'mmamhinga','Muchi','Mamhinga','Nurse');
/*!40000 ALTER TABLE `setupstaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statustype`
--

DROP TABLE IF EXISTS `statustype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statustype` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StatusName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statustype`
--

LOCK TABLES `statustype` WRITE;
/*!40000 ALTER TABLE `statustype` DISABLE KEYS */;
/*!40000 ALTER TABLE `statustype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti`
--

DROP TABLE IF EXISTS `sti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti` (
  `OPDNumber` varchar(255) NOT NULL,
  `STINumber` varchar(255) NOT NULL,
  `DateOfRegistration` date DEFAULT NULL,
  `Complaints` varchar(255) DEFAULT NULL,
  `SexualHistory` varchar(255) DEFAULT NULL,
  `Episode` varchar(45) DEFAULT NULL,
  `STISyndrome` varchar(255) DEFAULT NULL,
  `Examinations` varchar(255) DEFAULT NULL,
  `TestedForSyphilis` varchar(4) DEFAULT NULL,
  `PurposeOfSyphilisTesting` varchar(255) DEFAULT NULL,
  `SyphilisTestResult` varchar(4) DEFAULT NULL,
  `Treatment` varchar(255) DEFAULT NULL,
  `TestedForHiv` varchar(4) DEFAULT NULL,
  `StiContactSlipIssued` varchar(4) DEFAULT NULL,
  `StiContactSlipReceived` varchar(4) DEFAULT NULL,
  `SyphilisResult` varchar(4) DEFAULT NULL,
  `ScreenedForSyphilis` varchar(4) DEFAULT NULL,
  `SyphilisTreated` varchar(4) DEFAULT NULL,
  `HivTestResult` varchar(4) DEFAULT NULL,
  `CondomInformationGiven` varchar(4) DEFAULT NULL,
  `CondomsIssued` varchar(4) DEFAULT NULL,
  `Comments` varchar(255) DEFAULT NULL,
  `EntryPoint` varchar(45) DEFAULT NULL,
  `DeliveryOutcome` varchar(45) DEFAULT NULL,
  `AncBookingTime` varchar(45) DEFAULT NULL,
  `AncTestedForSyphilis` varchar(4) DEFAULT NULL,
  `AncSyphilisTestResults` varchar(4) DEFAULT NULL,
  `AncSyphilisTreated` varchar(4) DEFAULT NULL,
  `AncSyphillisTreatment` varchar(255) DEFAULT NULL,
  `AncTestedDuringPregnancy` varchar(4) DEFAULT NULL,
  `AncDateTestedSyphDuriPreg` date DEFAULT NULL,
  `AncSyphTestedBeforeResult` varchar(4) DEFAULT NULL,
  `AncSyphTreatedBefore` varchar(4) DEFAULT NULL,
  `AncDeliveryDate` date DEFAULT NULL,
  `StiInfectionType` varchar(45) DEFAULT NULL,
  `AncSyphilisResult` varchar(4) DEFAULT NULL,
  `HIVTestedBefore` varchar(4) DEFAULT NULL,
  `HIVTestedBeforeResult` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`STINumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti`
--

LOCK TABLES `sti` WRITE;
/*!40000 ALTER TABLE `sti` DISABLE KEYS */;
/*!40000 ALTER TABLE `sti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_ancsyphilis`
--

DROP TABLE IF EXISTS `sti_ancsyphilis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_ancsyphilis` (
  `OPDNumber` varchar(255) NOT NULL,
  `STINumber` varchar(255) NOT NULL,
  `DateOfRegistration` date DEFAULT NULL,
  `ScreenedForSyphilis` varchar(4) DEFAULT NULL,
  `SyphilisResult` varchar(4) DEFAULT NULL,
  `SyphilisTreated` varchar(4) DEFAULT NULL,
  `SexualHistory` varchar(255) DEFAULT NULL,
  `Episode` varchar(45) DEFAULT NULL,
  `STISyndrome` varchar(255) DEFAULT NULL,
  `TestedForSyphilis` varchar(4) DEFAULT NULL,
  `PurposeOfSyphilisTesting` varchar(255) DEFAULT NULL,
  `SyphilisTestResult` varchar(4) DEFAULT NULL,
  `Treatment` varchar(255) DEFAULT NULL,
  `TestedForHiv` varchar(4) DEFAULT NULL,
  `HivTestResult` varchar(4) DEFAULT NULL,
  `StiContactSlipIssued` varchar(4) DEFAULT NULL,
  `StiContactSlipReceived` varchar(4) DEFAULT NULL,
  `CondomInformationGiven` varchar(4) DEFAULT NULL,
  `CondomsIssued` varchar(4) DEFAULT NULL,
  `Comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`STINumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_ancsyphilis`
--

LOCK TABLES `sti_ancsyphilis` WRITE;
/*!40000 ALTER TABLE `sti_ancsyphilis` DISABLE KEYS */;
/*!40000 ALTER TABLE `sti_ancsyphilis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_ancsyphilistreatment`
--

DROP TABLE IF EXISTS `sti_ancsyphilistreatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_ancsyphilistreatment` (
  `Dose` varchar(255) NOT NULL,
  `STINumber` varchar(255) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Frequency` varchar(45) DEFAULT NULL,
  `DateTreatmentCommenced` date DEFAULT NULL,
  `DateOfDelivery` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_ancsyphilistreatment`
--

LOCK TABLES `sti_ancsyphilistreatment` WRITE;
/*!40000 ALTER TABLE `sti_ancsyphilistreatment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sti_ancsyphilistreatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_cs`
--

DROP TABLE IF EXISTS `sti_cs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_cs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `STINumber` varchar(255) DEFAULT NULL,
  `OPDNumber` varchar(255) DEFAULT NULL,
  `DateofReport` date DEFAULT NULL,
  `ReportingFacility` varchar(255) DEFAULT NULL,
  `MotherId` varchar(45) DEFAULT NULL,
  `MothersAddress` varchar(255) DEFAULT NULL,
  `MothersObsHistoryGravida` varchar(3) DEFAULT NULL,
  `MothersObsHistoryParity` varchar(3) DEFAULT NULL,
  `LMPBeforeDelivery` date DEFAULT NULL,
  `MothersReligion` varchar(45) DEFAULT NULL,
  `FirstPrenatalVisit` date DEFAULT NULL,
  `TrimesterFirstPrenatalVisit` varchar(4) DEFAULT NULL,
  `MotherHIVStatusDuriPreg` varchar(15) DEFAULT NULL,
  `MothersMaritalStatus` varchar(45) DEFAULT NULL,
  `PeriodReceivingBenzathinePenicillin` varchar(45) DEFAULT NULL,
  `DateReceivingBenzathinePenicillin` date DEFAULT NULL,
  `MotherSyphilisTreatment` varchar(45) DEFAULT NULL,
  `DateOfDelivery` date DEFAULT NULL,
  `VitalStatus` varchar(45) DEFAULT NULL,
  `DateOfDeath` date DEFAULT NULL,
  `BirthWeight` varchar(3) DEFAULT NULL,
  `GestationalAge` varchar(3) DEFAULT NULL,
  `NonTreponemaltest` varchar(45) DEFAULT NULL,
  `TiterOfNonTreponemalTest` varchar(20) DEFAULT NULL,
  `TreponemaltestDone` varchar(20) DEFAULT NULL,
  `TreponemaltestDoneDate` date DEFAULT NULL,
  `DateOfNonTreponemalTest` date DEFAULT NULL,
  `DarkiedExam` varchar(45) DEFAULT NULL,
  `SignsOfCongenitalSyphilis` varchar(255) DEFAULT NULL,
  `BoneXRay` varchar(45) DEFAULT NULL,
  `CSFVDRL` varchar(45) DEFAULT NULL,
  `CSFProteinCSFWB` varchar(45) DEFAULT NULL,
  `InfantCongenitalSyphilistreatment` varchar(255) DEFAULT NULL,
  `CSClassification` varchar(45) DEFAULT NULL,
  `isNonTreponemalTestFirstVisit` varchar(20) DEFAULT NULL,
  `isNonTreponemalTestWeeksGest` varchar(20) DEFAULT NULL,
  `isNonTreponemalTestDelivery` varchar(20) DEFAULT NULL,
  `DateOfNonTreponemalTestMotherRecent` date DEFAULT NULL,
  `ResultOfNonTreponemalTestMotherRecent` varchar(45) DEFAULT NULL,
  `TiterOfNonTreponemalTestMotherRecent` varchar(45) DEFAULT NULL,
  `DateOfNonTreponemalTestMotherRecenFirst` date DEFAULT NULL,
  `ResultOfNonTreponemalTestMotherFirst` varchar(45) DEFAULT NULL,
  `TiterOfNonTreponemalTestMotherFirst` varchar(45) DEFAULT NULL,
  `DateOfPositiveTreponemalTestRecent` date DEFAULT NULL,
  `DateOfPositiveTreponemalTestFirst` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_cs`
--

LOCK TABLES `sti_cs` WRITE;
/*!40000 ALTER TABLE `sti_cs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sti_cs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_cs_setupsigns`
--

DROP TABLE IF EXISTS `sti_cs_setupsigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_cs_setupsigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_cs_setupsigns`
--

LOCK TABLES `sti_cs_setupsigns` WRITE;
/*!40000 ALTER TABLE `sti_cs_setupsigns` DISABLE KEYS */;
INSERT INTO `sti_cs_setupsigns` VALUES (1,'hepatosplenomegaly'),(2,'hepatosplenomegaly'),(3,'pseudo paralysis'),(4,'oedema'),(5,'condylomalata'),(6,'nose snuffles'),(7,'syphilitic skin rash'),(8,'no signs/asymptomatic'),(9,'other'),(10,'Unknown');
/*!40000 ALTER TABLE `sti_cs_setupsigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_cs_signs_infant`
--

DROP TABLE IF EXISTS `sti_cs_signs_infant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_cs_signs_infant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_cs_signs_infant`
--

LOCK TABLES `sti_cs_signs_infant` WRITE;
/*!40000 ALTER TABLE `sti_cs_signs_infant` DISABLE KEYS */;
INSERT INTO `sti_cs_signs_infant` VALUES (1,'Physical Signs of CS'),(2,'Evidenceof CS on long bone X-ray'),(3,'Reactive cerebrospinal fluid VDRL(CSF-VDRL)'),(4,'Elevated CSF WBC count or protein');
/*!40000 ALTER TABLE `sti_cs_signs_infant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_csexposeinfant`
--

DROP TABLE IF EXISTS `sti_csexposeinfant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_csexposeinfant` (
  `InfantId` varchar(45) NOT NULL,
  `InfantOPDNumber` varchar(45) DEFAULT NULL,
  `MotherOPDNumber` varchar(45) DEFAULT NULL,
  `Examination` varchar(255) DEFAULT NULL,
  `ExaminationType` varchar(45) DEFAULT NULL,
  `UmblicalOrPlacentaStatus` varchar(45) DEFAULT NULL,
  `NonTreponemalTestResult` varchar(45) DEFAULT NULL,
  `Signs` varchar(255) DEFAULT NULL,
  `CaseDefination` varchar(45) DEFAULT NULL,
  `Notified` varchar(4) DEFAULT NULL,
  `CaseCriteria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`InfantId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_csexposeinfant`
--

LOCK TABLES `sti_csexposeinfant` WRITE;
/*!40000 ALTER TABLE `sti_csexposeinfant` DISABLE KEYS */;
/*!40000 ALTER TABLE `sti_csexposeinfant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_drugs`
--

DROP TABLE IF EXISTS `sti_drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_drugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Infection_code` varchar(255) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_drugs`
--

LOCK TABLES `sti_drugs` WRITE;
/*!40000 ALTER TABLE `sti_drugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sti_drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_examinations`
--

DROP TABLE IF EXISTS `sti_examinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_examinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examination` varchar(255) DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_examinations`
--

LOCK TABLES `sti_examinations` WRITE;
/*!40000 ALTER TABLE `sti_examinations` DISABLE KEYS */;
INSERT INTO `sti_examinations` VALUES (1,'Mouth sores',1),(2,'pharyngeal inflammation',1),(3,'oral thrush',1),(4,'rashes',1),(5,'swellings',1),(6,'sores on the chest',1),(7,'Sores on the back',1),(8,'Sores on abdomen',1),(9,'enlarged lymph nodes.',1),(10,'patient is generally unwell',1),(11,'rashes and obvious swellings skin over the abdomen',0),(12,'Pubic inguinal lymph nodes at the pubic area',2),(13,'Pubic lice lymph nodes at the pubic area',2),(14,'Pubic sores  at the pubic area',2),(15,'Rashes on thighs and buttocks',0),(16,'swellings and sores on the groin',0),(17,'Discharge, rashes At the external genitals',2),(18,'rashes At the area around the anus ',0),(19,'warts, At the area around the anus ',0),(20,'discharge At the area around the anus ',2),(21,'lymph nodes and buboes.',2),(22,'Rashes on the penis',2),(23,'Warts on the penis',2),(24,'Sores on the penis',2),(25,'urethral meatus',2),(26,'rashes for External genitalia, vulva and labia',3),(27,'sores for External genitalia, vulva and labia',3),(28,'swellings for External genitalia, vulva and labia',3),(29,'warts for External genitalia, vulva and labia',3),(30,'Viginal  discharge ',3),(31,'Lesions for External genitalia, vulva and labia',3),(32,'abnormal growths or sores',3),(33,'cervical os closed',3),(34,'cervical os open',3),(35,'induced miscarriage or bleeding post-delivery',3),(36,'RPOCs on through os',3);
/*!40000 ALTER TABLE `sti_examinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_history`
--

DROP TABLE IF EXISTS `sti_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `history` varchar(255) DEFAULT NULL,
  `type` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_history`
--

LOCK TABLES `sti_history` WRITE;
/*!40000 ALTER TABLE `sti_history` DISABLE KEYS */;
INSERT INTO `sti_history` VALUES (1,'Regular partners',1),(2,'Casual partners',1),(3,'Money/Gifts exchange for sex',1),(4,'Other partners in the precceding 3 months',1),(5,'Recently had sex',1),(6,'Major illness in the past',2),(7,'Admited before',2),(8,'Previouse operation',2),(9,'Previouse STIs',2),(10,'HIV testing',2),(11,'currently on treatment',3),(12,'Drug allergies',3),(13,'Taking herbal remedies',3),(14,'Use alcohol',3),(15,'Use other recreational drugs',3);
/*!40000 ALTER TABLE `sti_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_infectiontype`
--

DROP TABLE IF EXISTS `sti_infectiontype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_infectiontype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `infectiontype` varchar(25) DEFAULT NULL,
  `syndrome` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_infectiontype`
--

LOCK TABLES `sti_infectiontype` WRITE;
/*!40000 ALTER TABLE `sti_infectiontype` DISABLE KEYS */;
INSERT INTO `sti_infectiontype` VALUES (1,'Vaginal infection','VI','Vaginal Discharge','00'),(2,'Cervical infection','CI','Vaginal Discharge','0'),(3,'PID','PID','Vaginal Discharge','0'),(4,'Urethral infection','UI','Urethral Discharge','11'),(5,'Anal or Rectal Infection','ARI','Ano-rectal infections','2'),(6,'Genital Infection','GI','Genital ulcer','2'),(7,'Inguinal infection','II','Inguinal Bubo','2'),(8,'Scrotum Infection','SI','Acute scrotal swelling','1'),(9,'Penal Fore-skin Infection ','PFI','Candida balanoposthitis','11'),(10,'Eye or systemic infection','ESI','Neonatal conjunctivitis','01'),(11,'Anal and genital warts','AGW','Anogenital warts','2'),(12,'Skin or pubic infections','SPI','Scabis and pubic lice','2');
/*!40000 ALTER TABLE `sti_infectiontype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_setuppurposeofsyphilis`
--

DROP TABLE IF EXISTS `sti_setuppurposeofsyphilis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_setuppurposeofsyphilis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_setuppurposeofsyphilis`
--

LOCK TABLES `sti_setuppurposeofsyphilis` WRITE;
/*!40000 ALTER TABLE `sti_setuppurposeofsyphilis` DISABLE KEYS */;
INSERT INTO `sti_setuppurposeofsyphilis` VALUES (1,'Antenatal','a'),(2,'Sexual abuse','b'),(3,'Contact','c'),(4,'Syphilis Exposed infant','d'),(5,'STI client','e');
/*!40000 ALTER TABLE `sti_setuppurposeofsyphilis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_setupsyndrome`
--

DROP TABLE IF EXISTS `sti_setupsyndrome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_setupsyndrome` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_setupsyndrome`
--

LOCK TABLES `sti_setupsyndrome` WRITE;
/*!40000 ALTER TABLE `sti_setupsyndrome` DISABLE KEYS */;
INSERT INTO `sti_setupsyndrome` VALUES (1,'Urethral Discharge','0'),(2,'Genital Ulcer','2'),(3,'Varginal discharge ','1'),(4,'Lower Abdominal Pain','1'),(5,'Inguinal bubo','2'),(6,'Acute Scrotal Swelling','0'),(7,'Opthalmia Neonatorum ','2'),(8,'Balanitis and Balanoposthitis','0'),(9,'Genital Warts','2'),(10,'Congenital Syphilis','2'),(11,'Other','2');
/*!40000 ALTER TABLE `sti_setupsyndrome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_sexualactivity`
--

DROP TABLE IF EXISTS `sti_sexualactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_sexualactivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sexualactivity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_sexualactivity`
--

LOCK TABLES `sti_sexualactivity` WRITE;
/*!40000 ALTER TABLE `sti_sexualactivity` DISABLE KEYS */;
INSERT INTO `sti_sexualactivity` VALUES (1,'Penetrative sex '),(2,'condoms used'),(3,'Vaginal  sex'),(4,'Oral sex'),(5,'Orogenital contact'),(6,'Oroanal contact'),(7,'Mutual masturbation');
/*!40000 ALTER TABLE `sti_sexualactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_sqnumber`
--

DROP TABLE IF EXISTS `sti_sqnumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_sqnumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sqnumber` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_sqnumber`
--

LOCK TABLES `sti_sqnumber` WRITE;
/*!40000 ALTER TABLE `sti_sqnumber` DISABLE KEYS */;
INSERT INTO `sti_sqnumber` VALUES (1,1,2019);
/*!40000 ALTER TABLE `sti_sqnumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_symptoms`
--

DROP TABLE IF EXISTS `sti_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_symptoms` (
  `id` int(11) unsigned zerofill NOT NULL,
  `symptoms` varchar(255) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_symptoms`
--

LOCK TABLES `sti_symptoms` WRITE;
/*!40000 ALTER TABLE `sti_symptoms` DISABLE KEYS */;
INSERT INTO `sti_symptoms` VALUES (00000000001,'Discharge from urethra ','0'),(00000000002,'Vaginal discharge','1'),(00000000003,'Swelling in the groin','2'),(00000000004,'Pain in the groin','2'),(00000000005,'Sores around the anus','2'),(00000000006,'Sores around the genitals','2'),(00000000007,'Lower abdominal pain ','1'),(00000000008,'Painful vaginal intercourse','1'),(00000000009,'Rectal discharge','2'),(00000000010,'Rectal pain','2'),(00000000011,'Difficulties with urination','2'),(00000000012,'Difficulties with defecation','2'),(00000000013,'Swellings ','2'),(00000000014,'lumps','2'),(00000000015,'discomfort in the perineum','2'),(00000000016,'Itching in the perineum','2'),(00000000017,'Itching  in the peri-anal','2'),(00000000018,'discomfort in the peri-anal','2'),(00000000019,'Itching in the  pubic areas','2'),(00000000020,'discomfort in the  pubic areas','2');
/*!40000 ALTER TABLE `sti_symptoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sti_treament`
--

DROP TABLE IF EXISTS `sti_treament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sti_treament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sti_number` varchar(45) DEFAULT NULL,
  `treatmentdate` date DEFAULT NULL,
  `typeofsti` varchar(225) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `Dose` varchar(255) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sti_treament`
--

LOCK TABLES `sti_treament` WRITE;
/*!40000 ALTER TABLE `sti_treament` DISABLE KEYS */;
/*!40000 ALTER TABLE `sti_treament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblappointments`
--

DROP TABLE IF EXISTS `tblappointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblappointments` (
  `PatientID` varchar(25) NOT NULL DEFAULT '',
  `DateOfAppointment` datetime NOT NULL,
  `DateAppointmentGiven` datetime DEFAULT NULL,
  `Cancelled` int(11) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PatientID`,`DateOfAppointment`),
  KEY `fi0` (`PatientID`),
  CONSTRAINT `tblappointments_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `tblpatients` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblappointments`
--

LOCK TABLES `tblappointments` WRITE;
/*!40000 ALTER TABLE `tblappointments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblappointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbaselinetests`
--

DROP TABLE IF EXISTS `tblbaselinetests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbaselinetests` (
  `TheID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` varchar(21) NOT NULL,
  `TestTypeID` varchar(3) DEFAULT NULL,
  `TestDate` datetime DEFAULT NULL,
  `ResultDate` datetime DEFAULT NULL,
  `ResultNumeric` varchar(10) DEFAULT NULL,
  `ResultNotes` varchar(255) DEFAULT NULL,
  `DateOfEnrolment` date DEFAULT NULL,
  PRIMARY KEY (`TheID`)
) ENGINE=InnoDB AUTO_INCREMENT=1691 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbaselinetests`
--

LOCK TABLES `tblbaselinetests` WRITE;
/*!40000 ALTER TABLE `tblbaselinetests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblbaselinetests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblbatches`
--

DROP TABLE IF EXISTS `tblbatches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblbatches` (
  `BatchNumber` varchar(20) NOT NULL,
  `MSDcode` varchar(8) DEFAULT NULL,
  `DateReceived` datetime DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `Finished` tinyint(4) DEFAULT NULL,
  `Notes` varchar(50) DEFAULT NULL,
  `InvoiceNumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BatchNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblbatches`
--

LOCK TABLES `tblbatches` WRITE;
/*!40000 ALTER TABLE `tblbatches` DISABLE KEYS */;
INSERT INTO `tblbatches` VALUES ('B/60','24/5353','2014-04-14 00:00:00',NULL,NULL,NULL,NULL),('bn234','24/8740','2014-02-05 00:00:00','2014-02-21 00:00:00',-1,NULL,'in567');
/*!40000 ALTER TABLE `tblbatches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblconfig`
--

DROP TABLE IF EXISTS `tblconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblconfig` (
  `RegionCode` int(11) NOT NULL,
  `DistrictCode` varchar(1) NOT NULL,
  `FacilityCode` varchar(2) NOT NULL,
  PRIMARY KEY (`RegionCode`,`DistrictCode`,`FacilityCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblconfig`
--

LOCK TABLES `tblconfig` WRITE;
/*!40000 ALTER TABLE `tblconfig` DISABLE KEYS */;
INSERT INTO `tblconfig` VALUES (1,'5','0A');
/*!40000 ALTER TABLE `tblconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblconfigoptions`
--

DROP TABLE IF EXISTS `tblconfigoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblconfigoptions` (
  `ConfigOptionName` varchar(50) NOT NULL,
  `ConfigOptionValue` varchar(50) DEFAULT NULL,
  `ConfigOptionDescription` varchar(126) DEFAULT NULL,
  PRIMARY KEY (`ConfigOptionName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblconfigoptions`
--

LOCK TABLES `tblconfigoptions` WRITE;
/*!40000 ALTER TABLE `tblconfigoptions` DISABLE KEYS */;
INSERT INTO `tblconfigoptions` VALUES ('Dispense form type','Transactional','Register or Transactional'),('Dispensers enter dispensing records','Yes','Yes or No'),('Facility type','Initiating','Initiating/Follow-up'),('Linked to CTC database','Yes','Yes or No'),('PastDateLimit','15219','Do not allow entry of visit dates more than this much in the past');
/*!40000 ALTER TABLE `tblconfigoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldatachecknotes`
--

DROP TABLE IF EXISTS `tbldatachecknotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldatachecknotes` (
  `PatientID` varchar(17) NOT NULL,
  `VisitDate` datetime NOT NULL,
  `DataCheckID` int(11) NOT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PatientID`,`VisitDate`,`DataCheckID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldatachecknotes`
--

LOCK TABLES `tbldatachecknotes` WRITE;
/*!40000 ALTER TABLE `tbldatachecknotes` DISABLE KEYS */;
INSERT INTO `tbldatachecknotes` VALUES ('01-05-0A-2011-A-0','1899-12-30 00:00:00',201,'Abandoned. Data in GB inconstistent'),('01-05-0A-2013-A-0','1899-12-30 00:00:00',201,'status blank'),('01-05-0A-2014-A-0','1899-12-30 00:00:00',201,'3'),('07-08-87-2016-A-0','2018-11-15 00:00:00',313,'1');
/*!40000 ALTER TABLE `tbldatachecknotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldispense`
--

DROP TABLE IF EXISTS `tbldispense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldispense` (
  `MSDCode` varchar(8) NOT NULL,
  `DispenseDate` datetime NOT NULL,
  `PatientID` varchar(25) NOT NULL DEFAULT '',
  `FullFacilityCode` varchar(8) DEFAULT NULL,
  `Transit` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UserNumber` int(11) DEFAULT NULL,
  `DispenserID` int(11) DEFAULT NULL,
  `DispenseOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`MSDCode`,`DispenseDate`,`PatientID`),
  KEY `fi0` (`DispenserID`),
  CONSTRAINT `tbldispense_ibfk_1` FOREIGN KEY (`DispenserID`) REFERENCES `tblsetupdispensers` (`DispenserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldispense`
--

LOCK TABLES `tbldispense` WRITE;
/*!40000 ALTER TABLE `tbldispense` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldispense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblexposedinfantmedication`
--

DROP TABLE IF EXISTS `tblexposedinfantmedication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblexposedinfantmedication` (
  `ExposedInfantID` varchar(25) NOT NULL,
  `VisitDate` datetime NOT NULL,
  `DrugTypeID` varchar(3) NOT NULL,
  `NumDaysDispensed` int(11) DEFAULT NULL,
  PRIMARY KEY (`ExposedInfantID`,`VisitDate`,`DrugTypeID`),
  KEY `fi0` (`ExposedInfantID`,`VisitDate`),
  CONSTRAINT `tblexposedinfantmedication_ibfk_1` FOREIGN KEY (`ExposedInfantID`, `VisitDate`) REFERENCES `tblexposedinfantvisits` (`ExposedInfantID`, `VisitDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblexposedinfantmedication`
--

LOCK TABLES `tblexposedinfantmedication` WRITE;
/*!40000 ALTER TABLE `tblexposedinfantmedication` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblexposedinfantmedication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblexposedinfantproblems`
--

DROP TABLE IF EXISTS `tblexposedinfantproblems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblexposedinfantproblems` (
  `ExposedInfantID` varchar(25) NOT NULL,
  `VisitDate` datetime NOT NULL,
  `ProblemAcronym` varchar(6) NOT NULL,
  PRIMARY KEY (`ExposedInfantID`,`VisitDate`,`ProblemAcronym`),
  KEY `fi0` (`ExposedInfantID`,`VisitDate`),
  CONSTRAINT `tblexposedinfantproblems_ibfk_1` FOREIGN KEY (`ExposedInfantID`, `VisitDate`) REFERENCES `tblexposedinfantvisits` (`ExposedInfantID`, `VisitDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblexposedinfantproblems`
--

LOCK TABLES `tblexposedinfantproblems` WRITE;
/*!40000 ALTER TABLE `tblexposedinfantproblems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblexposedinfantproblems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblexposedinfants`
--

DROP TABLE IF EXISTS `tblexposedinfants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblexposedinfants` (
  `ExposedInfantID` varchar(25) NOT NULL,
  `MotherPatientID` varchar(21) DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `Sex` varchar(6) DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `InfantStatusCode` varchar(3) DEFAULT NULL,
  `InfantStatusDate` datetime DEFAULT NULL,
  `ChildPatientID` varchar(21) DEFAULT NULL,
  `DateOfDeath` datetime DEFAULT NULL,
  `UserNumber` int(11) DEFAULT NULL,
  `TheTimeStamp` datetime DEFAULT NULL,
  `ModeOfDelivery` varchar(45) DEFAULT NULL,
  `PlaceOfDelivery` varchar(45) DEFAULT NULL,
  `RegistrationDate` date DEFAULT NULL,
  PRIMARY KEY (`ExposedInfantID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblexposedinfants`
--

LOCK TABLES `tblexposedinfants` WRITE;
/*!40000 ALTER TABLE `tblexposedinfants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblexposedinfants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblexposedinfanttests`
--

DROP TABLE IF EXISTS `tblexposedinfanttests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblexposedinfanttests` (
  `ExposedInfantID` varchar(25) NOT NULL,
  `TestDate` datetime NOT NULL,
  `TestTypeID` varchar(1) DEFAULT NULL,
  `TestResultID` varchar(3) DEFAULT NULL,
  `DateResultsObtained` datetime DEFAULT NULL,
  `DateResultsGiven` datetime DEFAULT NULL,
  PRIMARY KEY (`ExposedInfantID`,`TestDate`),
  KEY `fi0` (`ExposedInfantID`),
  CONSTRAINT `tblexposedinfanttests_ibfk_1` FOREIGN KEY (`ExposedInfantID`) REFERENCES `tblexposedinfants` (`ExposedInfantID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblexposedinfanttests`
--

LOCK TABLES `tblexposedinfanttests` WRITE;
/*!40000 ALTER TABLE `tblexposedinfanttests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblexposedinfanttests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblexposedinfantvisits`
--

DROP TABLE IF EXISTS `tblexposedinfantvisits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblexposedinfantvisits` (
  `ExposedInfantID` varchar(25) NOT NULL,
  `VisitDate` datetime NOT NULL,
  `VisitTypeCode` varchar(2) DEFAULT NULL,
  `Weight` double DEFAULT NULL,
  `FeedingPracticeID` varchar(8) DEFAULT NULL,
  `ImmunizationsUpToDate` int(11) DEFAULT NULL,
  `NextVisitDate` datetime DEFAULT NULL,
  `StaffID` int(11) DEFAULT NULL,
  `UserNumber` int(11) DEFAULT NULL,
  `TheTimeStamp` datetime DEFAULT NULL,
  `CotriSupplied` varchar(4) DEFAULT NULL,
  `NVPSupplied` varchar(4) DEFAULT NULL,
  `TypeOfHIVTestCode` varchar(2) DEFAULT NULL,
  `HIVTestResult` varchar(10) DEFAULT NULL,
  `HIVResultIssued` varchar(4) DEFAULT NULL,
  `Comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ExposedInfantID`,`VisitDate`),
  KEY `fi0` (`ExposedInfantID`),
  CONSTRAINT `tblexposedinfantvisits_ibfk_1` FOREIGN KEY (`ExposedInfantID`) REFERENCES `tblexposedinfants` (`ExposedInfantID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblexposedinfantvisits`
--

LOCK TABLES `tblexposedinfantvisits` WRITE;
/*!40000 ALTER TABLE `tblexposedinfantvisits` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblexposedinfantvisits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfamilyinfo`
--

DROP TABLE IF EXISTS `tblfamilyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblfamilyinfo` (
  `TheID` int(11) NOT NULL,
  `PatientID` varchar(21) DEFAULT NULL,
  `RelativeType` varchar(50) DEFAULT NULL,
  `RelativeAtThisClinic` varchar(3) DEFAULT NULL,
  `RelativeCTCID` varchar(25) DEFAULT NULL,
  `RelativeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TheID`),
  KEY `fi0` (`RelativeID`),
  KEY `fi1` (`PatientID`),
  CONSTRAINT `tblfamilyinfo_ibfk_1` FOREIGN KEY (`RelativeID`) REFERENCES `tblfamilyrelatives` (`RelativeID`),
  CONSTRAINT `tblfamilyinfo_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `tblpatients` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfamilyinfo`
--

LOCK TABLES `tblfamilyinfo` WRITE;
/*!40000 ALTER TABLE `tblfamilyinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblfamilyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblfamilyrelatives`
--

DROP TABLE IF EXISTS `tblfamilyrelatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblfamilyrelatives` (
  `RelativeID` int(11) NOT NULL,
  `RelativeCTCID` varchar(21) DEFAULT NULL,
  `RelativeName` varchar(255) DEFAULT NULL,
  `RelativeAge` int(11) DEFAULT NULL,
  `OnART` int(11) DEFAULT NULL,
  PRIMARY KEY (`RelativeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfamilyrelatives`
--

LOCK TABLES `tblfamilyrelatives` WRITE;
/*!40000 ALTER TABLE `tblfamilyrelatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblfamilyrelatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinventory`
--

DROP TABLE IF EXISTS `tblinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinventory` (
  `MSDCode` varchar(8) NOT NULL,
  `InventoryDate` datetime NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UserNumber` int(11) DEFAULT NULL,
  `Notes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MSDCode`,`InventoryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinventory`
--

LOCK TABLES `tblinventory` WRITE;
/*!40000 ALTER TABLE `tblinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblledger`
--

DROP TABLE IF EXISTS `tblledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblledger` (
  `MSDcode` varchar(8) NOT NULL,
  `LedgerDate` datetime NOT NULL,
  `LedgerEntryTypeCode` varchar(3) NOT NULL,
  `FullFacilityCode` varchar(10) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UserNumber` int(11) DEFAULT NULL,
  `Notes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MSDcode`,`LedgerDate`,`LedgerEntryTypeCode`,`FullFacilityCode`),
  KEY `fi0` (`LedgerEntryTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblledger`
--

LOCK TABLES `tblledger` WRITE;
/*!40000 ALTER TABLE `tblledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmedication`
--

DROP TABLE IF EXISTS `tblmedication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmedication` (
  `PatientID` varchar(21) NOT NULL,
  `VisitDate` datetime NOT NULL,
  `DrugTypeID` varchar(3) NOT NULL,
  `QuantityPrescribed` int(11) DEFAULT NULL,
  `PercentAdherence` int(11) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `QuantityDisp` int(11) DEFAULT NULL,
  PRIMARY KEY (`PatientID`,`VisitDate`,`DrugTypeID`),
  KEY `fi0` (`DrugTypeID`),
  KEY `fi1` (`PatientID`,`VisitDate`),
  CONSTRAINT `tblmedication_ibfk_2` FOREIGN KEY (`PatientID`, `VisitDate`) REFERENCES `tblvisits` (`PatientID`, `VisitDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmedication`
--

LOCK TABLES `tblmedication` WRITE;
/*!40000 ALTER TABLE `tblmedication` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmedication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpatients`
--

DROP TABLE IF EXISTS `tblpatients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpatients` (
  `PatientID` varchar(21) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `SurName` varchar(50) DEFAULT NULL,
  `NationalID` varchar(17) DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `Sex` varchar(6) DEFAULT NULL,
  `MaritalStatus` varchar(3) DEFAULT NULL,
  `MedInsSchemeName` varchar(255) DEFAULT NULL,
  `MedInsMemberName` varchar(255) DEFAULT NULL,
  `MedInsNumber` varchar(30) DEFAULT NULL,
  `MedInsRelationshipToMember` varchar(62) DEFAULT NULL,
  `NameNextKin` varchar(255) DEFAULT NULL,
  `PhysicalAddress` varchar(255) DEFAULT NULL,
  `PhysicalAddressNextKin` varchar(255) DEFAULT NULL,
  `NearestKraal` varchar(255) DEFAULT NULL,
  `NearestKraalNextKin` varchar(255) DEFAULT NULL,
  `NearestVillage` varchar(255) DEFAULT NULL,
  `NearestVillageNextKin` varchar(255) DEFAULT NULL,
  `NearestSchool` varchar(255) DEFAULT NULL,
  `NearestSchoolNextKin` varchar(255) DEFAULT NULL,
  `NearestClinic` varchar(255) DEFAULT NULL,
  `NearestClinicNextKin` varchar(255) DEFAULT NULL,
  `Phone` varchar(62) DEFAULT NULL,
  `PhoneNextKin` varchar(62) DEFAULT NULL,
  `CellPhone` varchar(62) DEFAULT NULL,
  `CellPhoneNextKin` varchar(62) DEFAULT NULL,
  `WorkAddress` varchar(255) DEFAULT NULL,
  `WorkAddressNextKin` varchar(255) DEFAULT NULL,
  `WorkTel` varchar(62) DEFAULT NULL,
  `WorkTelNextKin` varchar(62) DEFAULT NULL,
  `Occupation` varchar(255) DEFAULT NULL,
  `OccupationNextKin` varchar(255) DEFAULT NULL,
  `TransferInId` varchar(4) DEFAULT NULL,
  `ReferredFromID` varchar(21) DEFAULT NULL,
  `ReferredFromNotes` varchar(255) DEFAULT NULL,
  `OrphanStatusID` varchar(1) DEFAULT NULL,
  `EducationLevelID` varchar(1) DEFAULT NULL,
  `DateOfDeath` datetime DEFAULT NULL,
  `DateConfirmedHIVPositive` datetime DEFAULT NULL,
  `LocationHIVTestCode` varchar(8) DEFAULT NULL,
  `HIVTestTypeID` varchar(1) DEFAULT NULL,
  `HIVTestReasonID` varchar(3) DEFAULT NULL,
  `HIVTestNotes` varchar(255) DEFAULT NULL,
  `HIVTestLocationCode` varchar(8) DEFAULT NULL,
  `DrugAllergies` varchar(255) DEFAULT NULL,
  `FileRef` varchar(50) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `UserNumber` int(11) DEFAULT NULL,
  `TheTimeStamp` datetime DEFAULT NULL,
  `OPDNumber` varchar(255) DEFAULT NULL,
  `DateOfEnrolment` date DEFAULT NULL,
  `PersonalTracingName` varchar(100) DEFAULT NULL,
  `PersonalTracingDate` date DEFAULT NULL,
  `IndexCaseName` varchar(100) DEFAULT NULL,
  `IndexCaseDate` date DEFAULT NULL,
  `IsDisclosureHIV` varchar(4) DEFAULT NULL,
  `DisclosureYesWhom` varchar(45) DEFAULT NULL,
  `DisclosureNoReason` varchar(255) DEFAULT NULL,
  `DisclosureYesDate` date DEFAULT NULL,
  `DisclosureYesRelation` varchar(45) DEFAULT NULL,
  `IsRetestForHIVInitiation` varchar(4) DEFAULT NULL,
  `IsRetestForHIVInitiationDate` date DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  KEY `fi0` (`MaritalStatus`),
  KEY `fi1` (`EducationLevelID`),
  KEY `fi2` (`HIVTestReasonID`),
  KEY `fi3` (`HIVTestTypeID`),
  KEY `fi4` (`OrphanStatusID`),
  KEY `fi5` (`TransferInId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpatients`
--

LOCK TABLES `tblpatients` WRITE;
/*!40000 ALTER TABLE `tblpatients` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpatients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpatientspriorexposure`
--

DROP TABLE IF EXISTS `tblpatientspriorexposure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpatientspriorexposure` (
  `PatientID` varchar(21) NOT NULL,
  `DrugTypeID` varchar(3) NOT NULL,
  `RegimenCode` int(11) DEFAULT NULL,
  `DateStarted` datetime DEFAULT NULL,
  `DateLastTakenOrCompleted` datetime DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PatientID`,`DrugTypeID`),
  KEY `fi0` (`PatientID`),
  KEY `fi1` (`DrugTypeID`),
  CONSTRAINT `tblpatientspriorexposure_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `tblpatients` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpatientspriorexposure`
--

LOCK TABLES `tblpatientspriorexposure` WRITE;
/*!40000 ALTER TABLE `tblpatientspriorexposure` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpatientspriorexposure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpatientsproblems`
--

DROP TABLE IF EXISTS `tblpatientsproblems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpatientsproblems` (
  `PatientID` varchar(21) NOT NULL,
  `ProblemAcronym` varchar(3) NOT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PatientID`,`ProblemAcronym`),
  KEY `fi0` (`PatientID`),
  KEY `fi1` (`ProblemAcronym`),
  CONSTRAINT `tblpatientsproblems_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `tblpatients` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpatientsproblems`
--

LOCK TABLES `tblpatientsproblems` WRITE;
/*!40000 ALTER TABLE `tblpatientsproblems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpatientsproblems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpregnancies`
--

DROP TABLE IF EXISTS `tblpregnancies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpregnancies` (
  `PatientID` varchar(21) NOT NULL,
  `DueDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Notes` varchar(255) DEFAULT NULL,
  `ANCnumber` varchar(50) DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `PregnancyOutcomeID` varchar(1) DEFAULT NULL,
  `BirthLocation` varchar(255) DEFAULT NULL,
  `LDProphylaxisARVCode` int(3) DEFAULT NULL,
  `DeliveryModeID` varchar(3) DEFAULT NULL,
  `NumberLiveBorn` int(11) DEFAULT NULL,
  `PresentationID` varchar(3) DEFAULT NULL,
  `TearID` varchar(3) DEFAULT NULL,
  `AssistanceID` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`PatientID`,`DueDate`),
  KEY `fi0` (`PatientID`),
  CONSTRAINT `tblpregnancies_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `tblpatients` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpregnancies`
--

LOCK TABLES `tblpregnancies` WRITE;
/*!40000 ALTER TABLE `tblpregnancies` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblpregnancies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproblems`
--

DROP TABLE IF EXISTS `tblproblems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblproblems` (
  `PatientID` varchar(21) NOT NULL,
  `VisitDate` datetime NOT NULL,
  `ProblemAcronym` varchar(6) NOT NULL,
  PRIMARY KEY (`PatientID`,`VisitDate`,`ProblemAcronym`),
  KEY `fi0` (`ProblemAcronym`),
  KEY `fi1` (`PatientID`,`VisitDate`),
  CONSTRAINT `tblproblems_ibfk_2` FOREIGN KEY (`PatientID`, `VisitDate`) REFERENCES `tblvisits` (`PatientID`, `VisitDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblproblems`
--

LOCK TABLES `tblproblems` WRITE;
/*!40000 ALTER TABLE `tblproblems` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblproblems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblreferralsto`
--

DROP TABLE IF EXISTS `tblreferralsto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreferralsto` (
  `PatientID` varchar(21) NOT NULL,
  `VisitDate` datetime NOT NULL,
  `ReferralToCode` varchar(1) NOT NULL,
  PRIMARY KEY (`PatientID`,`VisitDate`,`ReferralToCode`),
  KEY `fi0` (`ReferralToCode`),
  KEY `fi1` (`PatientID`,`VisitDate`),
  CONSTRAINT `tblreferralsto_ibfk_2` FOREIGN KEY (`PatientID`, `VisitDate`) REFERENCES `tblvisits` (`PatientID`, `VisitDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblreferralsto`
--

LOCK TABLES `tblreferralsto` WRITE;
/*!40000 ALTER TABLE `tblreferralsto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblreferralsto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrequestdates`
--

DROP TABLE IF EXISTS `tblrequestdates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrequestdates` (
  `PeriodEndDate` datetime NOT NULL,
  `SentDate` datetime DEFAULT NULL,
  PRIMARY KEY (`PeriodEndDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequestdates`
--

LOCK TABLES `tblrequestdates` WRITE;
/*!40000 ALTER TABLE `tblrequestdates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequestdates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrequests`
--

DROP TABLE IF EXISTS `tblrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrequests` (
  `MSDCode` varchar(8) NOT NULL,
  `PeriodEndDate` datetime NOT NULL,
  `QuantityRequested` int(11) DEFAULT NULL,
  `Remarks` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MSDCode`,`PeriodEndDate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequests`
--

LOCK TABLES `tblrequests` WRITE;
/*!40000 ALTER TABLE `tblrequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupadverseeventsstatus`
--

DROP TABLE IF EXISTS `tblsetupadverseeventsstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupadverseeventsstatus` (
  `AdverseEventsStatusCode` varchar(50) NOT NULL,
  `AdverseEventsStatusDescription` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AdverseEventsStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupadverseeventsstatus`
--

LOCK TABLES `tblsetupadverseeventsstatus` WRITE;
/*!40000 ALTER TABLE `tblsetupadverseeventsstatus` DISABLE KEYS */;
INSERT INTO `tblsetupadverseeventsstatus` VALUES ('a=INH1','adverse events reported on INH'),('b=INH2','stopping INH due adverse events'),('c=CTX1','adverse events reported on CTX'),('d=CTX2','stopping CTX due to adverse events'),('e=Diflucan1','adverse events repoted on Diflucan'),('f=Diflucan2','stopping Diflucan due to adverse event'),('g=ART 1st line 1','adverse events reported on 1st line ART'),('h=ART 1st line 2','stopping 1st line ART due to adverse events'),('i=ART 2nd regimen 1','adverse events reported on 2nd line ART'),('J=ART 2ndregimen 2','stopping 2nd line ART due to adverse events'),('k=ART 3rd regimen 1','adverse events reported on 3rd line ART'),('l=ART 3rd regimen 2','stopping 3rd line ART due to adverse events');
/*!40000 ALTER TABLE `tblsetupadverseeventsstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuparvfixeddosecombinations`
--

DROP TABLE IF EXISTS `tblsetuparvfixeddosecombinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuparvfixeddosecombinations` (
  `ARVcode` int(11) NOT NULL,
  `ARVName` varchar(50) DEFAULT NULL,
  `ARVDescription` varchar(100) DEFAULT NULL,
  `V2Code` varchar(50) DEFAULT NULL,
  `RegimenType` varchar(50) DEFAULT NULL,
  `Adults` int(11) DEFAULT NULL,
  `Peds` int(11) DEFAULT NULL,
  `PharmCode` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`ARVcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuparvfixeddosecombinations`
--

LOCK TABLES `tblsetuparvfixeddosecombinations` WRITE;
/*!40000 ALTER TABLE `tblsetuparvfixeddosecombinations` DISABLE KEYS */;
INSERT INTO `tblsetuparvfixeddosecombinations` VALUES (1,NULL,'d4T (30), 3TC, NVP','1a(30)','First line',-1,0,'AT002'),(5,NULL,'AZT, 3TC, NVP','1c','First line',-1,0,'AT004'),(6,NULL,'AZT, 3TC, EFV','1d','First line',-1,0,'AT005'),(7,NULL,'d4T (30), 3TC, EFV','1b(30)','First line',-1,0,'AT003'),(8,NULL,'ABC, ddl, LPV/r','2c','Second line',-1,0,'AT011/AT012'),(23,NULL,'d4T, 3TC, EFV','4b','First line',0,-1,'PT003'),(26,NULL,'TDF, 3TC, EFV','1f','First line',-1,0,'AT006'),(27,NULL,'TDF, 3TC, NVP','1e','First line',-1,0,'AT001'),(28,NULL,'ABC, ddI, ATV/r','2f','Second line',-1,0,'AT013/AT014'),(29,NULL,'TDF, 3TC, LPV/r','2b','Second line',-1,0,'AT009'),(31,NULL,'ABC, 3TC, LPV/r','5b','Second line',0,-1,'PT010'),(40,NULL,'AZT, 3TC, LPV/r','2a','Second line',-1,0,'AT015'),(41,NULL,'AZT, 3TC, ATV/r','2d','Second line',-1,0,'AT016'),(42,NULL,'AZT, 3TC, LPV/r','4e','First line',0,-1,'PT005'),(43,NULL,'TDF, 3TC, ATV/r','2e','Second line',-1,0,'AT010'),(44,NULL,'AZT, 3TC, NVP  (paediatric dose)','4c','First line',0,-1,'PT002'),(45,NULL,'AZT, 3TC, EFV (paediatric dose)','4d','First line',0,-1,'PT004'),(46,NULL,'ABC,DDI,LPV/r(paediatric doses)','4f','First line',0,-1,NULL),(47,NULL,'ABC, ddl, LPV/r (paediatric dose)','5a','Second line',0,-1,'PT007'),(48,NULL,'AZT,3TC,NPV','5c','Second line',0,-1,NULL),(80,NULL,'sdNVP','P-sdNVP','PLD',-1,NULL,NULL),(81,NULL,'AZT','6a','PPG',-1,NULL,NULL),(83,NULL,'sdNVP, AZT+3TC tail','P-NA3','PLD',-1,NULL,NULL),(90,NULL,'d4T, 3TC, NVP (paediatric dose)','4a','First line',0,-1,'PT001'),(97,NULL,'AZT,3TC,EFV 400','1g','First line',-1,0,'PT001'),(98,NULL,'ABC,DDI400,LPV/r','2g','Second line',-1,0,'PT001'),(99,NULL,'TDF,3TC,EFV 400','1h','First line',-1,0,NULL),(100,NULL,'AZT,DDI250,LPV/r','2h','Second line',-1,0,NULL),(101,NULL,'AZT,DDI400,LPV/r','2i','Second line',-1,0,NULL),(102,NULL,'ABC,DDI400,ATV/r','2j','Second line',-1,0,NULL),(103,NULL,'RAL/DRV/RTV','3a','Third line',-1,0,NULL),(104,NULL,'ABC,3TC,LPV/r (paediatric dose)','4g','First line',0,-1,NULL),(105,NULL,'ABC,3TC,EFV (paediatric dose)','4h','First line',0,-1,NULL),(106,NULL,'Other First line paediatric','4i','First line',0,-1,NULL),(107,NULL,'ABC,DDI,NVP(paediatric dose)','5d','Second line',0,-1,NULL),(108,NULL,'AZT,DDI,LPV/r(paediatric dose)','5e','Second line',0,-1,NULL),(109,NULL,'ABC,3TC,NVP(paediatric dose)','5f','Second line',0,-1,NULL),(110,NULL,'Other second line paediatric','5g','Second line',0,-1,NULL),(111,NULL,'TDF,3TC,DTG(TLD1)','1i','First  line',-1,0,NULL),(112,NULL,'AZT,3TC,DTG','1j','First line',-1,0,NULL),(113,NULL,'Other First line Adults','1k','First line',-1,0,NULL),(114,NULL,'ABC,3TC,DTG','2k','Second line',-1,0,NULL),(115,NULL,'AZT,3TC,DTG','2l','Second line',-1,0,NULL),(116,NULL,'TDF,3TC,DTG(TLD2)','2m','Second line',-1,0,NULL),(117,NULL,'Other Second line Adults','2n','Second line',-1,0,NULL),(118,NULL,'DTG/DRV/RTV','3a','Third line',-1,0,NULL),(119,NULL,'Other Third line Adults','3b','Third line',-1,0,NULL),(120,NULL,'AZT,3TC,RAL','4i','First  line',0,-1,NULL),(121,NULL,'ABC,3TC,DTG','4j','First  line',0,-1,NULL),(122,NULL,'TDF,3TC,DTG','4k','First  line',0,-1,NULL),(123,NULL,'Other first  line paediatric','4i','First  line',0,-1,NULL),(124,NULL,'ABC,3TC,DTG','5g','Second line',0,-1,NULL),(125,NULL,'TDF,3TC,ATV/r','5h','Second line',0,-1,NULL),(126,NULL,'TDF,3TC,DTG','5i','Second line',0,-1,NULL),(127,NULL,'Other Second  line paediatric','5j','Second line',0,-1,NULL),(128,NULL,'DTG/DRV/RTV','6a','Third line',0,-1,NULL),(129,NULL,'Other Third  line paediatric','6b','Third line',0,-1,NULL);
/*!40000 ALTER TABLE `tblsetuparvfixeddosecombinations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuparvreasoncodes`
--

DROP TABLE IF EXISTS `tblsetuparvreasoncodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuparvreasoncodes` (
  `ARVReasonCode` int(11) NOT NULL,
  `ARVReason` varchar(100) DEFAULT NULL,
  `ReasonCategory` varchar(50) DEFAULT NULL,
  `MedEligible` int(11) DEFAULT NULL,
  `Ready` int(11) DEFAULT NULL,
  PRIMARY KEY (`ARVReasonCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuparvreasoncodes`
--

LOCK TABLES `tblsetuparvreasoncodes` WRITE;
/*!40000 ALTER TABLE `tblsetuparvreasoncodes` DISABLE KEYS */;
INSERT INTO `tblsetuparvreasoncodes` VALUES (11,'Does not fulfill criteria',NULL,1,0),(12,'Fulfils criteria, but counseling for ARVs is ongoing',NULL,1,0),(13,'Fulfils criteria, but no ARVs available',NULL,1,-1),(14,'Fulfils criteria, but is not willing',NULL,1,0),(15,'Fulfils criteria, but is on TB Rx',NULL,1,0),(16,'Fulfills criteria, but awaits lab results',NULL,1,0),(17,'Fulfills criteria but has OI and is too sick to start',NULL,1,0),(18,'Fulfils criteria but does not start for other reason',NULL,1,-1),(201,'Adult CD4 < 350',NULL,2,0),(202,'Adult WHO Stage 3 and 4',NULL,2,0),(203,'Children Pediatric WHO Stage 3 and 4',NULL,2,0),(204,'Children between 24-59 months, CD4% < 25%',NULL,2,0),(205,'Children < 2 years who are HIV positive regardless of CD4 count / WHO stage',NULL,2,0),(206,'Children >= 5 years CD4 < 350',NULL,2,0),(207,'Pregnant women for PMTCT CD4 < 350',NULL,2,NULL),(208,'Other reason to start',NULL,2,0),(401,'Start TB treatment',NULL,4,0),(402,'Nausea / vomiting','Adverse Reactions',4,0),(403,'Diarrhoea','Adverse Reactions',4,0),(404,'Headache','Adverse Reactions',4,0),(405,'Fever','Adverse Reactions',4,0),(406,'Skin rash','Adverse Reactions',4,0),(407,'Peripheral neuropathy','Adverse Reactions',4,0),(408,'Hepatitis','Adverse Reactions',4,0),(409,'Jaundice','Adverse Reactions',4,0),(410,'Dementia','Adverse Reactions',4,0),(411,'Anaemia','Adverse Reactions',4,0),(412,'Pancreatitis','Adverse Reactions',4,0),(413,'CNS adverse event','Adverse Reactions',4,0),(414,'Other adverse event, specify','Adverse Reactions',4,0),(415,'Treatment failure, clinical','Treatment Failure',4,0),(416,'Treatment failure, immunological','Treatment Failure',4,0),(417,'Poor adherence','Other Reason',4,0),(418,'Patient decision','Other Reason',4,0),(419,'Pregnancy','Other Reason',4,0),(420,'End of PMTCT','Other Reason',4,0),(421,'Stock-out','Other Reason',4,0),(422,'Other reason, specify','Other Reason',4,0),(423,'Restart ARV after 3 or months not on ARV',NULL,4,0);
/*!40000 ALTER TABLE `tblsetuparvreasoncodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuparvstatuscodes`
--

DROP TABLE IF EXISTS `tblsetuparvstatuscodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuparvstatuscodes` (
  `ARVStatusCode` int(11) NOT NULL,
  `ARVStatusDescription` varchar(50) DEFAULT NULL,
  `OnARVs` int(11) DEFAULT NULL,
  PRIMARY KEY (`ARVStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuparvstatuscodes`
--

LOCK TABLES `tblsetuparvstatuscodes` WRITE;
/*!40000 ALTER TABLE `tblsetuparvstatuscodes` DISABLE KEYS */;
INSERT INTO `tblsetuparvstatuscodes` VALUES (1,'No ARV',0),(2,'Start ARV',-1),(3,'Continue ARV',-1),(4,'Change ARV',-1),(5,'Stop ARV',0),(6,'Restart ARV',-1),(7,'PMTCT prophylaxis',0);
/*!40000 ALTER TABLE `tblsetuparvstatuscodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuparvstatusreasonmap`
--

DROP TABLE IF EXISTS `tblsetuparvstatusreasonmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuparvstatusreasonmap` (
  `ARVReasonCode` int(11) NOT NULL,
  `ARVStatusCode` int(11) NOT NULL,
  PRIMARY KEY (`ARVReasonCode`,`ARVStatusCode`),
  KEY `fi0` (`ARVReasonCode`),
  KEY `fi1` (`ARVStatusCode`),
  CONSTRAINT `tblsetuparvstatusreasonmap_ibfk_1` FOREIGN KEY (`ARVReasonCode`) REFERENCES `tblsetuparvreasoncodes` (`ARVReasonCode`),
  CONSTRAINT `tblsetuparvstatusreasonmap_ibfk_2` FOREIGN KEY (`ARVStatusCode`) REFERENCES `tblsetuparvstatuscodes` (`ARVStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuparvstatusreasonmap`
--

LOCK TABLES `tblsetuparvstatusreasonmap` WRITE;
/*!40000 ALTER TABLE `tblsetuparvstatusreasonmap` DISABLE KEYS */;
INSERT INTO `tblsetuparvstatusreasonmap` VALUES (11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(201,2),(202,2),(203,2),(204,2),(205,2),(206,2),(207,2),(208,2),(401,4),(401,5),(402,4),(402,5),(403,4),(403,5),(404,4),(404,5),(405,4),(405,5),(406,4),(406,5),(407,4),(407,5),(408,4),(408,5),(409,4),(409,5),(410,4),(410,5),(411,4),(411,5),(412,4),(412,5),(413,4),(413,5),(414,4),(414,5),(415,4),(415,5),(416,4),(416,5),(417,4),(417,5),(418,4),(418,5),(419,4),(419,5),(420,4),(420,5),(421,4),(421,5),(422,4),(422,5),(423,4),(423,5);
/*!40000 ALTER TABLE `tblsetuparvstatusreasonmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupdeliverymodes`
--

DROP TABLE IF EXISTS `tblsetupdeliverymodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupdeliverymodes` (
  `DeliveryModeID` varchar(3) NOT NULL,
  `DeliveryMode` varchar(255) DEFAULT NULL,
  `Category` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`DeliveryModeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupdeliverymodes`
--

LOCK TABLES `tblsetupdeliverymodes` WRITE;
/*!40000 ALTER TABLE `tblsetupdeliverymodes` DISABLE KEYS */;
INSERT INTO `tblsetupdeliverymodes` VALUES ('BRC','Breech','Presentation'),('CSR','Caesarian','Mode of delivery'),('EPS','Episiotomy','Tear'),('FRC','Foreceps','Assistance'),('MLP','Malpresentation','Presentation'),('TEA','Natural tear','Tear'),('VCM','Vacuum','Assistance'),('VGL','Vaginal','Mode of delivery');
/*!40000 ALTER TABLE `tblsetupdeliverymodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupdispensers`
--

DROP TABLE IF EXISTS `tblsetupdispensers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupdispensers` (
  `DispenserID` int(11) NOT NULL,
  `DispenserFirstName` varchar(50) DEFAULT NULL,
  `DispenserSurname` varchar(50) DEFAULT NULL,
  `UserNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`DispenserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupdispensers`
--

LOCK TABLES `tblsetupdispensers` WRITE;
/*!40000 ALTER TABLE `tblsetupdispensers` DISABLE KEYS */;
INSERT INTO `tblsetupdispensers` VALUES (1,'Florence','Thondlana',69),(2,'Cuthbert','Chideme',84);
/*!40000 ALTER TABLE `tblsetupdispensers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupdistricts`
--

DROP TABLE IF EXISTS `tblsetupdistricts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupdistricts` (
  `RegionCode` int(11) NOT NULL,
  `DistrictCode` varchar(1) NOT NULL,
  `District` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RegionCode`,`DistrictCode`),
  KEY `fi0` (`RegionCode`),
  CONSTRAINT `tblsetupdistricts_ibfk_1` FOREIGN KEY (`RegionCode`) REFERENCES `tblsetupregions` (`RegionCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupdistricts`
--

LOCK TABLES `tblsetupdistricts` WRITE;
/*!40000 ALTER TABLE `tblsetupdistricts` DISABLE KEYS */;
INSERT INTO `tblsetupdistricts` VALUES (0,'1','Harare Rural'),(0,'A','Harare Urban'),(0,'B','Chitungwisa Urban'),(0,'C','Chitungwiza Hospital'),(0,'D','Harare Central Hospital'),(0,'E','Parirenyatwa'),(0,'F','Harare City Clinics'),(1,'1','Buhera'),(1,'2','Chimanimani'),(1,'3','Chipinge'),(1,'4','Makoni'),(1,'5','Mutare'),(1,'6','Mutasa'),(1,'7','Nyanga'),(1,'8','Mutare City'),(2,'1','Bindura'),(2,'2','Centenary'),(2,'3','Guruve'),(2,'4','Mazowe'),(2,'5','Mt. Darwin'),(2,'6','Rushinga'),(2,'7','Shamva'),(2,'8','Mbire'),(3,'1','Chikomba'),(3,'2','Goromonzi'),(3,'3','U.M.P'),(3,'4','Hwedza'),(3,'5','Marondera'),(3,'6','Mudzi'),(3,'7','Murewa'),(3,'8','Mutoko'),(3,'9','Seke'),(4,'1','Chegutu'),(4,'2','Hurungwe'),(4,'3','Kadoma'),(4,'4','Kariba'),(4,'5','Makonde'),(4,'6','Zvimba'),(5,'1','Binga'),(5,'2','Bubi'),(5,'3','Hwange'),(5,'4','Lupane'),(5,'5','Nkayi'),(5,'6','Tsholotsho'),(5,'7','Umguza'),(6,'1','Beitbridge'),(6,'2','Bulilima'),(6,'3','Gwanda'),(6,'4','Insiza'),(6,'5','Matobo'),(6,'6','Umzingwane'),(6,'7','Mangwe'),(7,'1','Chirumhanzu'),(7,'2','Gokwe North'),(7,'3','Gweru'),(7,'4','Kwekwe'),(7,'5','Mberengwa'),(7,'6','Shurugwi'),(7,'7','Zvishavane'),(7,'8','Gokwe South'),(8,'1','Bikita'),(8,'2','Chiredzi'),(8,'3','Chivi'),(8,'4','Gutu'),(8,'5','Masvingo'),(8,'6','Mwenezi'),(8,'7','Zaka'),(9,'1','Bulawayo (Rural)'),(9,'A','Bulawayo (Urban)'),(9,'B','Ingutsheni'),(9,'C','U.B.H.'),(9,'D','Mpilo Hospital'),(10,'1','Brine'),(11,'1','Brine');
/*!40000 ALTER TABLE `tblsetupdistricts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupdrugtypes`
--

DROP TABLE IF EXISTS `tblsetupdrugtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupdrugtypes` (
  `DrugTypeID` varchar(3) NOT NULL,
  `DrugType` varchar(255) DEFAULT NULL,
  `InitialVisitPriorExposure` int(11) DEFAULT NULL,
  `EveryVisit` int(11) DEFAULT NULL,
  `ForInfants` int(11) DEFAULT NULL,
  PRIMARY KEY (`DrugTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupdrugtypes`
--

LOCK TABLES `tblsetupdrugtypes` WRITE;
/*!40000 ALTER TABLE `tblsetupdrugtypes` DISABLE KEYS */;
INSERT INTO `tblsetupdrugtypes` VALUES ('ARV','ART',-1,0,0),('COT','Cotrimoxazole',-1,-1,-1),('FLU','Fluconazole',-1,-1,0),('IPT','Isoniazid prophylaxis therapy',0,-1,0),('NVP','Neverapine',0,0,-1),('OTH','Other',-1,0,0),('PLD','PMTCT in labour and delivery',-1,0,0),('PPG','PMTCT during pregnancy',-1,0,0),('TB1','Current TB therapy category I (new)',-1,0,0),('TB2','Current TB therapy category II (relapse)',-1,0,0);
/*!40000 ALTER TABLE `tblsetupdrugtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupeducationlevel`
--

DROP TABLE IF EXISTS `tblsetupeducationlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupeducationlevel` (
  `EducationLevelID` varchar(1) NOT NULL,
  `EducationLevel` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`EducationLevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupeducationlevel`
--

LOCK TABLES `tblsetupeducationlevel` WRITE;
/*!40000 ALTER TABLE `tblsetupeducationlevel` DISABLE KEYS */;
INSERT INTO `tblsetupeducationlevel` VALUES ('N','None'),('P','Primary'),('S','Secondary'),('T','Tertiary');
/*!40000 ALTER TABLE `tblsetupeducationlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupfamilyplanning`
--

DROP TABLE IF EXISTS `tblsetupfamilyplanning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupfamilyplanning` (
  `FamilyPlanningID` varchar(1) NOT NULL,
  `FamilyPlanningMethod` varchar(150) DEFAULT NULL,
  `TheOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`FamilyPlanningID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupfamilyplanning`
--

LOCK TABLES `tblsetupfamilyplanning` WRITE;
/*!40000 ALTER TABLE `tblsetupfamilyplanning` DISABLE KEYS */;
INSERT INTO `tblsetupfamilyplanning` VALUES ('A','Abstinence',1),('C','Condom',7),('J','Depo - Injection',9),('L','IUD',8),('M','Implants',6),('O','Not using',2),('P','Pills',5),('T','Traditional/withdrawal',4),('Z','Sterlization',3);
/*!40000 ALTER TABLE `tblsetupfamilyplanning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupfunctionalstatus`
--

DROP TABLE IF EXISTS `tblsetupfunctionalstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupfunctionalstatus` (
  `FunctionalStatusCode` varchar(1) NOT NULL,
  `FunctionalStatusDescription` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FunctionalStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupfunctionalstatus`
--

LOCK TABLES `tblsetupfunctionalstatus` WRITE;
/*!40000 ALTER TABLE `tblsetupfunctionalstatus` DISABLE KEYS */;
INSERT INTO `tblsetupfunctionalstatus` VALUES ('A','Ambulatory'),('B','Bedridden'),('W','Working');
/*!40000 ALTER TABLE `tblsetupfunctionalstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuphivtestreasons`
--

DROP TABLE IF EXISTS `tblsetuphivtestreasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuphivtestreasons` (
  `HIVTestReasonID` varchar(1) NOT NULL,
  `HIVTestReason` varchar(62) DEFAULT NULL,
  PRIMARY KEY (`HIVTestReasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuphivtestreasons`
--

LOCK TABLES `tblsetuphivtestreasons` WRITE;
/*!40000 ALTER TABLE `tblsetuphivtestreasons` DISABLE KEYS */;
INSERT INTO `tblsetuphivtestreasons` VALUES ('A','Antenatal'),('D','Death of child/spouse'),('I','Hospital/Illness'),('O','Occupational'),('R','Spouse or child < 5 on ART'),('T','TB'),('V','VCT'),('X','Other');
/*!40000 ALTER TABLE `tblsetuphivtestreasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuphivtesttypes`
--

DROP TABLE IF EXISTS `tblsetuphivtesttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuphivtesttypes` (
  `HIVTestTypeID` varchar(1) NOT NULL,
  `HIVTestType` varchar(62) DEFAULT NULL,
  PRIMARY KEY (`HIVTestTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuphivtesttypes`
--

LOCK TABLES `tblsetuphivtesttypes` WRITE;
/*!40000 ALTER TABLE `tblsetuphivtesttypes` DISABLE KEYS */;
INSERT INTO `tblsetuphivtesttypes` VALUES ('A','Antibody'),('P','Virological DNA/PCR');
/*!40000 ALTER TABLE `tblsetuphivtesttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupinfantfeedingpractices`
--

DROP TABLE IF EXISTS `tblsetupinfantfeedingpractices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupinfantfeedingpractices` (
  `FeedingPracticeID` varchar(3) NOT NULL,
  `FeedingPractice` varchar(255) DEFAULT NULL,
  `FeedingPracticeDescription` varchar(255) DEFAULT NULL,
  `NumCode` int(11) DEFAULT NULL,
  `ExposedToHIV` int(11) DEFAULT NULL,
  PRIMARY KEY (`FeedingPracticeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupinfantfeedingpractices`
--

LOCK TABLES `tblsetupinfantfeedingpractices` WRITE;
/*!40000 ALTER TABLE `tblsetupinfantfeedingpractices` DISABLE KEYS */;
INSERT INTO `tblsetupinfantfeedingpractices` VALUES ('AM','Exclusive modified animal milk','Infant fed by only modified animal milk',4,0),('EBF','Exclusive breast feeding','Infant fed by only breast milk',1,-1),('EBT','Exclusive heat-treated breast milk','Infant fed by only heat-treated breast milk',2,0),('FM','Exclusive infant formula milk','Infant fed by only infant formula milk',3,0),('MF','Mixed breast feeding and food/other milk','Infant fed by breast milk as well as other milk and/or food',5,-1),('RF','Food and/or other milk with no breast milk','Infant fed only by other milk and/or food (no breast milk)',6,0);
/*!40000 ALTER TABLE `tblsetupinfantfeedingpractices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupiptreasoncodes`
--

DROP TABLE IF EXISTS `tblsetupiptreasoncodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupiptreasoncodes` (
  `IPTReasonCode` int(11) NOT NULL,
  `IPTReason` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IPTReasonCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupiptreasoncodes`
--

LOCK TABLES `tblsetupiptreasoncodes` WRITE;
/*!40000 ALTER TABLE `tblsetupiptreasoncodes` DISABLE KEYS */;
INSERT INTO `tblsetupiptreasoncodes` VALUES (1,'Signs of active TB disease'),(2,'Patient already on TB treatment'),(3,'Patient completed TPT in the past 3 years'),(4,'Patient on ART for less than 3 months'),(5,'Signs of active liver disease'),(6,'Heavy alcohol use'),(7,'Others (specify)'),(8,'Completed TPT'),(9,'Severe Adverse Event'),(10,'Severe Skin Rush'),(11,'Severe Averse Event Specify');
/*!40000 ALTER TABLE `tblsetupiptreasoncodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupiptstatus`
--

DROP TABLE IF EXISTS `tblsetupiptstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupiptstatus` (
  `IPTStatusCode` varchar(4) NOT NULL,
  `IPTStatusCodeDescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IPTStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupiptstatus`
--

LOCK TABLES `tblsetupiptstatus` WRITE;
/*!40000 ALTER TABLE `tblsetupiptstatus` DISABLE KEYS */;
INSERT INTO `tblsetupiptstatus` VALUES ('CI','Continue TPT'),('HPI','Rifapentine Initiated'),('IC','TPT Completed'),('II','TPT Initiated'),('INI','TPT Not Initaited'),('IS','TPT Stopped'),('N/A','Not Applicable'),('NE','Not Eligible for TPT'),('RI','Restart TPT');
/*!40000 ALTER TABLE `tblsetupiptstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupledgerentrytypes`
--

DROP TABLE IF EXISTS `tblsetupledgerentrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupledgerentrytypes` (
  `LedgerEntryTypeCode` varchar(3) NOT NULL,
  `LedgerEntryType` varchar(50) DEFAULT NULL,
  `PosOrNeg` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`LedgerEntryTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupledgerentrytypes`
--

LOCK TABLES `tblsetupledgerentrytypes` WRITE;
/*!40000 ALTER TABLE `tblsetupledgerentrytypes` DISABLE KEYS */;
INSERT INTO `tblsetupledgerentrytypes` VALUES ('DAM','Damaged','Negative'),('EXP','Expired','Negative'),('GOF','Transferred to other facility','Negative'),('LOS','Lost','Negative'),('MOT','Received from other facility','Positive'),('MSD','Received from Natpharm','Positive'),('RFE','Received or procured from elsewhere','Positive');
/*!40000 ALTER TABLE `tblsetupledgerentrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupmaritalstatus`
--

DROP TABLE IF EXISTS `tblsetupmaritalstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupmaritalstatus` (
  `MaritalStatusCode` varchar(3) NOT NULL,
  `MaritalStatus` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaritalStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupmaritalstatus`
--

LOCK TABLES `tblsetupmaritalstatus` WRITE;
/*!40000 ALTER TABLE `tblsetupmaritalstatus` DISABLE KEYS */;
INSERT INTO `tblsetupmaritalstatus` VALUES ('D','Divorced'),('M','Married'),('S','Single'),('W','Widowed');
/*!40000 ALTER TABLE `tblsetupmaritalstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupnosfacilities`
--

DROP TABLE IF EXISTS `tblsetupnosfacilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupnosfacilities` (
  `FullFacilityCode` varchar(10) NOT NULL,
  PRIMARY KEY (`FullFacilityCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupnosfacilities`
--

LOCK TABLES `tblsetupnosfacilities` WRITE;
/*!40000 ALTER TABLE `tblsetupnosfacilities` DISABLE KEYS */;
INSERT INTO `tblsetupnosfacilities` VALUES ('01-05-04');
/*!40000 ALTER TABLE `tblsetupnosfacilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuporphanstatus`
--

DROP TABLE IF EXISTS `tblsetuporphanstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuporphanstatus` (
  `OrphanStatusID` varchar(1) NOT NULL,
  `OrphanStatus` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`OrphanStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuporphanstatus`
--

LOCK TABLES `tblsetuporphanstatus` WRITE;
/*!40000 ALTER TABLE `tblsetuporphanstatus` DISABLE KEYS */;
INSERT INTO `tblsetuporphanstatus` VALUES ('D','Double (Both deceased)'),('F','Father deceased'),('M','Mother deceased');
/*!40000 ALTER TABLE `tblsetuporphanstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuppregnancyoutcomes`
--

DROP TABLE IF EXISTS `tblsetuppregnancyoutcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuppregnancyoutcomes` (
  `PregnancyOutcomeID` varchar(1) NOT NULL,
  `PregnancyOutcome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PregnancyOutcomeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuppregnancyoutcomes`
--

LOCK TABLES `tblsetuppregnancyoutcomes` WRITE;
/*!40000 ALTER TABLE `tblsetuppregnancyoutcomes` DISABLE KEYS */;
INSERT INTO `tblsetuppregnancyoutcomes` VALUES ('L','Live birth'),('M','Miscarriage'),('S','Still birth');
/*!40000 ALTER TABLE `tblsetuppregnancyoutcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuppregnancystatus`
--

DROP TABLE IF EXISTS `tblsetuppregnancystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuppregnancystatus` (
  `pregnancystatuscode` varchar(4) NOT NULL,
  `pregnancystatusdescription` varchar(50) NOT NULL,
  PRIMARY KEY (`pregnancystatuscode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuppregnancystatus`
--

LOCK TABLES `tblsetuppregnancystatus` WRITE;
/*!40000 ALTER TABLE `tblsetuppregnancystatus` DISABLE KEYS */;
INSERT INTO `tblsetuppregnancystatus` VALUES ('L','Lactating'),('N/A','Not Applicable'),('NPL','Neither Pregnant nor Lactating'),('P','Pregnant');
/*!40000 ALTER TABLE `tblsetuppregnancystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupproblems`
--

DROP TABLE IF EXISTS `tblsetupproblems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupproblems` (
  `ProblemAcronym` varchar(3) NOT NULL,
  `ProblemType` varchar(255) DEFAULT NULL,
  `ProblemDescription` varchar(255) DEFAULT NULL,
  `TheOrder` int(11) DEFAULT NULL,
  `ForStandard` int(11) DEFAULT NULL,
  `ForInfants` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProblemAcronym`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupproblems`
--

LOCK TABLES `tblsetupproblems` WRITE;
/*!40000 ALTER TABLE `tblsetupproblems` DISABLE KEYS */;
INSERT INTO `tblsetupproblems` VALUES ('ABD','Current symptoms','Abdominal pain',4,-1,-1),('ABL','Examination','Abdomen abnormal - liver enlarged',59,-1,-1),('ABO','Examination','Abdomen abnormal - other',61,-1,-1),('ABS','Examination','Abdomen abnormal - spleen enlarged',60,-1,-1),('ALC','Past medical history','Heavy alcohol use',43,-1,0),('BHF','Current symptoms','Burning hands or feet',17,-1,-1),('C','New OI or other problems','Cough',72,-1,-1),('CCS','Past medical history','Cervical cancer screening before',33,-1,0),('CGP','Current symptoms','Current cough - productive',9,-1,-1),('CHS','Examination','Chest abnormal',58,-1,-1),('CMN','Past medical history','Cryptococcal meningitis',35,-1,-1),('CND','Past medical history','Oesophageal candidiasis',28,-1,-1),('CNS','Examination','Central nervous system abnormal',52,-1,-1),('COG','Current symptoms','Current cough',8,-1,-1),('CPN','Current symptoms','Chronic pain',16,-1,-1),('CUB','Current signs','Coughing up blood (Hemoptysis)',18,-1,-1),('CVS','Examination','Cardio vascular system abnormal',56,-1,-1),('CYN','Examination','Cyanosis',50,-1,-1),('D','New OI or other problems','Demential/Encephalitis',68,-1,-1),('DB','New OI or other problems','Difficulty Breathing',73,-1,-1),('DCI','Past medical history','Disseminated Cryptococcal Infection',46,-1,-1),('DIA','Current symptoms','Diarrhoea',13,-1,-1),('DIB','Current symptoms','Diarrhoea with blood',14,-1,-1),('DIM','Current symptoms','Diarrhoea >1 month',15,-1,-1),('DMP','Past medical history','Diarrhoea >1 month',36,-1,-1),('EAR','Examination','Ears abnormal',54,-1,-1),('ELN','Examination','Enlarged Lymph Nodes',47,-1,-1),('EYE','Examination','Eyes abnormal',53,-1,-1),('F','New OI or other problems','Fever',71,-1,-1),('FAT','Current symptoms','Chronic fatigue',5,-1,-1),('FEV','Current symptoms','Fever >1 month',2,-1,-1),('FLU','Current symptoms','Flu-like (URTI)',1,-1,-1),('FMT','Past medical history','Family member treated for TB',42,-1,-1),('FTH','Current signs','Failure to thrive / unexplained malnutrition',23,-1,-1),('FVU','Past medical history','Fever >1 month unexplained',38,-1,-1),('GEN','Current signs','Genital discharge',21,-1,-1),('GND','Examination','Genital/perenium abnormal - discharge',64,-1,0),('GNO','Examination','Genital/perenium abnormal - other',65,-1,0),('GNU','Examination','Genital/perenium abnormal - ulcers',63,-1,0),('GNW','Examination','Genital/perenium abnormal - warts',62,-1,0),('HAD','Current symptoms','Headaches',7,-1,-1),('HPG','Past medical history','Herpes simplex 2 (genital)',31,-1,0),('HPO','Past medical history','Herpes simplex 1 (oral)',30,-1,-1),('HPZ','Past medical history','Herpes zoster',32,-1,-1),('HSO','Past medical history','Ever hospitalized for Ois',44,-1,-1),('I','New OI or other problems','Immune Reconstitution Inflammatory Syndrome',74,-1,-1),('JND','Examination','Jaundice',49,-1,-1),('KPS','Past medical history','Kaposi\'s Sarcoma',34,-1,-1),('MEN','Current signs','Mental confusion',22,-1,0),('MST','Examination','Mental status abnormal',51,-1,0),('MTH','Examination','Mouth abnormal',57,-1,-1),('NAS','Current symptoms','Nausea and/or vomiting',12,-1,-1),('NKS','Current signs','Neck stiffness',20,-1,-1),('NMB','Current symptoms','Numbness / tingling',6,-1,-1),('NSW','Current symptoms','Night sweats',11,-1,-1),('OSR','Past medical history','Other skin rash',45,-1,-1),('OTH','New OI or other problems','Other problem',76,-1,-1),('P','New OI or other problems','Pneumonia',67,-1,-1),('PAL','Examination','Pallor',48,-1,-1),('PGL','Past medical history','Persistent generalized lymphadenopathy',29,-1,-1),('PNE','Past medical history','Pneumonia (recurrent)',39,-1,-1),('PRG','Current signs','Pregnant',19,-1,0),('RES','Current symptoms','Difficult / laboured respiration (Dyspnea)',10,-1,-1),('RTI','Past medical history','Recurrent upper respiratory tract infections',37,-1,-1),('SMK','Examination','Skin/muscular skeletal system abnormal',55,-1,-1),('SWA','Current symptoms','Difficulty in swallowing (Dysphagia) and/or Odynophagia',3,-1,-1),('T','New OI or other problems','Thrush - oral / vaginal',69,-1,-1),('TBE','Past medical history','TB - extra pulomonary',41,-1,-1),('TBP','Past medical history','TB - pulmonary',40,-1,-1),('THR','Past medical history','Oropharyngeal candidiasis (thrush)',27,-1,-1),('U','New OI or other problems','Ulcers - mouth or other',70,-1,-1),('W','New OI or other problems','Weight loss',75,-1,-1),('WLG','Current signs','Weight loss >10%',25,-1,-1),('WLL','Current signs','Weight loss <10%',24,-1,-1),('WST','Past medical history','Wasting syndrome',26,-1,-1),('Z','New OI or other problems','Zoster',66,-1,-1);
/*!40000 ALTER TABLE `tblsetupproblems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupreferrals`
--

DROP TABLE IF EXISTS `tblsetupreferrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupreferrals` (
  `ReferredFromID` varchar(1) NOT NULL,
  `ReferredFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ReferredFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupreferrals`
--

LOCK TABLES `tblsetupreferrals` WRITE;
/*!40000 ALTER TABLE `tblsetupreferrals` DISABLE KEYS */;
INSERT INTO `tblsetupreferrals` VALUES ('A','OI/ART'),('E','EID'),('H','Hospital'),('P','PMTCT'),('T','TB'),('V','VCT/PICT');
/*!40000 ALTER TABLE `tblsetupreferrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupreferralsto`
--

DROP TABLE IF EXISTS `tblsetupreferralsto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupreferralsto` (
  `ReferralToCode` varchar(1) NOT NULL,
  `ReferralTo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ReferralToCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupreferralsto`
--

LOCK TABLES `tblsetupreferralsto` WRITE;
/*!40000 ALTER TABLE `tblsetupreferralsto` DISABLE KEYS */;
INSERT INTO `tblsetupreferralsto` VALUES ('F','Family Planning Services'),('O','Other services (specify)'),('P','PMTCT'),('T','TB Clinic');
/*!40000 ALTER TABLE `tblsetupreferralsto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupregions`
--

DROP TABLE IF EXISTS `tblsetupregions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupregions` (
  `RegionCode` int(11) NOT NULL,
  `Region` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RegionCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupregions`
--

LOCK TABLES `tblsetupregions` WRITE;
/*!40000 ALTER TABLE `tblsetupregions` DISABLE KEYS */;
INSERT INTO `tblsetupregions` VALUES (0,'Harare'),(1,'Manicaland'),(2,'Mashonaland Central'),(3,'Mashonaland East'),(4,'Mashonaland West'),(5,'Matabeleland North'),(6,'Matabeleland South'),(7,'Midlands'),(8,'Masvingo'),(9,'Bulawayo'),(10,'Masvikeni A'),(11,'Masvikeni B');
/*!40000 ALTER TABLE `tblsetupregions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupstaff`
--

DROP TABLE IF EXISTS `tblsetupstaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupstaff` (
  `StaffID` int(11) NOT NULL,
  `StaffSurname` varchar(50) DEFAULT NULL,
  `StaffFirstname` varchar(50) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupstaff`
--

LOCK TABLES `tblsetupstaff` WRITE;
/*!40000 ALTER TABLE `tblsetupstaff` DISABLE KEYS */;
INSERT INTO `tblsetupstaff` VALUES (1,'Nyabadza','Esther','RGN'),(2,'Mutetwa','Fadzai','RGN'),(3,'Mutenure','Ellen','RGN'),(4,'Chipi','Natsai','RGN.'),(5,'Mutepfa','Mugove','RGN'),(6,'Tinorwa','Maxwell','Primary Counsellor'),(7,'Kapondo','Francisca','Primary Counsellor'),(8,'Mutede','Dr','Doctor'),(9,'Sichori','Rachel','Primary Counsellor'),(10,'Matseka','Gilbert','Primary Counsellor'),(11,'Chisedzi','Margret','Primary Counsellor'),(12,'Ndlovu','Keith','Pharmacist'),(14,'Chideme','Cuthbert','Dispensar'),(15,'Dirwai','Dirwai','Dispensar'),(16,'Maningi','Elvis','Primary Counsellor'),(17,'Paterson','Andrew Mark','Doctor'),(18,'Forster','Geoffrey','Doctor'),(19,'Kapangazuwiri','Jacqueline','RGN'),(20,'Kaja','Jessiman','RGN'),(21,'Kurehwa','Mary','RGN'),(22,'Sigauke','Sigauke','RGN'),(23,'Manyore','Rosemary','RGN'),(24,'Goronga','Delight','Primary Counsellor'),(25,'Sithole','Ndombi','Doctor'),(26,'Chirara','Hope','Primary Counsellor');
/*!40000 ALTER TABLE `tblsetupstaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupstatus`
--

DROP TABLE IF EXISTS `tblsetupstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupstatus` (
  `Status` varchar(50) NOT NULL,
  `StatusType` varchar(7) DEFAULT NULL,
  `StatusCode` varchar(6) DEFAULT NULL,
  `ForStandard` int(11) DEFAULT NULL,
  `InfantStatusCode` varchar(3) DEFAULT NULL,
  `InfantStatusDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupstatus`
--

LOCK TABLES `tblsetupstatus` WRITE;
/*!40000 ALTER TABLE `tblsetupstatus` DISABLE KEYS */;
INSERT INTO `tblsetupstatus` VALUES ('Attending this clinic','Default','Tx',-1,NULL,NULL),('Confirmed HIV positive',NULL,NULL,NULL,'POS','Confirmed HIV positive'),('Died','Death','D',-1,'DIE','Died'),('Lost to follow-up','Lost','LTFU',-1,'LFU','Lost to follow-up'),('Missing appointments','Lost','MISS',-1,NULL,NULL),('Not HIV positive',NULL,'NP',NULL,'NEG','Confirmed HIV Negative'),('Opted out',NULL,'OO',-1,NULL,NULL),('Transferred to another clinic',NULL,'TO',-1,'TRN','Transferred out');
/*!40000 ALTER TABLE `tblsetupstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuptbinvestigationresults`
--

DROP TABLE IF EXISTS `tblsetuptbinvestigationresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuptbinvestigationresults` (
  `TBInvestigationResults` int(4) NOT NULL,
  `TBInvestigationResultsDescription` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`TBInvestigationResults`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuptbinvestigationresults`
--

LOCK TABLES `tblsetuptbinvestigationresults` WRITE;
/*!40000 ALTER TABLE `tblsetuptbinvestigationresults` DISABLE KEYS */;
INSERT INTO `tblsetuptbinvestigationresults` VALUES (1,'Investigated and has Active TB'),(2,'Investigated and has NO Active TB'),(3,'NOT Investigated'),(4,'N/A'),(5,'Investigated and has Active TB and started on TB Treatment');
/*!40000 ALTER TABLE `tblsetuptbinvestigationresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuptbstatus`
--

DROP TABLE IF EXISTS `tblsetuptbstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuptbstatus` (
  `TBStatusCode` varchar(2) NOT NULL,
  `TBStatusDescription` varchar(60) DEFAULT NULL,
  `HasTB` int(11) DEFAULT NULL,
  `TBSuspected` int(11) DEFAULT NULL,
  `TBScreened` int(11) DEFAULT NULL,
  PRIMARY KEY (`TBStatusCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuptbstatus`
--

LOCK TABLES `tblsetuptbstatus` WRITE;
/*!40000 ALTER TABLE `tblsetuptbstatus` DISABLE KEYS */;
INSERT INTO `tblsetuptbstatus` VALUES ('NO','Not assessed',0,0,0),('ON','Currently on TB treatment',-1,-1,0),('S','Suspected - there are signs',0,-1,-1),('Y','No signs (patient screened and TB not suspected)',0,0,-1);
/*!40000 ALTER TABLE `tblsetuptbstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuptestresults`
--

DROP TABLE IF EXISTS `tblsetuptestresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuptestresults` (
  `TestResultID` varchar(3) NOT NULL,
  `TestResult` varchar(255) DEFAULT NULL,
  `Confirmed` int(11) DEFAULT NULL,
  PRIMARY KEY (`TestResultID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuptestresults`
--

LOCK TABLES `tblsetuptestresults` WRITE;
/*!40000 ALTER TABLE `tblsetuptestresults` DISABLE KEYS */;
INSERT INTO `tblsetuptestresults` VALUES ('NEG','Negative',-1),('POS','Positive',-1),('UND','Undetermined',0);
/*!40000 ALTER TABLE `tblsetuptestresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuptesttypes`
--

DROP TABLE IF EXISTS `tblsetuptesttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuptesttypes` (
  `TestTypeID` varchar(3) NOT NULL,
  `TestType` varchar(255) DEFAULT NULL,
  `Units` varchar(14) DEFAULT NULL,
  `InitialVisit` int(11) DEFAULT NULL,
  `EveryVisit` int(11) DEFAULT NULL,
  `Instant` int(11) DEFAULT NULL,
  PRIMARY KEY (`TestTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuptesttypes`
--

LOCK TABLES `tblsetuptesttypes` WRITE;
/*!40000 ALTER TABLE `tblsetuptesttypes` DISABLE KEYS */;
INSERT INTO `tblsetuptesttypes` VALUES ('ALT','ALT','mmol/L',-1,0,0),('BPD','Blood pressure diastolic','mmHg',-1,0,-1),('BPS','Blood pressure systolic','mmHg',-1,0,-1),('CD%','CD4 percent','%',-1,-1,0),('CD4','CD4 count','cell/mm3',-1,-1,0),('HBX','HB','g/dL',-1,0,0),('HGC','Height in cm','cm',0,-1,-1),('HGM','Height in metres','m',-1,0,-1),('OTH','Other tests',NULL,0,-1,0),('PUL','Pulse','bpm',-1,0,-1),('RES','Respiration Rate','breaths/m',-1,0,-1),('TMP','Temperature','celsuis',-1,0,-1),('VRL','Viral load','copies/ml',0,-1,0),('WBC','WBC','cell/mcL',-1,0,0),('WGT','Weight','Kg',-1,-1,-1);
/*!40000 ALTER TABLE `tblsetuptesttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuptpttype`
--

DROP TABLE IF EXISTS `tblsetuptpttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuptpttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeoftpt` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuptpttype`
--

LOCK TABLES `tblsetuptpttype` WRITE;
/*!40000 ALTER TABLE `tblsetuptpttype` DISABLE KEYS */;
INSERT INTO `tblsetuptpttype` VALUES (1,'IPT'),(2,'3HP'),(3,'NE');
/*!40000 ALTER TABLE `tblsetuptpttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetuptransferin`
--

DROP TABLE IF EXISTS `tblsetuptransferin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetuptransferin` (
  `TransferInID` varchar(4) NOT NULL,
  `TransferIn` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TransferInID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetuptransferin`
--

LOCK TABLES `tblsetuptransferin` WRITE;
/*!40000 ALTER TABLE `tblsetuptransferin` DISABLE KEYS */;
INSERT INTO `tblsetuptransferin` VALUES ('AR','On ART'),('CR','In care (pre-ART)');
/*!40000 ALTER TABLE `tblsetuptransferin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupvisitstatus`
--

DROP TABLE IF EXISTS `tblsetupvisitstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupvisitstatus` (
  `visitstatuscode` varchar(4) NOT NULL,
  `visitstatusdescription` varchar(50) NOT NULL,
  PRIMARY KEY (`visitstatuscode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupvisitstatus`
--

LOCK TABLES `tblsetupvisitstatus` WRITE;
/*!40000 ALTER TABLE `tblsetupvisitstatus` DISABLE KEYS */;
INSERT INTO `tblsetupvisitstatus` VALUES ('D','Default (<90days)'),('E','Earlier than review date'),('L','Late but not default'),('LO','Lost to Followup'),('OT','On-Time');
/*!40000 ALTER TABLE `tblsetupvisitstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsetupvisittypes`
--

DROP TABLE IF EXISTS `tblsetupvisittypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblsetupvisittypes` (
  `VisitTypeCode` varchar(2) NOT NULL,
  `VisitType` varchar(15) DEFAULT NULL,
  `VisitTypeLong` varchar(100) DEFAULT NULL,
  `TheOrder` int(11) DEFAULT NULL,
  `ForStandard` int(11) DEFAULT NULL,
  `ForInfants` int(11) DEFAULT NULL,
  `DSDclinical` int(2) DEFAULT NULL,
  `DSDRefil` int(2) DEFAULT NULL,
  PRIMARY KEY (`VisitTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsetupvisittypes`
--

LOCK TABLES `tblsetupvisittypes` WRITE;
/*!40000 ALTER TABLE `tblsetupvisittypes` DISABLE KEYS */;
INSERT INTO `tblsetupvisittypes` VALUES ('B','Birth','At birth',4,0,-1,0,0),('CL','Clinical','Clinical Visit',0,0,0,2,0),('D','CARG','Community ART Refill Group(CARG)',7,-1,-1,1,1),('E','Group FPU','Group Facility Pickup(Club refill)',8,-1,-1,1,1),('F','Ind PUP','Individual Pickup From Pharmacy(Fast Track)',9,-1,-1,1,1),('G','Ind PUM','Individual Pickup Via Mobile ',10,-1,-1,1,1),('H','Family Refill','Family Refill Member',11,-1,-1,1,1),('IC','Without mother','Infant visit without mother',6,0,-1,0,0),('IM','With mother','Infant visit with mother',5,0,-1,0,0),('O','Other clinic','Visit to other clinic reported to this clinic',3,-1,-1,1,1),('P','Self','Patient presents self for review',1,-1,0,1,0),('RF','Refill','ART Refill visit',0,0,0,2,0),('TS','Treatment supp','Treatment supporter on behalf of patient',2,-1,-1,1,1);
/*!40000 ALTER TABLE `tblsetupvisittypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblstatus`
--

DROP TABLE IF EXISTS `tblstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblstatus` (
  `PatientID` varchar(21) NOT NULL,
  `StatusDate` datetime NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `TransferOutToWhere` varchar(8) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PatientID`,`StatusDate`),
  KEY `fi0` (`Status`),
  KEY `fi1` (`PatientID`),
  CONSTRAINT `tblstatus_ibfk_2` FOREIGN KEY (`PatientID`) REFERENCES `tblpatients` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblstatus`
--

LOCK TABLES `tblstatus` WRITE;
/*!40000 ALTER TABLE `tblstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltests`
--

DROP TABLE IF EXISTS `tbltests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbltests` (
  `TheID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` varchar(21) DEFAULT NULL,
  `TestTypeID` varchar(3) DEFAULT NULL,
  `TestDate` datetime DEFAULT NULL,
  `ResultDate` datetime DEFAULT NULL,
  `ResultNumeric` float DEFAULT NULL,
  `ResultNotes` varchar(255) DEFAULT NULL,
  `RecievedDate` datetime DEFAULT NULL,
  `VisitDate` datetime DEFAULT NULL,
  `Status` varchar(95) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Sex` varchar(45) DEFAULT NULL,
  `ARVStatusCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`TheID`),
  KEY `fi0` (`PatientID`),
  KEY `fi1` (`TestTypeID`),
  CONSTRAINT `tbltests_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `tblpatients` (`PatientID`)
) ENGINE=InnoDB AUTO_INCREMENT=57003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltests`
--

LOCK TABLES `tbltests` WRITE;
/*!40000 ALTER TABLE `tbltests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbltests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblvisits`
--

DROP TABLE IF EXISTS `tblvisits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblvisits` (
  `PatientID` varchar(21) NOT NULL,
  `VisitDate` datetime NOT NULL,
  `VisitType` varchar(4) DEFAULT NULL,
  `VisitTypeCode` varchar(2) DEFAULT NULL,
  `NowPregnant` varchar(3) DEFAULT NULL,
  `FamilyPlanningID` varchar(1) DEFAULT NULL,
  `FunctionalStatusCode` varchar(1) DEFAULT NULL,
  `WHOStage` int(11) DEFAULT NULL,
  `TBStatusCode` varchar(2) DEFAULT NULL,
  `IPTReasonCode` int(11) DEFAULT NULL,
  `TypeOfTPT` varchar(45) DEFAULT NULL,
  `ARVStatusCode` int(11) DEFAULT NULL,
  `ARVReasonCode` int(11) DEFAULT NULL,
  `ARVCode` int(11) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `StaffID` int(11) DEFAULT NULL,
  `UserNumber` int(11) DEFAULT NULL,
  `TheTimeStamp` datetime DEFAULT NULL,
  `AdverseEventsStatusCode` varchar(45) DEFAULT NULL,
  `DispenserID` varchar(45) DEFAULT NULL,
  `DateOfFirstANC` varchar(45) DEFAULT NULL,
  `LNMPDate` date DEFAULT NULL,
  `TBInvestigationResults` int(4) DEFAULT NULL,
  `IPTStatusCode` varchar(4) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Sex` varchar(45) DEFAULT NULL,
  `Status` varchar(90) DEFAULT NULL,
  `RegDate` date DEFAULT NULL,
  PRIMARY KEY (`PatientID`,`VisitDate`),
  KEY `fi0` (`StaffID`),
  KEY `fi1` (`FunctionalStatusCode`),
  KEY `fi2` (`PatientID`),
  KEY `fi3` (`ARVCode`),
  KEY `fi4` (`ARVReasonCode`),
  KEY `fi5` (`ARVStatusCode`),
  KEY `fi6` (`FamilyPlanningID`),
  KEY `fi7` (`IPTReasonCode`),
  KEY `fi8` (`TBStatusCode`),
  KEY `fi9` (`VisitTypeCode`),
  CONSTRAINT `tblvisits_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `tblsetupstaff` (`StaffID`),
  CONSTRAINT `tblvisits_ibfk_3` FOREIGN KEY (`PatientID`) REFERENCES `tblpatients` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblvisits`
--

LOCK TABLES `tblvisits` WRITE;
/*!40000 ALTER TABLE `tblvisits` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblvisits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(605) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Position` varchar(255) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  `LastLogIn` date DEFAULT NULL,
  `DateCreated` date DEFAULT NULL,
  `DateModified` date DEFAULT NULL,
  `ProvinceID` int(11) DEFAULT NULL,
  `DistrictID` int(11) DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'muchineripi',NULL,'Mamhinga','mm','34b87148f45a37bbbd9e6eb62f0bfbac692618f36e248cc6de31e4089f9b9f38','mmamhinga@gmail.com','1','','2016-02-23','2016-02-23','2016-02-23',10,1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `UserName` varchar(255) NOT NULL,
  `RoleID` varchar(255) NOT NULL,
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES ('mm','Admin',3),('mm','Executive',16),('mm','Lab Technician',19);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit` (
  `visitId` int(11) NOT NULL AUTO_INCREMENT,
  `visitPlanId` bigint(15) DEFAULT NULL,
  `visitDate` datetime DEFAULT NULL,
  `visitInterval` varchar(45) DEFAULT NULL,
  `attendedBy` varchar(255) DEFAULT NULL,
  `visitAdverse` bit(1) DEFAULT NULL,
  `adverseCode` varchar(45) DEFAULT NULL,
  `adverseSeverity` varchar(45) DEFAULT NULL,
  `StaffComent` varchar(255) DEFAULT NULL,
  `visitType` varchar(45) DEFAULT NULL,
  `visitName` varchar(100) DEFAULT NULL,
  `IsWoundHealing` bit(1) DEFAULT NULL,
  `hasResumedSex` bit(1) DEFAULT NULL,
  `riskReductionPlan` varchar(255) DEFAULT NULL,
  `startDate` varchar(45) DEFAULT '2019-09-01',
  `endDate` varchar(45) DEFAULT '2020-04-31',
  PRIMARY KEY (`visitId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
INSERT INTO `visit` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-09-01','2020-04-31');
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitplans`
--

DROP TABLE IF EXISTS `visitplans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitplans` (
  `vpId` bigint(15) NOT NULL AUTO_INCREMENT,
  `visitPlanDate` datetime DEFAULT NULL,
  `authorisedBy` varchar(255) DEFAULT NULL,
  `isDone` bit(1) DEFAULT NULL,
  `visitPlanDateCreated` datetime DEFAULT NULL,
  `visitPlanDescri` varchar(100) DEFAULT NULL,
  `vmmcId` varchar(255) NOT NULL,
  `opdNumber` varchar(255) NOT NULL,
  PRIMARY KEY (`vpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitplans`
--

LOCK TABLES `visitplans` WRITE;
/*!40000 ALTER TABLE `visitplans` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitplans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visittype`
--

DROP TABLE IF EXISTS `visittype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visittype` (
  `ID` int(11) NOT NULL,
  `VisitName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visittype`
--

LOCK TABLES `visittype` WRITE;
/*!40000 ALTER TABLE `visittype` DISABLE KEYS */;
/*!40000 ALTER TABLE `visittype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc`
--

DROP TABLE IF EXISTS `vmmc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc` (
  `TypeofFacility` varchar(255) DEFAULT NULL,
  `FacilityCode` varchar(255) DEFAULT NULL,
  `VMMCNumber` varchar(255) NOT NULL,
  `Comment` text,
  `OPDNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`VMMCNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc`
--

LOCK TABLES `vmmc` WRITE;
/*!40000 ALTER TABLE `vmmc` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_adverseevents`
--

DROP TABLE IF EXISTS `vmmc_adverseevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_adverseevents` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VMMCID` varchar(255) DEFAULT NULL,
  `NoAdverseEvents` varchar(11) DEFAULT NULL,
  `HadAdverseEvents` varchar(11) DEFAULT NULL,
  `AEManagment` text,
  `VMMCNumber` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_adverseevents`
--

LOCK TABLES `vmmc_adverseevents` WRITE;
/*!40000 ALTER TABLE `vmmc_adverseevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_adverseevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_adverseeventtype`
--

DROP TABLE IF EXISTS `vmmc_adverseeventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_adverseeventtype` (
  `ID` int(11) NOT NULL,
  `AdverseEventID` int(11) DEFAULT NULL,
  `AdverseEventType_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_adverseeventtype`
--

LOCK TABLES `vmmc_adverseeventtype` WRITE;
/*!40000 ALTER TABLE `vmmc_adverseeventtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_adverseeventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_circumcisionmethod`
--

DROP TABLE IF EXISTS `vmmc_circumcisionmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_circumcisionmethod` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VMMCID` varchar(255) DEFAULT NULL,
  `PatientType` varchar(255) DEFAULT NULL,
  `InformedConsentGranted` varchar(10) DEFAULT NULL,
  `AdultsClinicianInitials` varchar(255) DEFAULT NULL,
  `ParentSignature` varchar(10) DEFAULT NULL,
  `MinorsClinicanInitials` varchar(255) DEFAULT NULL,
  `ConsentObtainedBy` varchar(255) DEFAULT NULL,
  `CircumcisionMethod` varchar(255) DEFAULT NULL,
  `CircumcisionChosenByClients` varchar(255) DEFAULT NULL,
  `OtherEligibleSpecify` varchar(255) DEFAULT NULL,
  `OtherAppropriateSpecify` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_circumcisionmethod`
--

LOCK TABLES `vmmc_circumcisionmethod` WRITE;
/*!40000 ALTER TABLE `vmmc_circumcisionmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_circumcisionmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_circumcisionprocedure`
--

DROP TABLE IF EXISTS `vmmc_circumcisionprocedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_circumcisionprocedure` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VMMCID` varchar(255) DEFAULT NULL,
  `DateofProcedure` date DEFAULT NULL,
  `CircumciserName` varchar(255) DEFAULT NULL,
  `CircumciserProfession` varchar(255) DEFAULT NULL,
  `AssistantName` varchar(255) DEFAULT NULL,
  `AssistantProfession` varchar(255) DEFAULT NULL,
  `ClinicalNote` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_circumcisionprocedure`
--

LOCK TABLES `vmmc_circumcisionprocedure` WRITE;
/*!40000 ALTER TABLE `vmmc_circumcisionprocedure` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_circumcisionprocedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_circumcisionreason`
--

DROP TABLE IF EXISTS `vmmc_circumcisionreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_circumcisionreason` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VMMCID` varchar(255) DEFAULT NULL,
  `CircumcisionReasonType_Id` int(11) DEFAULT NULL,
  `SpecifyOtherReasons` varchar(255) DEFAULT NULL,
  `ReasonsDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_circumcisionreason`
--

LOCK TABLES `vmmc_circumcisionreason` WRITE;
/*!40000 ALTER TABLE `vmmc_circumcisionreason` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_circumcisionreason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_complaints`
--

DROP TABLE IF EXISTS `vmmc_complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_complaints` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VMMCID` varchar(255) DEFAULT NULL,
  `ComplaintType_Id` int(11) DEFAULT NULL,
  `SpecifyComplaint` varchar(255) DEFAULT NULL,
  `ComplaintDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_complaints`
--

LOCK TABLES `vmmc_complaints` WRITE;
/*!40000 ALTER TABLE `vmmc_complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_generalcondition`
--

DROP TABLE IF EXISTS `vmmc_generalcondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_generalcondition` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VMMCID` varchar(255) DEFAULT NULL,
  `GeneralConditionType_Id` int(11) DEFAULT NULL,
  `SpecifyGeneralCondition` varchar(255) DEFAULT NULL,
  `GeneralConditonDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_generalcondition`
--

LOCK TABLES `vmmc_generalcondition` WRITE;
/*!40000 ALTER TABLE `vmmc_generalcondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_generalcondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_genitalexam`
--

DROP TABLE IF EXISTS `vmmc_genitalexam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_genitalexam` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VMMCID` varchar(255) DEFAULT NULL,
  `GenitalExamType_Id` int(11) DEFAULT NULL,
  `GenitalExamDescription` varchar(255) DEFAULT NULL,
  `SpecifyOtherGenitalExam` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_genitalexam`
--

LOCK TABLES `vmmc_genitalexam` WRITE;
/*!40000 ALTER TABLE `vmmc_genitalexam` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_genitalexam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_medicalscreening`
--

DROP TABLE IF EXISTS `vmmc_medicalscreening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_medicalscreening` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OPDNumber` varchar(255) DEFAULT NULL,
  `Weight` double DEFAULT NULL,
  `Temperature` double DEFAULT NULL,
  `BloodPressure` varchar(255) DEFAULT NULL,
  `Pulse` double DEFAULT NULL,
  `AreKnownAllergies` varchar(11) DEFAULT NULL,
  `Allergies` text,
  `AnyMedications` varchar(11) DEFAULT NULL,
  `Medications` text,
  `AnyOperations` varchar(11) DEFAULT NULL,
  `Operations` text,
  `HasTestedHIV` varchar(11) DEFAULT NULL,
  `IfTestedLessOneMonth` varchar(255) DEFAULT NULL,
  `IfTestedResult` varchar(11) DEFAULT NULL,
  `ProofTestProvided` varchar(11) DEFAULT NULL,
  `IsAbnormalBleeding` varchar(11) DEFAULT NULL,
  `FamilyHistoryabnormalbleeding` varchar(255) DEFAULT NULL,
  `DateTaken` date DEFAULT NULL,
  `HIVTestResult` varchar(11) DEFAULT NULL,
  `CD4cellCount` int(4) DEFAULT NULL,
  `WHOClinicalStage` int(4) DEFAULT NULL,
  `HIVTestDone` varchar(11) DEFAULT NULL,
  `VMMCID` varchar(255) DEFAULT NULL,
  `IfTestedOneThreeMonths` varchar(255) DEFAULT NULL,
  `IfTestedMoreThreeMonths` varchar(255) DEFAULT NULL,
  `IfTestedSpecify` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_medicalscreening`
--

LOCK TABLES `vmmc_medicalscreening` WRITE;
/*!40000 ALTER TABLE `vmmc_medicalscreening` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_medicalscreening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_postprocedureassessment`
--

DROP TABLE IF EXISTS `vmmc_postprocedureassessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_postprocedureassessment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VMMCID` varchar(255) DEFAULT NULL,
  `BloodPressure` varchar(255) DEFAULT NULL,
  `Pulse` double(255,0) DEFAULT NULL,
  `PrePexDevicePlaced` varchar(11) DEFAULT NULL,
  `ClientProvideedInstruction` varchar(11) DEFAULT NULL,
  `GivenMCClientCard` varchar(11) DEFAULT NULL,
  `AnalgesiaGiven` varchar(11) DEFAULT NULL,
  `Drug` varchar(255) DEFAULT NULL,
  `GeneralCondition` varchar(255) DEFAULT NULL,
  `NextVisitDate` date DEFAULT NULL,
  `DischargedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_postprocedureassessment`
--

LOCK TABLES `vmmc_postprocedureassessment` WRITE;
/*!40000 ALTER TABLE `vmmc_postprocedureassessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_postprocedureassessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_prepexmalecircumcision`
--

DROP TABLE IF EXISTS `vmmc_prepexmalecircumcision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_prepexmalecircumcision` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CircumcisionProcedureID` int(11) DEFAULT NULL,
  `DeviceSize` varchar(4) DEFAULT NULL,
  `DeviceBatchID` varchar(255) DEFAULT NULL,
  `DeviceExpiriyDate` date DEFAULT NULL,
  `DeviceExpiryTime` time DEFAULT NULL,
  `Topical Anaesthesia` varchar(255) DEFAULT NULL,
  `VMMCID` varchar(255) DEFAULT NULL,
  `TopicalAnaesthesiaType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_prepexmalecircumcision`
--

LOCK TABLES `vmmc_prepexmalecircumcision` WRITE;
/*!40000 ALTER TABLE `vmmc_prepexmalecircumcision` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_prepexmalecircumcision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_referredfrom`
--

DROP TABLE IF EXISTS `vmmc_referredfrom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_referredfrom` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VMMCID` varchar(255) DEFAULT NULL,
  `ReferredFrom_ID` int(11) DEFAULT NULL,
  `SpecifyReferredFrom` varchar(255) DEFAULT NULL,
  `ReferredFromDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_referredfrom`
--

LOCK TABLES `vmmc_referredfrom` WRITE;
/*!40000 ALTER TABLE `vmmc_referredfrom` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_referredfrom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_riskreductionplan`
--

DROP TABLE IF EXISTS `vmmc_riskreductionplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_riskreductionplan` (
  `ID` int(11) NOT NULL,
  `VisitID` int(11) DEFAULT NULL,
  `RiskReductionPlanType_Id` int(11) DEFAULT NULL,
  `VMMCID` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_riskreductionplan`
--

LOCK TABLES `vmmc_riskreductionplan` WRITE;
/*!40000 ALTER TABLE `vmmc_riskreductionplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_riskreductionplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_service`
--

DROP TABLE IF EXISTS `vmmc_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_service` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VMMCID` varchar(255) DEFAULT NULL,
  `VMMCServiceType_ID` int(11) DEFAULT NULL,
  `ServiceDescription` varchar(255) DEFAULT NULL,
  `OtherSpecifyService` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_service`
--

LOCK TABLES `vmmc_service` WRITE;
/*!40000 ALTER TABLE `vmmc_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_surgicalmalecircumcision`
--

DROP TABLE IF EXISTS `vmmc_surgicalmalecircumcision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_surgicalmalecircumcision` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CircumcisionProcedureID` int(11) DEFAULT NULL,
  `ProcedureType_Id` varchar(255) DEFAULT NULL,
  `lignocaineone` double DEFAULT NULL,
  `lignocainetwo` double DEFAULT NULL,
  `Bupivacaine` double DEFAULT NULL,
  `DiathermyUsed` varchar(11) DEFAULT NULL,
  `DiathermySetting` varchar(255) DEFAULT NULL,
  `ProcedureStartTime` time DEFAULT NULL,
  `ProcedureEndtime` time DEFAULT NULL,
  `VMMCID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_surgicalmalecircumcision`
--

LOCK TABLES `vmmc_surgicalmalecircumcision` WRITE;
/*!40000 ALTER TABLE `vmmc_surgicalmalecircumcision` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_surgicalmalecircumcision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmc_visits`
--

DROP TABLE IF EXISTS `vmmc_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmc_visits` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VMMCID` varchar(255) NOT NULL,
  `vipId` bigint(15) NOT NULL,
  `VisitDate` date DEFAULT NULL,
  `VisitInterval` varchar(50) DEFAULT NULL,
  `AnyAdverseEvent` varchar(11) DEFAULT NULL,
  `IfYesAECode` varchar(50) DEFAULT NULL,
  `Severity` varchar(255) DEFAULT NULL,
  `WoundhealingComplete` varchar(11) DEFAULT NULL,
  `IfNoAdditionalVisitDate` date DEFAULT NULL,
  `ResumedSexualActivity` varchar(11) DEFAULT NULL,
  `IfResumedWeeks` int(11) DEFAULT NULL,
  `Counseled` varchar(11) DEFAULT NULL,
  `IfCounseledRiskPlan` varchar(255) DEFAULT NULL,
  `StaffComment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmc_visits`
--

LOCK TABLES `vmmc_visits` WRITE;
/*!40000 ALTER TABLE `vmmc_visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `vmmc_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vmmcservicetype`
--

DROP TABLE IF EXISTS `vmmcservicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vmmcservicetype` (
  `ID` int(11) NOT NULL,
  `VMMCServiceName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vmmcservicetype`
--

LOCK TABLES `vmmcservicetype` WRITE;
/*!40000 ALTER TABLE `vmmcservicetype` DISABLE KEYS */;
INSERT INTO `vmmcservicetype` VALUES (1,'Friend/ family'),(2,'Partner / Spouse'),(3,'Health worker'),(4,'Poster'),(5,'Newspaper'),(6,'Other client'),(7,'Community mobiliser'),(8,'Television (TV)'),(9,'Radio'),(10,'Leaflet');
/*!40000 ALTER TABLE `vmmcservicetype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-30 11:26:52
