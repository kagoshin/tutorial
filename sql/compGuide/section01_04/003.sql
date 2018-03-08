--提出日にNULLを含まない学部を選択するその１：COUNT関数の利用
select dpt
from Students02
group by dpt
having count(*) = count(sbmt_date);

--提出日にNULLを含まない学部を選択するその１：COUNT関数の利用
select dpt
from Students02
group by dpt
having count(*) = sum(
  case when sbmt_date is not null
       then 1
       else 0 end
);
