--「リスト7.1::購入明細テーブル」を作成
create table Receipts (
  cust_id char(1) not null,
  seq integer not null,
  price integer not null,
  primary key (cust_id, seq)
)
;

insert into Receipts values ('A', 1, 500);
INSERT INTO Receipts VALUES ('A',   2   ,1000   );
INSERT INTO Receipts VALUES ('A',   3   ,700    );
INSERT INTO Receipts VALUES ('B',   5   ,100    );
INSERT INTO Receipts VALUES ('B',   6   ,5000   );
INSERT INTO Receipts VALUES ('B',   7   ,300    );
INSERT INTO Receipts VALUES ('B',   9   ,200    );
INSERT INTO Receipts VALUES ('B',   12  ,1000   );
INSERT INTO Receipts VALUES ('C',   10  ,600    );
INSERT INTO Receipts VALUES ('C',   20  ,100    );
INSERT INTO Receipts VALUES ('C',   45  ,200    );
INSERT INTO Receipts VALUES ('C',   70  ,50     );
INSERT INTO Receipts VALUES ('D',   3   ,2000   );
commit;

--リスト7.2 サブクエリを使った解
set autotrace on explain
select r1.cust_id
       , r1.seq
       , r1.price
from Receipts r1
inner join (
  select cust_id
         , min(seq) as min_seq
  from Receipts
  group by cust_id
) r2
on r1.cust_id = r2.cust_id
and r1.seq = r2.min_seq
;

--リスト7.3 相関サブクエリの解
set autotrace on explain
select cust_id
       , seq
       , price
from receipts r1
where seq = (
  select min(seq)
  from receipts r2
  where r1.cust_id = r2.cust_id
)
;

--リスト7.4 ウィンドウ関数による解
set autotrace on explain
select cust_id
       , seq
       , price
from (
  select cust_id
         , seq
         , price
         , row_number() over (
            partition by cust_id
            order by seq
           ) as row_seq
  from receipts
) work
where work.row_seq = 1
;
