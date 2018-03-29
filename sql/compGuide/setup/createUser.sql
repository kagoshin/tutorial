create user compGuide
identified by "compGuide"
default tablespace users
temporary tablespace temp
/

grant dba to compGuide;

grant unlimited tablespace to compGuide;
