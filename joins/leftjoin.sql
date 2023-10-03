-- tanımlı şube konumlarının bulunduğu şehirlere kadar gösteren geleneksel yöntem
select 
r.region_name, c.country_name,l.city
from 
regions r, countries c, locations l
where r.region_id = c.region_id(+) -- artı işareti koyduğumuz taraf boş olabilir
and
c.country_id = l.country_id(+)


-- ansi format
select 
r.region_name, c.country_name,l.city
from regions r
left join countries c
    on r.region_id = c.region_id
left join locations l
    on c.country_id = l.country_id 
order by 1,3;



