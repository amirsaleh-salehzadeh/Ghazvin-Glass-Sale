# SQL Manager 2007 for MySQL 4.5.0.7
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : ggc


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `ggc`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_persian_ci';

USE `ggc`;

#
# Structure for the `legaluser` table : 
#

CREATE TABLE `legaluser` (
  `companyName` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `economicNumber` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `tel` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `website` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `address` text COLLATE utf8_persian_ci,
  `username` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `faxNo` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

#
# Structure for the `news` table : 
#

CREATE TABLE `news` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8_persian_ci NOT NULL,
  `text` text COLLATE utf8_persian_ci,
  `language` varchar(9) COLLATE utf8_persian_ci DEFAULT NULL,
  `date` varchar(11) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

#
# Structure for the `orders` table : 
#

CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `ordertext` text COLLATE utf8_persian_ci,
  `productname` varchar(40) COLLATE utf8_persian_ci DEFAULT NULL,
  `username` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `date` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `operator` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `size` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `amount` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `thickness` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `packing` tinyint(1) DEFAULT NULL,
  `price` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  UNIQUE KEY `orderID` (`orderID`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

#
# Structure for the `realuser` table : 
#

CREATE TABLE `realuser` (
  `name` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
  `familyName` varchar(50) COLLATE utf8_persian_ci DEFAULT NULL,
  `tel` varchar(24) COLLATE utf8_persian_ci DEFAULT NULL,
  `address` text COLLATE utf8_persian_ci,
  `email` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `userName` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `website` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `nationalID` varchar(10) COLLATE utf8_persian_ci DEFAULT NULL,
  `faxNo` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `dob` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `occupation` varchar(200) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`userName`),
  UNIQUE KEY `userName` (`userName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

#
# Structure for the `role` table : 
#

CREATE TABLE `role` (
  `englishName` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `farsiName` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  PRIMARY KEY (`englishName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci MIN_ROWS=3;

#
# Structure for the `user` table : 
#

CREATE TABLE `user` (
  `username` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_persian_ci DEFAULT NULL,
  `isconfirmed` binary(1) DEFAULT NULL,
  `date` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL,
  `isLegal` binary(1) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

#
# Structure for the `userrole` table : 
#

CREATE TABLE `userrole` (
  `username` varchar(20) COLLATE utf8_persian_ci NOT NULL,
  `role` varchar(20) COLLATE utf8_persian_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci MAX_ROWS=3;

#
# Definition for the `GetOrders` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `GetOrders`(
        IN keyword VARCHAR(50),
        IN product VARCHAR(20),
        IN username VARCHAR(40),
        IN limit1 INTEGER(11),
        IN limit2 INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
SET @keyword = keyword;
SET @product = product;  
SET @username = username;  
SET @limit1 = limit1;
SET @limit2 = limit2; 
  PREPARE STMT FROM "select * from orders where orderID like ? OR username like ? AND productname like ? AND username like ? ORDER BY orderID DESC LIMIT ?, ?";
  EXECUTE STMT USING @keyword, @keyword, @product, @username, @limit1, @limit2;
END;

#
# Definition for the `GetOrdersTotalRows` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `GetOrdersTotalRows`(
        IN orderstatus VARCHAR(50),
        IN product VARCHAR(20),
        IN username VARCHAR(40)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
SET @orderstatus = orderstatus;
SET @product = product;  
SET @username = username;  

  PREPARE STMT FROM "SELECT count( * ) as totalItems FROM orders where orderID like ? OR username like ? AND productname like ? AND username like ? ";
  EXECUTE STMT USING @orderstatus, @orderstatus, @product, @username;
END;

#
# Definition for the `GetPages` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `GetPages`(
        IN date VARCHAR(20),
        IN limit1 INTEGER(11),
        IN limit2 INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
SET @date = date;
SET @limit1 = limit1;
SET @limit2 = limit2;  
  PREPARE STMT FROM "select * from news where date < ? ORDER BY news.ID DESC LIMIT ?, ?";
  EXECUTE STMT USING @date, @limit1, @limit2;
END;

#
# Definition for the `GetUsers` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `GetUsers`(
        IN keyword VARCHAR(50),
        IN limit1 INTEGER(11),
        IN limit2 INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
SET @keyword = keyword;
SET @limit1 = limit1;
SET @limit2 = limit2;  
  PREPARE STMT FROM "select * from user where username like ? ORDER BY user.isconfirmed ASC LIMIT ?, ?";
  EXECUTE STMT USING @keyword, @limit1, @limit2;
END;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;