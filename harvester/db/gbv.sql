-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: localindices
-- ------------------------------------------------------
-- Server version	10.1.44-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `HARVESTABLE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `HARVESTABLE` (
  `ID` bigint(20) NOT NULL,
  `DTYPE` varchar(31) DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT '0',
  `LASTUPDATED` datetime DEFAULT NULL,
  `DESCRIPTION` mediumtext,
  `INITIALLYHARVESTED` datetime DEFAULT NULL,
  `TECHNICALNOTES` mediumtext,
  `LASTHARVESTSTARTED` datetime DEFAULT NULL,
  `SCHEDULESTRING` varchar(255) DEFAULT NULL,
  `LASTHARVESTFINISHED` datetime DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `CURRENTSTATUS` varchar(255) DEFAULT NULL,
  `CONTACTNOTES` mediumtext,
  `AMOUNTHARVESTED` int(11) DEFAULT NULL,
  `SERVICEPROVIDER` varchar(255) DEFAULT NULL,
  `MESSAGE` mediumtext,
  `MAXDBSIZE` int(11) DEFAULT NULL,
  `HARVESTIMMEDIATELY` tinyint(1) NOT NULL DEFAULT '0',
  `FILETYPEMASKS` varchar(255) DEFAULT NULL,
  `URIMASKS` varchar(255) DEFAULT NULL,
  `STARTURLS` mediumtext,
  `RECURSIONDEPTH` int(11) DEFAULT NULL,
  `EXPECTEDSCHEMA` varchar(255) DEFAULT NULL,
  `URL` mediumtext,
  `NORMALIZATIONFILTER` varchar(255) DEFAULT NULL,
  `SCHEMAURI` varchar(255) DEFAULT NULL,
  `OAISETNAME` varchar(255) DEFAULT NULL,
  `FROMDATE` datetime DEFAULT NULL,
  `UNTILDATE` datetime DEFAULT NULL,
  `METADATAPREFIX` varchar(255) DEFAULT NULL,
  `DATEFORMAT` varchar(255) DEFAULT NULL,
  `RESUMPTIONTOKEN` varchar(4096) DEFAULT NULL,
  `STORAGE_ID` bigint(20) DEFAULT NULL,
  `TRANSFORMATION_ID` bigint(20) DEFAULT NULL,
  `OVERWRITE` tinyint(1) DEFAULT NULL,
  `SPLITAT` varchar(255) DEFAULT NULL,
  `SPLITSIZE` varchar(255) DEFAULT NULL,
  `OUTPUTSCHEMA` mediumtext,
  `ENCODING` varchar(255) DEFAULT NULL,
  `CLIENTCLASS` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PROXY` varchar(255) DEFAULT NULL,
  `SCRIPT` longtext,
  `ISPERSISTENCE` tinyint(1) DEFAULT NULL,
  `INITDATA` mediumtext,
  `SLEEP` int(11) DEFAULT NULL,
  `CONNECTORURL` mediumtext,
  `ALLOWERRORS` tinyint(4) DEFAULT NULL,
  `ALLOWCONDREQ` tinyint(4) DEFAULT NULL,
  `CLEARRTONERROR` tinyint(1) NOT NULL DEFAULT '0',
  `KEEPPARTIAL` tinyint(1) NOT NULL DEFAULT '1',
  `TIMEOUT` smallint(6) NOT NULL DEFAULT '300',
  `RETRYCOUNT` tinyint(3) NOT NULL DEFAULT '2',
  `RETRYWAIT` smallint(4) NOT NULL DEFAULT '60',
  `LOGLEVEL` varchar(30) DEFAULT NULL,
  `MAILLEVEL` varchar(30) DEFAULT NULL,
  `MAILADDRESS` varchar(1000) DEFAULT NULL,
  `RECORDLIMIT` bigint(20) DEFAULT NULL,
  `DISKRUN` tinyint(1) NOT NULL DEFAULT '0',
  `CACHEENABLED` tinyint(1) NOT NULL DEFAULT '0',
  `ENGINEPARAMETERS` varchar(4096) DEFAULT NULL,
  `CONNECTORENGINEURLSETTING_ID` bigint(20) DEFAULT NULL,
  `CONNECTORREPOURLSETTING_ID` bigint(20) DEFAULT NULL,
  `OPENACCESS` tinyint(1) NOT NULL DEFAULT '0',
  `ORIGINALURI` varchar(1024) DEFAULT NULL,
  `JSON` text,
  `LAXPARSING` tinyint(1) NOT NULL DEFAULT '0',
  `PASSIVEMODE` tinyint(1) NOT NULL DEFAULT '0',
  `RECURSIONLEVELS` tinyint(2) NOT NULL DEFAULT '0',
  `CSVCONFIGURATION` varchar(1024) DEFAULT NULL,
  `EXCLUDEFILEPATTERN` varchar(1024) DEFAULT NULL,
  `INCLUDEFILEPATTERN` varchar(1024) DEFAULT NULL,
  `STORAGEBATCHLIMIT` smallint(4) DEFAULT NULL,
  `MANAGEDBY` varchar(1024) DEFAULT NULL,
  `USEDBY` varchar(1024) DEFAULT NULL,
  `CONSTANTFIELDS` varchar(1024) DEFAULT NULL,
  `STOREORIGINAL` tinyint(1) NOT NULL DEFAULT '0',
  `ACL` text,
  `FAILEDRECORDSLOGGING` text,
  `MAXSAVEDFAILEDRECORDSPERRUN` SMALLINT DEFAULT 100,
  `MAXSAVEDFAILEDRECORDSTOTAL` SMALLINT DEFAULT 1000,
  PRIMARY KEY (`ID`),
  KEY `FK_HARVESTABLE_STORAGE_ID` (`STORAGE_ID`),
  CONSTRAINT `FK_HARVESTABLE_STORAGE_ID` FOREIGN KEY (`STORAGE_ID`) REFERENCES `STORAGE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HARVESTABLE`
