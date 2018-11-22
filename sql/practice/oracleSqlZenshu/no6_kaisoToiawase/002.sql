create table LevelSample(ID, NextID) as
  select 1, 2 from dual union all
  select 2, 3 from dual union all
  select 3, 4 from dual union all
  select 3, 5 from dual union all
  select 4, null from dual union all
  select 5, 6 from dual union all
  select 6, null from dual
;

-- Level擬似列の使用例1
-- sys_connect_by_path関数の使用例
select id
       , nextid
       , level
       , sys_connect_by_path(to_char(id), ',') as path
from LevelSample
start with id = 1
connect by prior nextid = id
;

-- Level擬似列の使用例2
select id
       , nextid
       , level
       , sys_connect_by_path(to_char(id), ',') as path
from LevelSample
where level in (1, 3)
start with id = 1
connect by prior nextid = id
                 and level <= 3
;
