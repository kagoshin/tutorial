BEGIN
  GOTO label;
    DBMS_OUTPUT.PUT_LINE('処理1');
    DBMS_OUTPUT.PUT_LINE('処理2');
    <<label>>
    DBMS_OUTPUT.PUT_LINE('ラベル処理');
END;
/