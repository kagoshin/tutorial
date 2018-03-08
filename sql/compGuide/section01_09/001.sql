--連番を求めるその1：0～99
select d1.digit + (d2.digit * 10) as seq
from digits d1
cross join digits d2
order by seq;

--連番を求めるその2：1～542を求める
select d1.digit + (d2.digit * 10) + (d3.digit * 100) as seq
from digits d1
cross join digits d2
cross join digits d3
where d1.digit + (d2.digit * 10) + (d3.digit * 100)
      between 1 and 542
order by seq;

--シーケンス・ビューを作る（0～999までをカバー）
create view sequence(seq)
as
select d1.digit + (d2.digit * 10) + (d3.digit * 100) as seq
from digits d1
cross join digits d2
cross join digits d3;

--シーケンス・ビューから1～100まで取得
select seq
from sequence
where seq between 1 and 100
order by seq;
