CREATE OR REPLACE PROCEDURE create_test
IS
BEGIN
  EXECUTE IMMEDIATE
    'CREATE TABLE test (test_no NUMBER)';
END;
/
