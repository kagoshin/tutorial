import logging
from pprint import pprint
from sys import stdout as STDOUT

# Example 1
print('ex1----------')
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
flat = [x for row in matrix for x in row]
print(flat)

# Example 2
print('ex2----------')
squared = [[x**2 for x in row] for row in matrix]
print(squared)

# Example 3
print('ex3----------')
my_lists = [
    [[1, 2, 3], [4, 5, 6]],
    [[7, 8, 9], [10, 11, 12]],
]
flat = [x for sublist1 in my_lists
        for sublist2 in sublist1
        for x in sublist2]
print(flat)

# Example 4
print('ex4----------')
flat = []
for sublist1 in my_lists:
    for sublist2 in sublist1:
        flat.extend(sublist2)
print(flat)

# Example 5

# Example 6
