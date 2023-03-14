use employees;
-- which employees have higher than the average salary

select avg(salary)
from salaries;

select * from salaries;

select * from salaries
where salary >
	(select avg(salary) 
    from salaries);
    
select e.first_name, 
	e.last_name, 
    s.*
from salaries as s
join employees as e using(emp_no)
where salary >
	(select avg(salary) 
    from salaries)
and s.to_date > curdate();


select e.first_name, -- scaler example
	e.last_name, 
    s.salary,
    (select avg(salary) from salaries) as avg_salary -- info from the subquery
    , 'hello world'
from salaries as s
join employees as e using(emp_no)
where salary >
	(select avg(salary) 
    from salaries)
;

-- find all dept managers names and birth dates

select * from employees;

select * from dept_manager;

select emp_no from dept_manager -- the supquery
where to_date > now();


select first_name, 
last_name, 
birth_date
from employees;
    
select e.first_name, -- column subquery
e.last_name, 
birth_date,
dept_name
from employees as e
join dept_manager  as dm using(emp_no)
join departments as d using(dept_no)
where emp_no in (select emp_no from dept_manager
where to_date > now());


select first_name,last_name, birth_date from employees
where emp_no =
(select emp_no 
from employees 
where emp_no = 101010);

select * 
from employees 
where emp_no = 101010;

select sum(cnt),count(cnt),max(cnt) 
from (
	select lower(concat(substring(first_name, 1,1),
						substr(last(name,1,4),
                        ' ',
                        lpad(month(birth_date),2,0)),
                        substr(birth_date,3,2)
						))) as userName
					,count(*) as cnt 
				from employees
			group by userName
            having count(*) >=2
            order by count(*) desc) 
            as un
            
