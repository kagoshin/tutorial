create or replace package err_pack
is
  null_error exception;
  pragma exception_init(null_error, -01400);
  fetch_out exception;
  pragma exception_init(fetch_out, -1002);
  lock_error exception;
  pragma exception_init(lock_error, -00060);
end;
/

create or replace procedure err_test
is
begin
 insert into dept values(null, 'SE', 'TOKYO');
exception
  when err_pack.null_error then
    DBMS_OUTPUT.PUT_LINE('NULL_ERROR!');
end;
/

execute err_test;
