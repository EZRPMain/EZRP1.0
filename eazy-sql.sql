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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.bans: ~0 rows (approximately)

-- Dumping structure for table ezfw.bennys_shop
CREATE TABLE IF NOT EXISTS `bennys_shop` (
  `citizenid` varchar(50) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ezfw.bennys_shop: ~0 rows (approximately)

-- Dumping structure for table ezfw.boost_contract
CREATE TABLE IF NOT EXISTS `boost_contract` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `started` datetime DEFAULT NULL,
  `expire` datetime DEFAULT NULL,
  `onsale` int(11) DEFAULT 0,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.boost_contract: ~0 rows (approximately)

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

-- Dumping structure for table ezfw.cl_spawnselector
CREATE TABLE IF NOT EXISTS `cl_spawnselector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.cl_spawnselector: ~5 rows (approximately)
INSERT IGNORE INTO `cl_spawnselector` (`id`, `location_data`) VALUES
	(1, '{"locationText":"Hospital","iconColor":"rgb(51, 51, 51)","iconName":"fas fa-hospital","screenPosition":{"left":510,"resolution":{"height":1080,"width":1920},"top":571},"backgroundColor":"rgb(253, 92, 99)"}'),
	(2, '{"locationText":"Legion Square","iconColor":"rgb(51, 51, 51)","iconName":"fas fa-tree","screenPosition":{"left":477,"resolution":{"height":1080,"width":1920},"top":546},"backgroundColor":"#c3f2cb"}'),
	(3, '{"locationText":"Airport","iconColor":"rgb(51, 51, 51)","iconName":"fas fa-cart-flatbed-suitcase","screenPosition":{"left":167,"resolution":{"height":1080,"width":1920},"top":391},"backgroundColor":"rgb(200, 237, 253)"}'),
	(4, '{"locationText":"Mount Chiliad","iconColor":"rgb(51, 51, 51)","iconName":"fas fa-person-hiking","screenPosition":{"left":1520,"resolution":{"height":1080,"width":1920},"top":595},"backgroundColor":"rgb(129, 104, 2)"}'),
	(5, '{"locationText":"MRPD","iconColor":"rgb(51, 51, 51)","iconName":"fas fa-shield","screenPosition":{"left":454,"resolution":{"height":1080,"width":1920},"top":587},"backgroundColor":"rgb(124, 185, 232)"}');

-- Dumping structure for table ezfw.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.crypto: ~0 rows (approximately)

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.gloveboxitems: ~0 rows (approximately)

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ezfw.mdt_weaponinfo: ~0 rows (approximately)

-- Dumping structure for table ezfw.nightclubs
CREATE TABLE IF NOT EXISTS `nightclubs` (
  `citizenid` varchar(50) NOT NULL,
  `metadata` text NOT NULL,
  `missions` text NOT NULL,
  `employee` text NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.nightclubs: ~0 rows (approximately)

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

-- Dumping structure for table ezfw.phone_chatrooms
CREATE TABLE IF NOT EXISTS `phone_chatrooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(20) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT '{}',
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_code` (`room_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.phone_chatrooms: ~3 rows (approximately)
INSERT IGNORE INTO `phone_chatrooms` (`id`, `room_code`, `room_name`, `room_owner_id`, `room_owner_name`, `room_members`, `room_pin`, `unpaid_balance`, `is_pinned`, `created`) VALUES
	(1, '411', '411', 'official', 'Government', '{}', NULL, 0.00, 1, '2023-07-26 15:15:33'),
	(2, 'lounge', 'The Lounge', 'official', 'Government', '{}', NULL, 0.00, 1, '2023-07-26 15:15:33'),
	(3, 'events', 'Events', 'official', 'Government', '{}', NULL, 0.00, 1, '2023-07-26 15:15:33');

-- Dumping structure for table ezfw.phone_chatroom_messages
CREATE TABLE IF NOT EXISTS `phone_chatroom_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `member_id` varchar(20) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.phone_chatroom_messages: ~0 rows (approximately)

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
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.phone_invoices: ~0 rows (approximately)

-- Dumping structure for table ezfw.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.phone_messages: ~0 rows (approximately)

-- Dumping structure for table ezfw.phone_note
CREATE TABLE IF NOT EXISTS `phone_note` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `lastupdate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.phone_note: ~0 rows (approximately)

-- Dumping structure for table ezfw.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `tweetId` varchar(25) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1541 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.players: ~1 rows (approximately)
INSERT IGNORE INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
	(1534, 'NCY05380', 1, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'Jay', '{"payslip":100,"crypto":0,"cash":500,"bank":750}', '{"lastname":"Ender","nationality":"Australia","firstname":"School","birthdate":"2000-02-06","backstory":"placeholder backstory","account":"US06QBCore2946325378","gender":{"length":0,"prevObject":{"length":1,"0":{"_cash1692948225560":{"_cashEvents":{"reset":[],"keyup":[],"keydown":[],"click":[],"change":[]}},"location":{"pathname":"/html/index.html","hostname":"cfx-nui-qb-multicharacter","protocol":"https:","origin":"https://cfx-nui-qb-multicharacter","ancestorOrigins":{"0":"nui://game"},"host":"cfx-nui-qb-multicharacter","search":"","href":"https://cfx-nui-qb-multicharacter/html/index.html","port":"","hash":""},"jQuery224057436502354012281":{"events":{"click":[{"needsContext":false,"guid":2,"namespace":"","type":"click","origType":"click","selector":"#close-log"},{"needsContext":false,"guid":3,"namespace":"","type":"click","origType":"click","selector":".character"},{"needsContext":false,"guid":4,"namespace":"","type":"click","origType":"click","selector":"#create"},{"needsContext":false,"guid":5,"namespace":"","type":"click","origType":"click","selector":".Expert-Register-ImageStyle"},{"needsContext":false,"guid":6,"namespace":"","type":"click","origType":"click","selector":"#accept-delete"},{"needsContext":false,"guid":7,"namespace":"","type":"click","origType":"click","selector":"#cancel-delete"}]}}},"context":{"_cash1692948225560":{"_cashEvents":{"reset":[],"keyup":[],"keydown":[],"click":[],"change":[]}},"location":{"pathname":"/html/index.html","hostname":"cfx-nui-qb-multicharacter","protocol":"https:","origin":"https://cfx-nui-qb-multicharacter","ancestorOrigins":{"0":"nui://game"},"host":"cfx-nui-qb-multicharacter","search":"","href":"https://cfx-nui-qb-multicharacter/html/index.html","port":"","hash":""},"jQuery224057436502354012281":{"events":{"click":[{"needsContext":false,"guid":2,"namespace":"","type":"click","origType":"click","selector":"#close-log"},{"needsContext":false,"guid":3,"namespace":"","type":"click","origType":"click","selector":".character"},{"needsContext":false,"guid":4,"namespace":"","type":"click","origType":"click","selector":"#create"},{"needsContext":false,"guid":5,"namespace":"","type":"click","origType":"click","selector":".Expert-Register-ImageStyle"},{"needsContext":false,"guid":6,"namespace":"","type":"click","origType":"click","selector":"#accept-delete"},{"needsContext":false,"guid":7,"namespace":"","type":"click","origType":"click","selector":"#cancel-delete"}]}}}},"selector":"Male","context":{"_cash1692948225560":{"_cashEvents":{"reset":[],"keyup":[],"keydown":[],"click":[],"change":[]}},"location":{"pathname":"/html/index.html","hostname":"cfx-nui-qb-multicharacter","protocol":"https:","origin":"https://cfx-nui-qb-multicharacter","ancestorOrigins":{"0":"nui://game"},"host":"cfx-nui-qb-multicharacter","search":"","href":"https://cfx-nui-qb-multicharacter/html/index.html","port":"","hash":""},"jQuery224057436502354012281":{"events":{"click":[{"needsContext":false,"guid":2,"namespace":"","type":"click","origType":"click","selector":"#close-log"},{"needsContext":false,"guid":3,"namespace":"","type":"click","origType":"click","selector":".character"},{"needsContext":false,"guid":4,"namespace":"","type":"click","origType":"click","selector":"#create"},{"needsContext":false,"guid":5,"namespace":"","type":"click","origType":"click","selector":".Expert-Register-ImageStyle"},{"needsContext":false,"guid":6,"namespace":"","type":"click","origType":"click","selector":"#accept-delete"},{"needsContext":false,"guid":7,"namespace":"","type":"click","origType":"click","selector":"#cancel-delete"}]}}}},"phone":"1268938198","cid":"1"}', '{"label":"Civilian","grade":{"name":"Freelancer","level":0},"payment":10,"onduty":true,"type":"none","isboss":false,"name":"unemployed"}', '{"label":"No Gang Affiliaton","isboss":false,"name":"none","grade":{"name":"none","level":0}}', '{"x":-812.2417602539063,"y":182.53187561035157,"z":76.7288818359375}', '{"walletid":"QB-93417527","dealerrep":0,"fingerprint":"ty844x29Jwr2229","carboostclass":"D","ishandcuffed":false,"laptopdata":{"wallpaper":"default","apps":[]},"bloodtype":"O-","stress":0,"jailitems":[],"hunger":95.8,"phonedata":{"InstalledApps":[],"SerialNumber":92445390},"status":[],"criminalrecord":{"hasRecord":false},"armor":0,"craftingrep":0,"injail":0,"carboostrep":0,"inlaststand":false,"commandbinds":[],"delivery":0,"fitbit":[],"callsign":"NO CALLSIGN","tracker":false,"isdead":false,"jobrep":{"trucker":0,"tow":0,"taxi":0,"hotdog":0},"attachmentcraftingrep":0,"thirst":96.2,"licences":{"business":false,"driver":true,"weapon":false},"crypto":{"shung":0,"xcoin":0,"lme":0,"gne":0},"phone":[],"inside":{"apartment":[]}}', '[{"type":"item","amount":1,"name":"driver_license","slot":1,"info":{"type":"Class C Driver License","firstname":"School","lastname":"Ender","birthdate":"2000-02-06"}},{"type":"item","amount":1,"name":"phone","slot":2,"info":[]},{"type":"item","amount":1,"name":"id_card","slot":3,"info":{"birthdate":"2000-02-06","lastname":"Ender","nationality":"Australia","firstname":"School","gender":{"prevObject":{"0":{"_cash1692948225560":{"_cashEvents":{"change":[],"reset":[],"keyup":[],"click":[],"keydown":[]}},"location":{"hash":"","hostname":"cfx-nui-qb-multicharacter","ancestorOrigins":{"0":"nui://game"},"protocol":"https:","origin":"https://cfx-nui-qb-multicharacter","port":"","search":"","href":"https://cfx-nui-qb-multicharacter/html/index.html","pathname":"/html/index.html","host":"cfx-nui-qb-multicharacter"},"jQuery224057436502354012281":{"events":{"click":[{"type":"click","selector":"#close-log","needsContext":false,"origType":"click","guid":2,"namespace":""},{"type":"click","selector":".character","needsContext":false,"origType":"click","guid":3,"namespace":""},{"type":"click","selector":"#create","needsContext":false,"origType":"click","guid":4,"namespace":""},{"type":"click","selector":".Expert-Register-ImageStyle","needsContext":false,"origType":"click","guid":5,"namespace":""},{"type":"click","selector":"#accept-delete","needsContext":false,"origType":"click","guid":6,"namespace":""},{"type":"click","selector":"#cancel-delete","needsContext":false,"origType":"click","guid":7,"namespace":""}]}}},"length":1,"context":{"_cash1692948225560":{"_cashEvents":{"change":[],"reset":[],"keyup":[],"click":[],"keydown":[]}},"location":{"hash":"","hostname":"cfx-nui-qb-multicharacter","ancestorOrigins":{"0":"nui://game"},"protocol":"https:","origin":"https://cfx-nui-qb-multicharacter","port":"","search":"","href":"https://cfx-nui-qb-multicharacter/html/index.html","pathname":"/html/index.html","host":"cfx-nui-qb-multicharacter"},"jQuery224057436502354012281":{"events":{"click":[{"type":"click","selector":"#close-log","needsContext":false,"origType":"click","guid":2,"namespace":""},{"type":"click","selector":".character","needsContext":false,"origType":"click","guid":3,"namespace":""},{"type":"click","selector":"#create","needsContext":false,"origType":"click","guid":4,"namespace":""},{"type":"click","selector":".Expert-Register-ImageStyle","needsContext":false,"origType":"click","guid":5,"namespace":""},{"type":"click","selector":"#accept-delete","needsContext":false,"origType":"click","guid":6,"namespace":""},{"type":"click","selector":"#cancel-delete","needsContext":false,"origType":"click","guid":7,"namespace":""}]}}}},"length":0,"context":{"_cash1692948225560":{"_cashEvents":{"change":[],"reset":[],"keyup":[],"click":[],"keydown":[]}},"location":{"hash":"","hostname":"cfx-nui-qb-multicharacter","ancestorOrigins":{"0":"nui://game"},"protocol":"https:","origin":"https://cfx-nui-qb-multicharacter","port":"","search":"","href":"https://cfx-nui-qb-multicharacter/html/index.html","pathname":"/html/index.html","host":"cfx-nui-qb-multicharacter"},"jQuery224057436502354012281":{"events":{"click":[{"type":"click","selector":"#close-log","needsContext":false,"origType":"click","guid":2,"namespace":""},{"type":"click","selector":".character","needsContext":false,"origType":"click","guid":3,"namespace":""},{"type":"click","selector":"#create","needsContext":false,"origType":"click","guid":4,"namespace":""},{"type":"click","selector":".Expert-Register-ImageStyle","needsContext":false,"origType":"click","guid":5,"namespace":""},{"type":"click","selector":"#accept-delete","needsContext":false,"origType":"click","guid":6,"namespace":""},{"type":"click","selector":"#cancel-delete","needsContext":false,"origType":"click","guid":7,"namespace":""}]}}},"selector":"Male"},"citizenid":"NCY05380"}}]', '2023-08-25 07:38:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.playerskins: ~1 rows (approximately)
INSERT IGNORE INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(37, 'NCY05380', '1885233650', '{"nose_3":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"jaw_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"nose_5":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"beard":{"defaultItem":-1,"defaultTexture":1,"item":-1,"texture":1},"cheek_3":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"ageing":{"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"nose_2":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"decals":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"arms":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"nose_4":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"glass":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"lips_thickness":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"watch":{"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"cheek_2":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"facemix":{"defaultSkinMix":0.0,"skinMix":0,"defaultShapeMix":0.0,"shapeMix":0},"neck_thikness":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"chimp_hole":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"chimp_bone_width":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"cheek_1":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"chimp_bone_lenght":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"vest":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"torso2":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"jaw_bone_back_lenght":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"bracelet":{"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"makeup":{"defaultItem":-1,"defaultTexture":1,"item":-1,"texture":1},"hat":{"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"eye_opening":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"bag":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"nose_0":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"moles":{"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"blush":{"defaultItem":-1,"defaultTexture":1,"item":-1,"texture":1},"accessory":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"eyebrown_forward":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"shoes":{"defaultItem":1,"defaultTexture":0,"item":1,"texture":0},"ear":{"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"eyebrows":{"defaultItem":-1,"defaultTexture":1,"item":-1,"texture":1},"face":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"face2":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"mask":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"nose_1":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"chimp_bone_lowering":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"lipstick":{"defaultItem":-1,"defaultTexture":1,"item":-1,"texture":1},"eyebrown_high":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"t-shirt":{"defaultItem":1,"defaultTexture":0,"item":1,"texture":0},"eye_color":{"defaultItem":-1,"defaultTexture":0,"item":-1,"texture":0},"hair":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0},"pants":{"defaultItem":0,"defaultTexture":0,"item":0,"texture":0}}', 1);

-- Dumping structure for table ezfw.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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

-- Dumping structure for table ezfw.player_jobs
CREATE TABLE IF NOT EXISTS `player_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(50) DEFAULT NULL,
  `employees` text DEFAULT NULL,
  `maxEmployee` tinyint(11) DEFAULT 15,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.player_jobs: ~0 rows (approximately)

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.player_mails: ~0 rows (approximately)

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
  `vinnum` varchar(50) DEFAULT NULL,
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
  `vinnumber` varchar(50) DEFAULT NULL,
  `vinscratch` int(2) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.player_vehicles: ~0 rows (approximately)

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.properties: ~2 rows (approximately)
INSERT IGNORE INTO `properties` (`property_id`, `owner_citizenid`, `street`, `region`, `description`, `has_access`, `extra_imgs`, `furnitures`, `for_sale`, `price`, `shell`, `apartment`, `door_data`, `garage_data`) VALUES
	(1, 'NCY05380', NULL, NULL, 'This is School Ender\'s apartment in Integrity Way', '[]', '[]', '[]', 0, 0, 'Apartment Furnished', 'Integrity Way', '[]', '[]'),
	(2, 'NCY05380', 'Great Ocean Hwy', 'Banham Canyon', 'Ocean View Mansion', '[]', '[]', '[{"rotation":{"x":0.0,"y":-0.0,"z":0.0},"label":"Storage Unit","type":"storage","id":"8826302","object":"v_res_tre_storagebox","position":{"z":-0.4759,"y":-2.31,"x":3.3701}}]', 0, 5000, '2 Floor House', NULL, '{"h":25.06,"x":-2992.85,"locked":false,"z":28.69,"y":707.59,"length":1.5,"width":2.2}', '{"x":-3003.63,"h":123.85,"z":28.26,"width":5.0,"length":3.0,"y":718.59}');

-- Dumping structure for table ezfw.scenes
CREATE TABLE IF NOT EXISTS `scenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `text` mediumtext COLLATE utf8mb4_bin DEFAULT NULL,
  `color` mediumtext COLLATE utf8mb4_bin DEFAULT NULL,
  `viewdistance` int(11) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `fontsize` decimal(10,1) DEFAULT NULL,
  `fontstyle` int(11) DEFAULT NULL,
  `coords` mediumtext COLLATE utf8mb4_bin DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_deletion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Dumping data for table ezfw.scenes: ~0 rows (approximately)

-- Dumping structure for table ezfw.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Dumping data for table ezfw.stashitems: ~2 rows (approximately)
INSERT IGNORE INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(23, 'property_1', '[]'),
	(24, 'property_2', '[]');

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
