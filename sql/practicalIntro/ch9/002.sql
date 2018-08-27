-- リスト9.4 行持ちの点数テーブルの定義
create table ScoreRows (
  student_id char(4) not null,
  subject varchar(8) not null,
  score integer ,
  constraint pk_ScoreRows primary key(student_id, subject)
);

create table ScoreCols (
  student_id char(4) not null,
  score_en integer ,
  score_nl integer ,
  score_mt integer ,
  constraint pk_ScoreCols primary key (student_id)
);

insert into ScoreRows values ('A001', '英語', 100);
INSERT INTO ScoreRows VALUES ('A001',	'国語',	58);
INSERT INTO ScoreRows VALUES ('A001',	'数学',	90);
INSERT INTO ScoreRows VALUES ('B002',	'英語',	77);
INSERT INTO ScoreRows VALUES ('B002',	'国語',	60);
INSERT INTO ScoreRows VALUES ('C003',	'英語',	52);
INSERT INTO ScoreRows VALUES ('C003',	'国語',	49);
INSERT INTO ScoreRows VALUES ('C003',	'社会',	100);

INSERT INTO ScoreCols VALUES ('A001',	NULL, NULL, NULL);
INSERT INTO ScoreCols VALUES ('B002',	NULL, NULL, NULL);
INSERT INTO ScoreCols VALUES ('C003',	NULL, NULL, NULL);
INSERT INTO ScoreCols VALUES ('D004',	NULL, NULL, NULL);

--commit;
--rollback;

-- リスト9.6 行→列の更新SQL：素直だけど非効率
set autotrace on explain
update scorecols
set score_en = (
    select score
    from scorerows sr
    where sr.student_id = scorecols.student_id
    and subject = '英語'
  ),
  score_nl = (
    select score
    from scorerows sr
    where sr.student_id = scorecols.student_id
    and subject = '国語'
  ),
  score_mt = (
    select score
    from scorerows sr
    where sr.student_id = scorecols.student_id
    and subject = '数学'
  )
;

--commit;
--rollback;

-- リスト9.7 より効率的なSQL：リスト機能の利用
set autotrace on explain
update scorecols
set (score_en, score_nl, score_mt) --複数列をリスト化して一度で更新
= (
  select max(case when subject = '英語'
                  then score
                  else null end) as score_en,
         max(case when subject = '国語'
                  then score
                  else null end) as score_nl,
         max(case when subject = '数学'
                  then score
                  else null end) as score_mt
  from scorerows sr
  where sr.student_id = scorecols.student_id
);

--commit;
--rollback;
