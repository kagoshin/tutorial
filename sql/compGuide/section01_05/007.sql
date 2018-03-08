-- 排他的和集合
select
  coalesce(a.id, b.id) as id,
  coalesce(a.name, b.name) as name
from Class_A02 a
full outer join Class_B02 b
on a.id = b.id
where a.name is null
or b.name is null;

-- 外部結合で関係除算：差集合の応用
select distinct shop
from shopitems si1
where not exists(
  select i.item
  from items i
  left outer join shopitems si2
  on i.item = si2.item
  and si1.shop = si2.shop --oracleでは動かない
  where si2.item is null
);
