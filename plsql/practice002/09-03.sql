create or replace trigger modify_emp
after insert or update or delete on emp
for each row
begin
  if inserting then
    insert into audit_table values('EMP', 'INSERT', :new.empno);
  elsif deleting then
    insert into audit_table values('EMP', 'DELETE', :old.empno);
  elsif updating then
    insert into audit_table values('EMP', 'UPDATE', :old.empno);
  end if;
end;
/
