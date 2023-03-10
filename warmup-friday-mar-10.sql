use chipotle;
select database();
select * from orders
where (item_name like 'Veggie Bowl'
or item_name like 'Chicken Bowl')
and quantity > 1;


