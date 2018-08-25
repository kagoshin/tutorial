--リスト9.1 OmitTblテーブルの定義
create table OmitTbl (
  keycol char(8) not null,
  seq integer not null,
  val integer,
  constraint pk_omittbl primary key (keycol, seq)
)
;

insert into OmitTbl values ('A', 1, 50);
INSERT INTO OmitTbl VALUES ('A', 2, NULL);
INSERT INTO OmitTbl VALUES ('A', 3, NULL);
INSERT INTO OmitTbl VALUES ('A', 4, 70);
INSERT INTO OmitTbl VALUES ('A', 5, NULL);
INSERT INTO OmitTbl VALUES ('A', 6, 900);
INSERT INTO OmitTbl VALUES ('B', 1, 10);
INSERT INTO OmitTbl VALUES ('B', 2, 20);
INSERT INTO OmitTbl VALUES ('B', 3, NULL);
INSERT INTO OmitTbl VALUES ('B', 4, 3);
INSERT INTO OmitTbl VALUES ('B', 5, NULL);
INSERT INTO OmitTbl VALUES ('B', 6, NULL);
commit;

--リスト9.2 OmitTblのUPDATE文
update omittbl
set val = (
  select val
  from omittbl o1
  where o1.keycol = omittbl.keycol
  and o1.seq = (
    select max(seq)
    from omittbl o2
    where o2.keycol = omittbl.keycol
    and o2.seq < omittbl.seq
    and o2.val is not null
  )
)
where val is null
;

--rollback;
--commit;

--リスト9.3 埋め立ての逆演算SQL（UPDATE文）
update omittbl
set val = case when val = (
                      select val
                      from omittbl o1
                      where o1.keycol = omittbl.keycol
                      and o1.seq = (
                        select max(seq)
                        from omittbl o2
                        where o2.keycol = omittbl.keycol
                        and o2.seq < omittbl.seq
                      )
                    )
               then null else val end
;

-- commit;
