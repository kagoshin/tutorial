CREATE OR REPLACE FUNCTION triangle2(
  base IN NUMBER DEFAULT 10, height IN NUMBER DEFAULT 20)
RETURN NUMBER
IS
BEGIN
  RETURN((base * height)/2);
END;
/