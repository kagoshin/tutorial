#!/bin/sh
case $1 in
    start | s) echo "server-start" ;;
    stop | e) echo "server-stop" ;;
    restart | r) echo "server-stop"
            echo "server-start" ;;
    *) echo "Usage: server {start|stop|restart}"
esac