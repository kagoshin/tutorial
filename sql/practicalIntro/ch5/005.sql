--リスト5.9 郵便番号の履歴テーブルの定義
create table PostalHistory (
  name char(1),
  pcode char(7),
  new_pcode char(7),
  constraint pk_name_pcode primary key(name, pcode)
);

insert into PostalHistory values ('A', '4130001', '4130002');
INSERT INTO PostalHistory VALUES ('A', '4130002', '4130103');
INSERT INTO PostalHistory VALUES ('A', '4130103', NULL     );
INSERT INTO PostalHistory VALUES ('B', '4130041', NULL     );
INSERT INTO PostalHistory VALUES ('C', '4103213', '4380824');
INSERT INTO PostalHistory VALUES ('C', '4380824', NULL     );
--commit;

--リスト5.11 一番古い住所を検索する（Oracle版）
set autotrace on explain
with explosion (name, pcode, new_pcode, depth)
as (
  select name
         , pcode
         , new_pcode
         , 1
  from PostalHistory
  where name = 'A'
  and new_pcode is null -- 探索の開始点
  union all
  select child.name
         , child.pcode
         , child.new_pcode
         , depth + 1
  from explosion parent
       , PostalHistory child
  where parent.pcode = child.new_pcode
  and parent.name = child.name
)
-- メインのSELECT文
select name
       , pcode
       , new_pcode
from explosion
where depth = (select max(depth)
               from explosion)
;
