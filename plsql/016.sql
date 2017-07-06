DECLARE
  counter NUMBER;
BEGIN
  counter := 1;
  LOOP
    SYS.DBMS_OUTPUT.PUT_LINE(counter);
    counter := counter + 1;
    IF ( counter = 10 ) THEN
      EXIT;
    END IF;
  END LOOP;

  counter := 1;
  LOOP
    SYS.DBMS_OUTPUT.PUT_LINE(counter);
    counter := counter + 1;
    EXIT WHEN counter = 10;
  END LOOP;
END;
