DECLARE
  rank VARCHAR2(1);
  dispRank VARCHAR2(10);
BEGIN
  rank := null;

  CASE
  WHEN rank = 'A' THEN dispRank := '上級';
  WHEN rank = 'B' THEN dispRank := '中級';
  WHEN rank = 'C' THEN dispRank := '初級';
  WHEN rank IS NULL THEN dispRank := '未設定';
  ELSE dispRank := 'その他';
  END CASE;

  SYS.DBMS_OUTPUT.PUT_LINE(dispRank);
END;
