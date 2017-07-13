DECLARE
    CURSOR dept_csr IS
        SELECT * FROM DEPT;
    deptno DEPT.DEPTNO%Type;
    dname DEPT.DNAME%Type;
    loc DEPT.LOC%Type;
BEGIN
    OPEN dept_csr;
    LOOP
        FETCH dept_csr INTO deptno, dname, loc;
        EXIT WHEN dept_csr%NOTFOUND;
        SYS.DBMS_OUTPUT.PUT_LINE(deptno || ' ' || dname || ' ' || loc);
    END LOOP;
    CLOSE dept_csr;
END;