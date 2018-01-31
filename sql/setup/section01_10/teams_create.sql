create table teams (
  member varchar2(20) primary key,
  team_id number(3),
  status varchar2(10)
);

insert into teams values('ジョー', 1, '待機');
insert into teams values('ケン', 1, '出動中');
insert into teams values('ミック', 1, '待機');
insert into teams values('カレン', 2, '出動中');
insert into teams values('キース', 2, '休暇');
insert into teams values('ジャン', 3, '待機');
insert into teams values('ハート', 3, '待機');
insert into teams values('ディック', 3, '待機');
insert into teams values('ベス', 4, '待機');
insert into teams values('アレン', 5, '出動中');
insert into teams values('ロバート', 5, '休暇');
insert into teams values('ケーガン', 5, '待機');

commit;
