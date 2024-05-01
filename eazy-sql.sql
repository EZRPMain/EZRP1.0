-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
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
CREATE DATABASE IF NOT EXISTS `ezfw` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.bank_accounts_new: ~11 rows (approximately)
REPLACE INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES
	('ambulance', 0, '[]', '[]', 0, NULL),
	('ballas', 0, '[]', '[]', 0, NULL),
	('cardealer', 0, '[]', '[]', 0, NULL),
	('cartel', 0, '[]', '[]', 0, NULL),
	('families', 0, '[]', '[]', 0, NULL),
	('lostmc', 0, '[]', '[]', 0, NULL),
	('mechanic', 13200, '[]', '[]', 0, NULL),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.bans: ~0 rows (approximately)

-- Dumping structure for table ezfw.bennys_shop
CREATE TABLE IF NOT EXISTS `bennys_shop` (
  `citizenid` varchar(50) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.boost_contract: ~0 rows (approximately)

-- Dumping structure for table ezfw.business_data
CREATE TABLE IF NOT EXISTS `business_data` (
  `id` varchar(50) NOT NULL,
  `dui` longtext DEFAULT NULL,
  `combos` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ezfw.business_items: ~0 rows (approximately)

-- Dumping structure for table ezfw.cl_spawnselector
CREATE TABLE IF NOT EXISTS `cl_spawnselector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ezfw.cl_spawnselector: ~5 rows (approximately)
REPLACE INTO `cl_spawnselector` (`id`, `location_data`) VALUES
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.crypto_transactions: ~0 rows (approximately)

-- Dumping structure for table ezfw.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.dealers: ~0 rows (approximately)

-- Dumping structure for table ezfw.donator
CREATE TABLE IF NOT EXISTS `donator` (
  `license` varchar(255) NOT NULL,
  `coins` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `license` (`license`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.donator: ~0 rows (approximately)

-- Dumping structure for table ezfw.donator_pending
CREATE TABLE IF NOT EXISTS `donator_pending` (
  `transactionId` varchar(50) NOT NULL,
  `package` longtext NOT NULL,
  `redeemed` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`transactionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.donator_pending: ~0 rows (approximately)

-- Dumping structure for table ezfw.ez_storage
CREATE TABLE IF NOT EXISTS `ez_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) NOT NULL,
  `zone` varchar(255) NOT NULL,
  `keyholders` longtext DEFAULT NULL,
  PRIMARY KEY (`zone`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1667 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.ez_storage: ~19 rows (approximately)
REPLACE INTO `ez_storage` (`id`, `cid`, `zone`, `keyholders`) VALUES
	(1, '', 'Garage1', NULL),
	(10, '', 'Garage10', NULL),
	(11, '', 'Garage11', NULL),
	(12, '', 'Garage12', NULL),
	(13, '', 'Garage13', NULL),
	(14, '', 'Garage14', NULL),
	(15, '', 'Garage15', NULL),
	(16, '', 'Garage16', NULL),
	(17, '', 'Garage17', NULL),
	(18, '', 'Garage18', NULL),
	(19, '', 'Garage19', NULL),
	(2, '', 'Garage2', NULL),
	(3, '', 'Garage3', NULL),
	(4, '', 'Garage4', NULL),
	(5, '', 'Garage5', NULL),
	(6, '', 'Garage6', NULL),
	(7, '', 'Garage7', NULL),
	(8, '', 'Garage8', NULL),
	(9, '', 'Garage9', NULL);

-- Dumping structure for table ezfw.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.gloveboxitems: ~0 rows (approximately)
REPLACE INTO `gloveboxitems` (`id`, `plate`, `items`) VALUES
	(8, '6ZI722BR', '[]');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.management_funds: ~12 rows (approximately)
REPLACE INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
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

-- Dumping structure for table ezfw.management_outfits
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ezfw.management_outfits: ~0 rows (approximately)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ezfw.mdt_data: ~0 rows (approximately)

-- Dumping structure for table ezfw.mdt_impound
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ezfw.mdt_incidents: ~0 rows (approximately)

-- Dumping structure for table ezfw.mdt_logs
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ezfw.mdt_weaponinfo: ~2 rows (approximately)
REPLACE INTO `mdt_weaponinfo` (`id`, `serial`, `owner`, `information`, `weapClass`, `weapModel`, `image`) VALUES
	(2, '78lUQ9GX898Utjk', 'test test', 'Purchased at Ammunation', '1', 'Knife', 'https://cfx-nui-lj-inventory/html/images/weapon_knife.png'),
	(3, '47JTm4XF348hPAa', 'test test', 'Purchased at Ammunation', '1', 'Bat', 'https://cfx-nui-lj-inventory/html/images/weapon_bat.png');

-- Dumping structure for table ezfw.nightclubs
CREATE TABLE IF NOT EXISTS `nightclubs` (
  `citizenid` varchar(50) NOT NULL,
  `metadata` text NOT NULL,
  `missions` text NOT NULL,
  `employee` text NOT NULL,
  PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.phone_chatrooms: ~3 rows (approximately)
REPLACE INTO `phone_chatrooms` (`id`, `room_code`, `room_name`, `room_owner_id`, `room_owner_name`, `room_members`, `room_pin`, `unpaid_balance`, `is_pinned`, `created`) VALUES
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.phone_chatroom_messages: ~0 rows (approximately)

-- Dumping structure for table ezfw.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2073 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.players: ~2 rows (approximately)
REPLACE INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
	(1865, 'IIJ16816', 1, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'Jay', '{"crypto":0,"cash":239339344,"payslip":27480,"bank":239339281}', '{"account":"US07QBCore9533247651","lastname":"test","phone":"4931634247","birthdate":"1111-11-11","gender":{"length":0,"selector":"Male","prevObject":{"length":1,"0":{"_cash1712311661186":{"_cashEvents":{"reset":[],"change":[],"keyup":[],"keydown":[],"click":[]}},"jQuery224097928083398861811":{"events":{"click":[{"type":"click","origType":"click","namespace":"","selector":"#close-log","guid":2,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":".character","guid":3,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":"#create","guid":4,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":".Expert-Register-ImageStyle","guid":5,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":"#accept-delete","guid":6,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":"#cancel-delete","guid":7,"needsContext":false}]}},"location":{"port":"","ancestorOrigins":{"0":"nui://game"},"search":"","protocol":"https:","pathname":"/html/index.html","href":"https://cfx-nui-qb-multicharacter/html/index.html","hash":"","hostname":"cfx-nui-qb-multicharacter","host":"cfx-nui-qb-multicharacter","origin":"https://cfx-nui-qb-multicharacter"}},"context":{"_cash1712311661186":{"_cashEvents":{"reset":[],"change":[],"keyup":[],"keydown":[],"click":[]}},"jQuery224097928083398861811":{"events":{"click":[{"type":"click","origType":"click","namespace":"","selector":"#close-log","guid":2,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":".character","guid":3,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":"#create","guid":4,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":".Expert-Register-ImageStyle","guid":5,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":"#accept-delete","guid":6,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":"#cancel-delete","guid":7,"needsContext":false}]}},"location":{"port":"","ancestorOrigins":{"0":"nui://game"},"search":"","protocol":"https:","pathname":"/html/index.html","href":"https://cfx-nui-qb-multicharacter/html/index.html","hash":"","hostname":"cfx-nui-qb-multicharacter","host":"cfx-nui-qb-multicharacter","origin":"https://cfx-nui-qb-multicharacter"}}},"context":{"_cash1712311661186":{"_cashEvents":{"reset":[],"change":[],"keyup":[],"keydown":[],"click":[]}},"jQuery224097928083398861811":{"events":{"click":[{"type":"click","origType":"click","namespace":"","selector":"#close-log","guid":2,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":".character","guid":3,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":"#create","guid":4,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":".Expert-Register-ImageStyle","guid":5,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":"#accept-delete","guid":6,"needsContext":false},{"type":"click","origType":"click","namespace":"","selector":"#cancel-delete","guid":7,"needsContext":false}]}},"location":{"port":"","ancestorOrigins":{"0":"nui://game"},"search":"","protocol":"https:","pathname":"/html/index.html","href":"https://cfx-nui-qb-multicharacter/html/index.html","hash":"","hostname":"cfx-nui-qb-multicharacter","host":"cfx-nui-qb-multicharacter","origin":"https://cfx-nui-qb-multicharacter"}}},"firstname":"test","backstory":"placeholder backstory","nationality":"test","cid":"1"}', '{"onduty":true,"type":"none","grade":{"level":0,"name":"Freelancer"},"name":"unemployed","payment":10,"isboss":false,"label":"Civilian"}', '{"label":"No Gang Affiliaton","grade":{"name":"none","level":0},"isboss":false,"name":"none"}', '{"x":4933.97802734375,"y":-5140.78662109375,"z":3.5501708984375}', '{"jobrep":{"trucker":0,"tow":0,"taxi":0,"hotdog":0},"laptopdata":{"wallpaper":"default","apps":[]},"ishandcuffed":false,"carboostrep":0,"phone":[],"fitbit":[],"bloodtype":"B-","phonedata":{"InstalledApps":[],"SerialNumber":83298073},"tracker":false,"armor":0,"walletid":"QB-81089055","jailitems":[],"fingerprint":"AE405N64Hit0779","status":[],"hunger":32.79999999999995,"injail":0,"isdead":false,"callsign":"NO CALLSIGN","carboostclass":"D","criminalrecord":{"hasRecord":false},"stress":2,"craftingrep":0,"inlaststand":false,"dealerrep":0,"thirst":39.20000000000004,"licences":{"weapon":false,"business":false,"driver":true},"inside":{"apartment":[]},"attachmentcraftingrep":0,"crypto":{"shung":0,"lme":0,"xcoin":0,"gne":0},"laptop":{"darkfont":false,"background":"default"},"commandbinds":[],"delivery":0}', '[{"slot":1,"type":"weapon","amount":1,"name":"weapon_pistol50","info":{"quality":100,"ammo":0,"tint":4,"serie":"82sWe8uy924JuVv"}},{"slot":2,"type":"item","amount":1,"name":"hacking_device","info":[]},{"slot":3,"type":"item","amount":1,"name":"lockpick","info":[]},{"slot":4,"type":"item","amount":1,"name":"advancedlockpick","info":[]},{"slot":5,"type":"item","amount":1,"name":"security_card_01","info":[]},{"slot":6,"type":"item","amount":1,"name":"id_card","info":{"lastname":"test","birthdate":"1111-11-11","gender":{"length":0,"context":{"location":{"pathname":"/html/index.html","origin":"https://cfx-nui-qb-multicharacter","search":"","hash":"","hostname":"cfx-nui-qb-multicharacter","ancestorOrigins":{"0":"nui://game"},"href":"https://cfx-nui-qb-multicharacter/html/index.html","port":"","protocol":"https:","host":"cfx-nui-qb-multicharacter"},"_cash1712311661186":{"_cashEvents":{"change":[],"click":[],"keyup":[],"keydown":[],"reset":[]}},"jQuery224097928083398861811":{"events":{"click":[{"namespace":"","origType":"click","type":"click","guid":2,"selector":"#close-log","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":3,"selector":".character","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":4,"selector":"#create","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":5,"selector":".Expert-Register-ImageStyle","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":6,"selector":"#accept-delete","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":7,"selector":"#cancel-delete","needsContext":false}]}}},"selector":"Male","prevObject":{"length":1,"context":{"location":{"pathname":"/html/index.html","origin":"https://cfx-nui-qb-multicharacter","search":"","hash":"","hostname":"cfx-nui-qb-multicharacter","ancestorOrigins":{"0":"nui://game"},"href":"https://cfx-nui-qb-multicharacter/html/index.html","port":"","protocol":"https:","host":"cfx-nui-qb-multicharacter"},"_cash1712311661186":{"_cashEvents":{"change":[],"click":[],"keyup":[],"keydown":[],"reset":[]}},"jQuery224097928083398861811":{"events":{"click":[{"namespace":"","origType":"click","type":"click","guid":2,"selector":"#close-log","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":3,"selector":".character","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":4,"selector":"#create","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":5,"selector":".Expert-Register-ImageStyle","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":6,"selector":"#accept-delete","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":7,"selector":"#cancel-delete","needsContext":false}]}}},"0":{"location":{"pathname":"/html/index.html","origin":"https://cfx-nui-qb-multicharacter","search":"","hash":"","hostname":"cfx-nui-qb-multicharacter","ancestorOrigins":{"0":"nui://game"},"href":"https://cfx-nui-qb-multicharacter/html/index.html","port":"","protocol":"https:","host":"cfx-nui-qb-multicharacter"},"_cash1712311661186":{"_cashEvents":{"change":[],"click":[],"keyup":[],"keydown":[],"reset":[]}},"jQuery224097928083398861811":{"events":{"click":[{"namespace":"","origType":"click","type":"click","guid":2,"selector":"#close-log","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":3,"selector":".character","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":4,"selector":"#create","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":5,"selector":".Expert-Register-ImageStyle","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":6,"selector":"#accept-delete","needsContext":false},{"namespace":"","origType":"click","type":"click","guid":7,"selector":"#cancel-delete","needsContext":false}]}}}}},"citizenid":"IIJ16816","nationality":"test","firstname":"test"}},{"slot":7,"type":"item","amount":1,"name":"phone","info":[]},{"slot":8,"type":"item","amount":1,"name":"driver_license","info":{"birthdate":"1111-11-11","type":"Class C Driver License","lastname":"test","firstname":"test"}},{"slot":9,"type":"item","amount":1,"name":"mask","info":{"drawableId":51,"textureId":9}},{"slot":10,"type":"item","amount":5,"name":"markedbills","info":[]},{"slot":11,"type":"item","amount":33248,"name":"cash_roll","info":[]},{"slot":12,"type":"item","amount":1,"name":"markedbills","info":[]},{"slot":13,"type":"item","amount":1,"name":"weapontint_army","info":[]},{"slot":14,"type":"item","amount":1,"name":"weapontint_plat","info":[]},{"slot":17,"type":"weapon","amount":1,"name":"weapon_sawnoffshotgun","info":{"quality":100,"tint":5,"serie":"25Wwe8iv590pipu"}},{"slot":18,"type":"weapon","amount":1,"name":"weapon_knife","info":{"quality":100,"serie":"78lUQ9GX898Utjk"}},{"slot":19,"type":"item","amount":16,"name":"joint","info":[]},{"slot":21,"type":"weapon","amount":1,"name":"weapon_combatpistol","info":{"quality":100,"ammo":0,"tint":1,"serie":"99rVB8Ay130kDIp"}},{"slot":22,"type":"weapon","amount":1,"name":"weapon_combatpistol","info":{"quality":55.44999999999871,"ammo":241,"attachments":[{"item":"combatpistol_extendedclip","type":"clip","component":"COMPONENT_COMBATPISTOL_CLIP_02","label":"Pistol EXT Clip"},{"item":"pistol_suppressor","component":"COMPONENT_AT_PI_SUPP","label":"Pistol Suppressor"},{"item":"combatpistol_luxuryfinish","component":"COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER","label":"Pistol Finish"}],"serie":"92iSW1dh669QWYj"}},{"slot":23,"type":"weapon","amount":1,"name":"weapon_glock17","info":{"attachments":[{"component":"COMPONENT_AT_PI_FLSH","label":"Flashlight"}],"quality":100,"serie":"45ncC9mg383QetC"}},{"slot":24,"type":"weapon","amount":1,"name":"weapon_bat","info":{"quality":99.85,"ammo":0,"serie":"47JTm4XF348hPAa"}}]', '2024-04-30 11:49:07'),
	(1956, 'PPI90621', 1, 'license:8f1aa453620f9c72d4e3a6505cb5b112e2084927', 'Rinehart', '{"payslip":70,"crypto":0,"cash":500,"bank":5000}', '{"backstory":"placeholder backstory","gender":{"selector":"Female","length":0,"context":{"jQuery224087305145271334931":{"events":{"click":[{"origType":"click","namespace":"","selector":"#close-log","needsContext":false,"guid":2,"type":"click"},{"origType":"click","namespace":"","selector":".character","needsContext":false,"guid":3,"type":"click"},{"origType":"click","namespace":"","selector":"#create","needsContext":false,"guid":4,"type":"click"},{"origType":"click","namespace":"","selector":".Expert-Register-ImageStyle","needsContext":false,"guid":5,"type":"click"},{"origType":"click","namespace":"","selector":"#accept-delete","needsContext":false,"guid":6,"type":"click"},{"origType":"click","namespace":"","selector":"#cancel-delete","needsContext":false,"guid":7,"type":"click"}]}},"_cash1712621478918":{"_cashEvents":{"click":[],"keydown":[],"keyup":[],"change":[],"reset":[]}},"location":{"href":"https://cfx-nui-qb-multicharacter/html/index.html","pathname":"/html/index.html","origin":"https://cfx-nui-qb-multicharacter","protocol":"https:","search":"","hostname":"cfx-nui-qb-multicharacter","port":"","host":"cfx-nui-qb-multicharacter","ancestorOrigins":{"0":"nui://game"},"hash":""}},"prevObject":{"length":1,"context":{"jQuery224087305145271334931":{"events":{"click":[{"origType":"click","namespace":"","selector":"#close-log","needsContext":false,"guid":2,"type":"click"},{"origType":"click","namespace":"","selector":".character","needsContext":false,"guid":3,"type":"click"},{"origType":"click","namespace":"","selector":"#create","needsContext":false,"guid":4,"type":"click"},{"origType":"click","namespace":"","selector":".Expert-Register-ImageStyle","needsContext":false,"guid":5,"type":"click"},{"origType":"click","namespace":"","selector":"#accept-delete","needsContext":false,"guid":6,"type":"click"},{"origType":"click","namespace":"","selector":"#cancel-delete","needsContext":false,"guid":7,"type":"click"}]}},"_cash1712621478918":{"_cashEvents":{"click":[],"keydown":[],"keyup":[],"change":[],"reset":[]}},"location":{"href":"https://cfx-nui-qb-multicharacter/html/index.html","pathname":"/html/index.html","origin":"https://cfx-nui-qb-multicharacter","protocol":"https:","search":"","hostname":"cfx-nui-qb-multicharacter","port":"","host":"cfx-nui-qb-multicharacter","ancestorOrigins":{"0":"nui://game"},"hash":""}},"0":{"jQuery224087305145271334931":{"events":{"click":[{"origType":"click","namespace":"","selector":"#close-log","needsContext":false,"guid":2,"type":"click"},{"origType":"click","namespace":"","selector":".character","needsContext":false,"guid":3,"type":"click"},{"origType":"click","namespace":"","selector":"#create","needsContext":false,"guid":4,"type":"click"},{"origType":"click","namespace":"","selector":".Expert-Register-ImageStyle","needsContext":false,"guid":5,"type":"click"},{"origType":"click","namespace":"","selector":"#accept-delete","needsContext":false,"guid":6,"type":"click"},{"origType":"click","namespace":"","selector":"#cancel-delete","needsContext":false,"guid":7,"type":"click"}]}},"_cash1712621478918":{"_cashEvents":{"click":[],"keydown":[],"keyup":[],"change":[],"reset":[]}},"location":{"href":"https://cfx-nui-qb-multicharacter/html/index.html","pathname":"/html/index.html","origin":"https://cfx-nui-qb-multicharacter","protocol":"https:","search":"","hostname":"cfx-nui-qb-multicharacter","port":"","host":"cfx-nui-qb-multicharacter","ancestorOrigins":{"0":"nui://game"},"hash":""}}}},"phone":"7357425825","lastname":"theexlora","cid":"1","account":"US07QBCore4078741228","nationality":"white","firstname":"dora","birthdate":"1991-11-11"}', '{"onduty":true,"name":"unemployed","type":"none","grade":{"level":0,"name":"Freelancer"},"label":"Civilian","payment":10,"isboss":false}', '{"name":"none","label":"No Gang Affiliaton","isboss":false,"grade":{"level":0,"name":"none"}}', '{"x":655.5164794921875,"y":-1055.4461669921876,"z":22.11865234375}', '{"inlaststand":false,"crypto":{"gne":0,"shung":0,"lme":0,"xcoin":0},"jailitems":[],"injail":0,"bloodtype":"A-","phone":[],"walletid":"QB-65291973","armor":0,"status":[],"tracker":false,"delivery":0,"fitbit":[],"licences":{"business":false,"driver":true,"weapon":false},"attachmentcraftingrep":0,"carboostrep":0,"phonedata":{"InstalledApps":[],"SerialNumber":88487303},"craftingrep":0,"ishandcuffed":false,"dealerrep":0,"callsign":"NO CALLSIGN","isdead":false,"fingerprint":"IE220A35ZXt9963","stress":0,"laptopdata":{"apps":[],"wallpaper":"default"},"thirst":96.2,"inside":{"apartment":[]},"hunger":95.8,"commandbinds":[],"jobrep":{"trucker":0,"hotdog":0,"taxi":0,"tow":0},"laptop":{"background":"default","darkfont":false},"carboostclass":"D","criminalrecord":{"hasRecord":false}}', '[{"slot":1,"info":{"birthdate":"1991-11-11","firstname":"dora","lastname":"theexlora","type":"Class C Driver License"},"type":"item","amount":1,"name":"driver_license"},{"slot":2,"info":[],"type":"item","amount":1,"name":"phone"},{"slot":3,"info":{"firstname":"dora","citizenid":"PPI90621","nationality":"white","lastname":"theexlora","birthdate":"1991-11-11","gender":{"selector":"Female","context":{"jQuery224087305145271334931":{"events":{"click":[{"selector":"#close-log","type":"click","needsContext":false,"origType":"click","guid":2,"namespace":""},{"selector":".character","type":"click","needsContext":false,"origType":"click","guid":3,"namespace":""},{"selector":"#create","type":"click","needsContext":false,"origType":"click","guid":4,"namespace":""},{"selector":".Expert-Register-ImageStyle","type":"click","needsContext":false,"origType":"click","guid":5,"namespace":""},{"selector":"#accept-delete","type":"click","needsContext":false,"origType":"click","guid":6,"namespace":""},{"selector":"#cancel-delete","type":"click","needsContext":false,"origType":"click","guid":7,"namespace":""}]}},"location":{"href":"https://cfx-nui-qb-multicharacter/html/index.html","hash":"","origin":"https://cfx-nui-qb-multicharacter","hostname":"cfx-nui-qb-multicharacter","protocol":"https:","ancestorOrigins":{"0":"nui://game"},"pathname":"/html/index.html","search":"","port":"","host":"cfx-nui-qb-multicharacter"},"_cash1712621478918":{"_cashEvents":{"change":[],"click":[],"reset":[],"keydown":[],"keyup":[]}}},"length":0,"prevObject":{"length":1,"0":{"jQuery224087305145271334931":{"events":{"click":[{"selector":"#close-log","type":"click","needsContext":false,"origType":"click","guid":2,"namespace":""},{"selector":".character","type":"click","needsContext":false,"origType":"click","guid":3,"namespace":""},{"selector":"#create","type":"click","needsContext":false,"origType":"click","guid":4,"namespace":""},{"selector":".Expert-Register-ImageStyle","type":"click","needsContext":false,"origType":"click","guid":5,"namespace":""},{"selector":"#accept-delete","type":"click","needsContext":false,"origType":"click","guid":6,"namespace":""},{"selector":"#cancel-delete","type":"click","needsContext":false,"origType":"click","guid":7,"namespace":""}]}},"location":{"href":"https://cfx-nui-qb-multicharacter/html/index.html","hash":"","origin":"https://cfx-nui-qb-multicharacter","hostname":"cfx-nui-qb-multicharacter","protocol":"https:","ancestorOrigins":{"0":"nui://game"},"pathname":"/html/index.html","search":"","port":"","host":"cfx-nui-qb-multicharacter"},"_cash1712621478918":{"_cashEvents":{"change":[],"click":[],"reset":[],"keydown":[],"keyup":[]}}},"context":{"jQuery224087305145271334931":{"events":{"click":[{"selector":"#close-log","type":"click","needsContext":false,"origType":"click","guid":2,"namespace":""},{"selector":".character","type":"click","needsContext":false,"origType":"click","guid":3,"namespace":""},{"selector":"#create","type":"click","needsContext":false,"origType":"click","guid":4,"namespace":""},{"selector":".Expert-Register-ImageStyle","type":"click","needsContext":false,"origType":"click","guid":5,"namespace":""},{"selector":"#accept-delete","type":"click","needsContext":false,"origType":"click","guid":6,"namespace":""},{"selector":"#cancel-delete","type":"click","needsContext":false,"origType":"click","guid":7,"namespace":""}]}},"location":{"href":"https://cfx-nui-qb-multicharacter/html/index.html","hash":"","origin":"https://cfx-nui-qb-multicharacter","hostname":"cfx-nui-qb-multicharacter","protocol":"https:","ancestorOrigins":{"0":"nui://game"},"pathname":"/html/index.html","search":"","port":"","host":"cfx-nui-qb-multicharacter"},"_cash1712621478918":{"_cashEvents":{"change":[],"click":[],"reset":[],"keydown":[],"keyup":[]}}}}}},"type":"item","amount":1,"name":"id_card"}]', '2024-04-09 01:36:55');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table ezfw.playerskins: ~1 rows (approximately)
REPLACE INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(10, 'PPI90621', 'mp_m_freemode_01', '{"faceFeatures":{"cheeksBoneWidth":0,"eyesOpening":0,"jawBoneBackSize":0,"noseBoneHigh":0,"neckThickness":0,"jawBoneWidth":0,"nosePeakHigh":0,"noseBoneTwist":0,"noseWidth":0,"eyeBrownForward":0,"cheeksBoneHigh":0,"nosePeakLowering":0,"lipsThickness":0,"chinBoneLenght":0,"eyeBrownHigh":0,"chinBoneSize":0,"nosePeakSize":0,"cheeksWidth":0,"chinBoneLowering":0,"chinHole":0},"props":[{"texture":-1,"drawable":-1,"prop_id":0},{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7}],"headBlend":{"shapeMix":0,"skinSecond":0,"skinMix":0,"shapeSecond":0,"thirdMix":0,"shapeThird":0,"shapeFirst":0,"skinThird":0,"skinFirst":0},"model":"mp_m_freemode_01","headOverlays":{"ageing":{"secondColor":0,"opacity":0,"style":0,"color":0},"sunDamage":{"secondColor":0,"opacity":0,"style":0,"color":0},"makeUp":{"secondColor":0,"opacity":0,"style":0,"color":0},"chestHair":{"secondColor":0,"opacity":0,"style":0,"color":0},"beard":{"secondColor":0,"opacity":0,"style":0,"color":0},"blush":{"secondColor":0,"opacity":0,"style":0,"color":0},"eyebrows":{"secondColor":0,"opacity":0,"style":0,"color":0},"moleAndFreckles":{"secondColor":0,"opacity":0,"style":0,"color":0},"bodyBlemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"complexion":{"secondColor":0,"opacity":0,"style":0,"color":0},"lipstick":{"secondColor":0,"opacity":0,"style":0,"color":0},"blemishes":{"secondColor":0,"opacity":0,"style":0,"color":0}},"tattoos":[],"hair":{"highlight":0,"texture":0,"style":0,"color":0},"eyeColor":0,"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":121,"component_id":1},{"texture":0,"drawable":0,"component_id":2},{"texture":0,"drawable":1,"component_id":3},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":110,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":204,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":7,"drawable":506,"component_id":11},{"texture":0,"drawable":169,"component_id":4}]}', 1),
	(14, 'IIJ16816', 'mp_m_freemode_01', '{"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":17,"texture":0,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"headBlend":{"skinThird":0,"shapeFirst":42,"shapeMix":0.5,"skinSecond":0,"skinMix":0,"thirdMix":0,"shapeSecond":23,"skinFirst":5,"shapeThird":0},"headOverlays":{"complexion":{"opacity":0,"secondColor":0,"color":0,"style":0},"bodyBlemishes":{"opacity":0,"secondColor":0,"color":0,"style":0},"sunDamage":{"opacity":0,"secondColor":0,"color":0,"style":0},"eyebrows":{"opacity":1,"secondColor":0,"color":3,"style":29},"blush":{"opacity":0,"secondColor":0,"color":0,"style":0},"chestHair":{"opacity":0,"secondColor":0,"color":0,"style":0},"makeUp":{"opacity":0,"secondColor":0,"color":0,"style":0},"beard":{"opacity":0.5,"secondColor":0,"color":3,"style":4},"moleAndFreckles":{"opacity":0,"secondColor":0,"color":0,"style":0},"ageing":{"opacity":0,"secondColor":0,"color":0,"style":0},"lipstick":{"opacity":0,"secondColor":0,"color":0,"style":0},"blemishes":{"opacity":0,"secondColor":0,"color":0,"style":0}},"tattoos":[],"faceFeatures":{"nosePeakSize":0,"cheeksBoneWidth":0,"jawBoneWidth":0,"noseBoneTwist":0,"chinBoneLowering":0,"noseWidth":0,"jawBoneBackSize":0,"lipsThickness":0,"cheeksWidth":0,"chinBoneLenght":0,"nosePeakHigh":0,"chinHole":0,"eyesOpening":0,"chinBoneSize":0,"cheeksBoneHigh":0,"noseBoneHigh":0,"nosePeakLowering":0,"neckThickness":0,"eyeBrownForward":0,"eyeBrownHigh":0},"components":[{"drawable":0,"texture":0,"component_id":0},{"drawable":37,"texture":0,"component_id":2},{"drawable":187,"texture":0,"component_id":3},{"drawable":0,"texture":12,"component_id":4},{"drawable":0,"texture":0,"component_id":5},{"drawable":0,"texture":0,"component_id":7},{"drawable":15,"texture":0,"component_id":8},{"drawable":0,"texture":0,"component_id":9},{"drawable":0,"texture":0,"component_id":10},{"drawable":57,"texture":0,"component_id":1},{"drawable":126,"texture":10,"component_id":11},{"drawable":1,"texture":7,"component_id":6}],"hair":{"highlight":45,"texture":0,"color":8,"style":37},"eyeColor":3,"model":"mp_m_freemode_01"}', 1);

-- Dumping structure for table ezfw.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.player_houses: ~0 rows (approximately)

-- Dumping structure for table ezfw.player_jobs
CREATE TABLE IF NOT EXISTS `player_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(50) DEFAULT NULL,
  `employees` text DEFAULT NULL,
  `maxEmployee` tinyint(11) DEFAULT 15,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.player_mails: ~4 rows (approximately)
REPLACE INTO `player_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
	(58, 'NCY05380', 'Unknown', 'Car Location', 'Hey this is the car location, its in near Del Perro Beach', 0, 880823, '2024-04-03 11:47:45', NULL),
	(59, 'NCY05380', 'Unknown', 'Car Location', 'Hey this is the car location, its in near Vinewood Hills', 0, 112598, '2024-04-03 11:56:16', NULL),
	(60, 'NCY05380', 'Unknown', 'Drop point', 'Hey this is the drop point, you can drop your car here, I\'m sending you the coord on gps', 0, 627064, '2024-04-03 11:59:28', NULL),
	(61, 'NCY05380', 'Unknown', 'Drop point', 'Hey this is the drop point, you can drop your car here, I\'m sending you the coord on gps', 0, 138242, '2024-04-03 11:59:29', NULL);

-- Dumping structure for table ezfw.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ezfw.player_outfits: ~0 rows (approximately)
REPLACE INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `props`, `components`) VALUES
	(26, 'IIJ16816', 'casual mask', 'mp_m_freemode_01', '[{"texture":0,"prop_id":0,"drawable":96},{"texture":0,"prop_id":1,"drawable":3},{"texture":0,"prop_id":2,"drawable":17},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}]', '[{"texture":0,"drawable":0,"component_id":0},{"texture":9,"drawable":51,"component_id":1},{"texture":0,"drawable":48,"component_id":2},{"texture":0,"drawable":180,"component_id":3},{"texture":0,"drawable":122,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":1,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":106,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":4,"drawable":7,"component_id":11}]');

-- Dumping structure for table ezfw.player_outfit_codes
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ezfw.player_outfit_codes: ~0 rows (approximately)

-- Dumping structure for table ezfw.player_transactions
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.player_vehicles: ~14 rows (approximately)
REPLACE INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `vinnum`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `vinnumber`, `vinscratch`) VALUES
	(11, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'XJV08874', 'sultan', NULL, '970598228', '{"modFrame":-1,"headlightColor":255,"interiorColor":0,"modTrimA":-1,"color1":1,"modHood":-1,"modDial":-1,"modRightFender":-1,"modKit47":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"pearlescentColor":5,"modHydrolic":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modTank":-1,"modLivery":-1,"modHorns":-1,"wheelWidth":0.0,"modAirFilter":-1,"modDoorSpeaker":-1,"modArchCover":-1,"modSpoilers":-1,"modArmor":-1,"oilLevel":4.76596940834568,"modPlateHolder":-1,"modFender":-1,"modCustomTiresF":false,"tyreSmokeColor":[255,255,255],"modDashboard":-1,"model":970598228,"modTurbo":false,"modVanityPlate":-1,"modStruts":-1,"modExhaust":-1,"modGrille":-1,"modCustomTiresR":false,"modAPlate":-1,"modSeats":-1,"modEngine":-1,"neonEnabled":[false,false,false,false],"modEngineBlock":-1,"modXenon":false,"windowTint":-1,"extras":{"12":true,"10":false},"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSuspension":-1,"modWindows":-1,"modFrontBumper":-1,"modSpeakers":-1,"fuelLevel":24.62417527645272,"modKit49":-1,"modFrontWheels":-1,"color2":1,"modTrimB":-1,"dirtLevel":0.0,"modRoof":-1,"bodyHealth":1000.0592475178704,"liveryRoof":-1,"engineHealth":1000.0592475178704,"wheels":0,"plate":"43BKC214","modKit19":-1,"modAerials":-1,"xenonColor":255,"modRearBumper":-1,"modBackWheels":-1,"wheelSize":0.0,"modSteeringWheel":-1,"modSmokeEnabled":false,"modSideSkirt":-1,"tankHealth":1000.0592475178704,"modBrakes":-1,"modShifterLeavers":-1,"neonColor":[255,0,255],"modTransmission":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plateIndex":3,"modOrnaments":-1,"modTrunk":-1,"dashboardColor":0,"wheelColor":156,"modKit21":-1,"modKit17":-1}', '43BKC214', NULL, 'pillboxgarage', 24, 980, 999, 1, 0, 890570, NULL, 0, 0, 0, 0, NULL, 0),
	(12, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'NCY05380', 'sultan', NULL, '970598228', '{"modExhaust":-1,"modFrame":-1,"modTrimB":-1,"plate":"83PSJ678","headlightColor":255,"xenonColor":255,"wheelSize":0.0,"modKit17":-1,"color1":1,"interiorColor":0,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"tyreSmokeColor":[255,255,255],"modFender":-1,"modArmor":-1,"modTrunk":-1,"modDial":-1,"modRightFender":-1,"modTurbo":false,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modHydrolic":-1,"modSpoilers":-1,"tankHealth":1000.0592475178704,"modBrakes":-1,"modAPlate":-1,"color2":1,"modFrontBumper":-1,"modGrille":-1,"modKit19":-1,"plateIndex":0,"wheelColor":156,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSeats":-1,"neonColor":[255,0,255],"oilLevel":4.76596940834568,"modTransmission":-1,"modStruts":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modLivery":-1,"modSpeakers":-1,"modXenon":false,"pearlescentColor":5,"dashboardColor":0,"engineHealth":1000.0592475178704,"modOrnaments":-1,"modFrontWheels":-1,"modSteeringWheel":-1,"fuelLevel":27.00715998062557,"modWindows":-1,"extras":{"12":false,"10":true},"modEngine":-1,"neonEnabled":[false,false,false,false],"modHorns":-1,"modVanityPlate":-1,"modAerials":-1,"modEngineBlock":-1,"modArchCover":-1,"modHood":-1,"modSmokeEnabled":false,"liveryRoof":-1,"dirtLevel":0.0,"windowTint":-1,"modAirFilter":-1,"modBackWheels":-1,"bodyHealth":1000.0592475178704,"modDashboard":-1,"modCustomTiresF":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modDoorSpeaker":-1,"modRearBumper":-1,"modShifterLeavers":-1,"modSideSkirt":-1,"modCustomTiresR":false,"modTrimA":-1,"modRoof":-1,"modPlateHolder":-1,"modKit47":-1,"wheelWidth":0.0,"modSuspension":-1,"model":970598228,"modTank":-1,"modKit21":-1,"wheels":0,"modKit49":-1}', '83PSJ678', NULL, 'pillboxgarage', 50, 1000, 1000, 1, 0, 852129, NULL, 0, 0, 0, 0, NULL, 0),
	(13, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'NCY05380', 'massacro2', NULL, '-631760477', '{"modExhaust":-1,"fuelLevel":64.3405870126668,"modHorns":-1,"modOrnaments":-1,"modDial":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modVanityPlate":-1,"modArmor":4,"dashboardColor":0,"bodyHealth":1000.0592475178704,"modSeats":-1,"modHood":-1,"modDoorSpeaker":-1,"modTransmission":2,"modEngineBlock":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"engineHealth":1000.0592475178704,"modRightFender":-1,"modCustomTiresR":false,"modKit47":-1,"tankHealth":1000.0592475178704,"extras":{"11":false,"10":true},"interiorColor":0,"modStruts":-1,"tyreSmokeColor":[255,255,255],"headlightColor":255,"modBrakes":2,"modRearBumper":-1,"modTurbo":1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSuspension":-1,"modTank":-1,"wheels":7,"color2":38,"modFender":-1,"modPlateHolder":-1,"modHydrolic":-1,"modBackWheels":-1,"modEngine":3,"modGrille":-1,"modTrimB":-1,"modKit21":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"oilLevel":4.76596940834568,"plate":"82TJV797","modXenon":false,"modShifterLeavers":-1,"modArchCover":-1,"modAerials":-1,"modFrontWheels":-1,"modKit49":-1,"pearlescentColor":42,"modKit19":-1,"modLivery":-1,"xenonColor":255,"modSpoilers":-1,"neonColor":[255,0,255],"modCustomTiresF":false,"dirtLevel":0.0,"modFrontBumper":-1,"modWindows":-1,"modSteeringWheel":-1,"modSmokeEnabled":false,"modFrame":-1,"wheelWidth":0.0,"wheelSize":0.0,"liveryRoof":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimA":-1,"modSideSkirt":-1,"modAPlate":-1,"modAirFilter":-1,"modTrunk":-1,"modRoof":-1,"modSpeakers":-1,"model":-631760477,"modDashboard":-1,"plateIndex":0,"windowTint":-1,"neonEnabled":[false,false,false,false],"color1":38,"wheelColor":38,"modKit17":-1}', '82TJV797', NULL, 'pillboxgarage', 65, 1000, 1000, 1, 0, 230124, NULL, 0, 0, 0, 0, NULL, 0),
	(14, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'NCY05380', 'bmx', NULL, '1131912276', '{"modEngineBlock":-1,"modLivery":-1,"modTrimB":-1,"modPlateHolder":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modExhaust":-1,"modSteeringWheel":-1,"headlightColor":255,"modFrontWheels":-1,"modKit47":-1,"modRoof":-1,"modFrame":-1,"modFrontBumper":-1,"modSeats":-1,"neonEnabled":[false,false,false,false],"plate":"9XV519FB","modCustomTiresR":false,"modGrille":-1,"modSmokeEnabled":false,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"wheelSize":0.0,"modHydrolic":-1,"modBrakes":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit19":-1,"modHorns":-1,"fuelLevel":100.08535757525947,"modSideSkirt":-1,"pearlescentColor":111,"modTank":-1,"tyreSmokeColor":[255,255,255],"liveryRoof":-1,"dashboardColor":0,"modDashboard":-1,"windowTint":-1,"dirtLevel":3.17731293889712,"wheelWidth":0.0,"modVanityPlate":-1,"interiorColor":0,"modTrunk":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modXenon":false,"modHood":-1,"modDial":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRearBumper":-1,"wheels":6,"color1":7,"extras":[],"tankHealth":1000.0592475178704,"modEngine":-1,"plateIndex":4,"modTrimA":-1,"modSuspension":-1,"neonColor":[255,0,255],"modKit21":-1,"modKit49":-1,"modSpeakers":-1,"modSpoilers":-1,"oilLevel":0.0,"modFender":-1,"modDoorSpeaker":-1,"color2":0,"bodyHealth":1000.0592475178704,"modAerials":-1,"wheelColor":156,"modShifterLeavers":-1,"modBackWheels":-1,"engineHealth":1000.0592475178704,"modTransmission":-1,"modStruts":-1,"modAirFilter":-1,"modCustomTiresF":false,"xenonColor":255,"modTurbo":false,"modArmor":-1,"model":1131912276,"modAPlate":-1,"modArchCover":-1,"modWindows":-1,"modRightFender":-1,"modKit17":-1,"modOrnaments":-1}', '9XV519FB', NULL, NULL, 100, 1000, 1000, 1, 0, 556501, NULL, 0, 0, 0, 0, NULL, 0),
	(15, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'NCY05380', 'buffalo', NULL, '-304802106', '{"modKit47":-1,"modTurbo":false,"modStruts":-1,"extras":{"5":true,"4":true,"10":false,"1":true,"11":false,"3":true,"2":true},"headlightColor":255,"modHydrolic":-1,"color2":0,"wheelSize":1.0,"xenonColor":255,"modHorns":-1,"modVanityPlate":-1,"dashboardColor":0,"modWindows":-1,"tankHealth":4000.2369900714818,"wheelColor":120,"modArchCover":-1,"modOrnaments":-1,"neonEnabled":[false,false,false,false],"wheelWidth":1.0,"modDoorSpeaker":-1,"liveryRoof":-1,"tyreSmokeColor":[255,255,255],"modBrakes":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRoof":-1,"modPlateHolder":-1,"modTrimA":-1,"modFrontBumper":0,"pearlescentColor":5,"modSmokeEnabled":false,"modSteeringWheel":-1,"modAirFilter":-1,"color1":120,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"model":-304802106,"modTank":-1,"modSideSkirt":0,"modAerials":-1,"modBackWheels":-1,"modFender":-1,"modTransmission":-1,"modCustomTiresR":false,"modKit49":-1,"modSeats":-1,"modLivery":-1,"engineHealth":1000.0592475178704,"fuelLevel":65.13491524739108,"neonColor":[255,0,255],"wheels":0,"modSpoilers":0,"modTrunk":-1,"windowTint":1,"modSpeakers":-1,"modEngineBlock":-1,"modExhaust":0,"modArmor":-1,"modHood":-1,"modDial":-1,"modFrame":-1,"modDashboard":-1,"modEngine":-1,"oilLevel":4.76596940834568,"modKit17":-1,"plateIndex":5,"interiorColor":0,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modAPlate":-1,"modKit21":-1,"bodyHealth":1000.0592475178704,"modShifterLeavers":-1,"modSuspension":-1,"modRearBumper":0,"modXenon":false,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"dirtLevel":7.14895411251853,"modCustomTiresF":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modGrille":-1,"plate":"3LS447DM","modRightFender":-1,"modTrimB":-1,"modFrontWheels":-1,"modKit19":-1}', '3LS447DM', NULL, NULL, 100, 1000, 1000, 1, 0, 5950, NULL, 0, 0, 0, 0, '857WAI61', 0),
	(16, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'NCY05380', 'buffalo', NULL, '-304802106', '{"oilLevel":4.76596940834568,"modSpoilers":-1,"modRightFender":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modSeats":-1,"modSpeakers":-1,"modFrontBumper":-1,"pearlescentColor":6,"modBrakes":-1,"fuelLevel":100.08535757525947,"modEngine":-1,"modArmor":-1,"color2":0,"wheelSize":0.0,"modCustomTiresF":false,"modOrnaments":-1,"wheelColor":156,"dirtLevel":4.76596940834568,"modArchCover":-1,"modFrontWheels":-1,"modEngineBlock":-1,"modRoof":-1,"tyreSmokeColor":[255,255,255],"modTrimA":-1,"tankHealth":1000.0592475178704,"engineHealth":1000.0592475178704,"dashboardColor":0,"plate":"4ES046TV","doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modFrame":-1,"xenonColor":255,"modTank":-1,"modBackWheels":-1,"modWindows":-1,"modKit49":-1,"windowTint":-1,"modDial":-1,"modAerials":-1,"modSuspension":-1,"neonColor":[255,0,255],"modCustomTiresR":false,"modHorns":-1,"wheelWidth":0.0,"modKit19":-1,"extras":{"1":true,"10":false,"11":false,"5":true,"4":true,"3":true,"2":true},"modSmokeEnabled":false,"color1":9,"modDashboard":-1,"headlightColor":255,"modAirFilter":-1,"modTrunk":-1,"liveryRoof":-1,"neonEnabled":[false,false,false,false],"modVanityPlate":-1,"modDoorSpeaker":-1,"bodyHealth":1000.0592475178704,"modAPlate":-1,"wheels":0,"modPlateHolder":-1,"modHydrolic":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modXenon":false,"modKit17":-1,"modHood":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modShifterLeavers":-1,"modExhaust":-1,"modTransmission":-1,"modGrille":-1,"modKit21":-1,"interiorColor":0,"modStruts":-1,"modFender":-1,"modTrimB":-1,"modLivery":-1,"modTurbo":false,"modSideSkirt":-1,"model":-304802106,"modKit47":-1,"modSteeringWheel":-1,"modRearBumper":-1,"plateIndex":0}', '4ES046TV', NULL, NULL, 100, 1000, 1000, 1, 0, 112, NULL, 0, 0, 0, 0, '560YEC72', 0),
	(17, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'NCY05380', 'nkcruiser', NULL, '-271783068', '{"neonEnabled":[false,false,false,false],"modSeats":-1,"modExhaust":-1,"modTrunk":-1,"modSideSkirt":-1,"interiorColor":0,"modHorns":-1,"extras":{"1":true,"2":false,"3":false,"4":false,"9":false,"5":false,"6":false,"7":false,"8":false},"modKit47":-1,"wheels":1,"modAerials":-1,"modBackWheels":-1,"modLivery":0,"modCustomTiresF":false,"wheelColor":0,"modWindows":-1,"modRearBumper":-1,"modArchCover":-1,"oilLevel":4.76596940834568,"wheelWidth":1.0,"plate":"7ZB239VA","modTurbo":false,"modHydrolic":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"pearlescentColor":0,"color1":0,"modStruts":-1,"modAirFilter":-1,"modDashboard":-1,"modDial":-1,"modSuspension":-1,"modDoorSpeaker":-1,"plateIndex":4,"modSmokeEnabled":false,"modHood":-1,"modEngineBlock":-1,"modFrontWheels":-1,"modSteeringWheel":-1,"tyreSmokeColor":[255,255,255],"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"tankHealth":1000.0592475178704,"modKit49":-1,"dashboardColor":0,"modSpeakers":-1,"bodyHealth":1000.0592475178704,"modKit21":-1,"modBrakes":-1,"modRightFender":3,"modFender":1,"neonColor":[255,0,255],"modShifterLeavers":-1,"headlightColor":255,"dirtLevel":7.14895411251853,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color2":112,"wheelSize":1.0,"modSpoilers":-1,"modRoof":7,"modTank":1,"xenonColor":255,"fuelLevel":96.90804463636234,"modPlateHolder":-1,"modKit17":-1,"modTrimB":-1,"liveryRoof":-1,"modOrnaments":-1,"modEngine":-1,"modCustomTiresR":false,"modXenon":false,"modTransmission":-1,"modArmor":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modFrame":0,"modFrontBumper":1,"modVanityPlate":-1,"modKit19":-1,"model":-271783068,"modGrille":-1,"windowTint":-1,"modAPlate":-1,"engineHealth":1000.0592475178704,"modTrimA":-1}', '7ZB239VA', NULL, NULL, 100, 1000, 1000, 1, 0, 31054, NULL, 0, 0, 0, 0, '629QFP51', 0),
	(18, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'NCY05380', 'polbuffalo4', NULL, '909095717', '{"modDial":-1,"modAPlate":-1,"modSuspension":-1,"modRearBumper":-1,"tankHealth":1000.0592475178704,"modVanityPlate":-1,"modEngine":-1,"modArchCover":-1,"modSpeakers":-1,"modHorns":-1,"modDoorSpeaker":-1,"modGrille":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimA":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"model":909095717,"modSideSkirt":-1,"modKit17":-1,"modFender":-1,"wheelColor":0,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modOrnaments":-1,"liveryRoof":-1,"fuelLevel":100.08535757525947,"modSmokeEnabled":false,"modCustomTiresF":false,"color1":0,"wheels":0,"engineHealth":1000.0592475178704,"extras":{"10":true,"1":true,"12":true,"11":true,"2":true},"dirtLevel":4.76596940834568,"modHydrolic":-1,"modCustomTiresR":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"modShifterLeavers":-1,"wheelWidth":0.0,"dashboardColor":0,"headlightColor":255,"interiorColor":0,"modDashboard":-1,"modFrontBumper":-1,"windowTint":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modExhaust":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modStruts":-1,"modKit21":-1,"modKit49":-1,"modRoof":-1,"plate":"7MY999YM","modKit19":-1,"pearlescentColor":0,"modTransmission":-1,"modEngineBlock":-1,"bodyHealth":1000.0592475178704,"modSpoilers":-1,"modRightFender":-1,"modXenon":false,"oilLevel":4.76596940834568,"modLivery":-1,"modArmor":-1,"xenonColor":255,"modSteeringWheel":-1,"neonColor":[255,0,255],"modPlateHolder":-1,"modBrakes":-1,"color2":112,"modKit47":-1,"modTrunk":-1,"wheelSize":0.0,"modTank":-1,"plateIndex":4,"modBackWheels":-1,"modTrimB":-1,"modHood":-1,"modTurbo":false,"modFrame":-1,"modWindows":-1}', '7MY999YM', NULL, NULL, 100, 1000, 1000, 1, 0, 39724, NULL, 0, 0, 0, 0, '460LQV27', 0),
	(19, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'NCY05380', 'polvstr', NULL, '1422492162', '{"modDial":-1,"modAPlate":-1,"modSuspension":-1,"modRearBumper":-1,"tankHealth":1000.0592475178704,"modVanityPlate":-1,"modEngine":-1,"modArchCover":-1,"modSpeakers":-1,"modHorns":-1,"modDoorSpeaker":-1,"modGrille":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimA":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"model":1422492162,"modSideSkirt":-1,"modKit17":-1,"modFender":-1,"wheelColor":0,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modOrnaments":-1,"liveryRoof":-1,"fuelLevel":100.08535757525947,"modSmokeEnabled":false,"modCustomTiresF":false,"color1":0,"wheels":7,"engineHealth":1000.0592475178704,"extras":{"10":true,"1":true,"12":true,"11":true,"2":true},"dirtLevel":6.35462587779425,"modHydrolic":-1,"modCustomTiresR":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"modShifterLeavers":-1,"wheelWidth":0.0,"dashboardColor":0,"headlightColor":255,"interiorColor":0,"modDashboard":-1,"modFrontBumper":-1,"windowTint":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modExhaust":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modStruts":-1,"modKit21":-1,"modKit49":-1,"modRoof":-1,"plate":"2OJ454NA","modKit19":-1,"pearlescentColor":0,"modTransmission":-1,"modEngineBlock":-1,"bodyHealth":1000.0592475178704,"modSpoilers":-1,"modRightFender":-1,"modXenon":false,"oilLevel":6.35462587779425,"modLivery":-1,"modArmor":-1,"xenonColor":255,"modSteeringWheel":-1,"neonColor":[255,0,255],"modPlateHolder":-1,"modBrakes":-1,"color2":112,"modKit47":-1,"modTrunk":-1,"wheelSize":0.0,"modTank":-1,"plateIndex":0,"modBackWheels":-1,"modTrimB":-1,"modHood":-1,"modTurbo":false,"modFrame":-1,"modWindows":-1}', '2OJ454NA', NULL, NULL, 100, 1000, 1000, 1, 0, 16697, NULL, 0, 0, 0, 0, NULL, 0),
	(20, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'NCY05380', 'polcomet', NULL, '-811548126', '{"modDial":-1,"modAPlate":-1,"modSuspension":-1,"modRearBumper":-1,"tankHealth":1000.0592475178704,"modVanityPlate":-1,"modEngine":-1,"modArchCover":-1,"modSpeakers":-1,"modHorns":-1,"modDoorSpeaker":-1,"modGrille":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimA":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"model":-811548126,"modSideSkirt":-1,"modKit17":-1,"modFender":-1,"wheelColor":0,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modOrnaments":-1,"liveryRoof":-1,"fuelLevel":100.08535757525947,"modSmokeEnabled":false,"modCustomTiresF":false,"color1":0,"wheels":0,"engineHealth":1000.0592475178704,"extras":{"10":true,"1":true,"11":true,"2":true,"3":true},"dirtLevel":4.76596940834568,"modHydrolic":-1,"modCustomTiresR":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"modShifterLeavers":-1,"wheelWidth":0.0,"dashboardColor":0,"headlightColor":255,"interiorColor":0,"modDashboard":-1,"modFrontBumper":-1,"windowTint":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modExhaust":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modStruts":-1,"modKit21":-1,"modKit49":-1,"modRoof":-1,"plate":"2UP753NJ","modKit19":-1,"pearlescentColor":0,"modTransmission":-1,"modEngineBlock":-1,"bodyHealth":1000.0592475178704,"modSpoilers":-1,"modRightFender":-1,"modXenon":false,"oilLevel":4.76596940834568,"modLivery":-1,"modArmor":-1,"xenonColor":255,"modSteeringWheel":-1,"neonColor":[255,0,255],"modPlateHolder":-1,"modBrakes":-1,"color2":112,"modKit47":-1,"modTrunk":-1,"wheelSize":0.0,"modTank":-1,"plateIndex":0,"modBackWheels":-1,"modTrimB":-1,"modHood":-1,"modTurbo":false,"modFrame":-1,"modWindows":-1}', '2UP753NJ', NULL, NULL, 100, 1000, 1000, 1, 0, 24859, NULL, 0, 0, 0, 0, '322VHU33', 0),
	(21, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'NCY05380', 'polvigero2', NULL, '424789336', '{"modDial":-1,"modAPlate":-1,"modSuspension":-1,"modRearBumper":-1,"tankHealth":1000.0592475178704,"modVanityPlate":-1,"modEngine":-1,"modArchCover":-1,"modSpeakers":-1,"modHorns":-1,"modDoorSpeaker":-1,"modGrille":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimA":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"model":424789336,"modSideSkirt":-1,"modKit17":-1,"modFender":-1,"wheelColor":0,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modOrnaments":-1,"liveryRoof":-1,"fuelLevel":100.08535757525947,"modSmokeEnabled":false,"modCustomTiresF":false,"color1":0,"wheels":1,"engineHealth":1000.0592475178704,"extras":{"10":true,"1":true,"12":true,"11":true,"2":true},"dirtLevel":3.9716411736214,"modHydrolic":-1,"modCustomTiresR":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"modShifterLeavers":-1,"wheelWidth":0.0,"dashboardColor":0,"headlightColor":255,"interiorColor":0,"modDashboard":-1,"modFrontBumper":-1,"windowTint":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modExhaust":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":true,"5":true,"6":true,"7":true,"0":true},"modStruts":-1,"modKit21":-1,"modKit49":-1,"modRoof":-1,"plate":"3KK157HW","modKit19":-1,"pearlescentColor":0,"modTransmission":-1,"modEngineBlock":-1,"bodyHealth":1000.0592475178704,"modSpoilers":-1,"modRightFender":-1,"modXenon":false,"oilLevel":4.76596940834568,"modLivery":-1,"modArmor":-1,"xenonColor":255,"modSteeringWheel":-1,"neonColor":[255,0,255],"modPlateHolder":-1,"modBrakes":-1,"color2":112,"modKit47":-1,"modTrunk":-1,"wheelSize":0.0,"modTank":-1,"plateIndex":4,"modBackWheels":-1,"modTrimB":-1,"modHood":-1,"modTurbo":false,"modFrame":-1,"modWindows":-1}', '3KK157HW', NULL, NULL, 100, 1000, 1000, 1, 0, 324084, NULL, 0, 0, 0, 0, NULL, 0),
	(22, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'NCY05380', 'poldom', NULL, '-1009160531', '{"modDial":-1,"modAPlate":-1,"modSuspension":-1,"modRearBumper":-1,"tankHealth":1000.0592475178704,"modVanityPlate":-1,"modEngine":-1,"modArchCover":-1,"modSpeakers":-1,"modHorns":-1,"modDoorSpeaker":-1,"modGrille":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimA":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"model":-1009160531,"modSideSkirt":-1,"modKit17":-1,"modFender":-1,"wheelColor":0,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modOrnaments":-1,"liveryRoof":-1,"fuelLevel":100.08535757525947,"modSmokeEnabled":false,"modCustomTiresF":false,"color1":0,"wheels":7,"engineHealth":1000.0592475178704,"extras":{"10":true,"12":true,"11":true},"dirtLevel":3.9716411736214,"modHydrolic":-1,"modCustomTiresR":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"modShifterLeavers":-1,"wheelWidth":0.0,"dashboardColor":0,"headlightColor":255,"interiorColor":0,"modDashboard":-1,"modFrontBumper":-1,"windowTint":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modExhaust":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modStruts":-1,"modKit21":-1,"modKit49":-1,"modRoof":-1,"plate":"9KU801VS","modKit19":-1,"pearlescentColor":0,"modTransmission":-1,"modEngineBlock":-1,"bodyHealth":1000.0592475178704,"modSpoilers":-1,"modRightFender":-1,"modXenon":false,"oilLevel":4.76596940834568,"modLivery":-1,"modArmor":-1,"xenonColor":255,"modSteeringWheel":-1,"neonColor":[255,0,255],"modPlateHolder":-1,"modBrakes":-1,"color2":12,"modKit47":-1,"modTrunk":-1,"wheelSize":0.0,"modTank":-1,"plateIndex":0,"modBackWheels":-1,"modTrimB":-1,"modHood":-1,"modTurbo":false,"modFrame":-1,"modWindows":-1}', '9KU801VS', NULL, NULL, 100, 1000, 1000, 1, 0, 23750, NULL, 0, 0, 0, 0, '028SOM76', 0),
	(23, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'NCY05380', 'polnspeedo', NULL, '941471002', '{"modDial":-1,"modAPlate":-1,"modSuspension":-1,"modRearBumper":-1,"tankHealth":1000.0592475178704,"modVanityPlate":-1,"modEngine":-1,"modArchCover":-1,"modSpeakers":-1,"modHorns":-1,"modDoorSpeaker":-1,"modGrille":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimA":-1,"modAerials":-1,"tyreSmokeColor":[255,255,255],"modAirFilter":-1,"model":941471002,"modSideSkirt":-1,"modKit17":-1,"modFender":-1,"wheelColor":156,"modFrontWheels":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modOrnaments":-1,"liveryRoof":-1,"fuelLevel":100.08535757525947,"modSmokeEnabled":false,"modCustomTiresF":false,"color1":111,"wheels":1,"engineHealth":1000.0592475178704,"extras":{"11":true},"dirtLevel":11.12059528613994,"modHydrolic":-1,"modCustomTiresR":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"modShifterLeavers":-1,"wheelWidth":0.0,"dashboardColor":0,"headlightColor":255,"interiorColor":0,"modDashboard":-1,"modFrontBumper":-1,"windowTint":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modExhaust":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":true},"modStruts":-1,"modKit21":-1,"modKit49":-1,"modRoof":-1,"plate":"0KQ428BC","modKit19":-1,"pearlescentColor":0,"modTransmission":-1,"modEngineBlock":-1,"bodyHealth":1000.0592475178704,"modSpoilers":-1,"modRightFender":-1,"modXenon":false,"oilLevel":4.76596940834568,"modLivery":1,"modArmor":-1,"xenonColor":255,"modSteeringWheel":-1,"neonColor":[255,0,255],"modPlateHolder":-1,"modBrakes":-1,"color2":111,"modKit47":-1,"modTrunk":-1,"wheelSize":0.0,"modTank":-1,"plateIndex":4,"modBackWheels":-1,"modTrimB":-1,"modHood":-1,"modTurbo":false,"modFrame":-1,"modWindows":-1}', '0KQ428BC', NULL, NULL, 100, 1000, 1000, 1, 0, 6086, NULL, 0, 0, 0, 0, '295MDW87', 0),
	(24, 'license:c2cc031f5ae90062435c5b60555b32c5393bd4a1', 'IIJ16816', 'smallboat', NULL, '-222947487', '{"modKit21":-1,"fuelLevel":100.08535757525947,"modSideSkirt":-1,"headlightColor":255,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelWidth":0.0,"modOrnaments":-1,"modEngine":-1,"modRoof":-1,"bodyHealth":1000.0592475178704,"modCustomTiresR":false,"modTrunk":-1,"modExhaust":-1,"modGrille":-1,"pearlescentColor":8,"wheelColor":156,"modHood":-1,"modRearBumper":-1,"modWindows":-1,"modDoorSpeaker":-1,"modSpeakers":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimA":-1,"dirtLevel":0.79432823472428,"modXenon":false,"modPlateHolder":-1,"engineHealth":1000.0592475178704,"color2":156,"modFrontBumper":-1,"modSteeringWheel":-1,"modLivery":-1,"modEngineBlock":-1,"modKit19":-1,"modKit17":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"plateIndex":4,"modFrontWheels":-1,"modTransmission":-1,"modArchCover":-1,"modAPlate":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"dashboardColor":0,"xenonColor":255,"modDashboard":-1,"color1":156,"modTurbo":false,"neonColor":[255,0,255],"windowTint":-1,"modFrame":-1,"interiorColor":0,"extras":{"1":true},"oilLevel":3.17731293889712,"tankHealth":1000.0592475178704,"modSpoilers":-1,"modTrimB":-1,"wheelSize":0.0,"tireHealth":{"1":0.0,"2":0.0,"3":0.0,"0":0.0},"modSmokeEnabled":false,"wheels":0,"modBrakes":-1,"modHydrolic":-1,"modAirFilter":-1,"neonEnabled":[false,false,false,false],"modHorns":-1,"model":-222947487,"modRightFender":-1,"modAerials":-1,"modCustomTiresF":false,"modVanityPlate":-1,"modSeats":-1,"modShifterLeavers":-1,"modTank":-1,"modSuspension":-1,"modArmor":-1,"modFender":-1,"modDial":-1,"modStruts":-1,"liveryRoof":-1,"plate":"6ZI722BR","modKit47":-1,"modBackWheels":-1,"modKit49":-1,"tyreSmokeColor":[255,255,255]}', '6ZI722BR', NULL, NULL, 100, 1000, 1000, 1, 0, 11063, NULL, 0, 0, 0, 0, '709RUM59', 0);

-- Dumping structure for table ezfw.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.properties: ~0 rows (approximately)
REPLACE INTO `properties` (`property_id`, `owner_citizenid`, `street`, `region`, `description`, `has_access`, `extra_imgs`, `furnitures`, `for_sale`, `price`, `shell`, `apartment`, `door_data`, `garage_data`) VALUES
	(5, 'IIJ16816', NULL, NULL, 'This is test test\'s apartment in Dream View Motel', '[]', '[]', '[]', 0, 0, 'Standard Motel', 'Dream View Motel', '[]', '[]'),
	(6, 'PPI90621', NULL, NULL, 'This is dora theexlora\'s apartment in Templar Hotel', '[]', '[]', '[]', 0, 0, 'Standard Motel', 'Templar Hotel', '[]', '[]');

-- Dumping structure for table ezfw.racer_names
CREATE TABLE IF NOT EXISTS `racer_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` text NOT NULL,
  `racername` text NOT NULL,
  `lasttouched` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `races` int(11) NOT NULL DEFAULT 0,
  `wins` int(11) NOT NULL DEFAULT 0,
  `tracks` int(11) NOT NULL DEFAULT 0,
  `auth` text DEFAULT 'racer',
  `createdby` text DEFAULT NULL,
  `revoked` tinyint(4) DEFAULT 0,
  `ranking` int(11) DEFAULT 0,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ezfw.racer_names: ~0 rows (approximately)
REPLACE INTO `racer_names` (`id`, `citizenid`, `racername`, `lasttouched`, `races`, `wins`, `tracks`, `auth`, `createdby`, `revoked`, `ranking`) VALUES
	(44, 'NCY05380', 'bbsag', '2024-04-03 07:38:56', 0, 0, 0, 'god', 'NCY05380', 0, 0);

-- Dumping structure for table ezfw.race_tracks
CREATE TABLE IF NOT EXISTS `race_tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creatorid` varchar(50) DEFAULT NULL,
  `creatorname` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  `access` text DEFAULT '{}',
  `curated` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `raceid` (`raceid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.race_tracks: ~0 rows (approximately)

-- Dumping structure for table ezfw.racing_crews
CREATE TABLE IF NOT EXISTS `racing_crews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crew_name` text DEFAULT NULL,
  `members` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  `races` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `founder_name` text DEFAULT NULL,
  `founder_citizenid` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `members` CHECK (json_valid(`members`))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table ezfw.racing_crews: ~0 rows (approximately)
REPLACE INTO `racing_crews` (`id`, `crew_name`, `members`, `wins`, `races`, `rank`, `founder_name`, `founder_citizenid`) VALUES
	(17, 'Saggers', '[{"citizenID": "NCY05380", "racername": "bbsag", "rank": 0}]', 0, 0, 0, 'bbsag', 'NCY05380');

-- Dumping structure for table ezfw.scenes
CREATE TABLE IF NOT EXISTS `scenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) DEFAULT NULL,
  `text` mediumtext DEFAULT NULL,
  `color` mediumtext DEFAULT NULL,
  `viewdistance` int(11) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `fontsize` decimal(10,1) DEFAULT NULL,
  `fontstyle` int(11) DEFAULT NULL,
  `coords` mediumtext DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.stashitems: ~7 rows (approximately)
REPLACE INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(29, 'BossPrinterMRPD', '[{"label":"Paper","unique":true,"type":"item","slot":1,"name":"paper","useable":true,"weight":500,"image":"images/printerdocument.png","info":[],"amount":1}]'),
	(28, 'burgershot_12', '[]'),
	(23, 'property_1', '[]'),
	(24, 'property_2', '[]'),
	(27, 'property_3', '[]'),
	(32, 'property_4', '[]'),
	(33, 'property_5', '[]'),
	(34, 'property_6', '[]');

-- Dumping structure for table ezfw.svdden_gangs
CREATE TABLE IF NOT EXISTS `svdden_gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gangUrl` varchar(50) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `rankLabel` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  `losses` int(11) DEFAULT NULL,
  `members` longtext NOT NULL,
  `activeWar` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`name`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `last_updated` (`last_updated`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.svdden_gangs: ~0 rows (approximately)

-- Dumping structure for table ezfw.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table ezfw.weedplants: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
