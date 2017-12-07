create table Addresses
(
  name varchar2(20) ,
  family_id number(3),
  address varchar2(60) ,
  primary key(name)
)

insert into Addresses(name, family_id, address)
   values('前田義明', 100, '東京都港区虎ノ門3-2-29');
insert into Addresses(name, family_id, address)
   values('前田由美', 100, '東京都港区虎ノ門3-2-92');
insert into Addresses(name, family_id, address)
   values('加藤茶', 200, '東京都新宿区西新宿2-8-1');
insert into Addresses(name, family_id, address)
   values('加藤勝', 200, '東京都新宿区西新宿2-8-1');
insert into Addresses(name, family_id, address)
   values('ホームズ', 300, 'ベーカー街221B');
insert into Addresses(name, family_id, address)
   values('ワトソン', 400, 'ベーカー街221B');
