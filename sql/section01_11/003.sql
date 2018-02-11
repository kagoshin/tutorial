--全表検索が必要
select max(item)
from items02;

--インデックスを利用
select max(item_no)
from items02;

--集約した後にhaving句でフィルタリング
select sales_date, sum(quantity)
from saleshistory
group by sales_date
having sales_date = to_date('2007/10/01');

--集約する前にwhere句でフィルタリング
select sales_date, sum(quantity)
from saleshistory
where sales_date = to_date('2007/10/01')
group by sales_date;

--中間テーブルを減らす
select sales_date, max(quantity)
from saleshistory
group by sales_date
having max(quantity) >= 10;
