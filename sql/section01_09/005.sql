--第1段階：すべてのシーケンスを保持するビューを作る。
create view Sequences2(start_seat, end_seat, seat_cnt)
as
select s1.seat as start_seat,
       s2.seat as end_seat,
       s2.seat - s1.seat + 1 as seat_cnt
from seats3 s1, seats3 s2
where s1.seat <= s2.seat --ステップ1：始点と終点の組み合わせを作る
and not exists (
  select * from seats3 s3
  where (s3.seat between s1.seat and s2.seat
         and s3.status <> '空') --条件1の否定
        or (s3.seat = s2.seat + 1 and s3.status = '空') --条件2の否定
        or (s3.seat = s1.seat - 1 and s3.status = '空') --条件3の否定
);

--drop view Sequences2;

--第2段階：最大のシーケンスを求める
select start_seat,
       '〜',
       end_seat,
       seat_cnt
from Sequences2
where seat_cnt = (select max(seat_cnt) from SEQUENCES2);

-- having句で書き換え
select s1.seat as start_seat,
       s2.seat as end_seat,
       s2.seat - s1.seat + 1 as seat_cnt
from seats3 s1, seats3 s2, seats3 s3
where s1.seat <= s2.seat
and s3.seat between s1.seat - 1 and s2.seat + 1
group by s1.seat, s2.seat
having count(*) = sum(
  case when s3.seat between s1.seat and s2.seat
            and s3.status = '空' then 1
       when s3.seat = s2.seat + 1
            and s3.status = '占' then 1
       when s3.seat = s1.seat - 1
            and s3.status = '占' then 1
       else 0 end
);
