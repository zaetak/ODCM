/*
SQLyog Ultimate v11.5 (64 bit)
MySQL - 10.1.10-MariaDB : Database - odcmdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`odcmdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `odcmdb`;

/*Table structure for table `administratortbl` */

DROP TABLE IF EXISTS `administratortbl`;

CREATE TABLE `administratortbl` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `IsVerified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `administratortbl` */

insert  into `administratortbl`(`ID`,`LastName`,`FirstName`,`MiddleName`,`Username`,`Password`,`IsVerified`) values (1,'Guarico','Emmanuel','Paular','EPG','qweqwe',1),(2,'Guarico','Hera','Bilugan','Hera','qweqwe',1);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(45) NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`cat_id`,`cat_name`) values (1,'Consumables'),(2,'Disposables'),(4,'Etc');

/*Table structure for table `clienttbl` */

DROP TABLE IF EXISTS `clienttbl`;

CREATE TABLE `clienttbl` (
  `ClientID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `Religion` varchar(50) DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  `Guardian` varchar(50) DEFAULT NULL,
  `NickName` varchar(50) DEFAULT NULL,
  `Occupation` varchar(50) DEFAULT NULL,
  `Address` varchar(256) DEFAULT NULL,
  `PhoneNumber` varchar(50) DEFAULT NULL,
  `EmailAddress` varchar(50) DEFAULT NULL,
  `HomeNo` varchar(50) DEFAULT NULL,
  `OfficeNo` varchar(50) DEFAULT NULL,
  `DentalInsurance` varchar(50) DEFAULT NULL,
  `FaxNo` varchar(50) DEFAULT NULL,
  `EffectiveDate` date DEFAULT NULL,
  `GuardianOccup` varchar(50) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `IsVerified` tinyint(1) DEFAULT NULL,
  `Role` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `clienttbl` */

insert  into `clienttbl`(`ClientID`,`LastName`,`FirstName`,`MiddleName`,`Birthdate`,`Age`,`Gender`,`Religion`,`Nationality`,`Guardian`,`NickName`,`Occupation`,`Address`,`PhoneNumber`,`EmailAddress`,`HomeNo`,`OfficeNo`,`DentalInsurance`,`FaxNo`,`EffectiveDate`,`GuardianOccup`,`Username`,`Password`,`IsVerified`,`Role`) values (1,'Guarico','Emmanuel','Paular','2017-10-06',23,'Male','Roman Catholic','Filipino','','Emman','Programmer','Carmona','639059160063','emmanuelguarico@gmail.com','11727','NONE','NONE','NONE','2017-10-06','','Emman','qweqwe',1,'Administrator'),(2,'Guarico','Hera','Bilugan','2017-09-16',5,'Female','Roman Catholic','Filipino','','Hera','NONE','Carmona','639059160063','hera@gmail.com','11726','NONE','NONE','NONE','2017-09-16','','Hera','qweqwe',1,'User'),(3,'Tan','Joseph William','L','2017-10-17',21,'Male','Roman Catholic','Filipino','','Tan','Programmer','Carmona','639361833593','tan@gmail.com','11723','NONE','NONE','NONE','2018-01-14','','Tan','maria',1,'User');

/*Table structure for table `dentalhistory` */

DROP TABLE IF EXISTS `dentalhistory`;

CREATE TABLE `dentalhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) DEFAULT NULL,
  `patientteethid` int(11) DEFAULT NULL,
  `medicalhistory` longtext,
  `datehistory` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dentalhistory` */

/*Table structure for table `orthodontichistory` */

DROP TABLE IF EXISTS `orthodontichistory`;

CREATE TABLE `orthodontichistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) DEFAULT NULL,
  `patientteethid` int(11) DEFAULT NULL,
  `examdate` date DEFAULT NULL,
  `chiefcomplaint` longtext,
  `medicationnow` varchar(10) DEFAULT NULL,
  `congenital` varchar(10) DEFAULT NULL,
  `temporo` varchar(10) DEFAULT NULL,
  `oralhygiene` varchar(50) DEFAULT NULL,
  `gingivaltissue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orthodontichistory` */

/*Table structure for table `patientteeth` */

DROP TABLE IF EXISTS `patientteeth`;

CREATE TABLE `patientteeth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) DEFAULT NULL,
  `teethid` int(11) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `examdate` date DEFAULT NULL,
  `diagnosis` longtext,
  `chiefcomplaint` longtext,
  `dentalhistory` longtext,
  `medication` varchar(10) DEFAULT NULL,
  `congenital` varchar(10) DEFAULT NULL,
  `temporo` varchar(10) DEFAULT NULL,
  `oralhygiene` varchar(10) DEFAULT NULL,
  `gingival` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `patientteeth` */

insert  into `patientteeth`(`id`,`clientid`,`teethid`,`service`,`examdate`,`diagnosis`,`chiefcomplaint`,`dentalhistory`,`medication`,`congenital`,`temporo`,`oralhygiene`,`gingival`) values (1,1,51,'Cleaning','2017-10-06','Cleaning','Chief Complaint',NULL,'Yes','Yes','Yes','Fair','Normal'),(2,1,52,'Bleaching / Whitening','2017-10-11','Diagnosis','Chief complaint','Past Dental History','Yes','No','Yes','Fair','Receding'),(3,1,52,'Bleaching / Whitening','2017-10-11','Diagnosis','Chief complaint','Past Dental History','Yes','Yes','Yes','Fair','Receding');

