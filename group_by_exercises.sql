use employees; 
show tables;

/* In your script, use DISTINCT to find the unique titles in the titles table. 
How many unique titles have there ever been? Answer that in a comment in your SQL file.
*/
select count(distinct title) from titles;

-- 7 distinct titles

/* Write a query to to find a list of all unique last names of all employees that start and end 
with 'E' using GROUP BY.*/
show tables;
select last_name from employees 
group by last_name
having last_name like 'e%e';

/* 4 Write a query to to find all unique combinations of first and last names of 
all employees whose last names start and end with 'E'.*/

select first_name, last_name from employees
group by first_name, last_name
having last_name like 'e%e'
;

/* 5 Write a query to find the unique last names with a 'q' but not 'qu'. 
Include those names in a comment in your sql code.*/

select last_name from employees
group by last_name
having last_name like '%q%' and last_name not like '%qu%';

/* 6 Add a COUNT() to your results (the query above) to 
find the number of employees with the same last name.*/ 

select last_name , count(*) from employees
group by last_name
having last_name like '%q%' and last_name not like '%qu%';

/* 7 Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. 
Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
*/

select first_name, gender, count(*) from employees
group by first_name, gender
having first_name in ('Irena', 'Vidya', 'Maya');

/* 8 
Using your query that generates a username for all of the employees, generate a count employees 
for each unique username. */
select * from employees;
select concat(substr(lower(first_name), 1, 1), substr(lower(last_name), 1, 4), '_', substr(birth_date, 6, 2), 
substr(birth_date, 3, 2) 
) as username, count(*)
from employees
group by username;

/* 9 From your previous query, are there any duplicate usernames? What is the higest number of 
times a username shows up? Bonus: How many duplicate usernames are there from your previous query?
*/

-- 13251 duplicate usernames are in the previous querygi
select concat(substr(lower(first_name), 1, 1), substr(lower(last_name), 1, 4), '_', substr(birth_date, 6, 2), 
substr(birth_date, 3, 2) 
) as username, count(*)
from employees
group by username
;

select count(*) from (select concat(substr(lower(first_name), 1, 1), substr(lower(last_name), 1, 4), '_', substr(birth_date, 6, 2), 
substr(birth_date, 3, 2) 
) as username, count(*)
from employees
group by username
having count(*) > 1)as derived_table;

select * from (
select concat(substr(lower(first_name), 1, 1), substr(lower(last_name), 1, 4), '_', substr(birth_date, 6, 2), 
substr(birth_date, 3, 2) 
) as username , count(*) as dist
from employees
group by username
having dist > 1) ; -- use this one when learing subqueries next week

-- yes there are duplicate usernames, 6 is the highest number of times a username shows up 


-- Determine the historic average salary for read, each employee. When you hear,or think "for each" 
-- with regard to SQL, you'll probably be grouping by that exact column.
select * from salaries;
select emp_no, round(avg(salary), 2), count(*) from salaries
group by emp_no;

/* Using the dept_emp table, count how many current employees work in each department. 
The query result should show 9 rows, one for each department and the employee count.
*/ 
select * from dept_emp;
select dept_no, count(*) from dept_emp
where to_date > now()
group by dept_no;

/* Determine how many different salaries each employee has had. This includes both historic and current.*/
select * from salaries;

select emp_no, round(avg(salary), 2), count(*) from salaries
group by emp_no;

-- Find the maximum salary for each employee.
select emp_no, max(salary), round(avg(salary), 2), count(*) from salaries
group by emp_no;

-- Find the minimum salary for each employee.
select emp_no, min(salary), round(avg(salary), 2), count(*) from salaries
group by emp_no;

-- Now find the max salary for each employee where that max salary is greater than $150,000.
select emp_no, max(salary), round(avg(salary), 2), count(*) from salaries
group by emp_no
having max(salary) > 150000;

-- Find the average salary for each employee where that average salary is between $80k and $90k.
select emp_no, avg(salary), round(avg(salary), 2), count(*) from salaries
group by emp_no
having avg(salary) between 80000 and 90000;

-- Find the standard deviation of salaries for each employee.
select emp_no, round(STDDEV(salary),2) , avg(salary), count(*) from salaries
group by emp_no
;

