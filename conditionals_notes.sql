use chipotle;
show tables;

select distinct item_name from orders
where item_name like '%chicken%';


-- recognizes true and false as 1 and 0
select distinct item_name, if(item_name = 'Chicken Bowl', TRUE, FALSE) as is_chicken_bowl
from orders;


-- can add another column onto * if using if statement
select *, if(item_name like '%Chicken%', TRUE, FALSE) as has_chicken
from orders;

select distinct item_name, if(item_name like '%Chicken%', TRUE, FALSE) as has_chicken
from orders;

-- dont need true and false if you want a 1's and 0's
select if(item_name like '%Chicken%', 'yes', 'no') as has_chicken, count(*) from orders
group by has_chicken
;

-- the if statement with the subquery in the from statement
select sum(has_chicken) from 
(
select distinct item_name, if(item_name like '%Chicken%',TRUE, FALSE) as has_chicken
from orders) as chicken_example
;


select has_chicken ,count(has_chicken) from (
select if(item_name like '%Chicken%','yes', 'no') as has_chicken
from orders
group by has_chicken
) as chicken_example2
group by has_chicken
;



select distinct item_name from orders;


-- 'end as' for the end statement
select distinct item_name,
	case item_name -- column im checking -- can only check for equality cannot use like
		when 'Chicken Bowl' then 'yes_chicken'
        when 'Steak Bowl' then 'yes_steak_bowl'
        when 'Izze' then 'yes_izze'
        when '%Burrito%' then 'yes_some_burritos' -- will not find this item DONT USE THE %
        else 'other'
	end as 'some_items' -- can use a comma and add another item to the list of things I want to see
from orders
;

-- just 'end' for the end statement
select distinct item_name ,
	case
		when item_name = 'Chicken Bowl' then 'is_chicken_bowl'
        when item_name like '%bowl%' then 'other bowl'
        
        end 'find_bowls',
	case 
		when  choice_description like '%tomato%' then 'contains_tomato'
	end
from orders;




select distinct * ,
	case
		when item_name = 'Chicken Bowl' then 'is_chicken_bowl'
        when item_name like '%bowl%' then 'other bowl'
        when order_id < 4 then 'early_order'
	end 'find_bowls',
    case
        when  choice_description like '%tomato%' then 'contains_tomato'
	end
from orders
limit 5;


-- showing price might be a string
select distinct item_price from orders
order by item_price;


select quantity , count(*)
from orders
group by quantity
;


select distinct quantity,
	case
		when quantity >= 5 then 'big orders'
        when quantity >=2 then 'middle orders'
        else 'single orders'
	end as 'order size'
from orders
;


select order_size, count(*)
from (

select quantity,
	case
		when quantity >= 5 then 'big orders'
        when quantity >=2 then 'middle orders'
        else 'single orders'
	end as 'order_size'
from orders
) as orders
group by order_size 
;

