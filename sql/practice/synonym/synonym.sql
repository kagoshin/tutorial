-- systemスキーマで実行
create table synonym_test(
  name varchar2(20) primary key,
  age number(2),
  sex varchar2(10),
  register_date date
);

insert into synonym_test values('太郎', 21, 'male', to_date('2017/12/21'));
insert into synonym_test values('花子', 22, 'female', to_date('2017/11/21'));
insert into synonym_test values('金太郎', 25, 'male', to_date('2017/12/25'));

create synonym testPractice.synonym_test_alias
  for system.synonym_test;

-- testPracticeスキーマで実行

-- drop synonym testPractice.synonym_test_alias;

select * from SYNONYM_TEST_ALIAS;

insert into synonym_test_alias values('次郎', 20, 'male', to_date('2017/10/20'));

update synonym_test_alias set age = 30 where name = '次郎';

delete from synonym_test_alias where name = '次郎';
