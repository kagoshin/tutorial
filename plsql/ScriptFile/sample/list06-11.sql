CREATE OR REPLACE PROCEDURE debug_test
IS
  sal_col   emp.sal%TYPE;
  comm_col  emp.comm%TYPE;
  total_sal emp.sal%TYPE;
BEGIN
  SELECT sal,comm INTO sal_col,comm_col FROM emp
                                WHERE empno = 7369;
  DBMS_OUTPUT.PUT_LINE('sal_colÅF '||sal_col);
  DBMS_OUTPUT.PUT_LINE('comm_colÅF '||comm_col);
  total_sal := sal_col + comm_col;
  DBMS_OUTPUT.PUT_LINE('total_salÅF '||total_sal);
  DBMS_OUTPUT.PUT_LINE(total_sal);
END;
/