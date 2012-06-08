#!/bin/bash

FILES=$(ls *jpg)
for file in $FILES; do
echo $file
BASE=$(echo $file | sed 's/.jpg//g')
echo $BASE

echo "convert $BASE.jpg $BASE.pdf"
convert $BASE.jpg $BASE.pdf
done
