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
from actor
left join film_actor on actor.actor_id = film_actor.actor_id
group by actor.first_name,actor.last_name;

select *
from actor
left join film_actor on actor.actor_id = film_actor.actor_id;

-- Task 2:How many actors are  listed for each film title.

select * from film_actor;
select * from film;
select * from category;
select * from film_category;

select film.title,count(film_actor.actor_id) as no_of_actors
from film
left join film_actor on film.film_id =film_actor.film_id
group by film.title;

-- Bridging

select film.title,category.name as film_category
from film
inner join film_category on film.film_id = film_category.film_id
inner join category on category.category_id =film_category.category_id;

-- Task 3:Pull the list of actor with each title that they have appear.

select * from actor;
select * from film;
select * from film_actor;

select actor.first_name,actor.last_name,film.title
from actor
inner join film_actor on actor.actor_id =film_actor.actor_id
inner join film on film.film_id = film_actor.film_id;

-- Multi condition joins
-- Task 4:Pull a list of distinct titles and their description,currently available in inventory at store 2

select * from inventory;
select * from film;
select * from store;

select distinct film.title, film.description
from film 
inner join inventory on film.film_id =inventory.film_id
and inventory.store_id =2;

-- Union

select 'advisor' as type,
first_name,last_name from advisor
union 
select 'investor' as type,
first_name,last_name from investor;

-- Task 5:Pull a list of all staff and advisor names

select 'staff member' as type,first_name,last_name
 from staff
 union
 select 'advisor' as type,first_name,last_name
 from advisor;




