#! /bin/bash


for I in $(python -c 'print(" ".join([str(i) for i in range(10)]))') ; do
    echo $I
done