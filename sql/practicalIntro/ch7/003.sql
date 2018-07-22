--リスト7.7 会社テーブルの定義
create table companies (
  co_cd char(3) not null,
  district char(3) not null,
  constraint pk_companies primary key (co_cd)
);

insert into companies values ('001', 'A');
INSERT INTO Companies VALUES('002',	'B');
INSERT INTO Companies VALUES('003',	'C');
INSERT INTO Companies VALUES('004',	'D');

--リスト7.8 事業所テーブルの定義
create table Shops (
  co_cd char(3) not null,
  shop_id char(3) not null,
  emp_nbr integer not null,
  main_flg char(1) not null,
  primary key (co_cd, shop_id)
);

insert into shops values('001', '1', 300, 'Y');
INSERT INTO Shops VALUES('001',	'2',   400,  'N');
INSERT INTO Shops VALUES('001',	'3',   250,  'Y');
INSERT INTO Shops VALUES('002',	'1',   100,  'Y');
INSERT INTO Shops VALUES('002',	'2',    20,  'N');
INSERT INTO Shops VALUES('003',	'1',   400,  'Y');
INSERT INTO Shops VALUES('003',	'2',   500,  'Y');
INSERT INTO Shops VALUES('003',	'3',   300,  'N');
INSERT INTO Shops VALUES('003',	'4',   200,  'Y');
INSERT INTO Shops VALUES('004',	'1',   999,  'Y');

--commit;

--リスト7.9 解1：結合を先に行う
set autotrace on explain
select c.co_cd
       , c.district
       , sum(emp_nbr) sum_emp
from companies c
join shops s
on c.co_cd = s.co_cd
where main_flg = 'Y'
group by c.co_cd
         , c.district
order by c.co_cd
;

--リスト7.10 解2：集約を先に行う
set autotrace on explain
select c.co_cd
       , c.district
       , sum_emp
from companies c
join (
  select co_cd
         , sum(emp_nbr) as sum_emp
  from Shops
  where main_flg = 'Y'
  group by co_cd
) csum
on c.co_cd = csum.co_cd
order by c.co_cd
;
