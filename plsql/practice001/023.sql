DECLARE

BEGIN
<<loop_1>>
FOR i in 1..3 LOOP

  <<loop_2>>
  FOR j in 1..3 LOOP

    <<loop_3>>
    FOR k in 1..3 LOOP
      SYS.DBMS_OUTPUT.PUT_LINE('i=' || i || 'j=' || j || 'k=' || k );

      CONTINUE loop_2 when (j = 2);

      IF (j = 3) THEN
        CONTINUE loop_1;
      END IF;

      EXIT loop_3 when (i = 3);

      IF (i = 3) THEN
        EXIT loop_2;
      END IF;

    END LOOP; --loop3
  END LOOP; --loop2
END LOOP; --loop1
END;
