create table tblage(
  age_class number(1) primary key,
  age_range varchar2(30)
);

insert into tblage values(1, '21 〜 30歳');
insert into tblage values(2, '31 〜 40歳');
insert into tblage values(3, '41 〜 50歳');

create table tblsex(
  sex_cd varchar2(3) primary key,
  sex varchar2(3)
);

insert into tblsex values('m', '男');
insert into tblsex values('f', '女');

create table tblpop(
  pref_name varchar2(15),
  age_class number(1),
  sex_cd varchar2(3),
  population number(5),
  primary key(pref_name, age_class, sex_cd)
);

insert into tblpop values('秋田', 1, 'm', 400);
insert into tblpop values('秋田', 3, 'm', 1000);
insert into tblpop values('秋田', 1, 'f', 800);
insert into tblpop values('秋田', 3, 'f', 1000);
insert into tblpop values('青森', 1, 'm', 700);
insert into tblpop values('青森', 1, 'f', 500);
insert into tblpop values('青森', 3, 'f', 800);
insert into tblpop values('東京', 1, 'm', 900);
insert into tblpop values('東京', 1, 'f', 1500);
insert into tblpop values('東京', 3, 'f', 1200);
insert into tblpop values('千葉', 1, 'm', 900);
insert into tblpop values('千葉', 1, 'f', 1000);
insert into tblpop values('千葉', 3, 'f', 900);


commit;
