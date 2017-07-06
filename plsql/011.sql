DECLARE
  rank VARCHAR2(1);
  disprank VARCHAR2(10);
BEGIN
  rank := 'B';

  IF ( rank = 'A' ) THEN
    disprank := '上級';
  ELSIF ( rank = 'B' ) THEN
    disprank := '中級';
  ELSIF ( rank = 'C' ) THEN
    disprank := '初級';
  ELSIF ( rank IS NULL ) THEN
    disprank := '未設定';
  ELSE
    disprank := 'その他';
  END IF;

  SYS.DBMS_OUTPUT.PUT_LINE(disprank);
END;
