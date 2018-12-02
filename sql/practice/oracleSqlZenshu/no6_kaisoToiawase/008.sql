create table LevelEdaKiri(ID primary key, oyaID) as
  select 1, null from dual union all
  select 2,   1 from dual union all
  select 3,   2 from dual union all
  select 4,   2 from dual union all
  select 5,   3 from dual union all
  select 6,   3 from dual union all
  select 7,   4 from dual union all
  select 10, null from dual union all
  select 11,  10 from dual union all
  select 12,  11 from dual union all
  select 13,  12 from dual union all
  select 14,  13 from dual
;

-- connect by句で親子条件のみを指定
select id
       , oyaid
       , level
       , sys_connect_by_path(to_char(id), ',') as path
from LevelEdaKiri
start with oyaid is null
connect by prior id = oyaid
order by path
;

-- Level擬似列で枝切り
select id
       , oyaid
       , level
       , sys_connect_by_path(to_char(id), ',') as path
from LevelEdaKiri
start with oyaid is null
connect by prior id = oyaid --親子条件
and level <= 3  --枝切り条件
order by path
;
