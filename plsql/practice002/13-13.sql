DECLARE
  type tab_rec is table of emp.empno%type
  index by pls_integer;
  emp_no tab_rec;
BEGIN
  delete from emp where deptno = 20
    returning empno bulk collect into emp_no;

  for i in emp_no.first..emp_no.last loop
    dbms_output.put_line(emp_no(i));
  end loop;

  -- rollback;
END;
/
