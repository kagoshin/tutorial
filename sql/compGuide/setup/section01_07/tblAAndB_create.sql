create table tbl_A (
  key varchar2(3) primary key,
  col_1 number(2),
  col_2 number(2),
  col_3 number(2)
);

create table tbl_B (
  key varchar2(3) primary key,
  col_1 number(2),
  col_2 number(2),
  col_3 number(2)
);

insert into tbl_A values ('A', 2, 3, 4);
insert into tbl_A values ('B', 0, 7, 9);
insert into tbl_A values ('C', 5, 1, 6);

insert into tbl_B values ('A', 2, 3, 4);
insert into tbl_B values ('B', 0, 7, 9);
insert into tbl_B values ('C', 5, 1, 6);

commit;

update TBL_B set col_3 = 8 where key = 'B';
update TBL_B set col_3 = 9 where key = 'B';