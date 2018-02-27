CREATE OR REPLACE PROCEDURE emp_pro1(dno emp.deptno%TYPE)
IS
  emp_cv cur_pack.emp_type;
BEGIN
  OPEN emp_cv FOR select empno, ename, sal
                    from emp where deptno = dno;
  emp_pro2(emp_cv);
END;
/
