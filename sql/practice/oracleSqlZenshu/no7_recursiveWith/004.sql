/*
https://www.oracle.com/technetwork/jp/articles/otnj-sql-image7-1525409-ja.html
*/

create table HierarchicalT (ID primary key, OyaId) as
  select 1, null from dual union all
  select 2, 1 from dual union all
  select 3, 2 from dual union all
  select 4, 3 from dual union all
  select 5, 1 from dual union all
  select 6, 5 from dual union all
  select 7, 2 from dual union all
  select 20, null from dual union all
  select 21, 20 from dual union all
  select 22, 21 from dual;

-- 模倣対象の階層問い合わせ
select id
       , oyaid
       , Level
       , sys_connect_by_path(to_char(id), ',') as path
from HierarchicalT
start with oyaid is null
connect by prior id = oyaid
;

-- 再帰with句で模倣
with rec(id, oyaid, lv, path) as (
  select id
         , oyaid
         , 1
         , ',' || to_char(id)
  from HierarchicalT
  where oyaid is null
  union all
  select b.id
         , b.oyaid
         , a.lv + 1
         , a.path || ',' || to_char(b.id)
  from rec a
       , HierarchicalT b
  where a.id = b.oyaid
)
select * from rec
;
