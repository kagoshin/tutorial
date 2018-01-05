create table reservations(
  reserver varchar2(10) primary key,
  start_date date,
  end_date date
);

insert into reservations values('木村', to_date('2006/10/26'), to_date('2006/10/27'));
insert into reservations values('荒木', to_date('2006/10/28'), to_date('2006/10/31'));
insert into reservations values('堀', to_date('2006/10/31'), to_date('2006/11/01'));
insert into reservations values('山本', to_date('2006/11/03'), to_date('2006/11/04'));
insert into reservations values('内田', to_date('2006/11/03'), to_date('2006/11/05'));
insert into reservations values('水谷', to_date('2006/11/06'), to_date('2006/11/06'));

commit;