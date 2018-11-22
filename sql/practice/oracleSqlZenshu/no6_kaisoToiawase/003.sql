create table siblingsSample(ID primary key, OyaID) as
  select 1, null from dual union all
  select 2, 1 from dual union all
  select 3, 1 from dual union all
  select 4, 3 from dual union all
  select 5, 3 from dual union all
  select 20, null from dual union all
  select 22, 21 from dual union all
  select 23, 20 from dual
;
insert into siblingsSample values (21, 20);
commit;

-- order siblings byの使用例
select connect_by_root ID as treeID
       , id
       , oyaid
       , level
       , sys_connect_by_path(to_char(id), ',') as path
from siblingsSample
start with oyaid is null
connect by prior id = oyaid
order siblings by id desc
;
