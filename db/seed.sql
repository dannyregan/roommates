/* 
Author: Danny Regan
Created: 2025-07-27
Last Updated: 2025-08-16
Version: 0.2.0
Description: Mock data for social media app for roommates.
*/

USE `good_noodles`;

-- USERS
INSERT INTO `users` (`username`, `password_hash`, `name`)
VALUES
	('danny', 	'aaD43K!.<h', 	'peen' 		),
    ('tom', 	'adk82.sl:1', 	'ThomasDaTank' ),
    ('matty', 	'i203m,', 		'D20'	),
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
INSERT INTO tasks (category_id, task_name, task, base_points, like_points)
VALUES
	(1, 'CFree Restock', 'Restocked CFreeDP', 6, 2),
    (2, 'HeroScape Win', 'Won a game of HeroScape', 12, 2),
    (3, 'Fort Win', 'Sent 10+ kids back to the Battle Bus', 4, 2),
    (3, 'Apex Win', 'Won a game of Apex Legends', 9, 2),
    (3, 'OW Win', 'Carried a team to victory in OverWatch', 2, 2),
    (3, 'New Stardew Season', 'Made it into a new season of Stardew Valley', 6, 2),
    (3, 'New Bloons Hero', 'Unlocked a new Bloons Hero', 5, 2),
    (1, 'Baked Goods For House', 'Made baked goods for the house', 10, 4),
    (1, 'Cooked Meal For House', 'Cooked for the house', 10, 4),
    (4, 'Paid Off a Debt', 'Paid off a debt', 50, 5),
    (4, 'Rent Payment', 'Paid rent on time', 12, 4),
    (5, 'Games With Joji', 'Played with Joji', 3, 1),
    (6, 'Work Out', 'Worked out', 4, 2),
    (6, 'No Vape Day', 'Didn\'t vape today', 4, 3),
    (7, 'Socialization', 'Socialized', 5, 2),
    (8, 'At an Event', 'Went to an event', 5, 2),
    (8, 'Raise', 'Got a raaaise', 50, 5),
    (8, 'Promotion', 'Made moves and earned a promotion', 75, 5),
    (9, 'Stoned', 'Hit a blinker', 1, 1),
    (10, 'Deep Work (4 Hours)', 'Made new neural connections through 4 hours of deep work', 6, 3),
    (7, 'Jam Session', 'Enjoyed a jam sesh', 5, 2),
    (7, 'Host a Gathering', 'Hosted a gathering', 6, 3),
    (1, 'Restaurant Review', 'Left a restaurant review for you to read', 2, 1),
    (7, 'Get Roommate into New Game', 'Got a roommate into a new game', 3, 2),
    (13, 'Harvest a Crop', 'Harvested a crop irl', 15, 2),
    (11, 'Hike', 'Went for a hike', 4, 2),
    (6, 'Bike/Scooter to Work', 'Biked/scootered to work', 4, 2),
    (12, 'Take Out the Trash', 'Took out the trash', 5, 3),
    (12, 'Clean the Bathroom', 'Thoroughly and deeply cleaned the bathroom', 7, 3),
    (12, 'Tidy Up', 'Tidied up', 3, 3),
    (12, 'Clean Room', 'Cleaned their dirty little room', 3, 2),
    (12, 'Clean Dishes', 'Did the dishes', 4, 3),
    (12, 'Empty Dishwasher', 'Unloaded the dishwasher', 6, 3),
	(12, 'Make Someoen a Beverage', 'Made a beverage for someone', 3, 2),
    (12, 'Yard Work', 'Did yard work', 5, 2),
    (12, 'Clean Fridge', 'Cleaned the stinky fridge', 7, 3),
    (13, 'Propagate Plant', 'Propagated a plant and it\'s still alive', 5, 2),
    (6, 'Meditate', 'Meditated', 3, 1),
    (6, 'Take Meds', 'Took my meds', 1, 2),
    (9, 'Candle', 'Lit a candle', 1, 1),
    (9, 'Decorate', 'Decorated', 3, 2),
    (6, 'Cut Nails', 'Cut my long ass nails', 1, 1),
    (6, 'Therapy', 'Went to therapy', 4, 4),
    (10, 'Finished a Book', 'Finished a book', 8, 2),
    (12, 'Fixing Something', 'Fixed something', 5, 3),
    (13, 'Water Plants', 'Watered plants', 4, 2),
    (6, '10K Steps Today', 'Took 10k steps today', 5, 2),
    (8, 'New Job', 'Got a new job', 75, 4),
    (3, 'Publish a Video Game', 'Published a video game', 50, 3),
    (2, 'Board Game Win', 'Won a board game', 8, 2)
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