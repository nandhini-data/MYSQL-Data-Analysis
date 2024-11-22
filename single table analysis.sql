SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES,ONLY_FULL_GROUP_BY';
SET GLOBAL max_allowed_packet = 1073741824;
select @@max_allowed_packet;
use mavenmovies;
select *
from rental;
select *
from customer;
select
	customer_id,
    rental_date
from
	rental;

-- Task 1:Pull a list of the first name,last name and email of each of our customer

select 
	first_name,
    last_name,
    email
from
	customer;

select 
*
from
film;
select distinct
	rating
from
film;

-- Task 2: pull the records of the film and see rental duration

select distinct
	rental_duration
from
film;
select 
customer_id,rental_id,amount,payment_date
from
payment ;
select 
customer_id,rental_id,amount,payment_date
from
payment
where amount = '0.99';
select 
customer_id,rental_id,amount,payment_date
from
payment
where payment_date>'2006-01-01';

-- Task 3:pull payment from our first 100 customers(based on customer id)

select
customer_id,rental_id,amount,payment_date
from payment
where customer_id <101;
select payment_id,customer_id,rental_id,amount,payment_date
from payment
where amount ='0.99'and payment_date >'2005-06-15';

-- Task 4:Try to get the data just payments over $5 for those same customer since january 1,2006

select customer_id,rental_id,amount,payment_date
from payment
where customer_id <101
	and amount >='5' 
    and payment_date >'2006-01-01';
    
-- Task 5:write a query to pull all payment from the customer(42,53,60,75) along with payment over $5 from any customer

select customer_id,rental_id,amount,payment_date
from payment
where amount > 5
or customer_id =42
or customer_id =53
or customer_id =60
or customer_id =75;

select customer_id,rental_id,amount,payment_date
from payment
where amount > 5
or customer_id in(42,53,60,75);

select * from film;

select title,description 
from film
where description like '%epic%';

select title,description
from film
where title like '%bride%';

-- Task 6:pull a list of film which include behing the scenes special feature

select title,description,special_features
from film
where special_features like '%behind the scenes%';

select * 
from film;

select distinct rating
from film;

select rating,count(film_id)
from film
group by rating;

select distinct rental_duration
from film;

select rating,
count(film_id) as film_rating_count
from film
group by(rating);


-- Task 7: pull a count of titles sliced by rental duration

select * 
from film;

select rental_duration,count(title) as film_with_rental_duration
from film
group by rental_duration; 

select rental_duration,
	rating,count(film_id) as rating_rental_duration
from film
group by rental_duration,
	rating;

select rating,
count(film_id) as film_count,
min(length) as shortest_film,
max(length) as longest_film,
avg(length) as average_length,
avg(rental_duration) as average_rental_duration
from film
group by rating;

/*Task 8:pull a count of film,along with the average,min,
and max rental rate,grouped by replacement cost*/

select distinct replacement_cost
from film;

select replacement_cost,
count(film_id) as no_of_film,
avg(rental_rate) as average_rental,
min(rental_rate) as minimum_rental,
max(rental_rate) as maximum_rental
from film
group by(replacement_cost);
 
 select *
 from rental;
 
 SELECT 
    customer_id, COUNT(rental_id) AS total_rentals
FROM
    rental
GROUP BY customer_id
HAVING COUNT(rental_id) >= 30;

/* Task 9:Pull the list of customer_id with less than 15 rental 
all time*/
 
 select 
	customer_id,count(rental_id) as total_rentals
from
	rental
group by customer_id
having count(rental_id) < 15;

select *
from
payment;

select 
	customer_id,sum(amount) as amount_per_customer
from payment
group by customer_id
order by sum(amount) desc;

select 
	customer_id,rental_id,amount,payment_date
from payment
order by amount desc;

/* Task 10:Pull a list of all film title along with their length
and rental rates and sort them from longest to shortest*/

select *
from film;

select 
	title,length,rental_rate
from film;

select title,length,rental_rate
from film
order by length desc,rental_rate desc;
	
