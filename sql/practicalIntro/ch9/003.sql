-- リスト9.8 ScoreColsNNテーブルの定義
create table ScoreColsNN (
  student_id char(4) not null,
  score_en integer not null,
  score_nl integer not null,
  score_mt integer not null,
  constraint pk_ScoreColsNN primary key (student_id)
);

insert into ScoreColsNN values ('A001', 0, 0, 0);
INSERT INTO ScoreColsNN VALUES ('B002', 0, 0, 0);
INSERT INTO ScoreColsNN VALUES ('C003', 0, 0, 0);
INSERT INTO ScoreColsNN VALUES ('D004', 0, 0, 0);
commit;

-- リスト9.9 リスト9.6（1列ずつ更新）のNOT NULL制約対応
set autotrace on explain
update ScoreColsNN
set score_en = coalesce((
      select score
      from ScoreRows
      where student_id = ScoreColsNN.student_id
      and subject = '英語'
    ), 0),
    score_nl = coalesce((
      select score
      from ScoreRows
      where student_id = ScoreColsNN.student_id
      and subject = '国語'
    ), 0),
    score_mt = coalesce((
      select score
      from ScoreRows
      where student_id = ScoreColsNN.student_id
      and subject = '数学'
    ), 0)
where exists (
  select *
  from ScoreRows
  where student_id = ScoreColsNN.student_id
)
;

rollback;

-- リスト9.10 リスト9.7（行式の利用）のNOT NULL制約対応
update ScoreColsNN
set (score_en, score_nl, score_mt)
= (
  select coalesce(max(case when subject = '英語'
                           then score
                           else null end), 0) as score_en,
         coalesce(max(case when subject = '国語'
                           then score
                           else null end), 0) as score_nl,
         coalesce(max(case when subject = '数学'
                           then score
                           else null end), 0) as score_mt
  from ScoreRows sr
  where sr.student_id = ScoreColsNN.student_id
)
where exists (
  select *
  from ScoreRows
  where student_id = ScoreColsNN.student_id
);

rollback;

-- リスト9.11 MERGE文を利用して複数列を更新
merge into ScoreColsNN
using (select student_id,
              coalesce (max(case when subject = '英語'
                                 then score
                                 else null end), 0) as score_en,
              coalesce (max(case when subject = '国語'
                                 then score
                                 else null end), 0) as score_nl,
              coalesce (max(case when subject = '数学'
                                 then score
                                 else null end), 0) as score_mt
       from ScoreRows
       group by student_id
) sr
on (ScoreColsNN.student_id = sr.student_id)
when matched then
update set ScoreColsNN.score_en = sr.score_en,
           ScoreColsNN.score_nl = sr.score_nl,
           ScoreColsNN.score_mt = sr.score_mt
;

rollback;
