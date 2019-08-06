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

-- 模倣対象の階層問い合わせ
select id
       , oyaid
       , prior id as preid
       , connect_by_root id as rootid
       , level
       , sys_connect_by_path(to_char(id), ',') as path
from HierarchicalT
start with oyaid is null
connect by prior id = oyaid
;

-- 再帰with句で模倣
with rec(id, oyaid, preid, rootid, lv, path) as (
  select id
         , oyaid
         , to_number(null)
         , id
         , 1
         , ',' || to_char(id)
  from HierarchicalT
  where oyaid is null
  union all
  select b.id
         , b.OyaId
         , a.id
         , a.rootid
         , a.lv + 1
         , a.path || ',' || to_char(b.id)
  from rec a
       , HierarchicalT b
  where a.id = b.OyaId
)
select * from rec
;

--深さ優先探索順で出力
create table siblingsT(ID primary key, OyaID) as
  select 1, null from dual union all
  select 2, 1 from dual union all
  select 3, 1 from dual union all
  select 4, 1 from dual union all
  select 5, 3 from dual union all
  select 6, 3 from dual union all
  select 7, 4 from dual union all
  select 8, 4 from dual union all
  select 9, 6 from dual union all
  select 10, 7 from dual union all
  select 20, null from dual union all
  select 21, 20 from dual union all
  select 22, 20 from dual union all
  select 23, 21 from dual union all
  select 24, 21 from dual
;

-- 模倣対象の階層問い合わせ
select connect_by_root ID as treeID
       , ID
       , OyaID
       , Level
       , sys_connect_by_path(to_char(ID), ',') as Path
from siblingsT
start with OyaID is null
connect by prior ID = OyaID
order siblings by ID desc
;

-- 再帰with句で模倣
with rec(treeID, ID, OyaID, LV, Path) as (
  select ID
         , ID
         , OyaID
         , 1
         , ',' || to_char(ID)
  from siblingsT
  where OyaID is null
  union all
  select a.treeID
         , b.ID
         , b.OyaID
         , a.LV + 1
         , a.Path || ',' || to_char(b.ID)
  from rec a, siblingsT b
  where a.ID = b.OyaID
)
search depth first by ID desc set SortKey
select *
from rec
order by SortKey
;
