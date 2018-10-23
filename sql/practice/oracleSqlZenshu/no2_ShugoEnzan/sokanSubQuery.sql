create table NumTable(id primary key, staNum, endNum) as
  select 1, 10, 20 from dual union all
  select 3, 15, 25 from dual union all
  select 5, 30, 40 from dual union all
  select 6, 50, 58 from dual union all
  select 11, 53, 54 from dual union all
  select 13, 52, 59 from dual union all
  select 16, 70, 75 from dual union all
  select 18, 76, 80 from dual
;

select id, staNum, endNum,
       case when exists (
         select 1 from NumTable b
         where b.id != a.id
         and b.staNum <= a.endNum
         and b.endNum >= a.staNum
       ) then 1 else 0 end as isOverlaps
from NumTable a
order by id
;
