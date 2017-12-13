select sex,
       sum(population) as total,
       sum(
         case when pref_name = '徳島'
              then population
              else 0
              end
       ) as col_1,
       sum(
         case when pref_name = '香川'
              then population
              else 0
              end
       ) as col_2,
       sum(
         case when pref_name = '愛媛'
              then population
              else 0
              end
       ) as col_3,
       sum(
         case when pref_name = '高知'
              then population
              else 0
              end
       ) as col_4,
       sum(
         case when pref_name in ('徳島', '香川', '愛媛','高知')
              then population
              else 0
              end
       ) as saikei
from poptbl2
group by sex;
