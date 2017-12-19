-- http://www.oracle.com/technetwork/jp/articles/otnj-sql-image8-1869574-ja.html

create table UnPivotSample(
ID   number(1) primary key,
Val1 number(2),
Val2 number(2),
Val3 number(2));

insert into UnPivotSample
select 1,12,  11,  10 from dual union all
select 3,30,  90,null from dual union all
select 5,50,null,null from dual;

-- UnPivotのサンプル
--UnPivot(列値を表示する列名 for 元列の識別値を表示する列名 in(元列1,元列2,元列3))
select id, vals, cols
from UnPivotSample
unpivot(
  vals for cols in (val1, val2, val3)
);

-- Include nullsを指定したUnPivot
select id, vals, cols
from UnPivotSample
unpivot include nulls(
  vals for cols in (val1, val2, val3)
);

-- 元列の識別値を指定
select id, vals, cols
from UnPivotSample
unpivot(
  vals for cols in (val1 as 'moto1',
                    val2 as 'moto2',
                    val3 as 'moto3')
);

-- 数値型のソートキーを持たせたUnPivot
select id, vals, sortkeys
from UnPivotSample
unpivot(
  vals for sortkeys in (val1 as 1,
                        val2 as 2,
                        val3 as 3)
)
order by id, sortkeys;

-- 元列の識別値として数値型と列名の両方を指定
select id, vals, sortkeys, moto
from UnPivotSample
unpivot(
  vals for (sortkeys, moto)
  in (val1 as (1, 'moto1'),
      val2 as (2, 'moto2'),
      val3 as (3, 'moto3'))
)
order by id, sortkeys;
