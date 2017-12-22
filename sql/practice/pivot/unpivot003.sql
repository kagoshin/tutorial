-- 基本的なUnPivot その1
with t(id, val1, val2) as(
  select 5, 10, 90 from dual union all
  select 6, 20, 80 from dual union all
  select 7, 30, 70 from dual
)
select * from t
unpivot(vals for cols in(val1, val2));

-- 基本的なUnPivot その2
with t(id, val1, val2) as(
  select 5, 10, 90 from dual union all
  select 6, 20, 80 from dual union all
  select 7, 30, 70 from dual
)
select * from t
unpivot(
  vals for sortKeys in(val1 as 1,
                       val2 as 2)
)
order by id, sortKeys;

-- 基本的なUnPivot その3
with t(id, val1, val2) as(
  select 5, 10, 90 from dual union all
  select 6, 20, 80 from dual union all
  select 7, 30, 70 from dual
)
select * from t
unpivot(
  vals for (sortKeys, moto)
  in (val1 as (1, 'moto1'),
      val2 as (2, 'moto2'))
)
order by id, sortKeys;

-- 複数列でUnPivot その1
with t(ID,Val1,Name1,Val2,Name2) as(
select 1,11,'AA',66,'FF' from dual union all
select 2,22,'BB',77,'GG' from dual union all
select 3,33,'CC',88,'HH' from dual union all
select 4,44,'DD',99,'II' from dual union all
select 5,55,'EE',20,'JJ' from dual)
select * from t
unpivot(
  (vals, names) for cols
  in ((val1, name1) as 'v1n1',
      (val2, name2) as 'v2n2')
);

-- 複数列でUnPivot その2
with t(ID,Val1,Name1,Val2,Name2) as(
select 1,11,'AA',66,'FF' from dual union all
select 2,22,'BB',77,'GG' from dual union all
select 3,33,'CC',88,'HH' from dual union all
select 4,44,'DD',99,'II' from dual union all
select 5,55,'EE',20,'JJ' from dual)
select * from t
unpivot(
  (vals, names) for (col1, col2)
  in ((val1, name1) as ('v1', 'n1'),
      (val2, name2) as ('v2', 'n2'))
);

-- UnPivotしてPivot
with t(ID,Val1,Val2,Val3,Val4) as(
select 'Sat',10,15,20,25 from dual union all
select 'Sun',30,35,40,45 from dual union all
select 'Mon',50,55,60,65 from dual)
select * from t
unpivot(
  vals for cols in (val1, val2, val3, val4)
)
pivot(
  max(vals) for id
  in ('Sat' as sat,
      'Sun' as sun,
      'Mon' as mon)
)
order by cols;
