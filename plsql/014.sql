DECLARE
  first NUMBER;
  last NUMBER;
BEGIN
  FOR counter IN 1..9 LOOP
    SYS.DBMS_OUTPUT.PUT_LINE(counter);
  END LOOP;

  FOR counter IN REVERSE 1..9 LOOP
    SYS.DBMS_OUTPUT.PUT_LINE(counter);
  END LOOP;

  first := 1;
  last := 9;
  FOR counter IN first..last LOOP
    SYS.DBMS_OUTPUT.PUT_LINE(counter);
  END LOOP;
END;
