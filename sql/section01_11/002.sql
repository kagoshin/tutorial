select i.item_no
from items02 i
inner join saleshistory sh
on i.item_no = sh.item_no;

-- distinctで重複排除
select distinct i.item_no
from items02 i
inner join saleshistory sh
on i.item_no = sh.item_no;

-- exists
select i.item_no
from items02 i
where exists (
  select * from saleshistory sh
  where i.item_no = sh.item_no
);
