create table FullJoinTl (id primary key, val) as
  select 111, 100 from dual union all
  select 222, 200 from dual union all
  select 555, 300 from dual
;

create table FullJoinTl2 (id primary key, val) as
  select 111, 400 from dual union all
  select 222, 500 from dual union all
  select 666, 600 from dual
;

-- 完全外部結合を使ったSQL
select a.id as a_id
       , b.id as b_id
       , a.val as a_val
       , b.val as b_val
from FullJoinTl a
full outer join FullJoinTl2 b
on a.id = b.id
order by a.id
         , b.id
;   
