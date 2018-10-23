/*
https://www.oracle.com/technetwork/jp/articles/otnj-sql-image2-308626-ja.html
*/
create table OuterUnionT1 (id, val1) as
  select 111, 10 from dual union all
  select 111, 30 from dual union all
  select 222, 120 from dual
;

create table OuterUnionT2 (id, val2) as
  select 111, 200 from dual union all
  select 333, 300 from dual
;

select id, val1, to_number(null) as val2
from OuterUnionT1
union all
select id, to_number(null), val2
from OuterUnionT2
order by id, val1, val2
;
