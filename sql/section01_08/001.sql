select distinct m1.meetings, m2.person
from  meetings m1
cross join meetings m2;

--欠席者だけを求めるクエリその１：存在量化の応用
select distinct m1.meeting, m2.person
from meetings m1
cross join meetings m2
where not exists (
  select *
  from meetings m3
  where m1.meeting = m3.meeting
  and m2.person = m3.person
);

--欠席者だけを求めるクエリその２：差集合演算の利用
select m1.meeting, m2.person
from meetings m1, meetings m2
minus
select meeting, person
from meetings;
