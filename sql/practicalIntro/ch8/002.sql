--リスト8.4 体重テーブル2の定義
create table Weights2 (
  class       integer not null,
  student_id  char(4) not null,
  weight      integer not null,
  primary key(class, student_id)
);

insert into Weights2 values(1, '100', 50);
INSERT INTO Weights2 VALUES(1, '101', 55);
INSERT INTO Weights2 VALUES(1, '102', 56);
INSERT INTO Weights2 VALUES(2, '100', 60);
INSERT INTO Weights2 VALUES(2, '101', 72);
INSERT INTO Weights2 VALUES(2, '102', 73);
INSERT INTO Weights2 VALUES(2, '103', 73);
--commit;

--リスト8.5 主キーが複数列の場合（ROW_NUMBER）
select class
       , student_id
       , row_number() over (order by class, student_id) as seq
from Weights2
;

--リスト8.6 主キーが複数列の場合（相関サブクエリ：行式）
select class
       , student_id
       , (select count(*)
          from weights w2
          where (w2.class, w2.student_id)
                  <= (w1.class, w1.student_id)
        ) as seq
from Weights2 w1
;
