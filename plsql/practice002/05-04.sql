DECLARE
  CURSOR emp_cl IS SELECT sal FROM emp
            where deptno = 10 FOR UPDATE;
  cursor_err EXCEPTION;
  PRAGMA EXCEPTION_INIT(cursor_err, -1002);
BEGIN
  FOR r IN emp_cl LOOP
    UPDATE emp
      SET sal = r.sal * 1.2
            where CURRENT OF emp_cl;
      COMMIT;
  END LOOP;
EXCEPTION
  WHEN cursor_err THEN
    DBMS_OUTPUT.PUT_LINE('内部エラーが発生！');
end;
/
