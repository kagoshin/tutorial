create or replace procedure open_emp (clause varchar2,
                                      no number)
is
  type cv_type is ref cursor;
  cur_cv cv_type;
  emp_rec emp%rowtype;
BEGIN
  open cur_cv for 'select * from emp where '||clause||' :val'
                    using no;
    loop
      fetch cur_cv into emp_rec;
      exit when cur_cv%notfound;
      dbms_output.put_line('emp '||emp_rec.ename);
    end loop;
  close cur_cv;
END;
/

execute open_emp('sal >', 2500);
