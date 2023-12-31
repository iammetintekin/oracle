
create table deneme(
    id number,
    name varchar2(50)
);

insert into deneme values (1,'Metin')

returns error
--  'USERS' tablo alanı üzerinde hiç ayrıcalık yok
--  Users tablespace üzerinde kota vermediğimiz için kayıt giremiyoruz.

grant unlimited tablespace to metin;

-- tekrardan insert komutunu çalıştırdığımızda 1 row inserted bilgisi döner.
-- yapılan işlemleri geri alalım
SQL> revoke connect from metin; -- yetkileri geri alma
Revoke succeeded. -- eğer oturum açıldıysa o oturum kapanana kadar işlem yapabilir.

SQL> drop user metin cascade; -- cascade eklenirse kullanıcı ve oluşturduğu tablolar silinir.
drop user metin cascade
*
ERROR at line 1: -- oturum açtığı için silinemedi hatası, sqldeveloper uygulamasından oturum kapatılır.
ORA-01940: cannot drop a user that is currently connected

SQL> drop user metin cascade;
User dropped. -- kullanıcı silme başarılı.

