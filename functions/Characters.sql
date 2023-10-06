select 
department_name, 
lower(department_name),
upper(department_name),
length(department_name),
substr(department_name,1,3),-- oracle da string indexleri 1 den başlar, ikinci parametreyi vermediğimizde kelimenin sonuna kadar alır
substr(department_name,-5,3) -- ek olarak negatif değer verirsek sağdan sola doğru bulur aynı şekilde verilen adım kadar ilerler
from departments;

-- instr

-- verilen harfin ilk geçtiği yeri gössterir.
select instr('Metin Tekin','e') from dual;

select instr('Metin Tekin','e',4) from dual; -- 4den başlayarak ilk geçtiği yeri bul

select instr('Metin Tekin ert','e',4,2) from dual; -- 4 den başlayarak 2. kez geçtiği yeri bul
-- aynı şekilde negatif değerler de alabilir.


-- replace
select replace('Metin Tekin','Tekin','T.') ,replace('Metin Tekin','Tekin','t')from dual;

select 
first_name,
last_name,
job_id,
replace(replace(job_id,'IT','BT'),'ACCOUNT','HESAP')
from employees;

-- translate : karakter karakter çalışır
select translate
(
'oracle', -- metin
'abcdefghijklmnoprstuvxyz', -- aranacaklar
'bcdefghijklmnoprstuvxyza' -- değişecekler
) from dual;


select translate
(
'psbdmf', -- şifreli mesaji çözeceğiz
'bcdefghijklmnoprstuvxyza', -- aranacaklar
'abcdefghijklmnoprstuvxyz' -- değişecekler
) from dual;


-- rpad lpad
select
last_name,
rpad(last_name,'5','*'),
lpad(last_name,'5','*') from employees;


-- trim BOŞLUK TEMİZLEME
select 
ltrim('   O  racle   ') as "ltrim",
rtrim('   O  racle   ') as "rtrim",
trim(' 'FROM'   O  racle   ') as "trim"  from dual;

select
first_name,
last_name,
concat(concat(first_name,' '), last_name),
(first_name || ' ' || last_name) as "pipe",
concat(concat(concat(concat(first_name,' '), last_name),' is a '),job_id),
(first_name || ' ' || last_name || ' is a ' || job_id)
from employees;


