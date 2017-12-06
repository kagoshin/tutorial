create or replace procedure buld_bind1
            (e_sal number, clause varchar2)
is
  type empname is table of emp.ename%type
  index by pls_integer;
  e_name empname;
BEGIN
  execute immediate 'update emp set sal = :1
      where '||clause||' returning ename into :2'
        using e_sal returning bulk collect into e_name;
  DBMS_OUTPUT.PUT_LINE('給与を更新した社員名');
  DBMS_OUTPUT.PUT_LINE('--------------------');
  for i in e_name.first..e_name.last loop
    DBMS_OUTPUT.PUT_LINE(e_name(i));
  end loop;
  rollback;
END;
/

execute bulk_bind1(3000, 'deptno = 20')
