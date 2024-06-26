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

# Example 3
print('ex3----------')
import json
UNDEFINED = object()

def devide_json(path):
    handle = open(path, 'r+')
    try:
        data = handle.read()
        op = json.loads(data)
        value = (
            op['numerator'] /
            op['denominator']
        )
    except ZeroDivisionError as e:
        return UNDEFINED
    else:
        op['result'] = value
        result = json.dumps(op)
        handle.seek(0)
        handle.write(result)
        return value
    finally:
        handle.close()

# Everything works
temp_path = 'random_data.json'
handle = open(temp_path, 'w')
handle.write('{"numerator": 1, "denominator": 10}')
handle.close()
assert devide_json(temp_path) == 0.1

# Divide by Zero error
handle = open(temp_path, 'w')
handle.write('{"numerator": 1, "denominator": 0}')
handle.close()
assert devide_json(temp_path) is UNDEFINED

# JSON decode error
handle = open(temp_path, 'w')
handle.write('{"numerator": 1 bad data')
handle.close()
try:
    devide_json(temp_path)
    assert False
except ValueError:
    pass # Expected
