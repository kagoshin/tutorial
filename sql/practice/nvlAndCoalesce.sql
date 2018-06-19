with nvl_sample (vc2)
as (
  select 'あいう' from dual union all
  select null from dual
)
select vc2
       , nvl(vc2, 'IS NULL')
       , dump(nvl(vc2, 'IS NULL'), 1016) dump_code
from nvl_sample
;

--NVLの引数として異なるキャラクタセットの文字列を使用すると
--第一引数の型で評価して戻される
with nvl_sample (nvc2)
as (
  select to_nchar('あいう') from dual union all
  select null from dual
)
select nvc2
       , nvl(nvc2, 'これはNULLです（UTF8）')　nvl_nvchar2
       , dump(nvl(nvc2, 'これはNULLです（UTF8）'), 1016) dump_code
from nvl_sample
;

--数値型の場合
--BINATY_DOUBLE > BINATY_FLOAT > NUMBER の優先順位で型変換が行なわれる
with nvl_sample2 (num)
as (
  select 1 from dual union all
  select null from dual
)
select num
       , dump(nvl(num, 0d))
from nvl_sample2
;

with nvl_sample2 (d)
as (
  select to_binary_double(1) from dual union all
  select null from dual
)
select d
       , dump(nvl(d, 0))
from nvl_sample2
;

select coalesce(null, null, 'NOT NULL', null) from dual;
select coalesce(null, null) from dual;
select coalesce(null) from dual;
