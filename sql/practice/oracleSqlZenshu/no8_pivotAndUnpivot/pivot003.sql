-- 基本的なPivot その1
with t(id, seq, val) as (
  select 111, 1, 77 from dual union all
  select 111, 2, 66 from dual union all
  select 111, 3, 55 from dual union all
  select 222, 1, 44 from dual union all
  select 222, 3, 33 from dual union all
  select 333, 2, 22 from dual
)
select * from t
pivot (
  max(val) for seq in (1, 2, 3)
)
order by id;


-- 基本的なPivot その2
with t(id, seq, val) as (
  select 111, 1, 77 from dual union all
  select 111, 2, 66 from dual union all
  select 111, 3, 55 from dual union all
  select 222, 1, 44 from dual union all
  select 222, 3, 33 from dual union all
  select 333, 2, 22 from dual
)
select * from t
pivot (
  max(val) for seq in (1 as seq1,
                       2 as seq2,
                       3 as seq3)
)
order by id;


-- 複数列でPivot その1
with t(id, year, month, val) as (
  select 1, 2012, 1, 10 from dual union all
  select 1, 2012, 2, 20 from dual union all
  select 1, 2012, 3, 60 from dual union all
  select 2, 2012, 1,300 from dual union all
  select 2, 2012, 3,500 from dual union all
  select 3, 2012, 2,900 from dual
)
select * from t
pivot(
  max(val) for (year, month) in ((2012, 1) as Agg1,
                                 (2012, 2) as Agg2,
                                 (2012, 3) as Agg3)
);


-- 複数列でPivot その2
with t(ID,Year,Month,Val) as(
select 1,2012,1, 10 from dual union all
select 1,2012,1,700 from dual union all
select 1,2012,2, 20 from dual union all
select 1,2012,3, 60 from dual union all
select 2,2012,1,300 from dual union all
select 2,2012,1,999 from dual union all
select 2,2012,3,500 from dual union all
select 3,2012,2,900 from dual)
select * from t
pivot(
  count(*) as cnt,
  max(val) as max
  for (year, month)
  in ((2012, 1) as Agg1,
      (2012, 2) as Agg2,
      (2012, 3) as Agg3)
);
