use telco_churn;
select * from contract_types;
select * from customer_churn;

select * from customer_contracts;
select * from customer_details;

select * from customer_payments;




select * from customer_subscriptions;

select * from customers;


select customer_id, monthly_charges  from customers
where monthly_charges > (select avg(monthly_charges) from customers)
;

select count(*) from customers;

select count(*) from (select customer_id, monthly_charges from customers
where monthly_charges > (select avg(monthly_charges) from customers)) as above_avg;

select * from customers;

select (select count(*) from (select customer_id, monthly_charges from customers
where monthly_charges > (select avg(monthly_charges) from customers)) as above_avg) * 100 /
(select count(*) from customers)