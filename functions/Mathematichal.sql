-- sign : işaret fonksiyonu, aldığı değerin pozitif mi veya negatif olduğunu söyler
select sign(-3), sign(3) from dual; -- dual sanal bir tablo
select salary, sign(salary) from employees;

-- abs : mutlak değer
select abs(-4) ,abs(-100.12),abs(123.45)from dual;

-- trigonometrik ifadelerde radyana çevirmek gerekli
-- D / 180° = R / π
-- 30 dereceyi bulmak için radyan değerini bilmek gerekiyor derece * pi bölü 180
select cos(30 * 3.1415 /180) from dual;
select sin(30 * (22/7) /180) from dual;
select cos(0) from dual;
select sin(0) from dual;
select tan(45 * (22/7) /180) from dual;

-- aynı şekilde arc sn, cos gibi ters fonksiyonlar da hesaplanabilir.
-- virgülden sonra 38 hane gösterir.

-- ceil, floor : yukarı aşağı en yakın tam sayı
-- exp : e (exponential, üstel)
select ceil(123.45), ceil(-5.6), floor(123.45), floor(-5.6) from dual;
select exp(1),exp(2) from dual; -- e sayısınınz üstünü alır 

-- ln : doğal logaritma
-- e ve ln birbirinin tersi
-- -y = ln(x)   x = e^y    ln(e) = 1
select ln(1), ln(2), ln(exp(1)) from dual;

-- log : normal logaritma iki parametre alır
select log(10,10), log(3,3), log(10,100), log(4,64) from dual;

-- mod : modüler aritmetik
select mod(10,10), mod(95,3) from dual;
select level, mod(100,level) from dual connect by level<12;
select level +(4), mod(100,level +(4)) from dual connect by level +(4) <12;
select level +(1) from dual connect by level <10;
-- power : kuvvet

select power(3,2) from dual;
-- sqrt : karekök
select sqrt(81) from dual;

-- round : yuvarlama, virgülden sonraki sayıları alma. - + sayılar yazabilir. yazılan basamağa göre alır ve en yakın ta sayıya yuvarlar

select round(1234.5678,0),round(1234.5678,1), round(1234.5678,2), round(1234.5678,3), round(1234.5678,4) from dual;
select round(1234.5678,0),round(1234.5678,-1), round(1234.5678,-2), round(1234.5678,-3), round(1234.5678,-4) from dual;