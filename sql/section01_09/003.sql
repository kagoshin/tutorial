--人数分の空席を探すその1：行の折り返しを考慮しない
select s1.seat as start_seat,
       '〜',
       s2.seat as end_seat
from seats s1, seats s2
where s2.seat = s1.seat + (:head_cnt - 1) -- 始点と終点を決める
and not exists (
  select *
  from seats s3
  where s3.seat between s1.seat and s2.seat
  and s3.status <> '空'
);
