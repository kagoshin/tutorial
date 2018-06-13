create table CntDisSample(ID,Val) as
select 111,1 from dual union all
select 111,1 from dual union all
select 111,2 from dual union all
select 222,4 from dual union all
select 222,5 from dual union all
select 222,6 from dual union all
select 333,7 from dual union all
select 333,7 from dual;

select id,
       val,
       count(distinct val) over(partition by id) as disCnt
from CntDisSample;