/*Table structure for table `reservationtbl` */

DROP TABLE IF EXISTS `reservationtbl`;

CREATE TABLE `reservationtbl` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClientID` int(11) DEFAULT NULL,
  `DateReserved` date DEFAULT NULL,
  `TimeReserved` time DEFAULT NULL,
  `ServiceID` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `reservationtbl` */

insert  into `reservationtbl`(`ID`,`ClientID`,`DateReserved`,`TimeReserved`,`ServiceID`,`Remarks`,`Status`) values (8,2,'2017-09-20','19:00:00',5,'asd','Pending'),(9,2,'2017-11-24','11:00:00',3,'123','Pending'),(10,2,'2017-11-28','08:00:00',2,'Asd','Approved'),(11,2,'2017-11-28','08:00:00',5,'asd','Disapproved');

/*Table structure for table `servicestbl` */

DROP TABLE IF EXISTS `servicestbl`;

CREATE TABLE `servicestbl` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ServiceOffered` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `servicestbl` */

insert  into `servicestbl`(`ID`,`ServiceOffered`) values (2,'Restorative Dentistry'),(3,'Cosmetic Dentistry'),(5,'Pediatric Dentistry'),(6,'Surgery'),(7,'Orthodontics'),(12,'Prosthodontics');

/*Table structure for table `stockoutlist` */

DROP TABLE IF EXISTS `stockoutlist`;

CREATE TABLE `stockoutlist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Itemname` varchar(50) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Operation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `stockoutlist` */

insert  into `stockoutlist`(`ID`,`Itemname`,`Quantity`,`Operation`) values (1,'Bandage',5,'Surgery'),(2,'Bandage',15,'Pediatric Dentistry'),(4,'Dextrose',1,'Pediatric Dentistry'),(6,'Bandage',10,'Pediatric Dentistry'),(7,'Try',1,'Pediatric Dentistry'),(8,'Bandage',9,'Pediatric Dentistry'),(9,'Dextrose',1,'Pediatric Dentistry'),(10,'Pentel',1,'Orthodontics'),(11,'Try',1,'Orthodontics'),(12,'Dextrose',1,'Orthodontics'),(19,'Dextrose',1,'Bleaching / Whitening'),(22,'Pentel',1,'Bleaching / Whitening');

/*Table structure for table `suppliesinouttbl` */

DROP TABLE IF EXISTS `suppliesinouttbl`;

CREATE TABLE `suppliesinouttbl` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SupplyID` int(11) DEFAULT NULL,
  `Stock` varchar(50) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `DateStock` date DEFAULT NULL,
  `Invoice` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `suppliesinouttbl` */

insert  into `suppliesinouttbl`(`ID`,`SupplyID`,`Stock`,`Quantity`,`DateStock`,`Invoice`) values (4,1,'IN',10,'2017-09-10','9989'),(5,2,'IN',20,'2017-09-10','9989'),(6,2,'OUT',10,'2017-09-10','9989'),(7,2,'OUT',10,'2017-09-10','9989'),(8,1,'OUT',10,'2017-10-01','9989'),(9,7,'OUT',5,'2017-10-01','9989'),(10,1,'OUT',5,'2017-11-12','9989'),(11,1,'IN',5,'2017-11-12','9989'),(13,2,'OUT',5,'2017-11-16','9989'),(14,2,'IN',10,'2017-11-16','9989'),(15,2,'IN',100,'2017-11-25','9989'),(16,2,'OUT',15,'2017-11-25','9989'),(17,9,'OUT',123,'2017-11-25','9989'),(18,2,'IN',10,'2017-11-27','9989');

/*Table structure for table `suppliestbl` */

DROP TABLE IF EXISTS `suppliestbl`;

CREATE TABLE `suppliestbl` (
  `SupplyID` int(11) NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(50) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `UOM` varchar(50) DEFAULT NULL,
  `Supplier` varchar(50) DEFAULT NULL,
  `ExpiDate` date DEFAULT NULL,
  `Invoice` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`SupplyID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `suppliestbl` */

insert  into `suppliestbl`(`SupplyID`,`ItemName`,`Quantity`,`Category`,`UOM`,`Supplier`,`ExpiDate`,`Invoice`) values (1,'Try',20,'Consumables','PCS','Johnson & Johnson','2017-11-16','0001'),(2,'Bandage',120,'Consumables','BOX','Johnson & Johnson','2017-11-15','0004'),(7,'Dextrose',5,'Consumables','LITERS','Johnson & Johnson','2017-11-16','0003'),(8,'Pentel',10,'Disposables','PCS','AMA','2017-11-30','0009'),(9,'Etccc',11,'Etc','LITERS','Etccccc','2017-12-27','123123');

/*Table structure for table `uom` */

DROP TABLE IF EXISTS `uom`;

CREATE TABLE `uom` (
  `uom_id` int(11) NOT NULL AUTO_INCREMENT,
  `uom_name` varchar(45) NOT NULL,
  PRIMARY KEY (`uom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `uom` */

insert  into `uom`(`uom_id`,`uom_name`) values (1,'PCS'),(2,'BOX'),(3,'LITERS');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
