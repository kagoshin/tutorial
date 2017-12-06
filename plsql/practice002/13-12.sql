DECLARE
  type cust_type is table of cust%rowtype index by pls_integer;
  cust_tab cust_type;
  cursor cust_cl is select * from cust;
BEGIN
  open cust_cl;
    loop
      fetch cust_cl bulk collect into cust_tab limit 10000;
      exit when cust_cl%notfound;
      dbms_output.put_line('fetch ' || cust_tab.count || ' rows');
    end loop;
  close cust_cl;
END;
/
