create table RunSumSample(ID,SortKey,Val) as
select 111,1, 1 from dual union all
select 111,3, 2 from dual union all
select 111,5, 6 from dual union all
select 222,1,10 from dual union all
select 222,2,20 from dual union all
select 222,3,60 from dual union all
select 222,4, 6 from dual union all
select 333,1, 1 from dual union all
select 333,2, 2 from dual union all
select 333,3,20 from dual union all
select 333,3,30 from dual;

--sortkey順で並べて、idごとの累計
select id,
       sortkey,
       val,
       sum(val) over(partition by id order by sortkey) as runSum
from RunSumSample;

-- id,sortkey順で並べて、全体の累計
select id,
       sortKey,
       val,
       sum(val) over(order by id, sortkey) as runSum
from RunSumSample;
