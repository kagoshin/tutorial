--
select key,
       case when x > y
              then x
              else y
              end as Greatest
from Greatest;

--
select key,
       case when x > y
              then case when x > z
                          then x
                          else z
                          end
              else case when y > z
                          then y
                          else z
                          end
              end as Greatest
from Greatest;

--正解
select key,
       case when case when x < y then y else x end < z
              then z
              else case when x < y then y else x end
       end as greatest
from greatest;

--greatest関数
select key, greatest(greatest(x, y), z) as greatest
from Greatest;
