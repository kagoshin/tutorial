create table MaxPIDSample(ID,Val) as
select 111,10 from dual union all
select 111,30 from dual union all
select 111,40 from dual union all
select 222,20 from dual union all
select 333,60 from dual union all
select 333,60 from dual;

select id,
       val,
       max(val) over(partition by id) as maxVal
from MaxPIDSample;
