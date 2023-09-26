alter table regions add(
    CONSTRAINT reg_id PRIMARY KEY(region_id)
);
-- ülkedeki region id regionsdaki region id den foreign key referans alsın dedik.
-- işlemden önce alan kesinlikle foreign key olarak tanımlanmış olması gerekir. 
ALTER TABLE COUNTRIES ADD(
    CONSTRAINT country_reg_fk FOREIGN KEY(region_id) REFERENCES regions(region_id)
);

alter table COUNTRIES add(
    CONSTRAINT country_id_pk PRIMARY KEY(country_id)
);

ALTER TABLE LOCATIONS ADD(
    CONSTRAINT location_id_pk PRIMARY KEY(location_id), -- primary key ekleme
    CONSTRAINT location_country_fk FOREIGN KEY(country_id) REFERENCES COUNTRIES(country_id)
    -- ülke id konumdaki ülke id ye bağladık.
);
-- department tablosuna location eklenmemiş
-- sütun ekleme örneği
alter table departments add location_id number(4);

alter table DEPARTMENTS ADD(
    CONSTRAINT dep_id_pk PRIMARY KEY(department_id),
    CONSTRAINT DEP_LOC_FK FOREIGN KEY(location_id) REFERENCES locations (location_id)
);

ALTER TABLE EMPLOYEES ADD department_id number(2); -- unutulan sütun eklendi

alter table jobs add(
    CONSTRAINT job_id_pk PRIMARY KEY(JOB_ID)
);

ALTER TABLE EMPLOYEES ADD(
    CONSTRAINT emp_emp_id_pk PRIMARY KEY(employe_id),
    CONSTRAINT emp_dep_fk FOREIGN KEY(department_id) references departments (department_id),
    CONSTRAINT emp_job_fk FOREIGN KEY(job_id) REFERENCES JOBS(job_id),
    CONSTRAINT emp_manager_fk FOREIGN KEY(manager_id) references employees(employe_id) 
    -- managerlar da bir bölümün çalışanı olduğu için kendi kendisine bağlı yönetici gibi olabiliyor :D
);


alter table departments add(
    CONSTRAINTS dep_manager_id FOREIGN KEY(manager_id) REFERENCES EMPLOYEES(EMPLOYEE_ID)
); --EMPLOYE NİN DEPARTMENT İD Sİ OLDUĞU GİBİ DEPARTMENİN DA MANAGER(EMPLOYE) Sİ OLABİLİR.

ALTER TABLE EMPLOYEES RENAME COLUMN employe_id TO employee_id; -- sütun ismi değiştirme

-- her tabloda 1 pk olabilir ama bir tabloda birden çok pk tanımlanabilir.
alter table job_history ADD(
    CONSTRAINT jobhist_emp_id_start_date_pk PRIMARY KEY(employee_id, start_date),
    CONSTRAINT jobhist_jobid_fk FOREIGN KEY(JOB_ID) REFERENCES JOBS(JOB_ID),
    CONSTRAINT jobhist_emp_id_fk FOREIGN KEY(employee_id) REFERENCES EMPLOYEES(employee_id),
    CONSTRAINT jobhist_dept_fk FOREIGN KEY(department_id) REFERENCES DEPARTMENTS(department_id)
);

-- foreign key kaldırmada constraintin adı gerekli
alter table departments drop CONSTRAINT dep_manager_id;

-- TABLO SİLME
drop table regions; 
-- bu tabloya bağlı olan tablolar olduğu için drop etmez
-- fakat CASCADE CONSTRAINTS eklenirse tabloyu siler.

-- sistem kullanıcısıyla bağlandığımızda user silinemesi
drop user metin cascade; -- o sırada kullanıcı bağlantılı olmamalı