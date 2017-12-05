-- https://www.shift-the-oracle.com/sql/functions/row_number-practice.html

 CREATE TABLE ROWNUM_TEST_02 (
    USER_ID                       VARCHAR(10),
    USER_NAME                     VARCHAR(20),
    CREATED_ON                    DATE,
    primary key(USER_ID)
 ) ;

insert into ROWNUM_TEST_02(USER_ID, USER_NAME, CREATED_ON) values ('102', '緒方 辰夫', to_date('2005/01/28'));
insert into ROWNUM_TEST_02(USER_ID, USER_NAME, CREATED_ON) values ('157', '大久保 未来', to_date('2005/01/29'));
insert into ROWNUM_TEST_02(USER_ID, USER_NAME, CREATED_ON) values ('112', '鈴木 有里', to_date('2005/01/29'));
insert into ROWNUM_TEST_02(USER_ID, USER_NAME, CREATED_ON) values ('153', '大坪 暢子', to_date('2005/01/29'));
insert into ROWNUM_TEST_02(USER_ID, USER_NAME, CREATED_ON) values ('170', '三好 隆史', to_date('2005/01/29'));
insert into ROWNUM_TEST_02(USER_ID, USER_NAME, CREATED_ON) values ('120', '江藤 洋匡', to_date('2005/02/01'));
insert into ROWNUM_TEST_02(USER_ID, USER_NAME, CREATED_ON) values ('152', '堀内 空', to_date('2005/02/03'));
insert into ROWNUM_TEST_02(USER_ID, USER_NAME, CREATED_ON) values ('130', '氏家 東生', to_date('2005/02/07'));
insert into ROWNUM_TEST_02(USER_ID, USER_NAME, CREATED_ON) values ('122', '植木 虎之助', to_date('2005/02/08'));
insert into ROWNUM_TEST_02(USER_ID, USER_NAME, CREATED_ON) values ('190', '小林 遥', to_date('2005/02/08'));
insert into ROWNUM_TEST_02(USER_ID, USER_NAME, CREATED_ON) values ('171', '川端 若菜', to_date('2005/02/13'));

-- 決定的になる例　(作成日付昇順,ユーザーID昇順に 3件づつ取り出す場合)
select USER_ID, USER_NAME, CREATED_ON, LINE_NO
from (
  select USER_ID,
         USER_NAME,
         CREATED_ON,
         -- レコードを一意に決定できない
         -- row_number() over (order by CREATED_ON) as LINE_NO
        　row_number() over (order by CREATED_ON, USER_ID) as LINE_NO
  from ROWNUM_TEST_02
)
where LINE_NO >= 4
and LINE_NO < 7
order by CREATED_ON, USER_ID;
