select class
from testResults
group by class
having count(*) * 0.75 <= sum(
  case when score >= 80 then 1
       else 0 end
);

select class
from testResults
group by class
having sum(
  case when score >= 50 and sex = '男' then 1 else 0 end
) > sum (
  case when score >= 50 and sex = '女' then 1 else 0 end
);

select class
from testResults
group by class
having avg(
  case when sex = '男' then score else null end
) < avg (
  case when sex = '女' then score else null end
);
