
/* Rank = 5 KYU, https://www.codewars.com/kata/5817b124e7f4576fd00020a2
Given film_actor and film tables from the DVD Rental sample database find all movies both Sidney Crowe (actor_id = 105) 
and Salma Nolte (actor_id = 122) cast in together and order the result set alphabetically.
*/


#My solution:

select film.title
from film join film_actor on film.film_id = film_actor.film_id
where film_actor.actor_id in (105)
intersect
select film.title 
from film join film_actor on film.film_id = film_actor.film_id
where film_actor.actor_id in (122)



#Best solution:

SELECT f.title
FROM film f
JOIN film_actor fa on fa.film_id = f.film_id
WHERE fa.actor_id IN (105,122)
GROUP BY f.film_id
HAVING COUNT(*) = 2
ORDER BY f.title ASC







