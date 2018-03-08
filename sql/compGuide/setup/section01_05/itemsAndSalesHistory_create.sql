create table Items02(
  item_no number(3) primary key,
  item varchar2(15)
);

insert into items02 values(10, 'FD');
insert into items02 values(20, 'CD-R');
insert into items02 values(30, 'MO');
insert into items02 values(40, 'DVD');

create table SalesHistory(
  sales_date date,
  item_no number(3),
  quantity number(3),
  primary key(sales_date, item_no)
);

insert into SalesHistory values(to_date('2007/10/01'), 10, 4);
insert into SalesHistory values(to_date('2007/10/01'), 20, 10);
insert into SalesHistory values(to_date('2007/10/01'), 30, 3);
insert into SalesHistory values(to_date('2007/10/03'), 10, 32);
insert into SalesHistory values(to_date('2007/10/03'), 30, 12);
insert into SalesHistory values(to_date('2007/10/04'), 20, 22);
insert into SalesHistory values(to_date('2007/10/04'), 30, 7);

commit;