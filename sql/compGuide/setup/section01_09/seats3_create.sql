create table seats3 (
  seat number(2) primary key,
  status varchar2(3)
);

insert into seats3 values (1, '占');
insert into seats3 values (2, '空');
insert into seats3 values (3, '空');
insert into seats3 values (4, '空');
insert into seats3 values (5, '空');
insert into seats3 values (6, '占');
insert into seats3 values (7, '空');
insert into seats3 values (8, '占');
insert into seats3 values (9, '空');
insert into seats3 values (10, '空');

commit;
