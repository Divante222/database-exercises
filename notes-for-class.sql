show databases;

show tables;
show create table fruits;
select database();
use fruits_db;

-- select which columns we wnat to use
-- from which table we want to use
-- where how we are filtering rows

-- us the numbers2 tabler from the numbers db
select database();
show databases;
use numbers;
select database();

-- write basic query and run( select * from table)
-- use hte where to filter your rows and
-- go back to the select statement and enter in the dcolumns that you want
select category as supergroup_one_category, supergroup from numbers2
where supergroup = 'one';
-- show me categories for onlly supergorup one and reaname
