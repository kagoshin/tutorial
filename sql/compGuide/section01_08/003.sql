--工程1番まで完了のプロジェクトを選択：集合指向的な解答
select project_id
from projects
group by project_id
having count(*) = sum(
  case when step_nbr <= 1 and status = '完了' then 1
       when step_nbr > 1 and status = '待機' then 1
       else 0 end
);


--工程1番まで完了のプロジェクトを選択：述語論理的な解答
select *
from projects p1
where not exists (
  select status from projects p2
  where p1.project_id = p2.project_id -- プロジェクトごとに条件を調べる
  and p2.status <> case when step_nbr <= 1 -- 全称文を二重否定で表現する
                        then '完了'
                        else '待機' end
)
order by p1.PROJECT_ID, p1.STEP_NBR;


-- 工程1番まで完了のプロジェクトを選択：ALL述語による解答
select *
from projects p1
where '○' = ALL (
  select case when step_nbr <= 1 and status = '完了' then '○'
              when step_nbr > 1 and status = '待機' then '○'
              else '×' end
  from projects p2
  where p1.project_id = p2.project_id
);
