create table Items(
  item varchar2(20),
  primary key(item)
);

create table ShopItems(
  shop varchar2(20),
  item varchar2(20),
  primary key(shop, item)
);

insert into Items values('ビール');
insert into Items values('紙オムツ');
insert into Items values('自転車');

insert into ShopItems values('仙台', 'ビール');
insert into ShopItems values('仙台', '紙オムツ');
insert into ShopItems values('仙台', '自転車');
insert into ShopItems values('仙台', 'カーテン');
insert into ShopItems values('東京', 'ビール');
insert into ShopItems values('東京', '紙オムツ');
insert into ShopItems values('東京', '自転車');
insert into ShopItems values('大阪', 'テレビ');
insert into ShopItems values('大阪', '紙オムツ');
insert into ShopItems values('大阪', '自転車');
