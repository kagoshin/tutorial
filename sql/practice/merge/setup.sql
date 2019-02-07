create table m_src (
  id varchar2(3) primary key,
  name varchar2(15),
  age number(3)
);

create table m_dest (
  id varchar2(3) primary key,
  name varchar2(15),
  age number(3)
);

insert into m_src values ('002', 'ゴードン', 25);
insert into m_src values ('003', 'ウィリアム', 30);

insert into m_dest values ('001', 'トーマス', 10);
insert into m_dest values ('002', 'ゴードン', 20);

commit;
