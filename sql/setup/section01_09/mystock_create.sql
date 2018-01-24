create table mystock (
  deal_date date primary key,
  price number(5)
);

insert into mystock values (to_date('2007/01/06'), 1000);
insert into mystock values (to_date('2007/01/08'), 1050);
insert into mystock values (to_date('2007/01/09'), 1050);
insert into mystock values (to_date('2007/01/12'), 900);
insert into mystock values (to_date('2007/01/13'), 880);
insert into mystock values (to_date('2007/01/14'), 870);
insert into mystock values (to_date('2007/01/16'), 920);
insert into mystock values (to_date('2007/01/17'), 1000);


commit;
