-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: ratingsdb
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Dumping data for table `personality_questions`
--

LOCK TABLES `personality_questions` WRITE;
/*!40000 ALTER TABLE `personality_questions` DISABLE KEYS */;
INSERT INTO `personality_questions` VALUES (1,'I am the life of the party'),(2,'I sympathize with others\' feelings'),(3,'I get chores done right away'),(4,'I have frequent mood swings'),(5,'I have a vivid imagination'),(6,'I don\'t talk a lot'),(7,'I am not interested in other people\'s problems'),(8,'I often forget to put things back in their proper place'),(9,'I am relaxed most of the time'),(10,'I am not interested in abstract ideas'),(11,'I talk to a lot of different people at parties'),(12,'I feel others\' emotions'),(13,'I like order'),(14,'I get upset easily'),(15,'I have difficulty understanding abstract ideas'),(16,'I keep in the background'),(17,'I am not really interested in others'),(18,'I make a mess of things'),(19,'I seldom feel blue'),(20,'I do not have a good imagination');
/*!40000 ALTER TABLE `personality_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `postsurvey_questions`
--

LOCK TABLES `postsurvey_questions` WRITE;
/*!40000 ALTER TABLE `postsurvey_questions` DISABLE KEYS */;
INSERT INTO `postsurvey_questions` VALUES (1,0,'How long did the main tasks (excluding pre and post surveys) take? Please count only the actual time you spent on the task, not the intermittent time you might have spent on other tasks.','text','duration in hours:minutes, e.g., 00:30 for thirty minutes',1),(2,0,'How do you rate the difficulty of main tasks?','multiple_choice','Very easy|Easy|Medium|High|Very high',1),(3,0,'Indicate the extent which the following phrases describe you experience with the main task (generating test scenarios) on a scale of 1 (strongly disagree) to 5 (strongly agree)','description','description',0),(4,0,'I enjoyed the task of generating test scenarios','multiple_choice_radio','1|2|3|4|5',1),(5,0,'I found the task of generating test scenarios boring','multiple_choice_radio','1|2|3|4|5',1),(6,0,'I am confident that the test scenarios I generated will be useful','multiple_choice_radio','1|2|3|4|5',1),(7,0,'I am anxious that the test scenariosI generated may not be useful','multiple_choice_radio','1|2|3|4|5',1),(8,2,'The test scenarios my team members produced inspired me','multiple_choice_radio','1|2|3|4|5',1),(9,2,'I believe that the test scenarios I produced inspired my team members','multiple_choice_radio','1|2|3|4|5',1),(10,3,'My team members answered my questions','multiple_choice_radio','1|2|3|4|5',1),(11,3,'My team members provided helpful comments','multiple_choice_radio','1|2|3|4|5',1),(12,0,'Please provide any additional comments you have below','text','Optional comments',0);
/*!40000 ALTER TABLE `postsurvey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `presurvey_questions`
--

LOCK TABLES `presurvey_questions` WRITE;
/*!40000 ALTER TABLE `presurvey_questions` DISABLE KEYS */;
INSERT INTO `presurvey_questions` VALUES (1,'What is your gender?','multiple_choice_radio','Male|Female|Other',1),(2,'Which of the following categories includes your age?','multiple_choice_radio','18 to 24|25 to 34|35 to 45|45 to 54|55 or older',1),(3,'What is the highest level of school you have completed or the highest degree you have received?','multiple_choice','Less than high school degree|High school degree or equivalent (e.g., GED)|Some college but no degree|Bachelor degree|Graduate degree',1),(4,'If you went to college, what was your major?','text','For example, computer science, mechanical engineering, psychology, music, law, etc.',0),(5,'Have you worked for a technology company?','multiple_choice','No|Yes; for less than a year|Yes; for one to five years|Yes; for more than five years',1),(6,'How do you rate your familiarity of concepts related to Computer Science, Information Techonology, and Software Engineering?','multiple_choice_radio','Very low|Low|Medium|High|Very high',1),(7,'How do you rate your familiarity of concepts related to Smart Homes, Smart Cities, and Internet of Things?','multiple_choice_radio','Very low|Low|Medium|High|Very high',1),(8,'Do you use any Smart Home technologies at your home?','multiple_choice_radio','Yes|No|Not sure',1),(9,'Please use the text box if you need to clarify any of your answers above','text','Optional clarifications',0);
/*!40000 ALTER TABLE `presurvey_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `requirement_questions`
--

LOCK TABLES `requirement_questions` WRITE;
/*!40000 ALTER TABLE `requirement_questions` DISABLE KEYS */;
INSERT INTO `requirement_questions` VALUES (1,'Novelty','multiple_choice_radio','Very Low|Low|Moderate|High|Very High',1),(2,'Usefulness','multiple_choice_radio','Very Low|Low|Moderate|High|Very High',1);
/*!40000 ALTER TABLE `requirement_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` VALUES (7,'If there is no movement or noise in a room for a preconfigured time, the smart home should automatically fade off the lights in that room, so as to save energy.'),(8,'If a person walks into a dark room, the smart home should automatically turn on the lights in that room, so as to enhance convenience and safety.'),(9,'If there is movement outside home when it is dark outside, the smart home should automatically turn on some lights, so that potential intruders are scared off.'),(10,'A smart home should optimize the lighting (e.g., brightness and color) in a room based on the activity of the users in that room, so as to enhance user experience (assume that the desired lighting for an activity is preconfigured, e.g., dim lighting for watching TV).');
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,1,'Presurvey 1','presurvey.jsp',2),(2,2,'Presurvey 2','persona.jsp',3),(3,3,'Group Creation','exec/groupassign.jsp',4),(4,4,'Instructions','debrief.jsp',5),(5,4,'Add Test Case','addTestCase.jsp',5),(6,5,'Main Instructions','debrief2.jsp',6),(7,5,'Rate Requirements','rateRequirements.jsp',6),(8,6,'Post-Survey','postsurvey.jsp',7),(9,7,'Completion Code','exec/completion.jsp',8),(10,8,'Completion Code','completed.jsp',9);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-14  1:43:38
