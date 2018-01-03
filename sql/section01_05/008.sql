merge into Class_A02 a
    using (select * from Class_B02) b
    on (a.id = b.id)
    when matched then
      update set a.name = b.name
    when not matched then
      insert (id, name) values (b.id, b.name);
