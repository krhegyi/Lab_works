#join vs subquery
#activity 3 05 /2

select * from bank.district;
select * from bank.account;

select a3 from bank.district where a3 = 'central Bohemia';

#subquery
select * from account
where account_id in (
select a1 from bank.district where a3 = 'central Bohemia'
);

#join
select account_id, a3 from bank.account a
join bank.district d
on d.a1 = a.district_id
where d.a3 = 'central Bohemia';

#activity 3 05 /3
#Find the most active customer for each district in Central Bohemia.

# get central bohemia, then a2, and the client name of the highest amount in trans

select client_id from bank.clent
where district_id in;

select t.amount from bank.trans 
join;

select sum(t.amount), a.account_id 
from bank.trans t
join bank.account a 
on a.account_id = t.account_id
group by a.account_id;

#solution from sina

select district.A2 district_name, account_id, round(total) as total
from
(
  select ac.account_id, ac.district_id, sum(tr.amount) as total,
  rank() over (partition by district_id order by sum(tr.amount) desc) as position
  from bank.account ac
  inner join bank.trans tr
  using (account_id)
  group by ac.account_id
) as t
inner join district on t.district_id = district.A1
where position = 1
and district.A3 = 'central Bohemia'
order by district_id;


#CTE
#3. 06 /1 
#Use a CTE to display the first account opened by a district.

select a.account_id from bank.account
where;

#solution
with cte_accounts as
(
SELECT account_id, district_id, date,
RANK() OVER (partition by district_id ORDER BY date) as ranking
FROM account)
SELECT account_id, district_id FROM cte_accounts
WHERE ranking = 1;

#solution2 sian


with ordered_bank_accounts as (
  select account_id, district_id, rank() over (partition by district_id order by date) as open_order
  from bank.account
)
select d.A3, d.A2, a.account_id
from ordered_bank_accounts a
inner join bank.district d on d.A1 = a.district_id
where open_order = 1
order by d.A3, d.A2;

#view example w cte and nested subqueries

create view running_contract_ok_balances as
with cte_running_contract_OK_balances  as (
  select *, amount-payments as Balance
  from bank.loan
  where status = 'C'
  order by Balance
)
select * from cte_running_contract_OK_balances
where Balance > (
  select avg(Balance)
  from cte_running_contract_OK_balances
)
order by Balance desc
limit 20;
    
    
#activity 3 06 2
#In order to spot possible fraud, we want to create a view last_week_withdrawals with total withdrawals by client in the last week.

create view possible_fraud as;


select sum(account), account_id from trans
group by account_id
where date between ;

#solution 

CREATE VIEW last_week_withdrawals2 AS(
SELECT account_id, type, ROUND(SUM(amount),2)
FROM trans
WHERE type = 'VYDAJ' AND 
(SELECT DATE_ADD(MAX(date), INTERVAL 7 DAY) FROM trans)
GROUP BY account_id);

select * from last_week_withdrawals2;
    


#lab-sql-advanced-queries

#1 List each pair of actors that have worked together.
#solution
select fa1.film_id, concat(a1.first_name, ' ', a1.last_name), concat(a2.first_name, ' ', a2.last_name)
from sakila.actor a1
inner join sakila.film_actor fa1 on a1.actor_id = fa1.actor_id
inner join sakila.film_actor fa2 on (fa1.film_id = fa2.film_id) and (fa1.actor_id != fa2.actor_id)
inner join sakila.actor a2 on a2.actor_id = fa2.actor_id;


#2 For each film, list actor that has acted in more films.





#solution


with actor_movies as (
  select actor_id, count(film_id) as num_films
  from sakila.film_actor
  group by actor_id
)
select f.title, concat(a.first_name, ' ', a.last_name) as most_prolific_actor
from (
  select film_id, actor_id, rank() over (
    partition by film_id
    order by num_films
    desc
  ) as m
from sakila.film_actor
inner join actor_movies
using (actor_id)) t
inner join sakila.actor a on t.actor_id = a.actor_id
inner join sakila.film f on t.film_id = f.film_id
where m = 1;

-- step by step

-- Get the the total films for each actor/actress 
with actor_movies as (
  select actor_id, count(film_id) as num_films
  from film_actor
  group by actor_id
)
select f.title, concat(a.first_name, ' ', a.last_name) as best_actor
from (
-- Rank the actors for every movie 
  select film_id, actor_id, rank() over (
    partition by film_id
    order by num_films
    desc
  ) as m
from film_actor
inner join actor_movies
using (actor_id)) t
inner join actor a on t.actor_id = a.actor_id
inner join film f on t.film_id = f.film_id
-- Get only the 'best' actor/actress 
where m = 1;```






