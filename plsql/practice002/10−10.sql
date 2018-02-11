create global temporary table temp1
  (col1 NUMBER(3),
   col2 VARCHAR2(10))
  --ON COMMIT PRESERVE ROWS
  ON COMMIT DELETE ROWS
;

insert into temp1 values(10, 'Part1');

insert into temp1 values(20, 'Part2');

select * from temp1;

commit;

select * from temp1;

drop table temp1;
