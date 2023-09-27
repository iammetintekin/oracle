INSERT INTO regions VALUES(1,'Europe')

alter table regions add populate number(15);

insert into regions(region_id, region_name) values(2,'Asia');

alter table regions drop column populate;

delete from regions;
-- silme işleminin kalıcı olması için
COMMIT;

-- select komutunun en yalın hali
select * from employees order by department_id desc, salary asc;


-- tablodaki belirli bir verinin alınması
select first_name, last_name, email from employees
order by first_name, last_name;
-- order by 2,3 de aynı işlemi yapar



-- sorgulanan kolanlarının başlıklarının değiştirilmesi. label alias.
select manager_id "Yönetici Id", first_name "İsim", last_name "Soyisim", email "E-Posta Adresi" from employees;



-- 90 numaraları bölümde çalışanlar
select * from employees where department_id = 90


-- hem 90 hem 100 numarada çalışanlar
select * from employees where department_id in (90,100); -- in performansı etkilyen sorgudur.
select * from employees where department_id = 90 or department_id = 100
order by salary desc;



-- soyismi m ile başlayanların listesi
select * from employees where last_name like 'M%';
-- soyisminde ma geçenler
select * from employees where last_name like '%Ma%';
-- soyismi ikinci harfi a, dördüncü harfi e olan çalışmalar
select * from employees where last_name like '_a_e%';
-- maaşı 10.000 üzerinde olup komisyon oranı boş olmayanlar
select * from employees where salary > 10000 and commission_pct is not null;
