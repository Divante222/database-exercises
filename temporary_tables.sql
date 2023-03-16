use pagel_2194;

/*
Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, 
last_name, and dept_name for employees currently with that department. 

Be absolutely sure to create this table on your own database. 
If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.
*/

create temporary table employees_with_departments(
first_name varchar(100) not null,
last_name varchar(100) not null,
dept_name varchar(100) not null);
show tables;
select * from employees_with_departments;

insert into employees_with_departments(first_name , last_name, dept_name)
values('Divante' ,'Parness', 'Finance');
/* Add a column named full_name to this table. It should be a VARCHAR whose 
length is the sum of the lengths of the first name and last name columns.*/
alter table employees_with_departments
add full_name varchar(100);

update employees_with_departments
set full_name = concat(first_name, ' ' , last_name);

select * from employees_with_departments;

use employees;

select e.first_name, e.last_name, dept_name
from employees as e
join dept_emp as de using(emp_no)
join departments as d using(dept_no)
where to_date > curdate();

use pagel_2194;

create temporary table employees_with_departments2 as	(
	select first_name, last_name, dept_name
	from employees.employees 
	join employees.dept_emp  using(emp_no)
	join employees.departments using(dept_no)
	where to_date > curdate());
    


describe employees_with_departments2;

alter table employees_with_departments2 
add full_name varchar(30);

update employees_with_departments2
set full_name = concat(first_name, ' ' , last_name);


alter table employees_with_departments2 drop column first_name;
alter table employees_with_departments2 drop column last_name;



select * from employees_with_departments2;


/*
Update the table so that the full_name column contains the correct data.
*/

update employees_with_departments
set full_name = concat(first_name, ' ' , last_name);

-- Remove the first_name and last_name columns from the table.
alter table employees_with_departments drop column first_name;
alter table employees_with_departments drop column last_name;

select * from employees_with_departments;

-- What is another way you could have ended up with this same table?
-- by adding the full name column from the beginning and not adding the first and last name columns.alter

/*
Create a temporary table based on the payment table from the sakila database.

Write the SQL necessary to transform the amount column such that it is stored as an 
integer representing the number of cents of the payment. For example, 1.99 should become 199.
*/
use pagel_2194;
use sakila;
show tables;


create temporary table the_sakila_temporary_table as 
select * from sakila.payment;



alter table the_sakila_temporary_table 
add amount_ int;

update the_sakila_temporary_table
set amount_ = amount * 100;



alter table the_sakila_temporary_table 
add amount_2 varchar(100);

update the_sakila_temporary_table
set amount_2 = amount;



alter table the_sakila_temporary_table 
add amount_3 decimal;

update the_sakila_temporary_table
set amount_3 = amount;


alter table the_sakila_temporary_table 
add amount_4 int;

update the_sakila_temporary_table
set amount_4 = concat(left(amount,1), left(amount, 2), left(amount, 3));





ALTER TABLE the_sakila_temporary_table DROP COLUMN amount_2;



-- alter table the_sakila_temporary_table
-- drop column amount;

select * from the_sakila_temporary_table;
/*
Find out how the current average pay in each department compares to the overall current pay for everyone at the company. 
For this comparison, you will calculate the z-score for each salary. In terms of salary, what is the best department 
right now to work for? The worst?
*/

create temporary table overall_aggregates as (
select avg(salary) as avg_salary, std(salary) as avg_std_salary
from employees.salaries
where to_date > curdate())
;


select dept_name, avg(salary) as department_current_average
from employees.salaries
join employees.dept_emp using(emp_no)
join employees.departments using(dept_no)
where employees.dept_emp.to_date > curdate()
and employees.salaries.to_date > curdate()
group by dept_name;

create temporary table current_info as (
	select dept_name, avg(salary) as department_current_average
	from employees.salaries
	join employees.dept_emp using(emp_no)
	join employees.departments using(dept_no)
	where employees.dept_emp.to_date > curdate()
	and employees.salaries.to_date > curdate()
	group by dept_name
);

select * from current_info;

alter table current_info 
add overall_average float(10,2);

alter table current_info 
add overall_average_std float(10,2);

update current_info
set overall_average = (select avg_salary from overall_aggregates);

update current_info
set overall_average = (select avg_std_salary from overall_aggregates);


alter table current_info
add zscore float(10,2);

select * 
from current_info;

update current_info
set zscore = (department_current_average - overall_avg / overall_std);

select * 
from current_info
order by zscore desc;

select * from the_sakila_temporary_table;

use employees;


select departments.dept_name, round(avg(salaries.salary) , 2) as 'average salary',
        round(avg((SELECT stddev(salary) FROM salaries where to_date > now())),2) AS zscore
from dept_emp
join departments on dept_emp.dept_no = departments.dept_no
join salaries on dept_emp.emp_no = salaries.emp_no	
	and salaries.to_date like '999%'
group by departments.dept_name
;




select * from employees;
select * from departments;
select * from salaries;
select * from dept_emp;


