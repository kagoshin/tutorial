-- 重複順列
select p1.name as name_1,
       p2.name as name_2
from products p1, products p2;

-- 順列
select p1.name as name_1,
       p2.name as name_2
from products p1, products p2
where p1.name <> p2.name;

-- 組み合わせ
select p1.name as name_1,
       p2.name as name_2
from products p1, products p2
where p1.name > p2.name;

-- 組み合わせ：3列
select p1.name as name_1,
       p2.name as name_2,
       p3.name as name_3
from products p1, products p2, products p3
where p1.name > p2.name
and p2.name > p3.name;
