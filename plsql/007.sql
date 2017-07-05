DECLARE
    TYPE aryName_type IS TABLE OF VARCHAR2(14 BYTE) INDEX BY BINARY_INTEGER;  
    aryName aryName_type;  
    CURSOR dept_cur IS
        select DEPTNO, DNAME from DEPT;
    dept_rec dept_cur%Rowtype;
BEGIN
    OPEN dept_cur;
    
    LOOP
        FETCH dept_cur INTO dept_rec;
        EXIT WHEN dept_cur%NOTFOUND;
        aryName(dept_rec.DEPTNO) := dept_rec.DNAME;
    END LOOP;
    CLOSE dept_cur;
    
    SYS.DBMS_OUTPUT.PUT_LINE(aryName(20));
    
    aryName.DELETE;
END;