-- WHERE 句 で 条件 分岐 さ せる のは 素人 の やる こと。 プロ は SELECT 句 で 分岐 さ せる。

select pref_name,
       -- 男性の人口
       sum(case when sex = '1' then population else 0 end) as cnt_m,
       -- 女性の人口
       sum(case when sex = '2' then population else 0 end) as cnt_f
from PopTbl2
group by pref_name;
