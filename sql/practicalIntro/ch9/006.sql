-- リスト9.19 Ordersテーブルの定義
create table Orders (
  order_id integer not null,
  order_shop varchar2(32) not null,
  order_name varchar2(32) not null,
  order_date date,
  primary key (order_id)
);

insert into orders values (10000, '東京', '後藤信二', '2011/8/22');
INSERT INTO Orders VALUES (10001, '埼玉', '佐原商店',   '2011/9/1');
INSERT INTO Orders VALUES (10002, '千葉', '水原陽子',   '2011/9/20');
INSERT INTO Orders VALUES (10003, '山形', '加地健太郎', '2011/8/5');
INSERT INTO Orders VALUES (10004, '青森', '相原酒店',   '2011/8/22');
INSERT INTO Orders VALUES (10005, '長野', '宮元雄介',   '2011/8/29');
commit;

-- リスト9.20 OrderReceiptsテーブルの定義
create table OrderReceipts (
  order_id integer not null,
  order_receipt_id integer not null,
  item_group varchar2(32) not null,
  delivery_date date not null,
  primary key (order_id, order_receipt_id)
);

insert into OrderReceipts values (10000, 1, '食器', '2011/8/24');
INSERT INTO OrderReceipts VALUES (10000, 2, '菓子詰め合わせ', '2011/8/25');
INSERT INTO OrderReceipts VALUES (10000, 3, '牛肉',           '2011/8/26');
INSERT INTO OrderReceipts VALUES (10001, 1, '魚介類',         '2011/9/4');
INSERT INTO OrderReceipts VALUES (10002, 1, '菓子詰め合わせ', '2011/9/22');
INSERT INTO OrderReceipts VALUES (10002, 2, '調味料セット',   '2011/9/22');
INSERT INTO OrderReceipts VALUES (10003, 1, '米',             '2011/8/6');
INSERT INTO OrderReceipts VALUES (10003, 2, '牛肉',           '2011/8/10');
INSERT INTO OrderReceipts VALUES (10003, 3, '食器',           '2011/8/10');
INSERT INTO OrderReceipts VALUES (10004, 1, '野菜',           '2011/8/23');
INSERT INTO OrderReceipts VALUES (10005, 1, '飲料水',         '2011/8/30');
INSERT INTO OrderReceipts VALUES (10005, 2, '菓子詰め合わせ', '2011/8/30');
commit;

-- リスト9.21 受付日と配送予定日の差分
select o.order_id
       , o.order_name
       , orc.delivery_date - o.order_date as diff_days
from orders o
join OrderReceipts orc
on o.order_id = orc.order_id
where orc.delivery_date - o.order_date >= 3
;

-- リスト9.22 注文単位の集約
select o.order_id
       , max(o.order_name)
       , max(orc.delivery_date - o.order_date) as max_diff_days
from orders o
join OrderReceipts orc
on o.order_id = orc.order_id
where orc.delivery_date - o.order_date >= 3
group by o.order_id
;

-- リスト9.23 集約関数を使う
select o.order_id
       , max(o.order_name) as order_name
       , max(o.order_date) as order_date
       , count(*) as item_count
from orders o
join OrderReceipts orc
on o.order_id = orc.order_id
group by o.order_id;

-- リスト9.24 ウィンドウ関数を使う
select o.order_id
       , o.order_name
       , o.order_date
       , count(*) over (partition by o.order_id) as item_count
from orders o
join OrderReceipts orc
on o.order_id = orc.order_id
;
