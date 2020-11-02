#Lab SQL Join

select count(f.title), cc.name
from sakila.film f
join sakila.film_category c
on f.film_id = c.film_id
join sakila.category cc
on c.category_id = cc.category_id
group by cc.name
order by name;

select a.address, a.address2, s.first_name, s.last_name
from sakila.address a
join sakila.staff s
on a.address_id = s.address_id
order by s.last_name;

select sum(p.amount), s.last_name
from sakila.staff s
join sakila.payment p
on s.staff_id = p.staff_id
where p.payment_date between '2005-08-01' and '2005-08-31'
group by s.last_name;

select a.first_name, a.last_name, count(aa.film_id) number_of_films
from sakila.actor a
join sakila.film_actor aa
on  a.actor_id = aa.actor_id
group by a.first_name, a.last_name
order by number_of_films desc;

select c.last_name, sum(p.amount) payment_amount
from sakila.customer c 
left join sakila.payment p
on p.customer_id = p.customer_id
group by c.last_name
order by c.last_name;

select * from sakila.payment;




#Lab | SQL Joins on multiple tables

select s.store_id, c.city, cc.country
from sakila.store s
join sakila.address a
on s.address_id = a.address_id
join sakila.city c
on c.city_id = a.city_id
join sakila.country cc
on cc.country_id = c.country_id;

select s.store_id, round(sum(p.amount),0) total_business
from sakila.store s 
join sakila.staff ss
on s.store_id = ss.store_id
join sakila.payment p 
on ss.staff_id = p.staff_id
group by s.store_id;


select c.name, round(avg(f.length),0) length
from sakila.category c 
join sakila.film_category cc 
on c.category_id = cc.category_id
join sakila.film f
on cc.film_id = f.film_id
group by c.name
order by length desc
limit 1;

select f.title, r.rental_date, r.return_date
from sakila.film f 
left join sakila.inventory i 
on f.film_id = i.film_id
join rental r 
on i.inventory_id = r.inventory_id
where f.title = "Academy Dinosaur"
order by return_date desc
limit 1;

select max(return_date) from sakila.rental;

#--> "Academy Dinosaur" is available