--

LOCK TABLES `HARVESTABLE` WRITE;
/*!40000 ALTER TABLE `HARVESTABLE` DISABLE KEYS */;
INSERT INTO `HARVESTABLE` VALUES (10007,'XmlBulkResource',0,'2020-06-23 21:41:31','','2020-06-23 19:13:54','','2020-06-23 21:34:12','0 0 * * *','2020-06-23 21:34:16','ID Test','NEW','',0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,'','http://10.0.1.10:8000/picaxml/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10001,10004,0,'1','100','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,1,300,2,60,'DEBUG','WARN','',NULL,0,0,NULL,NULL,NULL,0,NULL,'',0,0,0,'','','xml',NULL,'','21xxx','',0,NULL,NULL,100,1000),
(10001,'XmlBulkResource',0,'2020-04-17 15:55:26','','2020-03-13 18:17:36','','2020-04-03 20:43:49','25 20 3 4 5','2020-04-03 20:44:13','GBV','NEW','',0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,'','http://esxh-9.gbv.de:8000/picaxml/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10002,10004,0,'1','100','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,1,300,2,60,'DEBUG','WARN','',NULL,0,0,NULL,NULL,NULL,0,NULL,'',0,0,0,'','','xml',NULL,'','21','',0,'','CLEAN_DIRECTORY',100,1000),
(10002,'XmlBulkResource',0,'2020-01-01 00:00:00','','2020-01-01 00:00:00','','2020-01-01 00:00:00','25 20 3 4 5','2020-01-01 00:00:00','GBV Migrate 0' ,'NEW','',0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,'','http://esxh-9.gbv.de:8000/picaxml/m0/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10002,10004,0,'1','100','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,1,300,2,60,'DEBUG','WARN','',NULL,0,0,NULL,NULL,NULL,0,NULL,'',0,0,0,'','','xml',NULL,'','','',0,'','CLEAN_DIRECTORY',100,1000),
(10003,'XmlBulkResource',0,'2020-01-01 00:00:00','','2020-01-01 00:00:00','','2020-01-01 00:00:00','25 20 3 4 5','2020-01-01 00:00:00','GBV Migrate 1' ,'NEW','',0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,'','http://esxh-9.gbv.de:8000/picaxml/m1/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10002,10004,0,'1','100','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,1,300,2,60,'DEBUG','WARN','',NULL,0,0,NULL,NULL,NULL,0,NULL,'',0,0,0,'','','xml',NULL,'','','',0,'','CLEAN_DIRECTORY',100,1000),
(10004,'XmlBulkResource',0,'2020-01-01 00:00:00','','2020-01-01 00:00:00','','2020-01-01 00:00:00','25 20 3 4 5','2020-01-01 00:00:00','GBV Migrate 2' ,'NEW','',0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,'','http://esxh-9.gbv.de:8000/picaxml/m2/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10002,10004,0,'1','100','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,1,300,2,60,'DEBUG','WARN','',NULL,0,0,NULL,NULL,NULL,0,NULL,'',0,0,0,'','','xml',NULL,'','','',0,'','CLEAN_DIRECTORY',100,1000),
(10005,'XmlBulkResource',0,'2020-01-01 00:00:00','','2020-01-01 00:00:00','','2020-01-01 00:00:00','25 20 3 4 5','2020-01-01 00:00:00','GBV Migrate 3' ,'NEW','',0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,'','http://esxh-9.gbv.de:8000/picaxml/m3/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10002,10004,0,'1','100','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,1,300,2,60,'DEBUG','WARN','',NULL,0,0,NULL,NULL,NULL,0,NULL,'',0,0,0,'','','xml',NULL,'','','',0,'','CLEAN_DIRECTORY',100,1000),
(10006,'XmlBulkResource',0,'2020-01-01 00:00:00','','2020-01-01 00:00:00','','2020-01-01 00:00:00','25 20 3 4 5','2020-01-01 00:00:00','GBV Migrate 4' ,'NEW','',0,'',NULL,NULL,0,NULL,NULL,NULL,NULL,'','http://esxh-9.gbv.de:8000/picaxml/m4/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10002,10004,0,'1','100','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,0,1,300,2,60,'DEBUG','WARN','',NULL,0,0,NULL,NULL,NULL,0,NULL,'',0,0,0,'','','xml',NULL,'','','',0,'','CLEAN_DIRECTORY',100,1000);
/*!40000 ALTER TABLE `HARVESTABLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `SEQUENCE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SEQUENCE` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL,
  PRIMARY KEY (`SEQ_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEQUENCE`
--

LOCK TABLES `SEQUENCE` WRITE;
/*!40000 ALTER TABLE `SEQUENCE` DISABLE KEYS */;
INSERT IGNORE INTO `SEQUENCE` VALUES ('SEQ_GEN',10000);
/*!40000 ALTER TABLE `SEQUENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SETTING`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SETTING` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(4096) NOT NULL,
  `LABEL` varchar(4096) NOT NULL,
  `VALUE` varchar(4096) DEFAULT NULL,
  `ACL` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SETTING`
--

LOCK TABLES `SETTING` WRITE;
/*!40000 ALTER TABLE `SETTING` DISABLE KEYS */;
/*!40000 ALTER TABLE `SETTING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STEP`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `STEP` (
  `ID` bigint(20) NOT NULL,
  `DTYPE` varchar(31) DEFAULT NULL,
  `DESCRIPTION` varchar(4096) DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT '0',
  `NAME` varchar(255) DEFAULT NULL,
  `SCRIPT` mediumtext,
  `TYPE` varchar(255) DEFAULT NULL,
  `OUTPUTFORMAT` varchar(255) DEFAULT NULL,
  `INPUTFORMAT` varchar(255) DEFAULT NULL,
  `CUSTOMCLASS` varchar(255) DEFAULT NULL,
  `TESTDATA` text,
  `TESTOUTPUT` text,
  `ACL` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STEP`
--

-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: localindices
-- ------------------------------------------------------
-- Server version	10.1.44-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

LOCK TABLES `STEP` WRITE;
/*!40000 ALTER TABLE `STEP` DISABLE KEYS */;
INSERT IGNORE INTO `STEP` VALUES (4003,'CustomTransformationStep','FOLIO Instance XML to JSON',1,'Instance XML to JSON','','custom','JSON','XML','com.indexdata.masterkey.localindices.harvest.messaging.InstanceXmlToInstanceJsonTransformerRouter','','','diku');
/*!40000 ALTER TABLE `STEP` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-17 16:44:11


--
-- Table structure for table `STORAGE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `STORAGE` (
  `ID` bigint(20) NOT NULL,
  `DTYPE` varchar(31) DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT '0',
  `CURRENTSTATUS` varchar(4096) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `MESSAGE` varchar(4096) DEFAULT NULL,
  `TRANSFORMATION` varchar(100) DEFAULT NULL,
  `DESCRIPTION` varchar(4096) DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `CUSTOMCLASS` varchar(1024) DEFAULT NULL,
  `LOGLEVEL` varchar(30) DEFAULT NULL,
  `MAILLEVEL` varchar(30) DEFAULT NULL,
  `MAILADDRESS` varchar(1000) DEFAULT NULL,
  `BULKSIZE` bigint(20) DEFAULT '1000',
  `TIMEOUT` smallint(4) DEFAULT NULL,
  `RETRYCOUNT` tinyint(3) DEFAULT NULL,
  `RETRYWAIT` smallint(4) DEFAULT NULL,
  `ACL` text,
  `JSON` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STORAGE`
--

LOCK TABLES `STORAGE` WRITE;
/*!40000 ALTER TABLE `STORAGE` DISABLE KEYS */;
INSERT INTO `STORAGE` VALUES (1001,'InventoryStorageEntity',1,'TODO','ESXH-9 (GBV)',NULL,NULL,'This is GBV\'s test server.  It is behind a firewall and probably won\'t work for most.','http://esxh-9.gbv.de:9130/','',NULL,NULL,NULL,1000,NULL,NULL,NULL,'','{\r\n \"folioAuthPath\": \"bl-users/login\",\r\n \"folioTenant\": \"diku\",\r\n \"folioUsername\": \"diku_admin\",\r\n \"folioPassword\": \"admin\",\r\n \"instanceStoragePath\": \"instance-storage/instances\",\r\n \"holdingsStoragePath\": \"holdings-storage/holdings\",\r\n \"itemStoragePath\": \"item-storage/items\"\r\n}'),(1002,'InventoryStorageEntity',1,'TODO','GBV Demo',NULL,NULL,'GBV\'s public Folio demo.','https://folio-demo.gbv.de/okapi','',NULL,NULL,NULL,1000,NULL,NULL,NULL,'','{\r\n \"folioAuthPath\": \"bl-users/login\",\r\n \"folioTenant\": \"diku\",\r\n \"folioUsername\": \"diku_admin\",\r\n \"folioPassword\": \"admin\",\r\n \"instanceStoragePath\": \"instance-storage/instances\",\r\n \"holdingsStoragePath\": \"holdings-storage/holdings\",\r\n \"itemStoragePath\": \"item-storage/items\"\r\n}'),(10001,'InventoryStorageEntity',1,'TODO','Index Data Test',NULL,NULL,'This targets Index Data\'s test instance at https://indexdata-test.folio.indexdata.com','https://indexdata-test-okapi.folio.indexdata.com/','',NULL,NULL,NULL,1000,NULL,NULL,NULL,NULL,'{\r\n    \"folioAuthPath\": \"bl-users/login\",\r\n    \"folioTenant\": \"indexdata\",\r\n    \"folioUsername\": \"id_admin\",\r\n    \"folioPassword\": \"**********ID052020\",\r\n    \"inventoryUpsertPath\": \"inventory-upsert-hrid\"    \r\n}'),(10002,'InventoryStorageEntity',1,'TODO','ESXH-9 (GBV) Upsert',NULL,NULL,'mod-inventory-udate must be installed at http://esxh-9.gbv.de:9130/','http://esxh-9.gbv.de:9130/','',NULL,NULL,NULL,1000,NULL,NULL,NULL,NULL,'{\r\n    \"folioAuthPath\": \"bl-users/login\",\r\n    \"folioTenant\": \"diku\",\r\n    \"folioUsername\": \"diku_admin\",\r\n    \"folioPassword\": \"admin\",\r\n    \"inventoryUpsertPath\": \"inventory-upsert-hrid\"    \r\n}');
/*!40000 ALTER TABLE `STORAGE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `TRANSFORMATION`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `TRANSFORMATION` (
  `ID` bigint(20) NOT NULL,
  `DTYPE` varchar(31) DEFAULT NULL,
  `DESCRIPTION` varchar(4096) DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT '0',
  `NAME` varchar(255) DEFAULT NULL,
  `PARALLEL` tinyint(1) DEFAULT NULL,
  `ACL` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSFORMATION`
--

LOCK TABLES `TRANSFORMATION` WRITE;
/*!40000 ALTER TABLE `TRANSFORMATION` DISABLE KEYS */;
INSERT IGNORE INTO `TRANSFORMATION` VALUES (10004,'BasicTransformation','',1,'CBS2FOLIO',0,'');
INSERT IGNORE INTO `TRANSFORMATION` VALUES (10005,'BasicTransformation','',1,'CBS2FOLIO-NEW',0,'');
/*!40000 ALTER TABLE `TRANSFORMATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSFORMATION_STEP`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `TRANSFORMATION_STEP` (
  `ID` bigint(20) NOT NULL,
  `DTYPE` varchar(31) DEFAULT NULL,
  `POSITION` int(11) DEFAULT NULL,
  `TRANSFORMATION_ID` bigint(20) NOT NULL,
  `STEP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_TRANSFORMATION_STEP_STEP_ID` (`STEP_ID`),
  KEY `TRANSFORMATION_STEP_TRANSFORMATION_ID` (`TRANSFORMATION_ID`),
  CONSTRAINT `FK_TRANSFORMATION_STEP_STEP_ID` FOREIGN KEY (`STEP_ID`) REFERENCES `STEP` (`ID`),
  CONSTRAINT `FK_TRANSFORMATION_STEP_TRANSFORMATION_ID` FOREIGN KEY (`TRANSFORMATION_ID`) REFERENCES `TRANSFORMATION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSFORMATION_STEP`
--

LOCK TABLES `TRANSFORMATION_STEP` WRITE;
/*!40000 ALTER TABLE `TRANSFORMATION_STEP` DISABLE KEYS */;
INSERT IGNORE INTO `TRANSFORMATION_STEP` VALUES (10005,'TransformationStepAssociation',2,10004,10002),(10006,'TransformationStepAssociation',1,10004,10003),(10007,'TransformationStepAssociation',3,10004,10004),(10008,'TransformationStepAssociation',4,10004,4003);
INSERT IGNORE INTO `TRANSFORMATION_STEP` VALUES (10010,'TransformationStepAssociation',1,10005,10011),(10011,'TransformationStepAssociation',2,10005,10012),(10012,'TransformationStepAssociation',3,10005,10013),(10013,'TransformationStepAssociation',4,10005,10002),(10014,'TransformationStepAssociation',5,10005,10004),(10015,'TransformationStepAssociation',6,10005,4003);
/*!40000 ALTER TABLE `TRANSFORMATION_STEP` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-14  1:00:38
