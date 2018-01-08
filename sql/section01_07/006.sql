select case
       when count(*) = (select count(*) from tbl_A)
            and
            count(*) = (select count(*) from tbl_B)
       then '等しい'
       else '異なる' end as result
from (
  select * from tbl_A
  union
  select * from tbl_B
) tmp;


select distinct emp
from empSkills es1
where not exists(
  select skil from skills
  minus
  select skil from empSkills es2
  where es1.emp = es2.emp)
and not exists(
  select skil from empSkills es3
  where es1.emp = es3.emp
  minus
  select skil from skills
);

select emp
from empSkills es1
where not exists (
  select skil from skills
  minus
  select skil from empSkills es2
  where es1.emp = es2.emp
)
group by emp
having count(*) = (select count(*) from skills);
