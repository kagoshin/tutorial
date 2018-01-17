create table projects (
  project_id varchar2(20),
  step_nbr number(2),
  status varchar2(10),
  primary key (project_id, step_nbr)
);

insert into projects values ('AA100', 0, '完了');
insert into projects values ('AA100', 1, '待機');
insert into projects values ('AA100', 2, '待機');
insert into projects values ('B200', 0, '待機');
insert into projects values ('B200', 1, '待機');
insert into projects values ('CS300', 0, '完了');
insert into projects values ('CS300', 1, '完了');
insert into projects values ('CS300', 2, '待機');
insert into projects values ('CS300', 3, '待機');
insert into projects values ('DY400', 0, '完了');
insert into projects values ('DY400', 1, '完了');
insert into projects values ('DY400', 2, '完了');

commit;
