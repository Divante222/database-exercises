-- seleet[grouped name to gorup ], [collumn that you summarize]

use chipotle;
show tables;

select * from orders;
-- have to specify item name cannot leave it just * there might be multiples of the same item
select item_name from orders  
where item_name like '%chicken%'
group by item_name -- get unique values without using aggrevate function
;

select item_name, quantity
from orders
where item_name like '%chicken%'
group by item_name, quantity
order by item_name;

select count(*), item_name from orders
where item_name = 'Chicken Bowl'
;

-- for each chicken item, how many times did it show up in an order?
select item_name, count(*) from orders 
where item_name like '%chicken%'
group by item_name;

select * from orders;


-- what are the min quantity/ max quantity etc
select item_name, max(quantity), round(avg(quantity), 1), min(quantity), count(*) from orders 
where item_name like '%chicken%'
group by item_name;


select count(item_name)from orders; -- counting all items in the table


-- having training

select item_name, sum(quantity) as sum_quant from orders
group by item_name
having sum_quant > 100 
order by item_name
limit 5
;



