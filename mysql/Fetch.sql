CREATE DATABASE `fetch`;
USE `fetch`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

DROP TABLE IF EXISTS `FetchComments`;
CREATE TABLE IF NOT EXISTS `FetchComments` (
  `CommentID` int(11) NOT NULL AUTO_INCREMENT,
  `PostID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CommentText` text COLLATE utf8_unicode_ci NOT NULL,
  `CommentScore` int(11) NOT NULL DEFAULT '0',
  `ParentComment` int(11) DEFAULT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `PostID` (`PostID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FetchComments`
--

INSERT INTO `FetchComments` (`CommentID`, `PostID`, `UserID`, `CommentText`, `CommentScore`, `ParentComment`) VALUES
(1, 1, 26, 'What a cute puppy!!!', 3, NULL),
(2, 1, 24, 'Thank you!', 5, NULL),
(3, 2, 97, 'Make sure you buy a lot of scratch boards and treat the kitten when they scratch it instead of the furniture! ', 1, NULL),
(4, 52, 2, 'He\'s so cute! What is his name??', 0, NULL),
(5, 52, 24, 'Thank you! His name is Joey!', 2, NULL),
(6, 45, 24, 'OMG LOVE LOVE LOVE!!', 1, NULL),
(10, 30, 16, 'Get him to the vet asap!!!', 5, NULL),
(11, 7, 16, 'Distract him and dont make a big deal of the sounds. He can sense if you\'re worried about him and then think that he should be worried about the sound', 2, NULL),
(12, 41, 16, 'Great advice!', 0, NULL),
(13, 41, 16, 'Thank you!!!', 0, NULL),
(14, 26, 16, 'how about chirps?', 3, NULL),
(15, 26, 24, 'Flutters!! 100%', 20, NULL),
(16, 26, 17, 'I like Flutters too!', 19, NULL),
(17, 26, 17, 'Or Birb! XD', 8, NULL),
(18, 26, 20, 'BIRB!!!', 4, NULL),
(19, 50, 20, 'LOL. I need this much self control', 0, NULL),
(20, 47, 20, 'Mine does the same thing! ', 0, NULL),
(21, 47, 20, 'Its the worst to leave!', 0, NULL),
(22, 42, 20, 'ET home phone! ;)', 32, NULL),
(23, 1, 25, 'Love him!', 0, NULL),
(24, 13, 25, 'Depends on the temperament of your dog. It would be easier if you start them off young so they get used to it. Definitely invest in a good set of razors too!', 0, NULL),
(25, 39, 25, 'Me right now :\')', 0, NULL),
(26, 30, 25, 'Go to the vet!! OMG', 0, NULL),
(27, 17, 25, 'Maybe let your dog meet the mailman? Show it that theres nothing to freak out about?', 0, NULL),
(28, 48, 7, 'very very long. about 30-40 years!', 0, NULL),
(29, 48, 7, 'If you\'re thinking of getting one, please ensure you\'re ready for a long time commitment', 2, NULL),
(31, 32, 7, 'Both are gorgeous! <3', 0, NULL),
(32, 31, 7, 'Happy birthday to that fluffy cutie!! ', 0, NULL),
(33, 31, 7, 'Love the hat too!! :)', 0, NULL),
(34, 2, 101, 'I agree with Aaliyah. There\'s only so much you can do though. Its their instinct to scratch things', 0, NULL),
(35, 24, 101, 'HAHAHAHAH PLEASE KEEP POSTING PICS OF YOUR \"PET\"!', 1, NULL),
(36, 24, 95, 'OMG OMG OMG What\'s his favourite type of music? Rock and roll?? :P', 76, NULL),
(37, 24, 94, 'his eyesssss!!!!!!!!!! lollll', 5, NULL),
(39, 44, 82, 'My cat does this all the time', 0, NULL),
(40, 44, 82, 'isnt it adorable!', 0, NULL),
(41, 42, 90, 'Please give the pup some cuddles! Look at that face!!!', 0, NULL),
(42, 18, 90, 'He looks like he needs a haircut :P ', 23, NULL),
(43, 12, 90, 'Normally, you feel for the ribs. If it is easy to feel, its a good size', 0, NULL),
(44, 8, 90, 'Good as long as you slowly introduce it to them', 0, NULL),
(45, 8, 90, 'dogs are carnivores and they have enzymes that break down raw food well', 3, NULL),
(46, 24, 90, 'Thanks for the idea! I\'m gonna let my toddler have a pet pebble! No care needed lmao', 1, NULL),
(47, 10, 90, 'What a princely pup!', 1, NULL),
(48, 4, 90, 'I second this!! post lots everyone!', 0, NULL),
(49, 49, 81, 'Its so fluffy!! I\'m going to die!!', 0, NULL),
(50, 9, 106, 'Choosing a dog can be exciting and nerve-wracking at the same time. After all, you\'re committing to care for a living, breathing being who will depend on you his entire life! When choosing a new dog, so many questions run through your mind: \"What kind of dog should I get?\" \"What\'s the best dog breed for me?\" \"Will he be a good fit with my family?\"\r\n\r\nThe first step to being a responsible dog owner begins before you even bring home a dog. Thoughtfully and seriously assess your needs before making a decision, and you\'ll live long, happy lives together.', 23, NULL),
(51, 2, 15, 'So you took the big step, you brought a new kitten into your home. Now, the first thing you can do is unplug the television because this kitten will be your new and constant source of entertainment. If, by some chance, you have 2 new kittens, you can also put your books away and be prepared for many memorable hours.', 0, NULL),
(52, 26, 89, 'Flutters!!!', 8, NULL),
(53, 55, 5, 'Consistency! ', 1, NULL),
(54, 55, 5, 'Stick to a schedule for poops, pees, everything!', 47, NULL),
(61, 24, 24, 'comment\n', 0, NULL);

--
-- Triggers `FetchComments`
--
DROP TRIGGER IF EXISTS `count_comments`;
DELIMITER $$
CREATE TRIGGER `count_comments` AFTER INSERT ON `FetchComments` FOR EACH ROW BEGIN
		UPDATE FetchPosts
		SET NumComments = (NumComments + 1)
		WHERE PostID = NEW.PostID;
		
		SELECT UserID INTO @userid
		FROM FetchPosts
		WHERE PostID = NEW.PostID;
		
		SELECT UserName INTO @username
		FROM FetchUsers
		WHERE UserID = NEW.UserID;
		
		INSERT INTO FetchNotifs (`UserID`, `PostID`, `CommenterName`)
		VALUES (@userid, NEW.PostID, @username);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `FetchCommentVotes`
--

DROP TABLE IF EXISTS `FetchCommentVotes`;
CREATE TABLE IF NOT EXISTS `FetchCommentVotes` (
  `UserID` int(11) NOT NULL,
  `CommentID` int(11) NOT NULL,
  `Vote` tinyint(4) NOT NULL,
  PRIMARY KEY (`UserID`,`CommentID`),
  KEY `CommentID` (`CommentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FetchCommentVotes`
--

INSERT INTO `FetchCommentVotes` (`UserID`, `CommentID`, `Vote`) VALUES
(24, 37, 1),
(24, 53, 1);

--
-- Triggers `FetchCommentVotes`
--
DROP TRIGGER IF EXISTS `comment_votes_insert`;
DELIMITER $$
CREATE TRIGGER `comment_votes_insert` AFTER INSERT ON `FetchCommentVotes` FOR EACH ROW BEGIN
		UPDATE FetchComments
		SET CommentScore = (CommentScore + NEW.Vote)
		WHERE CommentID = NEW.CommentID;

		SELECT CommentScore INTO @score
		FROM FetchComments
		WHERE CommentID = NEW.CommentID;
		
		IF @score <= -5 THEN
			DELETE FROM FetchComments
			WHERE CommentID = NEW.CommentID;
		END IF;

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `comment_votes_update`;
DELIMITER $$
CREATE TRIGGER `comment_votes_update` BEFORE UPDATE ON `FetchCommentVotes` FOR EACH ROW BEGIN
		/* Set the new vote to the difference */
		IF NEW.Vote = OLD.Vote THEN
			SET NEW.Vote = 0;
		END IF;

		UPDATE FetchComments
		SET CommentScore = (CommentScore + NEW.Vote - OLD.Vote)
		WHERE CommentID = NEW.CommentID;
		
		SELECT CommentScore INTO @score
		FROM FetchComments
		WHERE CommentID = NEW.CommentID;
		
		IF @score <= -5 THEN
			DELETE FROM FetchComments
			WHERE CommentID = NEW.CommentID;
		END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `FetchNotifs`
--

DROP TABLE IF EXISTS `FetchNotifs`;
CREATE TABLE IF NOT EXISTS `FetchNotifs` (
  `NotifID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `CommenterName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PostID` int(11) NOT NULL,
  PRIMARY KEY (`NotifID`),
  KEY `UserID` (`UserID`),
  KEY `CommenterName` (`CommenterName`),
  KEY `PostID` (`PostID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FetchNotifs`
--

INSERT INTO `FetchNotifs` (`NotifID`, `UserID`, `CommenterName`, `PostID`) VALUES
(3, 15, 'aaliyah', 2),
(6, 47, 'amelia', 45),
(7, 47, 'amelia', 45),
(10, 87, 'james', 30),
(11, 35, 'james', 7),
(12, 53, 'james', 41),
(13, 53, 'james', 41),
(14, 36, 'james', 26),
(15, 36, 'amelia', 26),
(16, 36, 'bellbell', 26),
(17, 36, 'bellbell', 26),
(18, 36, 'benji', 26),
(19, 34, 'benji', 50),
(20, 55, 'benji', 47),
(21, 55, 'benji', 47),
(22, 23, 'benji', 42),
(24, 9, 'evelyn', 13),
(25, 85, 'evelyn', 39),
(26, 87, 'evelyn', 30),
(27, 65, 'evelyn', 17),
(28, 47, 'alpaca', 48),
(29, 47, 'alpaca', 48),
(31, 105, 'alpaca', 32),
(32, 14, 'alpaca', 31),
(33, 14, 'alpaca', 31),
(34, 15, 'kayden', 2),
(35, 26, 'kayden', 24),
(36, 26, 'genesis', 24),
(37, 26, 'carlyn', 24),
(38, 26, 'amelia', 24),
(39, 15, 'jaxon', 44),
(40, 15, 'jaxon', 44),
(41, 23, 'aurora', 42),
(42, 76, 'aurora', 18),
(43, 8, 'aurora', 12),
(44, 20, 'aurora', 8),
(45, 20, 'aurora', 8),
(46, 26, 'aurora', 24),
(47, 49, 'aurora', 10),
(48, 72, 'aurora', 4),
(49, 65, 'hazey', 49),
(50, 48, 'mellie', 9),
(51, 15, 'avalovescats', 2),
(52, 36, 'floofbell', 26),
(53, 103, 'kitty', 55),
(54, 103, 'kitty', 55),
(55, 26, 'bison', 24),
(57, 103, 'amelia', 55),
(58, 103, 'bison', 55),
(60, 26, 'bison', 24),
(61, 26, 'amelia', 24);

-- --------------------------------------------------------

--
-- Table structure for table `FetchPosts`
--

DROP TABLE IF EXISTS `FetchPosts`;
CREATE TABLE IF NOT EXISTS `FetchPosts` (
  `PostID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `ImageURL` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PostTitle` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PostContent` text COLLATE utf8_unicode_ci,
  `NumVotes` int(11) NOT NULL DEFAULT '0',
  `NumComments` int(11) NOT NULL DEFAULT '0',
  `PostType` tinyint(4) NOT NULL,
  `CreateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PostID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FetchPosts`
--

INSERT INTO `FetchPosts` (`PostID`, `UserID`, `ImageURL`, `PostTitle`, `PostContent`, `NumVotes`, `NumComments`, `PostType`, `CreateTime`) VALUES
(1, 24, 'uploads/12312211.png', 'Yay first post!', 'For my first post, I thought I\'ll make a cute post of my doggy! :) ', 83, 3, 1, '2019-03-30 14:15:58'),
(2, 15, NULL, 'Cat keeps scratching furniture', 'Hey guys, I have a new kitten. How do I train it to not scratch on furniture?', 3, 3, 0, '2019-03-30 14:48:08'),
(4, 72, NULL, 'Cool site! Post cute pet photos everyone!', NULL, 10, 1, 1, '2019-03-30 15:02:17'),
(5, 30, 'uploads/21434112.jpg', 'My Prince', NULL, 1, 0, 1, '2019-03-30 15:36:24'),
(6, 44, 'uploads/23142232.jpg', 'Charlie', 'This is my sleeping pupper!', 1, 0, 1, '2019-03-30 15:38:09'),
(7, 35, NULL, 'Help!', 'My dog is scared of loud noises. How to I help him?', 2, 1, 0, '2019-03-30 15:39:38'),
(8, 20, NULL, 'Raw food? ', 'Is raw food good or bad for dogs?', 2, 2, 0, '2019-03-30 16:17:25'),
(9, 48, NULL, 'Dog choosing', 'You can choose good family dogs based on three major factors:\r\n\r\nTemperament – This is the dog’s personality. You should be looking for an agreeable temperament. For instance, a calmer dog has the ability to form strong bonds and be a great companion for your kids.\r\nSize – Size should be looked at in relation to both temperament and energy level. Some larger dogs tend to be docile, while some smaller dogs can be excitable. \r\nEnergy level – This is a matter of preference for your family. Be realistic about the lifestyle you can provide to a dog that needs more exercise than average. If you can’t meet a dog’s needs, his excess energy can lead to behavior problems down the road. ', 90, 1, 0, '2019-03-30 16:17:25'),
(10, 49, 'uploads/32412222.jpg', 'This is Baxter', 'Contrary to how he looks, he loves cuddles', 5, 1, 1, '2019-03-30 16:50:49'),
(11, 7, NULL, NULL, 'Hey guys! I dont have a pet but I love seeing the pics. Please post a bunch! <3', 2, 0, 1, '2019-03-30 16:53:22'),
(12, 8, NULL, 'How do you know if your dog has gotten too fat?', 'I have a little bishon that weighs 5kg. Is this too heavy?', 4, 1, 0, '2019-03-30 16:54:56'),
(13, 9, NULL, 'Hair cut', 'How hard is it to cut your own dogs hair? Any tips?', 2, 1, 0, '2019-03-30 16:54:56'),
(14, 15, NULL, NULL, 'Anybody else have a little kitten? I need advice', 4, 0, 0, '2019-03-30 17:32:15'),
(15, 27, 'uploads/53423433.jpg', 'My big guy', NULL, 12, 0, 1, '2019-03-30 17:32:15'),
(16, 17, 'uploads/23132342.jpg', 'My 2 doggies', NULL, 8, 0, 1, '2019-03-30 17:51:24'),
(17, 65, NULL, 'How do I get my dog to stop barking at the mailman?', NULL, 2, 1, 0, '2019-03-30 17:51:24'),
(18, 76, 'uploads/83748888.jpg', NULL, 'I know guys, we call him Moppy', -2, 1, 1, '2019-03-30 17:54:24'),
(19, 86, 'uploads/97348722.jpg', 'This is Benson', NULL, 2, 0, 1, '2019-03-30 17:55:39'),
(20, 27, 'uploads/12322221.jpg', 'my ol\' missy', NULL, 1, 0, 1, '2019-03-30 18:13:55'),
(22, 90, NULL, 'Golden Retriever', 'Hey guys,\r\nAnywhere I can get a golder retriever puppy in GTA, ontario, canada?', 1, 0, 0, '2019-03-30 18:16:11'),
(23, 57, 'uploads/93884241.jpg', 'Xora', 'Meet my lil guy', 1, 0, 1, '2019-03-30 18:18:21'),
(24, 26, 'uploads/1.jpeg', 'Tubbles the Pebble', 'Hi guys,\r\nI dont have a dog/cat/bird. But I have this pebble and I take good care of him.  \r\nHe really ROCKS', 383, 9, 1, '2019-03-30 18:22:49'),
(25, 33, NULL, 'Any horse lovers out there?', NULL, 0, 0, 0, '2019-03-30 18:27:54'),
(26, 36, NULL, 'Girl Bird Names ', 'Please help me name my new bird! Im thinking: Chipper, Flutters?', 0, 6, 0, '2019-03-30 18:29:27'),
(27, 28, 'uploads/4343.jpeg', 'My green eyed baby girl', NULL, 22, 0, 1, '2019-03-30 18:44:28'),
(28, 51, 'uploads/23422.jpg', 'Me and my silly old dog', 'He loves posing for pictures', 3, 0, 1, '2019-03-30 18:44:28'),
(29, 49, 'uploads/87223.jpeg', 'My lovely new kitten', 'Her name is sandy', 8, 0, 1, '2019-03-30 18:52:07'),
(30, 87, NULL, 'MY DOG ATE CHOCOLATE', 'HELP! WHAT DO I DO???', -2, 2, 0, '2019-03-30 18:52:58'),
(31, 14, 'uploads/2311132.jpeg', 'My old girl turns 13 today', NULL, 14, 2, 1, '2019-03-30 18:53:42'),
(32, 105, 'uploads/7654.jpeg', 'My beautiful girlfriend with her horse', NULL, 86, 1, 1, '2019-03-30 18:55:48'),
(33, 73, 'uploads/88759.jpeg', 'New parrot parent', 'Hi there, anybody have tips and tricks to caring for a parrot? I\'m new to this! Thanks in advanced.', 0, 0, 0, '2019-03-30 18:56:59'),
(34, 97, 'uploads/87545.jpeg', NULL, 'This is peanut. He loves swimming into the corals cuz he\'s weird like that.', 21, 0, 1, '2019-03-30 18:59:49'),
(35, 80, 'uploads/98665.jpeg', 'My Toby Boy', 'He sprained his leg 4 years ago. Look at him go! ', 4, 0, 1, '2019-03-30 19:01:15'),
(36, 2, 'uploads/817.jpeg', 'Teacup Puppy', NULL, 213, 0, 1, '2019-03-30 19:03:11'),
(38, 100, 'uploads/92.jpeg', 'ChubbyBum', 'This bunny passed away 1 year ago. :\'( RIP', 43, 0, 1, '2019-03-30 19:06:04'),
(39, 85, 'uploads/32.jpeg', 'Monday feels', 'My sleepy doggo is loving the sun', 2, 1, 1, '2019-03-30 19:07:10'),
(40, 45, NULL, 'New cat owner', 'Hey, what is the best foods to feed a 8 month old kitten?', 1, 0, 0, '2019-03-30 19:08:01'),
(41, 53, NULL, 'How to care for a parrot (Cages)', 'A cage provides parrots with a retreat that they know is their territory in your home. It also assists in meeting your parrot’s needs, such as controlling lighting; parrots ideally need 12 hours of daylight and 12 hours of darkness.\r\n\r\nThe size of the cage varies by species. All parrots need a cage that allows them to spread their wings freely in the fully accessorized cage. Species with long tails need cages that are tall enough to accommodate the tail length. Did you catch the phrase fully accessorized? You need to furnish your feathered friend’s “bird cave.” Research the best cage material for your parrot’s species.\r\n\r\nThe Merck Veterinary Manual offers the following general guidelines for size: 20 x 20 x 30 inches for budgies, cockatiels, lovebirds, or parrotlets; 36 x 24 x 48 inches for conures, Poicephalus, caiques, miniature macaws; 40 x 30 x 60 inches for African grey parrots, Amazon parrots, and small cockatoos; 48 x 36 x 66 inches for macaws and large cockatoos. Bar spacing ranges from 0.5 inches to 1.5 inches for the smallest to largest species. Keep in mind that these suggested sizes are minimum for a single bird, and a bigger cage is always better! If you choose to keep multiple parrots, be prepared to offer a cage for each. Sharing a cage usually only works for the same species, and even that isn’t a guarantee that birds will get along. Never house birds together that show any aggression toward each other. And be absolutely certain you know the sex of your birds before letting any share a cage.\r\n\r\nKeeping the cage clean is critical to your parrot’s health. Get into a regular routine of daily tasks like changing out paper and cleaning dishes and water bottles and weekly and monthly tasks like toy rotation and deep cleaning.', 5, 2, 0, '2019-03-30 19:09:21'),
(42, 23, 'uploads/87655.jpeg', 'Gibson feels like ET right now', NULL, 7, 2, 1, '2019-03-30 19:12:05'),
(43, 45, NULL, 'Fixing a female dog', 'Why do dog owners spay/neuter their dog? When should it be done?', 2, 0, 0, '2019-03-30 19:14:44'),
(44, 15, 'uploads/821.jpeg', 'Everything I try to do homework', NULL, 2, 2, 1, '2019-03-30 19:15:10'),
(45, 47, 'uploads/817261.jpeg', 'My twin boys', 'Trek and Giant', 2, 2, 1, '2019-03-30 19:15:47'),
(47, 55, 'uploads/1492.jpeg', 'Teddy', 'My dog everytime I come home for the weekend. ', 7, 2, 1, '2019-03-30 19:21:19'),
(48, 47, NULL, 'What are lizard\'s lifespan?', NULL, 1, 2, 0, '2019-03-30 19:22:05'),
(49, 65, 'uploads/8721.jpeg', NULL, 'BUNNY BUNNY BUNNY BUNNY!!!!!', 39, 1, 1, '2019-03-30 19:22:36'),
(50, 34, 'uploads/871.jpeg', 'MONDAY MOTIVATION', 'self control is the greatest power', 7, 1, 1, '2019-03-30 19:24:54'),
(51, 24, 'uploads/2.jpg', 'Throwback 3 years ago', 'That time my pupper really needed a haircut!', 18, 0, 1, '2019-03-30 18:22:00'),
(52, 24, 'uploads/3.jpg', 'Waiting for summer to come', NULL, 34, 2, 1, '2019-03-30 19:30:33'),
(54, 44, 'uploads/65.jpeg', 'I know she looks ugly but shes actually a sweetie.', NULL, -4, 0, 1, '2019-03-30 18:45:39'),
(55, 103, NULL, 'Question: How do I properly toilet train my puppy!???!', 'He\'s a chihuahua', 2, 4, 0, '2019-03-30 20:48:33'),
(61, 24, '', 'test content', 'test', 0, 0, 0, '2019-04-01 17:46:43');

--
-- Triggers `FetchPosts`
--
DROP TRIGGER IF EXISTS `limit_posts`;
DELIMITER $$
CREATE TRIGGER `limit_posts` AFTER INSERT ON `FetchPosts` FOR EACH ROW BEGIN
		SELECT count(*) INTO @numCute
			FROM FetchPosts
			WHERE PostType = 0;
		SELECT count(*) INTO @numDiscuss
			FROM FetchPosts
			WHERE PostType = 1;

		IF @numCute > 100 THEN
			/* Find the oldest post */
			SELECT MIN(CreateTime), PostID INTO @removeID FROM
				(SELECT * FROM FetchPosts WHERE PostType = 0 ORDER BY CreateTime) as T
				GROUP BY PostID;
			/* Remove the post */
			DELETE FROM FetchPosts WHERE PostID = @removeID;
		END IF;

		IF @numDiscuss > 100 THEN
			/* Find the oldest post */
			SELECT MIN(CreateTime), PostID INTO @removeID FROM
				(SELECT * FROM FetchPosts WHERE PostType = 1 ORDER BY CreateTime) as T
				GROUP BY PostID;
			/* Remove the post */
			DELETE FROM FetchPosts WHERE PostID = @removeID;			
		END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `FetchUsers`
--

DROP TABLE IF EXISTS `FetchUsers`;
CREATE TABLE IF NOT EXISTS `FetchUsers` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NumTreats` int(11) NOT NULL DEFAULT '100',
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FetchUsers`
--

INSERT INTO `FetchUsers` (`UserID`, `Username`, `Password`, `Email`, `NumTreats`) VALUES
(2, 'puppylover', '$2y$10$5ocLZmgJ6zbfcy.VLjaskO4UVDG9KvRjSC9AHt0PsAKJ8yg3ModzO', 'puppylover@gmail.com', 125),
(4, 'doggy', '$2y$10$SgyJcyx.G6fwEyu7qlwtF.wmfK9rphzagp061HAK0lJ2eEm0RUVFu', 'doggy@gmail.com', 32),
(5, 'kitty', '$2y$10$X362qZwVLpR60FMe3s3Jie3Epn/V9ncWc9h.0qB8NowHFCq.ASrKy', 'kitty@yahoo.com', 192),
(6, 'horse', '$2y$10$h5J0MXmt8fmuUxQx4QQIfuwZ2oWa0h01a4x.ZXQGYHLOy2gdAUbtm', 'horse@gmail.com', 748),
(7, 'alpaca', '$2y$10$NVtZ7aZJAMlz9oSlNNhnTeyzPNyqYs0O.5b39DJgz3cbCukRWbTli', 'alpaca@hotmail.com', 48),
(8, 'bison', '$2y$10$CU6Bz5s1e7UpXAzKEGfjRuanQBzXPI26nXYBWXFjRHKV4fXkYK5iW', 'bison@gmail.com', 327),
(9, 'blackbear', '$2y$10$OKQXbR7mNOVoBTID7Nj4kuf.C1ob8HCMi5tc6I.NQhUHEzwBpBCki', 'blackbear@yahoo.com', 102),
(10, 'liam', '$2y$10$JQWYncEq5aZRvmUUJ2ZL2eP/DuPPrcCtFL/RBnBOgKfxi7KOP/21a', 'liam@gmail.com', 102),
(11, 'emmaharper', '$2y$10$s7m.vEWgkvVE/zdD1hxftu8mNKn8qC8ONUA9CGtphNl1HGRhoaKn6', 'emmaharper@gmail.com', 3),
(12, 'noah', '$2y$10$R29/psH43VyEieLMcrybWestv7TfWR/GMtIUwGkXu7AsI1cRbo4/6', 'noah@yahoo.com', 293),
(13, 'olliolivia', '$2y$10$kXPOXTY5juZrtDBBUoD91.07SLeUH//dvHK.LNSOlkofjiZ2Eh94O', 'olliolivia@gmail.com', 104),
(14, 'william', '$2y$10$ywIuytNYosUR39cxLGSQ2uTxDyZyRForLdoWzl/DMb3BWOWe07SA.', 'william@hotmail.com', 229),
(15, 'avalovescats', '$2y$10$GU1Jk5uj2tUAAm2ds9s2mOH/cZSS5.6mblmJz3NXOFPBGJH.vq66a', 'ava@gmail.com', 305),
(16, 'james', '$2y$10$EPW9X3HoaA6F3OyzruR5ReCLicTASkKkpu9nm.Qv0J3BBI1IiAgkK', 'james@gmail.com', 928),
(17, 'bellbell', '$2y$10$5gHevxX2Wn5gc4J6ufxeT.cQ8aqHjjDMR079/AwzMcJvWQiqies2i', 'isabella@bell.com', 95),
(18, 'logan', '$2y$10$PvZsUUHw4g0HzTbfqqsH.OS4ERjo35r.lnDTrsIRNZzwvxt.YkN2C', 'logan@gmail.com', 210),
(19, 'sophia', '$2y$10$oN389Sss8XXyMGnjWesalOvSJte/5SLPm02cSvkRPK01rOCGWHjqe', 'sophia@yahoo.com', 100),
(20, 'benji', '$2y$10$E8qWghSU11pjBpOg5fr6X.OnbTz6bLpxoXA0.4GuOjrKZvtXndpVy', 'benjamin@gmail.com', 430),
(21, 'masonator', '$2y$10$d228PopbhDcHBxVY877JuOPEVRFyU6OTRYyiS.RMneW8Sot5q1jnu', 'mason@hotmail.com', 828),
(23, 'elijah', '$2y$10$P6z4jM25MKE7840EnC21ceiZoxFnSausbitx4MEBKf3LFtponwH1u', 'elijah@gmail.com', 150),
(24, 'amelia', '$2y$10$ecp8Jd1Se9Tokk9443/uCu890ON2FFBeXRdH.JOufZG.09bQV0h1G', 'amelia@gmail.com', 1082),
(25, 'evelyn', '$2y$10$Vz/6Mg8Bt6cXRO52dsaye.VxdWevxBitiVOxknQA.ZKirLqjt05qS', 'evelyn@yahoo.com', 213),
(26, 'jacob', '$2y$10$604851hyvC6aUpy/StvPcueZyp0ucjVFTM4d7a6NqULwGjLpLXI7G', 'jacob@hotmail.com', 983),
(27, 'abigail', '$2y$10$zamhqQIhqd9R6IYfliFh7.EqJBjc8DK/OpisPkPzBAM89xH3r4bLy', 'abigail@bell.ca', 14),
(28, 'lucas', '$2y$10$Xxxp45UxGQqNOKXKDFdK/.Ir7M6Hy2WNL0IxZS.EKzOpFh4PFrwjC', 'lucas@gmail.com', 4),
(29, 'happyharp', '$2y$10$qhsrSaUe6QpiUcOQutxT8.iOTKlnYmesRJSDNYdTe5T8ZNntqFD6e', 'harper@gmail.com', 192),
(30, 'bubbleem', '$2y$10$FML16APTgGcAHuSOhCScD.a1ZoKVH6DyuF4UDsxLypGu4xvasnjme', 'emily@gmail.com', 104),
(31, 'xander', '$2y$10$javuwZcoqfLwtX6ZdD3oieh.G7L9eSHKd0BgV6jxx.HD8B5wSeZTy', 'alexander@gmail.com', 128),
(32, 'lizzy', '$2y$10$kdtD2Xrwc1hBZKjpoidQC.kZZ7uEVW81rxJF8n13E/c2I4R4pKIpC', 'elizabeth@yahoo.com', 198),
(33, 'ethan', '$2y$10$E29DXqJnj2LlAjv.uQZLKuyKb52Igw8EUC35iRuaiSs8aPwQimChi', 'ethan@gmail.com', 192),
(34, 'aves', '$2y$10$QkWVs6obeZkRIIPDazh.e.Y5HLqgSKofVLe21vucebaLYnTTb4koG', 'avery@cogeco.ca', 102),
(35, 'dannydandan', '$2y$10$dqTijvdkL.iWNMBCqWWaquiAqwwRRfKjicHa5uf7ETRqxKmh.Bfyu', 'daniel@gmail.com', 101),
(36, 'matth3w', '$2y$10$L0F7I8QkzjlPI4BTEiKSQOnIRY62Nsrx.S7ES05CqcszMkoBd1.0a', 'matthew@gmail.com', 738),
(37, 'aiden', '$2y$10$esmG1NVM8BPJXrZWXnXz6OoaJhKVOHpTGAdao2OgGyjjvbt7ZBnUG', 'aiden@bell.ca', 472),
(38, 'madison', '$2y$10$LltgVoXxcSpuN4aQd2Pd/Oi4vUPr96LT1huTsBHlfRBzYRfoME4Y2', 'madison@yahoo.com', 372),
(39, 'henry', '$2y$10$9/CQMyZm9olP/tccJw/6ieMGi.VrLYAFwY8kmPoBWnaSbJPXZtkRa', 'henry@gmail.com', 222),
(41, 'scarry', '$2y$10$agc6c/XgG3qq5VcLrN70su60qfvvOrO107E8imF9XMvF9E/Mf2Obe', 'scarlett@gmail.com', 133),
(42, 'joejoe', '$2y$10$1IR/se3NrtvT7EOG3bPew.SyomQji5WaynBcDq2yBVIyRKcwW1zNO', 'joseph@gmail.com', 100),
(43, 'jackson', '$2y$10$ub/F4z3dsxwk40KEbs2iVOl4YZ0ejAd.vA4/wHPoZJPrUPoQHQmn.', 'jackson@gmail.com', 283),
(44, 'aria', '$2y$10$OpfZF.c8pxFOLz9jSmFFE.avOM9N8.xlkHRVlqcio5NbNY3GOUfXy', 'aria@gmail.com', 103),
(45, 'sammy', '$2y$10$pE8AzxbZopdfqEZao0WpHeoz1rIftuVGSnwoCPfAT/1YgWQ1N8KRi', 'samuel@gmail.com', 324),
(46, 'gracey', '$2y$10$JFZ.0V2Zn6F4hyWDEnZF..PddfY6HD2SdjYKNBXBfHD7L09zFGVSu', 'grace@yahoo.com', 732),
(47, 'sebby', '$2y$10$Ko1C.3/lksUJE4b1C/6tSexKNOcyIcgoGetzBa8Prsbkjyo04i/YO', 'sebastian@bell.ca', 375),
(48, 'chloe', '$2y$10$xsC59369x6SR5DB0t70m8.A1Db.o0LzHSN/HKDYkc1OTVLDmR88MW', 'chloe@gmail.com', 195),
(49, 'carter', '$2y$10$K.Iy9.UdgiJCJAKCLfrsFu6IC7Hs7n4i31DnaN9AQB/L4CaJEzmo2', 'carter@gmail.com', 102),
(50, 'pennypoo', '$2y$10$v5HsAyLByEJJE/M0oXPTv.zpS2L8sWnZFR3NPa5xTsrLuzwaV1rd2', 'penelope@bell.com', 139),
(51, 'wyatt', '$2y$10$TtFDLTCFBymsoVehWy33dOSdeYl1bnhBrtsONSHtYzwqyLLHardRW', 'wyatt@hotmail.com', 444),
(52, 'jayden', '$2y$10$cue45N3PV4uT4jhXdidppOe9lJ9Py9weUfx7TYbTCp/GZGzDF4TcO', 'jayden@bell.ca', 622),
(53, 'layla', '$2y$10$b7Um84627RFmBTSkVm7mb.myPgXjrJMnm2lwDjtMOGlIiqVfkPHny', 'layla@cogeco.com', 25),
(54, 'lillian', '$2y$10$VNLqgi9FW5j5hRi/YDbCZe97ulBXKZDWModH9uMGu/m4GtKRKGKy2', 'lillian@yahoo.com', 134),
(55, 'owen', '$2y$10$zyJMPH6Hr7n/qNOGEjUUPO7fBeM8OFzZfnansa9.dp6iM7KlK5hna', 'owen@yahoo.com', 125),
(56, 'nora', '$2y$10$lZccKl7veH6Xhoo6vTi5cOVyszONKUr7cwKsR3ldjG8qt5dAFFEGe', 'nora@gmail.com', 432),
(57, 'dilly', '$2y$10$StFhRyaAnnB/ldHeE2YumO2FTAUdOl.eufovO4JoTy78uXzEvJhZS', 'dylan@bell.ca', 555),
(58, 'zoey123', '$2y$10$iLOWg2kcocNKg3UdCOSY.e9jTwfk1OSyFr7ur9zW.6VQMzxplVHxy', 'zoey@yahoo.com', 652),
(59, 'luke', '$2y$10$gaCPRwaJt3m1Dmqsg51NCOKPbN8MqM9AsMHwsQ/Wt01ReGQlLKaSO', 'luke@gmail.com', 243),
(60, 'milah', '$2y$10$zXQIyBGt8aqtQ37eI1wfoezehTLX1kBcM0qT4gzU7wws0M5WhNmiu', 'milah@hotmail.com', 87),
(61, 'anthony', '$2y$10$Q2IqqzAhHy3OlC7QdoRYJ.ehWVCfVC2ltE8ZmBVBx9lmSr/Fx8N8O', 'anthony@gmail.com', 54),
(62, 'hannahbanana', '$2y$10$1Q1F58Hp7/2uhstkT34LMOUgpWiKyZJtkg7ZGyubx/Do8RtG1F7u2', 'hannah@gmail.com', 763),
(63, 'isaac', '$2y$10$S3EPlPX8ZxsuwGhr1dqAHORmlYA/Jml35AbbR0gUQySg2meueX4pe', 'isaac@gmail.com', 104),
(64, 'grayson', '$2y$10$WwnAhhGXYZDekLc1kew9pO6i2ULobO.1joBU0bPcQRnKNN1Pp7xo.', 'grayson@gmail.com', 231),
(65, 'addie', '$2y$10$zI0PFTqOcEi4Aj4pTJ6MT.3OQkeGqQH.Rms4a4QbXd4TpmvqzHpai', 'addison@yahoo.com', 428),
(66, 'elliebear', '$2y$10$qC0MKqYeEmDUa.N2vAwqFOqu9L1qjQ6y4OSezWz5z9qjKPLL4.A4.', 'ellie@gmail.com', 242),
(67, 'julian', '$2y$10$3hzNqM4aG8G31sNNqRhJF.J/5cWUc1oyNMrwwcrEYP5ftznccjuoa', 'julian@hotmail.com', 123),
(68, 'natalie', '$2y$10$F3sn9xhI2ala6ceXO1F9lOu1shHmuN33RDAHjnuhjw0YYK2ziQZTq', 'natalie@gmail.com', 233),
(69, 'levi', '$2y$10$NSRpagpQY1vBF/WJNz3MSOQxy9bQ8Fm6LCls4IbvFyEgScH1UrB4u', 'levi@cocego.com', 83),
(71, 'luna', '$2y$10$ic.U0FdJXb/qvZTZRRGELOhG8RIC7VgHTJHL8aZA1hfgKzsTxaH4q', 'luna@yahoo.com', 100),
(72, 'christop', '$2y$10$Gi9aBwSJ5TqmOpODXx.ObOvu8N.R2aKt7.HOzqfBqcHN9.U277kzC', 'christopher@gmail.com', 218),
(73, 'savvy', '$2y$10$pJwoE4hs.1H..gUaXjxyQOx5GHTf082JiI0SNMti1b0kTwsvh6nma', 'savvy@gmail.com', 32),
(74, 'joshua', '$2y$10$Q8PmJyM2VXifQ2vdABCLSO2o26EX4lLjW1XV2WbUCTbZ0iNNf00Qq', 'joshua@hotmail.com', 811),
(76, 'brookie', '$2y$10$UH5ptB9C4f/KJD9vjp7MSeUD7Pf0xW4scomzYUqvuQKn8.Oj7ksTW', 'brooklyn@gmail.com', 600),
(77, 'leahhh', '$2y$10$vUf70zNa9cHd6M7oaEv55.AAN4oKzM0hRuwZ9QdrTjjetAolfdkBG', 'leah@gmail.com', 342),
(78, 'lincoln', '$2y$10$Ex1rAshhXw14.Pd0.m.m9O/uVipoL2mFc7UCk8fgsUPR.kRGemoOa', 'lincoln@gmail.com', 28),
(79, 'mateo', '$2y$10$3emFguBAOTUV5mG4QceT.eyQdaGw0nXutfDdbM7TZxvNOJBjJriFW', 'mateo@yahoo.com', 321),
(80, 'stella', '$2y$10$R3t0hhySiCrZnPWIV0L2YOsOpYx9JIHJnv9/s8rWe5TFRn/7BYqG.', 'stella@bell.ca', 442),
(81, 'hazey', '$2y$10$aY0W5dVUy3dogUn6fFF4Nud1DmeN3.M3KX.sw1oiWb7ef6hq4t0dW', 'hazel@gmail.com', 723),
(82, 'jaxon', '$2y$10$2a6IHZ0Cu4t02s5SeciMKunoQ8ulsYz/V/wjnQAGctiWvNvN388IS', 'jaxon@gmail.com', 271),
(83, 'elliebell', '$2y$10$KBNntzIc9ip9xBiDtiHO3uHOsbKG3qnft.JfYYrywd2Ep9ut/4ZW6', 'ellie@gmail.com', 422),
(84, 'nathan', '$2y$10$z7B2YlBxd6H1SOZObQCZbuxtYsHDHGpmoVVkzRx.a5V4H6sq8PGta', 'nathan@gmail.com', 262),
(85, 'paisley', '$2y$10$wo8SmMoTgUs9Jhi9yQ8k7.ysHNvRt3hQz7sb82YmCvrKbiFs3GMcW', 'paisley@yahoo.com', 523),
(86, 'auddi', '$2y$10$1hE15jAt03HkbVD/VvMa1ujSVqj7fjNcCrAipKOarV8vOkvkAF.a2', 'audrey@gmail.com', 211),
(87, 'skyl', '$2y$10$ArnVaHrUQa/JsI6dU17oTuf3GIy7kMwpivtZm0izVvtsmE58xrGje', 'skylar@hotmail.com', 101),
(88, 'tommy', '$2y$10$mR0chrUYxcITwlWwyFpLgOAS7tYsu8xdqDrzr3ACRDF3uuOLrCrSm', 'tommy@gmail.com', 100),
(89, 'floofbell', '$2y$10$1WgBjOqEwAT5x/yKwo63ZeRqs/W5X6j0Q/zQt.q5/BOckhWaKiWpa', 'bella@gmail.com', 54),
(90, 'aurora', '$2y$10$.4m3b0UuV.0FR0h81F6Uz.HK78yiGe/g0wBVsfC3rynGh/I4e64Ve', 'aurora@gmail.com', 859),
(91, 'lucy', '$2y$10$i.oQvjK1tVKo8m/uISACNOxp0dZYIaQboy9XVyWqUyzjUuCYOsHCW', 'lucy@hotmail.com', 234),
(92, 'hunter', '$2y$10$wsZG3GpwdPvIShEKof.iv.dMC4aFiLiXrZtzNTVI89ZoZvxCLbm5y', 'hunter@gmail.com', 101),
(93, 'jonny', '$2y$10$f6hmGYnJwlBNdfP4B.v7BeHE1RNcPPMZn89BuZS2MQktnqsG22qWy', 'jonathan@hotmail.com', 92),
(94, 'carlyn', '$2y$10$dZFXC8Z4.PmFq.Dp54yLQu4KsKTKH/FClizGSCJuwZoE3uZcVWMp2', 'carlyn@gmail.com', 429),
(95, 'genesis', '$2y$10$UuU7f869lE8ECNRpvCr2deWlry2GqhCFwZq7h7yxkWuQ4UemZsmAm', 'genesis@gmail.com', 668),
(96, 'landon', '$2y$10$Lalc.j3I3S3n.f5oozQehOPJF7jAG7cotoxC33sGWdSqvF68U40Fu', 'landon@gmail.com', 475),
(97, 'aaliyah', '$2y$10$d7hep2l9HrupXB.DDvy0EevywlwHnYIYqPQ7T8DMtvCcM27PnESPC', 'aaliyah@gmail.com', 101),
(98, 'jameson', '$2y$10$OQf4Nd4K2I9MF09rXJX7hOKpeW4sJbp2RfJzoZPdnrOr715tJMV5y', 'jameson@hotmail.com', 823),
(99, 'maddy', '$2y$10$TIblsjVm44A1s66HCGfMiOjohQF6kzBXkAUFD71.angjOElKmTB.W', 'madeline@gmail.com', 41),
(100, 'maccy', '$2y$10$ngWEnq/U3hsCDQYASJkyPuwIq6MdvjdSCLP8NIhVHqthtZnFJI8eq', 'maccy@gmail.com', 4),
(101, 'kayden', '$2y$10$IF29FfvKwioU8SM5bhYimO99IWGSVvc5aALBVjyS0G7FgW1rgtnWa', 'kayden@gmail.com', 85),
(102, 'reagan', '$2y$10$Am2LqDEa4iSsqNYH8QKc1uZbHrX8TzX0We0JqdoRfFGeGarGb.ml2', 'reagan@gmail.com', 68),
(103, 'chase', '$2y$10$7AMPFq/660NrUJOBd0tJ5OOnC6UscpfSUDUAD5BVsc6izScNKnhr.', 'chase@bell.ca', 750),
(104, 'tina', '$2y$10$PA8tpdiiPqwZ8LmepuYZpuiTHKxOJpg4eTXv.T0c5Gi4Yf4noRrAS', 'valentina@gmail.com', 544),
(105, 'parker', '$2y$10$QY549ljL1TA.tWN0O/uXze47gHWf5T1OAtZY2KsfaUV0vCLxPeVje', 'parker@gmail.com', 586),
(106, 'mellie', '$2y$10$ts3560fZZgVcU1NmdsZhVOuCOKxYSoH6ruzXGBlBGwPkEG15EWZNW', 'melanie@gmail.com', 100),
(108, 'user', '$2y$10$T38EzjWX7SKx3fkP8EGcbed3EOLP9gfnYJAEY0szpJA2b22Ypw9my', 'user@gmail.com', 100);

-- --------------------------------------------------------

--
-- Table structure for table `FetchVotes`
--

DROP TABLE IF EXISTS `FetchVotes`;
CREATE TABLE IF NOT EXISTS `FetchVotes` (
  `UserID` int(11) NOT NULL,
  `PostID` int(11) NOT NULL,
  `Vote` tinyint(4) NOT NULL,
  PRIMARY KEY (`UserID`,`PostID`),
  KEY `PostID` (`PostID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FetchVotes`
--

INSERT INTO `FetchVotes` (`UserID`, `PostID`, `Vote`) VALUES
(2, 52, 1),
(4, 4, 1),
(4, 5, 1),
(4, 10, 1),
(4, 44, 1),
(4, 48, 1),
(4, 49, 1),
(4, 50, 1),
(4, 52, 1),
(5, 14, 1),
(5, 34, 1),
(5, 38, 1),
(5, 44, 1),
(5, 49, 1),
(5, 50, 1),
(5, 55, 1),
(7, 1, 1),
(7, 7, 1),
(7, 8, 1),
(7, 17, 1),
(7, 36, 1),
(7, 40, 1),
(7, 43, 1),
(7, 47, 1),
(7, 48, 1),
(7, 50, 1),
(14, 7, 1),
(14, 9, 1),
(14, 13, 1),
(14, 22, 1),
(14, 23, 1),
(14, 30, 1),
(14, 35, 1),
(14, 36, 1),
(14, 43, 1),
(14, 45, 1),
(14, 49, 1),
(14, 53, 1),
(24, 1, 1),
(24, 6, 1),
(24, 13, 1),
(24, 24, 0),
(24, 48, -1),
(24, 49, 0),
(24, 50, 1),
(24, 55, 1),
(24, 56, -1),
(24, 58, -1),
(24, 59, -1),
(24, 60, -1),
(26, 1, 1),
(89, 2, 1),
(89, 4, -1),
(89, 9, 1),
(89, 20, 1),
(89, 26, 0),
(89, 27, 1),
(89, 33, 1),
(89, 34, 1),
(89, 41, 1),
(89, 45, 1),
(89, 46, -1),
(89, 47, 1),
(89, 53, 1),
(106, 2, 1),
(106, 12, 1),
(106, 17, 1),
(106, 33, -1),
(106, 40, 0),
(106, 41, 1),
(106, 53, 1),
(107, 24, 1);

--
-- Triggers `FetchVotes`
--
DROP TRIGGER IF EXISTS `vote_insert`;
DELIMITER $$
CREATE TRIGGER `vote_insert` AFTER INSERT ON `FetchVotes` FOR EACH ROW BEGIN
		/* Add the vote value into the total votes */
		UPDATE FetchPosts
			SET NumVotes = (NumVotes + NEW.Vote)
			WHERE PostID = NEW.PostID;

		/* Update user treats */
		SELECT NumVotes, UserID INTO @karma, @treatUserID
			FROM FetchPosts
			WHERE PostID = NEW.PostID;

		UPDATE FetchUsers
			SET NumTreats = (NumTreats + NEW.Vote)
			WHERE UserID = @treatUserID;
		
		SELECT NumTreats INTO @numtreats
			FROM FetchUsers
			WHERE UserID = @treatUserID;
		
		/* If post has < MIN votes, remove it from FetchPosts */
		IF @karma <= -5 THEN
			DELETE FROM FetchPosts WHERE PostID = NEW.PostID;
		END IF;
		
		IF @numtreats <= 0 THEN
			DELETE FROM FetchUsers WHERE UserID = @treatUserID;
		END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `vote_update`;
DELIMITER $$
CREATE TRIGGER `vote_update` BEFORE UPDATE ON `FetchVotes` FOR EACH ROW BEGIN
                /* Set the new vote to the difference */
                IF NEW.Vote = OLD.Vote THEN
                        SET NEW.Vote = 0;
                END IF;

                /* Add the vote value into the total votes */
                UPDATE FetchPosts
                        SET NumVotes = (NumVotes + NEW.Vote - OLD.Vote)
                        WHERE PostID = NEW.PostID;

                /* Update user treats */
                SELECT NumVotes, UserID INTO @karma, @treatUserID
                        FROM FetchPosts
                        WHERE PostID = NEW.PostID;

                UPDATE FetchUsers
                        SET NumTreats = (NumTreats + NEW.Vote - OLD.Vote)
                        WHERE UserID = @treatUserID;
                SELECT NumTreats INTO @ntreats
                	FROM FetchUsers
                    WHERE UserID = @treatUserID;

                /* If post has < MIN votes, remove it from FetchPosts */
                IF @karma <= -5 THEN
                        DELETE FROM FetchPosts WHERE PostID = NEW.PostID;
                END IF;
                
                IF @ntreats <= 0 THEN
                	DELETE FROM FetchUsers WHERE UserID = @treatUserID;
                END IF;
END
$$
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `FetchComments`
--
ALTER TABLE `FetchComments`
  ADD CONSTRAINT `fetchcomments_ibfk_1` FOREIGN KEY (`PostID`) REFERENCES `FetchPosts` (`PostID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fetchcomments_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `FetchUsers` (`UserID`) ON DELETE CASCADE;

--
-- Constraints for table `FetchCommentVotes`
--
ALTER TABLE `FetchCommentVotes`
  ADD CONSTRAINT `fetchcommentvotes_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `FetchUsers` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fetchcommentvotes_ibfk_2` FOREIGN KEY (`CommentID`) REFERENCES `FetchComments` (`CommentID`) ON DELETE CASCADE;

--
-- Constraints for table `FetchNotifs`
--
ALTER TABLE `FetchNotifs`
  ADD CONSTRAINT `fetchnotifs_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `FetchUsers` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fetchnotifs_ibfk_2` FOREIGN KEY (`CommenterName`) REFERENCES `FetchUsers` (`Username`) ON DELETE CASCADE,
  ADD CONSTRAINT `fetchnotifs_ibfk_3` FOREIGN KEY (`PostID`) REFERENCES `FetchPosts` (`PostID`) ON DELETE CASCADE;

--
-- Constraints for table `FetchPosts`
--
ALTER TABLE `FetchPosts`
  ADD CONSTRAINT `fetchposts_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `FetchUsers` (`UserID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
