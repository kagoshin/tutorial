--累計を求める：OLAP関数の利用
select
  prc_date,
  prc_amt,
  sum(prc_amt) over(order by prc_date) as onhand_amt
from accounts;


--累計を求める：ノイマン型再帰集合の利用
select prc_date,
       prc_amt,
       (select sum(prc_amt)
        from accounts a2
        where a1.prc_date >= a2.prc_date) as onhand_amt
from accounts a1
order by prc_date;


--移動累計を求めるその1：OLAP関数の利用
select prc_date,
       prc_amt,
       sum(prc_amt) over(order by prc_date rows 2 preceding) as onhand_amt
from accounts;


--移動累計を求めるその2：3行に満たない期間も出力する
select prc_date,
       prc_amt,
       (select sum(prc_amt)
        from accounts a2
        where a1.prc_date >= a2.prc_date
        and (select count(*)
             from accounts a3
             where a3.prc_date
             between a2.prc_date and a1.prc_date) <= 3) as mvg_sum
from accounts a1
order by prc_date;


--移動累計を求めるその2：3行に満たない期間も出力する
select prc_date,
       prc_amt,
       (select sum(prc_amt)
        from accounts a2
        where a1.prc_date >= a2.prc_date
        and (select count(*)
             from accounts a3
             where a3.prc_date
             between a2.prc_date and a1.prc_date) <= 3
        having count(*) = 3) as mvg_sum
from accounts a1
order by prc_date;


-- 非グループ化して表示
select a1.prc_date as a1_date,
       a2.prc_date as a2_date,
       a2.prc_amt as a2_amt
from accounts a1, accounts a2
where a1.prc_date >= a2.prc_date
and (select count(*)
     from accounts a3
     where a3.prc_date
     between a2.prc_date and a1.prc_date) <= 3
order by a1.prc_date, a2.prc_date;

--移動平均を求める
select prc_date,
       prc_amt,
       (select avg(prc_amt)
        from accounts a2
        where a1.prc_date >= a2.prc_date
        and (select count(*)
             from accounts a3
             where a3.prc_date
             between a2.prc_date and a1.prc_date) <= 3
        having count(*) = 3) as mvg_sum
from accounts a1
order by prc_date;
