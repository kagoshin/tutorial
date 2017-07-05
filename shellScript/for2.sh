#!/bin/sh
<<comment
for i in {1..10}
do
	echo " loop No: $i."
done


for i in {1..10}
do
  echo "loop No: $i"
done



echo
comment
for ((i=0 ; i<10 ; i++))
do
  echo "loop2 No: $i"
done
