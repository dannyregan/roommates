/* 
Author: Danny Regan
Created: 2025-07-27
Last Updated: 2025-07-29
Version: 0.2.0
Description: Stored procedures for social media app for roommates.
*/

USE `good_noodles`;

-- Stats for the post
DROP PROCEDURE IF EXISTS GetPostStats;
DELIMITER $$
CREATE PROCEDURE GetPostStats(IN input_post_id INT)
BEGIN
	SELECT
		u.name,
        p.datetime,
        t.task,
        p.comment,
        p.likes,
        (SELECT CAST(t.base_points + (p.likes * 0.5 * t.like_points) AS UNSIGNED) FROM posts WHERE post_id = input_post_id) AS total_points
	FROM posts p
		JOIN users u ON p.user_id = u.user_id 
		JOIN tasks t ON p.task_id = t.task_id
	WHERE post_id = input_post_id;
END$$
DELIMITER ;

CALL GetPostStats(5);

-- Stats for the user
DROP PROCEDURE IF EXISTS GetUserStats;
DELIMITER $$
CREATE PROCEDURE GetUserStats(IN input_user_id INT)
BEGIN
	SELECT
		name,
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
        CAST(t.base_points + (p.likes * 0.5 * t.like_points) AS UNSIGNED) AS total_points
	FROM posts p
		JOIN users u ON p.user_id = u.user_id 
		JOIN tasks t ON p.task_id = t.task_id
	ORDER BY p.datetime DESC LIMIT 50;
END$$
DELIMITER ;

CALL Feed();

-- USER FEED
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
        CAST(t.base_points + (p.likes * 0.5 * t.like_points) AS UNSIGNED) AS total_points
	FROM posts p
		JOIN users u ON p.user_id = u.user_id 
		JOIN tasks t ON p.task_id = t.task_id
	WHERE u.user_id = input_user_id
	ORDER BY p.datetime DESC LIMIT 50;
END$$
DELIMITER ;

CALL UserFeed(1);

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
call feed();

-- get a list of the tasks for when people hit the dropdown menu

-- AddLike, make sure it affects the score of the post

-- make sure that when a post is created, the user's points increase accordingly.