#!/bin/bash

while [ $# -gt 0 ]; do
  cp -p "$1" "$1".bak
  shift
done
