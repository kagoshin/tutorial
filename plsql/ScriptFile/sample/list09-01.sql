CREATE OR REPLACE TRIGGER emp_nomod
BEFORE INSERT OR DELETE OR UPDATE ON emp
BEGIN
  IF (TO_CHAR(SYSDATE,'DY') = '��') THEN
    IF DELETING THEN
      raise_application_error
        (-20325,'���j���ɍ폜�͍s���܂���B');
    ELSIF INSERTING THEN
      raise_application_error
        (-20326,'���j���ɓ��͍͂s���܂���B');
    ELSIF UPDATING THEN
      raise_application_error
        (-20327,'���j���ɕύX�͍s���܂���B');
    ELSE
      raise_application_error
        (-20328,'���j����EMP�\�ւ̕ύX�͂ł��܂���B');
    END IF;
  ELSE NULL;
  END IF;
END;
/