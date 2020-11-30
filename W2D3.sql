USE BANK;

create table TEST
select * from account;

drop table if exists test2;

create table test2 (
id int UNIQUE NOT NULL,
name varchar(20),
address text,
CONSTRAINT PRIMARY KEY(id)
);

select * from test2;

create table district_demo (
district_id int UNIQUE NOT NULL,
name varchar(20) DEFAULT NULL,
CONSTRAINT PRIMARY KEY(district_id)
);

create table account_demo (
account_id int UNIQUE NOT NULL,
district_id int DEFAULT NULL,
status varchar(20) DEFAULT NULL,
constraint primary key(account_id),
constraint foreign key(district_id) references district_demo(district_id)
);

insert into district_demo VALUES (1,'Xberg');
insert into district_demo VALUES (2,'moabit'), (3, 'Tegel');

insert into account_demo VALUES (1,1,'Green');
insert into account_demo VALUES (2,3,'Blue');

delete from district_demo where district_id = 2;

drop table account_demo;

select * from district_test;

alter table district_demo drop column name;
alter table district_demo rename to district_test;
alter table district_test rename column district_id to district_test_id;

drop table district_test;

create table district_demo (
district_id int UNIQUE NOT NULL,
name varchar(20) DEFAULT NULL,
CONSTRAINT PRIMARY KEY(district_id)
);
insert into district_demo VALUES (1,'Xberg');
insert into district_demo VALUES (2,'moabit'), (3, 'Tegel');

alter table district_demo add column district_size int;

select * from file1test;

#activities 2.05

select * from loan
where account_id = 11382;

insert into loan VALUES (8000,8000000,930705,96396,12,8033.0,'C');

#Lab | SQL Queries 5

alter table sakila.staff drop column picture;
select * from sakila.staff;

insert into sakila.staff (staff_id, first_name, last_name, address_id, email, store_id, username)
VALUES (3,'Tammy','Sanders', 79, 'sdfdfg@sfdg.com', 2, 'Tammy');

select * from sakila.rental;

select title from sakila.film
where film;


select * from sakila.customer
where last_name = 'Hunter';

select max(rental_id) from sakila.rental;

create table sakila.deleted_users
select customer_id, email, active from sakila.customer; 

drop table bank.deleted_users;

select * from sakila.deleted_users where active = 0;
alter table deleted_user drop column active = 0;
alter table sakila.deleted_users add column delete_date date;


select * from sakila.customer
where active = 0;

drop table sakila.deleted_users;

#TODO adding delete date of today in the delete_date column where active=0 in the deleted_user table

update sakila.deleted_users set delete_date = 20201028;

# activities 2.06

select status, case
when status = 'A' then 'Good - Contract Finished'
when status = 'B' then 'Defaulter - Contract Finished'
when status = 'C' then 'Good - Contract Running'
when status = 'D' then 'In Debt - Contract Running'
end as status_explained from bank.loan;



#Lab | SQL Queries 6

use sakila;
drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

select * from sakila.films_2020;

update sakila.films_2020 set rental_duration =3;






