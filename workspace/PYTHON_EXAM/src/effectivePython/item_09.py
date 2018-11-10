#!/usr/bin/env python3
import logging
from pprint import pprint
from sys import stdout as STDOUT

# Example 1
print('ex1----------')
import random
with open('my_file.txt', 'w') as f:
    for _ in range(10):
        f.write('a' * random.randint(0, 100))
        f.write('\n')

value = [len(x) for x in open('my_file.txt')]
print(value)

# Example 2
print('ex2----------')
it = (len(x) for x in open ('my_file.txt'))
print(it)

# Example 3
print('ex3----------')
print(next(it))
print(next(it))

# Example 4
print('ex4----------')
roots = ((x, x**0.5) for x in it)

# Example 5
print('ex5----------')
print(next(roots))
