/**
 * 小数点以下もしくは整数部を切り上げします。
 *
 * 引数１： in_num   数値
 * 引数２： [in_digit] 小数値、負の値を指定すると整数部を切り上げします。
 * 戻り値： 切り上げした数値
 *
 * 使い方サンプル：
 *  SELECT ROUNDUP(123.456) FROM DUAL    --> 124
 *  SELECT ROUNDUP(123.456,1) FROM DUAL  --> 123.5
 *  SELECT ROUNDUP(123.456,-1) FROM DUAL --> 130
 * 作成者： saka-en, http://www.saka-en.com
 * バージョン： 1.0
 */
 create or replace function roundup (
   in_num   in number,     --数値
   in_digit in integer:=0  --少数桁
 ) return number
 is
  wk_value number;
begin
  if in_num is null then
    return null;
  end if;

  if in_num = 0 then
    return 0;
  end if;

  wk_value := nvl(10 ** in_digit, 1);
  return ceil(abs(in_num) * wk_value) / wk_value * sign(in_num);

exception
  when others then
    return null;

end roundup;
/
