#!/bin/sh
DEFAULT_SETUP="/home/ubuntu/workspace/shellScript/ssWorkShop/sample"
USER_SETUP="${HOME}/.sample"

if [ -f $USER_SETUP ]
then
    . $USER_SETUP
else
    . $DEFAULT_SETUP
fi