use mavenmovies;
/* Task 1:Pull the manager names at each store with the full address of each property
(street address,district,city and country)*/


select * from store;
select * from staff;
select * from address;
select * from city;
select * from country;

SELECT 
    store.store_id,
    staff.first_name AS manager_first_name,
    staff.last_name AS manager_last_name,
    address.address,
    address.district,
    city.city,
    country.country
FROM
    store
        INNER JOIN
    staff ON staff.staff_id = store.manager_staff_id
        INNER JOIN
    address ON address.address_id = store.address_id
        INNER JOIN
    city ON city.city_id = address.city_id
        INNER JOIN
    country ON country.country_id = city.country_id;


/* Task 2:Pull list of each inventory item you have stocked,including
store_id number,the inventory_id,name of film,film rating,rental rate, replacement cost.*/

SELECT 
    inventory.inventory_id,
    inventory.store_id,
    film.title,
    film.description,
    film.rating,
    film.rental_rate,
    film.replacement_cost
FROM
    inventory
        LEFT JOIN
    film ON inventory.film_id = film.film_id;



select * from inventory;

/* Task 3: From the same list of films pulled,provide a summary level overview of your inventory.
Like to know how many inventory items you have with each rating at each store.*/


SELECT 
    COUNT(inventory.inventory_id) AS no_of_inventory,
    film.rating,
    inventory.store_id
FROM
    inventory
        LEFT JOIN
    film ON inventory.film_id = film.film_id
GROUP BY film.rating , inventory.store_id;

select * from store;
select * from film_category;
select * from film;


/* Task 4: Pull the record of no of film as well as average replacement cost, total replacement cost
sliced by store and film category*/

SELECT 
    inventory.store_id,
    category.name,
    COUNT(inventory.film_id) AS no_of_films,
    AVG(film.replacement_cost) as average_replacement_cost,
    SUM(film.replacement_cost) as total_replacement_cost
FROM
    inventory
        LEFT JOIN
    film ON inventory.film_id = film.film_id
        LEFT JOIN
    film_category ON film.film_id = film_category.film_id
        LEFT JOIN
    category ON film_category.category_id = category.category_id
GROUP BY inventory.store_id , category.name;

select * from customer;
select * from address;
select * from city;
select * from country;


/* Task 5: Provide a list of all cutomer name,which store they go to whether or not they are currently active
and their full address-street address,city and country */

SELECT 
    customer.active,
    customer.store_id,
    customer.first_name,
    customer.last_name,
    address.address,
    city.city,
    country.country
FROM
    customer
        LEFT JOIN
    address ON customer.address_id = address.address_id
        LEFT JOIN
    city ON address.city_id = city.city_id
        LEFT JOIN
    country ON country.country_id = city.country_id;

select * from payment;
select * from rental;
select * from customer;


/* Task 6:Like to know about customer spending.know the most valuable customer.Pull together a list of customer name,their total
life time rental,and sum of all payment you have collected from them.It would be great to see this ordered on total lifetime
value with most valuable customer at top of the list*/

SELECT 
    customer.first_name,
    customer.last_name,
    COUNT(rental.rental_id) AS total_rentals,
    SUM(payment.amount) AS total_payment
FROM
    payment
        LEFT JOIN
    rental ON payment.rental_id = rental.rental_id
        LEFT JOIN
    customer ON customer.customer_id = rental.customer_id
GROUP BY customer.first_name , customer.last_name
ORDER BY total_payment DESC;



-- Task 7: Provide a list of advisor and investor in one table

SELECT 
    'investor' AS type, first_name, last_name,company_name
FROM
    investor 
UNION SELECT 
    'advisor' AS type, first_name, last_name,'N/A'
FROM
    advisor;
    
    
 
    
    