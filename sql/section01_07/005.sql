--重複行を削除する高速なクエリ１：補集合をEXCEPTで求める
delete from Products2
where rowid in (
  select rowid from products2       -- 全体のrowid
  minus                             -- 引く
  select max(rowid) from products2  -- 残すべきrowid
  group by name, price
);

--重複行を削除する高速なクエリ２：補集合をNOT INで求める
delete from Products2
where rowid not in (
  select max(rowid) from products2
  group by name, price
);
