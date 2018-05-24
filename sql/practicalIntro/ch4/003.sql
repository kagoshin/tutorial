--「図4.7::ホテルテーブルのサンプル」を作成
create table HotelRooms (
  room_nbr integer,
  start_date date,
  end_date date,
  primary key (room_nbr, start_date)
);

INSERT INTO HotelRooms VALUES(101,	'2008-02-01',	'2008-02-06');
INSERT INTO HotelRooms VALUES(101,	'2008-02-06',	'2008-02-08');
INSERT INTO HotelRooms VALUES(101,	'2008-02-10',	'2008-02-13');
INSERT INTO HotelRooms VALUES(202,	'2008-02-05',	'2008-02-08');
INSERT INTO HotelRooms VALUES(202,	'2008-02-08',	'2008-02-11');
INSERT INTO HotelRooms VALUES(202,	'2008-02-11',	'2008-02-12');
INSERT INTO HotelRooms VALUES(303,	'2008-02-03',	'2008-02-17');
commit;

--リスト4.7 複数レコードから稼働日数を算出する
select room_nbr
       , sum(end_date - start_date) as working_days
from HotelRooms
group by room_nbr
having sum(end_date - start_date) >= 10
;
