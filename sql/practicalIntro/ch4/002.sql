--「図4.5::年齢別価格テーブルのサンプル」を作成
create table PriceByAge (
  product_id varchar2(32) not null,
  low_age integer not null,
  high_age integer not null,
  price integer not null,
  primary key (product_id, low_age),
  check (low_age < high_age)
);

INSERT INTO PriceByAge VALUES('製品1',  0  ,  50  ,  2000);
INSERT INTO PriceByAge VALUES('製品1',  51 ,  100 ,  3000);
INSERT INTO PriceByAge VALUES('製品2',  0  ,  100 ,  4200);
INSERT INTO PriceByAge VALUES('製品3',  0  ,  20  ,  500);
INSERT INTO PriceByAge VALUES('製品3',  31 ,  70  ,  800);
INSERT INTO PriceByAge VALUES('製品3',  71 ,  100 ,  1000);
INSERT INTO PriceByAge VALUES('製品4',  0  ,  99  ,  8900);

--commit;

--リスト4.6 複数のレコードで一つの範囲をカバーする
select product_id
from PriceByAge
group by product_id
having sum(high_age - low_age + 1) = 101;
