/* 
Author: Danny Regan
Created: 2025-07-27
Last Updated: 2025-07-29
Version: 0.2.0
Description: Views for social media app for roommates.
*/

USE `good_noodles`;

DROP VIEW IF EXISTS `task_info_view`;
CREATE VIEW `task_info_view` AS
	SELECT
		c.category AS Category,
        CONCAT('Danny ', t.task) AS Task,
        t.base_points AS `Base Points`,
        t.like_points AS `Points for liking the post`,
        CAST(like_points * 0.5 AS DECIMAL) AS `Points per like`
	FROM tasks t
    JOIN categories c ON t.category_id = c.category_id
    ORDER BY c.category;
    
SELECT * FROM task_info_view;
    
	`task_id` INT NOT NULL AUTO_INCREMENT,
	`category_id` INT,
--     `subcategory` VARCHAR(50),
    `task` VARCHAR(225),
    `base_points` INT,
    `like_points` INT,
    PRIMARY KEY (`task_id`),
    FOREIGN KEY (`category_id`) REFERENCES `categories`(`category_id`)
    
CREATE TABLE IF NOT EXISTS `categories` (
	`category_id` INT NOT NULL AUTO_INCREMENT,
	`category` VARCHAR(50),
    PRIMARY KEY (`category_id`)
);