DECLARE
    num NUMBER := 10;
BEGIN
  IF (num < 10) THEN
    GOTO under_ten;
  ELSE
    GOTO over_ten;
  END IF;

  <<under_ten>>
    SYS.DBMS_OUTPUT.PUT_LINE('10未満');
  <<over_ten>>
    NULL;
END;
