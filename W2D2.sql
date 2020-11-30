#format a special date just get the year compononent
#lots of different formatting options
SELECT DATE_FORMAT('2020-10-26', '%Y');
SELECT DATE_FORMAT('20201026', '%Y');
SELECT DATE_FORMAT('2020/10/26', '%Y');
#converted it to the standard sql format - - -
SELECT CONVERT('2020/10/26', DATE);
SELECT CONVERT('2020/10/2 15:32:00', TIME);
SELECT CONVERT('2020/10/2 15:32:00', DATETIME);
#convert into a char variable
SELECT CONVERT('2020/10/2 15:32:00', CHAR);

select rental_date, return_date, datediff(return_date, rental_date) as rental_period_in_days from sakila.rental;

#null values --can be 0 or 1 (1 if numm value)

SELECT last_update, isnull(last_update) from sakila.rental
where isnull(last_update) =0;

select sum(isnull(last_update)) from sakila.rental;

SELECT * from sakila.film;

SELECT CASE
	WHEN length < 60 THEN 'short film'
    WHEN length between 60 and 120 THEN 'medium film'
    WHEN length > 120 THEN 'long film'
END FROM sakila.film;

SELECT length, CASE
	WHEN length < 60 THEN 'short film'
    WHEN length > 120 THEN 'long film'
    ELSE 'medium film'
END as filmlength
from sakila.film
order by filmlength;

#Activity 2.03

select *
from bank.card
where type = 'gold';

select convert(issued, date) from bank.card;

select date_format (left(issued, 6), '%Y') as year
from bank.card
where type = 'gold'
order by year ASC
limit 1;

select date_format(left(issued,6), '%d of %M of %Y') from bank.card;

select date_format(left(issued,6), '%M %D,%Y') from bank.card;

select isnull(amount) from bank.trans;

select * from bank.trans;
select count(type) from bank.trans;

#TODO: Count how many transactions have empty and non-empty k_symbol (in one query).

select count(type) 
from bank.trans
where k_symbol = " ";

select count(type) 
from bank.trans
where k_symbol != " ";



select count(isnull(k_symbol)) from bank.trans;

#LAB SQL3

select count(distinct last_name) from sakila.actor;

select distinct language_id from sakila.film;
select * from sakila.film;

select count(rating)
from sakila.film
where rating = 'PG-13';

select title, length 
from sakila.film
where release_year = 2006
order by length DESC
limit 10;

select datediff(max(return_date),min(rental_date))
from sakila.rental;

select * from sakila.rental;
select date_format(rental_date, '%M')
from sakila.rental;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select rental_date, date_format(rental_date, '%w'),date_format(rental_date, '%W'), CASE
	WHEN date_format(rental_date, '%w') between 1 and 5 THEN 'weekday'
	ELSE 'weekend'
END as day_type
from sakila.rental;

#How many rentals were in the last month of activity?

select max(rental_date) from sakila.rental;

select count(rental_date)
from sakila.rental
where rental_date > 2006-01-15;

select * from sakila.film_category
where category_id in (5,6,7);

select * from sakila.film_category
where category_id between 5 and 7;

select * from sakila.actor where first_name between 'a%' and 'd' order by first_name;


#date, but does not cover the last date 1st jun -cuz the default time is midinght
select * from sakila.rental
where rental_date  between '2005-05-24' and '2005-06-01';

#date, if converted 1st June is also included
select * from sakila.rental
where convert(rental_date,date) between '2005-05-24' and '2005-06-01';

#LIKE
select * from sakila.actor where first_name like 'a___';
select * from sakila.actor where first_name like 'a___%';
select * from sakila.actor where first_name like '%al%';

#REGEXP: more powerful compared to LIKE
select * from sakila.actor where first_name regexp 'atal'; # the same as '%al%'
select * from sakila.actor where first_name regexp '[atal]';  #gives names which are included in the [] list, so containing a t or l
select * from sakila.actor where first_name regexp '^[pe]';  # starts with p or e
select * from sakila.actor where first_name regexp '^[h-z]' order by first_name;  # starts with h-z
select * from sakila.actor where first_name regexp '^[^pe]';  # starts not with p or e

#GROUP BY

select avg(length), rating from sakila.film. #has to either aggreagte or put it in the group by!
group by rating
order by rating;

select distinct rating from sakila.film;

select rating, count(film_id) as number_of_movies
from sakila.film
group by rating;

#ACTIVITIES 2.04

select * from bank.card;
select distinct type from bank.card;

select * from bank.loan
where duration != " " and status in ("A"-"C")
order by status;

select convert(date,date) as loan_date_selection from bank.trans
where  convert(date,date) between '1993-03-01' and '1993-03-15'
order by loan_date_selection;

select * from district
where a2 like 'K%'
order by a2;

select * from bank.district
where a2 regexp 'ch[e]';

#Lab | SQL Queries 4

select distinct release_year from sakila.film;

select title from sakila.film
where title like '%armageddon%';

select title from sakila.film
order by length(title) DESC
limit 10;

select title, length from sakila.film
order by length desc
limit 10;

select count(title) from sakila.film
where special_features like ('behind the scenes');

select release_year, title from sakila.film
order by release_year DESC, title;

#Lab | SQL basics (selection and aggregation)

select account_id from bank.account
where district_id = 1
order by account_id ASC
limit 5;

select client_id from bank.client
where district_id = 72
order by client_id DESC
limit 1;

select duration,loan_id, amount from bank.loan
where duration = 60
order by loan_id
limit 5;

select distinct k_symbol from bank.trans;

select amount from bank.order
where account_to = 30067122;

select type, count(card_id) from bank.card
group by type;

select account_id, sum(amount) from bank.loan
group by account_id
order by sum(amount) DESC
limit 10;

select * from bank.loan;

select sum(duration), count(loan_id)  from bank.loan
where convert(date,date) between '1997-12-01' and '1997-12-31'
group by account_id;

select account_id, type, round(sum(amount),2)
from bank.trans
where account_id = 396
group by type;

#TODO Query 19 From the previous output, translate the values for type to English, rename the column to transaction_type, round total_amount down to an integer

select account_id, round(sum(amount),2), case
when type = 'prijem' then 'incoming'
when type = 'vydaj' then 'outcoming'
end as trans_type
from bank.trans
where account_id = 396
group by type;

select account_id, sum(amount) where type = 'prijem'
from bank.trans
group by





