#!/bin/sh
hello() { echo "Hello, $1."; }
goodbye() {
    echo "Good Bye $1."
    echo "Good Bye $2."
}

hello taro
goodbye hanako jiro