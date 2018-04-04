select dump(decode(2, 1, 'ONE', 2, 2)) "STRING" from dual;

with size_sample (size_name) as (
  select 'XS' from dual
  union
  select 'S' from dual
  union
  select 'M' from dual
  union
  select 'L' from dual
  union
  select 'XL' from dual
)
select size_name from size_sample
order by decode(size_name, 'XS', 1, 'S', 2, 'M', 3, 'L', 4, 'XL', 5)
;

with decode_sample1 (num) as (
  select 1 from dual
  union
  select 10 from dual
  union
  select 20 from dual
  union
  select 21 from dual
  union
  select 30 from dual
  union
  select 40 from dual
)
select num
       , decode(sign(num-10), -1, '10未満', +1, '10以上', 0, '10') as X
       , decode(sign(num-20), -1, '20未満', +1, '20以上', 0, '20') as XX
       , decode(sign(num-30), -1, '30未満', +1, '30以上', 0, '30') as XXX
       , decode(sign(num-40), -1, '40未満', +1, '40以上', 0, '40') as XL
from decode_sample1
;

with decode_sample2 (str) as (
  select 'AAA' from dual
  union
  select 'AAB' from dual
  union
  select 'BBB' from dual
  union
  select 'CCC' from dual
  union
  select null from dual
  union
  select 'DDD' from dual
  union
  select 'EEE' from dual
)
select str
       , decode(greatest('AAA', str), 'AAA', 'AAA以下') as AAA
       , decode(greatest('BBB', str), 'BBB', 'BBB以下') as BBB
       , decode(least('CCC', str), 'CCC', 'CCC以上') as CCC
       , decode(least('DDD', str), 'DDD', 'DDD以上') as DDD
from decode_sample2
;
