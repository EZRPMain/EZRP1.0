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