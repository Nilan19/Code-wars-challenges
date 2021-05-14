
/*
Given film_actor and film tables from the DVD Rental sample database find all movies both Sidney Crowe (actor_id = 105) 
and Salma Nolte (actor_id = 122) cast in together and order the result set alphabetically.
*/


select film.title
from film join film_actor on film.film_id = film_actor.film_id
where film_actor.actor_id in (105)
intersect
select film.title 
from film join film_actor on film.film_id = film_actor.film_id
where film_actor.actor_id in (122)

