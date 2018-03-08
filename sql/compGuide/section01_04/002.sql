--最頻値を求めるSQLその1：ALL述語の利用
select income, count(*) as cnt
from Graduates
group by income
having count(*) >= ALL(
  select count(*)
  from Graduates
  group by income
);

--最頻値を求めるSQLその2：極値関数の利用
select income, count(*) as cnt
from Graduates
group by income
having count(*) >= (
  select max(cnt)
  from (
    select count(*) as cnt
    from graduates
    group by income
  ) tmp
);

--メジアンを求めるSQL：自己非等値結合をHAVING句で使う
select avg(distinct income)
from (
      select t1.income
      from graduates t1, graduates t2
      group by t1.income
      -- S1の条件
      having sum(
              case when t2.income >= t1.income
                   then 1
                   else 0 end
             ) >= count(*) / 2
      -- S2の条件
         and sum (
              case when t2.income <= t1.income
                   then 1
                   else 0 end
            ) >= count(*) / 2
     ) tmp;
