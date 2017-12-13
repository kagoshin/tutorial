create table SeqTbl
(
  seq number(3) ,
  name varchar2(20),
  primary key(seq)
)
comment on column SeqTbl.seq is '連番';
comment on column SeqTbl.seq is '名前';

insert into SeqTbl values (1, 'ディック');
insert into SeqTbl values (2, 'アン');
insert into SeqTbl values (3, 'ライル');
insert into SeqTbl values (5, 'カー');
insert into SeqTbl values (6, 'マリー');
insert into SeqTbl values (8, 'ベン');
