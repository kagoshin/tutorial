create table CourseMaster
(
  course_id varchar2(1) ,
  course_name varchar2(20),
  primary key(course_id)
)

create table OpenCourses
(
  month number(6) ,
  course_id varchar2(1),
  primary key(month, course_id)
)

insert into CourseMaster(course_id, course_name) values ('1', '経理入門');
insert into CourseMaster(course_id, course_name) values ('2', '財務知識');
insert into CourseMaster(course_id, course_name) values ('3', '簿記検定');
insert into CourseMaster(course_id, course_name) values ('4', '税理士');

insert into OpenCourses(month, course_id) values (200706, '1');
insert into OpenCourses(month, course_id) values (200706, '3');
insert into OpenCourses(month, course_id) values (200706, '4');
insert into OpenCourses(month, course_id) values (200707, '4');
insert into OpenCourses(month, course_id) values (200708, '2');
insert into OpenCourses(month, course_id) values (200708, '4');
