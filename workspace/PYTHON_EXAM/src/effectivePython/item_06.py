import logging
from pprint import pprint
from sys import stdout as STDOUT

# Example 1
print('ex1----------')
a = ['red', 'orange', 'yellow', 'green', 'blue', 'purple']
odds = a[::2]
evens = a[1::2]
print(odds)
print(evens)

# Example 2
print('ex2----------')
x = b'mongoose'
y = x[::-1]
# print(x)
print(y)

# Example 3
print('ex3----------')
try:
    w = '謝謝'
    x = w.encode('utf-8')
    y = x[::-1]
    z = y.decode('utf-8')
except:
    logging.exception('Expected')
else:
    assert False

# Example 4
print('ex4----------')
a = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
print(a[::2])  # ['a', 'c', 'e', 'g']
print(a[::-2]) # ['h', 'f', 'd', 'b']

# Example 5

# Example 6
