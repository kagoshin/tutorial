set timing on

DECLARE
  type num_rec is table of cust.cust_id%TYPE index by PLS_INTEGER;
  c_id num_rec;
  type var_rec is table of cust.cust_no%TYPE index by PLS_INTEGER;
  c_no var_rec;
BEGIN
  for i in 1..30000 loop
    c_id(i) := i;
    c_no(i) := 'CUSTNO.' || TO_CHAR(i);
  end loop;

  forall j in 1..30000
    insert into cust values(c_id(j), c_no(j));
END;
/
