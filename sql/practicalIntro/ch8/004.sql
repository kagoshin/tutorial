--リスト8.9 体重テーブル3（連番列を埋めたい）
create table Weights3 (
  class      integer not null,
  student_id char(4) not null,
  weight     integer not null,
  seq        integer null,
  primary key (class, student_id)
);

insert into Weights3 values(1, '100', 50, null);
INSERT INTO Weights3 VALUES(1, '101', 55, NULL);
INSERT INTO Weights3 VALUES(1, '102', 56, NULL);
INSERT INTO Weights3 VALUES(2, '100', 60, NULL);
INSERT INTO Weights3 VALUES(2, '101', 72, NULL);
INSERT INTO Weights3 VALUES(2, '102', 73, NULL);
INSERT INTO Weights3 VALUES(2, '103', 73, NULL);

--commit;

--リスト8.10 連番の更新（ROW_NUMBER）
update Weights3
set seq = (
  select seq
  from (select class
               , student_id
               , row_number() over (partition by class order by student_id)
                  as seq
        from Weights3) SeqTbl
       -- SeqTblというサブクエリを作る必要がある
  where Weights3.class = SeqTbl.class
  and Weights3.student_id  = SeqTbl.student_id
)
;

rollback;

--リスト8.11 連番の更新（相関サブクエリ）
update Weights3 w1
set seq = (
  select count(*)
  from Weights3 w2
  where w2.class = w1.class
  and w2.student_id <= w1.student_id
)
;

rollback;

