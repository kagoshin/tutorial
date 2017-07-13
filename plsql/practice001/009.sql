DECLARE
    TYPE col_type IS TABLE OF NUMBER(2) INDEX BY BINARY_INTEGER;
    TYPE row_type IS TABLE OF col_type INDEX BY BINARY_INTEGER;
    kukuTable row_type;
BEGIN
    FOR row in 1..9 LOOP
        FOR col in 1..9 LOOP
            kukuTable(row)(col) := row * col;
        END LOOP;
    END LOOP;
    
    SYS.DBMS_OUTPUT.PUT_LINE('7 * 9 = ' || kukuTable(7)(9));
END;