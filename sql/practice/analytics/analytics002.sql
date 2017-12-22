create table cmpA(ID number,Val number);
create table cmpB(ID number,Val number);

-- case1 (cmpAとcmpBが一致)
truncate table cmpA;
truncate table cmpB;
insert into cmpA values(10,111);
insert into cmpA values(20,222);
insert into cmpB values(10,111);
insert into cmpB values(20,222);

-- case2 (cmpAとcmpBが不一致)
truncate table cmpA;
truncate table cmpB;
insert into cmpA values(10,111);
insert into cmpB values(10,111);
insert into cmpB values(20,222);

-- cmpAとcmpBのデータが一致するか調べる
select a.*, count(*) over() from cmpA a
minus
select a.*, count(*) over() from cmpB a;
