#!/bin/bash
FN=$1
for n in `uniq $FN`; do
   ssh $n "cd $PBS_O_WORKDIR; /home/jmbeals/node-tree.sh $FN" >> quiz5.output
done;
