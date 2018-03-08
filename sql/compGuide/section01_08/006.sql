-- 1とその数以外のどんな自然数によっても割り切れない
-- = 1とその数以外に割り切れる自然数が存在しない

-- 答え：NOTEXISTSで全称量化を表現
select num as prime
from numbers devidend
where num > 1
and not exists (
  select *
  from numbers devisor
  where devisor.num <= devidend.num / 2  -- 自分以外の約数は自分の半分以下にしか存在しない
  and devisor.num <> 1                   -- 1は約数に含まない
  and mod(devidend.num, devisor.num) = 0 -- 「割り切れない」の否定条件なので「割り切れる」
)
order by prime;
