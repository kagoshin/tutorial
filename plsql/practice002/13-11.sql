DECLARE
  type emp_type is table of emp%rowtype index by pls_integer;
  emp_tab emp_type;
  cursor emp_cl is select * from emp where deptno = 20;
BEGIN
  open emp_cl;
    fetch emp_cl bulk collect into emp_tab;
  close emp_cl;
  for i in emp_tab.first..emp_tab.last loop
    dbms_output.put_line(emp_tab(i).ename);
  end loop;
END;
/
