-- リスト9.15 更新元の株価テーブルの定義
create table Stocks (
  brand varchar2(8) not null,
  sale_date date not null,
  price integer not null,
  constraint pk_Stocks primary key (brand, sale_date)
);

insert into stocks values ('A鉄鋼', '2008-07-01', 1000);
INSERT INTO Stocks VALUES ('A鉄鋼', '2008-07-04', 1200);
INSERT INTO Stocks VALUES ('A鉄鋼', '2008-08-12', 800);
INSERT INTO Stocks VALUES ('B商社', '2008-06-04', 3000);
INSERT INTO Stocks VALUES ('B商社', '2008-09-11', 3000);
INSERT INTO Stocks VALUES ('C電気', '2008-07-01', 9000);
INSERT INTO Stocks VALUES ('D産業', '2008-06-04', 5000);
INSERT INTO Stocks VALUES ('D産業', '2008-06-05', 5000);
INSERT INTO Stocks VALUES ('D産業', '2008-06-06', 4800);
INSERT INTO Stocks VALUES ('D産業', '2008-12-01', 5100);
commit;

-- リスト9.16 更新先の株価テーブルの定義
create table Stocks2 (
  brand varchar2(8) not null,
  sale_date date not null,
  price integer not null,
  trend char(3) ,
  constraint pk_Stocks2 primary key (brand, sale_date)
);

-- リスト9.17 trend列を計算してINSERTする（相関サブクエリ）
insert into stocks2
select brand
       , sale_date
       , price
       , case sign(price -
                   (select price
                    from stocks s1
                    where brand = Stocks.brand
                    and sale_date = (
                      select max(sale_date)
                      from stocks s2
                      where brand = Stocks.brand
                      and sale_date < Stocks.sale_date
                    )))
         when -1 then '↓'
         when 0 then '→'
         when 1 then '↑'
         else null end
from Stocks
;

rollback;

-- リスト9.18 trend列を計算してINSERTする（ウィンドウ関数）
insert into Stocks2
select brand
       , sale_date
       , price
       , case sign(price -
                    max(price) over (partition by brand
                                     order by sale_date
                                     rows between 1 preceding
                                          and 1 preceding))
          when -1 then '↓'
          when 0 then '→'
          when 1 then '↑'
          else null
         end
from Stocks S2
;
