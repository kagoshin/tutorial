/*
https://www.shift-the-oracle.com/sql/aggregate-functions/listagg.html
*/
create table listagg_sample (
  name varchar2(20) primary key,
  dept varchar2(20),
  salary number(10)
)
;

insert into listagg_sample values('すずき', '管理部', 300000);
insert into listagg_sample values('たかはし', '管理部', 400000);
insert into listagg_sample values('さとう', '開発部', 500000);
insert into listagg_sample values('こばやし', '開発部', 500000);
insert into listagg_sample values('やまもと', '開発部', 200000);
insert into listagg_sample values('あおき', '開発部', null);

--commit;

select listagg(name) within group(order by null) concat_name
from listagg_sample
;

select dept
       , listagg(name, ',') within group (order by salary desc nulls last) csv_name
from listagg_sample
group by dept
;

select listagg(name, ',') within group (order by name) csv_name
      , listagg(salary, ',') within group (order by name) csv_salary
from listagg_sample
;

select listagg(name, ',') within group (order by name) csv_name
       , rtrim(
         listagg(salary || ',') within group (order by name)
         , ','
       )
from listagg_sample
;
