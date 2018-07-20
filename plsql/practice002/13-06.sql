create or replace procedure del_cascade(clause varchar2,
                                        val varchar2)
is
  d_deptno dept.deptno%type;
BEGIN
  execute immediate
      'delete from dept where '||clause||' :p_val
          returning deptno into :d_no'
              using val, out d_deptno;
  dbms_output.put_line(d_deptno);
  update emp set deptno = null where deptno = d_deptno;
END;
/

execute del_cascade('LOC = ', 'DALLAS');
