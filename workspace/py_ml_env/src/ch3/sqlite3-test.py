import sqlite3

# sqliteのデータベースに接続 --- (※1)
dbpath = "test.sqlite"
conn = sqlite3.connect(dbpath)

# テーブルを作成し、データを挿入する --- (※2)
cur = conn.cursor()
cur.executescript("""
/* itemsテーブルが既にあれば削除する */
drop table if exists items;

/* テーブルの作成 */
create table items(
    item_id integer primary key,
    name text unique,
    price integer
);

/* データを挿入  */
insert into items(name, price) values('Apple', 800);
insert into items(name, price) values('Orange', 780);
insert into items(name, price) values('Banana', 430);
""")
# 上記の操作をデータベースに反映させる --- (※3)
conn.commit()

# データを抽出する --- (※4)
cur = conn.cursor()
cur.execute("select item_id, name, price from items")
item_list = cur.fetchall()
# 一行ずつ表示
for it in item_list:
    print(it)
