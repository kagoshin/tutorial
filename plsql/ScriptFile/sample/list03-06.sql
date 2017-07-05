DECLARE
  var NUMBER := 15;
BEGIN
  CASE
    WHEN var < 10 THEN
      DBMS_OUTPUT.PUT_LINE('値は10より小さい');
    WHEN var < 20 THEN
      DBMS_OUTPUT.PUT_LINE('値は20より小さい');
    WHEN var < 30 THEN
      DBMS_OUTPUT.PUT_LINE('値は30より小さい');
    ELSE
      DBMS_OUTPUT.PUT_LINE('値はそれ以外');
  END CASE;

END;
/