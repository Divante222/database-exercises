use employees;
select database();

show tables;

/*Write a query to to find all employees whose last name starts and ends with 'E'. 
Use concat() to combine their first and last name together as a single column named full_name.
*/

select concat(first_name, ' ' , last_name) as 'full_name'
from employees
where last_name like 'e%e';

-- Convert the names produced in your last query to all uppercase.

select upper(concat(first_name, ' ' , last_name))as 'full_name'
from employees
where last_name like 'e%e';

-- Use a function to determine how many results were returned from your previous query.
select count(upper(concat(first_name, ' ' , last_name)))
from employees
where last_name like 'e%e';
-- 889

-- Find all employees hired in the 90s and born on Christmas. Use datediff() function to find 
-- how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
select concat(datediff(now(), hire_date), ' days') as 'days worked for the company' from employees
where hire_date like '199%'
and birth_date like '%12-25';

-- Find the smallest and largest current salary from the salaries table.
show tables;
select min(salary), max(salary) from salaries;
-- got the answer but this was a trick question it wanted the current salaries
-- look for the 9999 year entries to find current salaries
-- the answer
select min(salary), max(salary) from salaries
where to_date > now()
;

/* Use your knowledge of built in SQL functions to generate a username for all of the employees. 
A username should be all lowercase, and consist of the first character of the employees first name, 
the first 4 characters of the employees last name, 
an underscore, 
the month the employee was born, 
and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:*/
select concat(substr(lower(first_name), 1, 1), substr(lower(last_name), 1, 4), '_', substr(birth_date, 6, 2), 
substr(birth_date, 3, 2) 
) as username, first_name, last_name,birth_date
 from employees;



