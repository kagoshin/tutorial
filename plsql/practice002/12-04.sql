CREATE OR REPLACE PROCEDURE select_dept
                    (where_clause VARCHAR2)
IS
  sql_stmt VARCHAR2(100);
  d_name dept.dname%TYPE;
BEGIN
  sql_stmt := 'select dname from dept where ' || where_clause;
  DBMS_OUTPUT.PUT_LINE(sql_stmt);
  EXECUTE IMMEDIATE sql_stmt INTO d_name;
  DBMS_OUTPUT.PUT_LINE(d_name);
END;
/
