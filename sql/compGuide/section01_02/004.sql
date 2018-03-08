select distinct p1.name, p1.price
from products p1, products p2
where p1.price = p2.price
and p1.name <> p2.name;
