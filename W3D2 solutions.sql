#lab-sql-subqueries

select count(title) from sakila.film
where title = 'Hunchback Impossible';

select count(title) from sakila.film
where (
	select title from sakila.film where title = 'Hunchback Impossible');
    

select avg(length) from sakila.film;

select title, length from sakila.film
where length > (
	select avg(length) from sakila.film)
order by length;

select a.first_name, a.last_name, f.title
from sakila.actor a
join sakila.film_actor aa
on a.actor_id = aa.actor_id
join sakila.film f
on f.film_id = aa.film_id
where (
	select f.title = 'Alone Trip')
order by last_name;


select * from sakila.country
where country = "Canada";


select c.email, c.first_name, c.last_name, ccc.country
from sakila.customer c
join sakila.address a
on c.address_id = a.address_id
join sakila.city cc
on a.city_id = cc.city_id
join sakila.country ccc
on cc.country_id = ccc.country_id
#where ccc.country = 'Canada'
where ccc.country in (select country from sakila.country where country = "Canada");

    

select a.actor_id, count(f.title) count
from sakila.film_actor a
join sakila.film f
on f.film_id = a.film_id
group by a.actor_id
order by count desc
limit 1;

select title from sakila.film f
join sakila.film_actor a
on f.film_id = a.film_id
where  a.actor_id = (
	select a.actor_id, count(f.film_id) films
from sakila.film_actor a
join sakila.film f
on f.film_id = a.film_id
group by a.actor_id
order by films desc
limit 1
);

#Error Code: 1241. Operand should contain 1 column(s)


#question 6 solution

select concat(first_name, ' ', last_name) as actor_name, film.title, film.release_year
from sakila.actor
inner join sakila.film_actor
using (actor_id)
inner join film
using (film_id)
where actor_id = (
select actor_id
from sakila.actor
inner join sakila.film_actor
using (actor_id)
inner join sakila.film
using (film_id)
group by actor_id
order by count(film_id) desc
limit 1
)
order by release_year desc;


#question 8

select avg(amount) from sakila.payment;

select distinct concat(c.last_name, ' ',c.first_name) full_name
from sakila.customer c 
join sakila.payment p 
on c.customer_id = p.customer_id
where p.amount > (
select avg(amount) from sakila.payment
);