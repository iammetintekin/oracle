sqlplus command line codes

Enter user-name: sys as sysdba
Enter password: 123

Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> create user metin identified by 123
  2  default tablespace users
  3  temporary tablespace temp
  4  password expire
  5  ;

User created.

SQL> GRANT CONNECT, RESOURCE TO METIN
  2  ;

Grant succeeded.

SQL> CONNECT METIN/123
ERROR:
ORA-28001: parola s³resi doldu

Changing password for METIN
New password:
Retype new password:
Password changed
Connected.