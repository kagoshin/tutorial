CREATE OR REPLACE PROCEDURE debug_test
IS
  sal_col   emp.sal%TYPE;
  comm_col  emp.comm%TYPE;
  total_col emp.sal%TYPE;
BEGIN
  select sal, NVL(comm, 0) INTO sal_col, comm_col
  from EMP
  where empno = 7369;

  -- DBMS_OUTPUT.PUT_LINE('sal_col: ' || sal_col);
  -- DBMS_OUTPUT.PUT_LINE('comm_col: ' || comm_col);

  total_col := sal_col + comm_col;
  -- DBMS_OUTPUT.PUT_LINE('total_col: ' || total_col);
  DBMS_OUTPUT.PUT_LINE(total_col);
END;
/
