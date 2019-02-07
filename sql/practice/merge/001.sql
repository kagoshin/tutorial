merge into m_dest dest
  using m_src src
  on (dest.id = src.id)
  when matched then
    update set dest.name = src.name
               , dest.age = src.age
  when not matched then
    insert (id, name, age) values (src.id, src.name, src.age)
;

rollback;

merge into m_dest dest
  using (
    select *
    from m_src
    where id = '002'
  ) src
  on (dest.id = src.id)
  when matched then
    update set
      dest.name = src.name
      , dest.age = src.age
  when not matched then
    insert (id, name, age)
      values (src.id, src.name, src.age)
;

rollback;

merge into m_dest dest
  using (
    select '004' as id
           , 'ウェンディ' as name
           , '25' as age
    from dual
  ) src
  on (dest.id = src.id)
  when matched then
    update set
      dest.name = src.name
      , dest.age = src.age
  when not matched then
    insert (id, name, age)
      values (src.id, src.name, src.age)
;

rollback;
