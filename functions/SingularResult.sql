-- NVL (NULL VALUE) PARAMETRE (A,B) null ise 2. parametreyi, değil ise normal değeri basar
-- veri tipi önemli sayı ise sayı döner char ise char
select first_name, commission_pct, nvl(commission_pct,0) from employees;

-- nvl2(p1,p2,p3) ilk parametre boş ise 3 değeri, boş değilse 2.değeri
select 
first_name,
salary, 
commission_pct, 
nvl2(commission_pct,salary*(1+commission_pct),salary) -- komisyon yok ise maaş yazacak sadece var ise maaşa eklenecek 
from employees;

-- nullif(a,b) iki parametre birbirine eşit değilse birinci parametreyi döndürür eşit ise null döndürür
select 
first_name,
salary, 
commission_pct, 
nullif(salary,salary- nvl(commission_pct,0)) -- 
from employees;


-- greates, least alınan parametrelerin en büyüğünü bulur,
select greatest(1,2,3,4),greatest('ali','veli','kemal','zeynep') , least(1,2,3,4),least('ali','veli','kemal','zeynep')from dual;
select min(salary) from employees;
--decode
select 
last_name, 
department_id, 
decode(department_id,
10,'Muhasebe',
20,'İnsan Kaynakları',
30,'Araştırma',
40,'Satış',
50,'BT',
'Diğer') as "decode"
from employees;

-- case, decode fonksiyonuna benzerdir.
select 
last_name, 
department_id, 
case department_id
    when 1 then 'Muhasebe'
    when 20 then 'İnsan Kaynakları'
    when 30 then 'Araştırma'
    when 40 then 'Satış'
    when 50 then 'BT'
    else 'Diğer'
end as "case example"
from employees;

-- uid kullanıcı Id ve name getirir.
select uid, user from dual;
show user;

-- syscontext
select 
SYS_CONTEXT('USERENV','SESSION_USER') AS USERNAME,
SYS_CONTEXT('USERENV','ISDBA') AS ISDBA ,
SYS_CONTEXT('USERENV','HOST') AS HOSTADDRESS,
SYS_CONTEXT('USERENV','INSTANCE') AS INSTANCE,
SYS_CONTEXT('USERENV','IP_ADDRESS') AS IP,
SYS_CONTEXT('USERENV','DB_NAME') AS DBNAME
FROM DUAL;