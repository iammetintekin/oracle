-- iki tablo arasındaki aynı isimdeki kolonlar
-- bu kolonların değerleri eşit olanları listeler
-- veri tipleri de aynı olmalı

-- ansi format
select employee_id,first_name,job_id,job_title 
from employees
natural join jobs
order by employee_id;

-- geleneksel format
select 
    e.employee_id,
    e.first_name,
    e.job_id,
    j.job_title 
from employees e, jobs j
where e.job_id = j.job_id
order by employee_id;

