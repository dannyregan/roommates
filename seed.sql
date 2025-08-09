/* 
Author: Danny Regan
Created: 2025-07-27
Last Updated: 2025-07-29
Version: 0.2.0
Description: Mock data for social media app for roommates.
*/

USE `good_noodles`;

-- USERS
INSERT INTO `users` (`username`, `password_hash`, `name`)
VALUES
	('danny', 	'aaD43K!.<h', 	'peen' 		),
    ('tom', 	'adk82.sl:1', 	'ThomasDaTank' ),
    ('matty', 	'i203m,', 		'THEY/THEM'	),
    ('bob', 	'0a;{]3ms', 	'Rasmodius'	),
    ('matti', 	'#jsl5%', 		'joji'		);
    
-- CATEGORIES
INSERT INTO categories (category)
VALUES
	('Food'),
    ('Games'), -- 2
    ('Video Games'),
    ('Money'), -- 4
    ('Animals'),
    ('Health'), -- 6
    ('Friends'),
    ('Professional'), -- 8
    ('Vibes'),
    ('Productivity'), -- 10
    ('Outdoors'),
    ('Chores'), -- 12
    ('Plants')
    ;
    
-- TASKS
INSERT INTO tasks (category_id, task, base_points, like_points)
VALUES
	(1, 'restocked CFreeDP', 5, 2),
    (2, 'won a game of HeroScape', 12, 2),
    (3, 'sent 10+ kids back to the Battle Bus', 4, 2),
    (3, 'won a game of Apex Legends', 9, 2),
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
    (7, 'socialized', 5, 2),
    (8, 'went to an event', 5, 2),
    (8, 'got a raaaise', 50, 5),
    (8, 'made moves and earned a promotion', 75, 5),
    (9, 'hit a blinker', 2, 2),
    (10, 'made new neural connections through 4 hours of deep work', 6, 3),
    (7, 'hosted a jam sesh', 5, 2),
    (7, 'hosted a gathering', 6, 3),
    (1, 'left a restaurant review for you to read', 2, 1),
    (7, 'got a roommate into a new game', 3, 2),
    (13, 'harvested a crop irl', 15, 2),
    (11, 'went for a hike', 4, 2),
    (6, 'biked to work', 4, 2),
    (12, 'took out the trash', 5, 3),
    (12, 'thoroughly and deeply cleaned the bathroom', 5, 3),
    (12, 'tidied up', 3, 3),
    (12, 'cleaned their dirty little room', 3, 2),
    (12, 'did the dishes', 4, 3),
    (12, 'unloaded the dishwasher', 6, 3),
	(12, 'made a beverage for someone', 4, 3),
    (12, 'did yard work', 3, 2),
    (12, 'cleaned the stinky fridge', 6, 3),
    (13, 'propagated a plant and it\'s still alive', 5, 2),
    (6, 'meditated', 3, 1),
    (6, 'took my meds', 1, 2),
    (9, 'lit a candle', 1, 1),
    (9, 'decorated', 3, 2),
    (6, 'cut my long ass nails', 1, 1),
    (6, 'went to therapy', 4, 4),
    (10, 'finished a book', 6, 2),
    (12, 'fixed something', 5, 3),
    (13, 'watered plants', 4, 2),
    (6, 'took 10k steps today', 5, 2)
    
    
    -- tracked spending/updated personal budget, household snacks, didn't order out this week
    ;

-- POSTS
INSERT INTO posts (user_id, task_id, comment, likes)
VALUES
	(1, 6, 'next', 3),
    (1, 1, 'I win', 4),
	(2, 19, 'I\'m so high', 4),
    (3, 15, 'Biiig win w B Chan', 4),
    (4, 16, 'I\'m the new CEO', 2),
	(5, 5, 'typical', 4);