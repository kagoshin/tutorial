--リスト8.15 連番テーブルの定義
create table Numbers (num integer primary key);
insert into numbers values(1);
INSERT INTO Numbers VALUES(3);
INSERT INTO Numbers VALUES(4);
INSERT INTO Numbers VALUES(7);
INSERT INTO Numbers VALUES(8);
INSERT INTO Numbers VALUES(9);
INSERT INTO Numbers VALUES(12);

--commit;

--リスト8.16 欠番のカタマリを表示する
--set autotrace on explain
select (n1.num + 1) as gap_start
       , '〜'
       , (min(n2.num) - 1) as gap_end
from numbers n1
join numbers n2
on n2.num > n1.num
group by n1.num
having (n1.num + 1) < min(n2.num)
;

--リスト8.17 「1行あと」との比較
--set autotrace on explain
select num + 1 as gap_start
       , '〜'
       , (num + diff - 1) as gap_end
from (
  select num
         , max(num) over (order by num
                          rows between 1 following
                               and 1 following
                         ) - num as diff
  from numbers
) tmp
where diff <> 1
;


--リスト8.18 サブクエリの中身
select num
       -- 1行あと（1 following）から1行あと（1 following）までの中で
       --最大の値
       , max(num) over (order by num
                        rows between 1 following and 1 following)
         as next_num
from numbers
;
