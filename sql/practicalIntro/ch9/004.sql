-- リスト9.12 ScoreColsテーブルの定義
delete from ScoreCols;
insert into ScoreCols values ('A001', 100, 58, 90);
INSERT INTO ScoreCols VALUES ('B002', 77, 60, NULL);
INSERT INTO ScoreCols VALUES ('C003', 52, 49, NULL);
INSERT INTO ScoreCols VALUES ('D004', 10, 70, 100);
commit;

-- リスト9.13 ScoreRowsテーブルの定義
delete from ScoreRows;
insert into ScoreRows values ('A001', '英語', null);
INSERT INTO ScoreRows VALUES ('A001', '国語', NULL);
INSERT INTO ScoreRows VALUES ('A001', '数学', NULL);
INSERT INTO ScoreRows VALUES ('B002', '英語', NULL);
INSERT INTO ScoreRows VALUES ('B002', '国語', NULL);
INSERT INTO ScoreRows VALUES ('C003', '英語', NULL);
INSERT INTO ScoreRows VALUES ('C003', '国語', NULL);
INSERT INTO ScoreRows VALUES ('C003', '社会', NULL);
--commit;

-- リスト9.14 列→行の更新SQL
set autotrace on explain
update ScoreRows
set score = (
  select case ScoreRows.subject
         when '英語' then score_en
         when '国語' then score_nl
         when '数学' then score_mt
         else null end
  from ScoreCols
  where student_id = ScoreRows.student_id
)
;

--rollback;
--commit;
