/*
https://www.oracle.com/technetwork/jp/articles/otnj-sql-image7-1525407-ja.html
*/
create table TreeData(ID primary key, OyaID) as
  select 1, null from dual union all
  select 2, 1 from dual union all
  select 3, 1 from dual union all
  select 4, 2 from dual union all
  select 5, 3 from dual union all
  select 10, null from dual union all
  select 11, 10 from dual union all
  select 12, 10 from dual
;

-- 木構造なデータの探索
with rec(id, oyaid, lv, path) as (
  select id
         , oyaid
         , 1
         , to_char(id)
  from treedata
  where oyaid is null
  union all
  select b.id
         , b.oyaid
         , a.lv + 1
         , a.path || ',' || to_char(b.id)
  from rec a
       , treedata b
  where a.id = b.oyaid
)
select *
from rec
;

create table GraphData(id primary key, nextid) as
  select 1, 2 from dual union all
  select 2, 3 from dual union all
  select 3, null from dual union all
  select 50, 51 from dual union all
  select 51, 52 from dual union all
  select 52, 50 from dual
;

-- 再帰with句で閉路のない探索
with rec(id, nextid, lv, path) as (
  select id
         , nextid
         , 1
         , to_char(id)
  from GraphData
  where id = 1
  union all
  select b.id
         , b.nextid
         , a.lv + 1
         , a.path || ',' || to_char(b.id)
  from rec a
       , GraphData b
  where a.nextid = b.id
)
select *
from rec
;

-- 再帰with句で閉路のある探索1
with rec(id, nextid, lv, path) as (
  select id
         , nextid
         , 1
         , to_char(id)
  from GraphData
  where id = 50
  union all
  select b.id
         , b.nextid
         , a.lv + 1
         , a.path || ',' || to_char(b.id)
  from rec a
       , GraphData b
  where a.nextid = b.id
)
select *
from rec
;

-- 再帰with句で閉路のある探索2
with rec(id, nextid, lv, path) as (
  select id
         , nextid
         , 1
         , to_char(id)
  from GraphData
  where id = 50
  union all
  select b.id
         , b.nextid
         , a.lv + 1
         , a.path || ',' || to_char(b.id)
  from rec a
       , GraphData b
  where a.nextid = b.id
)
cycle id set IsLoop to 'Y' default 'N'
select *
from rec
;

create table HukasaT(ID primary key, OyaID) as
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

-- 深さ優先探索順で連番を付与
with rec(treeID, ID, OyaID, LV, Path) as (
  select ID, ID, OyaID, 1, to_char(ID)
  from HukasaT
  where OyaID is null
  union all
  select a.treeID, b.ID, b.OyaID, a.LV+1, a.Path || ',' || to_char(b.ID)
  from rec a, HukasaT b
  where a.ID = b.OyaID
)
search depth first by ID desc set rn
select rn, treeID, ID, OyaID, LV, Path
from rec
order by rn
;

create table HabaT(ID primary key, OyaID) as
  select 1, null from dual union all
  select 2, 1 from dual union all
  select 3, 1 from dual union all
  select 7, 2 from dual union all
  select 8, 2 from dual union all
  select 9, 8 from dual union all
  select 5, 3 from dual union all
  select 6, 3 from dual union all
  select 30, null from dual union all
  select 31, 30 from dual
;

-- 幅優先探索順で連番を付与
with rec(treeID, ID, OyaID, LV, Path) as (
  select ID, ID, OyaID, 1, to_char(ID)
  from HabaT
  where OyaID is null
  union all
  select a.treeID, b.ID, b.OyaID, a.LV+1, a.Path || ',' || to_char(b.ID)
  from rec a, HabaT b
  where a.ID = b.OyaID
)
search breadth first by ID desc set rn
select rn, treeID, ID, OyaID, LV, Path
from rec
order by rn
;
