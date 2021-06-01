#!/bin/bash

JOBID=$1
INT=$2
LINES=$((`qstat -e $1 | wc -l`))

if $LINES=1; then echo "Job is complete."; else sleep $2

i=1;
for node in `cat $1`; do              # go through each line of PBS_NODEFILE
   if [ "$node" == `hostname` ]; then # if line contains the hostname of the
      sort piece.$i > piece.$i.sorted &
         fi;                                # a background process
   i=$(($i+1));
done;
