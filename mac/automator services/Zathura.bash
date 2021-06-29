#!/bin/bash

### This script is used with platypus/automator to run zathura ###
for i in "$@"; do
    /opt/homebrew/bin/zathura "$i"&
done
