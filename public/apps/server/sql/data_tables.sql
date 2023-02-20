DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `subtopic` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(255),
	`subtopic_id` int(11)
) ENGINE=InnoDB;

CREATE TABLE `recipe`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	'recipe_id' int(11),
	'image' blob,
	'text' text
) ENGINE=InnoDB;

DESCRIBE topic;
DESCRIBE subtopic;
DESCRIBE recipe;

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