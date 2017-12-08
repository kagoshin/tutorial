create or replace procedure lock_pro
is
BEGIN
  for i in 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE(to_char(sysdate, 'HH24:MI:SS'));
    DBMS_LOCK.SLEEP(1);
  end loop;
END;
/
