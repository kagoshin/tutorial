#!/usr/bin/env python3

import logging
from pprint import pprint
from sys import stdout as STDOUT

# Example 1
print('ex1----------')
names = ['Cecilia', 'Lise', 'Marie']
letters = [len(n) for n in names]
print(letters)

# Example 2
print('ex2----------')
lengest_name = None
max_letters = 0

for i in range(len(names)):
    count = letters[i]
    if count > max_letters:
        longest_name = names[i]
        max_letters = count

print (longest_name)

# Example 3
print('ex3----------')
lengest_name = None
max_letters = 0
for i, name in enumerate(names):
    count = letters[i]
    if count > max_letters:
        longest_name = name
        max_letters = count
print(longest_name)

# Example 4
print('ex4----------')
lengest_name = None
max_letters = 0
for name, count in zip(names, letters):
    if count > max_letters:
        longest_name = name
        max_letters = count
print(longest_name)

# ref: zip_longest関数
# Example 5
print('ex5----------')
names.append('Rosalind')
for name, count in zip(names, letters):
    print(name)
