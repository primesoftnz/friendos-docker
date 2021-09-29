-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: mariadb    Database: friendup
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.5-MariaDB-1:10.5.5+maria~focal

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
-- Table structure for table `DockItem`
--
USE friendup;
DROP TABLE IF EXISTS `DockItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DockItem` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Parent` bigint(20) DEFAULT 0,
  `DockID` bigint(20) NOT NULL DEFAULT 0,
  `UserID` bigint(20) DEFAULT 0,
  `Type` varchar(255) DEFAULT 'executable',
  `Application` varchar(255) DEFAULT NULL,
  `ShortDescription` varchar(255) DEFAULT NULL,
  `SortOrder` int(11) DEFAULT 0,
  `Workspace` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DockItem`
--

LOCK TABLES `DockItem` WRITE;
/*!40000 ALTER TABLE `DockItem` DISABLE KEYS */;
/*!40000 ALTER TABLE `DockItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FApplication`
--

DROP TABLE IF EXISTS `FApplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FApplication` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL DEFAULT 0,
  `Name` varchar(255) NOT NULL,
  `InstallPath` varchar(255) NOT NULL,
  `Permissions` varchar(8) NOT NULL DEFAULT 'UGO',
  `DateInstalled` datetime NOT NULL,
  `DateModified` datetime NOT NULL,
  `Config` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`,`Name`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FApplication`
--

LOCK TABLES `FApplication` WRITE;
/*!40000 ALTER TABLE `FApplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `FApplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FCalendar`
--

DROP TABLE IF EXISTS `FCalendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FCalendar` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CalendarID` bigint(20) NOT NULL DEFAULT 0,
  `UserID` bigint(20) NOT NULL DEFAULT 0,
  `Title` varchar(255) DEFAULT NULL,
  `Type` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `TimeFrom` varchar(255) DEFAULT NULL,
  `TimeTo` varchar(8) DEFAULT NULL,
  `Date` varchar(255) DEFAULT NULL,
  `Source` varchar(255) NOT NULL,
  `RemoteID` varchar(255) NOT NULL,
  `MetaData` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FCalendar`
--

LOCK TABLES `FCalendar` WRITE;
/*!40000 ALTER TABLE `FCalendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `FCalendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FCategory`
--

DROP TABLE IF EXISTS `FCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FCategory` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FCategory`
--

LOCK TABLES `FCategory` WRITE;
/*!40000 ALTER TABLE `FCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `FCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FClusterNode`
--

DROP TABLE IF EXISTS `FClusterNode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FClusterNode` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FCID` varchar(128) DEFAULT NULL,
  `Address` varchar(32) DEFAULT NULL,
  `DateCreated` datetime NOT NULL,
  `NodeID` smallint(2) DEFAULT NULL,
  `Status` smallint(2) DEFAULT NULL,
  `Url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FClusterNode`
--

LOCK TABLES `FClusterNode` WRITE;
/*!40000 ALTER TABLE `FClusterNode` DISABLE KEYS */;
INSERT INTO `FClusterNode` VALUES (1,'0242ffffffc0friendup-6be1-bf85-b3a1-4cd7-09b40000000000000000000000000000000000000000000000000000000000000000000000000000000000','192.168.96.3','1970-01-01 00:00:00',0,0,NULL);
/*!40000 ALTER TABLE `FClusterNode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FConnection`
--

DROP TABLE IF EXISTS `FConnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FConnection` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FCID` varchar(255) NOT NULL,
  `DestinationFCID` varchar(128) DEFAULT NULL,
  `Type` bigint(3) NOT NULL,
  `ServerType` bigint(3) NOT NULL,
  `Name` varchar(1024) NOT NULL,
  `Address` varchar(64) NOT NULL,
  `Approved` bigint(3) NOT NULL,
  `SSLInfo` varchar(255) DEFAULT NULL,
  `DateCreated` datetime DEFAULT current_timestamp(),
  `PEM` text DEFAULT NULL,
  `ClusterID` smallint(2) DEFAULT NULL,
  `Status` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FConnection`
--

LOCK TABLES `FConnection` WRITE;
/*!40000 ALTER TABLE `FConnection` DISABLE KEYS */;
INSERT INTO `FConnection` VALUES (1,'0242ffffffc0friendup-6be1-bf85-b3a1-4cd7-09b40000000000000000000000000000000000000000000000000000000000000000000000000000000000',NULL,1,3,'FriendMaster','pal.ideverket.no',0,NULL,'1970-01-01 00:00:00',NULL,0,1);
/*!40000 ALTER TABLE `FConnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FConnectionInfo`
--

DROP TABLE IF EXISTS `FConnectionInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FConnectionInfo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL DEFAULT 0,
  `Access` tinyint(4) NOT NULL DEFAULT 0,
  `FCID` varchar(128) DEFAULT NULL,
  `DestinationFCID` varchar(128) DEFAULT NULL,
  `Address` varchar(32) DEFAULT NULL,
  `SSLInfo` varchar(255) DEFAULT NULL,
  `DateCreated` datetime NOT NULL DEFAULT current_timestamp(),
  `PEM` text DEFAULT NULL,
  `ClusterID` smallint(2) DEFAULT NULL,
  `Status` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FConnectionInfo`
--

LOCK TABLES `FConnectionInfo` WRITE;
/*!40000 ALTER TABLE `FConnectionInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `FConnectionInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FDictionary`
--

DROP TABLE IF EXISTS `FDictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FDictionary` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CategoryID` bigint(20) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `Language` varchar(10) DEFAULT NULL,
  `DictID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FDictionary`
--

LOCK TABLES `FDictionary` WRITE;
/*!40000 ALTER TABLE `FDictionary` DISABLE KEYS */;
INSERT INTO `FDictionary` VALUES (1,0,'PID parameter is missing','ENG',0),(2,0,'Function not found','ENG',1),(3,0,'Path parameter is empty','ENG',2),(4,0,'sessionid or authid parameter is missing','ENG',3),(5,0,'Cannot execute function. Admin rights required','ENG',4),(6,0,'Parameters must be send by using POST method','ENG',5),(7,0,'Account blocked until: %lu','ENG',6),(8,0,'Authentication module not selected','ENG',7),(9,0,'Missing parameters: username,password,deviceid','ENG',8),(10,0,'Authentication by using publickeys is not supported','ENG',9),(11,0,'User session or User not found','ENG',10),(12,0,'User session not found','ENG',11),(13,0,'Missing parameters: username,deviceid','ENG',12),(14,0,'User not found','ENG',13),(15,0,'Missing parameters: %s','ENG',14),(16,0,'Cannot change password, error: %d','ENG',15),(17,0,'SQL.library not found','ENG',16),(18,0,'Cannot allocate memory','ENG',17),(19,0,'Function %s returned: %d','ENG',18),(20,0,'User already exist','ENG',19),(21,0,'Service not found or service name parameter is missing!','ENG',20),(22,0,'File or directory do not exist','ENG',21),(23,0,'Device: %s not found','ENG',22),(24,0,'Cannot open file: %s','ENG',23),(25,0,'Sentinel user access rights missing','ENG',24),(26,0,'Filesystem not found','ENG',25),(27,0,'Function %s returned empty string','ENG',26),(28,0,'Cannot create temporary file','ENG',27),(29,0,'File do not exist or its empty','ENG',28),(30,0,'Cannot send notification. Error %d','ENG',29),(31,0,'Entry with id: %lu cannot be removed','ENG',30),(32,0,'Cannot update notification entry. Error: %d','ENG',31),(33,0,'Cannot change access. Error %d','ENG',32),(34,0,'Cannot share file','ENG',33),(35,0,'Destination drive not found','ENG',34),(36,0,'No access to: %s','ENG',35),(37,0,'Module call returned empty string','ENG',36),(38,0,'Part %d of path is missing','ENG',37),(39,0,'User or device do not exist','ENG',38),(40,0,'Device cannot be shared. Error %d','ENG',39),(41,0,'Invalid user session','ENG',40),(42,0,'No disk name specified or disk does not exist','ENG',41),(43,0,'Cannot poll drive. No data in DB','ENG',42),(44,0,'Drive not found: %s','ENG',43),(45,0,'No entry in DB: %s','ENG',44),(46,0,'SASID not found','ENG',45),(47,0,'No access to variable','ENG',46),(48,0,'No user session in SAS','ENG',47),(49,0,'Cannot send message. Error %d','ENG',48),(50,0,'Cannot remove users','ENG',49),(51,0,'Cannot add users','ENG',50),(52,0,'Cannot create SAS','ENG',51),(53,0,'Cannot convert message','ENG',52),(54,0,'Cannot setup connection: %s','ENG',53),(55,0,'Cannot parse command or not existing lib was called','ENG',54),(56,0,'Bad user or password','ENG',55),(57,0,'Cannot find device by ID: %lu','ENG',56),(58,0,'Cannot unlock port. Error: %d','ENG',57),(59,0,'Printer not added. Error: %d','ENG',58),(60,1,'Active','ENG',0),(61,1,'Disabled','ENG',1),(62,1,'Blocked','ENG',2);
/*!40000 ALTER TABLE `FDictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FDocumentation`
--

DROP TABLE IF EXISTS `FDocumentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FDocumentation` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ParentID` bigint(20) NOT NULL DEFAULT 0,
  `Type` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Return` varchar(255) NOT NULL,
  `Arguments` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Examples` text NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `DateCreated` datetime NOT NULL,
  `Status` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FDocumentation`
--

LOCK TABLES `FDocumentation` WRITE;
/*!40000 ALTER TABLE `FDocumentation` DISABLE KEYS */;
/*!40000 ALTER TABLE `FDocumentation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FDoorNotification`
--

DROP TABLE IF EXISTS `FDoorNotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FDoorNotification` (
  `ID` bigint(32) NOT NULL AUTO_INCREMENT,
  `OwnerID` bigint(32) NOT NULL,
  `DeviceID` bigint(32) NOT NULL,
  `Path` text DEFAULT NULL,
  `Type` bigint(2) NOT NULL,
  `Time` bigint(32) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Time` (`Time`) USING BTREE,
  KEY `OwnerID` (`OwnerID`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FDoorNotification`
--

LOCK TABLES `FDoorNotification` WRITE;
/*!40000 ALTER TABLE `FDoorNotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `FDoorNotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FFileInfo`
--

DROP TABLE IF EXISTS `FFileInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FFileInfo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '0',
  `Path` varchar(1024) DEFAULT NULL,
  `FilesystemID` bigint(20) NOT NULL DEFAULT 0,
  `DateCreated` datetime NOT NULL,
  `DateModified` datetime NOT NULL,
  `Data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`Data`)),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FFileInfo`
--

LOCK TABLES `FFileInfo` WRITE;
/*!40000 ALTER TABLE `FFileInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `FFileInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FFilePermission`
--

DROP TABLE IF EXISTS `FFilePermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FFilePermission` (
  `ID` bigint(32) NOT NULL AUTO_INCREMENT,
  `DeviceID` bigint(32) NOT NULL,
  `Path` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DeviceID` (`DeviceID`) USING HASH,
  FULLTEXT KEY `idx` (`Path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FFilePermission`
--

LOCK TABLES `FFilePermission` WRITE;
/*!40000 ALTER TABLE `FFilePermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `FFilePermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FFileShared`
--

DROP TABLE IF EXISTS `FFileShared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FFileShared` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL DEFAULT '0',
  `Devname` varchar(255) DEFAULT NULL,
  `Path` varchar(1024) DEFAULT NULL,
  `UserID` bigint(20) NOT NULL DEFAULT 0,
  `DstUserSID` varchar(1024) DEFAULT NULL,
  `DateCreated` datetime NOT NULL,
  `Hash` varchar(255) DEFAULT NULL,
  `AppID` bigint(20) DEFAULT NULL,
  `FileData` mediumblob DEFAULT NULL,
  `FSID` bigint(32) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FFileShared`
--

LOCK TABLES `FFileShared` WRITE;
/*!40000 ALTER TABLE `FFileShared` DISABLE KEYS */;
/*!40000 ALTER TABLE `FFileShared` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FGlobalVariables`
--

DROP TABLE IF EXISTS `FGlobalVariables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FGlobalVariables` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Key` varchar(255) DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  `Comment` text DEFAULT NULL,
  `Date` bigint(32) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FGlobalVariables`
--

LOCK TABLES `FGlobalVariables` WRITE;
/*!40000 ALTER TABLE `FGlobalVariables` DISABLE KEYS */;
INSERT INTO `FGlobalVariables` VALUES (1,'DB_VERSION','56','56_FFileInfo_table.sql',1599159138);
/*!40000 ALTER TABLE `FGlobalVariables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FGroupToGroup`
--

DROP TABLE IF EXISTS `FGroupToGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FGroupToGroup` (
  `FromGroupID` bigint(20) NOT NULL,
  `ToGroupID` bigint(20) NOT NULL,
  KEY `FromGroupID` (`FromGroupID`,`ToGroupID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FGroupToGroup`
--

LOCK TABLES `FGroupToGroup` WRITE;
/*!40000 ALTER TABLE `FGroupToGroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `FGroupToGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FIOTDevice`
--

DROP TABLE IF EXISTS `FIOTDevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIOTDevice` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `DeviceID` varchar(255) NOT NULL,
  `Key` varchar(255) NOT NULL,
  `Value` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FIOTDevice`
--

LOCK TABLES `FIOTDevice` WRITE;
/*!40000 ALTER TABLE `FIOTDevice` DISABLE KEYS */;
/*!40000 ALTER TABLE `FIOTDevice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FKeys`
--

DROP TABLE IF EXISTS `FKeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FKeys` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `ApplicationID` bigint(20) NOT NULL,
  `UniqueID` varchar(255) NOT NULL,
  `RowID` bigint(20) NOT NULL,
  `RowType` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Blob` longblob DEFAULT NULL,
  `Data` text DEFAULT NULL,
  `PublicKey` text DEFAULT NULL,
  `Signature` text DEFAULT NULL,
  `DateModified` datetime NOT NULL,
  `DateCreated` datetime NOT NULL,
  `IsDeleted` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FKeys`
--

LOCK TABLES `FKeys` WRITE;
/*!40000 ALTER TABLE `FKeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `FKeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FMail`
--

DROP TABLE IF EXISTS `FMail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FMail` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Server` varchar(255) NOT NULL,
  `Port` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Folder` varchar(255) NOT NULL,
  `OutServer` varchar(255) NOT NULL,
  `OutPort` varchar(255) NOT NULL,
  `OutUser` varchar(255) NOT NULL,
  `OutPass` varchar(255) NOT NULL,
  `SortOrder` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FMail`
--

LOCK TABLES `FMail` WRITE;
/*!40000 ALTER TABLE `FMail` DISABLE KEYS */;
/*!40000 ALTER TABLE `FMail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FMailHeader`
--

DROP TABLE IF EXISTS `FMailHeader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FMailHeader` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `ExternalMessageID` bigint(20) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Subject` varchar(255) NOT NULL,
  `From` varchar(255) NOT NULL,
  `ReplyTo` varchar(255) NOT NULL,
  `To` varchar(255) NOT NULL,
  `IsRead` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FMailHeader`
--

LOCK TABLES `FMailHeader` WRITE;
/*!40000 ALTER TABLE `FMailHeader` DISABLE KEYS */;
/*!40000 ALTER TABLE `FMailHeader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FMailOutgoing`
--

DROP TABLE IF EXISTS `FMailOutgoing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FMailOutgoing` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Subject` varchar(255) NOT NULL,
  `Content` text NOT NULL,
  `Attachments` text NOT NULL,
  `From` varchar(255) NOT NULL,
  `To` varchar(255) NOT NULL,
  `IsSent` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FMailOutgoing`
--

LOCK TABLES `FMailOutgoing` WRITE;
/*!40000 ALTER TABLE `FMailOutgoing` DISABLE KEYS */;
/*!40000 ALTER TABLE `FMailOutgoing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FMetaData`
--

DROP TABLE IF EXISTS `FMetaData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FMetaData` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Key` varchar(255) NOT NULL,
  `DataID` bigint(20) DEFAULT NULL,
  `DataTable` varchar(255) DEFAULT NULL,
  `ValueNumber` bigint(20) DEFAULT NULL,
  `ValueString` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FMetaData`
--

LOCK TABLES `FMetaData` WRITE;
/*!40000 ALTER TABLE `FMetaData` DISABLE KEYS */;
/*!40000 ALTER TABLE `FMetaData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FNotification`
--

DROP TABLE IF EXISTS `FNotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FNotification` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Channel` varchar(255) DEFAULT NULL,
  `Content` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Extra` varchar(255) DEFAULT NULL,
  `Application` varchar(255) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Created` bigint(20) NOT NULL,
  `Type` bigint(6) NOT NULL,
  `Status` bigint(6) NOT NULL,
  `OriginalCTimestamp` bigint(20) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FNotification`
--

LOCK TABLES `FNotification` WRITE;
/*!40000 ALTER TABLE `FNotification` DISABLE KEYS */;
/*!40000 ALTER TABLE `FNotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FNotificationSent`
--

DROP TABLE IF EXISTS `FNotificationSent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FNotificationSent` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NotificationID` bigint(20) NOT NULL,
  `RequestID` bigint(20) NOT NULL,
  `UserMobileAppID` bigint(20) NOT NULL,
  `Target` bigint(6) NOT NULL,
  `Status` bigint(6) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FNotificationSent`
--

LOCK TABLES `FNotificationSent` WRITE;
/*!40000 ALTER TABLE `FNotificationSent` DISABLE KEYS */;
/*!40000 ALTER TABLE `FNotificationSent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FPermLink`
--

DROP TABLE IF EXISTS `FPermLink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FPermLink` (
  `ID` bigint(32) NOT NULL AUTO_INCREMENT,
  `PermissionID` bigint(32) NOT NULL,
  `ObjectID` bigint(32) NOT NULL,
  `Type` int(3) NOT NULL,
  `Access` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PermissionID` (`PermissionID`) USING HASH,
  KEY `ObjectID` (`ObjectID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FPermLink`
--

LOCK TABLES `FPermLink` WRITE;
/*!40000 ALTER TABLE `FPermLink` DISABLE KEYS */;
/*!40000 ALTER TABLE `FPermLink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FSBlob`
--

DROP TABLE IF EXISTS `FSBlob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FSBlob` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FileID` bigint(20) NOT NULL,
  `Data` blob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FSBlob`
--

LOCK TABLES `FSBlob` WRITE;
/*!40000 ALTER TABLE `FSBlob` DISABLE KEYS */;
/*!40000 ALTER TABLE `FSBlob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FSFile`
--

DROP TABLE IF EXISTS `FSFile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FSFile` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FilesystemID` bigint(20) NOT NULL,
  `UserID` bigint(20) NOT NULL,
  `FolderID` bigint(20) NOT NULL,
  `Filename` varchar(255) NOT NULL,
  `DiskFilename` varchar(255) NOT NULL,
  `Filesize` int(11) NOT NULL DEFAULT 0,
  `Permissions` varchar(255) NOT NULL,
  `DateModified` datetime NOT NULL,
  `DateCreated` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FilesystemID` (`FilesystemID`,`UserID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FSFile`
--

LOCK TABLES `FSFile` WRITE;
/*!40000 ALTER TABLE `FSFile` DISABLE KEYS */;
/*!40000 ALTER TABLE `FSFile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FSFolder`
--

DROP TABLE IF EXISTS `FSFolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FSFolder` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FilesystemID` bigint(20) NOT NULL,
  `FolderID` bigint(20) NOT NULL,
  `UserID` bigint(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Permissions` varchar(255) NOT NULL,
  `DateModified` datetime NOT NULL,
  `DateCreated` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FilesystemID` (`FilesystemID`,`UserID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FSFolder`
--

LOCK TABLES `FSFolder` WRITE;
/*!40000 ALTER TABLE `FSFolder` DISABLE KEYS */;
/*!40000 ALTER TABLE `FSFolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FSSearchData`
--

DROP TABLE IF EXISTS `FSSearchData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FSSearchData` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FilesystemID` bigint(20) NOT NULL,
  `FileID` bigint(20) NOT NULL,
  `UserID` bigint(20) NOT NULL,
  `Data` text NOT NULL,
  `DateModified` datetime NOT NULL,
  `DateCreated` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FSSearchData`
--

LOCK TABLES `FSSearchData` WRITE;
/*!40000 ALTER TABLE `FSSearchData` DISABLE KEYS */;
/*!40000 ALTER TABLE `FSSearchData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FScreen`
--

DROP TABLE IF EXISTS `FScreen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FScreen` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Data` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FScreen`
--

LOCK TABLES `FScreen` WRITE;
/*!40000 ALTER TABLE `FScreen` DISABLE KEYS */;
/*!40000 ALTER TABLE `FScreen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FSetting`
--

DROP TABLE IF EXISTS `FSetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FSetting` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Key` varchar(255) NOT NULL,
  `Data` mediumtext DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`,`Type`,`Key`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FSetting`
--

LOCK TABLES `FSetting` WRITE;
/*!40000 ALTER TABLE `FSetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `FSetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FShared`
--

DROP TABLE IF EXISTS `FShared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FShared` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OwnerUserID` bigint(20) NOT NULL,
  `SharedType` varchar(255) DEFAULT 'User',
  `SharedID` bigint(20) NOT NULL,
  `Data` varchar(1024) NOT NULL,
  `Mode` varchar(255) NOT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DateTouched` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FShared`
--

LOCK TABLES `FShared` WRITE;
/*!40000 ALTER TABLE `FShared` DISABLE KEYS */;
/*!40000 ALTER TABLE `FShared` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FThumbnail`
--

DROP TABLE IF EXISTS `FThumbnail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FThumbnail` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `Path` varchar(255) NOT NULL,
  `Filepath` varchar(255) NOT NULL,
  `Filesize` int(11) DEFAULT 0,
  `DateCreated` datetime DEFAULT NULL,
  `DateTouched` datetime DEFAULT NULL,
  `Encryption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FThumbnail`
--

LOCK TABLES `FThumbnail` WRITE;
/*!40000 ALTER TABLE `FThumbnail` DISABLE KEYS */;
/*!40000 ALTER TABLE `FThumbnail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FTinyUrl`
--

DROP TABLE IF EXISTS `FTinyUrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FTinyUrl` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `Source` text NOT NULL,
  `Hash` varchar(16) NOT NULL,
  `Expire` tinyint(1) NOT NULL,
  `DateCreated` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FTinyUrl`
--

LOCK TABLES `FTinyUrl` WRITE;
/*!40000 ALTER TABLE `FTinyUrl` DISABLE KEYS */;
/*!40000 ALTER TABLE `FTinyUrl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUser`
--

DROP TABLE IF EXISTS `FUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUser` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `PublicKey` text DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `SessionID` varchar(255) DEFAULT NULL,
  `LoggedTime` bigint(32) NOT NULL,
  `CreatedTime` bigint(32) NOT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `LoginTime` bigint(32) NOT NULL,
  `MaxStoredBytes` bigint(32) NOT NULL DEFAULT 0,
  `MaxReadedBytes` bigint(32) NOT NULL DEFAULT 0,
  `UniqueID` varchar(256) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL DEFAULT 0,
  `ModifyTime` bigint(32) DEFAULT 0,
  `LoginCounter` int(11) DEFAULT -1,
  PRIMARY KEY (`ID`),
  KEY `SessionID` (`SessionID`) USING HASH,
  KEY `Name` (`Name`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUser`
--

LOCK TABLES `FUser` WRITE;
/*!40000 ALTER TABLE `FUser` DISABLE KEYS */;
INSERT INTO `FUser` VALUES (1,'fadmin','{S6}6ceba7629f5ceea85213aff10efc89c3a0b52ffcccc3e8d471475569b8eef1b8',NULL,'Friend Administrator',NULL,NULL,0,0,NULL,0,0,0,'247323641ade4f1778c828addb38a318',0,0,-1),(2,'guest','{S6}96734f45357b892a1b13439aa396fded3900eb254fd6be0002339db68719435c',NULL,NULL,NULL,NULL,0,0,NULL,0,0,0,'513d9a1ffa80ce8f77a93378b069e5e0',0,0,-1),(3,'apiuser','{S6}3a294fec6996cdea157ed88839469eb29c597494d1132ea154528c131263c6f0','','API',NULL,'0dc01a43acd881054cf1735df7fe662f09af02e7',0,0,'',0,0,0,'9525fa56adf73363270d571709c09629',0,0,-1);
/*!40000 ALTER TABLE `FUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUserApplication`
--

DROP TABLE IF EXISTS `FUserApplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUserApplication` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `ApplicationID` bigint(20) NOT NULL,
  `Permissions` text NOT NULL,
  `AuthID` varchar(255) NOT NULL,
  `Data` text NOT NULL,
  `DateCreated` bigint(20) DEFAULT 0,
  `UserSessionID` bigint(32) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`,`ApplicationID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUserApplication`
--

LOCK TABLES `FUserApplication` WRITE;
/*!40000 ALTER TABLE `FUserApplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `FUserApplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUserGroup`
--

DROP TABLE IF EXISTS `FUserGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUserGroup` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL,
  `ParentID` bigint(20) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT 'Level',
  `Description` text DEFAULT NULL,
  `Status` bigint(6) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `UserID` (`UserID`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUserGroup`
--

LOCK TABLES `FUserGroup` WRITE;
/*!40000 ALTER TABLE `FUserGroup` DISABLE KEYS */;
INSERT INTO `FUserGroup` VALUES (1,0,0,'Admin','Level',NULL,0),(2,0,0,'User','Level',NULL,0),(3,0,0,'API','Level',NULL,0);
/*!40000 ALTER TABLE `FUserGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUserLogin`
--

DROP TABLE IF EXISTS `FUserLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUserLogin` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(32) NOT NULL,
  `Login` varchar(255) NOT NULL,
  `Failed` varchar(255) DEFAULT NULL,
  `Information` mediumtext DEFAULT NULL,
  `LoginTime` bigint(32) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `LoginTime` (`LoginTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUserLogin`
--

LOCK TABLES `FUserLogin` WRITE;
/*!40000 ALTER TABLE `FUserLogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `FUserLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUserMobileApp`
--

DROP TABLE IF EXISTS `FUserMobileApp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUserMobileApp` (
  `ID` bigint(32) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(32) NOT NULL,
  `AppToken` varchar(255) DEFAULT NULL,
  `AppVersion` varchar(255) DEFAULT NULL,
  `Platform` varchar(255) DEFAULT NULL,
  `PlatformVersion` varchar(255) DEFAULT NULL,
  `Core` varchar(255) DEFAULT NULL,
  `CreateTS` bigint(32) NOT NULL,
  `LastStartTS` bigint(32) NOT NULL,
  `Status` bigint(6) DEFAULT 0,
  `DeviceID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUserMobileApp`
--

LOCK TABLES `FUserMobileApp` WRITE;
/*!40000 ALTER TABLE `FUserMobileApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `FUserMobileApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUserRolePermission`
--

DROP TABLE IF EXISTS `FUserRolePermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUserRolePermission` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Permission` varchar(32) NOT NULL,
  `Key` varchar(32) NOT NULL,
  `RoleID` bigint(20) NOT NULL,
  `Data` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUserRolePermission`
--

LOCK TABLES `FUserRolePermission` WRITE;
/*!40000 ALTER TABLE `FUserRolePermission` DISABLE KEYS */;
/*!40000 ALTER TABLE `FUserRolePermission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUserSession`
--

DROP TABLE IF EXISTS `FUserSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUserSession` (
  `ID` bigint(32) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(32) NOT NULL,
  `DeviceIdentity` varchar(255) DEFAULT NULL,
  `SessionID` varchar(255) DEFAULT NULL,
  `LoggedTime` bigint(32) NOT NULL,
  `UMA_ID` bigint(32) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `SessionID` (`SessionID`,`UserID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUserSession`
--

LOCK TABLES `FUserSession` WRITE;
/*!40000 ALTER TABLE `FUserSession` DISABLE KEYS */;
/*!40000 ALTER TABLE `FUserSession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUserSessionApp`
--

DROP TABLE IF EXISTS `FUserSessionApp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUserSessionApp` (
  `ID` bigint(32) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(32) NOT NULL DEFAULT 0,
  `UserSessionID` bigint(32) NOT NULL DEFAULT 0,
  `ApplicationID` bigint(32) NOT NULL DEFAULT 0,
  `DeviceIdentity` varchar(255) DEFAULT NULL,
  `CreateTime` bigint(32) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUserSessionApp`
--

LOCK TABLES `FUserSessionApp` WRITE;
/*!40000 ALTER TABLE `FUserSessionApp` DISABLE KEYS */;
/*!40000 ALTER TABLE `FUserSessionApp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FUserToGroup`
--

DROP TABLE IF EXISTS `FUserToGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FUserToGroup` (
  `UserID` bigint(20) NOT NULL,
  `UserGroupID` bigint(20) NOT NULL,
  KEY `UserID` (`UserID`,`UserGroupID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FUserToGroup`
--

LOCK TABLES `FUserToGroup` WRITE;
/*!40000 ALTER TABLE `FUserToGroup` DISABLE KEYS */;
INSERT INTO `FUserToGroup` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `FUserToGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Filesystem`
--

