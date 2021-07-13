#!/bin/bash


_mydir="$(pwd)"
BASEDIR=$(dirname "$0")

cd "$BASEDIR"
cd ..
cd ..

old="$IFS"
IFS=';'
str="'$*'"
node remove-empty-directories.js "$str"
IFS=$old

cd $_mydir