create table Students02 (
  student_id number(3),
  dpt varchar2(10),
  sbmt_date date,
  primary key(student_id)
)

insert into Students02 values(100, '理学部', to_date('2005/10/10'));
insert into Students02 values(101, '理学部', to_date('2005/09/22'));
insert into Students02 values(102, '文学部', null);
insert into Students02 values(103, '文学部', to_date('2005/09/10'));
insert into Students02 values(200, '文学部', to_date('2005/09/22'));
insert into Students02 values(201, '工学部', null);
insert into Students02 values(202, '経済学部', to_date('2005/09/25'));
