create or replace trigger emp_nomod
before insert or delete or update on emp
begin
  if (to_char(sysdate, 'DY') = '日') then
    if deleting then
      raise_application_error(-20325, '日曜日に削除は行えません');
    elsif inserting then
      raise_application_error(-20326, '日曜日に入力は行えません');
    elsif updating then
      raise_application_error(-20327, '日曜日に変更は行えません');
    else
      raise_application_error(-20328, '日曜日にEMP表への変更は行えません');
    end if;
  else null;
  end if;
end;
/
