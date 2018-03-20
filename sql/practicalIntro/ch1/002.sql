create table address (
  name varchar2(32) not null,
  phone_nbr varchar2(32),
  address varchar2(32) not null,
  sex char(4) not null,
  age integer not null,
  primary key(name)
);

INSERT INTO Address VALUES('小川',	'080-3333-XXXX',	'東京都',	'男',	30);
INSERT INTO Address VALUES('前田',	'090-0000-XXXX',	'東京都',	'女',	21);
INSERT INTO Address VALUES('森',	'090-2984-XXXX',	'東京都',	'男',	45);
INSERT INTO Address VALUES('林',	'080-3333-XXXX',	'福島県',	'男',	32);
INSERT INTO Address VALUES('井上',	NULL,	            	'福島県',	'女',	55);
INSERT INTO Address VALUES('佐々木',	'080-5848-XXXX',	'千葉県',	'女',	19);
INSERT INTO Address VALUES('松本',	NULL,	            	'千葉県',	'女',	20);
INSERT INTO Address VALUES('佐藤',	'090-1922-XXXX',	'三重県',	'女',	25);
INSERT INTO Address VALUES('鈴木',	'090-0001-XXXX',	'和歌山県',	'男',	32);
commit;

select name, phone_nbr, address, sex, age
from Address;

select name, address
from address
where address = '千葉県';

select name, age
from address
where age >= 30;

select name, address
from address
where address <> '東京都';

select name, address, age
from address
where address = '東京都'
and age >= 30;

select name, address, age
from Address
where address = '東京都'
or age >= 30;

select name, address, age
from address
where address = '東京都'
or address = '福島県'
or address = '千葉県';

select name, address, age
from address
where address in ('東京都', '福島県', '千葉県');

select name, phone_nbr
from address
where phone_nbr is null;

select sex, count(*)
from address
group by sex;

select address, count(*)
from Address
group by address;

select count(*)
from address
group by ( );

select address, count(*)
from address
group by address
having count(*) = 1;

select name, phone_nbr, address, sex, age
from address
order by age desc;

-- ビューの作成
create view CountAddress (v_address, cnt)
as
select address, count(*)
from Address
group by address;

-- ビューの使用
select v_address, cnt
from CountAddress;

create table Address2 (
  name varchar2(32) not null,
  phone_nbr varchar2(32),
  address varchar2(32) not null,
  sex char(4) not null,
  age integer not null,
  primary key (name)
);

INSERT INTO Address2 VALUES('小川',	'080-3333-XXXX',	'東京都',	'男',	30);
INSERT INTO Address2 VALUES('林',	'080-3333-XXXX',	'福島県',	'男',	32);
INSERT INTO Address2 VALUES('武田',	NULL,			'福島県',	'男',	18);
INSERT INTO Address2 VALUES('斉藤',	'080-2367-XXXX',	'千葉県',	'女',	19);
INSERT INTO Address2 VALUES('上野',	NULL,			'千葉県',	'女',	20);
INSERT INTO Address2 VALUES('広田',	'090-0205-XXXX',	'三重県',	'男',	25);

select name
from address
where name in (
  select name
  from address2
)
;

select name
       , address
       , case when address = '東京都' then '関東'
              when address = '千葉県' then '関東'
              when address = '福島県' then '東北'
              when address = '三重県' then '中部'
              when address = '和歌山県' then '関西'
         else null end as district
from address;

select *
from address
union
select *
from address2;
