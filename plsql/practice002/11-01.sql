create or replace procedure open_data(dept_no number)
is
  type cv_type is ref cursor;
  cur_cv cv_type;
  emp_rec emp%rowtype;
  dept_rec dept%rowtype;
begin
  open cur_cv for select * from emp where deptno = dept_no;
    loop
      fetch cur_cv into emp_rec;
      exit when cur_cv%notfound;
      dbms_output.put_line('EMP ' || emp_rec.ename);
    end loop;
  close cur_cv;

  open cur_cv for select * from dept where deptno = dept_no;
    loop
      fetch cur_cv into dept_rec;
      exit when cur_cv%notfound;
      dbms_output.put_line('DEPT ' || dept_rec.dname);
    end loop;
  close cur_cv;
end;
/

--execute open_data(10);
