create table Class_A02(
  id number(2) primary key,
  name varchar2(10)
);

create table Class_B02(
  id number(2) primary key,
  name varchar2(10)
);

insert into Class_A02 values (1, '田中');
insert into Class_A02 values (2, '鈴木');
insert into Class_A02 values (3, '伊集院');

insert into Class_B02 values (1, '田中');
insert into Class_B02 values (2, '鈴木');
insert into Class_B02 values (4, '西園寺');

commit;