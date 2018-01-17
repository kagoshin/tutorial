create table arrayTbl (
  key varchar2(3) primary key,
  col1 number(1),
  col2 number(1),
  col3 number(1),
  col4 number(1),
  col5 number(1),
  col6 number(1),
  col7 number(1),
  col8 number(1),
  col9 number(1)
);

insert into arrayTbl values ('A', null, null, null, null, null, null, null, null, null);
insert into arrayTbl values ('B', 3, null, null, null, null, null, null, null, null);
insert into arrayTbl values ('C', 1, 1, 1, 1, 1, 1, 1, 1, 1);
insert into arrayTbl values ('D', null, null, 9, null, null, null, null, null, null);
insert into arrayTbl values ('E', null, 3, null, 1, 9, null, null, 9, null);
