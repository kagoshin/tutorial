create user test001
identified by "test001"
default tablespace users
temporary tablespace temp
/

grant dba to test001;

grant unlimited tablespace to test001;
