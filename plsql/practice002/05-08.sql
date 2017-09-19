DECLARE
  e_empno number;
BEGIN
  SELECT empno INTO e_empno FROM emp;
EXCEPTION
  WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('事前定義例外発生');
  WHEN others THEN
    DBMS_OUTPUT.PUT_LINE(sqlcode);
    DBMS_OUTPUT.PUT_LINE(sqlerrm);
END;
/