DROP TABLE IF EXISTS `Filesystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Filesystem` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UserID` bigint(20) NOT NULL DEFAULT 0,
  `GroupID` bigint(20) DEFAULT NULL,
  `DeviceID` bigint(20) DEFAULT NULL,
  `KeysID` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Type` varchar(255) NOT NULL,
  `ShortDescription` varchar(255) NOT NULL,
  `Server` varchar(255) DEFAULT NULL,
  `Port` varchar(8) DEFAULT NULL,
  `Path` varchar(255) DEFAULT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Config` text NOT NULL,
  `Mounted` tinyint(4) NOT NULL DEFAULT 0,
  `Authorized` tinyint(4) NOT NULL DEFAULT 0,
  `Owner` bigint(20) DEFAULT NULL,
  `Execute` varchar(512) DEFAULT NULL,
  `StoredBytes` bigint(32) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`) USING HASH,
  KEY `UserID` (`UserID`) USING HASH,
  KEY `Name` (`Name`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Filesystem`
--

LOCK TABLES `Filesystem` WRITE;
/*!40000 ALTER TABLE `Filesystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `Filesystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FilesystemActivity`
--

DROP TABLE IF EXISTS `FilesystemActivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FilesystemActivity` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FilesystemID` bigint(20) NOT NULL DEFAULT 0,
  `ToDate` date DEFAULT NULL,
  `StoredBytesLeft` bigint(32) NOT NULL DEFAULT 0,
  `ReadedBytesLeft` bigint(32) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `FilesystemID` (`FilesystemID`) USING HASH,
  KEY `ToDate` (`ToDate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FilesystemActivity`
--

LOCK TABLES `FilesystemActivity` WRITE;
/*!40000 ALTER TABLE `FilesystemActivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `FilesystemActivity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-03 18:54:42
