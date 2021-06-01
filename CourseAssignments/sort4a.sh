#!/bin/bash

FN=$1;
PC=48;
LCNT=`cat $FN | wc -l`;
PC_SIZE=$(($LCNT/$PC));
LEFTOVER=$(($LCNT%$PC));

for ((i=1; i<=$PC; i++)); do
   head -$(($PC_SIZE*$i)) $FN | tail -$PC_SIZE > piece.$i;
   sort piece.$i > piece.$i.sorted &
   pids[$i]=$!;
done;

tail -$LEFTOVER $FN >piece.$i
sort piece.$i > piece.$i.sorted &
pids[$i]=$!;

for ((i=1; i<=$(($PC+1)); i++)); do
    wait ${pids[$i]};
done
