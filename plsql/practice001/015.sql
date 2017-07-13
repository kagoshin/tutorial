DECLARE
  counter NUMBER(2);
BEGIN
  counter := 0;
  WHILE counter < 10 LOOP
    SYS.DBMS_OUTPUT.PUT_LINE(counter);
    counter := counter + 1;
  END LOOP;
END;
