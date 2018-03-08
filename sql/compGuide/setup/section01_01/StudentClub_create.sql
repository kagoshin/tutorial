create table StudentClub
(
  std_id number(3) ,
  club_id number(1),
  club_name varchar2(10) ,
  main_club_flg varchar2(1) ,
  primary key(std_id, club_id)
)

alter table StudentClub modify ( club_name varchar2(30) );

insert into StudentClub(std_id, club_id, club_name, main_club_flg)
      values (100, 1, '野球', 'Y');
insert into StudentClub(std_id, club_id, club_name, main_club_flg)
      values (100, 2, '吹奏楽', 'N');
insert into StudentClub(std_id, club_id, club_name, main_club_flg)
      values (200, 2, '吹奏楽', 'N');
insert into StudentClub(std_id, club_id, club_name, main_club_flg)
      values (200, 3, 'バドミントン', 'Y');
insert into StudentClub(std_id, club_id, club_name, main_club_flg)
      values (200, 4, 'サッカー', 'N');
insert into StudentClub(std_id, club_id, club_name, main_club_flg)
      values (300, 4, 'サッカー', 'N');
insert into StudentClub(std_id, club_id, club_name, main_club_flg)
      values (400, 5, '水泳', 'N');
insert into StudentClub(std_id, club_id, club_name, main_club_flg)
      values (500, 6, '囲碁', 'N');
