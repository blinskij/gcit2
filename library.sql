-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
-- Table structure for table `tbl_author`
--

DROP TABLE IF EXISTS `tbl_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_author` (
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `authorName` varchar(45) NOT NULL,
  PRIMARY KEY (`authorId`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_author`
--

LOCK TABLES `tbl_author` WRITE;
/*!40000 ALTER TABLE `tbl_author` DISABLE KEYS */;
INSERT INTO `tbl_author` VALUES (2,'Stepehen King'),(3,'Mark Penn'),(6,'Prosto Vasya II'),(7,'Vasya1'),(23,'Inkvisitor1'),(32,'lerr'),(38,'Blin Blinovich Blinskij'),(46,'Bugaga'),(51,'ZlojAuthor'),(53,'Alice'),(55,'Dr Alexander Isaac'),(56,'john'),(57,'Vasya II');
/*!40000 ALTER TABLE `tbl_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book`
--

DROP TABLE IF EXISTS `tbl_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book` (
  `bookId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `pubId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `fk_publisher` (`pubId`),
  CONSTRAINT `fk_publisher` FOREIGN KEY (`pubId`) REFERENCES `tbl_publisher` (`publisherId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book`
--

LOCK TABLES `tbl_book` WRITE;
/*!40000 ALTER TABLE `tbl_book` DISABLE KEYS */;
INSERT INTO `tbl_book` VALUES (4,'Lost Tribe',21),(5,'The Haunting',17),(6,'Microtrends1',20),(8,'aa',NULL),(31,'k23',2),(32,'xxxx4',NULL),(33,'some scary book 2',NULL),(36,'another',3),(37,'qwerty',NULL),(38,'very scary book',2),(39,'test3',NULL),(40,'test1',NULL),(41,'test1',NULL),(42,'test1',NULL),(43,'test1',NULL),(44,'test1',NULL),(45,'test2',NULL),(46,'testBook',NULL),(47,'testBook',NULL),(48,'testBook angular',NULL),(49,'testBook 33333333',NULL),(50,'angular',16),(51,'aaaaaaaaaaa',16),(52,'Velikaya Hren2',16),(53,'aaaaaaaaaaaaaa',NULL),(54,'john dies at the end',NULL),(56,'string1',21);
/*!40000 ALTER TABLE `tbl_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_authors`
--

DROP TABLE IF EXISTS `tbl_book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book_authors` (
  `bookId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  PRIMARY KEY (`bookId`,`authorId`),
  KEY `fk_tbl_book_authors_tbl_author1_idx` (`authorId`),
  CONSTRAINT `fk_tbl_book_authors_tbl_author1` FOREIGN KEY (`authorId`) REFERENCES `tbl_author` (`authorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_book_authors_tbl_book1` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_authors`
--

LOCK TABLES `tbl_book_authors` WRITE;
/*!40000 ALTER TABLE `tbl_book_authors` DISABLE KEYS */;
INSERT INTO `tbl_book_authors` VALUES (4,2),(5,2),(6,2),(32,2),(33,2),(38,2),(51,2),(56,2),(6,3),(8,3),(36,3),(50,3),(51,3),(52,3),(56,3),(4,6),(6,6),(36,6),(50,6),(51,6),(31,7),(32,7),(40,7),(52,23),(5,32),(47,32),(44,38),(45,38),(40,46),(43,51),(45,51),(5,55),(6,55),(8,56),(54,56),(6,57),(31,57),(40,57);
/*!40000 ALTER TABLE `tbl_book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_copies`
--

DROP TABLE IF EXISTS `tbl_book_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book_copies` (
  `bookId` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `noOfCopies` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookId`,`branchId`),
  KEY `fk_bc_book` (`bookId`),
  KEY `fk_bc_branch` (`branchId`),
  CONSTRAINT `fk_bc_book` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bc_branch` FOREIGN KEY (`branchId`) REFERENCES `tbl_library_branch` (`branchId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_copies`
--

LOCK TABLES `tbl_book_copies` WRITE;
/*!40000 ALTER TABLE `tbl_book_copies` DISABLE KEYS */;
INSERT INTO `tbl_book_copies` VALUES (4,13,22),(4,16,5),(4,17,5),(6,13,52),(56,6,100),(56,13,0);
/*!40000 ALTER TABLE `tbl_book_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_genres`
--

DROP TABLE IF EXISTS `tbl_book_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book_genres` (
  `genre_id` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  PRIMARY KEY (`genre_id`,`bookId`),
  KEY `fk_tbl_book_genres_tbl_book1_idx` (`bookId`),
  CONSTRAINT `fk_tbl_book_genres_tbl_book1` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_book_genres_tbl_genre1` FOREIGN KEY (`genre_id`) REFERENCES `tbl_genre` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_genres`
--

LOCK TABLES `tbl_book_genres` WRITE;
/*!40000 ALTER TABLE `tbl_book_genres` DISABLE KEYS */;
INSERT INTO `tbl_book_genres` VALUES (2,4),(4,4),(21,4),(23,4),(1,5),(3,5),(3,6),(4,6),(10,6),(2,8),(11,8),(4,31),(2,32),(4,32),(20,32),(20,36),(11,40),(11,42),(13,42),(14,47),(14,48),(12,49),(12,51),(16,51),(16,52),(1,54),(2,54);
/*!40000 ALTER TABLE `tbl_book_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_book_loans`
--

DROP TABLE IF EXISTS `tbl_book_loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_book_loans` (
  `bookId` int(11) NOT NULL,
  `branchId` int(11) NOT NULL,
  `cardNo` int(11) NOT NULL,
  `dateOut` datetime NOT NULL,
  `dueDate` datetime DEFAULT NULL,
  `dateIn` datetime DEFAULT NULL,
  PRIMARY KEY (`bookId`,`branchId`,`cardNo`,`dateOut`),
  KEY `fk_bl_book` (`bookId`),
  KEY `fk_bl_branch` (`branchId`),
  KEY `fk_bl_borrower` (`cardNo`),
  CONSTRAINT `fk_bl_book` FOREIGN KEY (`bookId`) REFERENCES `tbl_book` (`bookId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bl_borrower` FOREIGN KEY (`cardNo`) REFERENCES `tbl_borrower` (`cardNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bl_branch` FOREIGN KEY (`branchId`) REFERENCES `tbl_library_branch` (`branchId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_book_loans`
--

LOCK TABLES `tbl_book_loans` WRITE;
/*!40000 ALTER TABLE `tbl_book_loans` DISABLE KEYS */;
INSERT INTO `tbl_book_loans` VALUES (4,13,2,'2017-09-04 12:57:23','2017-10-01 16:59:00','2017-09-11 06:09:24'),(4,13,2,'2017-09-04 13:00:37','2017-10-10 13:00:37','2017-09-18 13:11:32'),(4,13,2,'2017-09-04 13:02:18','2017-09-11 13:02:18','2017-09-11 06:27:56'),(4,13,2,'2017-09-04 13:05:40','2017-09-11 13:05:40',NULL),(4,13,2,'2017-09-04 13:06:43','2017-09-11 13:06:43',NULL),(4,13,2,'2017-09-04 13:07:21','2017-09-11 13:07:21',NULL),(4,13,2,'2017-09-04 13:09:45','2017-09-11 13:09:45','2017-09-11 06:11:21'),(4,13,5,'2017-08-30 16:13:38','2017-09-06 16:13:03',NULL),(4,13,5,'2017-09-11 05:20:06','2017-09-18 05:20:06','2017-09-11 06:07:39'),(5,5,2,'2017-08-28 18:12:33','2017-09-04 18:12:33',NULL),(6,6,2,'2017-08-28 15:51:56','2017-09-04 15:51:56',NULL),(6,6,2,'2017-08-30 14:51:54','2017-09-06 14:51:54',NULL),(6,6,2,'2017-09-03 19:27:16','2017-09-29 19:27:16',NULL),(6,6,2,'2017-09-03 19:28:06','2017-09-10 19:28:06',NULL),(6,6,2,'2017-09-04 12:59:06','2017-09-11 12:59:06',NULL),(6,6,2,'2017-09-04 12:59:53','2017-10-11 12:59:53',NULL),(6,6,2,'2017-09-11 06:32:04','2017-09-18 06:32:04',NULL),(6,13,2,'2017-09-18 14:08:43','2017-09-25 14:08:43','2017-09-18 14:12:06');
/*!40000 ALTER TABLE `tbl_book_loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_borrower`
--

DROP TABLE IF EXISTS `tbl_borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_borrower` (
  `cardNo` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_borrower`
--

LOCK TABLES `tbl_borrower` WRITE;
/*!40000 ALTER TABLE `tbl_borrower` DISABLE KEYS */;
INSERT INTO `tbl_borrower` VALUES (2,'Blin Blinskij','1st Ave 84','360-998-9999'),(4,'Plushkina','Some Other Ave','360-987-0000'),(5,'Vasya','Some Street 46','920-872-9900'),(8,'wesker','some ave',NULL),(10,'cccccccccccccccccc',NULL,NULL),(11,'xxxxxxxxxxxxx',NULL,NULL),(14,'john','seattle',NULL),(15,'alice','Racoon city',NULL),(16,'Gaevskaya','NY','333333333'),(17,'Gerald Brom','Seattle','7777777'),(18,'Gans','Fairfax VA','444');
/*!40000 ALTER TABLE `tbl_borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_genre`
--

DROP TABLE IF EXISTS `tbl_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_genre` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_genre`
--

LOCK TABLES `tbl_genre` WRITE;
/*!40000 ALTER TABLE `tbl_genre` DISABLE KEYS */;
INSERT INTO `tbl_genre` VALUES (1,'Horror'),(2,'Crime Fict'),(3,'ThrillerRRRRRRRR'),(4,'Non-fiction'),(5,'post modernism'),(10,'contr culture'),(11,'xxxxxxxxxx'),(12,'kkkkkkkkk'),(13,'zzzzzzzzz'),(14,'xxxxxxxxxxx'),(16,'jh'),(20,'Absurd'),(21,'modernism1'),(23,'modernism');
/*!40000 ALTER TABLE `tbl_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_library_branch`
--

DROP TABLE IF EXISTS `tbl_library_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_library_branch` (
  `branchId` int(11) NOT NULL AUTO_INCREMENT,
  `branchName` varchar(45) DEFAULT NULL,
  `branchAddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_library_branch`
--

LOCK TABLES `tbl_library_branch` WRITE;
/*!40000 ALTER TABLE `tbl_library_branch` DISABLE KEYS */;
INSERT INTO `tbl_library_branch` VALUES (5,'State Library','New York'),(6,'Federal Library','Washington DC'),(7,'Country Library','McLean VA'),(13,'branch2','Seattle'),(14,'test2','test3'),(15,'angular','Seattle, WA'),(16,'test','Seattle'),(17,'test','Seattle'),(19,'test2','Wash DC'),(20,'angula','angular'),(21,'jjjjjjjjjjjjjjj','jjjjjjjjjjjj'),(22,'another branch','uyiuyuyu'),(27,'poi','poi');
/*!40000 ALTER TABLE `tbl_library_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_publisher`
--

DROP TABLE IF EXISTS `tbl_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_publisher` (
  `publisherId` int(11) NOT NULL AUTO_INCREMENT,
  `publisherName` varchar(45) NOT NULL,
  `publisherAddress` varchar(45) DEFAULT NULL,
  `publisherPhone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`publisherId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_publisher`
--

LOCK TABLES `tbl_publisher` WRITE;
/*!40000 ALTER TABLE `tbl_publisher` DISABLE KEYS */;
INSERT INTO `tbl_publisher` VALUES (1,'Pub11','Washington, DC','101000101'),(2,'Pub2','NY','000-0000-0003'),(3,'Pub3','WA','000-0011-0000'),(4,'Pub44','VA','57578'),(6,'dddddddddd','ddddddddd','ffffffffffff'),(9,'jjjjjjjjjjjjj1','ekkkkkkk','837498234'),(13,'great publisher','Washington DC','360-980-0000'),(16,'angular2','jjjjjjj','88888888'),(17,'x1','x1','x1'),(18,'xxxxxxxxxx','xxxxxxx','xxxxxx'),(20,'string2','Minsk2','string2'),(21,'AdamchikiPubl','Kalinovskogo 37','6785876555555');
/*!40000 ALTER TABLE `tbl_publisher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-21  2:16:49
