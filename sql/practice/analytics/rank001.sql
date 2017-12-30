create table RankingSample(ID,Score) as
select 1,100 from dual union all
select 1, 90 from dual union all
select 1, 90 from dual union all
select 1, 80 from dual union all
select 1, 70 from dual union all
select 2,100 from dual union all
select 2,100 from dual union all
select 2,100 from dual union all
select 2, 90 from dual union all
select 2, 80 from dual;

--Row_Number関数は、1から始まって、必ず連番。
--rank関数は、同点があると順位が飛ぶ。
--dense_rank関数は、同点があっても順位が飛ばない。
select id,
       score,
       row_number() over(partition by id order by score desc) as "row_number",
       rank() over(partition by id order by score desc) as "rank",
       dense_rank() over(partition by id order by score desc) as "dense_rank"
from RankingSample
order by id, score desc;
