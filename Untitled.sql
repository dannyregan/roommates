/* 
Author: Danny Regan
Created: 2025-07-18
Last Updated: 2025-07-24
Version: 0.1.0
Description: Database for managing social media app for roommates.
*/

-- ===================================================
-- ===================================================

/* Creates Database */
DROP DATABASE IF EXISTS `good_noodles`;
CREATE DATABASE IF NOT EXISTS `good_noodles`;
USE `good_noodles`;

-- ===================================================
-- ===================================================

/* Creates Tables */
-- USERS
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
	`user_id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password_hash` VARCHAR(255) NOT NULL,
    `name` VARCHAR(50) NOT NULL UNIQUE,
	-- `following` SMALLINT DEFAULT 0,			-- +1 on follow, -1 on unfollow
	-- `followers` SMALLINT DEFAULT 0,			-- +1 on follow, -1 on unfollow
	`tasks_completed` SMALLINT DEFAULT 0, 	-- VIEW USERSTATS number of posts ( count(*) posts where id = user_id )
    `points_given` INT DEFAULT 0,			-- everytime you hit like, add the multiplier
    `points_received` INT DEFAULT 0,		-- everytime you post, add baseline. everytime they like, add 1/2 the multiplier
	`total_points` INT DEFAULT 0,			-- points_received + points_given
    -- `profile_pic` BLOB,
    PRIMARY KEY (`user_id`)
);

INSERT INTO `users` (`username`, `password_hash`, `name`, `tasks_completed`, `points_given`, `points_received`)
VALUES
	('danny', 	'aaD43K!.<h', 	'peen', 		38, 109, 92),
    ('tom', 	'adk82.sl:1', 	'ThomasDaTank', 33, 99, 72),
    ('matty', 	'i203m,', 		'THEY/THEM', 	19, 89, 38),
    ('bob', 	'0a;{]3ms', 	'Rasmodius', 	37, 101, 70),
    ('matti', 	'#jsl5%', 		'joji', 		22, 93, 66);

-- TASKS
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
	`task_id` INT NOT NULL AUTO_INCREMENT,
    `task` VARCHAR(225),
    `base_points` INT,
    `multiplier` DECIMAL,
    PRIMARY KEY (`task_id`)
);

INSERT INTO tasks (task, base_points, multiplier)
VALUES ('won a game of HeroScape', 500, 50);

-- POSTS
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
	`post_id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `task_id` INT NOT NULL,
    `datetime` DATETIME DEFAULT NOW(),
	`comment` VARCHAR(225),
    `likes` TINYINT DEFAULT 0,			-- +1 whenever someone hits like button (can't unlike)
    `total_points` INT,			-- VIEW POSTS STATS likes * 1/2 multiplier
    PRIMARY KEY (`post_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
    FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`)
);

INSERT INTO posts (user_id, task_id, comment, likes)
VALUES
	(1, 1, 'Test test test', 3),
    (1, 1, 'I WON', 4),
	(2, 1, 'I\'m so good at hs.', 4),
    (3, 1, 'Biiig win w B Chan', 4),
    (4, 1, 'MingMing', 2),
	(5, 1, 'New heros stink ass', 4);

SELECT * FROM USERS;
SELECT * FROM TASKS;
SELECT * FROM POSTS;

-- ===================================================
-- ===================================================

/* Creates Stored Procedures */

-- POST_STATS
DELIMITER $$
CREATE PROCEDURE GetPostStats(IN input_post_id INT)
BEGIN
	SELECT
		u.name,
        p.datetime,
        t.task,
        p.comment,
        p.likes,
        (SELECT CAST(t.base_points + (p.likes * 0.5 * t.multiplier) AS UNSIGNED) FROM posts WHERE post_id = input_post_id) AS total_points
	FROM posts p
		JOIN users u ON p.user_id = u.user_id 
		JOIN tasks t ON p.task_id = t.task_id
	WHERE post_id = input_post_id;
END$$
DELIMITER ;

CALL GetPostStats(5);

-- USER_STATS
DELIMITER $$
CREATE PROCEDURE GetUserStats(IN input_user_id INT)
BEGIN
	SELECT
		name,
		following,
		followers,
		(SELECT COUNT(*) FROM posts WHERE posts.user_id = input_user_id) AS tasks_completed,
		points_given,
		points_received,
		(SELECT SUM(points_given + points_received) FROM users WHERE user_id = input_user_id) AS total_points
	FROM users
	WHERE user_id = input_user_id;
END$$
DELIMITER ;

CALL GetUserStats(1);

-- FEED
DROP PROCEDURE IF EXISTS Feed;
DELIMITER $$
CREATE PROCEDURE Feed()
BEGIN
	SELECT
		u.name,
        p.datetime,
        t.task,
        p.comment,
        p.likes,
        CAST(t.base_points + (p.likes * 0.5 * t.multiplier) AS UNSIGNED) AS total_points
	FROM posts p
		JOIN users u ON p.user_id = u.user_id 
		JOIN tasks t ON p.task_id = t.task_id
	ORDER BY p.datetime DESC LIMIT 50;
END$$
DELIMITER ;

CALL Feed();

-- USER_FEED
DROP PROCEDURE IF EXISTS UserFeed;
DELIMITER $$
CREATE PROCEDURE UserFeed(IN input_user_id INT)
BEGIN
	SELECT
		u.name,
        p.datetime,
        t.task,
        p.comment,
        p.likes,
        CAST(t.base_points + (p.likes * 0.5 * t.multiplier) AS UNSIGNED) AS total_points
	FROM posts p
		JOIN users u ON p.user_id = u.user_id 
		JOIN tasks t ON p.task_id = t.task_id
	WHERE u.user_id = input_user_id
	ORDER BY p.datetime DESC LIMIT 50;
END$$
DELIMITER ;

CALL UserFeed(1);

-- AddFollower
-- UnFollower

-- AddLike
-- Create post
DROP PROCEDURE IF EXISTS CreatePost;
DELIMITER $$
CREATE PROCEDURE CreatePost(
	IN input_user_id INT,
    IN input_task_id INT,
    IN input_comment VARCHAR(225)
)
BEGIN
	INSERT INTO posts (user_id, task_id, comment, total_points)
    VALUES (
		input_user_id,
        input_task_id,
        input_comment,
        (SELECT base_points FROM tasks WHERE task_id = input_task_id)
	);
END$$
DELIMITER ;

CALL CreatePost(2, 1, 'I LOVE HEROSCAPE');
call userfeed(2);

-- user_id, task_id, comment
-- user_id, task_id, datetime, comment, total_points (base_points)

-- get a list of the tasks


-- restock cfreedp, all house chores, heroscape win, 10+ fortnite elims, apex W, carried team to victory in OW, harvested a crop, made baked goods for the house,
-- paid off a debt, played w joji, paid rent, went to the gym, new PR, didn't vape today, hit a blinker, socialized, went to an event, made it to a new season of stardew,
-- unlocked a new Bloons hero,

Error Code: 1136. Column count doesn't match value count at row 1
