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

use sakila;
use pagel_2194;

create temporary table payments2 as (
select amount * 100 as amount_in_pennies
from sakila.payment);

select * from payments2;

describe payments2;

alter table payments2
modify amount_in_pennies int not null;

select * from payments3;


create temporary table payments3 as (
select amount
from sakila.payment);
select * from payments3;

update payments3
set amount = amount * 100;

alter table payments3
modify amount dec(10,2);

alter table payments3
modify amount int not null;

describe payments3;









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






select * from overall_aggregates;
use employees;
use pagel_2194;
