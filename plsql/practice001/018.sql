DECLARE
  value NUMBER := 5;
  strValue VARCHAR(10) := 'ABC';
BEGIN
  IF ( value IN (1, 3, 5, 7, 9) ) THEN
    SYS.DBMS_OUTPUT.PUT_LINE('リストに含まれる');
  ELSE
    SYS.DBMS_OUTPUT.PUT_LINE('リストに含まれない');
  END IF;

  IF ( value BETWEEN 1 AND 9 ) THEN
    SYS.DBMS_OUTPUT.PUT_LINE('１〜９の範囲である');
  ELSE
    SYS.DBMS_OUTPUT.PUT_LINE('１〜９の範囲でない');
  END IF;

  IF ( strValue LIKE '%BC' ) THEN
    SYS.DBMS_OUTPUT.PUT_LINE('BCに後方一致する');
  ELSE
    SYS.DBMS_OUTPUT.PUT_LINE('BCに後方一致しない');
  END IF;

  strValue := null;
  IF ( strValue IS NULL ) THEN
    SYS.DBMS_OUTPUT.PUT_LINE('NULLである');
  ELSE
    SYS.DBMS_OUTPUT.PUT_LINE('NULLでない');
  END IF;


END;
