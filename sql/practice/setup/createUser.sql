create user testPractice
identified by "testPractice"
default tablespace users
temporary tablespace temp
/

grant dba to testPractice;

grant unlimited tablespace to testPractice;
