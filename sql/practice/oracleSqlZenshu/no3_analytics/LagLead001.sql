create table LagLeadSample(ID,SortKey,Val) as
select 111,1,99 from dual union all
select 111,3,88 from dual union all
select 111,7,77 from dual union all
select 111,9,66 from dual union all
select 222,2,55 from dual union all
select 222,4,44 from dual union all
select 222,5,33 from dual;

select id,
       sortkey,
       lag(val) over(partition by id order by sortkey) as prev,
       lead(val) over(partition by id order by sortkey) as next
from LagLeadSample
order by id, SortKey;
