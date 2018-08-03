INSERT INTO Weights VALUES('C478',	90);
--delete from weights where student_id = 'C478';
commit;

--リスト8.12 メジアンを求める（集合指向型）：母集合を上位と下位に分割する
set autotrace on explain
select avg(weight) as median
from (
  select w1.weight
  from weights w1
       , weights w2
  group by w1.weight
  --S1（下位集合）の条件
  having sum(case when w2.weight >= w1.weight
             then 1
             else 0 end)
    >= count(*) / 2
  --S2（上位集合）の条件
  and sum(case when w2.weight <= w1.weight
          then 1
          else 0 end)
    >= count(*) / 2
) TMP
;

--リスト8.13 メジアンを求める（手続き型）：両端から1行ずつ数えてぶつかった地点が「世界の中心」
select avg(weight) as median
from (
  select weight
         , row_number() over (order by weight asc, student_id asc) as hi
         , row_number() over (order by weight desc, student_id desc) as lo
  from weights
) tmp
where hi in (lo, lo + 1, lo - 1)
;

--リスト8.14 メジアンを求める（手続き型その2）：折り返し地点を見つける
--集合の要素数が２倍に増えても中央値は変動しない
select avg(weight)
from (
  select weight
         , 2 * row_number() over (order by weight)
            - count(*) over () as diff
  from weights
) tmp
where diff between 0 and 2
;

--確認用
select weight
       , row_number() over (order by weight) as row
       , 2 * row_number() over (order by weight) as row_double
       , count(*) over () as cnt
from weight
;
