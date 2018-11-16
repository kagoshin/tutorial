-- grouping関数
select grouping(SyouhinCode) as IsGrouping
       , case grouping(SyouhinCode)
          when 1 then 'Total'
          else SyouhinCode end as AggKey
       , count(*) as cnt
       , sum(Suuryou) as SumSuuryou
from LogTable
group by RollUp(SyouhinCode)
order by grouping(SyouhinCode) desc
         , SyouhinCode
;

-- grouping_ID
select case grouping_ID(SyouhinCode, MiseCode)
        when 2 + 1 then 'Total'
        when 0 + 1 then 'SubTotal'
        else SyouhinCode end as SyouhinCode
       , MiseCode
       , grouping_ID(SyouhinCode, MiseCode) as groupingId
       , count(*) as cnt
       , sum(Suuryou) as SumSuuryou
from LogTable
group by RollUp(SyouhinCode, MiseCode)
;
