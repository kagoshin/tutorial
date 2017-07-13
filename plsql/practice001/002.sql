DECLARE
    -- deptno NUMBER(2,0);
    -- dname VARCHAR2(14 BYTE);
    -- loc VARCHAR2(13 BYTE);
    deptno DEPT.DEPTNO%type;
    dname DEPT.DNAME%type;
    loc DEPT.LOC%type;
BEGIN
    select DEPTNO, DNAME, LOC into deptno, dname, loc
    from DEPT
    where DEPTNO = '10';
    
    SYS.DBMS_OUTPUT.PUT_LINE('deptno:' || deptno);
    SYS.DBMS_OUTPUT.PUT_LINE('dname:' || dname);
    SYS.DBMS_OUTPUT.PUT_LINE('loc:' || loc);

END;