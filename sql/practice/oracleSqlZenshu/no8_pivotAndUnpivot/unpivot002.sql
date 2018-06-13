-- UnPivotの代用 (union all)
with tmp(id, vals, sortkeys) as (
  select id, val1, 1 from UnPivotSample union all
  select id, val2, 2 from UnPivotSample union all
  select id, val3, 3 from UnPivotSample
)
select id, vals, sortkeys
from tmp
order by id, sortkeys;

-- UnPivotの代用 (連番表とクロスジョイン)
select a.id,
       case b.cnter
        when 1 then a.val1
        when 2 then a.val2
        when 3 then a.val3
        end as vals,
       b.cnter
from UnPivotSample a,
     (
       select 1 as cnter from dual union all
       select 2 from dual union all
       select 3 from dual
     ) b
order by a.id, b.cnter;

-- UnPivotの代用 (sys.odciNumberList)
select id, column_value as vals
from UnPivotSample,
     table(sys.odciNumberList(Val1, Val2, Val3));
