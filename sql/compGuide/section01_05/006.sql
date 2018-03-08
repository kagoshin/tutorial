-- 外部結合で差集合を求める：A-B
select a.id as id, a.name as name
from Class_A02 a
left outer join Class_B02 b
on a.id = b.id
where b.name is null;

-- oracle(A-B)
-- http://www.sql-reference.com/select/except_minus.html
select id, name from Class_A02
minus
select id, name from Class_B02;


-- 外部結合で差集合を求める：B-A
select b.id as id, b.name as name
from Class_A02 a
right outer join Class_B02 b
on a.id = b.id
where a.name is null;

-- oracle(B-A)
select id, name from Class_B02
minus
select id, name from Class_A02;
