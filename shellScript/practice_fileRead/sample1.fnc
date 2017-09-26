#--共通関数定義--
LIST=./abc.lst

#文字列取得関数
GETSTR()
{
  #引数チェック
  if [ $# -ne 1 ]
   then
     return 1
   else
     ID=$1
  fi

  #IDより文字列を探す
  while read F1 F2
  do
    if [ "${F1}" = "${ID}" ]
    then
      echo ${F2}
      break
    fi
  done < ${LIST}
}
