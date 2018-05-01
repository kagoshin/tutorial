-- 図3.1::商品テーブルのサンプル」を作成
create table items (
  item_id integer not null,
  year integer not null,
  item_name char(32) not null,
  price_tax_ex integer not null,
  price_tax_in integer not null,
  primary key(item_id, year)
);

insert into items values(100, 2000, 'カップ', 500, 525);
INSERT INTO Items VALUES(100,	2001,	'カップ'	,520,	546);
INSERT INTO Items VALUES(100,	2002,	'カップ'	,600,	630);
INSERT INTO Items VALUES(100,	2003,	'カップ'	,600,	630);
INSERT INTO Items VALUES(101,	2000,	'スプーン'	,500,	525);
INSERT INTO Items VALUES(101,	2001,	'スプーン'	,500,	525);
INSERT INTO Items VALUES(101,	2002,	'スプーン'	,500,	525);
INSERT INTO Items VALUES(101,	2003,	'スプーン'	,500,	525);
INSERT INTO Items VALUES(102,	2000,	'ナイフ'	,600,	630);
INSERT INTO Items VALUES(102,	2001,	'ナイフ'	,550,	577);
INSERT INTO Items VALUES(102,	2002,	'ナイフ'	,550,	577);
INSERT INTO Items VALUES(102,	2003,	'ナイフ'	,400,	420);

commit;

--set SERVEROUTPUT ON
--set autotrace on explain
set autotrace traceonly
select item_name, year, price_tax_ex as price
from items
where year <= 2001
union all
select item_name, year, price_tax_in as price
from items
where year >= 2002
--order by ITEM_NAME, year
;

set autotrace on explain
select item_name
       , year
       , case when year <= 2001 then price_tax_ex
              when year >= 2002 then price_tax_in
              end as price
from items
;
