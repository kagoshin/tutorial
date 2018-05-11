create table Population (
  prefecture varchar(32),
  sex char(1),
  pop integer,
  constraint pk_pop primary key(prefecture, sex)
);

insert into Population values('徳島', '1', 60);
insert into Population values('徳島', '2', 40);
INSERT INTO Population VALUES('香川', '1', 90);
INSERT INTO Population VALUES('香川', '2',100);
INSERT INTO Population VALUES('愛媛', '1',100);
INSERT INTO Population VALUES('愛媛', '2', 50);
INSERT INTO Population VALUES('高知', '1',100);
INSERT INTO Population VALUES('高知', '2',100);
INSERT INTO Population VALUES('福岡', '1', 20);
INSERT INTO Population VALUES('福岡', '2',200);

-- UNIONによる解
--set SERVEROUTPUT ON
--set autotrace on explain
select prefecture
       , sum(pop_men) as pop_men
       , sum(pop_wom) as pop_wom
from (
  select prefecture
         , pop as pop_men
         , null as pop_wom
  from Population
  where sex = '1' --男性
  union
  select prefecture
         , null as pop_men
         , pop as pop_wom
  from Population
  where sex = '2' --女性
)
group by prefecture
;

-- CASE式による解
set autotrace on explain
select prefecture
       , sum(case when sex = '1' then pop else 0 end) as pop_men
       , sum(case when sex = '2' then pop else 0 end) as pop_wom
from population
group by prefecture
;
