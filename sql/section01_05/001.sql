--クロス表を求める水平展開その1：外部結合の利用
select
  c0.name,
  case when c1.name is not null then '○' else null end as "SQL入門",
  case when c2.name is not null then '○' else null end as "UNIX基礎",
  case when c3.name is not null then '○' else null end as "JAVA中級"
from (
  select distinct name from course
) c0
left outer join (
  select name from course where course = 'SQL入門'
) c1
on c0.name = c1.name
left outer join (
  select name from course where course = 'UNIX基礎'
) c2
on c0.name = c2.name
left outer join (
  select name from course where course = 'JAVA中級'
) c3
on c0.name = c3.name;


--クロス表を求める水平展開その2：スカラ・サブクエリの利用
select
  c0.name,
  (select '○' from course c1
    where course = 'SQL入門' and c0.name = c1.name ) as "SQL入門",
  (select '○' from course c2
    where course = 'UNIX基礎' and c0.name = c2.name ) as "UNIX基礎",
  (select '○' from course c3
    where course = 'JAVA中級' and c0.name = c3.name ) as "JAVA中級"
from (
  select distinct name from course
) c0;


--クロス表を求める水平展開その2：case式を入れ子にする
select
  name,
  case when sum(
    case when course = 'SQL入門' then 1 else null end
  ) = 1 then '○' else null end as "SQL入門",
  case when sum(
    case when course = 'UNIX基礎' then 1 else null end
  ) = 1 then '○' else null end as "UNIX基礎",
  case when sum(
    case when course = 'JAVA中級' then 1 else null end
  ) = 1 then '○' else null end as "JAVA中級"
from course
group by name
order by name;
