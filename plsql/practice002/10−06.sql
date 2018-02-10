DECLARE
  rec dept%ROWTYPE;
BEGIN
  rec.deptno := 60;
  rec.dname := 'PERSONNEL';
  rec.loc := 'CHICAGO';

  update dept set row = rec where deptno = 50;
END;
/

select * from dept where deptno = 60;
