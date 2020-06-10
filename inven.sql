/*
SQLyog Ultimate v8.55 
MySQL - 5.1.36-community : Database - inventory
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`inventory` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `inventory`;

/*Table structure for table `admin_tbl` */

DROP TABLE IF EXISTS `admin_tbl`;

CREATE TABLE `admin_tbl` (
  `adminMailID` varchar(20) DEFAULT NULL,
  `adminPassword` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin_tbl` */

insert  into `admin_tbl`(`adminMailID`,`adminPassword`) values ('admin@gmail.com','admin123');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`CategoryID`,`CategoryName`) values (1,'Household'),(2,'Eatable'),(5,'groceries');

/*Table structure for table `product_tbl` */

DROP TABLE IF EXISTS `product_tbl`;

CREATE TABLE `product_tbl` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(30) DEFAULT NULL,
  `ProductCostprice` double DEFAULT NULL,
  `ProductSellingprice` double DEFAULT NULL,
  `ProductQuantity` double DEFAULT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `product_tbl` */

insert  into `product_tbl`(`ProductID`,`ProductName`,`ProductCostprice`,`ProductSellingprice`,`ProductQuantity`,`CategoryID`) values (14,'Surf excel',80.05,555,555,1);

/*Table structure for table `transaction_tbl` */

DROP TABLE IF EXISTS `transaction_tbl`;

CREATE TABLE `transaction_tbl` (
  `transactionID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) DEFAULT NULL,
  `payment` double DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`transactionID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `transaction_tbl` */

insert  into `transaction_tbl`(`transactionID`,`ProductID`,`payment`,`UserID`) values (1,14,555,1),(2,14,555,1),(3,14,555,1),(4,14,555,1),(5,14,555,1),(6,14,555,1),(7,14,555,1),(8,14,555,1),(9,14,555,1);

/*Table structure for table `user_tbl` */

DROP TABLE IF EXISTS `user_tbl`;

CREATE TABLE `user_tbl` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(30) DEFAULT NULL,
  `MailID` varchar(20) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL,
  `MobileNumber` varchar(10) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `ammount` double DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `user_tbl` */

insert  into `user_tbl`(`UserID`,`UserName`,`MailID`,`Password`,`MobileNumber`,`Address`,`ammount`) values (1,'Neha','neha@gmail.com','neha123','9535680645','Vinayak nagar,Mysore',435),(3,'Jyothsna','jyo@gmail.com','123','9638527410','Mysore',1000);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
