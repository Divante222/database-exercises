/* Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' 
using IN. What is the employee number of the top three results?*/

use employees;
select database();

show tables;
select * from employees
where first_name in ('Irena', 'Vidya', 'Maya')
limit 3;
-- 10200, 10397, 10610

/*Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, 
but use OR instead of IN. What is the employeehree results? Does it match the previous question?*/

select * from employees
where first_name = 'Irena'
or first_name = 'Vidya'
or first_name = 'Maya'
limit 3;
-- 10200, 10397, 10610 / yes it does match the previous three results

/*Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, 
and who is male. What is the employee number of the top three results.
*/
select * from employees
where first_name in ('Irena', 'Vidya', 'Maya')
and gender = 'M'
limit 3;
-- 10200, 10397, 10821

-- Find all unique last names that start with 'E'.
select distinct last_name from employees
where last_name like 'E%';

-- Find all unique last names that start or end with 'E'
select distinct last_name from employees
where last_name like 'E%'
or last_name like '%e';

-- 6 Find all unique last names that end with E, but does not start with E?
select distinct last_name from employees 
where last_name like '%e';

-- Find all unique last names that start and end with 'E'.
select distinct last_name from employees
where last_name like 'E%'
and last_name like '%e';

-- Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers.
select * from employees
where hire_date like '199%'
order by emp_no
limit 3;
-- 10008, 10011, 10012

-- 9 Find all current or previous employees born on Christmas. Enter a comment with top three employee numbers.
select * from employees 
where birth_date like '%12-25'
;
-- 10078, 10115, 10261
 
 -- Find all current or previous employees hired in the 90s and born on Christmas. 
 -- Enter a comment with top three employee numbers.
 select * from employees
 where hire_date like '199%'
 and birth_date like '%12-25'
 order by emp_no
 limit 3;
 -- 1
 
 -- Find all unique last names that have a 'q' in their last name.
 select distinct last_name from employees 
 where last_name like '%q%';
 
 -- Find all unique last names that have a 'q' in their last name but not 'qu'.
 select distinct last_name from employees
 where last_name like '%q%'
 and last_name not like '%qu%';
