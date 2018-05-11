--「図3.16::ThreeElementsテーブルのサンプル」を作成
create table ThreeElements (
  key char(8),
  name varchar(32),
  date_1 date,
  flg_1 char(1),
  date_2 date,
  flg_2 char(1),
  date_3 date,
  flg_3 char(1),
  primary key(key)
);

INSERT INTO ThreeElements VALUES ('1', 'a', '2013-11-01', 'T', NULL, NULL, NULL, NULL);
INSERT INTO ThreeElements VALUES ('2', 'b', NULL, NULL, '2013-11-01', 'T', NULL, NULL);
INSERT INTO ThreeElements VALUES ('3', 'c', NULL, NULL, '2013-11-01', 'F', NULL, NULL);
INSERT INTO ThreeElements VALUES ('4', 'd', NULL, NULL, '2013-12-30', 'T', NULL, NULL);
INSERT INTO ThreeElements VALUES ('5', 'e', NULL, NULL, NULL, NULL, '2013-11-01', 'T');
INSERT INTO ThreeElements VALUES ('6', 'f', NULL, NULL, NULL, NULL, '2013-12-01', 'F');

commit;

create index idx_1 on ThreeElements (date_1, flg_1);
create index idx_2 on ThreeElements (date_2, flg_2);
create index idx_3 on ThreeElements (date_3, flg_3);

--リスト3.8 UNIONによる解
set autotrace on explain
select key
       , name
       , date_1
       , flg_1
       , date_2
       , flg_2
       , date_3
       , flg_3
from ThreeElements
where date_1 = '2013-11-01'
and flg_1 = 'T'
union
select key
       , name
       , date_1
       , flg_1
       , date_2
       , flg_2
       , date_3
       , flg_3
from ThreeElements
where date_2 = '2013-11-01'
and flg_2 = 'T'
union
select key
       , name
       , date_1
       , flg_1
       , date_2
       , flg_2
       , date_3
       , flg_3
from ThreeElements
where date_3 = '2013-11-01'
and flg_3 = 'T'
;

--リスト3.9 ORによる解
set autotrace on explain
select key
       , name
       , date_1
       , flg_1
       , date_2
       , flg_2
       , date_3
       , flg_3
from ThreeElements
where (date_1 = '2013-11-01' and flg_1 = 'T')
or (date_2 = '2013-11-01' and flg_2 = 'T')
or (date_3 = '2013-11-01' and flg_3 = 'T')
;

--リスト3.10 INによる解
set autotrace on explain
select key
       , name
       , date_1
       , flg_1
       , date_2
       , flg_2
       , date_3
       , flg_3
from ThreeElements
where ('2013-11-01', 'T')
      in ((date_1, flg_1),
          (date_2, flg_2),
          (date_3, flg_3))
;

--リスト3.11 CASE式による解
set autotrace on explain
select key
       , date_1
       , flg_1
       , date_2
       , flg_2
       , date_3
       , flg_3
from ThreeElements
where case when date_1 = '2013-11-01' then flg_1
           when date_2 = '2013-11-01' then flg_2
           when date_3 = '2013-11-01' then flg_3
      else null end = 'T'
;
