create table SelfJoin(id) as
  select 111 from dual union all
  select 222 from dual union all
  select 333 from dual union all
  select 444 from dual
;

-- 自己結合を使ったSQL
select a.id as a_id
       , b.id as b_id
from SelfJoin a
     , SelfJoin b
where a.id < b.id
;
