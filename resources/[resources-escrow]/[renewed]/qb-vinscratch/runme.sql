ALTER TABLE `player_vehicles`
	ADD COLUMN `vinnum` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci' AFTER `vehicle`;
