create table LPOTTable (id, key, name) as
  select 111, 10, 'aaaa' from dual union all
  select 111, 20, 'bbbb' from dual union all
  select 222, 20, 'cccc' from dual union all
  select 222, 30, 'dddd' from dual union all
  select 333, 10, 'eeee' from dual
;

create table MasterT(hokanKey) as
select 10 from dual union all
select 20 from dual union all
select 30 from dual;

-- Partitioned Outer Joinを使ったSQL
select b.id, a.hokanley, b.name
from mastert a
left outer join LPOTTable b
partition by (b.id)
on a.hokanKey = b.key
order by b.id, a.hokanKey
;
