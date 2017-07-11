#!/bin/bash
TARGET_FILE="~/workspace/shellScript/ssWorkShop/script_test.txt"
echo -n "Can I make \"$TARGET_FILE\" file? : "
read answer
if [ "$answer" = "yes" ]
then
touch $TARGET_FILE
fi