-- テーブルのマッチング：IN述語の利用
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


-- テーブルのマッチング：EXISTS述語の利用
select course_name,
       case
         when exists (
                  select course_id from OpenCourses oc
                  where month = '200706'
                  and oc.course_id = cm.course_id )
          then '○'
          else '×'
          end as "6月"
       case
         when exists (
                  select course_id from OpenCourses oc
                  where month = '200707'
                  and oc.course_id = cm.course_id )
          then '○'
          else '×'
          end as "7月"
       case
         when exists (
                  select course_id from OpenCourses oc
                  where month = '200708'
                  and oc.course_id = cm.course_id )
          then '○'
          else '×'
          end as "8月"
from CourseMaster cm;
