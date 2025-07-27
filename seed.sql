/* 
Author: Danny Regan
Created: 2025-07-27
Last Updated: 2025-07-27
Version: 0.2.0
Description: Mock data for social media app for roommates.
*/

USE `good_noodles`;

-- USERS
INSERT INTO `users` (`username`, `password_hash`, `name`, `tasks_completed`, `points_given`, `points_received`)
VALUES
	('danny', 	'aaD43K!.<h', 	'peen', 		38, 109, 92),
    ('tom', 	'adk82.sl:1', 	'ThomasDaTank', 33, 99, 72),
    ('matty', 	'i203m,', 		'THEY/THEM', 	19, 89, 38),
    ('bob', 	'0a;{]3ms', 	'Rasmodius', 	37, 101, 70),
    ('matti', 	'#jsl5%', 		'joji', 		22, 93, 66);
    
-- TASKS
INSERT INTO tasks (task, base_points, multiplier)
VALUES ('won a game of HeroScape', 500, 50);

-- restock cfreedp, all house chores, heroscape win, 10+ fortnite elims, apex W, carried team to victory in OW, harvested a crop, made baked goods for the house,
-- paid off a debt, played w joji, paid rent, went to the gym, new PR, didn't vape today, hit a blinker, socialized, went to an event, made it to a new season of stardew,
-- unlocked a new Bloons hero,

-- POSTS
INSERT INTO posts (user_id, task_id, comment, likes)
VALUES
	(1, 1, 'Test test test', 3),
    (1, 1, 'I WON', 4),
	(2, 1, 'I\'m so good at hs.', 4),
    (3, 1, 'Biiig win w B Chan', 4),
    (4, 1, 'MingMing', 2),
	(5, 1, 'New heros stink ass', 4);