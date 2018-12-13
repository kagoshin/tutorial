#!/usr/bin/env python3
import logging
from pprint import pprint
from sys import stdout as STDOUT

# Example 1
print('ex1----------')
handle = open('random_data.txt', 'w', encoding='utf-8')
handle.write('success\nand\nnew\nlines')
handle.close()

handle = open('random_data.txt')
try:
    data = handle.read()
finally:
    handle.close()
print(data)

# Example 2
import json
def load_json_key(data, key):
    try:
        result_dict = json.loads(data)
    except ValueError as e:
        raise KeyError from e
    else:
        return result_dict[key]

# JSON decode successful
assert load_json_key('{"foo": "bar"}', 'foo') == 'bar'
try:
    load_json_key('{"foo": "bar"}', 'does not exist')
    assert False
except KeyError:
    pass
    print('expected')

# JSON decode fails
try:
    load_json_key('{"foo": bad payload', 'foo')
    assert False
except KeyError:
    pass
    print('expected')
