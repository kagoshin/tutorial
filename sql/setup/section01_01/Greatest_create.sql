create table Greatest
(
  key varchar2(2) ,
  x number(1),
  y number(1),
  z number(1),
  primary key(key)
)

insert into Greatest (key, x, y, z)
  values ('A', 1, 2, 3);
insert into Greatest (key, x, y, z)
  values ('B', 5, 5, 2);
insert into Greatest (key, x, y, z)
  values ('C', 4, 7, 1);
insert into Greatest (key, x, y, z)
  values ('D', 3, 3, 8);
