DECLARE
  var1 NUMBER :=3;
  var2 NUMBER :=2;
BEGIN
  IF var1 = 1 AND var2 = 2 THEN
    DBMS_OUTPUT.PUT_LINE('TRUE');
  ELSE
    DBMS_OUTPUT.PUT_LINE('FALSE');
  END IF;
END;
/