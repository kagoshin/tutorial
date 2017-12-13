create table Class_A
(
  name varchar2(20) ,
  age number(3),
  city varchar2(20),
  primary key(name)
)

create table Class_B
(
  name varchar2(20) ,
  age number(3),
  city varchar2(20),
  primary key(name)
)

insert into Class_A values('ブラウン', 22, '東京');
insert into Class_A values('ラリー', 19, '埼玉');
insert into Class_A values('ボギー', 21, '千葉');

insert into Class_B values('斎藤', 22, '東京');
insert into Class_B values('田尻', 23, '東京');
insert into Class_B values('山田', null, '東京');
insert into Class_B values('和泉', 18, '千葉');
insert into Class_B values('武田', 20, '千葉');
insert into Class_B values('石川', 19, '神奈川');

update class_b set age = 20 where name = '山田';
update class_b set age = null where name = '山田';
