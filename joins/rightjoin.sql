-- right join geleneksel
-- department alanı kesinlikle gelsin ama çalışanlar gelmese de olur diyorsak
-- + işareti sol tarafa yazılır(null gelmesine izin veirlen alanı belirtir)
-- sorgu sonucu departmentların hepsi gelir  
select d.department_name, e.first_name, e.last_name
from 
employees e,
departments d
where e.department_id(+)= d.department_id;
--ansi yöntemi
select d.department_name, e.first_name, e.last_name
from employees e -- null gelebilecek olan sol tarafta
right join departments d -- verileri göstermek istediklerimiz sağ tarafta
on e.department_id = d.department_id;