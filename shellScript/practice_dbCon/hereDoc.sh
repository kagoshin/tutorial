#!/bin/bash

RESULT=`sqlplus -s system/oracle@localhost:49161/xe << EOF
set serveroutput on;
set heading off;
set feedback off;

select count(*) from emp;
-- select sysdate from dual;
EOF`

echo ${RESULT}
