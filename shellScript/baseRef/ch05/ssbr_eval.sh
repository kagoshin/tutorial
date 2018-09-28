#!/bin/bash

day0=sun day1=mon day2=tue day3=wed
day4=thu day5=fri day6=sat

today=day3

# １回目：$today→day3
# 2回目：$day3
#eval echo \"\$$today\"
#eval echo \$$today
eval echo '$'$today
