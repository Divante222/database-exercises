select database();

show databases;
use albums_db;
select database();
show tables;

select * from albums;

use employees;
select * from employees;

select count(*) as cnt from employees;

-- select first_name, last_name, count(*)
-- rom employees;

-- this doesnt work because the collumns dont have an equal amount of information 
use albums_db;

select min(sales) as min_sales,
max(sales) as max_sales,
round(avg(sales)) as average_sales,
count(*) as cnt_of_albums
from albums;

select round(sales, 0) from albums;

SELECT concat('hello', 'pagel', '!');

select 'hello pagel !';


-- can combine columns and still call other columns to view next to the combined columns --
select concat(name,' -- ', release_date) as release_date_album
, sales
, release_date
, artist
from albums;

select substring('hello pagel class!', 7, 5);

select substring('hello pagel class!', 7, 30); -- no index error
-- it cannot count backwards

select substring('hello pagel class!', -5, 3); -- can start with a negative number

select substring('hello pagel class!', 5); -- last argument is optional defaults to returning whatever is left

select * from albums;

select release_date, substring(release_date, 3) as two_digit_year
from albums;

select substr(name, 1, locate(' ', name)) from albums; -- locate function is used to help to find first names and last names

select  upper(artist)as all_caps_artist
, lower(name) as all_lower_album
, upper(concat(release_date, ' -- ', name)) as date_albums -- combining two functions
, name
, sales
 from albums;
 
 /*select name, 
 upper(left(name,1)
 , 	lower(substr(name,2))
 ,	concat(
		upper(left(name,1))
		,	lower(substr(name,2))
    ) 
from albums;*/

select replace('hello pagel class!', 'a', 'AA');


select name, genre, replace(genre, 'rock', '!@rock!!!!')
from albums;

select name, genre, replace(lower(genre), 'rock', '!@rock!!!!')
from albums;

select  now(); -- shows the time and date it is right now

select current_date(); -- returns the date

select now(), current_date(), curdate(), curtime();

select convert_tz(now(), '+00:00', '-6:00');

select year(now()), month(now()), day(now()), hour(now());

select year('1999-01-12');

select 2 + 2;

select 1 + '2';

select 1 + cast('2' as signed);

select concat('1', '2');
