select course_name,
       case when course_id in (
         select course_id from OpenCourses
         where month = '200706'
       ) then '○' else '×' end as "6月",
       case when course_id in (
         select course_id from OpenCourses
         where month = '200707'
       ) then '○' else '×' end as "7月",
       case when course_id in (
         select course_id from OpenCourses
         where month = '200708'
       ) then '○' else '×' end as "8月"
from CourseMaster;
