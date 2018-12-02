create table PriorEdaKiri(ID primary key, OyaID) as
  select 1, null from dual union all
  select  2,   1 from dual union all
  select  3,   2 from dual union all
  select  4,   2 from dual union all
  select  5,   3 from dual union all
  select  6,   4 from dual union all
  select 50,null from dual union all
  select 51,  50 from dual union all
  select 52,  51 from dual
;

-- connect by句で親子条件のみを指定
select id
       , oyaid
       , level
       , sys_connect_by_path(to_char(ID), ',') as path
from PriorEdaKiri
start with oyaid is null
connect by prior id = oyaid
order by path
;

-- 探索終了条件を指定して枝切り
select id
       , oyaid
       , level
       , sys_connect_by_path(to_char(ID), ',') as path
from PriorEdaKiri
start with oyaid is null
connect by prior id = oyaid
and prior id not in (2, 51)
order by path
;
