create table NoCycleSample (ID primary key, NextID) as
  select 1, 2 from dual union all
  select 2, 3 from dual union all
  select 3, null from dual union all
  select 50, 51 from dual union all
  select 51, 52 from dual union all
  select 52, 50 from dual
;

-- 閉路のない階層問い合わせ
select id
       , nextid
       , level
       , sys_connect_by_path(to_char(id), ',') as path
from NoCycleSample
start with id = 1
connect by prior nextid = id
;

-- 閉路のある階層問い合わせ1
select id
       , nextid
       , level
       , sys_connect_by_path(to_char(id), ',') as path
from NoCycleSample
start with id = 50
connect by prior nextid = id
;

-- 閉路のある階層問い合わせ2
select id
       , nextid
       , level
       , sys_connect_by_path(to_char(id), ',') as path
       , connect_by_IsCycle
from NoCycleSample
start with id = 50
connect by NoCycle prior nextid = id
;
