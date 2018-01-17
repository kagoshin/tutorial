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

--連番の範囲を動的に決定するクエリ
select seq
from sequence
where seq between (select min(seq) from seqtbl2)
          and (select max(seq) from seqtbl2)
minus
select seq from seqtbl2;
