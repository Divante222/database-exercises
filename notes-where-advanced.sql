use chipotle;

select distinct item_name
from orders
where item_name like '%chicken%';

-- find all the items that do not contaion xhicken

select distinct item_name
from orders
where item_name not like '%chicken%';

-- insert
-- will select multiple values in our conditional statement form one column_name
-- format: where {column_name] in ([value1], [value2], [value3])

-- find all the rows in order 1 - 5

select * from orders
where order_id in (1,2,3,4,5);

-- find all the rows that have chicken bowl or veggie bowl

select item_name from orders 
where item_name in ('Chicken Bowl', 'Veggie Bowl');

-- this allows to filter on our null values
-- null will be our value in the conditioanl statements

show databases;
use join_example_db;
select database();
show tables;

select * from users
where role_id is not null;

-- chaining conditional statements
-- using and/ or in where clause

-- format: where [ collumn_name] operator [value1]
-- and/or [column_name2] operator [value2] 

-- have to write the complete conditional twice

select * from users
where role_id = 3 
and name = 'sally';

select * from users 
where role_id = 3
or name = 'jane'; -- use htis when either condition is True

select * from users
where role_id in (1, 3);

use chipotle;
select database();

show tables;

select * from orders
where item_name like '%bowl%'
and quantity > 1
order by quantity desc, item_name desc
;

-- limit
-- limit [#]
select * from orders 
limit 5;

-- offset the limit skip some rows

select * from orders
order by rand()
limit 5 offset 10;




