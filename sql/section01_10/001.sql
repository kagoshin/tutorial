-- 全称文を述語で表現する
select team_id,
       member
from teams t1
where not exists(
  select * from teams t2
  where t1.team_id = t2.team_id
  and t2.status <> '待機'
);

-- 全称文を集合で表現する：その１
select team_id
from teams
group by team_id
having count(*) = sum(
  case when status = '待機' then 1 else 0 end
);
