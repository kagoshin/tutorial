import logging
from pprint import pprint
from sys import stdout as STDOUT

# Example 1
print('ex1----------')
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
squares = [x**2 for x in a]
print(squares)

# Example 2
print('ex2----------')
squares = map(lambda x: x ** 2, a)
print(list(squares))

print('ex2.2----------')
def square(num):
    return num**2
squares = map(square, a)
print(list(squares))

# Example 3
print('ex3----------')
even_squares = [x**2 for x in a if x % 2 == 0]
print(even_squares)

# Example 4

# Example 5
