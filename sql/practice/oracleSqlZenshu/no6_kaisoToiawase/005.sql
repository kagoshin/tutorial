create table PriorSample (ID primary key, OyaId, Name) as
  select 1, null, 'AAAA' from dual union all
  select 2, 1, 'BBBB' from dual union all
  select 3, 1, 'CCCC' from dual union all
  select 4, 3, 'DDDD' from dual union all
  select 5, 3, 'EEEE' from dual union all
  select 10, null, 'FFFF' from dual union all
  select 11, 10, 'GGGG' from dual
;

-- prior演算子の使用例
select id
       , oyaid
       , name
       , prior name as oyaname
       , level
       , sys_connect_by_path(to_char(id), ',') as path
from PriorSample
start with oyaid is null
connect by prior id = oyaid
;
