CREATE OR REPLACE PROCEDURE debug_test
IS
  sal_col emp.sal%TYPE;
  comm_col emp.comm%TYPE;
  total_col emp.total%TYPE;
BEGIN
  select sal, comm INTO sal_col, comm_col
  from EMP
  where empno = 7369;

  total_col := sal_col + comm_col;
  DBMS_OUTPUT.PUT_LINE(total_col);
END;
/
