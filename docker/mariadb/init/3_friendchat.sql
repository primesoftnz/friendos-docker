-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: mariadb    Database: friendchat
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

USE friendchat;

ALTER DATABASE CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `settings_json`;
DROP TABLE IF EXISTS `contact`;
DROP TABLE IF EXISTS `identity`;
DROP TABLE IF EXISTS `module`;
DROP TABLE IF EXISTS `account`;
DROP TABLE IF EXISTS `db_history`;

CREATE TABLE `account` (
	`_id`       INT UNSIGNED NOT NULL auto_increment,
	`clientId`  VARCHAR(191) NOT NULL UNIQUE,
	`userId`    VARCHAR(191) NOT NULL,
	`name`      VARCHAR(191) NOT NULL,
	`lastLogin` TIMESTAMP NULL,
	PRIMARY KEY(_id),
	CONSTRAINT UNIQUE `userId_name`( userId, name )
) ENGINE=INNODB CHARACTER SET=utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE `module` (
	`_id`         INT NOT NULL auto_increment,
	`type`        VARCHAR(191) NOT NULL,
	`clientId`    VARCHAR(191) NOT NULL UNIQUE,
	`displayName` VARCHAR(191),
	`host`        VARCHAR(191),
	`port`        INT(5),
	`login`       VARCHAR(191),
	`password`    VARCHAR(191),
	`accountId`   VARCHAR(191) NOT NULL,
	PRIMARY KEY (_id),
	FOREIGN KEY ( accountId ) REFERENCES account( clientId )
		ON DELETE CASCADE
		ON UPDATE CASCADE
) ENGINE=INNODB CHARACTER SET=utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE `contact` (
	`_id`           INT NOT NULL auto_increment,
	`clientId`      VARCHAR(191) NOT NULL UNIQUE,
	`serviceId`     VARCHAR(191) NOT NULL,
	`displayName`   VARCHAR(191),
	`subscribeTo`   BOOLEAN NOT NULL,
	`subscribeFrom` BOOLEAN NOT NULL,
	`accountId`     VARCHAR(191) NOT NULL,
	`moduleId`      VARCHAR(191) NOT NULL,
	PRIMARY KEY( _id ),
	UNIQUE KEY ( clientId, accountId, moduleId ),
	FOREIGN KEY ( accountId ) REFERENCES account( clientId )
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY ( moduleId ) REFERENCES module( clientId )
		ON DELETE CASCADE
		ON UPDATE CASCADE
) ENGINE=INNODB CHARACTER SET=utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE `settings_json` (
	`_id`      INT NOT NULL auto_increment,
	`settings` TEXT,
	`clientId` VARCHAR(191) NOT NULL UNIQUE,
	PRIMARY KEY( _id )
) ENGINE=INNODB CHARACTER SET=utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE `identity` (
	`_id`       INT NOT NULL auto_increment,
	`clientId`  VARCHAR(191) NOT NULL,
	`json`      TEXT,
	`accountId` VARCHAR(191) NOT NULL,
	PRIMARY KEY( _id ),
	FOREIGN KEY( accountId ) REFERENCES account( clientId )
		ON DELETE CASCADE
		ON UPDATE CASCADE
) ENGINE=INNODB CHARACTER SET=utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE `db_history` (
	`_id`     INT UNSIGNED NOT NULL auto_increment,
	`version` INT UNSIGNED NOT NULL,
	`patch`   INT UNSIGNED NOT NULL,
	`comment` VARCHAR(191) NOT NULL,
	`applied` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY( _id )
) ENGINE=INNODB CHARACTER SET=utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO `db_history`(
	`version`,
	`patch`,
	`comment`
) VALUES (
	1,
	14,
	'table version'
);
