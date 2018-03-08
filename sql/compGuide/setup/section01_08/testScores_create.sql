create table testScores (
  student_id number(3),
  subject varchar2(8),
  score number(3),
  primary key (student_id, subject)
);

insert into testScores values (100, '算数', 100);
insert into testScores values (100, '国語', 80);
insert into testScores values (100, '理科', 80);
insert into testScores values (200, '算数', 80);
insert into testScores values (200, '国語', 95);
insert into testScores values (300, '算数', 40);
insert into testScores values (300, '国語', 90);
insert into testScores values (300, '社会', 55);
insert into testScores values (400, '算数', 80);

commit;
