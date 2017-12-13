-- create user
-- https://www.shift-the-oracle.com/config/create-user.html
-- create table
-- http://oracle.se-free.com/ddl/A1_cre_tbl.html
-- データ型
-- http://www.mitene.or.jp/~rnk/TIPS_ORCL_TBLCREATE.htm
-- insert
-- https://www.shift-the-oracle.com/sql/insert.html

create table PopTbl(
  pref_name varchar2(10),
  population number(5)
)

insert into PopTbl(pref_name, population) values ('徳島', 100);
insert into PopTbl(pref_name, population) values ('香川', 200);
insert into PopTbl(pref_name, population) values ('愛媛', 150);
insert into PopTbl(pref_name, population) values ('高知', 200);
insert into PopTbl(pref_name, population) values ('福岡', 300);
insert into PopTbl(pref_name, population) values ('佐賀', 100);
insert into PopTbl(pref_name, population) values ('長崎', 200);
insert into PopTbl(pref_name, population) values ('東京', 400);
insert into PopTbl(pref_name, population) values ('群馬', 50);
