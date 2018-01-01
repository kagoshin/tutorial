-- 演習問題① 常に結果を１行返す欠番チェック
select case when count(*) <> max(seq)
            then '歯抜けあり'
            else '歯抜けなし'
            end as gap
from seqtbl;

-- 演習問題② 特性関数
select dpt
from Students02
group by dpt
having count(*) = sum(
    case when sbmt_date between '2005-09-01' and '2005-09-30'
    -- case when sbmt_date between to_date('2005/09/01') and to_date('2005/09/30')
         then 1
         else 0 end);

select dpt
from students02
group by dpt
having count(*) = sum(
  case when extract(year from sbmt_date) = 2005
            and extract(month from sbmt_date) = 09
       then 1
       else 0 end
);

-- 演習問題③
select si.shop,
       count(si.item) as my_item_cnt,
       (select count(item) from items) - count(si.item) as diff_cnt
from ShopItems si, items i
where si.item = i.item
group by si.shop;
