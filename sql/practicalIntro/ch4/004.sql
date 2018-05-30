--「図4.8::人物テーブルのサンプル」を作成
create table Persons (
  name varchar(8) not null,
  age integer not null,
  height float not null,
  weight float not null,
  primary key(name)
);

INSERT INTO Persons VALUES('Anderson',  30,  188,  90);
INSERT INTO Persons VALUES('Adela',    21,  167,  55);
INSERT INTO Persons VALUES('Bates',    87,  158,  48);
INSERT INTO Persons VALUES('Becky',    54,  187,  70);
INSERT INTO Persons VALUES('Bill',    39,  177,  120);
INSERT INTO Persons VALUES('Chris',    90,  175,  48);
INSERT INTO Persons VALUES('Darwin',  12,  160,  55);
INSERT INTO Persons VALUES('Dawson',  25,  182,  90);
INSERT INTO Persons VALUES('Donald',  30,  176,  53);

--commit;

--リスト4.8 頭文字のアルファベットごとに何人がテーブルに存在するか集計するSQL
select substr(name, 1, 1) as label
       , count(*)
from Persons
group by substr(name, 1, 1)
;

--リスト4.9 年齢による区分を実施
--set autotrace on explain
select case when age < 20 then '子ども'
            when age between 20 and 69 then '成人'
            when age >= 70 then '老人'
       else null end as age_class
       , count(*)
from Persons
group by case when age < 20 then '子ども'
         when age between 20 and 69 then '成人'
         when age >= 70 then '老人'
         else null end
;

--リスト4.10 BMIによる体重分類を求めるクエリ
--set autotrace on explain
select case when weight / power(height / 100, 2) < 18.5 then 'やせ'
            when 18.5 <= weight / power(height / 100, 2)
                 and weight / power(height / 100, 2) < 25 then '標準'
            when 25 <= weight / power(height / 100, 2) then '肥満'
            else null end as BMI
       , count(*)
from Persons
group by case when weight / power(height / 100, 2) < 18.5 then 'やせ'
              when 18.5 <= weight / power(height / 100, 2)
                   and weight / power(height / 100, 2) < 25 then '標準'
              when 25 <= weight / power(height / 100, 2) then '肥満'
              else null end
;

--リスト4.11 PARTITION BYに式を入れてみる
select name
       , age
       , case when age < 20 then '子ども'
              when age between 20 and 69 then '成人'
              when age >= 70 then '老人'
         else null end as age_class
       , rank() over(partition by case when age < 20 then '子ども'
                                       when age between 20 and 69 then '成人'
                                       when age >= 70 then '老人'
                                       else null end
                     order by age) as age_rank_in_class
from Persons
order by age_class, age_rank_in_class
;
