/*
https://www.oracle.com/technetwork/jp/articles/otnj-sql-image7-1525411-ja.html
*/

--ノードが木の葉かを判定
create table IsLeafT(ID primary key, OyaID) as
  select 1, null from dual union all
  select 2, 1 from dual union all
  select 3, 2 from dual union all
  select 4, 3 from dual union all
  select 5, 1 from dual union all
  select 6, 5 from dual union all
  select 7, 2 from dual union all
  select 20, null from dual union all
  select 21, 20 from dual union all
  select 22, 21 from dual
;

-- 模倣対象の階層問い合わせ
select ID
       , OyaID
       , Level
       , sys_connect_by_path(to_char(ID), ',') as Path
       , connect_by_IsLeaf as IsLeaf
from IsLeafT
start with OyaID is null
connect by prior ID = OyaID
;

-- 再帰with句で模倣する方法1
-- case式でexists述語を使用
with rec(ID, OyaID, LV, Path) as (
  select ID
         , OyaID
         , 1
         , ',' || to_char(ID)
  from IsLeafT
  where OyaID is null
  union all
  select b.ID
         , b.OyaID
         , a.LV + 1
         , a.Path || ',' || to_char(b.ID)
  from rec a, IsLeafT b
  where a.ID = b.OyaID
)
select ID
       , OyaID
       , LV
       , Path
       , case when exists(
                          select 1
                          from rec b
                          where a.ID = b.OyaID
                         )
              then 0
              else 1
              end as IsLeaf
from rec a
;

-- 再帰with句で模倣する方法2
-- 深さ優先探索順でレベルを比較
with rec (ID, OyaID, LV, Path) as (
  select ID
         , OyaID
         , 1
         , ',' || to_char(ID)
  from IsLeafT
  where OyaID is null
  union all
  select b.ID
         , b.OyaID
         , a.LV + 1
         , a.Path || ',' || to_char(b.ID)
  from rec a, IsLeafT b
  where a.ID = b.OyaID
)
search depth first by ID set SortKey
select ID
       , OyaID
       , LV
       , Path
       , case when Lead(LV) over (order by SortKey) > LV
              then 0
              else 1
         end as IsLeaf
from rec
;

create table NoCycleT (ID primary key, nextID) as
  select 1, 2 from dual union all
  select 2, 3 from dual union all
  select 3, 4 from dual union all
  select 4, 1 from dual union all
  select 5, 6 from dual
;

-- 模倣対象の階層問い合わせ
select ID
       , nextid
       , sys_connect_by_path(to_char(ID), ',') as Path
from NoCycleT
start with ID = 1
connect by NoCycle prior nextID = ID
;

-- 再帰with句で模倣
with rec (ID, nextID, Path) as (
  select id
         , nextid
         , ',' || to_char(id)
  from NoCycleT
  where id = 1
  union all
  select b.id
         , b.nextid
         , a.path || ',' || to_char(b.id)
  from rec a, NoCycleT b
  where a.nextid = b.id
)
cycle id set IsLoop to 'Y' default 'N'
select id
       , nextid
       , path
       , IsLoop
from rec
where IsLoop = 'N'
;
