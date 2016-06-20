-- SELECT name FROM users;
-- SELECT * FROM shows_users;

--   INSERT INTO "shows_users" (show_id, user_id) VALUES ((SELECT id FROM shows WHERE name = 'Two girls, ONe cup of comedy'), ( SELECT id FROM users WHERE name = 'Val GibsON'));

-- SELECT * FROM shows_users WHERE user_id = ( SELECT id FROM users WHERE name = 'Valerie GibsON')


-- DELETE FROM users WHERE name = 'Val GibsON'

-- UPDATE users SET name = 'Valerie GibsON' WHERE name = 'Val GibsON';
-- SELECT name FROM users;


-- DELETE FROM users WHERE name = 'Valerie GibsON';
-- SELECT name FROM users;

-- DELETE FROM "shows_users" WHERE user_id = 20


-- SELECT shows.name, shows.price FROM shows ORDER BY shows.price ASC;

-- SELECT AVG(shows.price) FROM shows;

-- SELECT MIN(shows.price) FROM shows;

-- SELECT SUM(shows.price) FROM shows;


-- SELECT SUM(shows.price) FROM shows WHERE shows.price < 20;

-- SELECT shows.name, shows.price FROM shows WHERE shows.price = (SELECT MAX(shows.price) FROM SHOWS);

-- SELECT shows.name, shows.price FROM shows ORDER BY price LIMIT 1 OFFSET 1;

-- SELECT users.name FROM users WHERE users.name LIKE '%er%';

-- SELECT victims.name AS victim_name, zombies.name AS zombie_name, bitings.infected_ON FROM victims
-- INNER JOIN bitings ON bitings.victim_id = victims.id
-- INNER JOIN zombies ON bitings.zombie_id = zombies.id WHERE zombies.name = 'Drooly Doris';

-- SELECT "times"."time" FROM "times"
-- INNER JOIN shows ON shows.id = show_id WHERE shows.name = 'Edinburgh Royal Tattoo';

-- SELECT COUNT(users) FROM shows_users
-- INNER JOIN users ON users.id = shows_users.user_id 
-- INNER JOIN shows ON shows.id = shows_users.show_id
-- WHERE shows.name = 'Shitfaced Shakespeare';

-- SELECT users FROM shows_users
-- INNER JOIN users ON users.id = shows_users.user_id
-- INNER JOIN shows ON shows.id = shows_users.show_id;

-- SELECT users, COUNT(shows) FROM shows_users
-- INNER JOIN users ON users.id = shows_users.user_id
-- INNER JOIN shows ON shows.id = shows_users.show_id
-- GROUP BY users;

-- SELECT users.name FROM shows_users
-- INNER JOIN users ON users.id = shows_users.user_id
-- INNER JOIN "times" ON "times".show_id = shows_users.show_id
-- WHERE "times"."time" = '17:15';












