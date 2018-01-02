create table personnel02(
  employee varchar2(30) primary key,
  child_1 varchar2(30),
  child_2 varchar2(30),
  child_3 varchar2(30)
);

insert into personnel02 values('赤井', '一郎', '二郎', '三郎');
insert into personnel02 values('工藤', '春子', '夏子', null);
insert into personnel02 values('鈴木', '夏子', null, null);
insert into personnel02 values('吉田', null, null, null);
