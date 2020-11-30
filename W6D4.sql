select count(*) from bank.account;

delimiter //
create procedure proc_no_of_rows
(out param1 int)
begin
select count(*) from bank.account;
end;
//
delimiter ;

delimiter //
create procedure proc_no_of_rows # no spaces, proc is procedure
(out param1 int)
begin
select count(*) from account;
end;
//
delimiter ;

call proc_no_of_rows(@x);   #@x means just run it in general

select count(film_id)
from sakila.film
where release_year = 2006;


use sakila;

delimiter //
create procedure proc_no_of_movies_2016 # no spaces, proc is procedure
(out param2 int)
begin
select count(film_id)
from film
where release_year = 2006;
end;
//
delimiter ;

use sakila;

drop procedure if exists proc_no_of_movies_features
delimiter //
create procedure proc_no_of_movies_features # no spaces, proc is procedure
#@'special_features'
(out param2 int)
begin
select count(film_id)
from film
where special_features = @special_features;
end;
//
delimiter ;

call proc_no_of_movies_features(@'Trailers');


#W6D4 Lab | Stored procedures

use sakila;

  select concat(first_name, ' ', last_name) full_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = "Action"
  group by full_name, email
  order by full_name;
  
drop procedure if exists proc_action_movie_rented
delimiter //
create procedure proc_action_movie_rented # no spaces, proc is procedure
(out param1 int)
begin
select concat(first_name, ' ', last_name) full_name, email
  from customer
  join rental on customer.customer_id = rental.customer_id
  join inventory on rental.inventory_id = inventory.inventory_id
  join film on film.film_id = inventory.film_id
  join film_category on film_category.film_id = film.film_id
  join category on category.category_id = film_category.category_id
  where category.name = "Action"
  group by full_name, email
  order by full_name;
end;
//
delimiter ;

call proc_action_movie_rented(@x);

#dynamic: active-1 and inactive-0 customers

drop procedure if exists customer_info_status;

delimiter //
create procedure customer_info_status (IN param1 tinyint(1))
begin
 select first_name, last_name, email
  from customer
  where active= param1; 
end; 
// delimiter ; 

call customer_info_status(1);



#last task:


drop procedure if exists customer_info_status;
delimiter //
create procedure customer_info_status_n (IN param1 tinyint(1))
begin
select category.name, count(count_of_category) as category_counts
from film
join film_category using (film_id)
join category using (category_id)
join (select count(*) as count_of_category, category_id
from film_category fc
group by category_id)sub using (category_id)
group by category.name;
end;
// delimiter ; 

call customer_info_status(1);










