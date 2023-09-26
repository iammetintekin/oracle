insan kaynakları projesi için gerekli tablolarımızın oluşturulduğu queryler.

create table regions(
    region_id number,
    region_name varchar2(25)
);

create table countries(
    country_id char(2),
    country_name varchar2(40),
    region_id number
);

create table locations(
    location_id number(4),
    street_adress varchar2(40),
    postal_code varchar2(12),
    city varchar2(30) not null,
    state_province varchar2(25),
    country_id char(2)
);


create table departments(
    department_id number(2),
    department_name varchar2(30),
    manager_id number(4)
);

create table jobs(
    job_id varchar2(10),
    job_title varchar2(35) not null,
    min_salary number(6),
    max_salary number(6)
);

create table employees(
    employe_id number(6),
    first_name varchar2(20),
    last_name varchar2(25),
    email varchar2(25) not null,
    phone_number varchar2(20),
    hire_date date not null,
    job_id varchar2(10),
    salary number (8,2),
    comission_pct number(2,2),
    manager_id number(6),
    CONSTRAINT emp_salary_min check (salary>0),
    CONSTRAINT emp_email_unique UNIQUE (email)
);


create table job_history(
    employee_id number(6),
    start_date date not null,
    end_date date not null,
    job_id varchar2(10),
    department_id number(4),
    CONSTRAINT job_history_date_check CHECK(end_date>start_date)
);

