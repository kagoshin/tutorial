--成長、後退、現状維持を一度に求めるその2：SIGN関数の利用
select s1.year,
       s1.sale,
       case sign(sale - (select sale
                         from sales s2
                         where s2.year = s1.year - 1))
            when 0 then '→'
            when 1 then '↑'
            when -1 then '↓'
            else '-' end as var
from sales s1
order by year;
