create table AggSample1 (id, val) as
  select 111, 0 from dual union all
  select 111, 2 from dual union all
  select 111, 6 from dual union all
  select 222, 4 from dual union all
  select 222, 5 from dual union all
  select 333, 7 from dual
;

select id
       , count(*) as cnt
       , max(val) as maxVal
       , min(val) as minVal
       , sum(val) as samVal
from AggSample1
group by id
order by id
;

create table AggSample2(id, val) as
  select 111, 'A' from dual union all
  select 111, 'B' from dual union all
  select 111, 'C' from dual union all
  select 222, 'D' from dual union all
  select 222, 'E' from dual union all
  select 333, 'F' from dual
;

select id
--       , wmsys.wm_concat(val) as strAgg1
       , ListAgg(val, ',') withIn group (order by val) as StrAgg2
       , ListAgg(val, ',') withIn group (order by val desc) as StrAgg3
from AggSample2
group by id
order by id
;

create table AggSample3(id, val) as
  select 111, 10 from dual union all
  select 111, 30 from dual union all
  select 222, 40 from dual union all
  select 222, 40 from dual union all
  select 333, 10 from dual union all
  select 333, 10 from dual union all
  select 333, 40 from dual union all
  select 444, 60 from dual union all
  select 444, 90 from dual
;

select id
       , avg(val) as avgVal
       , median(val) as medianVal
       , stats_mode(val) as modeVal
from AggSample3
group by id
order by id
;
