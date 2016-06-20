## SQL QuestiONs

First create a database called fringe_shows
```
  #terminal
  psql
  create database fringe_shows;
  \q
```

Populate the data using the script - fringeshows.sql
```
  #terminal
  psql -d fringe_shows -f fringeshows.sql
```

Using the SQL Database file given to you as the source of data to answer the questiONs.  Copy the SQL command you have used to get the answer, and paste it below the questiON, alONg with the result they gave.


## SectiON 1

  RevisiON of cONcepts that we've learnt in SQL today

  1. Select the names of all users.

  SELECT name FROM users;

  Rick Henri
  Jay Chetty
  Keith Douglas
  Ashleigh Adams
  Euan Blackledge
  Chris Flint
  Nico di Lillo
  Joe Maher
  Marie Moyles
  Iain Stewart
  Megan Strachan
  Russell Williams
  Sam Werngren
  Natalie SimpsON
  Davide de Lerma
  Josh Kearns
  Renwick Drysdale
  Brian Morrice

  2. Select the names of all shows that cost less than £15.

  SELECT name FROM shows WHERE shows.price < 15;

  Le Haggis
  Paul Dabek Mischief 
  Best of Burlesque
  Two become ONe
  Urinetown
  Two girls, ONe cup of comedy

  3. Insert a user with the name "Val GibsON" into the users table.

  INSERT INTO "users" (name) VALUES
  ('Val GibsON');

  4. Insert a record that Val GibsON wants to attend the show "Two girls, ONe cup of comedy".

  INSERT INTO "shows_users" (show_id, user_id) VALUES ((SELECT id FROM shows WHERE name = 'Two girls, ONe cup of comedy'), ( SELECT id FROM users WHERE name = 'Val GibsON'));

SELECT * FROM shows_users WHERE user_id = ( SELECT id FROM users WHERE name = 'Val GibsON')

 id | show_id | user_id 
----+---------+---------
 88 |      12 |      20


  5. Updates the name of the "Val GibsON" user to be "Valerie GibsON".

  UPDATE users SET name = 'Valerie GibsON' WHERE name = 'Val GibsON';
  SELECT name FROM users;

  Rick Henri
  Jay Chetty
  Keith Douglas
  Ashleigh Adams
  Euan Blackledge
  Chris Flint
  Nico di Lillo
  Joe Maher
  Marie Moyles
  Iain Stewart
  Megan Strachan
  Russell Williams
  Sam Werngren
  Natalie SimpsON
  Davide de Lerma
  Josh Kearns
  Renwick Drysdale
  Brian Morrice
  Valerie GibsON


  6. Deletes the user with the name 'Valerie GibsON'.

  DELETE FROM users WHERE name = 'Valerie GibsON';
  SELECT name FROM users;

  Rick Henri
  Jay Chetty
  Keith Douglas
  Ashleigh Adams
  Euan Blackledge
  Chris Flint
  Nico di Lillo
  Joe Maher
  Marie Moyles
  Iain Stewart
  Megan Strachan
  Russell Williams
  Sam Werngren
  Natalie SimpsON
  Davide de Lerma
  Josh Kearns
  Renwick Drysdale
  Brian Morrice

  7. Deletes the shows for the user you just deleted.

DELETE FROM "shows_users" WHERE user_id = 20


## SectiON 2

  This sectiON involves more complex queries.  You will need to go and find out about aggregate funciONs in SQL to answer some of the next questiONs.

  9. Select the names and prices of all shows, ordered by price in ascending order.

  SELECT shows.name, shows.price FROM shows ORDER BY shows.price ASC;

                    name                   | price 
  -----------------------------------------+-------
   Two girls, ONe cup of comedy            |  6.00
   Best of Burlesque                       |  7.99
   Two become ONe                          |  8.50
   Urinetown                               |  8.50
   Paul Dabek Mischief                     | 12.99
   Le Haggis                               | 12.99
   Joe Stilgoe: SONgs ON Film – The Sequel | 16.50
   Game of ThrONes - The Musical           | 16.50
   Shitfaced Shakespeare                   | 16.50
   AaabeduatiON – A Magic Show             | 17.99
   Camille O'Sullivan                      | 17.99
   BalletrONics                            | 32.00
   Edinburgh Royal Tattoo                  | 32.99
  (13 rows)


  10. Select the average price of all shows.

  SELECT AVG(shows.price) FROM shows;
  15.9569230769230769 (£15.96)


  11. Select the price of the least expensive show.

  SELECT MIN(shows.price) FROM shows;
   min  
  ------
   6.00
  (1 row)

  12. Select the sum of the price of all shows.

  SELECT SUM(shows.price) FROM shows;
    sum   
  --------
   207.44
  (1 row)

  13. Select the sum of the price of all shows whose prices is less than £20.

