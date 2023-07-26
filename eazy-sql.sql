-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.25-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ezfw
CREATE DATABASE IF NOT EXISTS `ezfw` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ezfw`;

-- Dumping structure for table ezfw.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.apartments: ~0 rows (approximately)
INSERT IGNORE INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(1, 'apartment33356', 'apartment3', 'Integrity Way 3356', 'CWP72955');

-- Dumping structure for table ezfw.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ezfw.bank_accounts: ~0 rows (approximately)

-- Dumping structure for table ezfw.bank_accounts_new
CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  `auth` longtext DEFAULT '[]',
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.bank_accounts_new: ~11 rows (approximately)
INSERT IGNORE INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES
	('ambulance', 0, '[]', '[]', 0, NULL),
	('ballas', 0, '[]', '[]', 0, NULL),
	('cardealer', 0, '[]', '[]', 0, NULL),
	('cartel', 0, '[]', '[]', 0, NULL),
	('families', 0, '[]', '[]', 0, NULL),
	('lostmc', 0, '[]', '[]', 0, NULL),
	('mechanic', 0, '[]', '[]', 0, NULL),
	('police', 0, '[]', '[]', 0, NULL),
	('realestate', 0, '[]', '[]', 0, NULL),
	('triads', 0, '[]', '[]', 0, NULL),
	('vagos', 0, '[]', '[]', 0, NULL);

-- Dumping structure for table ezfw.bank_cards
CREATE TABLE IF NOT EXISTS `bank_cards` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ezfw.bank_cards: ~0 rows (approximately)

-- Dumping structure for table ezfw.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ezfw.bank_statements: ~0 rows (approximately)

-- Dumping structure for table ezfw.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.bans: ~0 rows (approximately)

-- Dumping structure for table ezfw.business_data
CREATE TABLE IF NOT EXISTS `business_data` (
  `id` varchar(50) NOT NULL,
  `dui` longtext DEFAULT NULL,
  `combos` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.business_data: ~0 rows (approximately)

-- Dumping structure for table ezfw.business_items
CREATE TABLE IF NOT EXISTS `business_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `label` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `recipe` longtext DEFAULT NULL,
  `menu` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `station` varchar(50) DEFAULT NULL,
  `active` int(11) DEFAULT 0,
  `emote` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.business_items: ~0 rows (approximately)

-- Dumping structure for table ezfw.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.crypto: ~0 rows (approximately)
INSERT IGNORE INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 988, '[{"PreviousWorth":996,"NewWorth":990},{"PreviousWorth":996,"NewWorth":990},{"PreviousWorth":996,"NewWorth":990},{"PreviousWorth":990,"NewWorth":988}]');

-- Dumping structure for table ezfw.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.crypto_transactions: ~0 rows (approximately)

-- Dumping structure for table ezfw.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.dealers: ~0 rows (approximately)

