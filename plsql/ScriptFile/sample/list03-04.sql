DECLARE
  var NUMBER := 15;
BEGIN
  IF var < 10 THEN
    DBMS_OUTPUT.PUT_LINE('�l��10��菬����');
  ELSIF var < 20 THEN
    DBMS_OUTPUT.PUT_LINE('�l��20��菬����');
  ELSIF var < 30 THEN
    DBMS_OUTPUT.PUT_LINE('�l��30��菬����');
  ELSE
    DBMS_OUTPUT.PUT_LINE('����ȊO');
  END IF;
END;
/