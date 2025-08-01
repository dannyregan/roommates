/* 
Author: Danny Regan
Created: 2025-07-27
Last Updated: 2025-07-29
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
    
-- CATEGORIES
INSERT INTO categories (category)
VALUES
	('Food & Kitchen'),
    ('Games'),
    ('Video Games'),
    ('Money'),
    ('Animals'),
    ('Health'),
    ('Friends'),
    ('Professional'),
    ('Vibes'),
    ('Productivity'),
    ('Outdoors')
    ;
    
-- TASKS
INSERT INTO tasks (category_id, task, base_points, like_points)
VALUES
	(1, 'restocked CFreeDP', 5, 2),
    (2, 'won a game of HeroScape', 12, 2),
    (3, 'sent 10+ kids back to the Battle Bus', 4, 2),
    (3, 'won a game of Apex Legends', 12, 2),
    (3, 'carried a team to victory in OverWatch', 2, 2),
    (3, 'made it into a new season of Stardew Valley', 6, 2),
    (3, 'unlocked a new Bloons Hero', 5, 2),
    (1, 'made baked goods for the house', 10, 4),
    (1, 'cooked for the house', 10, 4),
    (4, 'paid off a debt', 40, 5),
    (4, 'paid rent on time', 12, 4),
    (5, 'played with Joji', 3, 1),
    (6, 'went to the gym', 4, 2),
    (6, 'didn\'t vape today', 4, 3),
    (7, 'socialized', 6, 3),
    (8, 'went to an event', 5, 2),
    (8, 'got a fuckin\' raise babyyy', 50, 5),
    (8, 'made moves and earned a promotion', 75, 5),
    (9, 'hit a blinker', 2, 2),
    (10, 'made new neural connections through 4 hours of deep work', 6, 3),
    (7, 'hosted a jam sesh', 5, 2),
    (7, 'hosted a gathering', 5, 3),
    (1, 'left a restaurant review for you to read', 2, 1),
    (7, 'got a roommate into a new game', 3, 2),
    (11, 'harvested a crop', 15, 2),
    (11, 'went for a hike', 4, 2)
    ;

-- POSTS
INSERT INTO posts (user_id, task_id, comment, likes)
VALUES
	(1, 1, 'Test test test', 3),
    (1, 1, 'I WON', 4),
	(2, 1, 'I\'m so good at hs.', 4),
    (3, 1, 'Biiig win w B Chan', 4),
    (4, 1, 'MingMing', 2),
	(5, 1, 'New heros stink ass', 4);