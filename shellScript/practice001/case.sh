#!/bin/sh
fruit="grape"
case $fruit in
  apple)
    echo "apple"
    ;;
  orange)
    echo "orange"
    ;;
  banana | grape)
    echo "banana or grape"
    ;;
  *)
    echo "none"
    ;;
esac
