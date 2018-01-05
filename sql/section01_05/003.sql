-- 外部結合で入れ子の表側を作る
select
  master.age_class as age_class,
  master.sex_cd as sex_cd,
  data.pop_tohoku as pop_tohoku,
  data.pop_kanto as pop_kanto
from (
  select age_class, sex_cd
  from tblage
  cross join tblsex
) master -- クロス結合でマスタ同士の直積を作る
left outer join (
  select
    age_class,
    sex_cd,
    sum(
      case when pref_name in ('青森', '秋田')
        then population else null end
    ) as pop_tohoku,
    sum(
      case when pref_name in ('東京', '千葉')
        then population else null end
    ) as pop_kanto
  from tblpop
  group by age_class, sex_cd
) data
on master.age_class = data.age_class
and master.sex_cd = data.sex_cd
order by age_class asc, sex_cd desc;


-- 修正版
select
  master.age_class as age_class,
  master.sex_cd as sex_cd,
  sum(case when pref_name in ('青森', '秋田')
           then population else null end) as pop_tohoku,
  sum(case when pref_name in ('東京', '千葉')
           then population else null end) as pop_kanto
from (
  select age_class,
         sex_cd
  from tblage cross join tblsex
) master
left outer join tblpop data
on master.age_class = data.age_class
and master.sex_cd = data.sex_cd
group by master.age_class, master.sex_cd
order by master.age_class asc, master.sex_cd desc;
