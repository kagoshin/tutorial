-- overlaps
select reserver,
       start_date,
       end_date
from reservations r1
where exists (
  select *
  from reservations r2
  where r1.reserver <> r2.reserver
  and (r1.start_date, r1.end_date) overlaps (r2.start_date, r2.end_date);
);
