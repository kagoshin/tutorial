#!/usr/bin/env python3

import logging
from pprint import pprint
from sys import stdout as STDOUT

# Example 1
a = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
print('First four:', a[:4])
print('Last four:', a[-4:])
print('Middle two:', a[3:-3])

# Example 2
print('ex2----------')
assert a[:5] == a[0:5]

# Example 3
print('ex3----------')
assert a[5:] == a[5:len(a)]

# Example 4
print('ex4----------')
print(a[:5])    # ['a', 'b', 'c', 'd', 'e']
print(a[:-1])   # ['a', 'b', 'c', 'd', 'e', 'f', 'g']
print(a[4:])    #                     ['e', 'f', 'g', 'h']
print(a[-3:])   #                          ['f', 'g', 'h']
print(a[2:5])   #           ['c', 'd', 'e']
print(a[2:-1])  #           ['c', 'd', 'e', 'f', 'g']
print(a[-3:-1]) #                          ['f', 'g']


# Example 6
print('ex6----------')
first_twenty_item = a[:20]
last_twenty_item = a[-20:]

# Example 7
print('ex7----------')
try:
    a[20]
except:
    logging.exception('Expected')
else:
    assert False

# Example 8
print('ex8----------')
b = a[4:]
print('Before   ', b)
b[1] = 99
print('After    ', b)
print('No change', a)

# Example 9

# Example 10

# Example 11
