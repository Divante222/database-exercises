-- In the sakila database,
-- use the actor, film_actor, and film table
-- find all movies that 'Zero Cage' has been in
-- and make a new column that says if the movie
-- is rate R or not

use sakila;

select actor.first_name, actor.last_name, film.film_id, film.title, film.rating,
case 
	when film.rating = 'R' then 'Film R rated'
    else 'not Rated R' 
    end as 'is rated R'
    from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
where actor.first_name = 'Zero'
and actor.last_name = 'Cage';



select * from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id;


select * from actor;
select * from film_actor;
select * from film;