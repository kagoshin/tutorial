BEGIN
  GOTO label;
    DBMS_OUTPUT.PUT_LINE('����1');
    DBMS_OUTPUT.PUT_LINE('����2');
    <<label>>
    DBMS_OUTPUT.PUT_LINE('���x������');
END;
/