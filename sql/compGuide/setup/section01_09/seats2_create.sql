create table seats2 (
  seat number(2) primary key,
  row_id varchar2(3),
  status varchar2(3)
);

insert into seats2 values(1, 'A', '占');
insert into seats2 values(2, 'A', '占');
insert into seats2 values(3, 'A', '空');
insert into seats2 values(4, 'A', '空');
insert into seats2 values(5, 'A', '空');
insert into seats2 values(6, 'B', '占');
insert into seats2 values(7, 'B', '占');
insert into seats2 values(8, 'B', '空');
insert into seats2 values(9, 'B', '空');
insert into seats2 values(10, 'B', '空');
insert into seats2 values(11, 'C', '空');
insert into seats2 values(12, 'C', '空');
insert into seats2 values(13, 'C', '空');
insert into seats2 values(14, 'C', '占');
insert into seats2 values(15, 'C', '空');

commit;