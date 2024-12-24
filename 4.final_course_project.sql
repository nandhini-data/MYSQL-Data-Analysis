use mavenmovies;
/* Task 1:Pull the manager names at each store with the full address of each property
(street address,district,city and country)*/
select * from store;
select * from staff;
select * from address;
select * from city;
select * from country;

select store.store_id,staff.first_name as manager_first_name,staff.last_name as manager_last_name,address.address,address.district,city.city,country.country
from store
inner join staff on staff.staff_id =store.manager_staff_id
inner join address on address.address_id = store.address_id
inner join city on city.city_id = address.city_id
inner join country on country.country_id =city.country_id;


/* Task 2:Pull list of each inventory item you have stocked,including
store_id number,the inventory_id,name of film,film rating,rental rate, replacement cost.*/

select inventory.inventory_id,
inventory.store_id,film.title,film.description,
film.rating,film.rental_rate,film.replacement_cost
from inventory
left join film on inventory.film_id =film.film_id;