-- 業者の組み合わせ
select sp1.sup as s1,
       sp2.sup as s2
from supParts sp1,
     supParts sp2
where sp1.sup < sp2.sup
group by sp1.sup, sp2.sup
order by sp1.sup, sp2.sup;


select sp1.sup as s1,
       sp2.sup as s2
from supParts sp1,
     supParts sp2
where sp1.sup < sp2.sup   -- 業者の組み合わせを作る
and sp1.part = sp2.part   -- 条件１：同じ種類の部品を扱う
group by sp1.sup, sp2.sup
having count(*) = (       -- 条件２：同数の部品を扱う
  select count(*) from supParts sp3
  where sp3.sup = sp1.sup)
and count(*) = (
  select count(*) from supParts sp4
  where sp4.sup = sp2.sup)
order by sp1.sup, sp2.sup;
