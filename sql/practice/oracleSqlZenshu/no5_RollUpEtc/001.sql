create table LogTable (
  HanbaiDay date,
  SyouhinCode char(3),
  MiseCode char(3),
  Suuryou number(3),
  primary key(HanbaiDay, SyouhinCode, MiseCode)
);

insert into LogTable
  select date'2011-06-30', 'AAA', '111', 1 from dual union all
  select date'2011-06-30', 'AAA', '222', 3 from dual union all
  select date'2011-06-30', 'AAA', '333', 5 from dual union all
  select date'2011-06-30', 'BBB', '111', 10 from dual union all
  select date'2011-06-30', 'BBB', '222', 30 from dual union all
  select date'2011-06-30', 'CCC', '222', 16 from dual union all
  select date'2011-06-30', 'CCC', '333', 700 from dual union all
  select date'2011-07-01', 'BBB', '111', 100 from dual union all
  select date'2011-07-01', 'BBB', '222', 300 from dual union all
  select date'2011-07-01', 'CCC', '111', 500 from dual union all
  select date'2011-07-02', 'AAA', '111', 2 from dual union all
  select date'2011-07-02', 'AAA', '222', 7 from dual
;

--commit;

-- 通常のgroup by句を使用したselect文
select HanbaiDay
       , count(*) as cnt
       , sum(Suuryou) as SumSuuryou
from LogTable
group by HanbaiDay
order by HanbaiDay
;

-- RollUpを使用したselect文
select HanbaiDay
       , count(*) as cnt
       , sum(Suuryou) as SumSuuryou
from LogTable
group by RollUp(HanbaiDay)
order by HanbaiDay
;

-- 複数列
select HanbaiDay
       , SyouhinCode
       , count(*) as cnt
       , sum(Suuryou) as SumSuuryou
from LogTable
group by RollUp(HanbaiDay, SyouhinCode)
order by HanbaiDay, SyouhinCode
;

-- 複合列
/* HanbaiDay,SyouhinCodeごとの集計結果と、
全体行を対象とした集計結果(総計)を、
1つのselect文で取得しています。 */
select HanbaiDay
       , SyouhinCode
       , count(*) as cnt
       , sum(Suuryou) as SumSuuryou
from LogTable
group by RollUp((HanbaiDay, SyouhinCode))
order by HanbaiDay, SyouhinCode
;
