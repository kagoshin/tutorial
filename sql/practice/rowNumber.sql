-- https://www.shift-the-oracle.com/sql/functions/row_number-practice.html

 CREATE TABLE ROWNUM_TEST (
    CATEGORY                       NUMBER(3,0),
    NO                             NUMBER(3,0),
    NAME                           VARCHAR2(10)
 ) ;

insert into ROWNUM_TEST(category, no, name) values (111, 100, 'taro');
insert into ROWNUM_TEST(category, no, name) values (111, 101, 'ichiro');
insert into ROWNUM_TEST(category, no, name) values (111, 102, 'jiro');
insert into ROWNUM_TEST(category, no, name) values (111, 103, 'san');
insert into ROWNUM_TEST(category, no, name) values (111, 104, 'yon');
insert into ROWNUM_TEST(category, no, name) values (222, 105, 'go');
insert into ROWNUM_TEST(category, no, name) values (222, 106, 'roku');
insert into ROWNUM_TEST(category, no, name) values (222, 107, 'nana');
insert into ROWNUM_TEST(category, no, name) values (222, 108, 'hachi');
insert into ROWNUM_TEST(category, no, name) values (222, 109, 'kyuu');
insert into ROWNUM_TEST(category, no, name) values (333, 110, 'ju');
insert into ROWNUM_TEST(category, no, name) values (333, 200, 'aaa');
insert into ROWNUM_TEST(category, no, name) values (333, 201, 'ccc');
insert into ROWNUM_TEST(category, no, name) values (333, 202, 'bbb');
insert into ROWNUM_TEST(category, no, name) values (333, 300, 'vvv');
insert into ROWNUM_TEST(category, no, name) values (555, 301, 'xxx');
insert into ROWNUM_TEST(category, no, name) values (555, 302, 'www');
insert into ROWNUM_TEST(category, no, name) values (555, 500, 'hanako');
insert into ROWNUM_TEST(category, no, name) values (777, 501, 'hanao');
insert into ROWNUM_TEST(category, no, name) values (777, 502, 'hanata');

-- NO 列で並び替えた後の 中間順位 5〜10 番を取得する。
select no, name
from (
  select no,
         name,
         row_number() over (order by no) as rnum
  from ROWNUM_TEST
)
where rnum between 5 and 10;

-- CATEGORY で GROUP BY した各グループセットを
-- NO 列で並び替えた後で各カテゴリから 2〜3 番目を取得する。
--  (全カテゴリ数× 中間順位 2〜3 番を取得する)
select no,
       name
from (
  select no,
         name,
         row_number() over (partition by category order by no) as rnum
  from ROWNUM_TEST
)
where rnum between 2 and 3;
