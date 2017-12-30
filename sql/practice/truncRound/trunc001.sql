-- https://www.shift-the-oracle.com/sql/functions/trunc.html

with trunc_sample(num, p) as (
  select 123.456, 2 from dual union all
  select 123.456, 1 from dual union all
  select 123.456, 0 from dual union all
  select 123.456, -1 from dual union all
  select 123.456, -2 from dual union all
  select 123.456, -3 from dual
)
select num, p, trunc(num, p) from trunc_sample;
