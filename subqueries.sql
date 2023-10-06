-- column seviyesinde subquery
select e.employee_id, e.first_name, d.department_name
from employees e
join departments d
on  e.department_id  = d.department_id;
-- subquery yöntemi
select e.employee_id, e.first_name, (select d.department_name from departments d where d.department_id = e.department_id)
from employees e ;

-- table seviyesinde subquery
select X.REGION,X.COUNTRY,l.city from
    (
    select
        r.region_name REGION, 
        c.country_name COUNTRY ,
        C.country_id COUNTRYID
        from regions r
        join countries c
        on r.region_id = c.region_id
    ) X
join locations l
on X.COUNTRYID = l.country_id

----


-- AŞAĞIDAKİ SEKİLDE YAPINCA 2 KEZ UĞRAŞMIŞ OLUYORUZ
select hire_date as daviesDate from employees where last_name = 'Davies';
select 
last_name, 
TO_CHAR(HIRE_DATE,'DD/MM/YYYY')
from employees
where HIRE_DATE< TO_DATE('29/01/2005','DD/MM/YYYY');

-- SUBQUERY YÖNTEMİ

select 
last_name, 
TO_CHAR(HIRE_DATE,'DD/MM/YYYY')
from employees  
where 
    HIRE_DATE < TO_DATE((select hire_date as daviesDate from employees where last_name = 'Davies'),'DD/MM/YYYY');
-- kayıt sayısı birden fazl olmamalı



-- en düşük maaş alan kişiyi ve bölümünü bulma

select
first_name,
last_name, 
job_id, 
salary ,
(select department_name from departments d where e.department_id = d.department_id) depart
from employees e
where salary = (select min(salary) from employees)
;


-- taylor isimli kişinin ünvanında taylordan yüksek maaş alanların 
select *
from employees e 
where 
    e.job_id = (select job_id from employees where employee_id = 176) 
and
    e.salary > (select salary from employees where employee_id = 176)
    
    
-- 50 nolu bölümdeki en düşük maaştan daha yüksek maaş alan bölümlerdeki en düşük maaş
 select 
 department_id, 
 min(e.salary) 
 from employees e 
 group by e.department_id
 having min(e.salary) > (select min(salary) from employees where department_id = 50)
;
-- önemli   
 -- grup fonksiyonları where içine yazılmamalı
 -- having içerisine yazılamlıdır.

 -- UPDATE İÇİNDE SUBQUERY
  
UPDATE EMPLOYEES 
SET 
SALARY = 
(
    SELECT MAX(SALARY) 
    FROM EMPLOYEES 
    WHERE DEPARTMENT_ID = 50
)
WHERE DEPARTMENT_ID = 60;

-- TRİGGER İLE HATA OLURSA
DROP TRIGGER METIN.UPDATE_JOB_HISTORY; 


--- TEST AŞAMASINDA İŞLEMLER COPYALANAN FARKLI TABLODAN YAPILDI
-- BU SOYİSİMLİLERDEN 2 ŞER TANE VAR BİZ 1 TANESİNİ KALDIRACAĞIZ
SELECT LAST_NAME, COUNT(LAST_NAME) FROM EMPLOYEES_COPY GROUP BY LAST_NAME HAVING COUNT(LAST_NAME) >1

-- HER BİR KAYITIN TEKRARLIYOR İSE İLKİNİ TEKRARLAMIYOR İSE KENDİSİNİ ALAN LİSTENİN DIŞINDA KALANLARIN SİLİNMESİ
DELETE FROM EMPLOYEES_COPY
WHERE EMPLOYEE_ID NOT IN (SELECT MAX(EMPLOYEE_ID) FROM EMPLOYEES_COPY GROUP BY LAST_NAME)
