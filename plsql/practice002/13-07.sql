create table cust(
  cust_id number,
  cust_no varchar2(32)
);

set timing on

BEGIN
  for i in 1..30000 loop
    insert into cust values(i, 'CUST_no '||TO_CHAR(i));
  end loop;
END;
/
