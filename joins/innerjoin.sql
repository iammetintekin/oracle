-- personal biligleri getirme
-- geleneksel format
select 
    e.last_name,
    d.department_name,
    l.city
from employees e, departments d, locations l
where 
e.department_id = d.department_id
and
d.location_id = l.location_id
order by e.last_name;

-- ansi format
select 
    e.last_name,
    d.department_name,
    l.city
from employees e
inner join departments d
on e.department_id = d.department_id
inner join locations l
on d.location_id = l.location_id 
order by e.last_name;
-- inner join ve join yazmanın bir farkı yoktur.