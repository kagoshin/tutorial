create table BaseT (id primary key) as
  select 111 from dual union all
  select 222 from dual union all
  select 333 from dual
;

create table numT (seq) as
  select 1 from dual union all
  select 2 from dual union all
  select 3 from dual
;

-- クロスジョインを使ったSQL1 (SQL99構文を使用せず)
select a.id
       , b.seq
from BaseT a
     , numT b
order by a.id
         , b.seq
;

-- クロスジョインを使ったSQL2 (SQL99構文を使用)
select a.id
       , b.seq
from BaseT a
cross join numT b
order by a.id
         , b.seq
;
