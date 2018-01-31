create table materials (
  center varchar2(20),
  receive_date date,
  material varchar2(20),
  primary key(center, receive_date)
);

insert into materials values ('東京', '2007/04/01', '錫');
insert into materials values ('東京', '2007/04/12', '亜鉛');
insert into materials values ('東京', '2007/05/17', 'アルミニウム');
insert into materials values ('東京', '2007/05/20', '亜鉛');
insert into materials values ('大阪', '2007/04/20', '銅');
insert into materials values ('大阪', '2007/04/20', 'ニッケル');
insert into materials values ('大阪', '2007/04/29', '鉛');
insert into materials values ('名古屋', '2007/03/15', 'チタン');
insert into materials values ('名古屋', '2007/04/01', '炭素鋼');
insert into materials values ('名古屋', '2007/04/24', '炭素鋼');
insert into materials values ('名古屋', '2007/05/02', 'マグネシウム');
insert into materials values ('名古屋', '2007/05/10', 'チタン');
insert into materials values ('福岡', '2007/05/10', '亜鉛');
insert into materials values ('福岡', '2007/05/28', '錫');

commit;