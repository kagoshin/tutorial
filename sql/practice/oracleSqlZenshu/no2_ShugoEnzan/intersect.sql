create table masterT_02(id primary key, val) as
  select 111, 10 from dual union all
  select 333, 80 from dual union all
  select 555, 60 from dual union all
  select 777, 50 from dual union all
  select 999, 30 from dual
;

create table tranT (id primary key, kosuu) as
  select 111, 13 from dual union all
  select 222, 46 from dual union all
  select 555, 78 from dual
;

--intersect
select id
from masterT_02
intersect
select id
from tranT
order by id
;

--exists
select id, val
from masterT_02 a
where exists (
  select 1 from tranT b
  where b.id = a.id
)
order by id
;

--in
select id, val
from masterT_02 a
where id in (select id from tranT)
order by id
;

--inner join
select a.id, a.val, b.kosuu
from masterT_02 a
join tranT b
on a.id = b.id
order by a.id
;

--minus
select id
from masterT_02
minus
select id
from tranT
order by id
;

--not exists
select id, val
from masterT_02 a
where not exists (
  select 1 from tranT b
  where a.id = b.id
)
order by id
;

--not in
select id, val
from masterT_02
where id not in (
  select id from tranT
)
order by id
;
