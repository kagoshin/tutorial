# Preamble to mimick book environment
import logging
from pprint import pprint
from sys import stdout as STDOUT

# Example 1
print('ex1----------')
def log(message, values):
    if not values:
        print(message)
    else:
        values_str = ', '.join(str(x) for x in values)
        print('%s: %s' % (message, values_str))

log('My numbers are', [1, 2])
log('Hi there', [])

# Example 2
print('ex2----------')
def log(message, *values):  # The only difference
    if not values:
        print(message)
    else:
        values_str = ', '.join(str(x) for x in values)
        print('%s: %s' % (message, values_str))

log('My numbers are', 1, 2)
log('Hi there')  # Much better

# Example 3
# 可変長引数が、関数に渡される前に常にタプルに変換されている
print('ex3----------')
favorites = [7, 33, 99]
log('Favorite colors', *favorites)

# Example 4
print('ex4----------')
def my_generator():
    for i in range(10):
        yield i

def my_func(*args):
    print(args)

it = my_generator()
my_func(*it)

# Example 5
print('ex5----------')
def log(sequence, message, *values):
    if not values:
        print('%s: %s' % (sequence, message))
    else:
        values_str = ', '.join(str(x) for x in values)
        print('%s: %s: %s' % (sequence, message, values_str))

log(1, 'favorites', 7, 33)       # New usage is OK
log('Favorites numbers', 7, 33)  # Old usage breaks
