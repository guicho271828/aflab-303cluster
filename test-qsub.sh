#!/bin/bash

for host in $(cat $(dirname $0)/hosts | sed -e "s/#.*//g")
do
    for i in $(seq 0 7)
    do
        echo "sleep 3; hostname" | qsub -l walltime=30,host=$host -o $host.$i.o -e $host.$i.e -
    done
done
