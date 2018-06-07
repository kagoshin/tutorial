--リスト5.5 郵便番号テーブルの定義
create table PostalCode (
  pcode char(7),
  district_name varchar2(256),
  constraint pk_pcode primary key(pcode)
)
;

INSERT INTO PostalCode VALUES ('4130001',  '静岡県熱海市泉');
INSERT INTO PostalCode VALUES ('4130002',  '静岡県熱海市伊豆山');
INSERT INTO PostalCode VALUES ('4130103',  '静岡県熱海市網代');
INSERT INTO PostalCode VALUES ('4130041',  '静岡県熱海市青葉町');
INSERT INTO PostalCode VALUES ('4103213',  '静岡県伊豆市青羽根');
INSERT INTO PostalCode VALUES ('4380824',  '静岡県磐田市赤池');

--commit;

--リスト5.6 郵便番号のランキングを求めるクエリ
--set autotrace on explain
select pcode
       , district_name
       , case when pcode = '413033' then 0
              when pcode like '413003%' then 1
              when pcode like '41300%'  then 2
              when pcode like '4130%'   then 3
              when pcode like '413%'    then 4
              when pcode like '41%'     then 5
              when pcode like '4%'      then 6
              else null end as rank
from PostalCode
;


--リスト5.7 最寄の郵便番号を求めるクエリ
--set autotrace on explain
select pcode
       , district_name
from PostalCode
where case when pcode = '4130033' then 0
           when pcode like '413003%' then 1
           when pcode like '41300%'  then 2
           when pcode like '4130%'   then 3
           when pcode like '413%'    then 4
           when pcode like '41%'     then 5
           when pcode like '4%'      then 6
           else null end =
            (select min(case when pcode = '4130033' then 0
                             when pcode like '413003%' then 1
                             when pcode like '41300%'  then 2
                             when pcode like '4130%'   then 3
                             when pcode like '413%'    then 4
                             when pcode like '41%'     then 5
                             when pcode like '4%'      then 6
                             else null end)
             from PostalCode);

--リスト5.8 ウィンドウ関数による解
--set autotrace on explain
select pcode
       , district_name
from (
  select pcode
         , district_name
         , case when pcode = '4130033' then 0
                when pcode like '413003%' then 1
                when pcode like '41300%'  then 2
                when pcode like '4130%'   then 3
                when pcode like '413%'    then 4
                when pcode like '41%'     then 5
                when pcode like '4%'      then 6
                else null end as hit_code
         , min(case when pcode = '4130033' then 0
                    when pcode like '413003%' then 1
                    when pcode like '41300%'  then 2
                    when pcode like '4130%'   then 3
                    when pcode like '413%'    then 4
                    when pcode like '41%'     then 5
                    when pcode like '4%'      then 6
                    else null end)
           over ( order by case when pcode = '4130033' then 0
                                when pcode like '413003%' then 1
                                when pcode like '41300%'  then 2
                                when pcode like '4130%'   then 3
                                when pcode like '413%'    then 4
                                when pcode like '41%'     then 5
                                when pcode like '4%'      then 6
                                else null end
           ) as min_code
    from POSTALCODE
) Foo
where hit_code = min_code
;
