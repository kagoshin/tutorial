-- 年齢20才、または20歳でない生徒を選択
select * from students
where age = 20
or age <> 20
or age is null;

-- Bクラスの東京在住の生徒と年齢が一致しないAクラスの生徒を選択するSQL？
-- １行も選択されない。
select * from Class_A
where age not in (
  select age from Class_B
  where city = '東京'
);

-- 選択される
select * from Class_A a
where not exists(
  select * from Class_B b
  where a.age = b.age
  and city = '東京'
);

-- Bクラスの東京在住の誰よりも若いAクラスの生徒を選択する
select * from Class_A
where age < all(
  select age from Class_B
  where city = '東京'
);

--Bクラスの東京在住の最も若い生徒より若いAクラスの生徒を選択する
select * from Class_A
where age < (
  select min(age) from Class_B
  where city = '東京'
);
