create table CountSample(Val) as
select 10 from dual union all
select 20 from dual union all
select 20 from dual union all
select 30 from dual union all
select 30 from dual;

-- count(*) over()を使ったSQL
select val, count(*) over() as recordCount
from CountSample;

-- distinct指定のあるselect文の件数取得
select val, count(*) over() as recCnt
from (
  select distinct val
  from CountSample
)
order by val;
