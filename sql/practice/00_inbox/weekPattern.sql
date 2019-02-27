with tgt as (
    select to_date('20190201', 'yyyymmdd') - 1 as yymm, '1' as week, '1' as ptn from dual union all --月
    select to_date('20190201', 'yyyymmdd') - 1 as yymm, '2' as week, '1' as ptn from dual union all --火
    select to_date('20190201', 'yyyymmdd') - 1 as yymm, '3' as week, '1' as ptn from dual           --水
)
select next_day(
         yymm
         , case week when '1' then 2 --月
                     when '2' then 3 --火
                     when '3' then 4 --水
                     when '4' then 5 --木
                     when '5' then 6 --金
                     when '6' then 7 --土
                     when '7' then 1 --日
           else null
           end
       ) as next_day
from tgt
;

--------------------------------------------------------------------------------

with
tgt as (
    select to_date('20190201', 'yyyymmdd') - 1 as yymm, '1' as week, '1' as ptn from dual union all --月
    select to_date('20190201', 'yyyymmdd') - 1 as yymm, '2' as week, '1' as ptn from dual union all --火
    select to_date('20190201', 'yyyymmdd') - 1 as yymm, '3' as week, '1' as ptn from dual           --水
),
tgt2 (nxt, yymm, week, ptn)as (
    select next_day(
             yymm
             , case week when '1' then 2 --月
                         when '2' then 3 --火
                         when '3' then 4 --水
                         when '4' then 5 --木
                         when '5' then 6 --金
                         when '6' then 7 --土
                         when '7' then 1 --日
               else null end
           ) as nxt
           , yymm
           , week
           , ptn
    from tgt
    union all
    select next_day(
             nxt
             , case week when '1' then 2 --月
                         when '2' then 3 --火
                         when '3' then 4 --水
                         when '4' then 5 --木
                         when '5' then 6 --金
                         when '6' then 7 --土
                         when '7' then 1 --日
                         else null end
           ) as nxt
           , yymm
           , week
           , ptn
    from tgt2 --where next_day(
--                        nxt
--                        , case week when '1' then 2 --月
--                                    when '2' then 3 --火
--                                    when '3' then 4 --水
--                                    when '4' then 5 --木
--                                    when '5' then 6 --金
--                                    when '6' then 7 --土
--                                    when '7' then 1 --日
--                                    else null end
--                    ) <= LAST_DAY(yymm)
)
select * from tgt2
;
