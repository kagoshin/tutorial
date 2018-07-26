--リスト8.1 体重テーブルの定義
create table Weights (
  student_id char(4) primary key,
  weight integer
);

insert into weights values ('A100', 50);
INSERT INTO Weights VALUES('A101',	55);
INSERT INTO Weights VALUES('A124',	55);
INSERT INTO Weights VALUES('B343',	60);
INSERT INTO Weights VALUES('B346',	72);
INSERT INTO Weights VALUES('C563',	72);
INSERT INTO Weights VALUES('C345',	72);
--commit;

--リスト8.2 主キーが1列の場合（ROW_NUMBER）
--set autotrace on explain
select student_id
       , row_number() over (order by student_id) as seq
from weights
;

--リスト8.3 主キーが1列の場合（相関サブクエリ）
--set autotrace on explain
select student_id
       , (select count(*)
          from weights w2
          where w2.student_id <= w1.student_id
        ) as seq
from weights w1
;
