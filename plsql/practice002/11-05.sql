create or replace procedure emp_pro2
            (empcur in out cur_pack.emp_type)
is
  emp_var1 emp.empno%TYPE;
  emp_var2 emp.ename%TYPE;
  emp_var3 emp.sal%TYPE;
begin
  loop
    fetch empcur into emp_var1, emp_var2, emp_var3;
    exit when empcur%notfound;
    DBMS_OUTPUT.PUT_LINE(emp_var1 || ' ' ||
                         emp_var2 || ' ' ||
                         emp_var3);
  end loop;
  close empcur;

  open empcur for select empno, ename, sal
                    from emp where sal > 3000;
    loop
      fetch empcur into emp_var1, emp_var2, emp_var3;
      exit when empcur%notfound;
      DBMS_OUTPUT.PUT_LINE(emp_var1 || ' ' ||
                           emp_var2 || ' ' ||
                           emp_var3 || ' OPEN2');
    end loop;
  close empcur;
end;
/
