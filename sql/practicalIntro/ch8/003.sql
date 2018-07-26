--リスト8.7 クラスごとに連番を振る（ROW_NUMBER）
select class
       , student_id
       , row_number() over (partition by class order by student_id)
from Weights2
;

--リスト8.8 クラスごとに連番を振る（相関サブクエリ）
select class
       , student_id
       , (select count(*)
          from Weights2 w2
          where w2.class = w1.class
          and w2.student_id <= w1.student_id
        ) as seq
from Weights2 w1
;
