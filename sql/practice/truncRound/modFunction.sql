-- https://www.shift-the-oracle.com/sql/functions/trunc.html

create or replace function trunc_mod(
  p_num   in number,
  p_place in integer:=0
) return number
is
begin
  return mod(p_num, 10 ** p_place);
end trunc_mod;
/

select trunc_mod(12345.123, 1) from dual;
