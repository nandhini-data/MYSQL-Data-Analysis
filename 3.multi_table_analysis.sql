use mavenmovies;

select * from inventory;

select distinct l.inventory_id
from inventory as l
inner join rental as r
on l.inventory_id = r.inventory_id
limit 5000;

select * from rental;

-- Task 1:Pull the list of each film in inventory

select * from inventory;
select * from film;

SELECT 
    inventory.inventory_id,
    inventory.store_id,
    film.title,
    film.description
FROM
    inventory
        INNER JOIN
    film ON inventory.film_id = film.film_id;

select * from actor;
select * from film_actor;

select actor.first_name,actor.last_name,count(film_actor.film_id) as no_of_films
from actor left join
film_actor on actor.actor_id = film_actor.actor_id
group by actor.first_name,
actor.last_name;

-- Task 2:How many actors are  listed for each film title.

select * from film_actor;
select * from film;

select film.title,count(film_actor.actor_id) as number_of_actors
from film
left join film_actor
on film.film_id = film_actor.film_id
group by film.title;