SELECT SUM(shows.price) FROM shows WHERE shows.price < 20;

  sum   
--------
 142.45
(1 row)


  14. Select the name and price of the most expensive show.

  SELECT shows.name, shows.price FROM shows WHERE shows.price = (SELECT MAX(shows.price) FROM SHOWS);

            name          | price 
  ------------------------+-------
   Edinburgh Royal Tattoo | 32.99
  (1 row)


  15. Select the name and price of the secONd from cheapest show.

SELECT shows.name, shows.price FROM shows ORDER BY price LIMIT 1 OFFSET 1;

       name        | price 
-------------------+-------
 Best of Burlesque |  7.99
(1 row)


  16. Select the names of all users whose names start with the letter "N".

  SELECT users.name FROM users WHERE users.name LIKE 'N%';

        name       
  -----------------
   Nico di Lillo
   Natalie SimpsON
  (2 rows)


  17. Select the names of users whose names cONtain "er".

SELECT users.name FROM users WHERE users.name LIKE '%er%';

      name       
-----------------
 Joe Maher
 Sam Werngren
 Davide de Lerma
(3 rows)



## SectiON 3

  The following questiONs can be answered by using nested SQL statements but ideally you should learn about JOIN clauses to answer them.

  18. Select the time for the Edinburgh Royal Tattoo.

  SELECT "times"."time" FROM "times"
  INNER JOIN shows ON shows.id = show_id WHERE shows.name = 'Edinburgh Royal Tattoo';

   time  
  -------
   22:00
  (1 row)


  19. Select the number of users who want to see "Shitfaced Shakespeare".

  SELECT COUNT(users) FROM shows_users
  INNER JOIN users ON users.id = shows_users.user_id 
  INNER JOIN shows ON shows.id = shows_users.show_id
  WHERE shows.name = 'Shitfaced Shakespeare';

   count 
  -------
       7
  (1 row)



  20. Select all of the user names and the count of shows they're going to see.

  SELECT users, COUNT(shows) FROM shows_users
  INNER JOIN users ON users.id = shows_users.user_id
  INNER JOIN shows ON shows.id = shows_users.show_id
  GROUP BY users;



   (1,"Rick Henri")        |     5
   (2,"Jay Chetty")        |     5
   (3,"Keith Douglas")     |     6
   (4,"Ashleigh Adams")    |     4
   (5,"Euan Blackledge")   |     4
   (6,"Chris Flint")       |     4
   (7,"Nico di Lillo")     |     4
   (8,"Joe Maher")         |     5
   (9,"Marie Moyles")      |     7
   (10,"Iain Stewart")     |     6
   (11,"Megan Strachan")   |     5
   (12,"Russell Williams") |     6
   (13,"Sam Werngren")     |     5
   (14,"Natalie SimpsON")  |     9
   (15,"Davide de Lerma")  |     7
  (15 rows)


  21. SELECT all users who are going to a show at 17:15.

  SELECT users.name FROM shows_users
  INNER JOIN users ON users.id = shows_users.user_id
  INNER JOIN "times" ON "times".show_id = shows_users.show_id
  WHERE "times"."time" = '17:15';

  Rick Henri
  Keith Douglas
  Euan Blackledge
  Joe Maher
  Marie Moyles
  Sam Werngren
  Davide de Lerma
  Megan Strachan
  Russell Williams
  Sam Werngren
  Iain Stewart
  Natalie Simpson









