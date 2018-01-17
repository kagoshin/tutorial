--列方向への全称量化
select *
from arrayTbl
where 1 = all(col1, col2, col3, col4, col5, col6, col7, col8, col9);

--列方向への存在量化
select *
from arrayTbl
where 9 = any(col1, col2, col3, col4, col5, col6, col7, col8, col9);

select *
from arrayTbl
where 9 in (col1, col2, col3, col4, col5, col6, col7, col8, col9);

-- 全てNULL
select *
from arrayTbl
where coalesce (col1, col2, col3, col4, col5, col6, col7, col8, col9) is null;

