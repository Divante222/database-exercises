show databases;

use pagel_2194;
select database();

show tables;

create temporary table my_numbers -- my_numbers is my new table name
	(
    n int unsigned not null, -- first column
    name varchar(20) not null -- second column
    ) -- contained in parenthesis
;

select * from my_numbers;

show tables; -- temp tables dont show up in listed tables

insert into my_numbers (n, name) -- singleing out by table name and columns
values(1, 'a'), (2,'b'), (3, 'c'), (4, 'd'), (5,'a') -- inserting each column by row
;

select * from my_numbers;

update my_numbers -- updating my temp table 
set name = 'BIG'
where n >= 4
;


delete from my_numbers
where n = 2
;

select * from my_numbers;

use employees;


select * 
from employees
	join dept_emp
		using(emp_no)
	join salaries
		using(emp_no)
	join departments 
		using(dept_no)
where salaries.to_date > now()
	and dept_emp.to_date > now()
	and dept_name = 'Customer Service';



create temporary table pagel_2194.curr_employees
	(
		select employees.*,
        salary, 
        dept_name
from employees
	join dept_emp
		using(emp_no)
	join salaries
		using(emp_no)
	join departments 
		using(dept_no)
where salaries.to_date > now()
	and dept_emp.to_date > now()
	and dept_name = 'Customer Service'
	);

select * from pagel_2194.curr_employees;


use pagel_2194;
show tables;


select avg(salary) 
from curr_employees; -- I to have to recreate the big query because i have it saved as a temp table

alter table curr_employees -- adding a new column to a table (curr_employees)
add avg_dept_salary float -- adding column by specifying name and datatype
;

select * from curr_employees;

select avg(salary) 
from curr_employees;

update curr_employees
set avg_dept_salary = '67285.2302';


select * from my_numbers;

drop table pagel_2194.curr_employees;
drop table pagel_2194.my_numbers;

select * from my_numbers;
select * from curr_employees;

