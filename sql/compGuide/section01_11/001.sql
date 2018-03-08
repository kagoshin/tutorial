-- 遅い
select *
from Class_A02
where id in (
  select id from Class_B02
);

-- 速い
select *
from Class_A02 a
where exists (
  select * from Class_B02 b
  where a.id = b.id
);

-- INを結合で代用
-- サブクエリがなくなったので、中間テーブルが作成されない。
select a.id, a.name
from Class_A02 a
inner join Class_B02 b
on a.id = b.id;
