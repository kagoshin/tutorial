select distinct key
from arrayTbl2 a1
where not exists (
  select *
  from arrayTbl2 a2
  where a1.key = a2.key
  and (a2.val <> 1 or a2.val is null)
);

-- 別解1：ALL術後の利用
select distinct key
from arrayTbl2 a1
where 1 = ALL (
  select val from arrayTbl2 a2
  where a1.key = a2.key
);

-- 別解2：HAVING句の利用
select key
from arrayTbl2
group by key
having sum(case when val = 1 then 1 else 0 end) = 10;

-- 別解3：HAVING句で極値関数の利用
select key
from arrayTbl2
group by key
having max(val) = 1
and min(val) = 1;
