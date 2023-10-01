select
    department_id,
    round(avg(salary),2),
    max(salary),
    min(salary),
    sum(salary),
    count(*),
    round(stddev(salary),2), -- standart sapma,
    round(variance(salary),2)
from employees
group by department_id
having count(*)>1
order by department_id 
;
-- her bir grup için gerekli bilgileri yazar

-- rapor. maaşın kmülatif toplamını istiyor.
-- over fonksiyonu kullanılıyor
select 
first_name, 
salary,
sum(salary)over(order by first_name) as MAAS
from employees
group by first_name, salary
;


select 
first_name, 
salary, 
department_id,
sum(salary) over(partition by department_id order by salary) as MAAS -- bölüm bazlı kmülatif toplama. diğer bölümlerin fiyatı karışmaz
from employees
group by first_name, salary,department_id
order by department_id
;
 