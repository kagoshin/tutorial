create table nestedAggSample(id, val) as
  select 111, 1 from dual union all
  select 111, 3 from dual union all
  select 111, 8 from dual union all
  select 222, 5 from dual union all
  select 222, 6 from dual union all
  select 333, 9 from dual
;

select max(count(*)) as maxCount
       , min(count(*)) as minCount
       , max(sum(val)) as maxSumVal
       , sum(max(val)) as maxSumVal
from nestedAggSample
group by id
;

create table aggOlapSample(id, val) as
  select 111, 1 from dual union all
  select 111, 1 from dual union all
  select 111, 1 from dual union all
  select 111, 8 from dual union all
  select 222, 3 from dual union all
  select 222, 3 from dual union all
  select 222, 4 from dual union all
  select 222, 4 from dual union all
  select 333, 9 from dual
;

select id
       , val
       , cnt
from (
  select id
         , val
         , count(*) as cnt
         , max(count(*)) over (partition by id) as maxCnt
  from aggOlapSample
  group by id, val
)
where cnt = maxCnt
order by id
         , val
;
