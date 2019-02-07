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
