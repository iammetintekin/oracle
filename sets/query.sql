-- iki tabl oluşturduk
select * from departments order by department_id;
create table dept1
as select * from departments where department_id <160;
create table dept2
as select * from departments where department_id <100;


-- tekrar eden kayıtları 1 kere gösterir
select * from dept1 union select * from  dept2
order by 1;
-- not : her iki sorgudaki kolon sayıları aynı olmalı

-- tekrar edenlei de gösterir
select * from dept1 UNION ALL select * from  dept2
order by 1;
-- not : her iki sorgudaki kolon sayıları aynı olmalı


-- intersect ve minus a&b ile b&a aynıdır
-- select ile seçilen columnlar da aynı olmalı
select * from dept1 intersect select * from  dept2
order by 1;


-- a da olup b de olmayanlar
select * from dept1 minus select * from  dept2
order by 1;

-- b de olup a da olmayanlar
select * from dept2 intersect select * from  dept1
order by 1;

-- bir kümenin kendinden farkı da sıfırdır.