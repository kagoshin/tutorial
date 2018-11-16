select HanbaiDay
       , SyouhinCode
       , count(*) as cnt
       , sum(Suuryou) as SumSuuryou
from LogTable
group by HanbaiDay
         , RollUp(SyouhinCode)
order by HanbaiDay
         , SyouhinCode
;

-- grouping sets
-- 全体行を対象とした集計は、grouping sets集計での空括弧で指定
select HanbaiDay
       , SyouhinCode
       , MiseCode
       , count(*) as cnt
       , sum(Suuryou) as SumSuuryou
from LogTable
group by grouping sets(MiseCode, (HanbaiDay, SyouhinCode), ())
order by MiseCode
         , HanbaiDay
         , SyouhinCode
;

-- cube
select HanbaiDay
       , SyouhinCode
       , sum(Suuryou) as SumSuuryou
       , ListAgg(to_char(Suuryou), ',')
          within group (order by HanbaiDay, SyouhinCode) as AggBase
from LogTable
group by cube(HanbaiDay, SyouhinCode)
order by HanbaiDay, SyouhinCode
;

select HanbaiDay
       , SyouhinCode
       , MiseCode
       , sum(Suuryou) as SumSuuryou
       , ListAgg(to_char(Suuryou), ',')
          within group (order by HanbaiDay, SyouhinCode) as AggBase
from LogTable
group by cube(HanbaiDay, SyouhinCode, MiseCode)
order by HanbaiDay, SyouhinCode, MiseCode
;
