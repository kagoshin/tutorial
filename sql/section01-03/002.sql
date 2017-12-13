-- 結果が返れば歯抜けあり
select '歯抜けあり' from SeqTbl
having count(*) <> max(seq);

-- 歯抜けの最小値を探す
select min(seq + 1) as gap
from SeqTbl
where (seq + 1) not in (
  select seq from SeqTbl
);
