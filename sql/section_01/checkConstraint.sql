create table employee
(
  name varchar2(30),
  sex varchar2(1),
  salary number(10),
  constraint check_salary check
  ( case when sex = '2'
      then case when salary <= 200000
            then 1 else 0 end
      else 1 end = 1 )
);

insert into employee(name, sex, salary) values('taro', '1', 100000);
insert into employee(name, sex, salary) values('jiro', '1', 300000);
insert into employee(name, sex, salary) values('hanako', '2', 100000);
-- ORA-02290: チェック制約(TEST001.CHECK_SALARY)に違反しました
insert into employee(name, sex, salary) values('kanako', '2', 210000);
