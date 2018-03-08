-- その１
select
  i02.item_no,
  sh.total_qty
from items02 i02
left outer join (
  select
    item_no,
    sum(quantity) as total_qty
  from SalesHistory
  group by item_no
) sh
on i02.item_no = sh.item_no
order by i02.item_no;

-- その２
select
  i02.item_no,
  sum(sh.quantity) as total_qty
from items02 i02
left outer join SalesHistory sh
on i02.item_no = sh.item_no
group by i02.item_no
order by i02.item_no;
