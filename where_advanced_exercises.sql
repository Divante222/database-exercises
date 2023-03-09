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
but use OR instead of IN.  number of the top tWhat is the employeehree results? Does it match the previous question?*/

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
select last_name from employees
where last_name like 'E%'
or last_name like '%e';

-- 6 Find all unique last names that end with E, but does not start with E?