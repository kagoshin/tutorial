DECLARE
  e_empno NUMBER;
BEGIN
  select empno INTO e_empno FROM emp;
EXCEPTION
  WHEN too_many_rows THEN
    DBMS_OUTPUT.PUT_LINE('TOO_MANY_ROWS!');
  WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('NO_DATA_FOUND!');
END;
/
