create table Products
(
  name varchar2(20) ,
  price number(5),
  primary key(name)
)

insert into Products(name, price) values('りんご', 100);
insert into Products(name, price) values('みかん', 50);
insert into Products(name, price) values('バナナ', 80);

create table Products2
(
  name varchar2(20) ,
  price number(5)
)

insert into Products2(name, price) values('りんご', 50);
insert into Products2(name, price) values('みかん', 100);
insert into Products2(name, price) values('みかん', 100);
insert into Products2(name, price) values('みかん', 100);
insert into Products2(name, price) values('バナナ', 80);

insert into Products(name, price) values('りんご', 50);
insert into Products(name, price) values('みかん', 100);
insert into Products(name, price) values('ぶどう', 50);
insert into Products(name, price) values('スイカ', 80);
insert into Products(name, price) values('レモン', 30);
insert into Products(name, price) values('いちご', 100);
insert into Products(name, price) values('バナナ', 100);
