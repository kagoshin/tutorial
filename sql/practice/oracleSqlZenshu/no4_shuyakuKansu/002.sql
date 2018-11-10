create table AggImage(id, val) as
  select 111, 0 from dual union all
  select 111, 2 from dual union all
  select 222, 7 from dual union all
  select 222, 8 from dual union all
  select 222, 9 from dual union all
  select 333, 1 from dual union all
  select 333, 2 from dual union all
  select 444, 6 from dual union all
  select 444, 8 from dual union all
  select 444, 9 from dual;

select id, count(*) as cnt
from aggimage
group by id
order by id
;

select id,
       count(*) as cnt
from aggimage
group by id
having count(*) <> 3
order by id
;

create table DistinctSample(id, val) as
  select 111, 2 from dual union all
  select 111, 2 from dual union all
  select 111, 7 from dual union all
  select 222, 3 from dual union all
  select 222, 4 from dual union all
  select 222, 6 from dual union all
  select 333, 8 from dual
;

select id
       , count(*) as cnt
       , count(distinct val) as distinctValCnt
from DistinctSample
group by id
order by id
;


create table KeepSample(id, sortKey, val) as
  select 111, 2, 10 from dual union all
  select 111, 2, 20 from dual union all
  select 111, 3, 40 from dual union all
  select 111, 7, 30 from dual union all
  select 222, 4, 90 from dual union all
  select 222, 6, 60 from dual union all
  select 222, 6, 70 from dual union all
  select 333, 5, 90 from dual
;

select id
       , count(*) as cnt1
       , count(*) keep (dense_rank last order by sortkey) as cnt2
       , max(val) as maxval1
       , max(val) keep (dense_rank last order by sortkey) as maxval2
       , sum(val) as sumval1
       , sum(val) keep (dense_rank last order by sortkey) as sumval2
from KeepSample
group by id
order by id
;

select id
       , count(*) as cnt1
       , count(case rn when 1 then 1 end) as cnt2
       , max(val) as maxval1
       , max(case rn when 1 then val end) as maxval2
       , sum(val) as sumval1
       , sum(case rn when 1 then val end) as sumval2
from (
  select id
         , val
         , dense_rank() over (partition by id
                              order by sortkey desc) as rn
  from KeepSample
)
group by id
order by id
;
