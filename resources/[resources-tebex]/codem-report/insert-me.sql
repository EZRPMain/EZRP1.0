



CREATE TABLE IF NOT EXISTS `codem_player_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `ticketnumber` int(11) NOT NULL DEFAULT 0,
  `stars` int(11) NOT NULL DEFAULT 0,
  `adminname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

DELETE FROM `codem_player_admins`;


CREATE TABLE IF NOT EXISTS `codem_player_livecalls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` char(50) DEFAULT NULL,
  `adminidentifier` char(50) DEFAULT '0',
  `message` longtext DEFAULT NULL,
  `status` varchar(50) DEFAULT 'open',
  `name` char(50) DEFAULT NULL,
  `feedback` longtext DEFAULT NULL,
  `stars` int(11) DEFAULT 0,
  `adminname` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;

DELETE FROM `codem_player_livecalls`;

CREATE TABLE IF NOT EXISTS `codem_player_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` char(50) DEFAULT NULL,
  `adminidentifier` char(50) DEFAULT '0',
  `playername` varchar(50) DEFAULT NULL,
  `adminname` varchar(50) DEFAULT NULL,
  `reportdata` longtext DEFAULT NULL,
  `reporttype` char(50) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `status` char(50) DEFAULT 'open',
  `feedback` longtext DEFAULT NULL,
  `stars` int(11) DEFAULT 0,
  `date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4;

DELETE FROM `codem_player_report`;

CREATE TABLE IF NOT EXISTS `codem_report_adminchat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminchat` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

DELETE FROM `codem_report_adminchat`;
INSERT INTO `codem_report_adminchat` (`id`, `adminchat`) VALUES
	(1, '[]');

