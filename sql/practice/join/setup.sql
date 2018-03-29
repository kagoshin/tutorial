create table nameTable (
  id number(2) primary key,
  name varchar2(10)
)
;

create table ageTable (
  id number(2) primary key,
  age number(3)
)
;

insert into nameTable values(1, '一郎');
insert into nameTable values(2, '二郎');
insert into nameTable values(4, '一子');
insert into nameTable values(5, '二子');

insert into ageTable values(1, 21);
insert into ageTable values(2, 22);
insert into ageTable values(3, 31);
insert into ageTable values(5, 31);

--commit;
