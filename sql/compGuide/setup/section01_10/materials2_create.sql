create table materials2 (
  center varchar2(20),
  receive_date date,
  material varchar2(20),
  orgland varchar2(25),
  primary key(center, receive_date, material)
);

insert into materials2 values ('東京', '2007/04/01', '錫', 'チリ');
insert into materials2 values ('東京', '2007/04/12', '亜鉛', 'タイ');
insert into materials2 values ('東京', '2007/05/17', 'アルミニウム', 'ブラジル');
insert into materials2 values ('東京', '2007/05/20', '亜鉛', 'タイ');
insert into materials2 values ('大阪', '2007/04/20', '銅', 'オーストラリア');
insert into materials2 values ('大阪', '2007/04/22', 'ニッケル', '南アフリカ');
insert into materials2 values ('大阪', '2007/04/29', '鉛', 'インド');
insert into materials2 values ('名古屋', '2007/03/15', 'チタン', 'ボリビア');
insert into materials2 values ('名古屋', '2007/04/01', '炭素鋼', 'チリ');
insert into materials2 values ('名古屋', '2007/04/24', '炭素鋼', 'アルゼンチン');
insert into materials2 values ('名古屋', '2007/05/02', 'マグネシウム', 'チリ');
insert into materials2 values ('名古屋', '2007/05/10', 'チタン', 'タイ');
insert into materials2 values ('福岡', '2007/05/10', '亜鉛', 'アメリカ');
insert into materials2 values ('福岡', '2007/05/28', '錫', 'ロシア');

commit;
