#useful links
#https://sqlbolt.com/lesson/select_queries_order_of_execution
#https://sqlbolt.com/lesson/select_queries_order_of_execution

#tasks: /Users/khegyi/Code/Solutions of labs and lectures/BER-DAFT-OCT20-Sian/Other/SQL_queries_annotated/bank review questions.sql

-- How many clients and accounts are there, overall?

select count(client_id) number_of_clients, count(account_id) number_of_accounts 
from bank.disp;



-- How many clients are "owners" and how many "disponents" of the accounts?

select * from bank.disp;

select type, count(type) count
from bank.disp
group by type;

-- How many clients & accounts are there by region?

select count(distinct(d.client_id)) number_of_clients, count(distinct(d.account_id)) number_of_accounts, a.a3 district
from bank.disp d
join bank.district a
on d.disp_id = a.a1
group by a.a3
order by district
;
#this was a wrong join, so we need 3 tables together:


select d.A3 as District,  count(distinct(a.account_id))  as Accounts,  count(distinct(c.client_id)) as Clients
from district d
join account a
on a.district_id = d.A1
join client c 
on c.district_id = d.A1
group by d.A3 ;



-- Explore the loans given to clients

select * from loan;

select d.client_id, l.Loan_id, l.account_id, l.amount , l.duration, l.status 
from loan l 
join disp d
using(account_id);



-- How could we define clients as valuable / not valuable?

select d.client_id, l.account_id, sum(l.amount), l.status 
from loan l 
join disp d
using(account_id)
where status IN ("B", "D")
group by d.client_id, l.account_id, l.status 
;



-- Once you've defined how to classify clients as valuable / not valuable:
	-- describe both groups of clients based on information you'll find accross all tables
    -- (what type of client they are, where do they live, what type of card, etc.)
    
    
    #subqueries
    
    select t.transaction from trans t
    where cliend_id in (SUBQUERY)
    



