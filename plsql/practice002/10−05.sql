DECLARE
  rec dept%ROWTYPE;
BEGIN
  rec.deptno := 50;
  rec.dname := 'SE';
  rec.loc := 'DETROIT';

  insert into dept values rec;
END;
/

select * from dept where deptno = 50;
