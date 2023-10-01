-- oturum açılan yer current_date
-- sysdate databaaestimezone
-- systimestamp zaman damgası

select current_date as "Current", sysdate as "System", sessiontimezone as "TimeZone" from dual;
select systimestamp from dual;


select 
sysdate,
to_char(sysdate,'D'), -- HAFTANIN KAÇINCI GÜNÜ
to_char(sysdate,'DD'), -- AYIN
to_char(sysdate,'DDD'), -- YILIN
to_char(sysdate,'DAY'), -- GÜN İSMİ
to_char(sysdate,'DY'), -- GÜN İSMİ KISA
to_char(sysdate,'W'), -- AYIN HAFTAS
to_char(sysdate,'WW'), -- YILIN HAFTASI
to_char(sysdate,'MM'), -- AY NO
to_char(sysdate,'MON'), -- AY NAME
to_char(sysdate,'YY'), -- YIL 2 BASAMAK
to_char(sysdate,'YYYY'), -- YIL
to_char(sysdate,'YEAR'), -- YIL YAZILIŞ
to_char(sysdate,'HH12:MM:SS') -- SAAT
from dual;