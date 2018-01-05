-- 各時点までの累計
select
  prc_date,
  prc_amt,
  sum(prc_amt) over(order by prc_date) as onhand_amt
from accounts;

-- 各時点の最大値
select
  prc_date,
  prc_amt,
  max(prc_amt) over(order by prc_date) as onhand_amt
from accounts;

-- 各時点の最小値
select
  prc_date,
  prc_amt,
  min(prc_amt) over(order by prc_date) as onhand_amt
from accounts;

-- 各時点の平均
select
  prc_date,
  prc_amt,
  avg(prc_amt) over(order by prc_date) as onhand_amt
from accounts;
