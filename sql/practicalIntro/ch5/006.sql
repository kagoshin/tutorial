--リスト5.12 郵便番号の履歴テーブル2の定義
create table postalHistory2 (
  name char(1),
  pcode char(7),
  lft REAL not null,
  rgt REAL not null,
  constraint pk_name_pcode2 primary key(name, pcode),
  constraint uq_name_lft unique (name, lft),
  constraint uq_name_rgt unique (name, rgt),
  check(lft < rgt)
);

INSERT INTO PostalHistory2 VALUES ('A', '4130001', 0,   27);
INSERT INTO PostalHistory2 VALUES ('A', '4130002', 9,   18);
INSERT INTO PostalHistory2 VALUES ('A', '4130103', 12,  15);
INSERT INTO PostalHistory2 VALUES ('B', '4130041', 0,   27);
INSERT INTO PostalHistory2 VALUES ('C', '4103213', 0,   27);
INSERT INTO PostalHistory2 VALUES ('C', '4380824', 9,   18);

commit;

--リスト5.13 一番外側の円を求める
select name
       , pcode
from postalHistory2 ph1
where name = 'A'
and not exists (
  select *
  from postalHistory2 ph2
  where ph2.name = 'A'
  and ph1.lft > ph2.lft
)
;
