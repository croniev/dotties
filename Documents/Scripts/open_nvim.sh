#!/bin/bash

PATH=$(dirname $1)
/usr/bin/kitty nvim -c "cd $PATH" $1
