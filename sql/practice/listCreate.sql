with gyoshu (gyoshuCd, gyoshuNm, gyoshu) as (
  select '010000', '大１', '1' from dual union
  select '010100', '中１１', '2' from dual union
  select '010101', '小１１', '3' from dual union
  select '010102', '小１２', '3' from dual union
  --select '010200', '中１２', '2' from dual union
  --select '010201', '小２１', '3' from dual union
  select '020000', '大２', '1' from dual union
  select '020100', '中２', '2' from dual union
  select '020101', '小２１', '3' from dual union
  select '020102', '小２２', '3' from dual union
  select '030000', '大３', '1' from dual union
  select '030100', '中３', '2' from dual union
  select '030101', '小３１', '3' from dual union
  select '030102', '小３２', '3' from dual
)
select substr(dai.gyoshuCd, 1, 2) as daiCd
       , dai.gyoshuNm as daiNm
       , substr(chu.gyoshuCd, 3, 2) as chuCd
       , chu.gyoshuNm as chuNm
       , substr(syo.gyoshuCd, 5, 2) as syoCd
       , syo.gyoshuNm as syoNm
from gyoshu dai
join gyoshu chu
on substr(dai.gyoshuCd, 1, 2) = substr(chu.gyoshuCd, 1, 2)
and chu.gyoshu = '2'
join gyoshu syo
on substr(dai.gyoshuCd, 1, 2) = substr(syo.gyoshuCd, 1, 2)
and substr(chu.gyoshuCd, 3, 2) = substr(syo.gyoshuCd, 3, 2)
and syo.gyoshu = '3'
where dai.gyoshu = '1'
union
select substr(dai.gyoshuCd, 1, 2) as daiCd
       , dai.gyoshuNm as daiNm
       , null as chuCd
       , null as chuNm
       , null as syoCd
       , null as syoNm
from gyoshu dai
where dai.gyoshu = '1'
union
select substr(dai.gyoshuCd, 1, 2) as daiCd
       , dai.gyoshuNm as daiNm
       , substr(chu.gyoshuCd, 3, 2) as chuCd
       , chu.gyoshuNm as chuNm
       , null as syoCd
       , null as syoNm
from gyoshu dai
join gyoshu chu
on substr(dai.gyoshuCd, 1, 2) = substr(chu.gyoshuCd, 1, 2)
and chu.gyoshu = '2'
where dai.gyoshu = '1'
order by daicd, chucd nulls first, syoCd nulls first;
