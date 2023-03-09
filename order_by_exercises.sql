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

-- ########Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers.
select * from employees
where hire_date > '1990-01-01' 
and hire_date < '1999-12-31'
limit 3;

-- 9 Find all current or previous employees born on Christmas. Enter a comment with top three employee numbers.
select * from employees 
where birth_date like '%12-25'
;
-- Danel, Chikara, Mang
 
 -- Find all current or previous employees hired in the 90s and born on Christmas. 
 -- Enter a comment with top three employee numbers.
 select * from employees
 where hire_date between '1990-01-01' and '1999-12-31'
 and birth_date like '%12-25'
 limit 3;
 -- mang, Evgueni, Florina
 
 -- Find all unique last names that have a 'q' in their last name.
 select distinct last_name from employees 
 where last_name like '%q%';
 
 -- Find all unique last names that have a 'q' in their last name but not 'qu'.
 select distinct last_name from employees
 where last_name like '%q%'
 and last_name not like '%qu%';


/*Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
In your comments, answer: What was the first and last name in the first row of the results? 
What was the first and last name of the last person in the table?*/

use employees;
select database();

show tables;
select * from employees;
select first_name, last_name from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name;
-- Irena, Reutenauer/ Vidya, Simmen

/* Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name 
and then last name. In your comments, answer: What was the first and last name in the first row of the results? 
What was the first and last name of the last person in the table?*/
select first_name, last_name from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name, last_name;

-- Irena, Acton / Vidya, Zweizig

/* Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last 
name and then first name. In your comments, answer: What was the first and last name in the first row of 
the results? What was the first and last name of the last person in the table?*/

select first_name, last_name from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by last_name, first_name;

-- Irena, Acton/ Maya, Zyda

/* Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by 
their employee number. Enter a comment with the number of employees returned, the first employee number 
and their first and last name, and the last employee number with their first and last name.*/

select emp_no, first_name, last_name from employees
where last_name like '%e'
and last_name like 'E%'
order by emp_no;

-- count 899 / 10021, Ramzi, Erde/ 499648, Tadahiro, Erde

/*Write a query to to find all employees whose last name starts and ends with 'E'. 
Sort the results by their hire date, so that the newest employees are listed first. 
Enter a comment with the number of employees returned, the name of the newest employee, 
and the name of the oldest employee.*/ 

select * from employees
where last_name like ('%E')
and last_name like ('E%')
order by hire_date desc;

-- 889 count/ Teiji, Eldridge/ Sergi, Erde

/* Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee 
who was hired last is the first result. Enter a comment with the number of employees returned, the name of the 
oldest employee who was hired last, and the name of the youngest employee who was hired first.*/
select * from employees
where hire_date between '1990-01-01' and '1999-12-31'
and birth_date like '%12-25'
order by birth_date, hire_date desc;

-- count 362/ Khun, Bernini/ Douadi, Pettis
