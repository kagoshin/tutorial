select name,
       price,
       rank() over(order by price desc) as rank_1,
       dense_rank() over(order by price desc) as rank_2
from products;

select p1.name,
       p1.price,
       (
        select count(p2.price)
        --select count(distinct p2.price) --dense_rank()相当
        from products p2
        where p2.price > p1.price
       ) + 1 as rank_1
from products p1
order by rank_1;
