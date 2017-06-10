# Host: localhost  (Version 5.5.5-10.1.21-MariaDB)
# Date: 2017-06-10 16:33:30
# Generator: MySQL-Front 6.0  (Build 1.32)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "autor"
#

DROP TABLE IF EXISTS `autor`;
CREATE TABLE `autor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "login"
#

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) DEFAULT NULL,
  `SENHA` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "post"
#

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(255) DEFAULT NULL,
  `CORPO` text,
  `DATA` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `AUTOR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AUTOR_ID_FK` (`AUTOR_ID`),
  CONSTRAINT `AUTOR_ID_FK` FOREIGN KEY (`AUTOR_ID`) REFERENCES `autor` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
