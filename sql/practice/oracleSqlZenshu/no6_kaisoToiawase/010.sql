create table EdaKiriSample (
  ID primary key
  , NextID1
  , NextID2
) as
  select 'A', 'B', 'E' from dual union all
  select 'B','C','D'  from dual union all
  select 'C','D',null from dual union all
  select 'D','G','H'  from dual union all
  select 'E','F',null from dual union all
  select 'F','B','G'  from dual union all
  select 'G','H',null from dual union all
  select 'H','F',null from dual
;

-- 訪問経路を列挙
select level
       , sys_connect_by_path(ID, ',') as path
from EdaKiriSample
where id = 'G'
start with id = 'A'
connect by NoCycle ID in (prior NextID1, prior NextID2)
and prior id != 'G'
and level <= 5
order by level, path
;
