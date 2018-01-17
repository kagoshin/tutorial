create table meetings (
  meeting varchar2(10),
  person varchar2(10),
  primary key(meeting, person)
);

insert into meetings values ('第1回', '伊藤');
insert into meetings values ('第1回', '水島');
insert into meetings values ('第1回', '坂東');
insert into meetings values ('第2回', '伊藤');
insert into meetings values ('第2回', '宮田');
insert into meetings values ('第3回', '坂東');
insert into meetings values ('第3回', '水島');
insert into meetings values ('第3回', '宮田');

commit;