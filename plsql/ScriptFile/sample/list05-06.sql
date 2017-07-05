DECLARE
  e_empno NUMBER;
BEGIN
  SELECT empno INTO e_empno FROM emp
                    WHERE empno = 7369;
  IF e_empno > 1000 THEN
    RAISE_APPLICATION_ERROR(-20001,'empnoの値が不正です');
  END IF;
END;
/