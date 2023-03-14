-- Hello World!
-- This is a comment!


-- sql version of Hello World
SELECT *   -- what?
FROM actor;  -- from where?

SELECT *
FROM address;

-- let's grab the first and last name

SELECT first_name, last_name
FROM actor;

-- WHERE clause
-- this is how we filter out the results of our conditionals

SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Single quotes for Strings, literals vs Double for Database identifiers


-- We can use LIKE instead of just = for strings
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- wildcards for use with like:  _    and   %
 -- % is a true wildcard - any character AND number of characters
 -- _ is one character wildcard

 SELECT first_name, last_name
FROM actor
WHERE first_name LIKE '%es';


-- 3 underscores means starts with J and 3 letters. . . 
 SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J___';

 SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J__%';

-- comparison operators:
--    = and like examples above
--Greater/less >      <     <=     >=    all valid as usual
-- NOT equal is <>


SELECT * from address;

SELECT *
FROM address
WHERE district like 'Texas';

SELECT * FROM payment;


-- let's find customers who paid more than $2
SELECT customer_id, amount
from payment
WHERE amount > 2;

-- query customers who paid less than 7.99

SELECT customer_id, amount
from payment
WHERE amount < 7.99;

SELECT customer_id, amount
from payment
WHERE amount <= 7.99;

-- we can use OR AND with the WHERE clause


SELECT customer_id, amount
from payment
WHERE amount < 7.99 AND amount > 0;

SELECT customer_id, amount
FROM payment
WHERE amount > 9000 OR amount > 9999;

-- We can also use BETWEEN, works the same as <= >=


SELECT customer_id, amount
from payment
WHERE amount BETWEEN 0 AND 7.99;

-- ORDER BY


SELECT customer_id, amount
from payment
WHERE amount BETWEEN 0 AND 7.99
ORDER BY amount ASC; -- switch back and forth with ASC, DESC, DESC is default


-- not equal
SELECT customer_id, amount
from payment
WHERE amount <> 0.00
ORDER BY amount ASC;


SELECT customer_id, amount
from payment
WHERE amount > 10;



SELECT * from customer; -- checking out cus table

SELECT first_name, last_name  
from customer
where customer_id = 341;

-- Peter Menard is our big baller!  

-- SQL aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- query to show the sum of amounts greater than 5.99

SELECT SUM(amount)
from payment
WHERE amount > 5.99;

-- same but averages!
SELECT AVG(amount)
from payment
WHERE amount > 5.99;

-- count
SELECT COUNT(amount)
from payment;

SELECT * from payment;


-- what about idividual amounts?  Unique. . .  DISTINCT

SELECT COUNT(DISTINCT amount)
from payment
WHERE amount > 5.99;

-- query to display min amount greater than 6.99
SELECT Min(amount)
FROM payment
WHERE amount > 6.99;


-- query to display MAX amount greater than 6.99
SELECT MAX(amount) AS Biggest_over_7
FROM payment
WHERE amount > 6.99;

-- GROUP BY
-- any column not in aggregate must be in group by used in conjunction
-- with aggregates to modify behavior or aggregate groups rows


-- example of note from above!
SELECT amount, count(amount), sum(amount)
from payment
GROUP BY amount
ORDER BY sum(amount) DESC;


-- bring it back to more straight-forward examples
SELECT amount
FROM payment
where amount =6.99

SELECT amount, count(amount)
from payment
GROUP BY amount
order by amount;


-- let's look at customer ids with summed amounts for those ids
SELECT customer_id, SUM(amount)
from payment
GROUP BY customer_id
order by customer_id DESC;

SELECT customer_id, amount
from payment
GROUP BY amount, customer_id
order by customer_id DESC;


SELECT customer_id, sum(amount)
from payment
Group by customer_id
ORDER BY customer_id;


-- query display cus_ids that show up more than 5 times

SELECT count(customer_id), email
from customer
where email like 'j__.w%'
GROUP BY email
HAVING count(customer_id) > 0;


-- general rules . . . 


SELECT customer_id, SUM(amount)  -- what you want to see
from payment                    -- from where?
                        -- these are our basic building blocks!
WHERE customer_id BETWEEN 70 and 80  -- how or filter
GROUP BY customer_id            -- using aggregates
HAVING sum(amount) > 150        -- this is the how for aggregates or filter
ORDER BY customer_id
LIMIT 3                      -- always at/towards end
OFFSET 1;

SELECT * 
from payment
where amount < -427.01
LIMIT 25
OFFSET 8


-- clauses we've talked about so far:
-- select <columns> <aggregates>
-- from <table>
-- where <conditional>
-- group by <columns>
-- having <conditional>
-- order by <column>
