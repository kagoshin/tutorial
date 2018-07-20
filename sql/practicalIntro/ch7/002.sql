--スト7.5 サブクエリ・パラノイア　患者2号
set autotrace on explain
select tmp_min.cust_id
       , tmp_min.price - tmp_max.price as diff
from (
  select r1.cust_id
         , r1.seq
         , r1.price
  from receipts r1
  join (
    select cust_id
           , min(seq) as min_seq
    from receipts
    group by cust_id
  ) r2
  on r1.cust_id = r2.cust_id
  and r1.seq = r2.min_seq
) tmp_min
join (
  select r3.cust_id
         , r3.seq
         , r3.price
  from receipts r3
  join (
    select cust_id
           , max(seq) as max_seq
    from receipts
    group by cust_id
  ) r4
  on r3.cust_id = r4.cust_id
  and r3.seq = r4.max_seq
) tmp_max
on tmp_min.cust_id = tmp_max.cust_id
;

--リスト7.6 ウィンドウ関数とCASE式
set autotrace on explain
select cust_id
       , sum(case when min_seq = 1 then price else 0 end)
         - sum(case when max_seq = 1 then price else 0 end) as diff
from (
  select cust_id
         , price
         , row_number() over (partition by cust_id
                              order by seq) as min_seq
         , row_number() over (partition by cust_id
                              order by seq desc) as max_seq
  from receipts
) work
where work.min_seq = 1
or work.max_seq = 1
group by cust_id
;
