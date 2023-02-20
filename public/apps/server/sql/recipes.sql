DROP TABLE IF EXISTS `recipe`;

CREATE TABLE `recipe` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

DESCRIBE recipe;