-- 完全外部結合は情報を「完全」に保存する
select
  coalesce(a.id, b.id) as id,
  a.name as a_name,
  b.name as b_name
from Class_A02 a
full outer join Class_B02 b
on a.id = b.id;

-- 完全外部結合が使えない場合の代替方法
select a.id as id, a.name, b.name
from Class_A02 a
left outer join Class_B02 b
on a.id = b.id
union
select b.id as id, a.name, b.name
from Class_A02 a
right outer join Class_B02 b
on a.id = b.id;
