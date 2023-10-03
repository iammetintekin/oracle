-- self join geleneksel format
select e1.first_name ||' '|| e1.last_name as "Employee", e2.first_name ||' '|| e2.last_name as "Manager" from
employees e1, employees e2
where e1.manager_id = e2.employee_id
order by e1.manager_id;

-- self join ansi format
select e1.first_name ||' '|| e1.last_name as "Employee", e2.first_name ||' '|| e2.last_name as "Manager" 
from employees e1
inner join employees e2
on e1.manager_id = e2.employee_id;