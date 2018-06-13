create table testIdTable(
  id varchar2(8) primary key,
  name varchar2(10)
);

create table testDateTable(
  id varchar2(8) primary key,
  brdDate date,
  div number(1),
  s_datetime varchar2(4),
  s_hour varchar2(2),
  s_minute varchar2(2),
  e_datetime varchar2(4),
  e_hour varchar2(2),
  e_minute varchar2(2)
);

insert into testDateTable values ('10001', to_date('2017-10-10'), 1, '1000', '10', '00', '1100', '11', '00');
insert into testDateTable values ('10001', to_date('2017-10-10'), 1, '1100', '11', '00', '1200', '12', '00');
insert into testDateTable values ('10001', to_date('2017-10-10'), 1, '1205', '12', '05', '1300', '13', '00');
insert into testDateTable values ('10001', to_date('2017-10-10'), 1, '1300', '13', '00', '1400', '14', '00');
insert into testDateTable values ('10001', to_date('2017-10-10'), 1, '1405', '14', '05', '1500', '15', '00');
insert into testDateTable values ('10001', to_date('2017-10-10'), 1, '1500', '15', '00', '1600', '16', '00');
insert into testDateTable values ('10001', to_date('2017-10-10'), 1, '1605', '16', '05', '1700', '17', '00');
insert into testDateTable values ('10001', to_date('2017-11-10'), 1, '1000', '10', '00', '1100', '11', '00');
insert into testDateTable values ('10001', to_date('2017-11-10'), 1, '1100', '11', '00', '1200', '12', '00');
insert into testDateTable values ('10001', to_date('2017-11-10'), 1, '1205', '12', '05', '1300', '13', '00');
insert into testDateTable values ('10001', to_date('2017-11-10'), 1, '1300', '13', '00', '1400', '14', '00');
insert into testDateTable values ('10001', to_date('2017-11-10'), 1, '1405', '14', '05', '1500', '15', '00');
insert into testDateTable values ('10001', to_date('2017-11-10'), 1, '1500', '15', '00', '1600', '16', '00');
insert into testDateTable values ('10001', to_date('2017-11-10'), 1, '1605', '16', '05', '1700', '17', '00');
insert into testDateTable values ('10002', to_date('2017-12-10'), 1, '1100', '11', '00', '1200', '12', '00');
insert into testDateTable values ('10002', to_date('2017-12-10'), 1, '1205', '12', '05', '1300', '13', '00');
insert into testDateTable values ('10002', to_date('2017-12-10'), 1, '1300', '13', '00', '1400', '14', '00');
insert into testDateTable values ('10002', to_date('2017-12-10'), 1, '1405', '14', '05', '1500', '15', '00');
insert into testDateTable values ('10002', to_date('2017-12-10'), 1, '1500', '15', '00', '1600', '16', '00');
insert into testDateTable values ('10002', to_date('2017-12-10'), 1, '1605', '16', '05', '1700', '17', '00');
insert into testDateTable values ('10002', to_date('2017-12-10'), 2, '1215', '12', '15', '1230', '12', '00');
insert into testDateTable values ('10002', to_date('2017-12-10'), 2, '1230', '12', '30', '1245', '12', '45');
insert into testDateTable values ('10002', to_date('2017-12-10'), 2, '1245', '12', '45', '1250', '12', '50');

select * from testDateTable
order by id, brdDate, div, s_datetime;



update testDateTable upt
set (
  e_datetime, e_hour, e_minute
) = (
  select pos_datetime, pos_hour, pos_minute
  from (
    select tdt.*
           , lead(s_datetime) over(partition by id, brdDate, div order by s_datetime) as pos_datetime
           , lead(s_hour) over(partition by id, brdDate, div order by s_datetime) as pos_hour
           , lead(s_minute) over(partition by id, brdDate, div order by s_datetime) as pos_minute
    from testDateTable tdt
  ) rft
  where upt.id = rft.id
  and upt.brddate = rft.brddate
  and upt.div = rft.div
  and upt.S_DATETIME = rft.S_DATETIME
  and upt.e_datetime <> rft.pos_datetime
)
where exists (
    select *
    from (
        select tdt.*
               , lead(s_datetime) over(partition by id, brdDate, div order by s_datetime) as pos_datetime
               , lead(s_hour) over(partition by id, brdDate, div order by s_datetime) as pos_hour
               , lead(s_minute) over(partition by id, brdDate, div order by s_datetime) as pos_minute
        from testDateTable tdt
    ) aaa
    where upt.id = aaa.id
    and upt.brddate = aaa.brddate
    and upt.div = aaa.div
    and upt.S_DATETIME = aaa.S_DATETIME
    and upt.e_datetime <> aaa.pos_datetime
)
;

rollback;