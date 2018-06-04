--「図5.1::売り上げ計算を行うテーブルのサンプル」を作成
create table Sales (
  company char(1) not null,
  year integer not null,
  sale integer not null,
  constraint pk_sales primary key (company, year)
);

INSERT INTO Sales VALUES ('A', 2002, 50);
INSERT INTO Sales VALUES ('A', 2003, 52);
INSERT INTO Sales VALUES ('A', 2004, 55);
INSERT INTO Sales VALUES ('A', 2007, 55);
INSERT INTO Sales VALUES ('B', 2001, 27);
INSERT INTO Sales VALUES ('B', 2005, 28);
INSERT INTO Sales VALUES ('B', 2006, 28);
INSERT INTO Sales VALUES ('B', 2009, 30);
INSERT INTO Sales VALUES ('C', 2001, 40);
INSERT INTO Sales VALUES ('C', 2005, 39);
INSERT INTO Sales VALUES ('C', 2006, 38);
INSERT INTO Sales VALUES ('C', 2010, 35);
commit;

create table Sales2 (
  company char(1) not null,
  year integer not null,
  sale integer not null,
  var char(1),
  constraint pk_sales2 primary key (company, year)
);

--リスト5.1 ぐるぐる系のコード
create or replace procedure proc_insert_var
is

  /* カーソル宣言 */
  cursor c_sales is
    select company, year, sale
    from sales
    order by company, year;

  /* レコードタイプ宣言 */
  rec_sales c_sales%ROWTYPE;

  /* カウンタ */
  i_pre_sale integer := 0;
  c_company char(1) := '*';
  c_var char(1) := '*';

begin

open c_sales;

  LOOP
    /* レコードをフェッチして変数に代入 */
    fetch c_sales into rec_sales;
    /* レコードがなくなったらループ終了 */
    exit when c_sales%notfound;

    if (c_company = rec_sales.company) THEN
      /* 直前のレコードが同じ会社のレコードの場合 */
      /* 直前のレコードと売り上げを比較*/
      if (i_pre_sale < rec_sales.sale) THEN
        c_var := '+';
      elsif (i_pre_sale > rec_sales.sale) THEN
        c_var := '-';
      else
        c_var := '=';
      end if;
    else
      c_var := NULL;
    end if;

    /* 登録先テーブルにデータを登録 */
    insert into sales2 (company, year, sale, var)
      values (rec_sales.company, rec_sales.year, rec_sales.sale, c_var);

    c_company := rec_sales.company;
    i_pre_sale := rec_sales.sale;

  end loop;

  close c_sales;
  commit;
end;
