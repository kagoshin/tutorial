--リスト5.4 ウィンドウ関数で「1行前の会社名」と「1行前の売り上げ」を取得
select company
       , year
       , sale
       , max(company) over (
           partition by company
           order by year
           rows between 1 preceding
                and 1 preceding
         ) as pre_company
       , max(sale) over (
           partition by company
           order by year
           rows between 1 preceding
                and 1 preceding
         ) as pre_sale
from sales
;
