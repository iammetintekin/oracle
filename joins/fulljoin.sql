-- full join left ve rightin birleşmiş halidir
-- bütün kayıtlar listeleneir boş olanlar da null yazdırır.

select d1.department_id, d1.department_name as "D1", d2.department_id, d2.department_name as "D2"
from dept1 d1
full join dept2 d2
on d1.department_id = d2.department_id


-- geleneksel yöntem de sol ve sağ joinlerin geleneksel yazımları birleştirilir.
select 
d1.department_id, 
d1.department_name as "D1", 
d2.department_id, 
d2.department_name as "D2"
from dept1 d1,dept2 d2
where d1.department_id = d2.department_id(+) -- left join
union
select 
d1.department_id, 
d1.department_name as "D1", 
d2.department_id, 
d2.department_name as "D2"
from dept1 d1,dept2 d2
where d1.department_id(+) = d2.department_id -- right join