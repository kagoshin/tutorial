DECLARE

BEGIN
  FOR counter IN 1..9 LOOP
    IF ( counter MOD 2 = 0 ) THEN
      CONTINUE;
    END IF;
    SYS.DBMS_OUTPUT.PUT_LINE(counter);
  END LOOP;

  FOR counter IN 1..9 LOOP
    CONTINUE WHEN counter MOD 2 = 0;
    SYS.DBMS_OUTPUT.PUT_LINE(counter);
  END LOOP;
END;
