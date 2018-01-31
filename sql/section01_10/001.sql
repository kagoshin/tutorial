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

-- 全称文を集合で表現する：その２
select team_id
from teams
group by team_id
having max(status) = '待機'
and min(status) = '待機';

-- 総員スタンバイかどうかをチームごとに一覧表示
select team_id,
       case when max(status) = '待機'
            and min(status) = '待機'
            then '総員スタンバイ'
            else 'メンバーが足りません' end as status
from teams
group by team_id;
