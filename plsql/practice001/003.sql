DECLARE
    dept_rec DEPT%rowtype;
BEGIN
    select * into dept_rec
    from DEPT
    where DEPTNO = '30';
    
    SYS.DBMS_OUTPUT.PUT_LINE('deptno:' || dept_rec.deptno);
    SYS.DBMS_OUTPUT.PUT_LINE('dname:' || dept_rec.dname);
    SYS.DBMS_OUTPUT.PUT_LINE('loc:' || dept_rec.loc);

END;