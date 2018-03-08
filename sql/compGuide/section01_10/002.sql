-- 資材のだぶっている拠点を選択する
select center
from materials
group by center
having count(material) <> count(distinct material);

select center
from materials
where material = '亜鉛'
group by center
having count(material) <> count(distinct material);

select center,
       case when count(material) <> count(distinct material)
            then 'ダブり有り'
            else 'ダブり無し' end as status
from materials
group by center;

-- ダブりのある集合：existsの利用
select center,
       material
from materials m1
where exists (
  select * from materials m2
  where m1.center = m2.center
  and m1.receive_date <> m2.receive_date
  and m1.material = m2.material
);

-- ダブりのない集合
select center,
       material
from materials m1
where not exists (
  select * from materials m2
  where m1.center = m2.center
  and m1.receive_date <> m2.receive_date
  and m1.material = m2.material
);