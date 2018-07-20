--スト6.13 統計情報の収集
exec DBMS_STATS.GATHER_TABLE_STATS(OWNNAME =>'practical_intro', TABNAME =>'departments');
exec DBMS_STATS.GATHER_TABLE_STATS(OWNNAME =>'practical_intro', TABNAME =>'employees_02');

select table_name name
       , last_analyzed
--select *
from user_tables
where table_name = 'DEPARTMENTS'
;

--リスト6.11 EXISTS述語のサンプル
set autotrace on explain
select dept_id
       , dept_name
from departments d
where exists (
  select *
  from employees_02 e
  where e.dept_id = d.dept_id
)
;

--リスト6.12 NOT EXISTS述語のサンプル
set autotrace on explain
select dept_id
       , dept_name
from departments d
where not exists (
  select *
  from employees_02 e
  where e.dept_id = d.dept_id
)
;
