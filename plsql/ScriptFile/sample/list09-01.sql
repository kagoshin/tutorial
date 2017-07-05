CREATE OR REPLACE TRIGGER emp_nomod
BEFORE INSERT OR DELETE OR UPDATE ON emp
BEGIN
  IF (TO_CHAR(SYSDATE,'DY') = '日') THEN
    IF DELETING THEN
      raise_application_error
        (-20325,'日曜日に削除は行えません。');
    ELSIF INSERTING THEN
      raise_application_error
        (-20326,'日曜日に入力は行えません。');
    ELSIF UPDATING THEN
      raise_application_error
        (-20327,'日曜日に変更は行えません。');
    ELSE
      raise_application_error
        (-20328,'日曜日にEMP表への変更はできません。');
    END IF;
  ELSE NULL;
  END IF;
END;
/