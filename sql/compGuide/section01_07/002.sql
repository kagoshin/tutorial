--2つのテーブルが相等なら「等しい」、そうでなければ「異なる」を返すクエリ
select case when count(*) = 0
            then '等しい'
            else '異なる' end as result
from (
  (select * from tbl_A
   union
   select * from tbl_B)
  minus
  (select * from tbl_A
   intersect
   select * from tbl_B)
) tmp;

-- テーブル同士のdiff
(select * from tbl_A
 minus
 select * from tbl_B)
union all
(select * from tbl_B
 minus
 select * from tbl_A);
