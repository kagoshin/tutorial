-- 結果が返れば歯抜けあり：数列の連続性のみ調べる
select '歯抜けあり' as gap
from seqtbl2
having count(*) <> max(seq) - min(seq) + 1;

-- 欠番があってもなくても1行返す
select case when count(*) = 0 then 'テーブルが空です'
            when count(*) <> max(seq) - min(seq) + 1 then '歯抜けあり'
            else '連続' end as gap
from seqtbl2;

-- 歯抜けの最小値を探す：テーブルに１がない場合は１を返す
select case when count(*) = 0 or min(seq) > 1 then 1
            else (
              select min(seq + 1)
              from seqtbl2 s1
              where not exists (
                select * from seqtbl2 s2
                where s2.seq = s1.seq + 1
              )
            ) end
from seqtbl2;

