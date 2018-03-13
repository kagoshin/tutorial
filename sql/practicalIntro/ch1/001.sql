--テーブルフルスキャン
set autotrace on
SELECT * FROM Shops;

--インデックススキャン
set autotrace on
SELECT *
  FROM Shops
  WHERE shop_id = '00050';

--結合
set autotrace on
select *
from shops s
inner join RESERVATIONS r
on s.shop_id = r.shop_id;

--統計情報収集サンプル（Oracle）
exec DBMS_STATS.GATHER_TABLE_STATS(OWNNAME =>'practical_intro', TABNAME =>'Shops');
exec DBMS_STATS.GATHER_TABLE_STATS(OWNNAME =>'<スキーマ名>', TABNAME =>'Reservations');
