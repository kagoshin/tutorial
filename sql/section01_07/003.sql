--差集合で関係除算（剰余を持った除算）
select distinct emp
from empSkills es1
where not exists(
  select skil from skills
  minus
  select skil from empSkills es2
  where es1.emp = es2.emp
);
