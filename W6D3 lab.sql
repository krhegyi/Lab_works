select distinct(concat(first_name, ' ', last_name)) full_name , email #, rental_date
from sakila.customer c
left join sakila.rental r
using (customer_id)
where rental_date >0;

select * from sakila.rental;


select concat(c.first_name, ' ', c.last_name) full_name, c.email, round(avg(p.amount),2) average_payment
from sakila.customer c
join sakila.payment p
using (customer_id)
group by full_name, c.email;

select count(payment_id) count, 
CASE
		WHEN amount < 2 THEN 'low'
		WHEN amount > 4 THEN 'high'
		ELSE 'medium'
END as payment_amount
FROM sakila.payment
group by payment_amount;

