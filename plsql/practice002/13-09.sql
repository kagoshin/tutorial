set timing on

DECLARE
  type c_tabtype is table of cust%ROWTYPE index by PLS_INTEGER;
  c_tab c_tabtype;
BEGIN
  for i in 1..30000 loop
    c_tab(i).cust_id := i;
    c_tab(i).cust_no := 'CUSTNO.' || TO_CHAR(i);
  end loop;

  forall j in 1..30000
    insert into cust values(c_tab(j).cust_id, c_tab(j).cust_no);
END;
/
