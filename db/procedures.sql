/* 
Author: Danny Regan
Created: 2025-07-27
Last Updated: 2025-08-16
Version: 0.2.0
Description: Stored procedures for social media app for roommates.
*/

USE `good_noodles`;

-- CREATE POST --
DROP PROCEDURE IF EXISTS CreatePost;
DELIMITER $$
CREATE PROCEDURE CreatePost(IN input_user_id INT, IN input_task_id INT, IN input_comment VARCHAR(255))
BEGIN

	-- Input the info into posts table
	DECLARE v_base_points INT;
    
	SELECT base_points
    INTO v_base_points
	FROM tasks
	WHERE task_id = input_task_id;

	INSERT INTO posts (user_id, task_id, comment, total_points)
	VALUES (input_user_id, input_task_id, input_comment, v_base_points);
    
    -- The author's total points
    UPDATE users
    SET
        total_points = total_points + v_base_points
	WHERE user_id = input_user_id;
END$$
DELIMITER ;

Call CreatePost(1, 25, 'Pumpkinos');

-- LIKE POST --
DROP PROCEDURE IF EXISTS LikePost;
DELIMITER $$
CREATE PROCEDURE LikePost(IN input_post_id INT, IN input_user_id INT)
BEGIN
	DECLARE v_like_points INT;
    DECLARE v_base_points INT;
    DECLARE v_author_id INT;
    
    -- Get the task points and the author's ID
    SELECT t.like_points, t.base_points, p.user_id
    INTO v_like_points, v_base_points, v_author_id
    FROM posts p
		JOIN tasks t
			ON p.task_id = t.task_id
	WHERE p.post_id = input_post_id;
    
    -- The liker's points given and total points
    UPDATE users
    SET
		points_given = points_given + v_like_points,
        total_points = total_points + v_like_points
	WHERE user_id = input_user_id;
    
    -- The author's points received and total points
    UPDATE users
    SET
		points_received = CEIL(points_received + (v_like_points / 2)),
        total_points    = CEIL(total_points    + (v_like_points / 2))
	WHERE user_id = v_author_id;
    
    -- The post's like count and total_points
    UPDATE posts
    SET
		likes = likes + 1,
        total_points = CEIL(total_points    + (v_like_points / 2))
	WHERE post_id = input_post_id;
END$$
DELIMITER ;

call likepost(8, 2);
call getpoststats(8);
call getuserstats(1);
call getuserstats(2);

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
		(SELECT COUNT(*) FROM posts WHERE posts.user_id = input_user_id)  AS tasks_completed,
		(SELECT points_given FROM users WHERE user_id = input_user_id)    AS points_given,
		(SELECT points_received FROM users WHERE user_id = input_user_id) AS points_received,
		(SELECT SUM(points_given + points_received) FROM users WHERE user_id = input_user_id) AS total_points
	FROM users
	WHERE user_id = input_user_id;
END$$
DELIMITER ;

CALL GetUserStats(2);

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
call userfeed(2);
call feed();

-- UPDATE NAME -- 
DROP PROCEDURE IF EXISTS UpdateName;
DELIMITER $$
CREATE PROCEDURE UpdateName(IN input_user_id INT, IN input_name VARCHAR(50))
BEGIN
	UPDATE users
    SET name = input_name
    WHERE user_id = input_user_id;
END$$
DELIMITER ;

-- ADD USER --
DROP PROCEDURE AddUser;
DELIMITER $$
CREATE PROCEDURE AddUser(IN input_username VARCHAR(50), IN input_password_hash VARCHAR(255), IN input_name VARCHAR(50))
BEGIN
	INSERT INTO users (username, password_hash, name)
    VALUES (input_username, input_password_hash, input_name);
END$$
DELIMITER ;

call createpost(6, 19, 'black gorilla');
call getpoststats(8);
call likepost(8, 3);
select * from posts where user_id = 6;


-- get a list of the tasks for when people hit the dropdown menu