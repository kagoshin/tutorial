--始点と終点の組み合わせを得るクエリ
select s1.deal_date as start_date,
       s2.deal_date as end_date
from mystock s1, mystock s2
where s1.deal_date < s2.deal_date;

--単調増加する期間を求めるクエリ：部分集合も出力する
select s1.deal_date as start_date,
       s2.deal_date as end_date
from mystock s1, mystock s2
where s1.deal_date < s2.deal_date
and not exists (
  select *
  from mystock s3, mystock s4
  where s3.deal_date between s1.deal_date and s2.deal_date
  and s4.deal_date between s1.deal_date and s2.deal_date
  and s3.deal_date < s4.deal_date
  and s3.price >= s4.price
);

-- 部分集合を除外して、最大範囲の期間だけを取る
select min(start_date) as start_date, -- 始点を最大限前に伸ばす
       end_date
from (
  select s1.deal_date as start_date,
         max(s2.deal_date) as end_date -- 終点を最大限後ろに伸ばす
  from mystock s1, mystock s2
  where s1.deal_date < s2.deal_date
  and not exists (
    select *
    from mystock s3, mystock s4
    where s3.deal_date between s1.deal_date and s2.deal_date
    and s4.deal_date between s1.deal_date and s2.deal_date
    and s3.deal_date < s4.deal_date
    and s3.price >= s4.price)
  group by s1.deal_date
) tmp
group by end_date;
