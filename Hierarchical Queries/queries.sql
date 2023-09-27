-- Hierarchical Queries

-- connect by prior örneği. (çalışanlar ile yöneticiler arasındaki hiyerarşi ilişkisi)
-- primary key hangi tarafta ise prior o tarafa yazılır
select employee_id, first_name, last_name, manager_id
    from employees
    connect by prior employee_id=manager_id
    order by employee_id
    ;


-- level örneği (çalışanlar ile yöneticiler arasındaki, seviye no)
-- her bir kişinin seviyesini de sağ tarafa yazdırmak istiyoruz
select employee_id, first_name, last_name, manager_id, level
    from employees
    connect by prior employee_id=manager_id
    ;



-- start with örneği( hiyerarşiyi belirli bir noktadan başlatabiliriz ayrıca siblings anahtar 
--kelimesiyle sıralama yapabiliriz)
select employee_id, first_name, last_name, manager_id, level
    from employees
    start with employee_id = 100 -- 100 den başlası en üstteki kişiden başlattık
    connect by prior employee_id=manager_id
    order siblings by last_name --  siblings eklenirse hiyerarşik yapıyı bozmaz
    ;

-- connect by root -sys_connect by path örneği (her çalışanın hiyerarşide bağlı olduğu üst birim ve seviyesi)
select 
CONCAT(CONCAT(first_name, ' '), last_name) as "Çalışan Bilgileri",
level-1 as "Seviye", -- seviyeyi gösterir
connect_by_root CONCAT(CONCAT(first_name, ' '), last_name) as "Yönetici İsim", -- en sondaki rootunun lastname gösterir
sys_connect_by_path(CONCAT(CONCAT(first_name, ' '), last_name), '>') as "Hiyerarşi" -- bağlı olduğu hiyererşik yapıyı gösterir
from employees
where department_id = 110 and level > 1
connect by prior employee_id = manager_id
