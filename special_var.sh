#!/bin/bash

echo "Script Name: $0";echo
echo "Number of arguments: $#";echo
echo "All arguments as a single string: $*";echo
echo "All arguments as separate strings: $@";echo

echo "First argument: $1";echo
echo "Second argument: $2";echo
echo "Third argument: $3";echo

# ls -l
echo "Exit status of ls -l command: $?"; echo

for cmd in "$*";do
    echo "command: $cmd"
done

for cmd in "$@";do
    echo "command: $cmd"
done

