DECLARE
    CURSOR dept_csr IS
        SELECT * FROM DEPT;
    dept_rec DEPT%Rowtype;
BEGIN
    OPEN dept_csr;
    LOOP
        FETCH dept_csr INTO dept_rec;
        EXIT WHEN dept_csr%NOTFOUND;
        SYS.DBMS_OUTPUT.PUT_LINE(dept_rec.deptno || ' ' || dept_rec.dname || ' ' || dept_rec.loc);
    END LOOP;
    CLOSE dept_csr;
END;