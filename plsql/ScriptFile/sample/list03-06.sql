DECLARE
  var NUMBER := 15;
BEGIN
  CASE
    WHEN var < 10 THEN
      DBMS_OUTPUT.PUT_LINE('�l��10��菬����');
    WHEN var < 20 THEN
      DBMS_OUTPUT.PUT_LINE('�l��20��菬����');
    WHEN var < 30 THEN
      DBMS_OUTPUT.PUT_LINE('�l��30��菬����');
    ELSE
      DBMS_OUTPUT.PUT_LINE('�l�͂���ȊO');
  END CASE;

END;
/