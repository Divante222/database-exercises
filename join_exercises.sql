use employees;

select * from departments;

select * from dept_manager;

select * from employees;


/*Using the example in the Associative Table Joins section as a guide, write a query that shows each 
department along with the name of the current manager for that department.
*/
select departments.dept_name, concat(employees.first_name, ' ', employees.last_name) from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
where dept_manager.to_date like '999%';
/* Find the name of all departments currently managed by women.
*/

select departments.dept_name as Department_name, concat(employees.first_name, ' ', employees.last_name) as Manager_Name from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
where dept_manager.to_date like '999%' and 
employees.gender = 'F';

-- Find the current titles of employees currently working in the Customer Service department.
select titles.title, count(*) from employees
join titles on employees.emp_no = titles.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '999%' and
departments.dept_no = 'd009' and 
titles.to_date like '999%'
and departments.dept_name = 'Customer Service'

group by titles.title;


-- Find the current salary of all current managers.

select departments.dept_name, salaries.salary,concat(employees.first_name, ' ', employees.last_name) as name from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
join salaries on employees.emp_no = salaries.emp_no
where dept_manager.to_date like '999%' and
salaries.to_date like '999%';

-- Find the number of current employees in each department.
select count(*) from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '999%'
and departments.dept_name = 'Customer Service';
-- 17569
select count(*) from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '999%'
and departments.dept_name = 'Development';
-- 61386
select count(*) from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '999%'
and departments.dept_name = 'Finance';
-- 12437
select count(*) from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '999%'
and departments.dept_name = 'Human Resources';
-- 12898
select count(*) from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '999%'
and departments.dept_name = 'Marketing';
-- 14842
select count(*) from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '999%'
and departments.dept_name = 'Production';
-- 53304
select count(*) from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '999%'
and departments.dept_name = 'Quality Management';
-- 14546
select count(*) from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '999%'
and departments.dept_name = 'Research';
-- 15441
select count(*) from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '999%'
and departments.dept_name = 'Sales';
-- 37701

-- Which department has the highest average salary? Hint: Use current not historic information.
select  departments.dept_name, round(avg(salaries.salary),2) as average_salary from employees
join salaries on employees.emp_no = salaries.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
join titles on employees.emp_no = titles.emp_no
where dept_emp.to_date like '999%'
and titles.to_date like '999%'
and salaries.to_date like '999%'
group by departments.dept_name 
;

-- Who is the highest paid employee in the Marketing department?
select concat(employees.first_name, ' ', employees.last_name) as name, max(salaries.salary) from employees
join salaries on employees.emp_no = salaries.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date like '999%'
and departments.dept_name = 'Marketing'
and salaries.to_date like '999%'
group by employees.first_name, employees.last_name
order by max(salaries.salary) desc;

-- gou birnbaum 133516

select * from departments;
select * from dept_manager;
select * from titles;
select * from salaries;
select * from employees;
select * from dept_emp;








-- Which current department manager has the highest salary?
select max(salaries.salary),employees.first_name, employees.last_name ,departments.dept_name from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on dept_manager.dept_no = departments.dept_no
join salaries on employees.emp_no = salaries.emp_no
where dept_manager.to_date like '999%'
group by employees.first_name, employees.last_name, departments.dept_name
;

-- '106491', 'Vishwani', 'Minakawa'

-- Determine the average salary for each department. Use all salary information and round your results.
select departments.dept_name, round(avg(salaries.salary),2) as average_salary from employees
join salaries on employees.emp_no = salaries.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no

group by departments.dept_name;

select * from departments;
select* from dept_manager;
select * from titles;
select * from salaries;
select * from employees;
select * from dept_emp;
