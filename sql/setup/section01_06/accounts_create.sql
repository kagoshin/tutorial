create table accounts(
  prc_date date　primary key,
  prc_amt number(10)
);

insert into accounts values (to_date('2006/10/26'), 12000);
insert into accounts values (to_date('2006/10/28'), 2500);
insert into accounts values (to_date('2006/10/31'), -15000);
insert into accounts values (to_date('2006/11/03'), 34000);
insert into accounts values (to_date('2006/11/04'), -5000);
insert into accounts values (to_date('2006/11/06'), 7200);
insert into accounts values (to_date('2006/11/11'), 11000);

commit;