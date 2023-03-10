DROP TABLE IF EXISTS `topic`;
DROP TABLE IF EXISTS `recipe`;
DROP TABLE IF EXISTS `equipment`;
DROP TABLE IF EXISTS `ingredient`;
DROP TABLE IF EXISTS `directions`;

CREATE TABLE `topic` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `recipe`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`recipe_id` int(11),
	`name` varchar(255) NOT NULL,
	`image` blob,
	`prep` TIME,
	`cook` TIME,
	`ready` TIME,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`recipe_id`) REFERENCES topic(`id`)
) ENGINE=InnoDB;

/*
CREATE TABLE `post` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`date` DATE NOT NULL,
	`text` varchar(255) NOT NULL,
	`user_id` int(11),
	PRIMARY KEY (`id`),
	FOREIGN KEY (`user_id`) REFERENCES user(`id`)
) ENGINE=InnoDB;
*/

CREATE TABLE `equipment`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `ingredient`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `directions`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`sentence` text NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

DESCRIBE topic;
DESCRIBE recipe;
DESCRIBE equipment;
DESCRIBE ingredient;
DESCRIBE directions;

INSERT INTO topic(name) VALUES ('Safety');
INSERT INTO topic(name) VALUES ('Resources');
INSERT INTO topic(name) VALUES ('Noodles');
INSERT INTO topic(name) VALUES ('Soups/Stews');
INSERT INTO topic(name) VALUES ('MEAT MEAT MEAT');
INSERT INTO topic(name) VALUES ('Stir Fry');
INSERT INTO topic(name) VALUES ('Deep Fried Goodness');
INSERT INTO topic(name) VALUES ('Sandwiches/Burgers');
INSERT INTO topic(name) VALUES ('Sauces/Marinades');
INSERT INTO topic(name) VALUES ('Desserts');
INSERT INTO topic(name) VALUES ('Drinks');

INSERT INTO recipe(recipe_id, name, image, prep, cook, ready)
VALUES(
	(SELECT id FROM topic WHERE name = 'Noodles'),
	'Aglio E Olio',
	,
	00:01:00,
	00:20:00,
	00:01:00
);

/*
INSERT INTO topic(name) VALUES ('Recipes');
INSERT INTO topic(name) VALUES ('Equipment');
INSERT INTO topic(name) VALUES ('Safety');
INSERT INTO topic(name) VALUES ('Resources');

INSERT INTO subtopic(name,subtopic_id)
VALUES(
	'Noodles',
	(SELECT id FROM topic WHERE name = 'Recipes')
);
INSERT INTO subtopic(name)
VALUES(
	'Soups',
	(SELECT id FROM topic WHERE name = 'Recipes')
);
INSERT INTO subtopic(name) 
VALUES(
	'Sandwiches',
	(SELECT id FROM topic WHERE name = 'Recipes')
);
INSERT INTO subtopic(name) 
VALUES(
	'Desserts',
	(SELECT id FROM topic WHERE name = 'Recipes')
);
*/


/*
INSERT INTO user(email, password, display_name) VALUES ('bobj@gmail.com', 'bob123jim', 'jim_bob');
INSERT INTO user(email, password, display_name) VALUES ('johnc@oregonstate.edu', '4password3', 'corn_john');
INSERT INTO user(email, password, display_name) VALUES ('beanb@oregonstate.edu', 'benbeanstalk123', 'ben_bean');

--post data
INSERT INTO post(user_id, date, text) 
VALUES (
	(SELECT id FROM user WHERE display_name = 'jim_bob'),
	'2019-08-21', 'holy crap'),
	((SELECT id FROM user WHERE display_name = 'corn_john'),
	'2020-10-05', 'butterfly in the sky'),
	((SELECT id FROM user WHERE display_name = 'ben_bean'),
	'2020-11-10', 'testing 1 2 3'
);
*/