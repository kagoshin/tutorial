create table seats (
  seat number(2) primary key,
  status varchar2(3)
);

insert into seats values (1, '占');
insert into seats values (2, '占');
insert into seats values (3, '空');
insert into seats values (4, '空');
insert into seats values (5, '空');
insert into seats values (6, '占');
insert into seats values (7, '空');
insert into seats values (8, '空');
insert into seats values (9, '空');
insert into seats values (10, '空');
insert into seats values (11, '空');
insert into seats values (12, '占');
insert into seats values (13, '占');
insert into seats values (14, '空');
insert into seats values (15, '空');

commit;