create table testResults (
  student_id varchar2(10) primary key,
  class varchar2(3),
  sex varchar2(3),
  score number(3)
);

insert into testResults values ('001', 'A', '男', 100);
insert into testResults values ('002', 'A', '女', 100);
insert into testResults values ('003', 'A', '女', 49);
insert into testResults values ('004', 'A', '男', 30);
insert into testResults values ('005', 'B', '女', 100);
insert into testResults values ('006', 'B', '男', 92);
insert into testResults values ('007', 'B', '男', 80);
insert into testResults values ('008', 'B', '男', 80);
insert into testResults values ('009', 'B', '女', 10);
insert into testResults values ('010', 'C', '男', 92);
insert into testResults values ('011', 'C', '男', 80);
insert into testResults values ('012', 'C', '女', 21);
insert into testResults values ('013', 'D', '女', 100);
insert into testResults values ('014', 'D', '女', 0);
insert into testResults values ('015', 'D', '女', 0);

commit;