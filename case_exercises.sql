/*
Write a query that returns all employees, their department number, their start date, their end date, 
and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
*/

use employees;


select employees.emp_no, dept_emp.dept_no, employees.first_name, employees.last_name, employees.hire_date, dept_emp.to_date,
	case
		when dept_emp.to_date like '999%' then '1'
        when dept_emp.to_date not like '999%' then '0'
	end 'is_current_employee'
from dept_emp
join departments on dept_emp.dept_no = departments.dept_no
join employees on dept_emp.emp_no = employees.emp_no
order by employees.emp_no
;


/*
Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 
'I-Q', or 'R-Z' depending on the first letter of their last name.
*/
select employees.emp_no, dept_emp.dept_no, employees.first_name, employees.last_name, employees.hire_date, dept_emp.to_date,
	case
		when substr(employees.last_name, 1, 1) between 'A' and 'H' then 'A-H'
        when substr(employees.last_name, 1, 1) between 'I' and 'Q' then 'I-Q'
        when substr(employees.last_name, 1, 1) between 'R' and 'Z' then 'R-Z'
	end 'alpha_group'
from dept_emp
join departments on dept_emp.dept_no = departments.dept_no
join employees on dept_emp.emp_no = employees.emp_no
order by employees.emp_no
;
-- How many employees (current or previous) were born in each decade?
select employees.emp_no, dept_emp.dept_no, employees.first_name, employees.last_name, employees.hire_date, dept_emp.to_date, employees.birth_date,
	case
		when employees.birth_date like '195%' then 'Born in the 50s'
		when employees.birth_date like '196%' then 'Born in the 60s'
		when employees.birth_date like '197%' then 'Born in the 70s'
		when employees.birth_date like '198%' then 'Born in the 80s'
        when employees.birth_date like '199%' then 'Born in the 90s'
        when employees.birth_date like '200%' then 'Born in the early 2000s'
	end 'Decade born in'
from dept_emp
join departments on dept_emp.dept_no = departments.dept_no
join employees on dept_emp.emp_no = employees.emp_no
order by employees.emp_no;


/*
What is the current average salary for each of the following department groups: 
R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
*/
select round(avg(salaries.salary) , 2) as 'average salary', 
		case 
			when departments.dept_name in ('Marketing', 'Sales') then 'sales and marketing'
			when departments.dept_name in ('Research', 'Development') then 'R and D'
			when departments.dept_name in ('Production', 'Quality Management') then 'Production and Quality Management'
			when departments.dept_name in ('Finance', 'Human Resources') then 'Finance and Human Resources'
			when departments.dept_name in ('Customer Service') then 'Customer Service'
		end as departments_group
from dept_emp
join departments on dept_emp.dept_no = departments.dept_no
join salaries on dept_emp.emp_no = salaries.emp_no	
	and salaries.to_date like '999%'
group by departments_group
;

/*
case 
		when departments.dept_name in ('Marketing', 'Sales') then 'sales and marketing'
        when departments.dept_name in ('Research', 'Development') then 'R and D'
        when departments.dept_name in ('Production', 'Quality Management') then 'Production and Quality Management'
        when departments.dept_name in ('Finance', 'Human Resources') then 'Finance and Human Resources'
        when departments.dept_name in ('Customer Service') then 'Customer Service'
	end 'departments_group'*/
    
select * from employees;
select * from dept_emp;
select * from dept_manager;
select * from departments;
select * from salaries;