#HAVING
select type, operation, round(avg(balance),2) as avg_balance 
from bank.trans
group by type, operation
having avg_balance > 40000
order by operation;


select type, operation, round(avg(balance),2) as avg_balance 
from bank.trans
where not operation = ''
group by type, operation
having avg_balance > 40000
order by operation;

#WINDOW

select *, avg(balance) over (partition by type) as avg_balance
from bank.trans
limit 5;

select *, avg(amount) over (partition by status) as avg_amount
from bank.loan;

select loan_id, account_id, status, amount,
rank() over (partition by status order by amount) as rankcol
from bank.loan;

#activities 2.07

select count(card_id), type
from bank.card
grou by type;

select type, avg(amount)
from bank.trans
where k_symbol <> ' '
group by type;

select * from bank.client;

select a3 as district, count(a1) as number_of_clients
from bank.district group by district
having number_of_clients > 1;

select type, operation, round(avg(amount),2) as amount
from bank.trans
group by type, operation
having amount > 10000
order by amount;


#Lab | SQL Queries 7


select last_name, count(last_name) count
from sakila.actor
group by last_name
having count = 1;

select last_name, count(last_name) count
from sakila.actor
group by last_name
having count >1;

select staff_id, count(rental_id) rental_count
from sakila.rental
group by staff_id
order by staff_id;

select count(film_id), release_year
from sakila.film
group by release_year
order by release_year;

select round(avg(length),2) avg_length, rating
from sakila.film
group by rating
having avg_length > 120;

#activities  2.08

select * from bank.district;


select *, avg(a4) over (partition by a3)
from bank.district;

select avg(a4), a3
from bank.district
group by a3;


#JOIN

select *, a.district_id
from bank.account a
join bank.loan b
on a.account_id = b.account_id;

#Lab | SQL Queries 8

select count(r.rental_date) rentals, c.email
from sakila.customer c
join sakila.rental r
on r.customer_id = c.customer_id
group by c.email
order by rentals DESC
limit 5
;


























