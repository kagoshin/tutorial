#!/bin/sh
PS3="番号で選択して下さい。"
select fruit in apple orange banana grape exit
do
    case $fruit in
        apple|orange|banana|grape)
            echo "$fruitが選択されました。"
            ;;
        exit)
            break
            ;;
        *)
            echo "1から4の番号で選択してください。"
            ;;
    esac
done