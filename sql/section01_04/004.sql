-- ビール、紙オムツ、自転車を全て置いている店舗を検索する
select si.shop
from shopitems si, items i
where si.item = i.item
group by si.shop
having count(si.item) = (
  select count(item) from items
);

-- 厳密な関係除算：外部結合とCOUNT関数の利用
-- 条件1によってCOUNT(SI.item)=4の仙台店が除外
-- 条件2によってCOUNT(I.item)=2の大阪店が除外（nullはカウントされない）
select si.shop
from shopitems si
left outer join items i
on si.item = i.item
group by si.shop
having count(si.item) = (select count(item) from items) -- 条件1
and count(i.item) = (select count(item) from items) -- 条件2;
