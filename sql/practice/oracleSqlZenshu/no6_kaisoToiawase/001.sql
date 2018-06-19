/*
http://www.oracle.com/technetwork/jp/articles/otnj-sql-image6-1352143-ja.html
*/

create table BasicSample(ID primary key,OyaID) as
select  1,null from dual union all
select  2,   1 from dual union all
select  3,   1 from dual union all
select  4,   2 from dual union all
select  5,   3 from dual union all
select 10,null from dual union all
select 11,  10 from dual union all
select 12,  10 from dual;

-- 基本的な階層問い合わせ
select id, oyaid, level
from BasicSample
start with oyaid is null
connect by prior id = oyaid
;

create table ConnBySample (
  id number,
  seq number,
  primary key(id, seq)
);

insert into ConnBySample
select 111, 5 from dual union all
select 111, 6 from dual union all
select 111, 7 from dual union all
select 222, 5 from dual union all
select 333, 5 from dual union all
select 333, 6 from dual union all
select 333, 8 from dual;

--commit;

-- connect by句で複数条件
select id, seq, level
from ConnBySample
start with seq = 5
connect by prior id = id
  and prior seq = seq - 1
;

-- connect by句でFalseを指定
select id, seq, level
from ConnBySample
start with seq = 5
connect by 1=0
;

create table staWithSample(Val primary key) as
select 5 from dual union all
select 6 from dual union all
select 7 from dual union all
select 8 from dual;

-- start with句の省略
select val, level,
       sys_connect_by_path(to_char(val), ',') as path
from staWithSample
connect by prior val = val - 1;

-- start with句でFalseを指定
select val, level,
       sys_connect_by_path(to_char(val), ',') as path
from staWithSample
start with 1=0
connect by prior val = val - 1;
