select key
from greatest
order by case key
         when 'B' then 1
         when 'A' then 2
         when 'D' then 3
         when 'C' then 4
         else null end;

select key,
       case key
         when 'B' then 1
         when 'A' then 2
         when 'D' then 3
         when 'C' then 4
         else null end as sort_col
from greatest
order by sort_col;
