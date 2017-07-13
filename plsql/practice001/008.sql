DECLARE
    CURSOR dept_cur IS
        select DEPTNO, DNAME from DEPT;
    dept_rec dept_cur%Rowtype;
    TYPE ary_type IS TABLE OF dept_cur%Rowtype INDEX BY BINARY_INTEGER;  
    ary ary_type;
    counter NUMBER(4);
BEGIN
    OPEN dept_cur;

    counter := 0;    
    LOOP
        FETCH dept_cur INTO dept_rec;
        EXIT WHEN dept_cur%NOTFOUND;
        ary(counter) := dept_rec;
        counter := counter + 1;
    END LOOP;
    CLOSE dept_cur;

    dept_rec := ary(2);
    SYS.DBMS_OUTPUT.PUT_LINE(dept_rec.DEPTNO || ' ' || dept_rec.DNAME);
    
    ary.DELETE;
END;