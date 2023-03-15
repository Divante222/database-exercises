use employees;

select
concat(first_name, ' ', last_name),
dept_no,
emp_no,
hire_date,
to_date,
if(to_date > now(), 1, 0) as is_current_employee,
if(to_date > now(), TRUE, FALSE) as is_current_employee,
to_date > now() as is_current_employee -- shortest option
from employees	
	join dept_emp
		using(emp_no)
;

select first_name
from employees
where left(first_name, 1) >= 'H'

;
-- left start at left side of the str
-- right() starts at right start of the str
select first_name, last_name,
	case
		when left(last_name, 1) <= 'H' then 'A-H'
        when left(last_name, 1) <= 'Q' then 'I-Q'
        else 'R-Z'
	end as alpha_group
        
from employees;

select min(birth_date), max(birth_date)
from employees;

select count(*),
	case 
		when birth_date like '195%' then '50s'
        when birth_date like '196%' then '60s'
	end as birth_decade
from employees
group by birth_decade;

select round(avg(salaries.salary),2),
	case
		when dept_name in ('Research', 'Development') then 'R&D'
        when dept_name in ('sales', 'marketing') then 'sales and marketing'
        when dept_name in ('production', 'quality management') then 'prod and qm'
        when dept_name in ('finance', 'human resources') then 'finance and HR'
        else dept_name
	end as dept_group
from departments
	join dept_emp
		using(dept_no)
	join salaries
		using(emp_no)
where salaries.to_date > now()
	and dept_emp.to_date > now()
group by dept_group;

select * from dept_emp;
select * from salaries;


select employees.emp_no ,
	concat(first_name, ' ', last_name),
    hire_date,
    max_date,
    dept_no,
	if(max_date > now(), TRUE, FALSE) as is_current_employee
from employees
join	
	(select emp_no, max(to_date) as max_date
	from dept_emp
	group by emp_no)as current_hire_date using(emp_no) 
join dept_emp
	on dept_emp.to_date = current_hire_date.max_date
		and dept_emp.emp_no = current_hire_date.emp_no;


select * 
from dept_emp
limit 11;



