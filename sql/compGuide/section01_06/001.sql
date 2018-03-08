--前年と年商が同じ年度を求めるその1：相関サブクエリの利用
select year, sale
from Sales s1
where sale = (
  select sale from Sales s2
  where s2.year = s1.year -1
);


--前年と年商が同じ年度を求めるその2：自己結合の利用
select s1.year, s1.sale
from sales s1, sales s2
where s2.sale = s1.sale
and s2.year = s1.year - 1
order by s1.year;


--成長、後退、現状維持を一度に求めるその1：相関サブクエリの利用
select
  s1.year,
  s1.sale,
  case when s1.sale = (
              select sale from Sales s2
              where s2.year = s1.year -1
            ) then '→' --横ばい
       when s1.sale > (
              select sale from Sales s2
              where s2.year = s1.year -1
            ) then '↑' --成長
       when s1.sale < (
              select sale from Sales s2
              where s2.year = s1.year -1
            ) then '↓' --後退
      else '-' end as var
from sales s1
order by year;


--成長、後退、現状維持を一度に求めるその1：自己結合の利用（最初の年度は結果に現れない）
select
  s1.year,
  s1.sale,
  case when s1.sale = s2.sale then '→'
       when s1.sale > s2.sale then '↑'
       when s1.sale < s2.sale then '↓'
       else '-' end as var
from sales s1, sales s2
where s2.year = s1.year -1
order by s1.year;


--直近の年度と同じ年商の年度を選択する
select
  s1.year,
  s1.sale
from sales02 s1
where s1.sale = (
  select s2.sale from sales02 s2
  where s2.year = (
    select max(s3.year) from sales02 s3 -- 条件2：条件1を満たす年度の中で最大
    where s1.year > s3.year          -- 条件1：自分より過去である
  )
)
order by s1.year;


--直近の年度と同じ年商の年度を選択する：自己結合と併用
select
  s2.year as pre_year,
  s1.year as now_year
from sales02 s1, sales02 s2
where s1.sale = s2.sale
and s2.year = (
  select max(year) from sales02 s3 -- 条件2
  where s1.year > s3.year          -- 条件1
)
order by now_year;


--直近との差分を求めるその1：開始時点は結果に含まれない
select
  s2.year as pre_year,
  s1.year as now_year,
  s2.sale as pre_sale,
  s1.sale as now_sale,
  s1.sale - s2.sale as diff
from sales02 s1, sales02 s2
where s2.year = (
  select max(year) from sales02 s3 -- 条件2
  where s1.year > s3.year          -- 条件1
)
order by now_year;


--直近との差分を求めるその2：開始時点も結果に含まれる（oracle使えない？）
select
  s2.year as pre_year,
  s1.year as now_year,
  s2.sale as pre_sale,
  s1.sale as now_sale,
  s1.sale - s2.sale as diff
from sales02 s1
left outer join sales02 s2
on s2.year = (
  select max(year) from sales02 s3 -- 条件2
  where s1.year > s3.year          -- 条件1
)
order by now_year;
