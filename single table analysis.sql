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

-- Task 1:Pull a list of the first name,last name and email of
-- each of our customer
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

-- Task 4:Try to get the data just payments over $5 for those same customer
-- since january 1,2006

select customer_id,rental_id,amount,payment_date
from payment
where customer_id <101
	and amount >='5' 
    and payment_date >'2006-01-01';
    
-- Task 5:write a query to pull all payment from the customer(42,53,60,75)
-- along with payment over $5 from any customer

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








	
