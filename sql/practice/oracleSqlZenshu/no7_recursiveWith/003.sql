/*
https://www.oracle.com/technetwork/jp/articles/otnj-sql-image7-1525408-ja.html
*/

create table LevelEdaKiri_02 (ID primary key, OyaID) as
  select 10, null from dual union all
  select 11, 10 from dual union all
  select 12, 11 from dual union all
  select 13, 12 from dual union all
  select 14, 13 from dual union all
  select 31, 10 from dual union all
  select 32, 31 from dual union all
  select 33, 32 from dual
;

-- レベル制限で枝切り
with rec (ID, OyaID, LV, Path) as (
  select id
         , oyaid
         , 1
         , to_char(id)
  from leveledakiri_02
  where id = 10
  union all
  select b.id
         , b.oyaid
         , a.lv+1
         , a.path || ',' || to_char(b.id)
  from rec a
       , leveledakiri_02 b
  where a.id = b.oyaid
  and a.lv+1 <= 3
)
select * from rec
;


create table OuterJoinEdakiri(ID primary key, OyaID) as
  select 1, null from dual union all
  select 2, 1 from dual union all
  select 3, 2 from dual union all
  select 4, 3 from dual union all
  select 5, 3 from dual union all
  select 6, 2 from dual union all
  select 80, null from dual union all
  select 81, 80 from dual union all
  select 82, 80 from dual union all
  select 83, 81 from dual union all
  select 84, 83 from dual;

-- 外部結合後のwhere句で枝切り
with rec(id, oyaid, lv, path) as (
  select id
         , oyaid
         , 1
         , to_char(id)
  from OuterJoinEdakiri
  where oyaid is null
  union all
  select b.id
         , b.oyaid
         , a.lv + 1
         , a.path || ',' || to_char(b.id)
  from rec a
  left outer join OuterJoinEdakiri b
  on a.id = b.oyaid
  where a.lv + 1 <= 3
)
select * from rec order by path
;


create table NodeCntEdakiri(ID) as
  select RowNum from dict where Rownum <= 10
;

-- ノード数の総合計で枝切り
with rec(rootid, id, lv, path, nodeCnt) as (
  select id
         , id
         , 1
         , to_char(id)
         , count(*) over()
  from NodeCntEdakiri
  where id <= 3
  union all
  select a.rootid
         , b.id
         , a.lv + 1
         , a.path || ',' || to_char(b.id)
         , a.nodeCnt + count(*) over()
  from rec a
       , NodeCntEdakiri b
  where a.id + 1 = b.id
  and a.nodeCnt <= 10
)
select * from rec
;
