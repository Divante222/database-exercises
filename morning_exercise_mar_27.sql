use employees;

show tables;

select employees.first_name, employees.last_name, salaries.salary from dept_manager 



left join employees on dept_manager.emp_no = employees.emp_no
join salaries on dept_manager.emp_no = salaries.emp_no
where dept_manager.to_date like '999%'
and salaries.to_date like '999%';

select * from employees
join salaries on employees.emp_no = salaries.emp_no

;



select e.first_name, e.last_name, s.salary
from employees as e
join salaries s using(emp_no)
where e.emp_no in (select emp_no from dept_manager where to_date > curdate())
	and s.to_date > curdate()
    and s.salary > (select avg(salary) + std(salary)
					from salaries) ;
               
               
               
	COL_LENGTH('dbo.Artists', 'ArtistName')		user salary sum(salaries.salary)	(test to specific salary)			avg(salaries.salary)  std(salaries.salary)

    
((1 / number of data points) *    				(the sum of all values)(the Ith data point - avg())^4 / std()^4) - 3            




