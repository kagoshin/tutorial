-- 列から行への変換：union allの使用
select employee, child_1 as child from personnel02
union all
select employee, child_2 as child from personnel02
union all
select employee, child_3 as child from personnel02
order by employee;

select employee, child_1 as child from personnel02 where CHILD_1 is not null
union all
select employee, child_2 as child from personnel02 where CHILD_2 is not null
union all
select employee, child_3 as child from personnel02 where CHILD_3 is not null
order by employee;


-- unpivot
select employee, child
from personnel02
unpivot(
  child for cols in (child_1, child_2, child_3)
)
order by employee;


-- 行から列への変換
--社員の子供リストを得るSQL（子供のいない社員も出力する）
create view children(child)
as
select child_1 from personnel02
union
select child_2 from personnel02
union
select child_3 from personnel02;

select emp.employee, children.child
from personnel02 emp
left outer join children
on children.child in (emp.child_1, emp.child_2, emp.child_3);

select emp.employee, count(children.child) as child_cnt
from personnel02 emp
left outer join children
on children.child in (emp.child_1, emp.child_2, emp.child_3)
group by emp.employee;
