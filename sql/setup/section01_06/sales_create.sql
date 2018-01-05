create table Sales(
  year number(4) primary key,
  sale number(3)
);

insert into sales values(1990, 50);
insert into sales values(1991, 51);
insert into sales values(1992, 52);
insert into sales values(1993, 52);
insert into sales values(1994, 50);
insert into sales values(1995, 50);
insert into sales values(1996, 49);
insert into sales values(1997, 55);

  create table Sales02(
    year number(4) primary key,
    sale number(3)
  );

insert into sales02 values(1990, 50);
insert into sales02 values(1992, 50);
insert into sales02 values(1993, 52);
insert into sales02 values(1994, 55);
insert into sales02 values(1997, 55);

commit;
