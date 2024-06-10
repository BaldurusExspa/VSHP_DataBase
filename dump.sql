-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
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
-- Table structure for table `channels`
--

DROP TABLE IF EXISTS `channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `channels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `header` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `description` text,
  `users_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_channels_users1_idx` (`users_id`),
  CONSTRAINT `fk_channels_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels`
--

LOCK TABLES `channels` WRITE;
/*!40000 ALTER TABLE `channels` DISABLE KEYS */;
INSERT INTO `channels` VALUES (1,'Channel 1','2023-01-01 00:00:00','https://example.com/channel1','https://link.to/channel1','Описание канала 1',1),(2,'Channel 2','2023-01-02 00:00:00','https://example.com/channel2','https://link.to/channel2','Описание канала 2',2),(3,'Channel 10','2023-12-31 23:59:59','https://example.com/channel10','https://link.to/channel10','Описание канала 10',3),(4,'Channel','2024-01-01 00:00:00','some url','some url','Бывает',4);
/*!40000 ALTER TABLE `channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `channelstatistics`
--

DROP TABLE IF EXISTS `channelstatistics`;
/*!50001 DROP VIEW IF EXISTS `channelstatistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `channelstatistics` AS SELECT 
 1 AS `channel_id`,
 1 AS `channel_name`,
 1 AS `create_date`,
 1 AS `total_videos`,
 1 AS `total_comments`,
 1 AS `total_likes`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL,
  `create_date` date NOT NULL,
  `comment` text NOT NULL,
  `videos_id` int NOT NULL,
  `channels_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_videos1_idx` (`videos_id`),
  KEY `fk_comments_channels1_idx` (`channels_id`),
  CONSTRAINT `fk_comments_channels1` FOREIGN KEY (`channels_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `fk_comments_videos1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'2023-01-01','HahHahahahAHhaH',1,1),(2,'2024-05-06','Phpphpphpphpphpphpphp',2,2),(3,'2024-03-02','This is a comment for video 3',3,3);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL,
  `videos_id` int NOT NULL,
  `channels_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likes_videos1_idx` (`videos_id`),
  KEY `fk_likes_channels1_idx` (`channels_id`),
  CONSTRAINT `fk_likes_channels1` FOREIGN KEY (`channels_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `fk_likes_videos1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1),(2,2,2),(3,3,3),(4,5,1),(5,5,1);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `availability` enum('public','closed','link') NOT NULL,
  `channels_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_playlists_channels1_idx` (`channels_id`),
  CONSTRAINT `fk_playlists_channels1` FOREIGN KEY (`channels_id`) REFERENCES `channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,'Playlist 1','This is the description for Playlist 1','public',1),(2,'Playlist 2','This is the description for Playlist 2','closed',2),(3,'Playlist 3','This is the description for Playlist 3','link',3),(4,'Playlist num 4','Some decs','public',1),(5,'HahLo','Some decsr','link',1);
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers` (
  `channels_id` int NOT NULL,
  `users_id` int NOT NULL,
  PRIMARY KEY (`channels_id`,`users_id`),
  KEY `fk_channels_has_users_users1_idx` (`users_id`),
  KEY `fk_channels_has_users_channels1_idx` (`channels_id`),
  CONSTRAINT `fk_channels_has_users_channels1` FOREIGN KEY (`channels_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `fk_channels_has_users_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
INSERT INTO `subscribers` VALUES (1,1),(1,2),(2,3);
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_datе` datetime NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2023-01-01 00:00:00','John Doe','john@doe.com'),(2,'2023-12-31 23:59:59','Mary Jones','mary@jones.com'),(3,'2023-01-03 00:00:00','Bob Johnson','bob@johnson.com'),(4,'2023-01-01 00:00:00','John Doe','john@doe.com'),(5,'2023-12-31 23:59:59','Mary Jones','mary@jones.com'),(6,'2023-01-03 00:00:00','Bob Johnson','bob@johnson.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `preview` varchar(255) NOT NULL,
  `channels_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_videos_channels1_idx` (`channels_id`),
  CONSTRAINT `fk_videos_channels1` FOREIGN KEY (`channels_id`) REFERENCES `channels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,'Video 1','This is a description for Video 1','http://example.com/video1',1),(2,'Video 2','This is a description for Video 2','http://example.com/video2',2),(3,'Video 3','This is a description for Video 3','http://example.com/video3',3),(4,'Video 4','Some decs','Some url',1),(5,'Vedeo 5','Some decsr','Some urls',1);
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos_has_playlists`
--

DROP TABLE IF EXISTS `videos_has_playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos_has_playlists` (
  `videos_id` int NOT NULL,
  `playlists_id` int NOT NULL,
  PRIMARY KEY (`videos_id`,`playlists_id`),
  KEY `fk_videos_has_playlists_playlists1_idx` (`playlists_id`),
  KEY `fk_videos_has_playlists_videos1_idx` (`videos_id`),
  CONSTRAINT `fk_videos_has_playlists_playlists1` FOREIGN KEY (`playlists_id`) REFERENCES `playlists` (`id`),
  CONSTRAINT `fk_videos_has_playlists_videos1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos_has_playlists`
--

LOCK TABLES `videos_has_playlists` WRITE;
/*!40000 ALTER TABLE `videos_has_playlists` DISABLE KEYS */;
INSERT INTO `videos_has_playlists` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `videos_has_playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `channelstatistics`
--

/*!50001 DROP VIEW IF EXISTS `channelstatistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `channelstatistics` AS select `channels`.`id` AS `channel_id`,`channels`.`name` AS `channel_name`,`channels`.`create_date` AS `create_date`,count(distinct `videos`.`id`) AS `total_videos`,count(distinct `comments`.`id`) AS `total_comments`,count(distinct `likes`.`id`) AS `total_likes` from (((`channels` left join `videos` on((`channels`.`id` = `videos`.`channels_id`))) left join `comments` on((`channels`.`id` = `comments`.`channels_id`))) left join `likes` on((`channels`.`id` = `likes`.`channels_id`))) group by `channels`.`id`,`channels`.`name`,`channels`.`create_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-10 17:56:16
