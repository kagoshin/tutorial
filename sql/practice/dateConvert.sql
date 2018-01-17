select * from v$nls_parameters
where PARAMETER = 'NLS_DATE_FORMAT';

-- RR-MM-DD
alter session set nls_date_format = 'RR-MM-DD';
-- yyyy-mm-dd
alter session set nls_date_format = 'yyyy-mm-dd';
-- YYYYMMDD
alter session set nls_date_format = 'YYYYMMDD';
-- yyyy-mm-dd hh24:mi:ss
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';

create table dateTest (
    id number(1),
    hiduke date
);

truncate table dateTest;

insert into dateTest values (1, '18-01-01');
insert into dateTest values (2, '20180102');
insert into dateTest values (3, '2018-01-03');
insert into dateTest values (4, '2018-01-04');
insert into dateTest values (5, '2018-01-05');

update dateTest set hiduke = '2018-01-05' where id = 1;
update dateTest set hiduke = '2018/01/05' where id = 2;

commit;

select * from dateTest;