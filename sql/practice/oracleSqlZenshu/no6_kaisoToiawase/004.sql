create table IsLeafSample(ID primary key, OyaID) as
  select 1, null from dual union all
  select 2, 1 from dual union all
  select 3, 1 from dual union all
  select 4, 3 from dual union all
  select 5, 3 from dual union all
  select 10, null from dual union all
  select 11, 10 from dual
;

-- connect_by_IsLeaf擬似列の使用例
select id
       , OyaID
       , level
       , connect_by_IsLeaf as IsLeaf
       , sys_connect_by_path(to_char(id), ',') as path
from IsLeafSample
start with OyaID is null
connect by prior id = OyaID
;

-- 木の葉である行のみを取得
select id
       , OyaID
       , level
       , sys_connect_by_path(to_char(id), ',') as path
from IsLeafSample
where connect_by_IsLeaf = 1
start with OyaID is null
connect by prior id = OyaID
;

-- connect_by_root演算子の使用例
select id
       , oyaid
       , connect_by_root id as rootID
       , sys_connect_by_path(to_char(id), ',') as path
from IsLeafSample
start with oyaid is null
connect by prior id = oyaid
;

-- 木ごとに幅優先探索順に出力
select id
       , oyaid
       , level
       , sys_connect_by_path(to_char(id), ',') as path
from IsLeafSample
start with oyaid is null
connect by prior id = oyaid
order by connect_by_root id
         , level
         , id
;
