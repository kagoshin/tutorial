DECLARE
    TYPE ary_type IS TABLE OF VARCHAR2(1) INDEX BY VARCHAR2(1);
    ary ary_type;
    result BOOLEAN;
BEGIN
    ary('A') := 'a';
    ary('B') := 'b';
    ary('C') := 'c';
    ary('E') := 'e';
    ary('D') := 'd';

    IF (ary.exists('D')) THEN
        SYS.DBMS_OUTPUT.PUT_LINE('true');
    ELSE
        SYS.DBMS_OUTPUT.PUT_LINE('false');
    END IF;
    
    SYS.DBMS_OUTPUT.PUT_LINE(ary.count);
    SYS.DBMS_OUTPUT.PUT_LINE(ary.first);
    SYS.DBMS_OUTPUT.PUT_LINE(ary.last);
    SYS.DBMS_OUTPUT.PUT_LINE(ary.prior('B'));
    SYS.DBMS_OUTPUT.PUT_LINE(ary.next('D'));
    
    ary.delete('B');
    SYS.DBMS_OUTPUT.PUT_LINE(ary.count);
    
    ary.delete;
    SYS.DBMS_OUTPUT.PUT_LINE(ary.count);
END;