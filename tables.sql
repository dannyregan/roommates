/* 
Author: Danny Regan
Created: 2025-07-27
Last Updated: 2025-07-27
Version: 0.2.0
Description: Table creation for social media app for roommates.
*/

USE `good_noodles`;

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

-- TASKS
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
	`task_id` INT NOT NULL AUTO_INCREMENT,
    `task` VARCHAR(225),
    `base_points` INT,
    `multiplier` DECIMAL,
    PRIMARY KEY (`task_id`)
);

-- POSTS
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
	`post_id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `task_id` INT NOT NULL,
    `datetime` DATETIME DEFAULT NOW(),
	`comment` VARCHAR(225),
    `likes` TINYINT DEFAULT 0,			-- +1 whenever someone hits like button (can't unlike)
    `total_points` INT,					-- VIEW POSTS STATS likes * 1/2 multiplier
    PRIMARY KEY (`post_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
    FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`)
);

SELECT * FROM USERS;
SELECT * FROM TASKS;
SELECT * FROM POSTS;