#!/bin/bash

#generate test pdfs

NUMS="\
020051 \
020080" 

function aa {
    echo "number: $1"
}

for p in $NUMS ; do
    aa $p |  enscript  -o - | ps2pdf - $p.pdf
done

echo "$NUMS"

