DECLARE
  type emp_type is table of emp%rowtype index by pls_integer;
  emp_tab emp_type;
BEGIN
  select * bulk collect into emp_tab
  from emp
  where deptno = 20;

  for i in emp_tab.first..emp_tab.last loop
    dbms_output.put_line(emp_tab(i).ename);
  end loop;
END;
/
