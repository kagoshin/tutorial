/*
http://www.oracle.com/technetwork/jp/articles/otnj-sql-image7-1525406-ja.html
*/

-- テスト用の仮想テーブルの作成
with work (val1, val2)
as (
  select 1, 8 from dual union all
  select 2, 9 from dual union all
  select 6, 1 from dual
)
select sum(val1) as sumVal1
       , sum(val2) as sumVal2
from work;

create table NonRecWithSample(ID, Val) as
select 'AAA', 1 from dual union all
select 'AAA', 3 from dual union all
select 'BBB', 5 from dual union all
select 'CCC', 1 from dual union all
select 'DDD', 2 from dual union all
select 'DDD', 7 from dual;

-- select文の2度書き防止
with tmp as (
  select id
         , sum(val) as sumVal
  from NonRecWithSample
  group by id
)
select a.id as a_id
       , a.sumVal as a_sumVal
       , b.id as b_id
       , b.sumVal as b_sumVal
from tmp a
join tmp b
on a.id < b.id
and a.sumVal < b.sumVal
order by a_id, b_id
;

-- インラインビューを含むSQL
select id
       , val
from (
  select id
         , val
         , count(*) over(partition by id) as cnt
  from NonRecWithSample
)
where cnt = 1
;

-- 上から下に読めるようにしたSQL
with tmp as (
  select id
         , val
         , count(*) over(partition by id) as cnt
  from NonRecWithSample
)
select id
       , val
from tmp
where cnt = 1
;

-- 1から5までの整数を出力
with rec(val) as (
  select 1 from dual
  union all
  select val + 1 from rec
  where val + 1 <= 5
)
select val from rec;

create table RowToRows(id, fromVal, toVal) as
select 'AAA', 2, 4 from dual union all
select 'BBB',8,9 from dual union all
select 'CCC',3,5 from dual
;

-- 1行を複数行に分割
with rec(id, fromVal, toVal) as (
  select id, fromVal, toVal from RowToRows
  union all
  select id, fromVal + 1, toVal from rec
  where fromVal + 1 <= toVal
)
select id, fromVal as val from rec
order by id, val
;


