create table arrayTbl2 (
  key varchar2(3),
  i number(2),
  val number(2),
  primary key (key, i)
);

insert into arrayTbl2 values ('A', 1, null);
insert into arrayTbl2 values ('A', 2, null);
insert into arrayTbl2 values ('A', 3, null);
insert into arrayTbl2 values ('A', 4, null);
insert into arrayTbl2 values ('A', 5, null);
insert into arrayTbl2 values ('A', 6, null);
insert into arrayTbl2 values ('A', 7, null);
insert into arrayTbl2 values ('A', 8, null);
insert into arrayTbl2 values ('A', 9, null);
insert into arrayTbl2 values ('A', 10, null);
insert into arrayTbl2 values ('B', 1, 3);
insert into arrayTbl2 values ('B', 2, null);
insert into arrayTbl2 values ('B', 3, null);
insert into arrayTbl2 values ('B', 4, null);
insert into arrayTbl2 values ('B', 5, null);
insert into arrayTbl2 values ('B', 6, null);
insert into arrayTbl2 values ('B', 7, null);
insert into arrayTbl2 values ('B', 8, null);
insert into arrayTbl2 values ('B', 9, null);
insert into arrayTbl2 values ('B', 10, null);
insert into arrayTbl2 values ('C', 1, 1);
insert into arrayTbl2 values ('C', 2, 1);
insert into arrayTbl2 values ('C', 3, 1);
insert into arrayTbl2 values ('C', 4, 1);
insert into arrayTbl2 values ('C', 5, 1);
insert into arrayTbl2 values ('C', 6, 1);
insert into arrayTbl2 values ('C', 7, 1);
insert into arrayTbl2 values ('C', 8, 1);
insert into arrayTbl2 values ('C', 9, 1);
insert into arrayTbl2 values ('C', 10, 1);

commit;