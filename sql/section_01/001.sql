--県 コード を 地方 コード に 再 分類 する
select case pref_name
  when '徳島' then '四国'
  when '香川' then '四国'
  when '愛媛' then '四国'
  when '高知' then '四国'
  when '福岡' then '九州'
  when '佐賀' then '九州'
  when '長崎' then '九州'
  else 'その他'
  end as district,
  sum(population)
from PopTbl
group by case pref_name
  when '徳島' then '四国'
  when '香川' then '四国'
  when '愛媛' then '四国'
  when '高知' then '四国'
  when '福岡' then '九州'
  when '佐賀' then '九州'
  when '長崎' then '九州'
  else 'その他'
  end;

--人口 階級 ごと に 都道府県 を 分類 する
select case when population < 100 then '01'
            when population >= 100 and population < 200 then '02'
            when population >= 200 and population < 300 then '03'
            when population >= 300 then '04'
       else null end as pop_class,
       count(*) as cnt
from PopTbl
group by case when population < 100 then '01'
              when population >= 100 and population < 200 then '02'
              when population >= 200 and population < 300 then '03'
              when population >= 300 then '04'
         else null end
order by pop_class;
