-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';
    -- Answer 2


-- 2. How many payments were made between $3.99 and $5.99?

SELECT COUNT(*)
from payment
WHERE amount BETWEEN 3.99 AND 5.99
    -- ANSWER 0

-- 3. What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(*)
FROM inventory
GROUP BY film_id;
    --ANSWER mulyiples with 8


-- 4. How many customers have the last name ‘William’?

SELECT COUNT(last_name) 
FROM customer 
WHERE last_name = 'William';
    --ANSWER 0


-- 5. What store employee (get the id) sold the most rentals?

SELECT staff_id, COUNT(rental_id)
FROM rental 
GROUP BY staff_id 
ORDER BY count(rental_id);
    --ANSWER 1 with 8,040


-- 6. How many different district names are there?

SELECT COUNT (DISTINCT district) 
FROM address;
    --ANSWER 378


-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id, COUNT(DISTINCT actor_id) 
FROM film_actor 
GROUP BY film_id
ORDER BY count(DISTINCT actor_id);
    --ANSWER 508 had 15 actors


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%es';
    --ANSWER 6


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT COUNT(*)
FROM (SELECT amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT (amount) > 250) AS sub
    --Answer 3



-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

SELECT COUNT(DISTINCT rating)
FROM film;
    --ANSWER 5

SELECT rating, COUNT(title)
FROM film 
GROUP BY rating
ORDER BY count(title);
    --ANSWER PG-13 223