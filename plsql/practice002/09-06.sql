create or replace trigger check_sal
before update of sal on emp
for each row
  when(new.sal/old.sal <= 0.7)
begin
  raise_application_error(-20005, '既定値を超えた減給です');
end;
/
