#!/usr/bin/env python3

import logging
from pprint import pprint
from sys import stdout as STDOUT

# Example 1
# ref: http://www.tohoho-web.com/python/operators.html
print('ex1----------')
from random import randint
random_bits = 0
for i in range(64):
    if randint(0, 1):
        random_bits |= 1 << i
print(bin(random_bits))


# Example 2
# ref: https://qiita.com/tomotaka_ito/items/594ee1396cf982ba9887
print('ex2----------')
flavor_list = ['vanilla', 'chocolate', 'pecan', 'strawberry']
for flavor in flavor_list:
    print('%s is delicious' % flavor)

# Example 3
print('ex3----------')
for i in range(len(flavor_list)):
    flavor = flavor_list[i]
    print('%d: %s' % (i + 1, flavor))

# Example 4
print('ex4----------')
for i, flavor in enumerate(flavor_list):
    print('%d: %s' % (i + 1, flavor))

# Example 5
print('ex5----------')
for i, flavor in enumerate(flavor_list, 1):
    print('%d: %s' % (i, flavor))
