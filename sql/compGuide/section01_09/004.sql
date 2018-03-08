--人数分の空席を探すその2：行の折り返しも考慮する
select s1.seat,
       '〜',
       s2.seat
from seats2 s1, seats2 s2
where s2.seat = s1.seat + (:head_cnt - 1)
and not exists (
  select * from seats2 s3
  where s3.seat between s1.seat and s2.seat
  and (s3.status <> '空'
       or
       s3.row_id <> s1.row_id)
);

-- 行に折り返しがある場合
select s1.seat as start_seat,
       '〜',
       s2.seat as end_seat
from seats2 s1, seats2 s2, seats2 s3
where s2.seat = s1.seat + (:head_cnt - 1)
and s3.seat between s1.seat and s2.seat
group by s1.seat, s2.seat
having count(*) = sum(
  case when s3.status = '空'
            and s3.row_id = s1.row_id
       then 1 else 0 end
);
