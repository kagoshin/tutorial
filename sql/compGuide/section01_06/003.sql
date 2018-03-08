-- オーバーラップする期間を求める
select reserver,
       start_date,
       end_date
from reservations r1
where exists(
  select * from reservations r2
  where r1.reserver <> r2.reserver
        -- 自分以外の客と比較する
  and (r1.start_date between r2.start_date and r2.end_date
       -- 条件(1)：開始日が他の期間内にある
       or
       r1.end_date between r2.start_date and r2.end_date)
       -- 条件(2)：終了日が他の期間内にある
);

-- オーバーラップしない客を求める
select reserver,
       start_date,
       end_date
from reservations r1
where not exists(
  select * from reservations r2
  where r1.reserver <> r2.reserver
        -- 自分以外の客と比較する
  and (r1.start_date between r2.start_date and r2.end_date
       -- 条件(1)：開始日が他の期間内にある
       or
       r1.end_date between r2.start_date and r2.end_date)
       -- 条件(2)：終了日が他の期間内にある
);

--応用版：相手を完全に含む期間も出力する
select reserver,
       start_date,
       end_date
from reservations r1
where exists(
  select * from reservations r2
  where r1.reserver <> r2.reserver
  and(
    (r1.start_date between r2.start_date and r2.end_date
     or
     r1.end_date between r2.start_date and r2.end_date)
    or
    (r2.start_date between r1.start_date and r1.end_date
     and
     r2.end_date between r1.start_date and r1.end_date)
  )
);
