DECLARE
  dept_row dept%ROWTYPE;
BEGIN
  select * into dept_row from dept where deptno = 20;
  get_record(dept_row);
END;
/
