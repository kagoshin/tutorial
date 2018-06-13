create table PivotCompare(
DayCol date primary key,
Val    number(3),
bikou  VarChar2(6));

insert into PivotCompare
select date '2012-01-05', 10,'bikou1' from dual union all
select date '2012-01-16', 20,'bikou2' from dual union all
select date '2012-01-28', 60,'bikou3' from dual union all
select date '2012-02-11',200,null     from dual union all
select date '2012-02-22',300,null     from dual union all
select date '2012-03-30',700,'bikou4' from dual;

-- Pivotの代用 (集約関数とdecode関数)
select
sum(decode(extract(month from DayCol), 1, val)) as sum1,
count(decode(extract(month from DayCol), 1, val)) as cnt1,
sum(decode(extract(month from DayCol), 2, val)) as sum2,
count(decode(extract(month from DayCol), 2, val)) as cnt2,
sum(decode(extract(month from DayCol), 3, val)) as sum3,
count(decode(extract(month from DayCol), 3, val)) as cnt3
from PivotCompare;

-- Pivotを使用
select * 
from (
  select extract(month from DayCol) as month,
         val
  from PivotCompare
)
pivot(
  sum(val) as sum for month in(1, 2, 3)
);
