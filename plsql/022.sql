DECLARE

BEGIN
  FOR num IN 1..10 LOOP
    IF (num MOD 2 = 0) THEN
      GOTO continue;
    END IF;

    SYS.DBMS_OUTPUT.PUT_LINE(num);

    <<continue>>
      NULL;
  END LOOP;
END;
