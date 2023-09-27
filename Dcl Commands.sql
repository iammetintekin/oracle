sys kullanıcısı : yeni kullanıcı açıp yetki ataması yapıldı.
create user tekin identified by 123;
grant connect, resource to metin;

metin kullanıcısı: farklı kullanıcıya tablolarından yetki verdi
create user tekin identified by 123;
select table_name from tabs;
-- kendi yetkisi olduğu tabloları başkasına yetki verebilir
grant select on regions to tekin;
-- tekin kullanıcısı artık tabloya sadece select işleminde erişebilir.
grant insert on regions to tekin;
grant update,delete on regions to tekin;
-- ek yetkileri de verildi.

grant insert on regions to tekin with grant option; -- eklenseydi tekin kullanıcısı da bu yetkilerine başkasına yetkilendirebilir. 

tekin kullanıcısı: yeni açılan kullanıcı
select table_name from tabs;
select * from metin.regions
insert into metin.regions(region_id, region_name) values(6,'Antartika');
delete from metin.regions where regıon_ıd = 6;
commit;

-- verilen yetkileri görme
select * from user_tab_privs_made;
-- yetkilerin geri alınması
revoke select on regions from tekin;
revoke delete, update on regions from tekin;
revoke insert on regions from tekin;

-- tüm kullanıcılara yetki verme
grant select on regions to public;
-- bu hatalı yetki verme işlemidir. yetkiler sadece rollere göre verilir.

-- YENI kullanıcı tanımlama ve şifre güncelleme
create user bilge;
grant connect, resource to bilge;
ALTER USER bilge IDENTIFIED BY 123;

-- rol işlemleri
grant create role to metin;

-- metin kullanıcı rol yetkileri aldı
-- creating roles
create role r_selupt;
create role r_insdel;

grant select, update on regions to r_selupt;
grant insert, delete on regions to r_insdel;


grant r_selupt to bilge;
grant r_insdel to tekin;

-- rol kendine atandktan sonra setlemesi gerekiyor

set role r_insdel;
-- ardından işlemler yapılır.
set role r_selupt;
select * from metin.regions;

revoke update on regions from r_selupt;
-- yetkileri roller üzerinden aldık.
-- kullanıcıdan alma
revoke r_insdel from tekin;

-- rol silme
drop role r_insdel;
