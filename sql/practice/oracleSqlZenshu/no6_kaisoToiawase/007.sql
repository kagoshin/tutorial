create table IsCycleSample(
  ID primary key
  , NextID
  , NextID2
) as
  select 1, 2, 4 from dual union all
  select 2, 3, null from dual union all
  select 3, 4, null from dual union all
  select 4, 5, null from dual union all
  select 5, 2, null from dual
;

-- connect_by_IsCycle擬似列の使用例
select id
       , level
       , sys_connect_by_path(to_char(id), ',') as path
       , connect_by_isCycle as IsCycle
from IsCycleSample
start with id = 1
connect by NoCycle id in (prior NextID, prior NextID2)
;
