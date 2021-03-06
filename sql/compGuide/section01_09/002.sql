-- except(minus)バージョン
select seq
from sequence
where seq between 1 and 12
minus
select seq
from seqtbl2;

-- not inバージョン
select seq
from sequence
where seq between 1 and 12
and seq not in (
  select seq from seqtbl2
);

-- not existsバージョン
select seq
from sequence seq1
where seq between 1 and 12
and not exists (
  select 1
  from seqtbl2 seq2
  where seq1.seq = seq2.seq
);

-- 外部結合バージョン
select seq1.seq
from sequence seq1
left outer join seqtbl2 seq2
on seq1.seq = seq2.seq
where seq1.seq between 1 and 12
and seq2.seq is null;

--連番の範囲を動的に決定するクエリ
select seq
from sequence
where seq between (select min(seq) from seqtbl2)
          and (select max(seq) from seqtbl2)
minus
select seq from seqtbl2;
