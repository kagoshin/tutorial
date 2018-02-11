create or replace package test_para
is
  type tab is table of dept%ROWTYPE
                index by binary_integer;
  table_rec tab;
  procedure get_table(para out nocopy tab);
end;
/

create or replace package body test_para
is
  procedure get_table(para out nocopy tab)
  is
    n number := 0;
    cursor dept_cl is select * from dept;
  begin
    for r in dept_cl loop
      n := n + 1;
      table_rec(n) := r;
    end loop;
    para := table_rec;
  end get_table;
end;
/

begin
  test_para.get_table(test_para.table_rec);
  for r in 1..test_para.table_rec.COUNT loop
    DBMS_OUTPUT.PUT_LINE(test_para.table_rec(r).deptno || ' ' ||
                         test_para.table_rec(r).dname || ' ' ||
                         test_para.table_rec(r).loc);
  end loop;
end;
/