-- Dumping structure for table ezfw.donator
CREATE TABLE IF NOT EXISTS `donator` (
  `license` varchar(255) NOT NULL,
  `coins` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `license` (`license`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.donator: ~0 rows (approximately)

-- Dumping structure for table ezfw.donator_pending
CREATE TABLE IF NOT EXISTS `donator_pending` (
  `transactionId` varchar(50) NOT NULL,
  `package` longtext NOT NULL,
  `redeemed` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`transactionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.donator_pending: ~0 rows (approximately)

-- Dumping structure for table ezfw.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.gloveboxitems: ~0 rows (approximately)
INSERT IGNORE INTO `gloveboxitems` (`id`, `plate`, `items`) VALUES
	(1, '6ZH099JU', '[]');

-- Dumping structure for table ezfw.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.houselocations: ~0 rows (approximately)

-- Dumping structure for table ezfw.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.house_plants: ~0 rows (approximately)

-- Dumping structure for table ezfw.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.lapraces: ~0 rows (approximately)

-- Dumping structure for table ezfw.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.management_funds: ~12 rows (approximately)
INSERT IGNORE INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 0, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 0, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang');

-- Dumping structure for table ezfw.mdt_bolos
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.mdt_bolos: ~0 rows (approximately)

-- Dumping structure for table ezfw.mdt_bulletin
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.mdt_bulletin: ~0 rows (approximately)

-- Dumping structure for table ezfw.mdt_clocking
CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.mdt_clocking: ~0 rows (approximately)

-- Dumping structure for table ezfw.mdt_convictions
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.mdt_convictions: ~0 rows (approximately)

-- Dumping structure for table ezfw.mdt_data
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.mdt_data: ~0 rows (approximately)

-- Dumping structure for table ezfw.mdt_impound
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.mdt_impound: ~0 rows (approximately)

-- Dumping structure for table ezfw.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.mdt_incidents: ~0 rows (approximately)

-- Dumping structure for table ezfw.mdt_logs
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.mdt_logs: ~0 rows (approximately)

-- Dumping structure for table ezfw.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.mdt_reports: ~0 rows (approximately)

-- Dumping structure for table ezfw.mdt_vehicleinfo
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.mdt_vehicleinfo: ~0 rows (approximately)

-- Dumping structure for table ezfw.mdt_weaponinfo
CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.mdt_weaponinfo: ~0 rows (approximately)

-- Dumping structure for table ezfw.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.occasion_vehicles: ~0 rows (approximately)

-- Dumping structure for table ezfw.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.phone_gallery: ~0 rows (approximately)

-- Dumping structure for table ezfw.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.phone_invoices: ~0 rows (approximately)

-- Dumping structure for table ezfw.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.phone_messages: ~0 rows (approximately)

-- Dumping structure for table ezfw.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.phone_tweets: ~0 rows (approximately)

-- Dumping structure for table ezfw.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.players: ~1 rows (approximately)
INSERT IGNORE INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
	(1, 'CWP72955', 1, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'Jay', '{"cash":9944290,"crypto":0,"payslip":600,"bank":999999998684300}', '{"phone":"6665010077","lastname":"Beef","gender":0,"firstname":"Angus","nationality":"Australia","birthdate":"1993-11-25","cid":1,"backstory":"placeholder backstory","account":"US05QBCore5392494060"}', '{"payment":30,"grade":{"level":3,"name":"Owner"},"name":"realtor","isboss":false,"type":"none","label":"Realtor","onduty":true}', '{"isboss":false,"grade":{"level":0,"name":"none"},"label":"No Gang Affiliaton","name":"none"}', '{"x":-512.940673828125,"y":-1187.235107421875,"z":20.046142578125}', '{"stress":14,"ishandcuffed":false,"callsign":"NO CALLSIGN","inlaststand":false,"licences":{"driver":true,"weapon":false,"business":false},"tracker":false,"dealerrep":0,"attachmentcraftingrep":0,"commandbinds":[],"jailitems":[],"fitbit":[],"injail":0,"phone":[],"jobrep":{"trucker":0,"taxi":0,"tow":0,"hotdog":0},"fingerprint":"XM774I16RRz1009","thirst":58.20000000000003,"isdead":false,"walletid":"QB-43772046","criminalrecord":{"hasRecord":false},"status":[],"inside":{"apartment":[]},"bloodtype":"A-","phonedata":{"SerialNumber":54687142,"InstalledApps":[]},"hunger":53.79999999999997,"craftingrep":0,"armor":0}', '[{"amount":1,"slot":1,"name":"weapon_glock18c","type":"weapon","info":{"ammo":214,"serie":"23BbS2pJ702PsBG","quality":97.59999999999991}},{"amount":1,"slot":5,"name":"weapon_fnx45","type":"weapon","info":{"ammo":221,"serie":"33mJc3kF402OXuT","quality":95.1999999999998}},{"amount":1,"slot":6,"name":"blueprint_document","type":"item","info":[]},{"amount":1,"slot":7,"name":"phone","type":"item","info":[]},{"amount":1,"slot":8,"name":"weapon_glock17","type":"weapon","info":{"ammo":0,"serie":"99NHN8wl509xBVo","quality":100}},{"amount":1,"slot":9,"name":"weapon_huntingrifle","type":"weapon","info":{"serie":"22JhB5PR958hXAV","quality":100}},{"amount":3,"slot":10,"name":"markedbills","type":"item","info":{"worth":404}},{"amount":1,"slot":11,"name":"weapon_glock22","type":"weapon","info":{"ammo":0,"serie":"76cJj6aa217sJkZ","quality":100}},{"amount":1,"slot":12,"name":"advancedlockpick","type":"item","info":[]},{"amount":1,"slot":13,"name":"weedplant_packedweed","type":"item","info":[]},{"amount":1,"slot":14,"name":"megaphone","type":"item","info":[]},{"amount":1,"slot":15,"name":"weapon_carbinerifle","type":"weapon","info":{"ammo":0,"serie":"10eMt6Tr873JjmI","quality":100}}]', '2023-07-25 12:36:41');

-- Dumping structure for table ezfw.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.playerskins: ~1 rows (approximately)
INSERT IGNORE INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(5, 'CWP72955', '-970362752', '{"cheek_2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"moles":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"pants":{"defaultItem":0,"texture":2,"item":4,"defaultTexture":0},"nose_0":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"bag":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"eyebrows":{"defaultItem":-1,"texture":1,"item":30,"defaultTexture":1},"lipstick":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"chimp_bone_lowering":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"eyebrown_forward":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"cheek_3":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"chimp_hole":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"mask":{"defaultItem":0,"texture":1,"item":0,"defaultTexture":0},"eye_color":{"defaultItem":-1,"texture":0,"item":2,"defaultTexture":0},"t-shirt":{"defaultItem":1,"texture":0,"item":0,"defaultTexture":0},"eyebrown_high":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"cheek_1":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_1":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"hat":{"defaultItem":-1,"texture":0,"item":0,"defaultTexture":0},"accessory":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"shoes":{"defaultItem":1,"texture":0,"item":1,"defaultTexture":0},"vest":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"watch":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"ageing":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"hair":{"defaultItem":0,"texture":0,"item":1,"defaultTexture":0},"face":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"facemix":{"defaultSkinMix":0.0,"shapeMix":0.5,"defaultShapeMix":0.0,"skinMix":0},"glass":{"defaultItem":0,"texture":0,"item":1,"defaultTexture":0},"lips_thickness":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_3":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_4":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"torso2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"bracelet":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"jaw_bone_back_lenght":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"jaw_bone_width":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"face2":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"decals":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"makeup":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"chimp_bone_width":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"nose_5":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"eye_opening":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"arms":{"defaultItem":0,"texture":0,"item":1,"defaultTexture":0},"chimp_bone_lenght":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0},"ear":{"defaultItem":-1,"texture":0,"item":-1,"defaultTexture":0},"blush":{"defaultItem":-1,"texture":1,"item":-1,"defaultTexture":1},"beard":{"defaultItem":-1,"texture":1,"item":0,"defaultTexture":1},"neck_thikness":{"defaultItem":0,"texture":0,"item":0,"defaultTexture":0}}', 1);

-- Dumping structure for table ezfw.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.player_contacts: ~0 rows (approximately)

-- Dumping structure for table ezfw.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.player_houses: ~0 rows (approximately)

-- Dumping structure for table ezfw.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.player_mails: ~3 rows (approximately)
INSERT IGNORE INTO `player_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
	(1, 'CWP72955', 'Unknown Email', 'Unknown', 'Alright, write it down. The plate is: 5ZK309ZE', 0, 293476, '2023-07-24 12:54:47', NULL),
	(2, 'CWP72955', 'Crafting Company', 'Materials list', 'Dear Mr. Beef, <br /><br />List of materials you need to craft (Repair kit): <br /><br /> * Success rate: 100, <br /> * Restricted: No <br /><br /># Materials list: <br />- Metal Scrap 20x <br />- Steel 25x<br /><br />We are happy to have you!', 0, 472547, '2023-07-25 02:16:58', ''),
	(3, 'CWP72955', 'Crafting Company', 'Materials list', 'Dear Mr. Beef, <br /><br />List of materials you need to craft (Lockpick): <br /><br /> * Success rate: 100, <br /> * Restricted: No <br /> * Level: 0 <br /><br /># Materials list: <br />- Wrench 1x<br /><br />We are happy to have you!', 0, 618859, '2023-07-25 02:17:42', '[]');

-- Dumping structure for table ezfw.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.player_outfits: ~0 rows (approximately)

-- Dumping structure for table ezfw.player_transactions
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.player_transactions: ~0 rows (approximately)

-- Dumping structure for table ezfw.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.player_vehicles: ~2 rows (approximately)
INSERT IGNORE INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`) VALUES
	(1, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'CWP72955', 'ardent', '159274291', '{"modSpeakers":-1,"modTrimB":-1,"tyreSmokeColor":[255,255,255],"tankHealth":1000.0592475178704,"modArchCover":-1,"plateIndex":0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modGrille":-1,"extras":[],"modStruts":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modHorns":-1,"dirtLevel":6.35462587779425,"fuelLevel":100.08535757525947,"modAirFilter":-1,"plate":"6ZH099JU","modExhaust":-1,"modRoof":-1,"modVanityPlate":-1,"modBrakes":-1,"modCustomTiresF":false,"modRightFender":-1,"modKit19":-1,"modAerials":-1,"modDashboard":-1,"pearlescentColor":87,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"modSteeringWheel":-1,"modTrimA":-1,"model":159274291,"modKit21":-1,"modTurbo":false,"modShifterLeavers":-1,"modPlateHolder":-1,"bodyHealth":1000.0592475178704,"engineHealth":1000.0592475178704,"modDial":-1,"oilLevel":6.35462587779425,"modEngineBlock":-1,"modBackWheels":-1,"modFrontBumper":-1,"modHood":-1,"liveryRoof":-1,"modFrame":-1,"modDoorSpeaker":-1,"modTank":-1,"modSmokeEnabled":false,"modKit47":-1,"modXenon":false,"modKit17":-1,"wheelWidth":0.0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSuspension":-1,"color2":0,"modArmor":-1,"modWindows":-1,"modSeats":-1,"modFrontWheels":-1,"dashboardColor":93,"modSpoilers":-1,"xenonColor":255,"modLivery":-1,"modKit49":-1,"neonColor":[255,0,255],"modTrunk":-1,"modOrnaments":-1,"modHydrolic":-1,"windowTint":-1,"wheelSize":0.0,"modRearBumper":-1,"modCustomTiresR":false,"wheelColor":112,"color1":88,"wheels":1,"interiorColor":93,"modFender":-1,"modAPlate":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"headlightColor":255,"modEngine":-1}', '6ZH099JU', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, 128, NULL, 0, 0, 0, 0),
	(2, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'CWP72955', 'bati', '-114291515', '{"modSpeakers":-1,"modTrimB":-1,"tyreSmokeColor":[255,255,255],"tankHealth":1000.0592475178704,"modArchCover":-1,"plateIndex":3,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modGrille":-1,"extras":[],"modStruts":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":false},"modHorns":-1,"dirtLevel":7.14895411251853,"fuelLevel":100.08535757525947,"modAirFilter":-1,"plate":"7NP674SL","modExhaust":-1,"modRoof":-1,"modVanityPlate":-1,"modBrakes":-1,"modCustomTiresF":false,"modRightFender":-1,"modKit19":-1,"modAerials":-1,"modDashboard":-1,"pearlescentColor":111,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"modSideSkirt":-1,"neonEnabled":[false,false,false,false],"modSteeringWheel":-1,"modTrimA":-1,"model":-114291515,"modKit21":-1,"modTurbo":false,"modShifterLeavers":-1,"modPlateHolder":-1,"bodyHealth":1000.0592475178704,"engineHealth":1000.0592475178704,"modDial":-1,"oilLevel":4.76596940834568,"modEngineBlock":-1,"modBackWheels":-1,"modFrontBumper":-1,"modHood":-1,"liveryRoof":-1,"modFrame":-1,"modDoorSpeaker":-1,"modTank":-1,"modSmokeEnabled":false,"modKit47":-1,"modXenon":false,"modKit17":-1,"wheelWidth":0.0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSuspension":-1,"color2":41,"modArmor":-1,"modWindows":-1,"modSeats":-1,"modFrontWheels":-1,"dashboardColor":0,"modSpoilers":-1,"xenonColor":255,"modLivery":-1,"modKit49":-1,"neonColor":[255,0,255],"modTrunk":-1,"modOrnaments":-1,"modHydrolic":-1,"windowTint":-1,"wheelSize":0.0,"modRearBumper":-1,"modCustomTiresR":false,"wheelColor":156,"color1":5,"wheels":6,"interiorColor":0,"modFender":-1,"modAPlate":-1,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"headlightColor":255,"modEngine":-1}', '7NP674SL', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, 27648, NULL, 0, 0, 0, 0),
	(3, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'CWP72955', 'elegy2', '-566387422', '{"modBackWheels":-1,"modKit47":-1,"modKit49":-1,"fuelLevel":59.57461760432111,"dirtLevel":0.79432823472428,"modArchCover":-1,"modAPlate":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHydrolic":-1,"windowTint":-1,"wheelSize":1.0,"modEngine":-1,"modXenon":false,"modFender":-1,"modKit21":-1,"engineHealth":942.0732863829978,"modKit19":-1,"modTrimB":-1,"modEngineBlock":-1,"modTrunk":-1,"dashboardColor":0,"modSteeringWheel":-1,"modArmor":-1,"oilLevel":4.76596940834568,"interiorColor":0,"modAirFilter":-1,"modTransmission":-1,"modPlateHolder":-1,"modDashboard":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSideSkirt":-1,"modOrnaments":-1,"modCustomTiresR":false,"modGrille":-1,"modSeats":-1,"pearlescentColor":5,"modBrakes":-1,"modRearBumper":-1,"modExhaust":-1,"wheelColor":156,"modFrame":-1,"liveryRoof":-1,"bodyHealth":945.2505993218949,"neonColor":[255,0,255],"color2":0,"model":-566387422,"xenonColor":255,"plateIndex":0,"modHood":-1,"headlightColor":255,"plate":"67GWC512","modSpoilers":4,"modHorns":-1,"windowStatus":{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":true,"0":true},"modKit17":-1,"modTurbo":false,"modVanityPlate":-1,"modLivery":-1,"modRightFender":-1,"color1":1,"neonEnabled":[false,false,false,false],"modTrimA":-1,"tyreSmokeColor":[255,255,255],"modRoof":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tankHealth":994.4989498748004,"modFrontWheels":-1,"modCustomTiresF":false,"modFrontBumper":-1,"wheels":0,"modDoorSpeaker":-1,"modSmokeEnabled":false,"modSpeakers":-1,"modWindows":-1,"modAerials":-1,"modSuspension":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":996.080322265625},"wheelWidth":1.0,"modTank":-1,"modStruts":-1,"modDial":-1,"modShifterLeavers":-1,"extras":{"11":false,"10":true,"1":false}}', '67GWC512', NULL, 'caears24', 60, 942, 946, 0, 0, 584094, NULL, 0, 0, 0, 0),
	(4, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'CWP72955', 'akuma', '1672195559', '{"bodyHealth":1000.0592475178704,"modHood":-1,"modSuspension":-1,"modHorns":-1,"plate":"4GN025AJ","dashboardColor":0,"engineHealth":1000.0592475178704,"tyreSmokeColor":[255,255,255],"modCustomTiresR":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit19":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modRoof":-1,"modKit21":-1,"modBackWheels":-1,"color2":88,"modAirFilter":-1,"modSeats":-1,"modTurbo":false,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"modKit49":-1,"modArchCover":-1,"modVanityPlate":-1,"modTrunk":-1,"modDashboard":-1,"modRearBumper":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modStruts":-1,"modExhaust":-1,"modXenon":false,"fuelLevel":100.08535757525947,"modHydrolic":-1,"modSpoilers":-1,"headlightColor":255,"interiorColor":0,"modShifterLeavers":-1,"wheelWidth":0.0,"modCustomTiresF":false,"modKit17":-1,"modSmokeEnabled":false,"dirtLevel":4.76596940834568,"windowTint":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"pearlescentColor":88,"modSteeringWheel":-1,"modRightFender":-1,"modKit47":-1,"modAerials":-1,"modSideSkirt":-1,"modWindows":-1,"wheelColor":156,"modEngineBlock":-1,"modEngine":-1,"modFender":-1,"modSpeakers":-1,"modOrnaments":-1,"modTrimB":-1,"modArmor":-1,"plateIndex":3,"modGrille":-1,"modBrakes":-1,"modFrontWheels":-1,"neonColor":[255,0,255],"modPlateHolder":-1,"xenonColor":255,"modLivery":-1,"model":1672195559,"modTank":-1,"modFrontBumper":-1,"neonEnabled":[false,false,false,false],"modTrimA":-1,"extras":{"1":true,"4":true,"9":true},"wheelSize":0.0,"liveryRoof":-1,"tankHealth":1000.0592475178704,"wheels":6,"modAPlate":-1,"oilLevel":4.76596940834568,"modDoorSpeaker":-1,"color1":88,"modTransmission":-1,"modDial":-1,"modFrame":-1}', '4GN025AJ', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, 210, NULL, 0, 0, 0, 0);

-- Dumping structure for table ezfw.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.player_warns: ~0 rows (approximately)

-- Dumping structure for table ezfw.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_citizenid` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `has_access` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`has_access`)),
  `extra_imgs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`extra_imgs`)),
  `furnitures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT json_array() CHECK (json_valid(`furnitures`)),
  `for_sale` tinyint(1) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  `shell` varchar(50) NOT NULL,
  `apartment` varchar(50) DEFAULT NULL,
  `door_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`door_data`)),
  `garage_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`garage_data`)),
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `UQ_owner_apartment` (`owner_citizenid`,`apartment`),
  CONSTRAINT `FK_owner_citizenid` FOREIGN KEY (`owner_citizenid`) REFERENCES `players` (`citizenid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.properties: ~0 rows (approximately)
INSERT IGNORE INTO `properties` (`property_id`, `owner_citizenid`, `street`, `region`, `description`, `has_access`, `extra_imgs`, `furnitures`, `for_sale`, `price`, `shell`, `apartment`, `door_data`, `garage_data`) VALUES
	(1, 'CWP72955', NULL, NULL, 'This is Angus Beef\'s apartment in Tinsel Towers', '[]', '[]', '[{"id":"4924841","object":"v_res_tre_storagebox","label":"Storage Unit","type":"storage","rotation":{"x":0.0,"y":0.0,"z":-87.99999237060547},"position":{"y":1.1852,"x":2.9145,"z":-1.5219}}]', 0, 0, 'Apartment Furnished', 'Tinsel Towers', '[]', '[]');

-- Dumping structure for table ezfw.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.stashitems: ~0 rows (approximately)
INSERT IGNORE INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(1, 'property_1', '[]');

-- Dumping structure for table ezfw.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.trunkitems: ~0 rows (approximately)

-- Dumping structure for table ezfw.weedplants
CREATE TABLE IF NOT EXISTS `weedplants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext NOT NULL CHECK (json_valid(`coords`)),
  `time` int(255) NOT NULL,
  `fertilizer` longtext NOT NULL CHECK (json_valid(`fertilizer`)),
  `water` longtext NOT NULL CHECK (json_valid(`water`)),
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.weedplants: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
