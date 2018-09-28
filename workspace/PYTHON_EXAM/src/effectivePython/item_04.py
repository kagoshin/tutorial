#!/usr/bin/env python3

# Preamble to mimick book environment
import logging
from pprint import pprint
from sys import stdout as STDOUT

# Example 1
print('ex1----------')
from urllib.parse import parse_qs
my_values = parse_qs('red=5&blue=0&green=',
                    keep_blank_values=True)
print(repr(my_values))

# Example 2
print('ex2----------')
print('Red:     ', my_values.get('red'))
print('Green:   ', my_values.get('green'))
print('Opacity: ', my_values.get('opacity'))

# Example 3
# For query string 'red=5&blue=0&green='
print('ex3----------')
'''
- getメソッドの振る舞いは、辞書にキーが存在しなけば、第2引数を返す
- or and
→https://qiita.com/keisuke-nakata/items/e0598b2c13807f102469
'''
red = my_values.get('red', [''])[0] or 0
green = my_values.get('green', [''])[0] or 0
opacity = my_values.get('opacity', [''])[0] or 0
print('Red:     %r' % red)
print('Green:   %r' % green)
print('Opacity: %r' % opacity)

# Example 4
print('ex4----------')
red = int(my_values.get('red', [''])[0] or 0)
green = int(my_values.get('green', [''])[0] or 0)
opacity = int(my_values.get('opacity', [''])[0] or 0)
print('Red:     %r' % red)
print('Green:   %r' % green)
print('Opacity: %r' % opacity)

# Example 5
print('ex5----------')
red = my_values.get('red', [''])
red = int(red[0]) if red[0] else 0
print('Red:     %r' % red)

# Example 6
print('ex6----------')
green = my_values.get('green', [''])
if green[0]:
    green = int(green[0])
else:
    green = 0
print('Green:   %r' % green)

# Example 7,8
print('ex7,8----------')
def get_first_int(values, key, default=0):
    found = values.get(key, [''])
    if found[0]:
        found = int(found[0])
    else:
        found = default
    return found

green = get_first_int(my_values, 'green')
print('Green:   %r' % green)
