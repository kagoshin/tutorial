DECLARE
  str1 VARCHAR2(32);
  str2 VARCHAR2(32) := 'Hello World!';
  answer CONSTANT NUMBER(2) := 42;
  num1 NUMBER(4) NOT NULL := 100;
  num2 num1%TYPE := 200;

  PROCEDURE foo(str VARCHAR2 := 'foo') IS
  BEGIN
    dbms_output.put_line('str: ' || str);
  END;
BEGIN
  -- num1 := NULL;
  -- num2 := NULL;
  foo();
  foo(str1);
  foo(str2);
END;
