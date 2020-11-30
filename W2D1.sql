SELECT client_id, birth_number	
FROM client;

SELECT *
FROM bank.client;

SELECT DISTINCT `district_id`
FROM bank.client
ORDER BY `district_id` DESC;

SELECT * FROM client
ORDER BY `birth_number`
Limit 10;


SELECT DISTINCT type FROM card;

SELECT amount 
FROM loan
ORDER BY amount
LIMIT 3;

SELECT loan_id, payments
FROM loan
ORDER BY payments DESC
LIMIT 1;

select *
from sakila.country;

select distinct name
from sakila.language;


select first_name
from sakila.staff;

select * from bank.client where district_id=1;
select * from bank.client where client_id>40 and district_id=1
order by client_id;

select district_id, count(client_id) as c
from bank.client  
group by district_id
order by c DESC
LIMIT 3;

select *
from client
where district_id = 72
order by client_id DESC
limit 1;

select *
from loan
where duration = 60
order by amount ASC
limit 5;


select distinct account_id, order_id
from bank.order
#where order_id >= 29540 AND order_id <= 29560;
where order_id between 29540 and 29560;

select trans_id, date, amount
from bank.trans
where account_id = 793
order by date DESC
limit 10;

#2.02 ACTIVITIES

select * from district
limit 100;

select a3 as district, round(avg(a4),2) as avg_salary
from bank.district
where a4 > 10000
group by district
order by district;

select amount-payments as debt, account_id
from bank.loan
where amount-payments > 0 and status = "C";

select a3, count(a2) as population, avg(a8), round(avg(a8)/count(a2),2) as ratio
from district
where a5 > 0.5
group by a3;


#TODO convert date time from numeric
select payments, date #, convert(datetime, date)
from bank.loan
where payments > 0
order by payments ASC
limit 1;


#Lab2

select *
from sakila.actor
where first_name IN ("Scarlett");

select *
from sakila.payment
where payment_date > last_update;

select distinct count(rental_id)
from sakila.rental;

select *
from sakila.rental
order by return_date - rental_date DESC
limit 1;

select length as max_duration
from sakila.film
order by length DESC
limit 1;

select round(avg(length),2) as average_duration
from sakila.film;

#avg duration in hours and minutes
select concat(floor(avg(length)/60), ":" ,round((avg(length)%60),0)) as AvgDuration
from sakila.film;

select count(length)
from sakila.film
where length/60 > 3;

select concat((first_name), " ", UPPER(last_name),"- ", email) as intergrated
from sakila.staff;

select *
from sakila.staff;

select length(title) as l, title
from sakila.film
order by l DESC
limit 1;

