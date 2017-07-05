DECLARE
    TYPE dept_rec_type IS RECORD
        (
            deptno DEPT.DEPTNO%type,
            dname DEPT.DNAME%type
        );
    dept_rec dept_rec_type;
BEGIN
    select deptno, dname into dept_rec
    from dept
    where deptno = '20';
    
    SYS.DBMS_OUTPUT.PUT_LINE('deptno:' || dept_rec.deptno);
    SYS.DBMS_OUTPUT.PUT_LINE('dname:' || dept_rec.dname);
END;