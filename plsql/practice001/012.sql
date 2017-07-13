DECLARE
  rank VARCHAR2(1);
  dispRank VARCHAR2(10);
BEGIN
  rank := 'B';

  case rank
  when 'A' THEN dispRank := '上級';
  when 'B' THEN dispRank := '中級';
  when 'Ç' THEN dispRank := '初級';
  else dispRank := 'その他';
  END case;

  SYS.DBMS_OUTPUT.PUT_LINE(dispRank);
END;
