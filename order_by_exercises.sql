/* find all employees with first names 'Irena', 'Vidya', or 'Maya', 
and order your results returned by first name. In your comments, 
answer: What was the first and last name in the first row of the results? 
What was the first and last name of the last person in the table?*/

use employees;
select database();

show tables;
select first_name , last_name from employees
where first_name in ('Irena', 'Vidya', 'Maya')
order by first_name desc
;
-- irena reutenauer, vidya awdeh

/*Find all employees with first names 'Irena', 'Vidya', or 'Maya', 
and order your results returned by first name and then last name. 
In your comments, answer: What was the first and last name in the first row of the results? 
What was the first and last name of the last person in the table?*/

select first_name, last_name from employees
where first_name = 'Irena'
or first_name = 'Vidya'
or first_name = 'Maya'
order by first_name desc, last_name desc
;
-- irena acton, vidya zweizig

/*
Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned 
by last name and then first name. In your comments, answer: What was the first and last name in 
the first row of the results? What was the first and last name of the last person in the table?
*/
select last_name, first_name from employees
where first_name in ('Irena', 'Vidya', 'Maya')
and gender = 'M'
order by last_name desc, first_name desc
;
-- acton irena, zyda maya

/*
Write a query to to find all employees whose last name starts and ends with 'E'. 
Sort the results by their employee number. 
Enter a comment with the number of employees returned,
the first employee number and their first and last name, and the last employee number with their first 
and last name.*/

select first_name, last_name , emp_no from employees
where last_name like '%e'
and last_name like 'e%'
order by emp_no desc;
-- 899 employee numbers
-- ramzi erde 10021
-- tadahiro erde 499648

/*
Write a query to to find all employees whose last name starts and ends with 'E'. 
Sort the results by their hire date, so that the newest employees are listed first. 
Enter a comment with the number of employees returned, the name of the newest employee, 
and the name of the oldest employee.*/

select count(*) from employees
where last_name like 'e%'
and last_name like '%e'
order by hire_date;
-- 899
-- sergi erde
-- teiji eldridge

/*
Find all employees hired in the 90s and born on Christmas. 
Sort the results so that the oldest employee who was hired last is the first result. 
Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, 
and the name of the youngest employee who was hired first.*/

select * from employees
where hire_date like '199%'
and birth_date like '%12-25'
order by birth_date desc, hire_date desc;

-- 362
-- gudjon vakili
-- tremaine eugenio