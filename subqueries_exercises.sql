use employees;
-- declare v1 as float
-- set v1 = 23;



-- Find all the current employees with the same
-- hire date as employee 101010 using a subquery.
select employees.first_name, employees.last_name, employees.hire_date, dept_emp.to_date from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
where employees.hire_date = 
(select hire_date from employees
where emp_no = '101010')
and dept_emp.to_date like '999%';


-- Find all the titles ever held by all current 
-- employees with the first name Aamod.
select employees.first_name, employees.last_name , titles.title from  employees
join titles on employees.emp_no = titles.emp_no
where first_name in
(select first_name from employees
where first_name = 'Aamod'
)
group by employees.first_name, employees.last_name,titles.title
;


/* How many people in the employees table are no longer working for the company? 
Give the answer in a comment in your code.
*/

select count(emp_no) from employees
where employees.emp_no not in (
select emp_no from dept_emp
where to_date like '999%');  
  


/*Find all the current department managers that are female. 
List their names in a comment in your code.*/



select * from dept_manager
where to_date like '999%'
and emp_no in
(select emp_no from employees 
where gender = 'F');

-- Find all the employees who currently have a higher salary than the
-- companies overall, historical average salary.

select employees.first_name, employees.last_name, salaries.salary from employees
join salaries on employees.emp_no = salaries.emp_no
	and salaries.to_date like '999%'
where salaries.salary > (select avg(salary) from salaries);
show tables;

/* How many current salaries are within 1 standard deviation of the 
current highest salary? (Hint: you can use a built in function to 
calculate the standard deviation.) What percentage of all salaries is this?
*/


/*(select stddev(salary) from salaries
where to_date like '999%') -
(select max(salary) from salaries
where to_date like '999%');*/

select * 
from salaries
where to_date like '999%'
and salary between 
v1 and 
(select max(salary) from salaries
where to_date like '999%') 



;




-- the answer
select count(*) from salaries
where to_date like '999%'
and salary >

(select max(salary) from salaries
where to_date like '999%') - 

(select stddev(salary) from salaries
where to_date like '999%');




select stddev(salary) from salaries
where to_date like '999%';
select max(salary) from salaries
where to_date like '999%';

select * from departments;
select * from dept_emp;
select * from titles;
select * from employees;
select * from dept_manager;
select * from salaries;