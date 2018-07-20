create or replace procedure delete_rows(clause varchar2,
                                        no number)
is
  sql_stmt varchar2(100);
BEGIN
  sql_stmt := 'delete from emp where '||clause||' = :val';
  execute immediate sql_stmt using no;
  dbms_output.put_line(sql_stmt);
end;
/

set serveroutput on

execute delete_rows('empno', 7499);

execute delete_rows('empno', 7521);
