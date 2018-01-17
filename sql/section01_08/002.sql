-- 50点未満である教科が一つも存在しない
select distinct t1.student_id
from testScores t1
where not exists (
  select * from testScores t2
  where t1.student_id = t2.student_id
  and t2.score < 50
);

-- 1.算数の点数が80点以上
-- 2.国語の点数が50点以上
select distinct t1.student_id
from testScores t1
where t1.subject in ('国語', '算数')
and not exists (
  select * from testScores t2
  where t1.student_id = t2.student_id
  and 1 = case when t2.subject = '国語' and t2.score < 50 then 1
               when t2.subject = '算数' and t2.score < 80 then 1
               else 0 end
);

select t1.student_id
from testScores t1
where t1.subject in ('国語', '算数')
and not exists (
  select * from testScores t2
  where t1.student_id = t2.student_id
  and 1 = case when t2.subject = '国語' and t2.score < 50 then 1
               when t2.subject = '算数' and t2.score < 80 then 1
               else 0 end
)
group by student_id
having count(*) = 2; -- 必ず２教科揃っていること
