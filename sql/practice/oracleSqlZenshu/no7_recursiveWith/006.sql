create table nimotu (id primary key, val, kg) as
  select 1, 7, 10 from dual union all
  select 2, 2, 4  from dual union all
  select 3, 9, 5  from dual union all
  select 4, 4, 1  from dual union all
  select 5, 9, 7  from dual union all
  select 6, 7, 3  from dual union all
  select 7, 4, 6  from dual union all
  select 8, 5, 3  from dual
;

with rec (id, idList, sumVal, sumKg) as (
  select id
         , to_char(id)
         , val
         , kg
  from nimotu
  union all
  select b.id
         , a.idlist || ',' || to_char(b.id)
         , a.sumVal + b.val
         , a.sumKg + b.kg
  from rec a
       , nimotu b
  where a.id < b.id
  and a.sumKg + b.kg <= 20
)
select id
       , idList
       , sumVal
       , sumKg
from (
  select id
         , idList
         , sumVal
         , sumKg
         , max(sumVal) over() as maxSumval
  from rec
)
where sumVal = maxSumval
;
