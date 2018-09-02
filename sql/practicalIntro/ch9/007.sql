-- リスト9.25 score列にNOT NULL制約を付けたテーブル定義
create table ScoreRowsNN (
  student_id char(4) not null,
  subject varchar2(8) not null,
  score integer not null,
  constraint pk_ScoreRowsNN primary key (student_id, subject)
);

insert into ScoreRowsNN values ('A001', '英語', 0);
INSERT INTO ScoreRowsNN VALUES ('A001', '国語', 0);
INSERT INTO ScoreRowsNN VALUES ('A001', '数学', 0);
INSERT INTO ScoreRowsNN VALUES ('B002', '英語', 0);
INSERT INTO ScoreRowsNN VALUES ('B002', '国語', 0);
INSERT INTO ScoreRowsNN VALUES ('C003', '英語', 0);
INSERT INTO ScoreRowsNN VALUES ('C003', '国語', 0);
INSERT INTO ScoreRowsNN VALUES ('C003', '社会', 0);
commit;

-- リスト9.14 列→行の更新SQL
UPDATE ScoreRowsNN
　 SET score = (SELECT coalesce (
                        CASE ScoreRowsNN.subject
                          WHEN '英語' THEN score_en
                          WHEN '国語' THEN score_nl
                          WHEN '数学' THEN score_mt
                          ELSE NULL
                        END , 0)
                  FROM ScoreCols
                 WHERE student_id = ScoreRowsNN.student_id)
;

-- commit;
-- rollback;
