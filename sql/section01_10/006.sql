select student_id
from testScores
where subject in ('算数', '国語')
group by student_id
having sum (
  case when subject = '算数' and score >= 80 then 1
       when subject = '国語' and score >= 50 then 1
       else 0 end
) = 2;
