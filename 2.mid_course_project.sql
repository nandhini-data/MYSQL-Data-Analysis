/* Task 1: We will need a list of all staff members, including their first and last names, email addresses, and the store 
identification number where they work.*/

SELECT 
    first_name, last_name, email, store_id
FROM
    staff;
    
/* Task 2:We will need separate counts of inventory items held at each of your two stores.*/

SELECT 
    store_id, COUNT(inventory_id) AS inventory_items_count
FROM
    inventory
GROUP BY store_id;

/* Task 3:We will need a count of active customers for each of your stores. Separately, please.*/

SELECT 
    store_id, COUNT(customer_id) AS active_customers
FROM
    customer
WHERE
    active = 1
GROUP BY store_id;

/* Task 4:In order to assess the liability of a data breach, we will need you to provide a count of all customer email 
addresses stored in the database.*/


SELECT 
    customer_id, email
FROM
    customer;

SELECT 
    COUNT(email) AS email_counts
FROM
    customer;


/* Task 5:We are interested in how diverse your film offering is as a means of understanding how likely you are to 
keep customers engaged in the future. Please provide a count of unique film titles you have in inventory at 
each store and then provide a count of the unique categories of films you provide.*/

SELECT 
    COUNT(DISTINCT name) AS count_of_unique_film_category
FROM
    category;

SELECT 
    store_id, COUNT(DISTINCT film_id)
FROM
    inventory
GROUP BY store_id;


/* Task 6:We would like to understand the replacement cost of your films. Please provide the replacement cost for the 
film that is least expensive to replace, the most expensive to replace, and the average of all films you carry.*/

SELECT 
    MAX(replacement_cost) AS most_expensive,
    MIN(replacement_cost) AS least_expensive,
    AVG(replacement_cost) AS avearge_expense
FROM
    film;
    
/* Task 7:We are interested in having you put payment monitoring systems and maximum payment processing 
restrictions in place in order to minimize the future risk of fraud by your staff. Please provide the average 
payment you process, as well as the maximum payment you have processed.*/

SELECT 
    MAX(amount) AS maximum_payment,
    AVG(amount) AS average_payment
FROM
    payment;


/* Task 8:We would like to better understand what your customer base looks like. Please provide a list of all customer 
identification values, with a count of rentals they have made all-time, with your highest volume customers at 
the top of the list.*/

select customer_id,
count(rental_id) as customer_count
from rental
group by customer_id  
order by customer_count desc;

select * from rental;
