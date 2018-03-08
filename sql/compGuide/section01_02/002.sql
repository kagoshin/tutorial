delete from products2 p1
where rowid < (
  select max(p2.rowid)
  from products2 p2
  where p1.name = p2.name
  and p2.price = p2.price
);

delete from products2 p1
where exists (
  select name
  from products2 p2
  where p1.name = p2.name
  and p1.price = p2.price
  and p1.rowid < p2.rowid
);
