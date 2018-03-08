-- select *
select count(*) as row_cnt
from (
  select * from tbl_A
  union
  select * from tbl_B
) tmp;
