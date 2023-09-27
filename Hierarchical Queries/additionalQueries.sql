 
SQL*Plus: Release 19.0.0.0.0 - Production on Tue Sep 26 16:55:18 2023
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Enter user-name: metin
Enter password:
Last Successful login time: Tue Sep 26 2023 11:50:41 +03:00

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> create table employees_copy as
  2  select * from employees; -- tablonun kopyasını oluşturma

Table created.

SQL> update employees_copy
  2  set salary = salary * 1.20,
  3  commission_pct = 25,
  4  clear
  5  cdfsfs
  6  ;
cdfsfs
*
ERROR at line 5:
ORA-00927: missing equal sign


SQL> update employees_copy
  2  set salary = salary * 1.20,
  3  commission_pct = 0.25,
  4  where employee_id <> 100;
where employee_id <> 100
*
ERROR at line 4:
ORA-01747: invalid user.table.column, table.column, or column specification


SQL> update employees_copy set salary = salary*1.20, commission_pct = 0.25 where employee_id <> 100;

106 rows updated.

SQL> commit
  2  ;

Commit complete.

SQL> update employees_copy set salary = salary-400, commission_pct = NULL;

107 rows updated.

SQL> rollback;

Rollback complete.

SQL> update employees_copy set salary = salary-400, commission_pct = NULL where employee_id in (101,102);

2 rows updated.

SQL> ed
Wrote file afiedt.buf

  1* update employees_copy set salary = salary-400, commission_pct = NULL where employee_id in (101,102)
SQL> commit;

Commit complete.


--sql plus commmand line
select employee_id, salary, commission_pct from employees_copy  where employee_id = 100;
update employees_copy set salary = 1 where employee_id = 100;
COMMIT WAIT;
ROLLBACK; 


update employees_copy A 
set A.salary = (SELECT B.SALARY FROM EMPLOYEES B
                WHERE A.EMPLOYEE_ID = B.EMPLOYEE_ID)/10
                WHERE A.DEPARTMENT_ID = 100; 
commit;
end;
SELECT * FROM employees_copy where department_id = 100;
COMMIT; 

delete from employees_copy ;
rollback;