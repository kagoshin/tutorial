CREATE OR REPLACE PROCEDURE delete_table(tab_name VARCHAR2,
                                         clause VARCHAR2)
IS
  sql_stmt VARCHAR2(100);
BEGIN
  sql_stmt := 'delete from ' || tab_name || ' where ' || clause;
  DBMS_OUTPUT.PUT_LINE(sql_stmt);
  EXECUTE IMMEDIATE sql_stmt;
END;
/
