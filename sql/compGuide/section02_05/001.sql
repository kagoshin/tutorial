select member
       , team
       , age
       , rank() over (partition by team order by age desc) as rn
       , dense_rank() over (partition by team order by age desc) as dense_rn
       , row_number() over (partition by team order by age desc) as row_num
from Teams
order by team, rn
;

--もとのテーブルから（ほぼ）5分の1の行数で抽出する
select *
from SomeTbl
where mod(seq, 5) = 0
;

--Tableに列番号がない場合でも、row_number関数を使えばOK
select *
from (
  select col
         , row_number() over (order by col) as seq
  from SomeTbl
)
where mod(seq, 5) = 0
;
