create table employees (
  emp_id char(3) not null,
  team_id integer not null,
  emp_name char(16) not null,
  team char(16) not null,
  primary key(emp_id, team_id)
);

INSERT INTO Employees VALUES('201',	1,	'Joe',	'商品企画');
INSERT INTO Employees VALUES('201',	2,	'Joe',	'開発');
INSERT INTO Employees VALUES('201',	3,	'Joe',	'営業');
INSERT INTO Employees VALUES('202',	2,	'Jim',	'開発');
INSERT INTO Employees VALUES('203',	3,	'Carl',	'営業');
INSERT INTO Employees VALUES('204',	1,	'Bree',	'商品企画');
INSERT INTO Employees VALUES('204',	2,	'Bree',	'開発');
INSERT INTO Employees VALUES('204',	3,	'Bree',	'営業');
INSERT INTO Employees VALUES('204',	4,	'Bree',	'管理');
INSERT INTO Employees VALUES('205',	1,	'Kim',	'商品企画');
INSERT INTO Employees VALUES('205',	2,	'Kim',	'開発');

--commit;

--リスト3.5 UNIONで条件分岐させたコード
set SERVEROUTPUT ON
set autotrace on explain
select emp_name
       , max(team) as team
from employees
group by emp_name
having count(*) = 1
union
select emp_name
       , '２つを兼務' as team
from employees
group by emp_name
having count(*) = 2
union
select emp_name
       , '３つ以上を兼務' as team
from employees
group by emp_name
having count(*) >= 3
;

--リスト3.6 SELECT句でCASE式を使う
set autotrace on explain
select emp_name
       , case when count(*) = 1 then max(team)
              when count(*) = 2 then '2つを兼務'
              when count(*) >= 3 then '3つ以上を兼務'
         end as team
from employees
group by emp_name
;
