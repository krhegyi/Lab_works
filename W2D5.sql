#create new table in sql and the nreach them in python
#lab-sql-9

create table rentals_may
select * from sakila.rental where rental_date between '2005-05-01' and '2005-05-31';

select * from sakila.rental;

drop table rentals_may;

select * from sakila.rentals_may
order by rental_date;




