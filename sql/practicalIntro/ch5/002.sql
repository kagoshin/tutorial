--リスト5.3 ウィンドウ関数を使った解

--truncate table sales2;

insert into Sales2
select company
       , year
       , sale
       , case sign(sale - max(sale) over ( partition by company
                                           order by year
                                           rows between 1 PRECEDING
                                                and 1 PRECEDING
                                          )
                  )
         when 0 then '='
         when 1 then '+'
         when -1 then '-'
         else null end as var
from sales
;

set autotrace on explain
select company
       , year
       , sale
       , case sign(sale - max(sale) over ( partition by company
                                           order by year
                                           rows between 1 PRECEDING
                                                and 1 PRECEDING
                                          )
                  )
         when 0 then '='
         when 1 then '+'
         when -1 then '-'
         else null end as var
from sales
;
