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
-- Task 1:Pull a list of the first name,last name and email of-- 
-- each of our customer--
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

-- Task 2: pull the records of the film and see rental duration--

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


	
