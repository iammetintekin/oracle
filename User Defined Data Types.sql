CREATE TYPE ADRES_T AS OBJECT(
    CADDE VARCHAR(30),
    SEHIR VARCHAR2(30),
    ULKE_KODU CHAR(2),
    POSTA_KODU CHAR(5)
);

Type ADRES_T compiled
ADRES_T tipi oluşturuldu

CREATE TYPE adres_tab IS TABLE OF ADRES_T;
ADRES_T adres_tab ' a bağlandı.

create table MUSTERILER
(
    MUSTERI_ID NUMBER(10),
    ADRES adres_tab
)nested table ADRES STORE AS MUSTERI_ADRES;

Table MUSTERILER created.

Name       Null? Type       
---------- ----- ---------- 
MUSTERI_ID       NUMBER(10) 
ADRES            ADRES_TAB  

Veri ekleme

INSERT INTO MUSTERILER
VALUES(1, ADRES_TAB(
                ADRES_T('İstanbul Caddesi','Ankara','TR',06100),
                ADRES_T('İstiklal Caddesi','İstanbul','TR',34100)
                )
);

INSERT INTO MUSTERILER
VALUES(2, ADRES_TAB(
                ADRES_T('Kızılay Caddesi','Ankara','TR',06200),
                ADRES_T('Beşiktaş Sahil','İstanbul','TR',34200)
                )
);

Listeleme

select M.MUSTERI_ID, A.*
    from MUSTERILER  M , TABLE(ADRES)  A;

1	İstanbul Caddesi	Ankara	TR	6100 
1	İstiklal Caddesi	İstanbul	TR	34100
2	Kızılay Caddesi	Ankara	TR	6200 
2	Beşiktaş Sahil	İstanbul	TR	34200