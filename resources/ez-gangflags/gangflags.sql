CREATE TABLE `gangflags` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`creator` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`coords` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
	`gang` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`model` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`heading` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`coords`) USING BTREE,
	INDEX `id` (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1697
;
