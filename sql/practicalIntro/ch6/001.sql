--リスト6.1::クロス結合を行うサンプルテーブル」を作成
create table employees_02 (
  emp_id char(8),
  emp_name varchar(32),
  dept_id char(2),
  constraint pk_emp primary key(emp_id)
);

create table departments (
  dept_id char(2),
  dept_name varchar(32),
  constraint pk_dep primary key(dept_id)
);

create index idx_dept_id on employees_02(dept_id);

INSERT INTO Employees VALUES('001',	'石田',	  '10');
INSERT INTO Employees VALUES('002',	'小笠原', '11');
INSERT INTO Employees VALUES('003',	'夏目',	  '11');
INSERT INTO Employees VALUES('004',	'米田',	  '12');
INSERT INTO Employees VALUES('005',	'釜本',	  '12');
INSERT INTO Employees VALUES('006',	'岩瀬',	  '12');

INSERT INTO Departments VALUES('10',	'総務');
INSERT INTO Departments VALUES('11',	'人事');
INSERT INTO Departments VALUES('12',	'開発');
INSERT INTO Departments VALUES('13',	'営業');

--commit;

--リスト6.2 クロス結合
select *
from employees_02
cross join departments
;

--リスト6.4 内部結合を実行
select e.emp_id
       , e.emp_name
       , e.dept_id
       , d.dept_name
from employees_02 e
join departments d
on e.dept_id = d.dept_id
;

--リスト6.5 リスト6.4を相関サブクエリで書き換えた例
select e.emp_id
       , e.emp_name
       , e.dept_id
       , (select d.dept_name
          from departments d
          where e.dept_id = d.dept_id
         ) as dept_name
from employees_02 e
;

--リスト6.6 左外部結合と右外部結合
--左外部結合の場合（左のテーブルがマスタ）
select e.emp_id
       , e.emp_name
       , e.dept_id
       , d.dept_name
from departments d
left outer join employees_02 e
on d.dept_id = e.dept_id
;

--右外部結合の場合（右のテーブルがマスタ）
select e.emp_id
       , e.emp_name
       , e.dept_id
       , d.dept_name
from employees_02 e
right outer join departments d
on e.dept_id = d.dept_id
;

--「図6.5::自己結合を解説するための数字テーブル」を作成
CREATE TABLE Digits
(digit INTEGER PRIMARY KEY);

INSERT INTO Digits VALUES(0);
INSERT INTO Digits VALUES(1);
INSERT INTO Digits VALUES(2);
INSERT INTO Digits VALUES(3);
INSERT INTO Digits VALUES(4);
INSERT INTO Digits VALUES(5);
INSERT INTO Digits VALUES(6);
INSERT INTO Digits VALUES(7);
INSERT INTO Digits VALUES(8);
INSERT INTO Digits VALUES(9);
--commit;

--リスト6.7 自己結合＋クロス結合
select d1.digit + (d2.digit * 10) as seq
from digits d1
cross join digits d2
;
