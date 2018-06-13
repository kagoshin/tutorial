-- http://www.oracle.com/technetwork/jp/articles/otnj-sql-image8-1869298-ja.html

create table PivotSample(
ID   number(1),
Year number(4),
Val  number(3),
primary key (ID,Year));

insert into PivotSample
select 1,2010,  1 from dual union all
select 1,2011,  2 from dual union all
select 1,2012,  6 from dual union all
select 2,2010, 70 from dual union all
select 2,2011, 80 from dual union all
select 3,2012, 90 from dual union all
select 4,2010,300 from dual union all
select 4,2012,500 from dual;

-- Pivotのサンプル
--Pivot(集約関数 for 集約条件列 in(集約条件値1 as 集約後列名1,
--                              集約条件値2 as 集約後列名2,
--                              集約条件値3 as 集約後列名3))
--集約関数、集約条件列で使用している列でない列で、 暗黙のgroup byが実行される。
select *
from PivotSample
pivot (
  max(val) for year in(2010 as Agg2010,
                       2011 as Agg2011,
                       2012 as Agg2012)
)
order by id;

-- Pivotの代用 (集約関数とdecode関数)
select id,
       max(decode(year, 2010, val)) as Agg2010,
       max(decode(year, 2011, val)) as Agg2011,
       max(decode(year, 2012, val)) as Agg2012
from PivotSample
group by id
order by id;
