select e.first_name,e.department_ıd,d.department_ıd,d.department_name from employees e,departments d 
-- axb gibi düşün
-- genelde test verileri üretmede kullanılır. herhangi bir join görevi yapılmıyor sadece bilgi arttıtrmak için
select e.first_name,e.department_ıd,d.department_ıd,d.department_name from employees e cross join departments d 
