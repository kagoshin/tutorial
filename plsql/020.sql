DECLARE
  dname DEPT.DNAME%Type;
BEGIN
  select DNAME INTO dname
  from DEPT;
  -- where DEPTNO = 99;

  SYS.DBMS_OUTPUT.PUT_LINE('DEPTNO=99のDNAME=' || dname);

EXCEPTION
  WHEN no_data_found THEN
    SYS.DBMS_OUTPUT.PUT_LINE('例外が発生しました。SQLCODE=' || SQLCODE ||
    '、エラーメッセージ＝' || SQLERRM);
  WHEN others THEN
    SYS.DBMS_OUTPUT.PUT_LINE('その他の例外が発生しました。SQLCODE=' || SQLCODE ||
    '、エラーメッセージ＝' || SQLERRM);

END;
