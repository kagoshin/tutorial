create table skills (
  skil varchar2(20) primary key
);

create table empSkills (
  emp varchar2(10),
  skil varchar2(20),
  primary key(emp, skil)
);

insert into skills values('oracle');
insert into skills values('unix');
insert into skills values('java');

insert into empSkills values('相田', 'oracle');
insert into empSkills values('相田', 'unix');
insert into empSkills values('相田', 'java');
insert into empSkills values('相田', 'c#');
insert into empSkills values('神崎', 'oracle');
insert into empSkills values('神崎', 'unix');
insert into empSkills values('神崎', 'java');
insert into empSkills values('平井', 'unix');
insert into empSkills values('平井', 'oracle');
insert into empSkills values('平井', 'php');
insert into empSkills values('平井', 'perl');
insert into empSkills values('平井', 'c++');
insert into empSkills values('若田部', 'perl');
insert into empSkills values('渡来', 'oracle');

commit;