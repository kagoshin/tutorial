create table supParts (
  sup varchar2(3),
  part varchar2(12),
  primary key(sup, part)
);

insert into supParts values ('A', 'ボルト');
insert into supParts values ('A', 'ナット');
insert into supParts values ('A', 'パイプ');
insert into supParts values ('B', 'ボルト');
insert into supParts values ('B', 'パイプ');
insert into supParts values ('C', 'ボルト');
insert into supParts values ('C', 'ナット');
insert into supParts values ('C', 'パイプ');
insert into supParts values ('D', 'ボルト');
insert into supParts values ('D', 'パイプ');
insert into supParts values ('E', 'ヒューズ');
insert into supParts values ('E', 'ナット');
insert into supParts values ('E', 'パイプ');
insert into supParts values ('F', 'ヒューズ');

commit;